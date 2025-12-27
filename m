Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1E6E92716
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Dec 2025 20:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tC5qnG5bwx7xRT8QR4/3Ue9TlCbetNJuPNBQQ7OHiB8=; b=DsF7gLasO8Gs0C9PwNT+MIC4pR
	yckKYT9U6lzOWYyLmNJA75tJkiU1jFyKnQkL+939RBslfOPn5yayeAAL/BhzdzZJFrZCbcaq+PRZF
	20+4fTSnk9WpQqMeMJwMk3I+9KeLdhF3UzCIHKnZeBA0YUm8/Uz4qhS3F+9+OqQbNiQgKH//0L1N8
	9O5L2QfLCXXO3JEBXztmHj6lirKppI0XEjqWfUlokEyt5QgRlaB2C3gj0h7pwgq+dM2QpbTCOPckw
	mhlIC78XxTmcM+BCyfWtL7yk9AYIAaf76lz9kD3tI9QIPuGSTa9ozZ/z7vnfTb/8chB8nUAaPcWJR
	Ih7pzLXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZawi-00000002CBj-0Xby;
	Sat, 27 Dec 2025 20:31:28 +0000
Received: from fout-b3-smtp.messagingengine.com ([202.12.124.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZawe-00000002CBM-0z2x
	for linux-mediatek@lists.infradead.org;
	Sat, 27 Dec 2025 20:31:26 +0000
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 5C9011D00041;
	Sat, 27 Dec 2025 15:31:20 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sat, 27 Dec 2025 15:31:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1766867480; x=1766953880; bh=tC
	5qnG5bwx7xRT8QR4/3Ue9TlCbetNJuPNBQQ7OHiB8=; b=nxeGKV5lLyIDxBrIRk
	LKDyyBonvhZ763M+TLAkLkXJQdV6hUdtZURiYU2Z4cWdHEDm6vZFgwiBf378gS47
	tzKvuwiCiVIUeELNNcwotQ6OM+6ZErJA+Y89k+MqAYjPbz9EbaM4vGn253vIVB54
	m7gub7TGvUmNd/d5jw6XuybuWjE0NY8Mt/O5Q24qGSxCTmBvCFeP51Nk6FNbyK8L
	yUR4Sc2CJci8JJoBrxPqx+HcxG5PQT07Vlwx4Smv0YAkLc3p+bAcKTjumSVvwU1a
	aqHdLO4fmoH7p6+SN3nUC8oRxVHUSDwZZUO2KOKh/4bLtggCvIRJVXRZPb8dY8xA
	SKbA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766867480; x=
	1766953880; bh=tC5qnG5bwx7xRT8QR4/3Ue9TlCbetNJuPNBQQ7OHiB8=; b=T
	gGICxCwwHsRsRiWDZwwKGXZzrgI3jiKpkvFHfLrs+YD5qp6G2CtXStWifJ6E821Z
	PvvMekIciOPrZt+v2vqsqEUqF21rb4qYG03WssaiLw4yuzAybhgS0MulWkLnfkZx
	lci3dFJsUHWMO4ifocxmhFASVDic5mF1/MIH94Lfc85mQuefGvNuZFqHFbK2mBAA
	NTcYLNr96u+ouxccSkB/XGGqbu7YcWWfCA90ZAdOE7s8WCz1zWlUZ0LXwAsYA9aL
	2mvB+zxV9aPMLXF4xBkb4eEwdgj19h7yr3b4kSaAbao6GfYALjSdumCmEgfDLAnZ
	BKbftt4vdzPcBb1ra56mw==
X-ME-Sender: <xms:F0JQaeA3lsAZwf9d7q-03Qcu7A3eCUP88uj7xqetKC25k6hRjOZuXA>
    <xme:F0JQaUgIYZnQxnrz_8802QrQuullLG5dRD-RWeHaU38CMP1fnnKY9jbtUu5eBGl0-
    lBa_DXl1-HsdGdjor307EFM2cBEm0Fi471qyvuo1liaigR2ug>
X-ME-Received: <xmr:F0JQaTyH5BCK1eekDZ89zwLI85QPnZS1OGddIgF11qnXHULwfn6VFiYQUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdejvdefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucforghr
    tgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedugffgieelueeu
    kedthfffledvhfejfeefheeuieekhfeludeljeejleegjeduffenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhi
    shhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeekpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopehnsggusehnsggurdhnrghmvgdprhgtphhtthho
    pehlohhrvghniihosehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrhiguvghrrdhlvg
    gvsehmvgguihgrthgvkhdrtghomhdprhgtphhtthhopehshhgrhihnvgdrtghhvghnsehm
    vgguihgrthgvkhdrtghomhdprhgtphhtthhopehsvggrnhdrfigrnhhgsehmvgguihgrth
    gvkhdrtghomhdprhgtphhtthhopehlihhnuhigqdifihhrvghlvghsshesvhhgvghrrdhk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmvgguihgrthgvkheslhhish
    htshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehrvghgrhgvshhsihhonhhs
    sehlihhsthhsrdhlihhnuhigrdguvghv
X-ME-Proxy: <xmx:F0JQad1c0Wg6SgHd8wfnlCq5-31mhK1R4b9UMqQJmm5FZzZTd0xvlg>
    <xmx:F0JQaQ_tbIPhsH7DPIcIGiYzx-jmqC2_tTG47Dg0kjAVZKMKYJ1ogw>
    <xmx:F0JQadoevWtgBRngZ3OgIrocdgcIGVKgJTyLeJJnzv02cJpt2Q5q4w>
    <xmx:F0JQaaQutse9s2rgz3EX08yteLtKLSbKtZR1cV8uNT-HoA5XhN9S5A>
    <xmx:GEJQaUvZWApJy5aib52YpU6r6F8HJn4n8jzNQ1bSd6D1-3GC9-HGgWmM>
Feedback-ID: i1568416f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 27 Dec 2025 15:31:18 -0500 (EST)
Date: Sat, 27 Dec 2025 21:31:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER" <linux-wireless@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	regressions@lists.linux.dev
Subject: strnlen buffer overflow in mt76_connac2_load_patch - 6.19-rc2
Message-ID: <aVBCFKub6vCFsFVB@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T9kD5aMDlTiT6Mn3"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_123124_660697_9EB95891 
X-CRM114-Status: UNSURE (   6.57  )
X-CRM114-Notice: Please train this message.
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


--T9kD5aMDlTiT6Mn3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 27 Dec 2025 21:31:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: "open list:MEDIATEK MT76 WIRELESS LAN DRIVER" <linux-wireless@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	regressions@lists.linux.dev
Subject: strnlen buffer overflow in mt76_connac2_load_patch - 6.19-rc2

Hi,

After updating to 6.19-rc2 I'm hitting the following panic on boot. It
worked in 6.18.2. It is a Xen HVM domU with PCI device attached, this
one specifically:

02:00.0 Network controller [0280]: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E =
80MHz [14c3:0608]

And the crash is:

    ------------[ cut here ]------------
    strnlen: detected buffer overflow: 17 byte read of buffer size 16
    WARNING: lib/string_helpers.c:1035 at __fortify_report+0x4f/0x90, CPU#1=
: kworker/1:1/51
    Modules linked in: mt7921e mt7921_common mt792x_lib mt76_connac_lib mt7=
6 intel_rapl_msr intel_rapl_common mac80211 ghash_clmulni_intel cfg80211 rf=
kill ehci_pci libarc4 pcspkr ehci_hcd igc ata_generic i2c_piix4 pata_acpi i=
2c_smbus serio_raw xen_scsiback target_core_mod xen_netback xen_privcmd xen=
_gntdev xen_gntalloc xen_blkback xen_evtchn i2c_dev fuse loop nfnetlink ove=
rlay xen_blkfront
    CPU: 1 UID: 0 PID: 51 Comm: kworker/1:1 Not tainted 6.19.0-0.rc2.1.qube=
s.1001.fc41.x86_64 #1 PREEMPT(full)=20
    Hardware name: Xen HVM domU, BIOS 4.19.4 12/21/2025
    Workqueue: events mt7921_init_work [mt7921_common]
    RIP: 0010:__fortify_report+0x4f/0x90
    Code: 48 83 fb 11 73 34 40 84 ed 48 c7 c0 02 62 d4 86 48 c7 c1 0c 62 d4=
 86 48 8b 34 dd 40 3d 54 86 48 0f 44 c8 48 8d 3d e1 af a5 01 <67> 48 0f b9 =
3a 48 83 c4 10 5b 5d e9 1c fb 4d ff 48 89 34 24 48 c7
    RSP: 0018:ffffd1b3801bbd38 EFLAGS: 00010246
    RAX: ffffffff86d46202 RBX: 0000000000000001 RCX: ffffffff86d46202
    RDX: 0000000000000011 RSI: ffffffff86d15c86 RDI: ffffffff8747f5c0
    RBP: 0000000000000000 R08: 0000000000000010 R09: ffffd1b380389000
    R10: ffffd1b3801bbc40 R11: 00000000ffffffff R12: 0000000000000000
    R13: ffffd1b380389000 R14: 0000000000001000 R15: 0000000000000000
    FS:  0000000000000000(0000) GS:ffff8d0ac8c52000(0000) knlGS:00000000000=
00000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 000076de8e89f001 CR3: 000000000f4bb000 CR4: 0000000000750ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
     ? request_firmware+0x3e/0x50
     __fortify_panic+0xd/0xf
     mt76_connac2_load_patch.cold+0x2b/0xe4 [mt76_connac_lib]
     mt792x_load_firmware+0x36/0x150 [mt792x_lib]
     mt7921_run_firmware+0x23/0xd0 [mt7921_common]
     mt7921e_mcu_init+0x4c/0x7a [mt7921e]
     mt7921_init_work+0x51/0x190 [mt7921_common]
     process_one_work+0x18d/0x340
     worker_thread+0x256/0x3a0
     ? __pfx_worker_thread+0x10/0x10
     kthread+0xfc/0x240
     ? __pfx_kthread+0x10/0x10
     ? __pfx_kthread+0x10/0x10
     ret_from_fork+0x126/0x190
     ? __pfx_kthread+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>
    ---[ end trace 0000000000000000 ]---
    ------------[ cut here ]------------
    kernel BUG at lib/string_helpers.c:1043!
    Oops: invalid opcode: 0000 [#1] SMP NOPTI
    CPU: 1 UID: 0 PID: 51 Comm: kworker/1:1 Tainted: G        W           6=
=2E19.0-0.rc2.1.qubes.1001.fc41.x86_64 #1 PREEMPT(full)=20
    Tainted: [W]=3DWARN
    Hardware name: Xen HVM domU, BIOS 4.19.4 12/21/2025
    Workqueue: events mt7921_init_work [mt7921_common]
    RIP: 0010:__fortify_panic+0xd/0xf
    Code: 44 8b 14 24 e9 12 dc 9c 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90=
 90 90 90 90 90 90 90 f3 0f 1e fa 40 0f b6 ff e8 e3 f3 9c 00 <0f> 0b 48 8b =
54 24 10 48 8b 74 24 08 4c 89 e9 48 c7 c7 16 5d d1 86
    RSP: 0018:ffffd1b3801bbd60 EFLAGS: 00010286
    RAX: ffffffff86d46202 RBX: 0000000000000000 RCX: ffffffff86d46202
    RDX: 0000000000000011 RSI: ffffffff86d15c86 RDI: ffffffff8747f5c0
    RBP: ffff8d0a4b752060 R08: 0000000000000010 R09: ffffd1b380389000
    R10: ffffd1b3801bbc40 R11: 00000000ffffffff R12: 0000000000000000
    R13: ffffd1b380389000 R14: 0000000000001000 R15: 0000000000000000
    FS:  0000000000000000(0000) GS:ffff8d0ac8c52000(0000) knlGS:00000000000=
00000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 000076de8e89f001 CR3: 000000000f4bb000 CR4: 0000000000750ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
     mt76_connac2_load_patch.cold+0x2b/0xe4 [mt76_connac_lib]
     mt792x_load_firmware+0x36/0x150 [mt792x_lib]
     mt7921_run_firmware+0x23/0xd0 [mt7921_common]
     mt7921e_mcu_init+0x4c/0x7a [mt7921e]
     mt7921_init_work+0x51/0x190 [mt7921_common]
     process_one_work+0x18d/0x340
     worker_thread+0x256/0x3a0
     ? __pfx_worker_thread+0x10/0x10
     kthread+0xfc/0x240
     ? __pfx_kthread+0x10/0x10
     ? __pfx_kthread+0x10/0x10
     ret_from_fork+0x126/0x190
     ? __pfx_kthread+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>
    Modules linked in: mt7921e mt7921_common mt792x_lib mt76_connac_lib mt7=
6 intel_rapl_msr intel_rapl_common mac80211 ghash_clmulni_intel cfg80211 rf=
kill ehci_pci libarc4 pcspkr ehci_hcd igc ata_generic i2c_piix4 pata_acpi i=
2c_smbus serio_raw xen_scsiback target_core_mod xen_netback xen_privcmd xen=
_gntdev xen_gntalloc xen_blkback xen_evtchn i2c_dev fuse loop nfnetlink ove=
rlay xen_blkfront
    ---[ end trace 0000000000000000 ]---
    RIP: 0010:__fortify_panic+0xd/0xf
    Code: 44 8b 14 24 e9 12 dc 9c 00 0f 1f 40 00 90 90 90 90 90 90 90 90 90=
 90 90 90 90 90 90 90 f3 0f 1e fa 40 0f b6 ff e8 e3 f3 9c 00 <0f> 0b 48 8b =
54 24 10 48 8b 74 24 08 4c 89 e9 48 c7 c7 16 5d d1 86
    RSP: 0018:ffffd1b3801bbd60 EFLAGS: 00010286
    RAX: ffffffff86d46202 RBX: 0000000000000000 RCX: ffffffff86d46202
    RDX: 0000000000000011 RSI: ffffffff86d15c86 RDI: ffffffff8747f5c0
    RBP: ffff8d0a4b752060 R08: 0000000000000010 R09: ffffd1b380389000
    R10: ffffd1b3801bbc40 R11: 00000000ffffffff R12: 0000000000000000
    R13: ffffd1b380389000 R14: 0000000000001000 R15: 0000000000000000
    FS:  0000000000000000(0000) GS:ffff8d0ac8c52000(0000) knlGS:00000000000=
00000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 00006225eb492548 CR3: 000000000e1b3000 CR4: 0000000000750ef0
    PKRU: 55555554
    Kernel panic - not syncing: Fatal exception
    Kernel Offset: 0x4c00000 from 0xffffffff80200000 (relocation range: 0xf=
fffffff80000000-0xffffffffbfffffff)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--T9kD5aMDlTiT6Mn3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmlQQhQACgkQ24/THMrX
1yyRfggAi22IXEhZpHNdJsYVfhyVs6aZSnIWhmKlFaTjWmpY/0+5NO7Cwz6L8GzG
HMFyLvHv/FFtUyL7gZ+iECR4bc1Wyc+0Jt5JZ8BtMInQ5QKyF508Cx0O1+0VS28W
gVcA7KPKg1rfZSMpwbacbWIpvV832PZ9l0Z16RYmDLItSZPy9SrkPwh99Qlr4bdX
Dg/cvLA7bLzFwL4m2JyUXjvNkejjw62XdomtEG07gaAok4ArOIdT3lT+1ccZlZt5
zHQmpaoouIL8QJGquqiEiawpNqXqeEr6PEYK8w5hLmiRskIrkUjYNatJ1xX7WoZ4
uZ/rzRyWYh265rmqYyi1gK3WeckzvQ==
=OC2x
-----END PGP SIGNATURE-----

--T9kD5aMDlTiT6Mn3--

