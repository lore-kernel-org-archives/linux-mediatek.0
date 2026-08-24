Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6C4C5DF81
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 21:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDKfXK9R/anv7JAPwJXLUqFuPddcBvVm07Or8b8ojdc=; b=BijzeoX0S9F5MXfzmR3B2IiUdr
	tps/MRhaF/K1vy7QeMZCPlV4K/x8sc9e9Y7zeUoF22rOdv4HZnag3tUVkSvALEMkj9wk4oNChj/1Z
	zAV3E9MakSG3YDr2Zw87B8G7MWBMnzKSjuQuvFXeyxqW6ZKkAb05qDjG0rlvUZJ8RZhTHnVbvXPpp
	t/X04I8ZxFWmfP7afpQpsLduJSfJp3t4OkLtnqF6ZIQZWkBcvfIEEk0YkHa5kgK8U22erEeZnTyrQ
	b2gilArfRCsWlwv4zxviRuhXKQx74ssl+bSW7ooj+KG/9w0FwfvPX2WRQxd/yimXozg0U7M7rGqow
	hvA3Z5rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybxQ-0000000HOXp-179i;
	Mon, 24 Aug 2026 21:11:52 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybxN-0000000HOXL-3cR6
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 21:11:51 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-5aeb24c0807so3353089e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 14:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787605907; x=1788210707; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NDKfXK9R/anv7JAPwJXLUqFuPddcBvVm07Or8b8ojdc=;
        b=dz4EeHir9QFVdlbCz3MYxaloNpSRP5odx8KjDRNgdVWknfUeGV9/Tt56JOLkrzeCSh
         rCEaZ+LqB2zIYkmY3d3MjW1Po70fdd4E8w7/HcDlpa2lnFTM06fk6AuIfQ7u/Eb0kywZ
         buDOUVhaZjNCpTGH+Gt/1hJJldsazZOVIuO/JQDJRX9uDixgaUlNpnTp6t5/ZLxEgleu
         9tSRMX5LU1nK2OoneP4huqaJngtPPiQfSuj6LyPuJGsw9J6ME1/BJ/2M840QjyAaZGno
         8b9IWSWelCXHwTj5/DeD03D/RxoFJnj0IgDNhPxcf0+zBYIeah1BtonHIclSi+Kv0HAc
         1ZHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787605907; x=1788210707;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NDKfXK9R/anv7JAPwJXLUqFuPddcBvVm07Or8b8ojdc=;
        b=KKapZEUFwd9M1/Z2zzPpHTaEMVoSYBNtg9vVPYm5rHQ1znIS0D8BTeWLgu/iU5we+T
         jUp7mChiIjGBZ+XwHDLLDUhXnq3NI/X7ZguodzcfPgjxzoF2m6OJo9HaYOJ1lCVirMmw
         vz7nmMgHbv2n8xUAsg5y/tK6mCMo5oFIR3EJ51fG7qlgvQXBVOCGHhaGD6xhzdDi5mlm
         EWYrcAUa4QKhDaHkk8l+2zQlJEQvc1L/5KYWjUGlvPQo9gKj+IHZuyuHcHdCEyVpXT7b
         3pz9N31WeD1XXD8YkgPosKNRtIS7Rag7fsLmBxvtvlg5xcGFsE2TV976HuvuhzxHEnhG
         Ia2Q==
X-Forwarded-Encrypted: i=1; AHgh+RojD1Y3jRRzFCrxaDF5YQIHJNQiUrjqmFkrwtLx8snYYzbSvRfB+/IEUpo2PbAgEO8eITs2KAaMj6z1W6jgyg==@lists.infradead.org
X-Gm-Message-State: AFuF++nqjUGgnpdEYqNaw4SOme5Yj3hJHENJv+NQCrIKJFtGx+miyXgE
	mRo9bMz2wLuK0jSoHgtXDZTk+E75EXIrToOi3WD4HtZVnlKsuyl9/1uN
X-Gm-Gg: AR+sD12G//nAUmtOKqr7BRD0039fu7U9ilkgYWceXwEeJwQenK6m4J10ig1CXjZrRBM
	LZf1NaBbnBVADHn7nEOHtEidiR6q+mJIN62V8ZpFb8Qc9UO1wLCcl1uRSBYm4CjAqmHceQicOQt
	SYFfypvaYK+C4ArzX4YBTfcydBXa2dilm2xNyjLG8MepTdcSCO2FYRmmKWM3I6W0seoBPI0UxUi
	kuRU1skgn35f0YAdHAkld4vcETQaovFrO83IxM88UiUNtBR6812AaFiljqJbRNaxbTgLzt2QRyn
	vaTsRJUHBZIplkxZVp+rB1KlARxmn3Qy1GjQmHvNq2DJ1ehDJl5KlQtASI8rjc8JAeKjsfHfuZl
	ZMj434hrIlZis7mw2hA7AhMkuD4SKpwc7055fTn2HA1zesK3UZPX87G3mtsOGFwgdIJ2wX79h/d
	G/sNKHAfP2B9iKYPx7S+dZQikZqr2sLViwMxjGdr4UyOyFZ7J0I5ft8KAv4iNiwg7Jsg48yKu1n
	vE=
