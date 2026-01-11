Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E596D2502D
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Jan 2026 03:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URTqGBs2J/bsEyV8Z9V9m0gmilOIfXua7VFji2to30k=; b=JHFFp1PmzCNsEPcDjebuJwvKBv
	NGuxVmwzKZ6v3koHxTiYsfucEQtABMVwJsxdt8oXKkORqcJGqa5Lh2x5LsYK+gwBsqspxEp0JjrbP
	LzfdJCw/yl5Zm5Vtx/4Rd0mfna1NGGaK1P7dXbVT0Ye8a6jFqsSGedKRE+NJ/gBmft8v3OPSRtGvc
	fEF6xNF7wocBxzvscVYu1fKBPwn1jSjhVrXG/9qrBqkz33ljLmS/AUlLUKVfJKXDNPWVOm2Mxbtyo
	xEIS4m1jVOanzQKxgiuj+PQB+TPmeAXqqUT0xAB/kS9i+q4t2c1wggUtxmd4lfJdc3tvfEe1IBynj
	7fFuGylA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veltu-00000003qUW-2bnk;
	Sun, 11 Jan 2026 03:13:58 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veltr-00000003qU6-2ER7
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Jan 2026 03:13:56 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b83b72508f3so877611766b.2
        for <linux-mediatek@lists.infradead.org>; Sat, 10 Jan 2026 19:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768101233; x=1768706033; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URTqGBs2J/bsEyV8Z9V9m0gmilOIfXua7VFji2to30k=;
        b=YG8E4+bLeRhGU7FJEEYHgN3pQl6MZRw1bYwNIZ7u9oKS4eZo4LF4G1RkQBd2qvAUOs
         hN4VJ2auapHSNxKNvtbcyOjosltT6is6caUcDClEIc7OJddkazRYMQEzj/dXiWfPkbMr
         UPjKCpa4wQ2Rat9YQ/V3AX85TO5cew6yZYw+V/Z2gDYG6ky0EgWewr2t3cwk4kpiiXmz
         /h6QTEsMGZwERIBiRlr1zoNb83mBF8FPERvmXE6kIhOYEX2H7LUEKyE3OSb7mY7CVw2G
         dmp3am3r58kU4whSWZ2Ow3Z3izSMr6CRANIh4Zk4W5d1KYCWzuSbgJsX4MZnR9I817NJ
         11dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768101233; x=1768706033;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=URTqGBs2J/bsEyV8Z9V9m0gmilOIfXua7VFji2to30k=;
        b=O7RTEB8uMtxVLbp2WEc7sZJR8D+STNYDASqblh3CA0WrgLitOcv8oRjsU8qxbBQmFA
         RBbcBJOhfEIi1LWWybTmPpbwaVXT2dJITdxQ6G6qXzHg4Ns+gDDHay2hMsFDP6Fk19XQ
         jQjHZ9vu1nPA1kRFMI/jPGBQhubvkscS3aa0CfiZbQTVJGov54jo3Qdm91WOWkip175s
         bxsw2OrpEdQ4w5SvgneIoTboY/sFljYViOvXBkN/VwF3y/78ryuULbSrYH9Cy3J2ks2N
         HqytsYmdVrCYNlebtU4Pb2f2Dlr9vdgwNJHkr6e/gvFaufHlkfFKAZq1xSMtudMtMtqA
         fQYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvS7BFNKvIj4HviYGV7WDiYdaImUFsb4Py9ye7q6bIjOUA4by1og/9+skHDSWKTf+6CTxeKiorNXfuiEL0hQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8a2kC4hMQmBZObFxiCDwPvbzex3l5w7h8XlwINK97z5IcI0I+
	B8ZQPslPqgP1F8L1ybKdIbOLqtIe0oje7c04BbOlSYs/9blUQpcCAa6KtiSI3uMzQ4OmtVPATYC
	nwqazq9RVNHcdN+lbY9dCky+Wgs8CSTs=
X-Gm-Gg: AY/fxX6ND7wpTB1Vm5bzNfFiKJ9eY161TmPtSAbEqtqBYfIQ1PLcNsVtVHWHrDteHiC
	70ZCZmddgamKj1v0ruqQye55TwqJj9EPKgpOzpxD7kK9wjmPyckwIF17LPYbTvLH2hkIjgmpWqf
	C5Pb+o3WglWyBV2o7hTkXgdpybPAoNyV5UrhnvKzPkm2DRRnf9d7pyW+h/y7fclmjZD1oaBAKDS
	IecGDNHyCktCxE5LHm8RkocGYr8OfzZUVWLr+30pFq0f6YA6ijRl/1fwC2tRfr0Ze5gPneJ5WBG
	K18XexWwuuhM+983XeykcGtbwQ+jm+V/xfZAucqg00+JLNujQHAP68xlWw==
