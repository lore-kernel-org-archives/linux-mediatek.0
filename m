Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D00ED47CA4
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 00:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwuVL82iUU8a0W2Xk5/sFQ1jVLVdV7Er1Z8kUcIS808=; b=enpd1JePpC6jlRlwdYXKUshpcA
	FT+TAOO6wLNQC3UWAXpPDAZmhlGZRlkfoUOj3a9h7VDn+oUj2twoNUUJlPRkxn1t3BGN4KW94lIoF
	nOGzPJOZ1GQo4pq73LFtOyPpg/Zj0wyvOzij4xqbHtqDExG+w/S68816eXymKu5gRyiDdwUw4VWDP
	D6LjuUbDKfgw+c7WNOfTOSxGIHoVqrKgsK6WkkMHU2aiGc514Uov7Qdp2XZOqj7CXNwZwkhHs511O
	kbqFyZL9aZlacMwVDNjZ5V5fvX3cF/PqiLZ1Zmu2qr3vex2uAvsrP74lepcuJM3F/7YgofJbdmY73
	GTo+bvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgXw1-0000000DNK9-26ND;
	Fri, 16 Jan 2026 00:43:29 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgXvy-0000000DNJo-18F1
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 00:43:27 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-64b5ed53d0aso2109031a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 16:43:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768524204; cv=none;
        d=google.com; s=arc-20240605;
        b=QEgo5ubihRvH+grNYsop0eduVZWXWf9DF63RnM4cq7hmPwOQPPniQOGOSmisx9kZH+
         nS/HpOdrAjVIboiRRRr27kbP0gd3dRc/PYvHHLwCLBLGFqmEI6sAWS44zS3jhEgS+Pbw
         5tH14gXRCSjRs/PncQ3DYgNKORCsod+GA0vTX2IFZ3TyD5B8LKh7jdxuXMNEcqznfbH9
         +fcYabzP/pYmkavsc9utq/XKFubXPARWYvGK2Qrv/z4K1wtz0byJTi2u8gYR9eg/rjEU
         wiiupIRJk7908hFBA5tIdsLKKqsQA5fok9sh+1r+XrJ8gqwIGQ90pN5TRFSSJu2m+sUO
         LnnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cwuVL82iUU8a0W2Xk5/sFQ1jVLVdV7Er1Z8kUcIS808=;
        fh=WAd3ZnDxX2nEBB4VGomFhcckoC4zIIykECXoe3+v1vE=;
        b=Pfbi/l8apE1grPuIBJUh+94Z86m1r/X8VpzotzbybE35PyzUQlsqhNiGzQ35gvMJSJ
         mZmI0cgeRhvBWmcrnhkcRz0bO6R5G1/Oe40hiaFOnEmFbck8FxT79PqrHWokZ3uvmSed
         Njng7sNqWoQbK/obgotxUB4wRBCi89gDxPOQuJ4YFg768YtatlqhqDyMfhnBaOkiJboC
         VyeVWBzn75xmIXQ9p0YK5r0N/pujdejMAAaAlhDDqFDewT+BncOq450wSyx/p7T6MaGo
         djq1QrsdAijjI1QtDzzK8EKLE/xaX7Iqk7LQtY4fk6H02Wc2RmpIYpg07jSfT6Yc7LTp
         HqUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768524204; x=1769129004; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwuVL82iUU8a0W2Xk5/sFQ1jVLVdV7Er1Z8kUcIS808=;
        b=jsyoy/ElWzQUCEMmrLgBjf5AZAlGklwzDEGAWjFQbY/7lFHOI1G2THdvgmTm1vr94q
         mCTIl4sWihiL+AlZbyUmds+2Xc4/Hixohorbe8PxNCuYxEdEwQm6kZ8UYGj7FxMQvSpD
         YlelZSGtPGaL5kN34aY2R0LcibnTeReWOphySjNgp/be5dSa7Mu7s+CHRmK4ZkP9DRzn
         sss4FvX/zKAWP14FUOeAACgYTDTKAjbn4JkaQJhw3S4UbTdq03S7FtBYihSdOjhLv8zq
         ovXcXf6Zrho7Ta+IdWTa9cf4/SHD3p9XF0M2UPe11ibggNCDRGLclOIdSY6OcAfTaj5Y
         YbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768524204; x=1769129004;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cwuVL82iUU8a0W2Xk5/sFQ1jVLVdV7Er1Z8kUcIS808=;
        b=AAbHPJuz2Iklk/BZHZRx8HOq9DWtt71SZGWF3ESXuZDLPQVWI6n389KVd5Hol6izp9
         WEMd20hV6plMgS2oUEZxbYkL1rG4129XpbwjfEEvZX5V19pAPFLc0cQP+WT2w07WXTdU
         sYc5DPu/wR7wZn92RErSdOWRSGit6oVraaK21ANhNFjbhqCcP3JLsrqr7jkOWAa//ukF
         YrAHxaCUjgjJH3AKTkt7AAtXcZwLL6pm+HsFY2WrldGFNFgOGPauBGmXypESQA3ZqNxt
         cyPZ8Dr1A1k0SJ3qgJbw3xjNwgjBk1VMwOeKDP5wztCib3PEhRHd5KKzS8kj4c2Bswm3
         jGXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfIFDyqpYBcSjLR1se84saproDfjyTjWAfyXx73o7KMqms3k40cjv/NudC5mCVUHtg8MTf/ESM2zJahdXbDA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv5Opxg6dcBXeBIim3nNBMl2TV4nmtrLrvNUm+EUdl214gSFKc
	6at+ez29enqDZLC2YkaBMb8lgrI6MPbhKfIk6AXoGEu25gQxUpFVXmgqafu9rgOucTK6Jn3dKvd
	3NoKlRnY71Ap38Y/soyrSBHpPp2J28E8=