X-Received: by 2002:a05:6512:ac2:b0:5b1:5f8f:bc1e with SMTP id 2adb3069b0e04-5b484208fdamr9073606e87.3.1787605906238;
        Mon, 24 Aug 2026 14:11:46 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1c2e5684fsm16699881fa.2.2026.08.24.14.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 14:11:45 -0700 (PDT)
Date: Mon, 24 Aug 2026 23:11:45 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: JB Tsai <jb.tsai@mediatek.com>
Cc: nbd@nbd.name, lorenzo@kernel.org, linux-wireless@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Deren.Wu@mediatek.com, Sean.Wang@mediatek.com, 
	Quan.Zhou@mediatek.com, Ryder.Lee@mediatek.com, Leon.Yen@mediatek.com, 
	litien.chang@mediatek.com, Charlie-cy.Wu@mediatek.com
Subject: Re: [PATCH v2] wifi: mt76: mt7921: add regulatory wiphy self manager
 support
Message-ID: <aoyxqHYvSuaBeubf@soda.int.kasm.eu>
References: <20260609065036.577329-1-jb.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260609065036.577329-1-jb.tsai@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_141150_118862_397CD2E8 
X-CRM114-Status: GOOD (  11.88  )
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

Hi,

On 2026-06-09 14:50:36 +0800, JB Tsai wrote:
> From: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>
>=20
> Introduce regulatory wiphy self-managed mode support for MT7921,
> allowing the driver to manage its own regulatory domain independently
> from the kernel's regulatory framework.
>=20
> Signed-off-by: Charlie-cy Wu <Charlie-cy.Wu@mediatek.com>

This patch generates an oops on my Framework 13 with the MT7922 and the
network interface does not appear:

 mt7921e 0000:01:00.0: Loading firmware patch: mediatek/WIFI_MT7922_patch_m=
cu_1_1_hdr.bin
 mt7921e 0000:01:00.0: HW/SW Version: 0x8a108a10, Build Time: 2026072414325=
7a
 Bluetooth: hci0: Device setup in 146228 usecs
 Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is adve=
rtised, but not supported.
 mt7921e 0000:01:00.0: WM Firmware Version: ____000000, Build Time: 2026072=
