Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB9F6C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 11:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4Ry1+Uz7XRykXg/u62aElBzE539gslTt4tQPn8JGKY=; b=vznPpZf5iUfiOowkDB3VeyfOpl
	aEm8N3gJNYd8BZNnsPPEFXhGA3BNhY1u35r3TjIse95/ZsOehZTiDaSk0+WMMBfr47MaqADwtlpng
	D1mlK7WFc3q5DFLQE5kBfqqrJq/OBcnq0gvJAimdljm2MAjUM9JIZF779yaFG0j0QVMBaDqARM//C
	rUR1qxvGkFvG695beIlp9U9XyPMrqsRD5dIZoCtpNOemgBWoI4pqb3GsK5TSp9M1CjjAtqaCntFMh
	fmlFurfgHOdN/WS782XOgUBBYJjSrHb7zBbf9YcC3vE0xr8K6W8lEIuGbPaNDHFWKCeOE57nlocV/
	om08zFNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paacf-00EINF-0A; Fri, 10 Mar 2023 11:09:17 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paacc-00EIMC-Cp; Fri, 10 Mar 2023 11:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1678446518; i=frank-w@public-files.de;
	bh=p4Ry1+Uz7XRykXg/u62aElBzE539gslTt4tQPn8JGKY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kybU4HAuBHObpWV3Gov/u71hhW7EtHvQATKuyLgWYHUoxqf8uzAq68kXlUmADPbxC
	 CRjbfQYg0p/D3whBrgw205MJ6E2hTDgMdv/o5MKMCv+rCk5xsya3sNBhxXXg7KfBwh
	 c8/lz6XQ2D/qFIm23aspA5cikz8hvX5puFydVtZ8ca/lYukLqAvQyAOgmG03IBY1mq
	 qrUelreYRHTrQk9gzPGADoA3L15ZPBYBKkbKprIQAQZS823B/RnKAymgQi/KWhzWZ3
	 HCkeEh1uOa3+nKVDGjyPv9bTSHxe9Sou0GqQI9pNeqSCJDV1GkKwS+C+8Al+qkhm6/
	 jMA6IPRT/f5Pg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.224.176] ([157.180.224.176]) by web-mail.gmx.net
 (3c-app-gmx-bs21.server.lan [172.19.170.73]) (via HTTP); Fri, 10 Mar 2023
 12:08:38 +0100
MIME-Version: 1.0
Message-ID: <trinity-875b4841-0e54-4370-8021-6b0534e421b4-1678446518590@3c-app-gmx-bs21>
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
 Oltean <vladimir.oltean@nxp.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?=
 <bjorn@mork.no>, Alexander Couzens <lynxis@fe80.eu>
Subject: Aw: [PATCH net-next v13 11/16] net: dsa: mt7530: use external PCS
 driver
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Mar 2023 12:08:38 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <2ac2ee40d3b0e705461b50613fda6a7edfdbc4b3.1678357225.git.daniel@makrotopia.org>
References: <cover.1678357225.git.daniel@makrotopia.org>
 <2ac2ee40d3b0e705461b50613fda6a7edfdbc4b3.1678357225.git.daniel@makrotopia.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:jMnlX6H99gmtYbWVz0id357SLJcq0FXh9uVeicjq6deWbmX30NoSTwmz82nRxxdjnnF4f
 MW1izpHVkdf5lHo+yYMzyKlIiPp1emhL6OrVn9glZRlwvWbEj9MAuzbtWssEO1mrctpJ9tSDGW3W
 bqsZnxaJSr4Py9J0/ri2vCyUH//VxnA0ugoNhGujT2kvNu+7+vbsJL4D/55bvVZHV1kLmpT9jIOq
 PTpKW8IUiVCHAQS+kWY1VYj28WsSo3QYYkASSQuH8y3J/1nmxUfWD8V3bMUrckB4HyvgnDbtW/Yy
 yA=
UI-OutboundReport: notjunk:1;M01:P0:7F1ySXjLVBA=;YIrriYjuMhKxZYMF4yrIBczPUSn
 uMNfbPiv0EdwiGyehnU3vXLRoC7IT0Pq4B0aNCDnGcLlwiy6+P3ylsZQ/CsnjZbYgh3fLKuKA
 VCWz5B6+8ene+gapEn1yqa3tsisEga/7xucLMliSpou5MgJ5Sy2JVGHm4Bum+X49afkNZpxYE
 SRsVkANXohT/FCbdsZMmP4ZB/iRCAaQ3EXft6BNla8M9JDncWtvqgdtaoW30M+oHsvtHLB6Kr
 ITTmeqrLrV7vkvxH4SgayNK+bANAGKNNmuTUgWqaz57pL9KZsFqqnRD0C+EraOVxF2fpZH9cL
 rkkPYXsOHrENZv+jYsUPObXJNBLFli/kVqHCOy2ZrWNK4Kgn5uozsM8e7BdP+mgv0NPhcS5ii
 cg0cg81PeopsI4pPkmdMY0KPtTZc6ZN+mjPXQz1jHYuEwikDK7k+mHAjvipFBTUwWiHu09KuJ
 RjILdl3BbOQWbRpeJfOxFDiL6weeT3grafP9DVnS4Qpt9x5Uk2jjMXssq4ur27F2lZ4/IBt1C
 ZP5csVBY3oguluvDRQAGn1KGRRumVuVbG4Zw8NTTILT0FUEK7evYx4cZxBKTMT0yw0NH77Wo3
 hp/c0j5EZtYmlyKgp88ixBscNDD8nbZaN8R/E3yeIdeA3xfHCGQvyXyavg2Olig269XP4V7Nq
 Nj/dAJ2SBILZJslQall58Z0/TmpZq86oCoPXdbmImJvpfTS7wPElnfM4erVi5PcWtFx/pKcQK
 IOh5576kMSAgVE6J3u71Rfali4RrEkT7J38uWg52RdxpBp1pKM9Qgba5zq9JEy40SUEhkPm2D
 F/m07UonWPFv2oo/BOvlw0kKtBavJpU0oLitu7A0gvEhg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_030914_843915_63F48A2D 
X-CRM114-Status: UNSURE (   7.70  )
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

Hi,

have tested Parts 1-11 this on BananaPi-R3 (mt7986) with 1000Base-X Fibre SFP (no 2g5 available yet) on gmac1 and lan4 (mt7531 p5)

Tested-by: Frank Wunderlich <frank-w@public-files.de>

Thx Daniel for working on SFP support :)

regards Frank

