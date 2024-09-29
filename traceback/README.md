
# Tracebacks

Today, I got a kernel warning that looked something like the following:

```
49.689096] WARNING: CPU: 12 PID: 91 at kernel/sched/fair.c:5493 dequeue_entity+0x3e3/0x560
49.689101] Modules linked in: xt_statistic ip6table_filter ip6table_nat ip6table_mangle ip6_tables xt_mark xt_comment iptable_mangle rfcomm ib_iser rdma_cm iw_cm ib_cm ib_core iscsi_tcp libiscsi tep libiscsi scsi_transport_iscsi configfs autofs4 fuse nf_tables veth xt_nat xt_conntrack xt_MASQUERADE nf_conntrack_netlink nfnetlink iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 xt_addrtype iptable_filter ip_tables br_netfilter bridge overlay rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_ resolver 8021q garp
mrp stp lle cmac bnep vfat fat ext4 mbcache jbd2 vboxnetadp(OE) amd_atl intel_rapl_msr vboxnetflt(OE) intel_rapl_common vboxdrv (0E) v412loopback (OE) amdgpu nfs lockd grace amdxcp mfd_core drm_exec sunrpc gpu_sched drm_buddy edac_m ce_amd snd_hda_codec_realtek i2c_algo_bit drm_suballoc_helper iwlmvm snd_hda_codec_generic drm_ttm_helper netfs kvm_amd ttm snd_hda_scodec_component snd_hda_codec_hdmi ee1004 wmi_bmof uvcvideo nbd drm_display_helper uvc mac80211 snd_hda_intel videobu
49.689160] videobuf2_memops drm_kms_helper kvm snd_intel_sdw_acpi videobuf2_v412 libarc4 snd_usb_audio snd_hda_codec lm92 videobuf2_common btusb crcti@dif_pclmul snd_usbmidi_lib iwlwifi ghash_clmulni_intel btrtl drm snd_hda_core snd_rawmidi vide odev sha512_ssse3 btintel snd_hwdep snd_seq_device snd_pcm btbcm sp5100_tco rapl hid_logitech_hidpp pcspkr efi_pstore video snd_timer i2c_piix4 mc 12c_smbus backlight snd bluetooth cfg80211 k16temp ccp soundcore 12c_core joydev rfkill cdc_acm gpio_am dpt
gpio_generic mac_hid wmi efivarfs dm_crypt trusted asn1_encoder dm_mod ipv6 crc_ccitt hid_logitech_dj sd_mod r8169 realtek xhci_pci mdio_devres nvme crc32_pclmul ahci libphy xhci_hcd nvme_core Libahci btrfs blake2b_generic xor raide pq Liberc32c WOE 6.11.0-next-20240927-x86_64 #1
f2_vmalloc snd_intel_dspcfg
crc32c_intel
49.689216] CPU: 12 UID: 0 PID: 91 Comm: migration/12 Kdump: loaded Tainted: 6 49.689220]
Tainted: [W] WARN, [0]=OOT_MODULE, [E]=UNSIGNED MODULE 49.689221] Hardware name: Micro-Star International Co., Ltd. MS-7C91/MAG B550 TOMAHAWK MAX WIFI (MS-7C91), BIOS 2.60 10/10/2023
49.689222] Stopper: 0x0 <- 0x0
49.689224] RIP: 0010:dequeue_entity+0x3e3/0x560
49.689227] Code: 00 of 84 ac fd ff ff 30 3d 27 88 96 01 00 of 85 9f fd ff ff 48 c7 c7 64 5d 4a 82 88 64 24 c6 05 10 88 96 01 01 e8 9d 6d fa ff <ef> ob of b6 04 24 e9 7e fd ff ff 80 3d fa 87 96 01 00 of 85 47 fc
49.689229] RSP: 0018:ffffc90000467bf8 EFLAGS: 00010086 49.689231] RAX: 0000000000000000 RBX: ffff888135896c00 RCX: 0000000000000027
49.689232] RDX: ffff8887fee21908 RSI: 0000000000000001 RDI: ffff8887fee21900
49.689233] RBP: ffff8881ada4e000 R08: 0000000000000000 R09: 0000000000000003
49.689235] R10: ffffc90000467a98 R11: ffffffff82940308 R12: 0000000000000009 49.689236] R13: 0000000000000001 R14: 0000000000000000 R15: ffff888135896c00 49.689237] FS: 0000000000000000(0000) GS:ffff8887fee00000(0000) knl6s:0000000000000000
49.689239] CS: 0010 DS: 0000 ES: 0000 CRO: 0000000080050033 49.689246] CR2: 00007ff6d1683000 CR3: 0000000281712000 CR4: 0000000000750efe
49.689242] PKRU: 55555554
49.689243] Call Trace:
49.689244] <TASK>
49.689246  ? _warn+0x89/0x130
49.689248] ? dequeue_entity+0x3e3/0x560
49.689251
49.6892541 ? report_bug+0x164/6x190
           ? handle_bug+0x58/0x90
49.689257  ? exc_invalid_op+0x17/0x70 49.689259 ? asm_exc_invalid_op+0x1a/0x20
49.689263] ? dequeue_entity+0x3e3/0x560 49.689266 ? dequeue_entity+0x3e3/0x560
49.689269] dequeue_entities+0x105/6x540 49.689272] dequeue_task_fair+0x49/0x280
49.689275] sched_balance_rq+0x6c6/0xf10 49.689281] sched_balance_newidle+0x1c9/0x410
49.689284] ? _pfx_smpboot_thread_fn+0x10/0x10 49.689287] balance_fair+0x25/0x40
I
49.689289] _ schedule+0x534/0xbd0
49.689293] ? _pfx_smpboot_thread_fn+0x10/0x10 schedule+0x27/0xf0
49.689295]
49.6892971
           smpboot_thread_fn+0x14c/0x1d0 kthread+0xd2/6x100
49.689306] ? _pfx_kthread+0x10/0x10
49.689306]
ret_from_fork+0x34/0x50
</TASK>
49.689310 ? _pfx_kthread+0x10/0x10 
49.689312 ret_from_fork_asm+0x1a/0x30
49.689318]
49.689319]--[end trace 0000000000000000]---
```

The stacktrace is not formatted quite like how you would typically see a kernel stacktrace, because these warnings caused my whole system to freeze, and prior to the freeze, I would see this traceback without any way to get it in text form. So I took a picture on my phone and used a tool to convert the picture to text.

Some time later, I'll look into attaching another device to my computer so that I can have a serial connection and I can get the stacktrace over the serial cable.  or perhaps to set up a backup-kernel to kexec into whenever my system panics, so that I can extract a core dump.

For now, I'll work with the above stacktrace.

The first problem we have is that this stacktrace uses memory references rather than line numbers.
