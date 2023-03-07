Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EC8C678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 18:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9ls87AUqXtQuQdmuxvYZphUw05BBFcV2MURS2q3dHo=; b=t6kv1prW49mYG64Ki1sd/F7JJa
	RAgLyA7tN4T5D3i25Gej2hBGDcmG3c/LTYsF6rA2uOEH7nl6ApUmrWnFVbvz0XSDhX6XQB1t0zEdx
	+nD8UlFysJu3tJjR+QGK/tujuob/4kNXAFISsO7ByL+/oNJ1yrxr3NukhRafUfO9Nz2d4DuUReN34
	A7SVXuTk18/8M7OzA9fIq4g+AG9R8WuvjoxvjvfKZw1p1tTyrJigoSJmKj+y95dQJyumbpM/96S4V
	onTJ95KJDXh99cPNDbSOPp99dqObrShHn4NxWDsLoFsfltmNaX5zTupvEFdcrkKGITAn2897vB9Rh
	3y8YNaoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcR5-0027bA-EA; Tue, 07 Mar 2023 18:53:19 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcR2-0027YW-5W; Tue, 07 Mar 2023 18:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1678215174; i=frank-w@public-files.de;
	bh=k9ls87AUqXtQuQdmuxvYZphUw05BBFcV2MURS2q3dHo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c635wzwuK2vPcW8SjHeAxKwkqSfGfh9C0ehHGHaD8ap5/aZlNLTTJ+ql8ftZerxgq
	 3oDkmKc32OjNP86UiTv/bp6YN0hBFRa+3HUTai8cOwEYJJozgadqcC0MPpsdYMxH4m
	 77HmILE0kF1GPCeVfGsEgueUBeRXiPrqur0E5mIqrDXeyQvtuJF727aGVmogTj3L0m
	 biDE7Pdn18zMK7gVdAD7MzVmJUuogNjAsuBUhrEFdQ9hoafED1f3TVPJhCQrf7d4Dp
	 4gGw3hSkuuMyMRY9G/MpLJVvh8mcKBM01frjT2kIvt2N7T4/xwhSPFTGEuYFyPKM88
	 IIX2EegMcPmKA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.156.24] ([217.61.156.24]) by web-mail.gmx.net
 (3c-app-gmx-bs16.server.lan [172.19.170.68]) (via HTTP); Tue, 7 Mar 2023
 19:52:54 +0100
MIME-Version: 1.0
Message-ID: <trinity-4b8f5f5f-55fe-4c7c-9ba6-d903c722d0d8-1678215174716@3c-app-gmx-bs16>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Russell
 King <linux@armlinux.org.uk>, Heiner Kallweit <hkallweit1@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang
 <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir
 Oltean <vladimir.oltean@nxp.com>, Jianhui Zhao <zhaojh329@gmail.com>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, Alexander Couzens
 <lynxis@fe80.eu>
Subject: Aw: [PATCH net-next v12 08/18] net: ethernet: mtk_eth_soc: fix
 1000Base-X and 2500Base-X modes
Content-Type: text/plain; charset=UTF-8
Date: Tue, 7 Mar 2023 19:52:54 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <fd5c7ea79a7f84caac7d0b64b39fe5c4043edfa8.1678201958.git.daniel@makrotopia.org>
References: <cover.1678201958.git.daniel@makrotopia.org>
 <fd5c7ea79a7f84caac7d0b64b39fe5c4043edfa8.1678201958.git.daniel@makrotopia.org>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:ES5k/UBa3QqaRIr9k0VcmOXcFh0bykQJLKCIgGmd/YebGxi28WQ/EcN+n7mMf+t0YkaCy
 Y4897TVRC1SPVCFsi/uYPVwNKBdUpeRan3iRALEpNX1BKVJ7NWo7tZm//nuGZPenHExqoeI+dKKN
 VN6Cu2y+0iYztONsYUKBmW9UoqsHg/XLbwmDdbXOAo1i1FVhz6i9OvdB6Q2zmHE7u4xNzAxyTYsH
 OxyamxZFKelQJuufRPUa5QumyakVh0qvBi71r/B98Fa0QqgnObZiX3Scg7b9G54HL02TLA9kel/y
 G8=
