Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB45C6FD19
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 14:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4BJ7Bv/QE8HAhtbKaGmWjS43IA1cgQtQK26oAc9lJSU=; b=Lw27c5Cbv9qtmNqThZdgEsMsUm
	gYEQBAzCRSx8gcRxVeVWG6JuIrwLKWhZZm5rf3OQnHzaP8DM7g/9+NuEwN4uGJMmVp8+Z8abT2Aoo
	lVj1E0HdW1le+jt3+yoRZTKtEfgDu2MXhxap5ouNw8ekWWeJOsDeoeEro+vFV0NaIHIW91ANd3uj3
	20zrY2psC+Srmw/cn+q9X+gd18L3LZX50h4G4RMp39C1vHMMjAg1qpvYWHiEk+47xrESpHT9rXmQo
	+gmY+KdsUa7qKruqZBFg3PY+yTN5PBjmrwywJihvEK605HvYz/QxLPUPa/Qfh2dM6l7r/K1A9za6P
	4SirmxHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbMf8-002fma-GY; Sun, 12 Mar 2023 14:27:02 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbMf4-002flu-Ih; Sun, 12 Mar 2023 14:27:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1678631183; i=frank-w@public-files.de;
	bh=8gKmDff4fx4P4y7WV2067v+MtnzHHo6PoNVb2ypzQEc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bz5/DNvoIUvR6IGhiyPE5jf27AC799hRswTuQ1aX1LaEJna929zlhnh56cHb/wuu9
	 uwxmiI3r5YWe1Spyk5GaLeJLp2AXeRmGVee7YICvXlJIYD72dOe5CsxjvClnvXRnt+
	 iQn2ir5fPbWQ9uHCDUurisFv0zOn0Io5q1Xlp+VrGdhaR3ioqHvc1JBRQzFCEs7a/K
	 22W0zrVN0X+6+WLPP6auapLT/Yv5fjg9hf4ibwagjMHjJY96WxtM6eS8AhLkSe6fWh
	 tQTfG7oCz1bCryl+pon/whdu9SY6FEZygNbyiaR643TTMh5Lh1kLHOr7pnYhWy+5iq
	 2jcLoFm5yKJaQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.155.253] ([217.61.155.253]) by web-mail.gmx.net
 (3c-app-gmx-bap51.server.lan [172.19.172.121]) (via HTTP); Sun, 12 Mar 2023
 15:26:23 +0100
MIME-Version: 1.0
Message-ID: <trinity-27a405f3-fece-4500-82ef-4082af428a7a-1678631183133@3c-app-gmx-bap51>
From: Frank Wunderlich <frank-w@public-files.de>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, Daniel Golle
 <daniel@makrotopia.org>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Heiner
 Kallweit <hkallweit1@gmail.com>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, John Crispin <john@phrozen.org>, Felix
 Fietkau <nbd@nbd.name>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, DENG Qingfang <dqfext@gmail.com>, Landen Chao
 <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Paolo Abeni
 <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Eric Dumazet
 <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Vladimir
 Oltean <olteanv@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Andrew
 Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, Alexander Couzens
 <lynxis@fe80.eu>
Subject: Aw: Re: Re: [PATCH net-next v12 08/18] net: ethernet: mtk_eth_soc:
 fix 1000Base-X and 2500Base-X modes
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Mar 2023 15:26:23 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-8577978d-1c11-4f6d-ae11-aef37e8b78b0-1678624836722@3c-app-gmx-bap51>
References: <ZAiJqvzcUob2Aafq@shell.armlinux.org.uk>
 <20230308134642.cdxqw4lxtlgfsl4g@skbuf>
 <ZAiXvNT8EzHTmFPh@shell.armlinux.org.uk> <ZAiciK5fElvLXYQ9@makrotopia.org>
 <ZAijM91F18lWC80+@shell.armlinux.org.uk> <ZAik+I1Ei+grJdUQ@makrotopia.org>
 <ZAioqp21521NsttV@shell.armlinux.org.uk>
 <trinity-79e9f0b8-a267-4bf9-a3d4-1ec691eb5238-1678536337569@3c-app-gmx-bs24>
 <ZAzd1A0SAKZK0hF5@shell.armlinux.org.uk>
 <4B891976-C29E-4D98-B604-3AC4507D3661@public-files.de>
 <ZAzk71mTxgV/pRxC@shell.armlinux.org.uk>
 <trinity-8577978d-1c11-4f6d-ae11-aef37e8b78b0-1678624836722@3c-app-gmx-bap51>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:8Dr+JbZAG9ReX8C7mk7Vo758aZ6vkIpxnCQlU/ppmzdxB2U5/9GlsHVagRkJvrGo9uIgc
 9kl4wlKNJpMQKnmQaEtUkHWqAceUpdRm+N0KFLg/L1d5pm7cpM+kFeufcr3Wn43GTR6trmyxY2VX
 7ZUwB8/Z/9xqErQbbFfJDUTMg15NQ7FwVrYMLLzqA5HubC++Eamx4f1Fnxeln0kXORT6lHCzquKk
 paMHjUYsZbxeTFeodfKTXw2IGYQAjwXGXvKMZJ+wnIZ9Yvk8NmOfH3JlQpCqt/e2B9pf/Xs0+8k/
 QQ=
