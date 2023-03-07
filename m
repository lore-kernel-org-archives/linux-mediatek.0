Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 099A9C6FD1B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 18:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTGTLkZ8OoT+RqpyAx1sW9UaQMm0R5ZBqK9JTQc9Wc4=; b=lF8AtKOUYkYAfJtU+TvKHBUujE
	QkQScwacRh47iJJpIk5pgsf4hj3TM16AOSS5R/KHcdc6xLNR6i8YzjnvD0mt8XHEn2c6UTR30Oug6
	Ss1wjwMibrpLgOwxKUXB7dI7q3Bzx6jZg6H4i3P0ofgqgEtEWVlasRkLhBNrMMuoy2DpHqwrSXNWJ
	fqzrdj6gwNzBj2TLH6qp4rETSn+xuP5vl/3l/Otdy40Hmtg8iZrebotD2N4RO9eGbvVzYa4dV5nO6
	XA3rNYAmVGefyrSTRbIXL96JLqxySWONA5W9K9MBd0w03rvJLRAKW0tSkp6eM/PHz5ZEmpVvhZqVt
	xNNsCAxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcQd-0027P0-Uv; Tue, 07 Mar 2023 18:52:51 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcQS-0027Kh-TR; Tue, 07 Mar 2023 18:52:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1678215136; i=frank-w@public-files.de;
	bh=JTGTLkZ8OoT+RqpyAx1sW9UaQMm0R5ZBqK9JTQc9Wc4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b+QmKzfHv8rGk0ljlZiia03mXcX9YPLoQBedOXDh8wOm8154pyHvOo9m8uzMhFpz7
	 Vk5N2ZeRsp2inDmS91qBkw/E8thjZoKu87XjyKFfUXPG3sBQUXATK4Ubn26D5JSb5M
	 Fhbx+fFOdwP+AI0DNWFsfzF9Z1wYqaVYY0EsDYgS8Td9JUCRUcBc3dmhaB2zowbeWo
	 HIs0hQ6NDVytqY8aYp2TKnq0LpvywaY1w/bgvHmj8LfvJdpmGTKGUPWEOMsG1srNgY
	 GACR2+YD1eFxpDY9VZeB6eoGAU5tBnEK4oFRVm3qrURSaj4Gye2Q8MlWbgS780hAnH
	 ZavwqdiHoqGJA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.156.24] ([217.61.156.24]) by web-mail.gmx.net
 (3c-app-gmx-bs16.server.lan [172.19.170.68]) (via HTTP); Tue, 7 Mar 2023
 19:52:16 +0100
MIME-Version: 1.0
Message-ID: <trinity-d2a4c07d-5278-494f-9e10-fd366d539604-1678215136485@3c-app-gmx-bs16>
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
Subject: Aw: [PATCH net-next v12 11/18] net: pcs: add driver for MediaTek
 SGMII PCS
Content-Type: text/plain; charset=UTF-8
Date: Tue, 7 Mar 2023 19:52:16 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <05e6d08bba07ab2462178e51bbc146bdea508f46.1678201958.git.daniel@makrotopia.org>
References: <cover.1678201958.git.daniel@makrotopia.org>
 <05e6d08bba07ab2462178e51bbc146bdea508f46.1678201958.git.daniel@makrotopia.org>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:PwtmZC5NIT1sqzXVXjKmB8ju6BS93xlMNGejBocvc9T1IS+s8osXo7fjoDMrpnGZXcQoo
 ZVBjFJeCbQBsCFnEYKc2UUAem12eiW8c996KCKdD5m/bQWp+7FK6LqKt4pUTdgUZ1ReSdPsbUE/p
 lMegGXMXFmoMnKLPeoDdr1UNIE+hEni2F+952KY7spa10Mzvx9EgODLqOaM/8mt48rE934OOsppQ
 XObs3vkdgVRuw9bTJX4xnRPxqI1McLrZdm58yLIIxsD4zO6ErxEtKBwzfh44gIFUDCswevyup7EX
 4U=
UI-OutboundReport: notjunk:1;M01:P0:Am6NJr4guOY=;WJNN6VHGMn/i+3O1d7Gc5MoWki9
 C2foELMSUwRbHwq6Z8uu9Wtjh/WEEGXkL/K/cmEP016qneV/GdE2jAbweZOEXEFPeI/AZzKgU
 sbSHxFsEl812pBkRVk5UMyNa1YdPNMLXuwMqTVw/YHk5EpXrge3y4mlb5yMNfGvpGevk/3Gb3
 5nNfbEiqCGSVu4DbzJ8Pd6R6TRijCUDDk1l7PhBedLe+F6Z0A+b43YNQ2HuI2PkeIXyvqhc4o
 HEadAC2mJHymigjDuoVKhYeA/9nlqjvxclSQsLV2gFVEftCRuiN8lP97wetwwVFd1j9O6ADVw
 9LOuQGYwerWI9tZZfdiMUuOPH2Ab5U+2xTndjHOuyEbGLKcQhu95Q5h379ZKBK95//HuT7UhH
 Gl/jeL3HvpiDhPtcg6Tg/vPyyR4l4v20oyWMEE+6sMAXzGY0gEl2CJo/+jSriwN9BiZHPpahS
 Wc4dmDy8OJnFN7MwSAoymsgB4LrdRutC8tFNE4ULdwH2dlw9DuliJwCtHUdLdqH0Qw6ziDR6C
 Tb0461FmjASVUx4x1HraIIiuRzxTLkEY1dxgtt+RfU+hsi989fsZNvseN2qwh1XXPSczHRncw
 ABlDRl9iYvL3IZC+Cl0EFlAtQFKSwbEwGuXAeZqo7sDbfVs0H+jz9cPTulZjNrAFyw99uofz3
 yAC0k1TmL+iz/DhXZHqp18cIc7pKhTA4o7YioGlRstCHGpjkBiPUWmWGR9nEMXL08ejg6hkHJ
 CKlCOZtsczSeVbfmHCEAqGep30mGAgXXV9e7REN7Wa5d5kmMbzq5CNno36BR+RHLDJ+NTmsvz
 RzH090yGyZRlOCzUOl6bA0mQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_105241_254484_66F0B827 
X-CRM114-Status: GOOD (  13.38  )
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

> Gesendet: Dienstag, 07=2E M=C3=A4rz 2023 um 16:54 Uhr
> Von: "Daniel Golle" <daniel@makrotopia=2Eorg>
> The SGMII core found in several MediaTek SoCs is identical to what can
> also be found in MediaTek's MT7531 Ethernet switch IC=2E
> As this has not always been clear, both drivers developed different
> implementations to deal with the PCS=2E
> Recently Alexander Couzens pointed out this fact which lead to the
> development of this shared driver=2E
>=20
> Add a dedicated driver, mostly by copying the code now found in the
> Ethernet driver=2E The now redundant code will be removed by a follow-up
> commit=2E
Hi,

have tested Parts 1-12 this on bananapi-r3 (mt7986) with 1G Fiber SFP (no =
2g5 available yet) on gmac1 and lan4 (mt7531 p5)

Tested-by: Frank Wunderlich <frank-w@public-files=2Ede>

Thx Daniel for working on SFP support :)

regards Frank