UI-OutboundReport: notjunk:1;M01:P0:4h4kEjkhaiU=;dI5ucOYtvHC9hF7eodeX8AoWNCf
 T/39mVButQZ0rIfz1wOBiFAU0K7LDUFSLVb89Wj/gG+PdVNi6C6k98QH4b1QePr3G3TEQAiTl
 Tp6lyFJpfHey5UpRukmFMTU/G8p1cPSTSrGm3fIy5ANKDYI6HGlObpp0yzo5UGTNo+7pRk+9C
 hUNHxyeGZYWz/y3N/jt2OT9tEPFBBeLE4BGf61SPCI8da1vM0pR4g8erpUqwhGzZnA1hyiyKe
 Xt53Led9PP+2ns8/ovTFiHvVv/XLZcmffbBDu0n1RUiX+CY/DJX71pdNR+cNuPzvLG0CAe12z
 42RiYtYJ3Gd9uyf42rd6VNbHo3aVB+XXt5Fb1xnzPK643Km1cU7a1lLs+vGH29M4zcboD7cmx
 cFm48ExY8bFuSMG9Bd0nWOTt5GhTLrkcdV/9p+zmrvXYWLz9oXeuzOMWVwUxR57bFtOwe8Egw
 rDLRjCdLqGV0zV9dMLKaZQqwi0qO7kTLodN+K3JNGXaItK33zzyCsAi8eKr6S12ClPhM0R/F2
 1xSYQc3n1HAW1MhX1Ah1deBXM7xLuob+ztd6eZSKcMR2XalosCznLHzcMTZa+qPSgERUg6TJj
 ra+oVcuqV0YEhYTipc31GBpFU36Ox7tFSLNuGJwOb/TdGmkZEy3LV9DV/xHvQoGiF85Hzztqf
 vBpwIIizFyg0UOWCEFkRyrBN+jMA6c4ty5JriIT+TL0Lm8OnkLmJhIS7HmphPlhRLaZAHr16X
 m7HG3LhywQhZlAAQWecglQCA8mqbfiW1RDy8ceYy6a63/204uZnX+BTW/ScoAeaTTe7wk+1Nm
 qWV9HNLnhkrSLWF6JgwwbD+8CpFoVf69T+PMeIm2a8e1s=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_105316_552465_5AE51DB2 
X-CRM114-Status: GOOD (  13.57  )
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

> Gesendet: Dienstag, 07=2E M=C3=A4rz 2023 um 16:53 Uhr
> Von: "Daniel Golle" <daniel@makrotopia=2Eorg>
>
> After conversion to phylink_pcs the 1000Base-X and 2500Base-X modes
> would work only after `ethtool -s eth1 autoneg off`=2E
> As ethtool autoneg and the ETHTOOL_LINK_MODE_Autoneg_BIT is supposed
> to control auto-negotiation on the external interface it doesn't make
> much sense to use it to control on-board SGMII auto-negotiation between
> MAC and PHY=2E
> Set correct values to really only enable SGMII auto-negotiation when
> actually operating in SGMII mode=2E For 1000Base-X and 2500Base-X mode,
> enable remote-fault detection only if in-band-status is enabled=2E
> This fixes using 1000Base-X and 2500Base-X SFPs on the BananaPi R3
> board and also makes it possible to use interface-mode-switching PHYs
> operating in either SGMII mode for 10M/100M/1000M or in 2500Base-X for
> 2500M mode on other boards=2E

Hi,

have tested Parts 1-12 this on bananapi-r3 (mt7986) with 1G Fiber SFP (no =
2g5 available yet) on gmac1 and lan4 (mt7531 p5)

Tested-by: Frank Wunderlich <frank-w@public-files=2Ede>

Thx Daniel for working on SFP support :)

regards Frank