X-Google-Smtp-Source: AGHT+IFboOgVfYKZx/tIQGrm7mDZxFPhl6MsN9SdKhDjzy0fNaRKv3TIFm9Y7NKeJLf85+6B8DUzS3tqdAT0hlUfyow=
X-Received: by 2002:a17:907:948e:b0:b73:8f33:eed3 with SMTP id
 a640c23a62f3a-b844521983fmr1380024766b.26.1768101232665; Sat, 10 Jan 2026
 19:13:52 -0800 (PST)
MIME-Version: 1.0
References: <20260102200524.290779-1-zbowling@gmail.com> <20260105002638.668723-1-zbowling@gmail.com>
 <20260105002638.668723-18-zbowling@gmail.com>
In-Reply-To: <20260105002638.668723-18-zbowling@gmail.com>
From: Zac Bowling <zbowling@gmail.com>
Date: Sat, 10 Jan 2026 19:13:41 -0800
X-Gm-Features: AZwV_QgDUbR5M3y2clEVnmxycnbvXlL7ZtwRrL1D2-5NQcqQ6YDCrwGWMqHd5Gg
Message-ID: <CAOFcj8Tf5FhnQVPZg=v5bB3AWR67R+OafYD7b8s1S2e9JfhHrg@mail.gmail.com>
Subject: Re: [PATCH 17/17] wifi: mt76: mt7925: add NULL checks in link station
 and TX queue setup
To: zbowling@gmail.com
Cc: deren.wu@mediatek.com, kvalo@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	lorenzo@kernel.org, nbd@nbd.name, ryder.lee@mediatek.com, 
	sean.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_191355_686285_07D166D8 