X-Gm-Gg: AY/fxX6TgbzdddIBGD0AjkG+piYWT3R9CT/JB1JkaMy8punx28BNdUOR3J4JHWlnyg7
	oUcVM2VbZr7pv0JiNsoycjH076js2wqBthIQ1bC8vLvJmYeXeugenpxNJgFPYd1pXFHdGTIWwMK
	ZtL8rCGEhLrcgwDTa3aX6xpQJb8Q3IxSLzff9O541pyL/2C+RLDk3OhlcgY2ECL5wOum6ySTxE7
	E7qXvV3dQMQUXmVwGwCSImil4R0EoREbBXPS8ExLIOax/ZaQwbVz2idYDCjXxVa72wxhdePdbve
	Qnl2IdwkDId+dsYUgRr2R+BKxy7i5pHNu6iXRrtfB3u3qz4/g59FSRAqCA==
X-Received: by 2002:a05:6402:34d5:b0:653:b83b:a68c with SMTP id
 4fb4d7f45d1cf-654525cc828mr938649a12.12.1768524203776; Thu, 15 Jan 2026
 16:43:23 -0800 (PST)
MIME-Version: 1.0
References: <20260102200524.290779-1-zbowling@gmail.com> <20260105002638.668723-1-zbowling@gmail.com>
 <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
In-Reply-To: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
From: Zac Bowling <zbowling@gmail.com>
Date: Thu, 15 Jan 2026 16:43:12 -0800
X-Gm-Features: AZwV_QiQWd0l4pFMtboY8pSmZFwEXDJk9keC02GmxFPhpGPTVl1AFiYmqrG3qsc
Message-ID: <CAOFcj8SLxv7qX5_i5DJ0YScG0EVkWFO5Qj-eMfzo_xpW5ziwQg@mail.gmail.com>
Subject: Re: [PATCH v3 00/17] wifi: mt76: mt7925/mt792x: comprehensive
 stability fixes
To: Sean Wang <sean.wang@kernel.org>
Cc: deren.wu@mediatek.com, kvalo@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-wireless@vger.kernel.org, 
	lorenzo@kernel.org, nbd@nbd.name, ryder.lee@mediatek.com, 
	sean.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_164326_365111_692D7C27 
X-CRM114-Status: GOOD (  28.84  )
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

Hi Sean,

Thanks for testing this and catching that WARN. Good catch. Yeah, that
was my bug. One of my attempts to handle all error returns that my
static analyzer said was unhandled meant I didn't actually hit a
required callback because I early returned too soon. Patched it
locally already and it's my repo. Will send in just a sec after my
poor-mans stress finishes running tests. I found another bug this
morning too, I need to send with device resets coming out of suspend
and corrupted list from the past initialization.

Zac Bowling

