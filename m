Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A1F9C369D1
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 13:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6id9f3WgauE77b1ncdI98pPy6plVxIz+rqbVv+3POCU=; b=jLfDLWCPekJOprwRSH0exd9+m/
	KjxionStuUbQG7bDG8DEBB+QCV/auiI0GQKa7IHzyyuG+T5lY56TGfIOazQhqY0o2lx/dBmQFQN11
	htQt/abZlayRhfXmzotCf5TTZTxwsQnTsp2dmFmhd1+1VWCvhrlxO30JOJEet7z27OGNZpN77yNj8
	6al7F8qkuWqS1jjGY/vIHZCiAqZsMqfAemVPNAUKhUBPpol/SADX1BEcRZ2P3lYi67NrLxxP6fc8N
	VCPkmV1oRWOvgNplssi81r28W687mZtg5YBE2ydAqOaEQ0nECvuOEk35Lakh6ooUFwUscMcWa1yzW
	Ld9VDDtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Zmv-0000000AWu3-0Ro9;
	Wed, 23 Apr 2025 13:05:17 +0000
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcVjN-00000003DKP-0PrB
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Jan 2025 20:29:14 +0000
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6dcdf23b4edso45277846d6.0
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jan 2025 12:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738009751; x=1738614551; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6id9f3WgauE77b1ncdI98pPy6plVxIz+rqbVv+3POCU=;
        b=kWA1RnFjhQPl8FTHKtatjIUq19vLBbD8INsGicRZOIZKq4SNplxBFl4J+y4ELKuwWG
         ms1slEb1BIS8y9zPyGJBHGo/7FQD6y5q8kyGlPROv755jkeekyJw2hsQZWlzUMhmhJXB
         oIHqiv07hRzFHsbpc3ewf5mcJV1dpAX8QQh5EvHczp3mJWt8/DmZWqU4UU5VzZxDiAdE
         gGjNw5+EHWjQorAj87a7mKYcRG2tp1TSxuSo/mEgTbNSWEZ5vWg6nUkOLd6VTp9sB+yd
         Y5yvlxTWv2W6qXTlPCPbPQYFIFQ306lD4ke0nNN45GvVio2VcdnYGRrJ/sUXkOasDJRm
         lyAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738009751; x=1738614551;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6id9f3WgauE77b1ncdI98pPy6plVxIz+rqbVv+3POCU=;
        b=wp4e3B/L5bsRK0EW2+ZoWUQiBuxTRonZ54+7LRfkQVFzYVfBdwopcrofjJoWi1pbTF
         Q3enCm/8KYtedZTYv9ZEPEPgOYwsAXjUW4gtiKPrnBUNle11PtFTFV2O25HI3WHkt5GN
         KHYRGMlropBPDq/ztoQZsILsWGOCVjESnfC1i40bv6D0PmL9QBQTfL5XvBxrthHKwUjX
         1gmWBWIilfdk45mVez+pCaLr81AY5TNXidpCHD2yCoO6rXqtnYiCTY/zcJ+X5nT9mg3L
         LC7ngnTu43dTkJKfU+zhVkHOUNyN6VlC4dexDxYv7Ewf2q0Auazxx5EftWlWLqcSznHt
         XMKw==
X-Forwarded-Encrypted: i=1; AJvYcCV5EulCJ/P6qPMvCVX8Al5/x3ZyU2G3JXQSOVOHCUJ8eCMxKskYOSwum7l+a9XXjvDJmIWfLrKfRhzC4v/N8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkNklbsxc0pRhqE76d1XBZRvijnlKaj3+JGBic9Vlm1R/XIa1R
	F0mbTtr4tn4lTy56CDtQVruEWyoo2sapCnsePbFOwfiKqivzT8P/
