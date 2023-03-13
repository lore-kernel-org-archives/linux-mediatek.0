Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBC8C61DA4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 18:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4UaT2NemMC9brdeaPl0tU4PcTYW3oib3/bqmGYEEuBo=; b=Cs8uO2rYlGao0zG5mPSfhnzqs+
	sUjAWDikjrVH02RGOZtqLVNeIiCJ9AL9C3HusF7BLFiANSe+9aosswQ9U9VytKD0w3mtC7d5xiCR9
	TOThWiE+/sGYATaYIbSeAlglA3MhJNVUjmkCgOxWYhUaATbR9tqWKX9tp11TIWOmqgWhVJ7e4vcz4
	vJNvCcCch9Zt2SsM1S4baiX3sTZb3xd6fX6qtMUnUI+JHYtVadbJR4MgWlWZScyx8yGs/cA/mX2gf
	qmfKpRIV6dsPN58oLNoNwydm81GJOeBrv/8wpWGhhfYB2tu1oKVSgLBDYX0iQkbyQRdibR7ilOIp5
	rmY7gVog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbn5B-007Kfc-Iv; Mon, 13 Mar 2023 18:39:41 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbn56-007KeV-C6; Mon, 13 Mar 2023 18:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1678732740; i=frank-w@public-files.de;
	bh=vnVRR7H0dRwp116/xX+I5PhqibcTnq0j1/I79a6rbt4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bAYgS+SOutp5qT7W189Mtkc/EoCKBYaYiOk7mJhTFnnWzQnI2BaBDc3xmC7xEjR55
	 Oqgy98Xc4DvUC4wNHlnYoDuFEKlyhuftCu04f12kp/g5P4NOSrHNPkIBWIpPCXeO/w
	 24I3jL7tx6CbdBu04xnzL9qyrmS+a2yquhN9XCty6iIB5E8wGhkZ1NYPG/eq97sFl+
	 68xdKYZryviFvQ4MaAvrKAK3x1HNRwcVG8SaUnglbXtV2ldXuOym1LzHXY65ZrpB6l
	 a71LWsYYIar84zB5/joWn9CiZ2TW7eS2OZhl5Qmn4dt4a771C17IUIjfKKlLfW6vWd
	 kl0aLAL0suL1A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.158.159] ([217.61.158.159]) by web-mail.gmx.net
 (3c-app-gmx-bs66.server.lan [172.19.170.210]) (via HTTP); Mon, 13 Mar 2023
 19:39:00 +0100
MIME-Version: 1.0
Message-ID: <trinity-93681801-f99c-40e2-9fbd-45888b3069aa-1678732740564@3c-app-gmx-bs66>
From: Frank Wunderlich <frank-w@public-files.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Daniel Golle <daniel@makrotopia.org>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, DENG Qingfang
 <dqfext@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>, "David S. Miller"
 <davem@davemloft.net>, Vladimir Oltean <olteanv@gmail.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao
 <zhaojh329@gmail.com>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>,
 Alexander Couzens <lynxis@fe80.eu>
Subject: Aw: Re: Re: Re: [PATCH net-next v12 08/18] net: ethernet:
 mtk_eth_soc: fix 1000Base-X and 2500Base-X modes
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Mar 2023 19:39:00 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <ZA8B/kI0fLx4gkQm@shell.armlinux.org.uk>
References: <ZAiciK5fElvLXYQ9@makrotopia.org>
 <ZAijM91F18lWC80+@shell.armlinux.org.uk> <ZAik+I1Ei+grJdUQ@makrotopia.org>
 <ZAioqp21521NsttV@shell.armlinux.org.uk>
 <trinity-79e9f0b8-a267-4bf9-a3d4-1ec691eb5238-1678536337569@3c-app-gmx-bs24>
 <ZAzd1A0SAKZK0hF5@shell.armlinux.org.uk>
 <4B891976-C29E-4D98-B604-3AC4507D3661@public-files.de>
 <ZAzk71mTxgV/pRxC@shell.armlinux.org.uk>
 <trinity-8577978d-1c11-4f6d-ae11-aef37e8b78b0-1678624836722@3c-app-gmx-bap51>
 <ZA4wlQ8P48aDhDly@shell.armlinux.org.uk>
 <ZA8B/kI0fLx4gkQm@shell.armlinux.org.uk>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:F36nI6lCjaGvE9iW/olT5af3T1lus8s5NdMk0i96PzDNje8Vgi1yT25FZOFvH+go4cfu8
 YF62npVZCcSjOJ13eNpaTbRKX3znmrvyt0mqt4/MNYM9b0KhSLgyhOwmIZhZmZ9epDly86fXGEqq
 XKnvQWEubkZhGuY33qIcJSsLMb19ufLMD+ZxxazCKVZkAMpUCW2nYR6yJKUlCzlD1lzJuhJjZquy
 97SP44YGQ9o0fYSgebLfZoWAN6YaEayFRJFdQ4JRhq+IHExjdFa6PYn1LlLdyorC908iZ73wivem
 Bs=