On Thu, Jan 15, 2026 at 4:15=E2=80=AFPM Sean Wang <sean.wang@kernel.org> wr=
ote:
>
> Hi Zac,
>
> Thanks for sharing this series. Overall the patches look good to me,
> and I=E2=80=99m continuing more testing to ensure there are no regression=
s on
> mt7925 and mt7921 further
> But today I do hit a kernel WARN in the disconnect path (mac80211 BA
> session teardown) while testing v3 of the series
>
> [ 3373.120224] Hardware name: HP HP EliteBook 830 G6/854A, BIOS R70
> Ver. 01.22.00 10/14/2022
> [ 3373.120228] Workqueue: events_unbound cfg80211_wiphy_work [cfg80211]
> [ 3373.120367] RIP: 0010:__ieee80211_stop_tx_ba_session+0x295/0x350 [mac8=
0211]
> [ 3373.120570] Code: 11 0f 83 a3 00 00 00 48 c7 80 90 03 00 00 00 00
> 00 00 48 8b 7d 98 e8 4a 26 f3 fa 4c 89 ee 4c 89 ef e8 6f 16 0b fa 31
> c0 eb 93 <0f> 0b 31 c0 eb 8d b8 8e ff ff ff eb 86 48 8b 7d 98 e8 25 26
> f3 fa
> [ 3373.120576] RSP: 0018:ffffd00902ed7ba0 EFLAGS: 00010206
> [ 3373.120583] RAX: 0000000000010003 RBX: 0000000000000003 RCX: 000000000=
0000000
> [ 3373.120587] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000000=
0000000
> [ 3373.120591] RBP: ffffd00902ed7c10 R08: 0000000000000000 R09: 000000000=
0000000
> [ 3373.120596] R10: 0000000000000000 R11: 0000000000000000 R12: 000000000=
0000000
> [ 3373.120599] R13: ffff8a8433717540 R14: ffff8a83e0b20960 R15: ffff8a834=
d42c000
> [ 3373.120604] FS:  0000000000000000(0000) GS:ffff8a8477b03000(0000)
> knlGS:0000000000000000
> [ 3373.120608] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 3373.120626] CR2: 00007b9e0a8ba0d0 CR3: 000000009a440005 CR4: 000000000=
03726f0
> [ 3373.120631] Call Trace:
> [ 3373.120656]  <TASK>
> [ 3373.120664]  ieee80211_sta_tear_down_BA_sessions+0x53/0xe0 [mac80211]
> [ 3373.120836]  __sta_info_destroy_part1+0x48/0x550 [mac80211]
> [ 3373.120994]  __sta_info_flush+0x10e/0x230 [mac80211]
> [ 3373.121150]  ieee80211_set_disassoc+0x6b3/0x900 [mac80211]
> [ 3373.121293]  ? _printk+0x5f/0x90
> [ 3373.121330]  __ieee80211_disconnect+0xd6/0x1a0 [mac80211]
> [ 3373.121446]  ieee80211_beacon_connection_loss_work+0x6d/0xc0 [mac80211=
]
> [ 3373.121573]  cfg80211_wiphy_work+0xb4/0x190 [cfg80211]
> [ 3373.121779]  process_one_work+0x191/0x3e0
> [ 3373.121789]  worker_thread+0x2e3/0x420
> [ 3373.121796]  ? __pfx_worker_thread+0x10/0x10
> [ 3373.121802]  kthread+0x10d/0x230
> [ 3373.121810]  ? __pfx_kthread+0x10/0x10
> [ 3373.121818]  ret_from_fork+0x205/0x230
> [ 3373.121826]  ? __pfx_kthread+0x10/0x10
> [ 3373.121832]  ret_from_fork_asm+0x1a/0x30
> [ 3373.121842]  </TASK>
> [ 3373.121844] ---[ end trace 0000000000000000 ]---
> [ 3373.128750] ------------[ cut here ]------------
> [ 3373.128757] WARNING: CPU: 1 PID: 14854 at net/mac80211/agg-tx.c:398
> __ieee80211_stop_tx_ba_session+0x295/0x350 [mac80211]
>
> I=E2=80=99m currently bisecting the series to identify which patch trigge=
rs it
> and will follow up once I have clearer results.
> Thanks again for the work and the DKMS setup.
>
>                  Sean
>
> On Sun, Jan 4, 2026 at 6:27=E2=80=AFPM Zac Bowling <zbowling@gmail.com> w=
rote:
> >
> > From: Zac Bowling <zac@zacbowling.com>
> >
> > This patch series addresses kernel panics, system deadlocks, and variou=
s
> > stability issues in the MT7925 WiFi driver. The issues were discovered =
on
> > kernel 6.17 (Ubuntu 25.10) and fixes were developed and tested on 6.18.=
2.
> >
> > These patches are based on the wireless tree (nbd168/wireless.git) as
> > requested by Sean Wang.
> >
> > =3D=3D Problem Description =3D=3D
> >
> > The MT7925 driver has several bugs that cause:
> > - Kernel NULL pointer dereferences during BSSID roaming
> > - System-wide deadlocks requiring hard reboot
> > - Firmware reload failures after suspend/resume
> > - Key removal errors during MLO roaming
> >
> > These issues manifest approximately every 5 minutes when the adapter
> > tries to switch to a better BSSID, particularly in enterprise environme=
nts
> > with multiple access points.
> >
> > =3D=3D Root Causes =3D=3D
> >
> > 1. Missing mutex protection around ieee80211_iterate_active_interfaces(=
)
> >    when the callback invokes MCU functions (patches 2, 3, 16)
> >
> > 2. NULL pointer dereferences where mt792x_vif_to_bss_conf(),
> >    mt792x_sta_to_link(), and similar functions return NULL during
> >    MLO state transitions but results are not checked (patches 1, 4, 5,
> >    9, 10, 14, 17)
> >
> > 3. Ignored MCU return values hiding firmware errors (patches 6, 7, 8)
> >
> > 4. WARN_ON_ONCE used where NULL is expected during normal MLO AP
> >    setup (patch 13)
> >
> > 5. Firmware semaphore not released after failed load attempts (patch 15=
)
> >
> > 6. Key removal returning error when link is already torn down (patch 12=
)
> >
> > =3D=3D Testing =3D=3D
> >
> > Stress tested by hammering the driver with custom test script.
> >
> > Tested on:
> > - Framework Desktop (AMD Ryzen AI Max 300 Series) with MT7925 (RZ717)
> > - This whole patch series was tested on Kernel 6.18.2 and 6.17.12 (Ubun=
tu 25.10)
> > - Enterprise WiFi environment with multiple WIFI 7 APs with MLO enabled
> >
> > Before patches: System hangs/panics every 5-15 minutes during BSSID roa=
ming
> > After patches: Stable for 24+ hours under continuous stress testing
> >
> > =3D=3D Crash Traces Fixed =3D=3D
> >
> > Primary NULL pointer dereference:
> >   BUG: kernel NULL pointer dereference, address: 0000000000000010
> >   Workqueue: mt76 mt7925_mac_reset_work [mt7925_common]
> >   RIP: 0010:mt76_connac_mcu_uni_add_dev+0x9c/0x780 [mt76_connac_lib]
> >   Call Trace:
> >    mt7925_vif_connect_iter+0xcb/0x240 [mt7925_common]
> >    __iterate_interfaces+0x92/0x130 [mac80211]
> >    ieee80211_iterate_interfaces+0x3d/0x60 [mac80211]
> >    mt7925_mac_reset_work+0x105/0x190 [mt7925_common]
> >
> > Deadlock trace:
> >   INFO: task kworker/u128:0:48737 blocked for more than 122 seconds.
> >   Workqueue: mt76 mt7925_mac_reset_work [mt7925_common]
> >   Call Trace:
> >    __mutex_lock.constprop.0+0x3d0/0x6d0
> >    mt7925_mac_reset_work+0x85/0x170 [mt7925_common]
> >
> > =3D=3D Related Links =3D=3D
> >
> > Framework Community discussion:
> > https://community.frame.work/t/kernel-panic-from-wifi-mediatek-mt7925-n=
ullptr-dereference/79301
> >
> > OpenWrt GitHub issues:
> > https://github.com/openwrt/mt76/issues/1014
> > https://github.com/openwrt/mt76/issues/1036
> >
> > GitHub repository with additional analysis:
> > https://github.com/zbowling/mt7925
> >
> > Zac Bowling (17):
> >   wifi: mt76: mt7925: fix NULL pointer dereference in vif iteration
> >   wifi: mt76: mt7925: fix missing mutex protection in reset and ROC abo=
rt
> >   wifi: mt76: mt7925: fix missing mutex protection in runtime PM and ML=
O PM
> >   wifi: mt76: mt7925: add NULL checks in MCU STA TLV functions
> >   wifi: mt76: mt7925: add NULL checks for link_conf and mlink in main.c
> >   wifi: mt76: mt7925: add error handling for AMPDU MCU commands
> >   wifi: mt76: mt7925: add error handling for BSS info MCU command in st=
a_add
> >   wifi: mt76: mt7925: add error handling for BSS info in key setup
> >   wifi: mt76: mt7925: add NULL checks in MLO link and chanctx functions
> >   wifi: mt76: mt792x: fix NULL pointer dereference in TX path
> >   wifi: mt76: mt7925: add lockdep assertions for mutex verification
> >   wifi: mt76: mt7925: fix key removal failure during MLO roaming
> >   wifi: mt76: mt7925: fix kernel warning in MLO ROC setup
> >   wifi: mt76: mt7925: add NULL checks for MLO link pointers in MCU func=
tions
> >   wifi: mt76: mt792x: fix firmware reload failure after previous load c=
rash
> >   wifi: mt76: mt7925: add mutex protection in resume path
> >   wifi: mt76: mt7925: add NULL checks in link station and TX queue setu=
p
> >
> >  drivers/net/wireless/mediatek/mt76/mt792x_core.c | 27 +++++++++++++++-
> >  drivers/net/wireless/mediatek/mt76/mt7925/mac.c  |  8 +++++
> >  drivers/net/wireless/mediatek/mt76/mt7925/main.c | 95 ++++++++++++++++=
+++++---
> >  drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  | 52 ++++++++++++++--=
-
> >  drivers/net/wireless/mediatek/mt76/mt7925/pci.c  |  6 +++
> >  5 files changed, 170 insertions(+), 18 deletions(-)
> >
> > --
> > 2.51.0
> >