4143402
 BUG: kernel NULL pointer dereference, address: 0000000000000004
 #PF: supervisor read access in kernel mode
 #PF: error_code(0x0000) - not-present page
 PGD 0 P4D 0
 Oops: Oops: 0000 [#1] SMP NOPTI
 Hardware name: Framework Laptop 13 (AMD Ryzen 7040Series)/FRANMDCP05, BIOS=
 03.20 06/23/2026
 Workqueue: events mt7921_init_work [mt7921_common]
 RIP: 0010:mt792x_init_acpi_sar_power (drivers/net/wireless/mediatek/mt76/m=
t792x_acpi_sar.c:323) mt792x_lib
 Code: 01 00 00 48 83 78 08 00 0f 84 c2 01 00 00 48 83 ec 28 49 89 fb 48 89=
 1c 24 48 8b 0f 48 8b 01 48 8b 40 50 48 8b 98 40 06 00 00 <8b> 43 04 85 c0 =
0f 84 83 01 00 00 48 89 6c 24 08 4c 89 64 24 10 4c
 All code
 =3D=3D=3D=3D=3D=3D=3D=3D
    0:	01 00                	add    %eax,(%rax)
    2:	00 48 83             	add    %cl,-0x7d(%rax)
    5:	78 08                	js     0xf
    7:	00 0f                	add    %cl,(%rdi)
    9:	84 c2                	test   %al,%dl
    b:	01 00                	add    %eax,(%rax)
    d:	00 48 83             	add    %cl,-0x7d(%rax)
   10:	ec                   	in     (%dx),%al
   11:	28 49 89             	sub    %cl,-0x77(%rcx)
   14:	fb                   	sti
   15:	48 89 1c 24          	mov    %rbx,(%rsp)
   19:	48 8b 0f             	mov    (%rdi),%rcx
   1c:	48 8b 01             	mov    (%rcx),%rax
   1f:	48 8b 40 50          	mov    0x50(%rax),%rax
   23:	48 8b 98 40 06 00 00 	mov    0x640(%rax),%rbx
   2a:*	8b 43 04             	mov    0x4(%rbx),%eax		<-- trapping instructi=
on
   2d:	85 c0                	test   %eax,%eax
   2f:	0f 84 83 01 00 00    	je     0x1b8
   35:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
   3a:	4c 89 64 24 10       	mov    %r12,0x10(%rsp)
   3f:	4c                   	rex.WR
=20
 Code starting with the faulting instruction
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    0:	8b 43 04             	mov    0x4(%rbx),%eax
    3:	85 c0                	test   %eax,%eax
    5:	0f 84 83 01 00 00    	je     0x18e
    b:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
   10:	4c 89 64 24 10       	mov    %r12,0x10(%rsp)
   15:	4c                   	rex.WR
 RSP: 0018:ffffd3b6c0257cb0 EFLAGS: 00010282
 RAX: ffff8b9d13290440 RBX: 0000000000000000 RCX: ffff8b9d132925c0
 RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff8b9d13299798
 RBP: ffff8b9d13292e68 R08: 0000000000000012 R09: 0000000000000002
 R10: ffff8b9cc3217b00 R11: ffff8b9d13299798 R12: ffff8b9d13290440
 R13: ffffffffc0fb235f R14: ffff8b9ce6136800 R15: ffff8b9cc2d7f300
 FS:  0000000000000000(0000) GS:ffff8ba04d3f9000(0000) knlGS:00000000000000=
00
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 0000000000000004 CR3: 000000018ae0e000 CR4: 0000000000f50ef0
 PKRU: 55555554
 Call Trace:
  <TASK>
 mt7921_set_tx_sar_pwr (drivers/net/wireless/mediatek/mt76/mt7921/main.c:12=
97 (discriminator 1)) mt7921_common
 mt7921_mcu_regd_update (drivers/net/wireless/mediatek/mt76/mt7921/regd.c:1=
22) mt7921_common
 mt7921_regd_update (drivers/net/wireless/mediatek/mt76/mt7921/regd.c:321) =
mt7921_common
 mt7921_run_firmware (drivers/net/wireless/mediatek/mt76/mt7921/mcu.c:511 d=
rivers/net/wireless/mediatek/mt76/mt7921/mcu.c:669 drivers/net/wireless/med=
iatek/mt76/mt7921/mcu.c:657) mt7921_common
 mt7921e_mcu_init (drivers/net/wireless/mediatek/mt76/mt7921/pci_mcu.c:58) =
mt7921e
 mt7921_init_work (drivers/net/wireless/mediatek/mt76/mt7921/init.c:92 driv=
ers/net/wireless/mediatek/mt76/mt7921/init.c:116 drivers/net/wireless/media=
tek/mt76/mt7921/init.c:137) mt7921_common
  ? srso_alias_return_thunk (arch/x86/lib/retpoline.S:234)
  process_one_work (kernel/workqueue.c:3396)
  worker_thread (kernel/workqueue.c:3479 kernel/workqueue.c:3560)
  ? __pfx_worker_thread (kernel/workqueue.c:3754)
  kthread (kernel/kthread.c:436)
  ? __pfx_kthread (kernel/kthread.c:948)
  ret_from_fork (arch/x86/kernel/process.c:158)
  ? __pfx_kthread (kernel/kthread.c:948)
  ? __pfx_kthread (kernel/kthread.c:948)
  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
  </TASK>
 Modules linked in: snd_sof_amd_acp7x snd_sof_amd_acp70 snd_sof_amd_acp63 s=
nd_sof_amd_vangogh snd_sof_amd_rembrandt snd_sof_amd_renoir snd_sof_amd_acp=
 snd_sof_xtensa_dsp snd_sof_pci snd_sof fmpm(-) amd_atl snd_sof_utils intel=
_rapl_msr snd_pci_acp7x iosf_mbi snd_pci_ps intel_rapl_common snd_soc_acpi_=
amd_match snd_amd_sdw_acpi soundwire_amd soundwire_generic_allocation kvm_a=
md soundwire_bus mt7921e mousedev mt7921_common snd_soc_sdca snd_hda_codec_=
generic snd_hda_codec_atihdmi drm_buddy mt792x_lib kvm amdxcp snd_hda_codec=
_hdmi btusb i2c_algo_bit snd_soc_core mt76_connac_lib drm_ttm_helper btrtl =
ttm btintel snd_hda_intel amdxdna snd_compress mt76 btbcm snd_acp_pci drm_e=
xec input_leds snd_hda_codec hid_multitouch btmtk snd_amd_acpi_mach drm_pan=
el_backlight_quirks hid_sensor_hub joydev spd5118 wmi_bmof irqbypass pcspkr=
 serio_raw mac80211 bluetooth snd_acp_legacy_common snd_hda_core snd_intel_=
dspcfg i2c_hid_acpi i2c_hid gpu_sched snd_hwdep snd_pci_acp6x drm_suballoc_=
helper cfg80211 snd_pcm drm_display_helper
  snd_pci_acp5x snd_timer amd_pmf sp5100_tco snd_rn_pci_acp3x tpm_crb watch=
dog snd snd_acp_config i2c_designware_platform pkcs8_key_parser tpm_tis amd=
tee snd_soc_acpi i2c_designware_core cec rfkill soundcore tpm_tis_core snd_=
pci_acp3x video libarc4 tpm evdev i2c_dev i2c_piix4 tee mac_hid cros_kbd_le=
d_backlight libaescfb i2c_smbus k10temp ecdh_generic ccp cros_ec_sysfs cros=
_ec_debugfs amd_sfh ecc amd_pmc wmi bpf_preload
 CR2: 0000000000000004
 ---[ end trace 0000000000000000 ]---
 pstore: backend (efi_pstore) writing error (-28)
 RIP: 0010:mt792x_init_acpi_sar_power (drivers/net/wireless/mediatek/mt76/m=
t792x_acpi_sar.c:323) mt792x_lib
 Code: 01 00 00 48 83 78 08 00 0f 84 c2 01 00 00 48 83 ec 28 49 89 fb 48 89=
 1c 24 48 8b 0f 48 8b 01 48 8b 40 50 48 8b 98 40 06 00 00 <8b> 43 04 85 c0 =
0f 84 83 01 00 00 48 89 6c 24 08 4c 89 64 24 10 4c
 All code
 =3D=3D=3D=3D=3D=3D=3D=3D
    0:	01 00                	add    %eax,(%rax)
    2:	00 48 83             	add    %cl,-0x7d(%rax)
    5:	78 08                	js     0xf
    7:	00 0f                	add    %cl,(%rdi)
    9:	84 c2                	test   %al,%dl
    b:	01 00                	add    %eax,(%rax)
    d:	00 48 83             	add    %cl,-0x7d(%rax)
   10:	ec                   	in     (%dx),%al
   11:	28 49 89             	sub    %cl,-0x77(%rcx)
   14:	fb                   	sti
   15:	48 89 1c 24          	mov    %rbx,(%rsp)
   19:	48 8b 0f             	mov    (%rdi),%rcx
   1c:	48 8b 01             	mov    (%rcx),%rax
   1f:	48 8b 40 50          	mov    0x50(%rax),%rax
   23:	48 8b 98 40 06 00 00 	mov    0x640(%rax),%rbx
   2a:*	8b 43 04             	mov    0x4(%rbx),%eax		<-- trapping instructi=
on
   2d:	85 c0                	test   %eax,%eax
   2f:	0f 84 83 01 00 00    	je     0x1b8
   35:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
   3a:	4c 89 64 24 10       	mov    %r12,0x10(%rsp)
   3f:	4c                   	rex.WR
=20
 Code starting with the faulting instruction
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    0:	8b 43 04             	mov    0x4(%rbx),%eax
    3:	85 c0                	test   %eax,%eax
    5:	0f 84 83 01 00 00    	je     0x18e
    b:	48 89 6c 24 08       	mov    %rbp,0x8(%rsp)
   10:	4c 89 64 24 10       	mov    %r12,0x10(%rsp)
   15:	4c                   	rex.WR
 RSP: 0018:ffffd3b6c0257cb0 EFLAGS: 00010282
 RAX: ffff8b9d13290440 RBX: 0000000000000000 RCX: ffff8b9d132925c0
 RDX: 0000000000000000 RSI: 0000000000000001 RDI: ffff8b9d13299798
 RBP: ffff8b9d13292e68 R08: 0000000000000012 R09: 0000000000000002
 R10: ffff8b9cc3217b00 R11: ffff8b9d13299798 R12: ffff8b9d13290440
 R13: ffffffffc0fb235f R14: ffff8b9ce6136800 R15: ffff8b9cc2d7f300
 FS:  0000000000000000(0000) GS:ffff8ba04d3f9000(0000) knlGS:00000000000000=
00
 CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
 CR2: 0000000000000004 CR3: 000000016923c000 CR4: 0000000000f50ef0
 PKRU: 55555554
 note: kworker/2:0[27] exited with irqs disabled

Reverting the patch fixes the issue for me. Let me know if there's
anything else you need.

Regards,
Klara Modin

bisect:
 # bad: [11260c335ec6071af5543aef73000b28f041c124] Merge tag 'sched_ext-for=
-7.3' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext
 # good: [8d3ae59288f1e7d58d76558a6ee96d533bc5019f] Linux 7.2
 git bisect start '11260c335ec6071af5543aef73000b28f041c124' '8d3ae59288f1e=
7d58d76558a6ee96d533bc5019f'
 # good: [a93f3bf4e1d60777b1659b812c9e818cfc53b449] Merge tag 'hid-for-linu=
s-2026081901' of git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid
 git bisect good a93f3bf4e1d60777b1659b812c9e818cfc53b449
 # good: [5a8cd539ac19f7a68e68e1d25ef9ca2ff55b8500] Merge tag 'bpf-next-7.3=
' of git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next
 git bisect good 5a8cd539ac19f7a68e68e1d25ef9ca2ff55b8500
 # bad: [ca800a9302764c445de0da0e84d2252400a770ee] wifi: nxpwifi: bound uAP=
 association event IEs to the event buffer
 git bisect bad ca800a9302764c445de0da0e84d2252400a770ee
 # good: [edc84a9396acf1a0e78c46230dd0bcee1b84ac53] Merge tag 'wireless-202=
6-07-26' of https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wirele=
ss-next
 git bisect good edc84a9396acf1a0e78c46230dd0bcee1b84ac53
 # bad: [636a883e2feef5e4ff95695d3c372ceff03960f5] wifi: mt76: mt7603: rest=
ore hardware PS buffering after a service period
 git bisect bad 636a883e2feef5e4ff95695d3c372ceff03960f5
 # good: [a4803d1801c701603e2403ba5eb2b8ed55667e58] wifi: mt76: mt792x: dra=
in USB UDMA before WFSYS reset
 git bisect good a4803d1801c701603e2403ba5eb2b8ed55667e58
 # bad: [6689b4a65e88d7b019e687fa9d6943ca070f3e43] wifi: mt76: fix out-of-b=
ounds access in mmio copy helpers
 git bisect bad 6689b4a65e88d7b019e687fa9d6943ca070f3e43
 # good: [1f83a8378eb26c47ff947709e67d7145a84a3907] wifi: mt76: mt7921: ref=
actor regd update to fix recursive mutex deadlock
 git bisect good 1f83a8378eb26c47ff947709e67d7145a84a3907
 # bad: [4a2f4be532e3ea4e2b536e411793a05aaa51af25] wifi: mt76: mt7915: avoi=
d nss underflow in mt7915_mcu_get_sta_nss
 git bisect bad 4a2f4be532e3ea4e2b536e411793a05aaa51af25
 # bad: [86897f106669c07eea4c34b54c3268d448d41426] wifi: mt76: fix RX data =
queuing of RRO 3.0
 git bisect bad 86897f106669c07eea4c34b54c3268d448d41426
 # bad: [6bb5066cfcd4296ac5e0b6872f43f96a43bfe566] wifi: mt76: mt7996: fix =
EAPOL source BSS for non-MLD stations
 git bisect bad 6bb5066cfcd4296ac5e0b6872f43f96a43bfe566
 # bad: [9b80bd9cab40c402a75e8dc850e97503ad3b8bbc] wifi: mt76: mt7921: add =
regulatory wiphy self manager support
 git bisect bad 9b80bd9cab40c402a75e8dc850e97503ad3b8bbc
 # good: [e9f3f1cc133fc2ea51a11be7cfe51733081d176a] wifi: mt76: mt7925: add=
 regulatory wiphy self manager support
 git bisect good e9f3f1cc133fc2ea51a11be7cfe51733081d176a
 # first 'bad' commit: [9b80bd9cab40c402a75e8dc850e97503ad3b8bbc] wifi: mt7=
6: mt7921: add regulatory wiphy self manager support

> ---
> v2: fix regd.c build warning
> ---
>  .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   1 +
>  .../net/wireless/mediatek/mt76/mt7921/mcu.c   |   3 +
>  .../net/wireless/mediatek/mt76/mt7921/regd.c  | 209 ++++++++++++++++--
>  .../net/wireless/mediatek/mt76/mt7921/regd.h  |  55 ++++-
>  4 files changed, 245 insertions(+), 23 deletions(-)
>=20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drive=
rs/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> index ed5c441748d8..c10a2c4e7ee2 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
> @@ -1363,6 +1363,7 @@ enum {
>  	MCU_CE_CMD_FWLOG_2_HOST =3D 0xc5,
>  	MCU_CE_CMD_GET_WTBL =3D 0xcd,
>  	MCU_CE_CMD_GET_TXPWR =3D 0xd0,
> +	MCU_CE_CMD_SET_REGD_CH =3D 0xd1,
>  };
> =20
>  enum {
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/ne=
t/wireless/mediatek/mt76/mt7921/mcu.c
> index 25b9437250f7..2e0769d18f87 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
> @@ -1403,6 +1403,9 @@ int mt7921_mcu_set_clc(struct mt792x_dev *dev, u8 *=
alpha2,
> =20
>  	/* submit all clc config */
>  	for (i =3D 0; i < ARRAY_SIZE(phy->clc); i++) {
> +		if (i =3D=3D MT792x_CLC_REGD)
> +			continue;
> +
>  		ret =3D __mt7921_mcu_set_clc(dev, alpha2, env_cap,
>  					   phy->clc[i], i);
> =20
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c b/drivers/n=
et/wireless/mediatek/mt76/mt7921/regd.c
> index f122e418d825..d29b3b0113f2 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.c
> @@ -10,6 +10,15 @@ static bool mt7921_disable_clc;
>  module_param_named(disable_clc, mt7921_disable_clc, bool, 0644);
>  MODULE_PARM_DESC(disable_clc, "disable CLC support");
> =20
> +static struct ieee80211_regdomain mt7921_regd_ww =3D {
> +	.n_reg_rules =3D 1,
> +	.alpha2 =3D  "00",
> +	.reg_rules =3D {
> +		/* IEEE 802.11b/g, channels 1..11 */
> +		REG_RULE(2412 - 10, 2462 + 10, 40, 6, 20, 0),
> +	}
> +};
> +
>  bool mt7921_regd_clc_supported(struct mt792x_dev *dev)
>  {
>  	if (mt7921_disable_clc ||
> @@ -33,6 +42,9 @@ mt7921_regd_channel_update(struct wiphy *wiphy, struct =
mt792x_dev *dev)
>  	np =3D mt76_find_power_limits_node(mdev);
> =20
>  	sband =3D wiphy->bands[NL80211_BAND_5GHZ];
> +	if (!sband)
> +		return;
> +
>  	band_np =3D np ? of_get_child_by_name(np, "txpower-5g") : NULL;
>  	for (i =3D 0; i < sband->n_channels; i++) {
>  		ch =3D &sband->channels[i];
> @@ -71,35 +83,36 @@ mt7921_regd_channel_update(struct wiphy *wiphy, struc=
t mt792x_dev *dev)
>  	}
>  }
> =20
> -int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
> -			   enum environment_cap country_ie_env)
> +static int mt7921_mcu_apply_regd(struct mt792x_dev *dev, u8 *alpha2,
> +				  enum environment_cap env)
>  {
> -	struct mt76_dev *mdev =3D &dev->mt76;
> -	struct ieee80211_hw *hw =3D mdev->hw;
> +	struct ieee80211_hw *hw =3D mt76_hw(dev);
>  	struct wiphy *wiphy =3D hw->wiphy;
> -	int ret =3D 0;
> -
> -	dev->regd_in_progress =3D true;
> -
> -	mt792x_mutex_acquire(dev);
> -	if (!dev->regd_change)
> -		goto err;
> +	int ret;
> =20
> -	ret =3D mt7921_mcu_set_clc(dev, alpha2, country_ie_env);
> +	ret =3D mt7921_mcu_set_clc(dev, alpha2, env);
>  	if (ret < 0)
> -		goto err;
> +		return ret;
> =20
>  	mt7921_regd_channel_update(wiphy, dev);
> =20
>  	ret =3D mt76_connac_mcu_set_channel_domain(hw->priv);
>  	if (ret < 0)
> -		goto err;
> +		return ret;
> =20
> -	ret =3D mt7921_set_tx_sar_pwr(hw, NULL);
> -	if (ret < 0)
> -		goto err;
> +	return mt7921_set_tx_sar_pwr(hw, NULL);
> +}
> =20
> -err:
> +int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
> +			   enum environment_cap country_ie_env)
> +{
> +	int ret =3D 0;
> +
> +	dev->regd_in_progress =3D true;
> +
> +	mt792x_mutex_acquire(dev);
> +	if (dev->regd_change)
> +		ret =3D mt7921_mcu_apply_regd(dev, alpha2, country_ie_env);
>  	mt792x_mutex_release(dev);
>  	dev->regd_change =3D false;
>  	dev->regd_in_progress =3D false;
> @@ -142,10 +155,160 @@ void mt7921_regd_notifier(struct wiphy *wiphy,
>  	if (pm->suspended)
>  		return;
> =20
> +	if (MT7921_REGD_SUPPORTED(&dev->phy)) {
> +		mt7921_regd_update(&dev->phy, req->alpha2);
> +
> +		return;
> +	}
> +
>  	mt7921_mcu_regd_update(dev, req->alpha2,
>  			       req->country_ie_env);
>  }
> =20
> +static struct sk_buff *
> +mt7921_regd_query_regdb(struct mt792x_phy *phy, char *alpha2)
> +{
> +	struct wiphy *wiphy =3D phy->mt76->hw->wiphy;
> +	struct ieee80211_hw *hw =3D wiphy_to_ieee80211_hw(wiphy);
> +	struct mt792x_dev *dev =3D mt792x_hw_dev(hw);
> +	struct mt7921_clc *clc =3D phy->clc[MT792x_CLC_REGD];
> +	struct mt7921_regd_query_req *req;
> +	struct mt7921_regd_cc *regd_cc;
> +	struct sk_buff *ret_skb =3D NULL;
> +	u8 *pos, *last_pos;
> +	int ret =3D 0;
> +
> +	if (!clc)
> +		return NULL;
> +
> +	pos =3D clc->data;
> +	last_pos =3D pos + le32_to_cpu(clc->len) - sizeof(struct mt7921_clc);
> +	while (pos < last_pos) {
> +		u32 req_len =3D 0;
> +		u32 rules_len =3D 0;
> +		u32 sign_len =3D 4;
> +
> +		if (pos + sizeof(*regd_cc) > last_pos)
> +			break;
> +
> +		regd_cc =3D (struct mt7921_regd_cc *)pos;
> +		rules_len =3D sizeof(struct mt7921_regd_rule_header) +
> +			    sizeof(struct mt7921_regd_rule) *
> +			    le32_to_cpu(regd_cc->n_reg_rules);
> +
> +		if (pos + sizeof(*regd_cc) + rules_len + sign_len > last_pos)
> +			break;
> +
> +		pos +=3D sizeof(*regd_cc) + rules_len + sign_len;
> +		if (memcmp(regd_cc->alpha2, alpha2, 2))
> +			continue;
> +
> +		req_len =3D sizeof(*req) + rules_len + sign_len;
> +		req =3D devm_kmalloc(dev->mt76.dev, req_len, GFP_KERNEL);
> +
> +		if (!req)
> +			return NULL;
> +
> +		req->ver =3D regd_cc->ver;
> +		req->sign_type =3D regd_cc->sign_type;
> +		req->size =3D cpu_to_le32(rules_len + sign_len);
> +		req->n_reg_rules =3D regd_cc->n_reg_rules;
> +
> +		memcpy(req->alpha2, regd_cc->alpha2, 2);
> +		memcpy(req->data, regd_cc->data, rules_len + sign_len);
> +
> +		ret =3D mt76_mcu_send_and_get_msg(&dev->mt76,
> +						MCU_CE_CMD(SET_REGD_CH),
> +						req, req_len, true, &ret_skb);
> +
> +		devm_kfree(dev->mt76.dev, req);
> +
> +		return ret < 0 ? NULL : ret_skb;
> +	}
> +
> +	return NULL;
> +}
> +
> +int mt7921_regd_update(struct mt792x_phy *phy, char *alpha2)
> +{
> +	struct wiphy *wiphy =3D phy->mt76->hw->wiphy;
> +	struct ieee80211_hw *hw =3D wiphy_to_ieee80211_hw(wiphy);
> +	struct mt792x_dev *dev =3D mt792x_hw_dev(hw);
> +	struct mt7921_regd_rule *mt7921_rule;
> +	struct mt76_dev *mdev =3D &dev->mt76;
> +	struct ieee80211_regdomain *regd;
> +	struct ieee80211_reg_rule *rule;
> +	struct mt7921_regd_rule_ev *ev;
> +	int i, num_of_rules =3D 0;
> +	struct sk_buff *skb;
> +	int ret =3D 0;
> +
> +	if (dev->hw_full_reset)
> +		return 0;
> +
> +	if (!MT7921_REGD_SUPPORTED(phy))
> +		return -EOPNOTSUPP;
> +
> +	mt792x_mutex_acquire(dev);
> +	skb =3D mt7921_regd_query_regdb(phy, alpha2);
> +	mt792x_mutex_release(dev);
> +
> +	if (!skb)
> +		return -EINVAL;
> +
> +	ev =3D (struct mt7921_regd_rule_ev *)(skb->data + 4);
> +	num_of_rules =3D le32_to_cpu(ev->n_reg_rules);
> +
> +	if (!num_of_rules ||
> +		WARN_ON_ONCE(num_of_rules > NL80211_MAX_SUPP_REG_RULES)) {
> +		ret =3D -EINVAL;
> +		goto err;
> +	}
> +
> +	regd =3D kzalloc(struct_size(regd, reg_rules, num_of_rules), GFP_KERNEL=
);
> +	if (!regd) {
> +		ret =3D -ENOMEM;
> +		goto err;
> +	}
> +
> +	for (i =3D 0; i < num_of_rules; i++) {
> +		mt7921_rule =3D &ev->reg_rule[i];
> +		rule =3D &regd->reg_rules[i];
> +
> +		rule->freq_range.start_freq_khz =3D
> +					MHZ_TO_KHZ(mt7921_rule->start_freq);
> +		rule->freq_range.end_freq_khz =3D
> +					MHZ_TO_KHZ(mt7921_rule->end_freq);
> +		rule->freq_range.max_bandwidth_khz =3D
> +					MHZ_TO_KHZ(mt7921_rule->max_bw);
> +		/* not used by fw */
> +		rule->power_rule.max_antenna_gain =3D DBI_TO_MBI(6);
> +		rule->power_rule.max_eirp =3D DBM_TO_MBM(22);
> +		rule->flags =3D mt7921_rule->flags;
> +	}
> +
> +	regd->n_reg_rules =3D num_of_rules;
> +	regd->dfs_region =3D ev->dfs_region;
> +
> +	memcpy(regd->alpha2, alpha2, 2);
> +	memcpy(mdev->alpha2, alpha2, 2);
> +
> +	dev->regd_change =3D true;
> +	mt7921_mcu_regd_update(dev, alpha2, ENVIRON_ANY);
> +
> +	ret =3D regulatory_set_wiphy_regd(wiphy, regd);
> +
> +	kfree(regd);
> +err:
> +	dev_kfree_skb(skb);
> +
> +	if (ret < 0)
> +		return regulatory_set_wiphy_regd(wiphy, &mt7921_regd_ww);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(mt7921_regd_update);
> +
>  static bool
>  mt7921_regd_is_valid_alpha2(const char *alpha2)
>  {
> @@ -183,7 +346,9 @@ int mt7921_regd_change(struct mt792x_phy *phy, char *=
alpha2)
>  	if (!memcmp(alpha2, mdev->alpha2, 2))
>  		return 0;
> =20
> -	if (phy->chip_cap & MT792x_CHIP_CAP_11D_EN)
> +	if (MT7921_REGD_SUPPORTED(phy))
> +		return mt7921_regd_update(phy, alpha2);
> +	else if (phy->chip_cap & MT792x_CHIP_CAP_11D_EN)
>  		return regulatory_hint(wiphy, alpha2);
>  	else
>  		return mt7921_mcu_set_clc(dev, alpha2, ENVIRON_INDOOR);
> @@ -197,7 +362,11 @@ int mt7921_regd_init(struct mt792x_phy *phy)
>  	struct mt792x_dev *dev =3D mt792x_hw_dev(hw);
>  	struct mt76_dev *mdev =3D &dev->mt76;
> =20
> -	if (phy->chip_cap & MT792x_CHIP_CAP_11D_EN)
> +	if (MT7921_REGD_SUPPORTED(phy)) {
> +		wiphy->regulatory_flags |=3D REGULATORY_WIPHY_SELF_MANAGED |
> +					   REGULATORY_DISABLE_BEACON_HINTS;
> +		return mt7921_regd_update(phy, "00");
> +	} else if (phy->chip_cap & MT792x_CHIP_CAP_11D_EN)
>  		wiphy->regulatory_flags |=3D REGULATORY_COUNTRY_IE_IGNORE |
>  					   REGULATORY_DISABLE_BEACON_HINTS;
>  	else
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h b/drivers/n=
et/wireless/mediatek/mt76/mt7921/regd.h
> index 571f31629e9e..c1e94cd4c958 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/regd.h
> @@ -4,9 +4,57 @@
>  #ifndef __MT7921_REGD_H
>  #define __MT7921_REGD_H
> =20
> -struct mt792x_dev;
> -struct wiphy;
> -struct regulatory_request;
> +#include "mt7921.h"
> +
> +struct mt7921_regd_rule_header {
> +	u8 alpha2[2];
> +	u8 dfs_region;
> +	u8 rsv[13];
> +};
> +
> +struct mt7921_regd_rule {
> +	u32 start_freq;
> +	u32 end_freq;
> +	u32 max_bw;
> +	u32 eirp;
> +	u32 flags;
> +	u8 rsv[12];
> +};
> +
> +struct mt7921_regd_cc {
> +	u8 alpha2[2];
> +	u8 ver;
> +	u8 rsv;
> +	__le32 n_reg_rules;
> +	u8 sign_type;
> +	u8 rsv1[7];
> +	u8 data[];
> +};
> +
> +struct mt7921_regd_rule_ev {
> +	__le16 tag;
> +	__le16 len;
> +	__le32 n_reg_rules;
> +	u8 dfs_region;
> +	u8 rsv[15];
> +	struct mt7921_regd_rule reg_rule[];
> +};
> +
> +struct mt7921_regd_query_req {
> +	u8 ver;
> +	u8 sign_type;
> +	u8 rsv1[2];
> +	__le32 size;
> +	u8 alpha2[2];
> +	u8 rsv2[2];
> +	__le32 n_reg_rules;
> +	u8 rsv3[64];
> +	u8 data[];
> +};
> +
> +#define MT7921_REGD_SUPPORTED(phy) \
> +	(((phy)->chip_cap & MT792x_CHIP_CAP_REGD_EN) && \
> +	(phy)->clc[MT792x_CLC_REGD])
> =20
>  int mt7921_mcu_regd_update(struct mt792x_dev *dev, u8 *alpha2,
>  			   enum environment_cap country_ie_env);
> @@ -15,5 +63,6 @@ void mt7921_regd_notifier(struct wiphy *wiphy,
>  bool mt7921_regd_clc_supported(struct mt792x_dev *dev);
>  int mt7921_regd_change(struct mt792x_phy *phy, char *alpha2);
>  int mt7921_regd_init(struct mt792x_phy *phy);
> +int mt7921_regd_update(struct mt792x_phy *phy, char *alpha2);
> =20
>  #endif
> --=20
> 2.18.0
>=20