UI-OutboundReport: notjunk:1;M01:P0:A3Bhvf3YgSA=;DYQ3ENw4UTM7sRf0hpJwY5A5OQ6
 U71Dm0loE5cbRcAVkWmRiLqeImB56sd3lV0XbRk+El2+yb8MCcznUrZaPN7eSa2jD+enh12Kx
 eQv9w4r7TSedZw5NOI5QC8E9Tvhkc+RVvy12JVtknPdR7VqTR2lVZE/QnqwBViym5XiYEIZJx
 ei+wB43UaImFCUAliSsArVDSJU2CxsIWPhuFVXnYsaVkxSeHuwvSRbAqUJQtwO4oSfZFhL6+r
 3//nmLzSe+tOCY8377SUPRTX+dcVFveo1g+RWLLAnsRjsGVxfzjURTWfSNq8ibRC6if33tCw5
 fUSlsIOhHS98X5R/eUnBzMJkHQiXKva8g3XLNISQQWNiBfC82m9VZvyTFPiO2BxnEeJRHJPI0
 E+m5K+h0a445r9k2ozN/llRggXrZbA3TraY1EbWbqOYLp5P7T9ipjcndX8xMooye8w1VtOmgG
 jgf6KynlEyYXJl9WvlfHpqsj0HtweQV7wILLoawvdQHLRqB+Mk8yOggKPBMrecaK+smnSa4UU
 fQKpJRRHccWf9qaykgWsD1As18vUl9krRuLefH9VxKZZVt1fHgELxlF5oHRhzaKBuOEXzPTka
 G7QTGsETK3ziOUJwEzHVCk8Kb4Q5chZTNCm6YH/LE1v2Wjc6BPkut94nQMADSwsIi07ywq0eU
 rTDLiIGYwKFG6dAe4x3DGzGgEfsR/SJOmITMr5xd+Bd6rY9G6tZvoA/fds4vPVgB1aT1GDiZr
 hkwPKRlwOHOJODPAkJ3ziACrxxGtJmh37NymUdCid84MwRKLOJS2UgZXuC+PuNTB4wO+kCx4A
 2yUIjwRzH4WUmfD+UwG96AUrk5Vlpso1drid14mPw0qfg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_113936_819333_1A485AA8 
X-CRM114-Status: GOOD (  12.61  )
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

> Gesendet: Montag, 13=2E M=C3=A4rz 2023 um 11:59 Uhr
> Von: "Russell King (Oracle)" <linux@armlinux=2Eorg=2Euk>

> Since describing what I wanted you to test didn't work, here's a patch
> instead, based upon the quirk that you provided (which is what I'd have
> written anyway)=2E Add a "#define DEBUG" to the top of
> drivers/net/phy/phylink=2Ec in addition to applying this patch, and plea=
se
> test the resulting kernel, sending me the resulting kernel messages, and
> also reporting whether this works or not=2E

Hi

thx for the patch=2E=2E=2Esorry for misunderstanding=2E i thought the sfp =
quirk only sets a flag and i need to change
something in phylink=2Ec to do the same as done on userspace, so i tried t=
o simulate the userspace call there only for testing=2E

here relevant parts of debug

[    1=2E990637] sfp sfp-1: module OEM              SFP-2=2E5G-T       rev=
 1=2E0  sn SK2301110008     dc 230110 =20
[    2=2E000147] mtk_soc_eth 15100000=2Eethernet eth1: optical SFP: interf=
aces=3D[mac=3D2-4,21-22, sfp=3D]

[   56=2E321102] mtk_soc_eth 15100000=2Eethernet eth1: configuring for inb=
and/2500base-x link mode
[   56=2E329543] mtk_soc_eth 15100000=2Eethernet eth1: major config 2500ba=
se-x
[   56=2E336144] mtk_soc_eth 15100000=2Eethernet eth1: phylink_mac_config:=
 mode=3Dinband/2500base-x/Unknown/Unknown/none adv=3D00,00000000,00000000,0=
000e240 pause=3D04 link=3D0 an=3D1

full log here:

https://pastebin=2Ecom/vaXtXFY8

unfortunately this does not bring link up

root@bpi-r3:~# ethtool eth1
Settings for eth1:
        Supported ports: [ MII ]
        Supported link modes:   2500baseX/Full
        Supported pause frame use: Symmetric Receive-only
        Supports auto-negotiation: Yes
        Supported FEC modes: Not reported
        Advertised link modes:  2500baseX/Full
        Advertised pause frame use: Symmetric Receive-only
        Advertised auto-negotiation: Yes
        Advertised FEC modes: Not reported
        Speed: Unknown!
        Duplex: Unknown! (255)
        Auto-negotiation: on
        Port: MII
        PHYAD: 0
        Transceiver: internal
        Current message level: 0x000000ff (255)
                               drv probe link timer ifdown ifup rx_err tx_=
err
        Link detected: no

also after calling this link does not came up

root@bpi-r3:~# ethtool -s eth1 autoneg off
[  542=2E690293] mtk_soc_eth 15100000=2Eethernet eth1: phylink_change_inba=
nd_advert: mode=3Dinband/2500base-x adv=3D00,00000000,00000000,0000e200 pau=
se=3D04

so it looks like it needs to be configured first in inband mode and then a=
utoneg needs to be disabled=2E

regards Frank


