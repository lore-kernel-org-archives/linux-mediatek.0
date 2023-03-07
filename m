Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8964C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 18:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PwA0h1qZLuhuoZ4NUTsAvcwTuRFj66q2WPa+dKxE10=; b=M37o37rUSCTj9sR53ikc9Jx+aa
	9cnrSo3L5o0nZf0Fz7qBRnTTdI9E34KyzLqXtp71P0+S6nFJEzRAKf+V8z1NVoCyC1tLCqB7yhgKT
	RlbVKrgP8IZKxsfimamMRDB7HZCr/lR+VpgbUx7Pfvrr3fpiPAVq3PKp267AU/qukPsqGNRP9o46O
	r8r3jjlNb3bvq9Zx6uI8hqfKs4n7AIICdsNz47Pn64eLXae31HoTglzns4qp9SdUq33MS1pcswP9R
	xQ8b/thU1IUco67GlGpvRnV4EL+dK0e0+l2mXLToSDdMDKHgZpZaoUQnpVZyz41CtpnNF9riMLAq4
	ex6baaSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcOD-0026Z1-Al; Tue, 07 Mar 2023 18:50:21 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcO8-0026Y3-9J; Tue, 07 Mar 2023 18:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1678214987; i=frank-w@public-files.de;
	bh=6PwA0h1qZLuhuoZ4NUTsAvcwTuRFj66q2WPa+dKxE10=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NzKGpAte1eL28AEBWV2uwRaQfJaxq1NwYnTgfjxFh9JGGD0uE0WmLeudIAx9cmrx1
	 gVCXBRPvgByge1wRqw0YcXVlefZGLOmkKawXBT3wfxt0aHNIpVqw70DpwhtQT72jwR
	 p2/a4X+hv6tZf8JPd4EJJ++ctk39PV0F9GrzFOn8GqLOPESP6Znk4EwM2WwZF6gWwA
	 aWJYds7O2hbig0hPO6rz5V86xyFRQddEfD6dF6bJTwdxZYe6woZg4E897Hh/02OD8Y
	 6y6NTxoocTk3bVofohl9D2aknPx9gTszoJHCqnf7MP4oVWNBSns1Jm0wNpL7kPhWbw
	 Og7u3bUfoWegg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.156.24] ([217.61.156.24]) by web-mail.gmx.net
 (3c-app-gmx-bs16.server.lan [172.19.170.68]) (via HTTP); Tue, 7 Mar 2023
 19:49:47 +0100
MIME-Version: 1.0
Message-ID: <trinity-ed437b5e-2949-4a45-9dff-73cbefc0835a-1678214986988@3c-app-gmx-bs16>
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
Subject: Aw: [PATCH net-next v12 06/18] net: ethernet: mtk_eth_soc: reset
 PCS state
Content-Type: text/plain; charset=UTF-8
Date: Tue, 7 Mar 2023 19:49:47 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <0105ba8db974bca74846d605b18dcf948a7ab3d9.1678201958.git.daniel@makrotopia.org>
References: <cover.1678201958.git.daniel@makrotopia.org>
 <0105ba8db974bca74846d605b18dcf948a7ab3d9.1678201958.git.daniel@makrotopia.org>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:RhX0TPvkWegrZOa+oeIK8QoIIXSR4k63trcaLclg7gV0U5IdcSHf0rQnjgVgbghob/H7j
 DCqn+fl7K/mPiiFiHXa97DHM41d24dgRlzSoQPFWJYsgogNbfI561PFe6aemrwMn7lMPAQLKCRzQ
 hBBlXb1DOZGnKMOsoe7Z8WODgyyvV39+Pnc6TSII9f8MqVgepgrEaxKGRNAHs7948NvZNuIh0zON
 P3PJelnBLUNohQeCYLK3Cemvg7DWHPWXQUQZ+kOYwzZX+04aqDssu8nH03uLv/zKpm/kP+149mQn
 qw=
UI-OutboundReport: notjunk:1;M01:P0:crSBPtSylj0=;JPywrnn5bI/vhq6/gsa4cnlCcus
 OatUVPWFayp/3xcpx9VjcbCWEwe1pMa3HhL28lK70MWar11Uj9io1BC0pEFrohdzM2zbyaUVI
 i3u24OmimYIpWpezfmu6hpTBT//GCvaX+c9SzXRVqzeY/Q31a/TKH3ghyGyzJp6mOm7BYnvFc
 9r0WRte1oRDf3f+xCDvWk4aqeDffViS1X78O+v9mW6Yd0VWqVKosGdGCzrzK7747jZHaMV6D/
 QLxX0znxJ8t5m78xv/9lxv6taVUqthssXFVm3ldLvd1f37oaTQHOjFAUcpuHWDifXkn3Mx0CS
 m9RHRlROZcIZ+YSY86sezGbkMp7TXKa4DV4ihjQWOwHfA14II5aKeYR29a05iJaEwmZcRHL3i
 e4CtKxbiGRcASm3MZ0TEFOAGIxP1d2V50HysPXcrGcDDFTZxZilm66Yb4t+dJOJdcxxLyrniM
 /oSZ7koTtg2DaXMeBvX50JihP1wT0Q2z8cVV19+EFuH1ukqQ6/la1Px1jbLZ7VFWuXiIeLXBL
 Ry6vbCfE2i/gI2pfdmWk3kXXiJPo9Idrd0Cs7mHTlSS207rG9HYII2qszLdhbpBpY1fcgcR6T
 lwQ8LCxlYi2GPdbqanZuNsxT/FC7I8wyctnjVcPxWL9RYItfPq+T7+WQUjnrrBRuSiDbiaPYZ
 NLvJSmsamuGkWaPRuJdGysppVl3dyQS7l1yJiTSMzN5WFTLtirPUiqqSrNfbmYntl0TmZ9p9V
 E94N2f3q3N7ZnXJmMr45iTUcWvqVXv2cKy2RWZ7osoGaJR3LHASpxeWfTFMc9473aU40lWEQx
 1VetJekPXm+QWsY4X/uF3Mfw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_105016_631982_43E5CD69 
X-CRM114-Status: UNSURE (   8.84  )
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

> Gesendet: Dienstag, 07=2E M=C3=A4rz 2023 um 16:53 Uhr
> Von: "Daniel Golle" <daniel@makrotopia=2Eorg>
>
> Reset the internal PCS state machine when changing interface mode=2E
> This prevents confusing the state machine when changing interface
> modes, e=2Eg=2E from SGMII to 2500Base-X or vice-versa=2E
>=20
> Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux=2Eorg=2Euk>
> Tested-by: Bj=C3=B8rn Mork <bjorn@mork=2Eno>
> Signed-off-by: Daniel Golle <daniel@makrotopia=2Eorg>

Hi,

have tested Parts 1-12 this on bananapi-r3 (mt7986) with 1G Fiber SFP (no =
2g5 available yet) on gmac1 and lan4 (mt7531 p5)

Tested-by: Frank Wunderlich <frank-w@public-files=2Ede>

Thx Daniel for working on SFP support :)

regards Frank