UI-OutboundReport: notjunk:1;M01:P0:a1KgfutJ3bA=;+wMz+CmGCfod2DAgCSEq7Q8DBpJ
 jAR0XkWMzx9WEzb959bifW4ZCFZ8mP0ktv0wY6q8PiKxIrVMTXgkhuHrtiZFiUeMrMVnjcqhe
 +05OZs/8ZxrckwscPZqYpBWPgM6wLDd624Z8K8eD2JoHP5RWavscb6m4ke0wVPsXfA5ZH8dju
 KkQVR4zeGJbnbKRbbdpWx7NC8/fytZ95CSGkRAKz0AQU3LwRI7Alwy35FJGxm639DzvkN1hxX
 Qq2OeR3gcp9BwLVcY/SCMCIsznnKu4hw5ACWQ/obVHSESiZGkNCkEbW4DnOvF1jt9fZ4EDd0z
 AN1/0OKMOGpqIyxXBfcjofUn7COi96P7uFprUg/uK8vFDNnuTkeXdDvhdfWWT3cmdeL9uIFPW
 wBmCMAYzke6Nyybwye5Jf9265wVS2N+B0SgNZt5tiF4HiQ2JybySjXBReNCTaW1zg971znHHf
 I8BgG/QhzuMKvwFTs+RYuJwAk0mTy41VFzfMuyZljbM44V/RsoHtH8keUbPm3O1llsigEQCFp
 Jp5cv3mA7q0DZ6zCTUj9IQuWnGc4Sx7302wY144wpT30Wcg+AK5DihZ+Q9Z2wu7nw4tn1yi6Q
 MQEUA6nrNYjLGfvanWsyoRjOLC8dpl8Lrs8soj0905NgQKfTbfSBHIo78Pw/+IXoXDMYWgwHX
 UgF8nX8rDb4g5u5QRwlRgTN8tBVCEb4vl0BIP1WyautDSWneM9hjTRh6oreN4LzyhT603qals
 FfGLNGhjFJ3lSKKohz7I87zaP9w2OMcdHbOlBT4jsxlX31v1JzGzpAHUW55cQQdSzQzVBp6Y6
 FcXy5ihg4kQplw7SpPz+C2Fg==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_072658_945349_5E632077 
X-CRM114-Status: UNSURE (   7.37  )
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

and i can confirm that disabling autoneg on userspace brings up link on th=
e 2.5g rj45 sfp

root@bpi-r3:~# ip link set eth1 up
[   73.433869] mtk_soc_eth 15100000.ethernet eth1: configuring for inband/=
2500base-x link mode
root@bpi-r3:~# ip link show eth1
3: eth1: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc fq_codel state=
 DOWN mode DEFAULT group default qlen 1000
    link/ether 92:2f:d3:16:6f:94 brd ff:ff:ff:ff:ff:ff
root@bpi-r3:~# ethtool -s eth1 autoneg off
root@bpi-r3:~# [  147.190136] mtk_soc_eth 15100000.ethernet eth1: Link is =
Up - 2.5Gbps/Full - flow control off
[  147.198600] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready
root@bpi-r3:~#

wonder which flags this changes compared to the original state...these i h=
ave to set in code when the sfp is recognized.

setting these flags in the phylink_parse_mode (or skipping set AN-flags) s=
eem to break it completely

regards Frank