X-CRM114-Status: GOOD (  22.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi folks,

Any chance you had time to review? I got a new laptop courtesy the folks at
Framework to keep debugging this that also has this same wifi chip, and it
didn't take long to reproduce this issue on an unpatched kernel that these
patches would fix.

Not even 5 minutes after boot this new laptop with a fresh arch install, an=
d it
crashed.

Patch 1 is the direct fix. Patch 2 prevents the underlying race
condition in this
specific crash.

Dump from this machine. My second patch in this series would stop this
particular race and null deref during MLO roaming.

Jan 10 18:38:57 zcache kernel: wlan0: RX ReassocResp from
d8:b3:70:f8:9e:7b (capab=3D0x1111 status=3D30 aid=3D0)
Jan 10 18:38:57 zcache kernel: wlan0: d8:b3:70:f8:9e:7b rejected
association temporarily; comeback duration 895 TU (916 ms)
Jan 10 18:38:57 zcache kernel: wlan0: RX ReassocResp from
d8:b3:70:f8:9e:7b (capab=3D0x1111 status=3D30 aid=3D0)
Jan 10 18:38:57 zcache kernel: wlan0: d8:b3:70:f8:9e:7b rejected
association temporarily; comeback duration 794 TU (813 ms)
Jan 10 18:38:57 zcache kernel: wlan0: association with
d8:b3:70:f8:9e:7b timed out
Jan 10 18:39:01 zcache kernel: mt7925e 0000:bf:00.0: Message 00020002
(seq 11) timeout
Jan 10 18:39:07 zcache kernel: mt7925e 0000:bf:00.0: Message 00020003
(seq 12) timeout
Jan 10 18:39:10 zcache kernel: mt7925e 0000:bf:00.0: Message 00020002
(seq 13) timeout
Jan 10 18:39:13 zcache kernel: mt7925e 0000:bf:00.0: Message 00020002
(seq 14) timeout
Jan 10 18:39:16 zcache kernel: mt7925e 0000:bf:00.0: Message 00020001
(seq 15) timeout
Jan 10 18:39:16 zcache kernel: mt7925e 0000:bf:00.0: HW/SW Version:
0x8a108a10, Build Time: 20251015212927a
Jan 10 18:39:16 zcache kernel: mt7925e 0000:bf:00.0: WM Firmware
Version: ____000000, Build Time: 20251015213023
Jan 10 18:39:17 zcache kernel: BUG: kernel NULL pointer dereference,
address: 0000000000000000
Jan 10 18:39:17 zcache kernel: #PF: supervisor read access in kernel mode
Jan 10 18:39:17 zcache kernel: #PF: error_code(0x0000) - not-present page
Jan 10 18:39:17 zcache kernel: PGD 0 P4D 0
Jan 10 18:39:17 zcache kernel: Oops: Oops: 0000 [#1] SMP NOPTI
Jan 10 18:39:17 zcache kernel: CPU: 0 UID: 0 PID: 42446 Comm:
kworker/u96:0 Tainted: G           O        6.18.4-2-cachyos #1
PREEMPT(full)  b0274bd1b2c7bedbf3a9a6159178cc392f0fdb5c
Jan 10 18:39:17 zcache kernel: Tainted: [O]=3DOOT_MODULE
Jan 10 18:39:17 zcache kernel: Hardware name: Framework Laptop 16 (AMD
Ryzen AI 300 Series)/FRANMHCP09, BIOS 03.04 11/06/2025
Jan 10 18:39:17 zcache kernel: Workqueue: mt76 mt7925_mac_reset_work
[mt7925_common]
Jan 10 18:39:17 zcache kernel: RIP:
0010:mt76_connac_mcu_uni_add_dev+0xf1/0x210 [mt76_connac_lib]
Jan 10 18:39:17 zcache kernel: Code: 0f b7 89 b8 00 00 00 66 89 4c 24
1c c7 44 24 1e 00 00 00 00 66 89 4c 24 22 66 c7 44 24 24 00 00 c6 44
24 26 00 44 88 4c 24 27 <48> 8b 0e 8b 09 83 f9 05 7f 11 83 f9 01 74 2f
83 f9 02 74 3c 83 f9
Jan 10 18:39:17 zcache kernel: RSP: 0018:ffffccb5e1d17cb0 EFLAGS: 00010282
Jan 10 18:39:17 zcache kernel: RAX: ffffccb5e1d17ce2 RBX:
ffff8a0f37682060 RCX: 0000000000000013
Jan 10 18:39:17 zcache kernel: RDX: ffff8a0f0cd12588 RSI:
0000000000000000 RDI: 0000000000000000
Jan 10 18:39:17 zcache kernel: RBP: 0000000000000001 R08:
0000000000000000 R09: 0000000000000000
Jan 10 18:39:17 zcache kernel: R10: 0000000000000000 R11:
ffffffff999362b0 R12: 0000000000000001
Jan 10 18:39:17 zcache kernel: R13: 0000000000000000 R14:
ffff8a0f37682060 R15: ffff8a0f0cd12588
Jan 10 18:39:17 zcache kernel: FS:  0000000000000000(0000)
GS:ffff8a12b18fe000(0000) knlGS:0000000000000000
Jan 10 18:39:17 zcache kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800=
50033
Jan 10 18:39:17 zcache kernel: CR2: 0000000000000000 CR3:
00000003f0a12000 CR4: 0000000000f50ef0
Jan 10 18:39:17 zcache kernel: PKRU: 55555554
Jan 10 18:39:17 zcache kernel: Call Trace:
Jan 10 18:39:17 zcache kernel:  <TASK>
Jan 10 18:39:17 zcache kernel:  mt7925_vif_connect_iter+0x95/0x190
[mt7925_common dc0066c6b1da3a3d20cb990f664250b31cf0a3c5]
Jan 10 18:39:17 zcache kernel:  __iterate_interfaces+0x55/0x130
[mac80211 9bef1c01c9f6e23856cab5358ede5658fefb3669]
Jan 10 18:39:17 zcache kernel:  ?
__pfx_mt7925_vif_connect_iter+0x10/0x10 [mt7925_common
dc0066c6b1da3a3d20cb990f664250b31cf0a3c5]
Jan 10 18:39:17 zcache kernel:  ?
__pfx_mt7925_vif_connect_iter+0x10/0x10 [mt7925_common
dc0066c6b1da3a3d20cb990f664250b31cf0a3c5]
Jan 10 18:39:17 zcache kernel:  ieee80211_iterate_interfaces+0x3b/0x50
[mac80211 9bef1c01c9f6e23856cab5358ede5658fefb3669]
Jan 10 18:39:17 zcache kernel:  mt7925_mac_reset_work+0x2a3/0x360
[mt7925_common dc0066c6b1da3a3d20cb990f664250b31cf0a3c5]
Jan 10 18:39:17 zcache kernel:  ? enable_work+0x2b/0xd0
Jan 10 18:39:17 zcache kernel:  process_scheduled_works+0x24b/0x5a0
Jan 10 18:39:17 zcache kernel:  worker_thread+0x188/0x360
Jan 10 18:39:17 zcache kernel:  ? __pfx_worker_thread+0x10/0x10
Jan 10 18:39:17 zcache kernel:  kthread+0x217/0x250
Jan 10 18:39:17 zcache kernel:  ? __pfx_kthread+0x10/0x10
Jan 10 18:39:17 zcache kernel:  ret_from_fork+0xf1/0x1f0
Jan 10 18:39:17 zcache kernel:  ? __pfx_kthread+0x10/0x10
Jan 10 18:39:17 zcache kernel:  ret_from_fork_asm+0x1a/0x30
Jan 10 18:39:17 zcache kernel:  </TASK>
Jan 10 18:39:17 zcache kernel: Modules linked in: overlay tcp_diag
inet_diag ccm snd_seq_dummy snd_hrtimer rfcomm snd_seq snd_seq_device
tun cmac algif_hash algif_skcipher af_alg bnep snd_ctl_led vfat fat
snd_acp_legacy_mach snd_acp_mach snd_soc_nau8821 snd_acp3x_rn
snd_acp70 snd_acp_pdm snd_acp_i2s snd_soc_dmic snd_acp_pcm
snd_sof_amd_acp70 snd_sof_amd_acp63 snd_sof_amd_vangogh
snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd_acp snd_sof_pci
snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_pci_ps
snd_soc_acpi_amd_match soundwire_amd soundwire_generic_allocation
snd_amd_sdw_acpi snd_hda_codec_alc269 soundwire_bus intel_rapl_msr
amd_atl snd_hda_scodec_component snd_soc_sdca intel_rapl_common
snd_hda_codec_realtek_lib mt7925e snd_soc_core snd_hda_codec_generic
mt7925_common snd_hda_codec_atihdmi ac97_bus snd_hda_codec_nvhdmi
mt792x_lib snd_pcm_dmaengine snd_hda_codec_hdmi snd_compress
mt76_connac_lib snd_rpl_pci_acp6x mt76 hid_sensor_als snd_acp_pci
hid_sensor_trigger snd_hda_intel snd_amd_acpi_mach
industrialio_triggered_buffer uvcvideo
Jan 10 18:39:17 zcache kernel:  uvc mac80211 snd_acp_legacy_common
kfifo_buf videobuf2_vmalloc mousedev snd_hda_codec kvm_amd
hid_sensor_iio_common snd_pci_acp6x leds_cros_ec videobuf2_memops
btusb btmtk ucsi_acpi snd_pci_acp5x snd_hda_core videobuf2_v4l2
industrialio cros_ec_sysfs cros_charge_control cros_ec_debugfs
gpio_cros_ec led_class_multicolor videobuf2_common cros_ec_chardev
cros_ec_hwmon typec_ucsi snd_rn_pci_acp3x amd_pmf btbcm
snd_intel_dspcfg kvm cfg80211 snd_intel_sdw_acpi ip6t_REJECT typec
amdtee snd_acp_config btintel snd_hwdep spd5118 videodev
nf_reject_ipv6 hid_sensor_hub amd_sfh cros_ec_dev hid_multitouch
irqbypass btrtl snd_soc_acpi roles snd_pcm polyval_clmulni
platform_profile cros_ec_lpcs mc ccp snd_pci_acp3x snd_timer bluetooth
ghash_clmulni_intel joydev xt_hl aesni_intel snd cros_ec i2c_piix4
thunderbolt rfkill i2c_hid_acpi ip6t_rt tee 8250_dw amd_pmc soundcore
cros_ec_proto amdxdna wmi_bmof pcspkr k10temp nvidia_wmi_ec_backlight
rapl i2c_smbus libarc4 i2c_hid mac_hid ipt_REJECT nf_reject_ipv4
xt_LOG
Jan 10 18:39:17 zcache kernel:  nf_log_syslog nft_limit xt_limit
xt_addrtype xt_tcpudp xt_conntrack nf_conntrack nf_defrag_ipv6
nf_defrag_ipv4 nft_compat x_tables nf_tables dm_mod pkcs8_key_parser
crypto_user ntsync i2c_dev nfnetlink zram 842_compress 842_decompress
lz4hc_compress lz4_compress nvidia_uvm(O) amdgpu nvidia_drm(O)
nvidia_modeset(O) drm_panel_backlight_quirks drm_buddy
drm_suballoc_helper drm_exec nvme i2c_algo_bit gpu_sched nvme_core
amdxcp nvme_keyring drm_display_helper nvme_auth cec hkdf nvidia(O)
drm_ttm_helper video ttm wmi
Jan 10 18:39:17 zcache kernel: CR2: 0000000000000000
Jan 10 18:39:17 zcache kernel: ---[ end trace 0000000000000000 ]---
Jan 10 18:39:17 zcache kernel: RIP:
0010:mt76_connac_mcu_uni_add_dev+0xf1/0x210 [mt76_connac_lib]
Jan 10 18:39:17 zcache kernel: Code: 0f b7 89 b8 00 00 00 66 89 4c 24
1c c7 44 24 1e 00 00 00 00 66 89 4c 24 22 66 c7 44 24 24 00 00 c6 44
24 26 00 44 88 4c 24 27 <48> 8b 0e 8b 09 83 f9 05 7f 11 83 f9 01 74 2f
83 f9 02 74 3c 83 f9
Jan 10 18:39:17 zcache kernel: RSP: 0018:ffffccb5e1d17cb0 EFLAGS: 00010282
Jan 10 18:39:17 zcache kernel: RAX: ffffccb5e1d17ce2 RBX:
ffff8a0f37682060 RCX: 0000000000000013
Jan 10 18:39:17 zcache kernel: RDX: ffff8a0f0cd12588 RSI:
0000000000000000 RDI: 0000000000000000
Jan 10 18:39:17 zcache kernel: RBP: 0000000000000001 R08:
0000000000000000 R09: 0000000000000000
Jan 10 18:39:17 zcache kernel: R10: 0000000000000000 R11:
ffffffff999362b0 R12: 0000000000000001
Jan 10 18:39:17 zcache kernel: R13: 0000000000000000 R14:
ffff8a0f37682060 R15: ffff8a0f0cd12588
Jan 10 18:39:17 zcache kernel: FS:  0000000000000000(0000)
GS:ffff8a12b18fe000(0000) knlGS:0000000000000000
Jan 10 18:39:17 zcache kernel: CS:  0010 DS: 0000 ES: 0000 CR0: 00000000800=
50033

Zac Bowling

On Sun, Jan 4, 2026 at 4:27=E2=80=AFPM Zac Bowling <zbowling@gmail.com> wro=
te:
>
> Add NULL pointer checks for mt792x_sta_to_link() and mt792x_vif_to_link()
> results in critical paths to prevent kernel crashes during MLO operations=
.
>
> Functions fixed:
> - mt7925_mac_link_sta_add(): Check mlink and mconf before dereferencing
> - mt7925_conf_tx(): Check mconf before accessing queue_params
>
> These can be NULL during MLO link setup/teardown when mac80211 state
> may not be fully synchronized with driver state.
>
> Found through static analysis and pattern matching.
>
> Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for =
mt7925 chips")
> Signed-off-by: Zac Bowling <zac@zacbowling.com>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7925/main.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/n=
et/wireless/mediatek/mt76/mt7925/main.c
> index 7cf6faa1f6f4..81373e479abd 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
> @@ -871,12 +871,17 @@ static int mt7925_mac_link_sta_add(struct mt76_dev =
*mdev,
>
>         msta =3D (struct mt792x_sta *)link_sta->sta->drv_priv;
>         mlink =3D mt792x_sta_to_link(msta, link_id);
> +       if (!mlink)
> +               return -EINVAL;
>
>         idx =3D mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1)=
;
>         if (idx < 0)
>                 return -ENOSPC;
>
>         mconf =3D mt792x_vif_to_link(mvif, link_id);
> +       if (!mconf)
> +               return -EINVAL;
> +
>         mt76_wcid_init(&mlink->wcid, 0);
>         mlink->wcid.sta =3D 1;
>         mlink->wcid.idx =3D idx;
> @@ -1735,6 +1740,9 @@ mt7925_conf_tx(struct ieee80211_hw *hw, struct ieee=
80211_vif *vif,
>                     [IEEE80211_AC_BK] =3D 1,
>         };
>
> +       if (!mconf)
> +               return -EINVAL;
> +
>         /* firmware uses access class index */
>         mconf->queue_params[mq_to_aci[queue]] =3D *params;
>
> --
> 2.51.0
>