X-Gm-Gg: ASbGncuxjVRYoew0azvDe0rEfidm13EbdgT14SOeK/UlBEcykDvF50qWH2aG0TRMsdl
	r82xU8Q7p8nLa6u2L0VL11qS+jjjzASVpzx2ts5uyrdyZLkY5yx5chzKWaDNmfQ9YgAglAXWpWa
	7/YB04JuWo7/qiXIbnxnSYI0wr3ZXBDZY0rDnS42WYndbMCu5UeX+kD6qCcNBzkeUHzNUmHP2HN
	iVnfF2KTAu3c0/QTf1TVCZjNihsIgCossKZEuJBZVejVJFmpzw+7eFYcnEX/vI4an9qqYLKu7dx
	dRGHu6B3bXQPYITOV+dVRZRvkK7YY/mZ7KM4Sez8IXRhwbROygn2UbKvYHa9islYdmPfjRvP
X-Google-Smtp-Source: AGHT+IFBvJKB9/271x7EC/HbpLXtXmNS0EldRKCcWmYXWl2xmcN9HQj8IOMAWLBYzZocdoSnhtC2Fw==
X-Received: by 2002:a05:6214:4988:b0:6dd:5f90:16bd with SMTP id 6a1803df08f44-6e1b22349dbmr623768666d6.41.1738009751330;
        Mon, 27 Jan 2025 12:29:11 -0800 (PST)
Received: from ?IPv6:2600:4041:5b0d:f100:fec2:7085:7ce5:711c? ([2600:4041:5b0d:f100:fec2:7085:7ce5:711c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e2051369a1sm37908016d6.3.2025.01.27.12.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 12:29:10 -0800 (PST)
Message-ID: <77358eda94737ae3b98cfb40e96d40a829712b2b.camel@gmail.com>
Subject: Follow-Up: mt7915e card fails to init on Linux 6.3 and newer
From: Jared Van Bortel <jared.e.vb@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Mon, 27 Jan 2025 15:29:10 -0500
In-Reply-To: <3600f032dc921e44459c266aab76806428267c5e.camel@gmail.com>
References: <3600f032dc921e44459c266aab76806428267c5e.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 
MIME-Version: 1.0
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_122913_139986_F453E253 
X-CRM114-Status: GOOD (  21.14  )
X-Mailman-Approved-At: Wed, 23 Apr 2025 04:25:00 -0700
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

Hi. Just following up since I haven't seen a reply yet. The original e-
mail follows. I would like to get the eyes of a maintainer on this.

On Sun, 2025-01-19 at 21:24 -0500, Jared Van Bortel wrote:
> Hi all,
>=20
> I recently purchased a WallysTech DR7915 mPCIe Wi-Fi card (PCI ID
> 14c3:7915) for my ThinkPad W500. It is ostensibly based on the MT7915
> and MT7975 chips, using the mt7915e driver. I tried it on linux-stable
> 6.12.10 and was unable to get it to work. But it works fine on 6.1
> LTS.
>=20
> (As an aside - why is the latest firmware provided by mainline Linux
> version 20220929104113a, while OpenWRT is providing 20240429200502?)
>=20
> I bisected the issue to commit
> 9e81c2c7b9af6a5f160e0a9a7f009c37910402ee
> ("wifi: mt76: mt7915: enable per-phy led support"), which is included
> in
> kernel 6.3. This is what I get in dmesg before this commit (good
> behavior):
>=20
> [=C2=A0=C2=A0 34.976575] mt7915e 0000:03:00.0: HW/SW Version: 0x8a108a10,=
 Build
> Time: 20220929104113a
> [=C2=A0=C2=A0 34.990089] mt7915e 0000:03:00.0: WM Firmware Version: ____0=
00000,
> Build Time: 20220929104145
> [=C2=A0=C2=A0 35.012664] mt7915e 0000:03:00.0: WA Firmware Version: DEV_0=
00000,
> Build Time: 20220929104205
> [=C2=A0=C2=A0 35.178619] mt7915e 0000:03:00.0 wlp3s0: renamed from wlan0
> [=C2=A0=C2=A0 44.588223] wlan0: authenticate with XX:XX:XX:XX:XX:XX
> [=C2=A0=C2=A0 44.598831] wlan0: send auth to XX:XX:XX:XX:XX:XX (try 1/3)
> [=C2=A0=C2=A0 44.601589] wlan0: authenticate with XX:XX:XX:XX:XX:XX
> [=C2=A0=C2=A0 44.601594] wlan0: send auth to XX:XX:XX:XX:XX:XX (try 1/3)
> [=C2=A0=C2=A0 44.611058] wlan0: authenticate with XX:XX:XX:XX:XX:XX
> [=C2=A0=C2=A0 44.611064] wlan0: send auth to XX:XX:XX:XX:XX:XX (try 1/3)
> [=C2=A0=C2=A0 44.612714] wlan0: authenticated
>=20
> This is what I get after that commit (bad behavior):
>=20
> [=C2=A0=C2=A0 37.507795] mt7915e 0000:03:00.0: HW/SW Version: 0x8a108a10,=
 Build
> Time: 20220929104113a
> [=C2=A0=C2=A0 37.521157] mt7915e 0000:03:00.0: WM Firmware Version: ____0=
00000,
> Build Time: 20220929104145
> [=C2=A0=C2=A0 37.541817] mt7915e 0000:03:00.0: WA Firmware Version: DEV_0=
00000,
> Build Time: 20220929104205
> [=C2=A0=C2=A0 37.707782] mt7915e 0000:03:00.0 wlp3s0: renamed from wlan0
> [=C2=A0=C2=A0 42.984991] pcieport 0000:00:1c.1: pciehp: Slot(1-2): Link D=
own
> [=C2=A0=C2=A0 42.984999] pcieport 0000:00:1c.1: pciehp: Slot(1-2): Card n=
ot
> present
> [=C2=A0=C2=A0 64.651072] mt7915e 0000:03:00.0: Message 00001eed (seq 9) t=
imeout
> [=C2=A0=C2=A0 85.131081] mt7915e 0000:03:00.0: Message 000007ed (seq 11) =
timeout
> [=C2=A0=C2=A0 85.132693] mt7915e 0000:03:00.0 wlp3s0f0: renamed from wlan=
0
> [=C2=A0 105.614421] mt7915e 0000:03:00.0: Message 000007ed (seq 1) timeou=
t
> [=C2=A0 107.701101] mt7915e 0000:03:00.0: Timeout for initializing firmwa=
re
> [=C2=A0 107.701154] mt7915e 0000:03:00.0: Failed to exit mcu
> [=C2=A0 107.844646] pci 0000:03:00.0: Removing from iommu group 6
> [=C2=A0 107.844679] pcieport 0000:00:1c.1: pciehp: Slot(1-2): Card presen=
t
> [=C2=A0 109.541013] pcieport 0000:00:1c.1: pciehp: Slot(1-2): No link
> [=C2=A0 109.541024] pcieport 0000:00:1c.1: pciehp: Slot(1-2): Card presen=
t
> [=C2=A0 111.234338] pcieport 0000:00:1c.1: pciehp: Slot(1-2): No link
>=20
> On kernel 6.12.10, this failure leads to a page fault, sometimes
> immediately:
>=20
> [=C2=A0 127.807503] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] mt7915e 0000:03:00.0: =
Message 00001eed (seq
> 7) timeout
> [=C2=A0 127.914244] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] BUG: unable to handle =
page fault for
> address: ffffabc5c0628ff0
> [=C2=A0 127.914294] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] #PF: supervisor write =
access in kernel mode
> [=C2=A0 127.914329] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] #PF: error_code(0x0002=
) - not-present page
> [=C2=A0 127.914363] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] PGD 100000067 P4D 1000=
00067 PUD 100209067
> PMD 103e7f067 PTE 0
> [=C2=A0 127.914406] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] Oops: Oops: 0002 [#1] =
PREEMPT SMP NOPTI
> [=C2=A0 127.914429] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] CPU: 0 UID: 0 PID: 73 =
Comm: kworker/u16:6
> Kdump: loaded Tainted: G=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 I=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.12.10-arch1-1 #1
> ac0cff2c6581af0a10f6e278cbc98026cc1e3dec
> [=C2=A0 127.914489] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] Tainted: [I]=3DFIRMWAR=
E_WORKAROUND
> [=C2=A0 127.914510] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] Hardware name: LENOVO =
40612ZU/40612ZU, BIOS
> 6FET93WW (3.23 ) 10/12/2012
> [=C2=A0 127.914538] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] Workqueue: mt76 mt7915=
_mac_reset_work
> [mt7915e]
> [=C2=A0 127.914578] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] RIP: 0010:mt76_dma_rx_=
fill+0x157/0x4c0
> [mt76]
> [=C2=A0 127.914615] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] Code: 8b 54 24 40 85 c=
0 4c 8b 44 24 18 4c 8b
> 4c 24 20 4c 8b 5c 24 28 0f 88 2a 03 00 00 c1 e0 10 44 89 ce 44 09 d8
> 81 ce 00 01 00 00 <45> 89 34 24 41 89 44 24 08 41 89 74 24 04 41 c7 44
> 24 0c 00 00 00
> [=C2=A0 127.914677] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] RSP: 0018:ffffabc5c03a=
fcf8 EFLAGS: 00010246
> [=C2=A0 127.914699] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] RAX: 0000000000000000 =
RBX: ffff9b694630d800
> RCX: 0000000000000000
> [=C2=A0 127.914726] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] RDX: 0000000000000000 =
RSI: 0000000006c00000
> RDI: 0000000000000000
> [=C2=A0 127.914753] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] RBP: ffff9b6947ef45d8 =
R08: ffff9b6948210000
> R09: 0000000006c00000
> [=C2=A0 127.914779] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] R10: 00000000000006c0 =
R11: 0000000000000000
> R12: ffffabc5c0628ff0
> [=C2=A0 127.914806] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] R13: ffff9b69c630d800 =
R14: 00000000ffd15800
> R15: 0000000000000000
> [=C2=A0 127.914833] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] FS:=C2=A0 000000000000=
0000(0000)
> GS:ffff9b6a77c00000(0000) knlGS:0000000000000000
> [=C2=A0 127.914868] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] CS:=C2=A0 0010 DS: 000=
0 ES: 0000 CR0:
> 0000000080050033
> [=C2=A0 127.914891] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] CR2: ffffabc5c0628ff0 =
CR3: 000000004b622000
> CR4: 00000000000426f0
> [=C2=A0 127.914918] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] Call Trace:
> [=C2=A0 127.914930] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 <TASK>
> [=C2=A0 127.914942] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 ? __die_body.col=
d+0x19/0x27
> [=C2=A0 127.914967] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 ? page_fault_oop=
s+0x15a/0x2d0
> [=C2=A0 127.914992] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 ? search_bpf_ext=
ables+0x5f/0x80
> [=C2=A0 127.915016] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 ? exc_page_fault=
+0x18a/0x190
> [=C2=A0 127.915035] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 ? asm_exc_page_f=
ault+0x26/0x30
> [=C2=A0 127.915056] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 ? mt76_dma_rx_fi=
ll+0x157/0x4c0 [mt76
> 8ebc1f1034fdcf4b82c21f7f79b6854fd3dd0e30]
> [=C2=A0 127.915096] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 ? mt76_dma_rx_fi=
ll+0x1ef/0x4c0 [mt76
> 8ebc1f1034fdcf4b82c21f7f79b6854fd3dd0e30]
> [=C2=A0 127.915137] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 ? mt76_dma_rx_cl=
eanup.part.0+0x5e/0x160
> [mt76 8ebc1f1034fdcf4b82c21f7f79b6854fd3dd0e30]
> [=C2=A0 127.915185] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 ? mt76_dma_rx_cl=
eanup.part.0+0x6c/0x160
> [mt76 8ebc1f1034fdcf4b82c21f7f79b6854fd3dd0e30]
> [=C2=A0 127.915233] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 mt7915_dma_reset=
+0x1e1/0x230 [mt7915e
> 7945e3c7bfde237a78fef4a04127eb6221537724]
> [=C2=A0 127.915280] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 mt7915_mac_reset=
_work+0x67e/0xcd0 [mt7915e
> 7945e3c7bfde237a78fef4a04127eb6221537724]
> [=C2=A0 127.915323] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 process_one_work=
+0x17b/0x330
> [=C2=A0 127.915343] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 worker_thread+0x=
2ce/0x3f0
> [=C2=A0 127.915365] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 ? __pfx_worker_t=
hread+0x10/0x10
> [=C2=A0 127.915389] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 kthread+0xcf/0x1=
00
> [=C2=A0 127.915406] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 ? __pfx_kthread+=
0x10/0x10
> [=C2=A0 127.915428] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 ret_from_fork+0x=
31/0x50
> [=C2=A0 127.915449] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 ? __pfx_kthread+=
0x10/0x10
> [=C2=A0 127.915470] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 ret_from_fork_as=
m+0x1a/0x30
> [=C2=A0 127.915494] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 </TASK>
> [=C2=A0 127.915507] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] Modules linked in: mt7=
915e mt76_connac_lib
> mt76 mac80211 libarc4 cfg80211 snd_seq_dummy snd_hrtimer snd_seq
> snd_seq_device ip6t_REJECT nf_reject_ipv6 ipt_REJECT xt_multiport
> xt_cgroup xt_mark xt_owner xt_tcpudp nft_compat amdgpu amdxcp drm_exec
> gpu_sched nft_masq drm_buddy nft_ct nft_reject_ipv4 nf_reject_ipv4
> nft_reject act_csum cls_u32 sch_htb nft_chain_nat nf_nat nf_conntrack
> nf_defrag_ipv6 nf_defrag_ipv4 nf_tables bridge stp llc btusb btrtl
> btintel btbcm btmtk bluetooth crc16 joydev mousedev snd_hda_codec_hdmi
> snd_hda_codec_conexant kvm_intel iTCO_wdt snd_hda_codec_generic
> intel_pmc_bxt radeon snd_hda_intel mei_wdt iTCO_vendor_support
> snd_intel_dspcfg kvm i2c_algo_bit snd_intel_sdw_acpi pcmcia i2c_i801
> drm_suballoc_helper snd_hda_codec drm_ttm_helper i2c_smbus
> snd_hda_core sha512_ssse3 ttm i2c_mux sha1_ssse3 snd_hwdep
> yenta_socket psmouse acpi_cpufreq pcspkr e1000e r592 pcmcia_rsrc
> pktcdvd mei_me snd_pcm memstick ptp drm_display_helper pcmcia_core
> lpc_ich intel_agp snd_timer mei pps_core cec intel_gtt
> [=C2=A0 127.915596] [=C2=A0=C2=A0=C2=A0=C2=A0 T73]=C2=A0 think_lmi mac_hi=
d firmware_attributes_class
> wmi_bmof coretemp thinkpad_acpi platform_profile sparse_keymap rfkill
> snd soundcore video wmi sg crypto_user dm_mod loop nfnetlink ip_tables
> x_tables btrfs blake2b_generic libcrc32c crc32c_generic serio_raw
> sdhci_pci xor atkbd raid6_pq libps2 vivaldi_fmap firewire_ohci cqhci
> sr_mod sdhci firewire_core sha256_ssse3 mmc_core cdrom i8042 crc_itu_t
> serio
> [=C2=A0 127.916035] [=C2=A0=C2=A0=C2=A0=C2=A0 T73] CR2: ffffabc5c0628ff0
>=20
>=20
> It would be nice to be able to use this card on a more recent kernel.
> I
> can assist with debugging and testing, assuming I haven't somehow
> gotten
> a defective unit - but I don't think that would really explain why I
> can
> use it just fine on 6.1 LTS.
>=20
> Thanks,
> Jared Van Bortel

