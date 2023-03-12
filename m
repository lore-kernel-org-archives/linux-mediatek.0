Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 778ADC6FD19
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Mar 2023 16:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:References:In-Reply-To:Date:Content-Type:Subject:To
	:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIdXo3qX2wvsPVbhmNONb2BIlBIqKTBjbUHbHOzd2qw=; b=fFZO2zprFcSJJY
	u20qLcn1oZVHcy2rd9VRQPstNqmycZqQ2L4CYce52V7Me3hI/I0cXCfsfbXd2sJ85TXlI7rzREnd9
	t4HsvYBxZsVAjbYk8tPIxNsB2QgAKZHa7AUVt92Xn6exI0TbFcJ1z7Ym+v7NHFO6pcNq8/Am8aK9T
	kXJWg+86aL9HJy8vu14PIHcZTnP0fKHJ/QTiwf9NAlgxULFLf8aac86vfVbSKo6p6lWp3+yjqCw4X
	/vfjqHLiz2I95RS/BmtUiqOW5iQ7NNrJLWQC5h3pehgH56y4fLzElkpSZYJ8zgv22gTgPML17CgLk
	GSwEFgiePlXePWraH91w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbOuq-002xO8-ON; Sun, 12 Mar 2023 16:51:24 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbOun-002xNH-0E; Sun, 12 Mar 2023 16:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1678639848; i=frank-w@public-files.de;
	bh=sIt2zQeXUcSu3B3Uu/HeWZKfcMagHZ+3Xer5rVPvPls=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jRovmK7FQO1cRFfCpsghJEalG0Twjhrs4eZEKuxnbzEIVtC9pz1ERTyWH7rxO12TO
	 d3gib2iETJi+Psw9VJHLiQdgS8oqgHFMnz8qXKcjh0CaQnBFbuz+BlZvmODu0UBc/P
	 rvI1Qaccq17zX9pBX97Rn3lAu9nHMqwrQ4M7mUsDZMaMC7tua+NGmeIvotmSVkAj3G
	 R8PqTF19i9HJv/mMYXU/uCWMUtNhBqsTD+fxROrT2pEsvC4fDrj7c9lI9KAoF7MnFj
	 yu0z4zKCiKE8qXj7vzXjuETq5NWU9DbJbyVpb3bXaQvgBT7b6BJNTE88xjr7PNvWHW
	 uXDIOwgBcQ9ng==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.155.253] ([217.61.155.253]) by web-mail.gmx.net
 (3c-app-gmx-bap51.server.lan [172.19.172.121]) (via HTTP); Sun, 12 Mar 2023
 17:50:48 +0100
MIME-Version: 1.0
Message-ID: <trinity-eb5bbb4a-b96f-4436-ae9f-8ee5f4b8fe9b-1678639848562@3c-app-gmx-bap51>
From: Frank Wunderlich <frank-w@public-files.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Subject: Aw: Re: Re: [PATCH net-next v12 08/18] net: ethernet: mtk_eth_soc:
 fix 1000Base-X and 2500Base-X modes
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Mar 2023 17:50:48 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <trinity-27a405f3-fece-4500-82ef-4082af428a7a-1678631183133@3c-app-gmx-bap51>
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
 <trinity-27a405f3-fece-4500-82ef-4082af428a7a-1678631183133@3c-app-gmx-bap51>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:9wKjp5XBZND5nbJ+nHFm8BH56OTKmKX9GvyKIsYgker4byg+vJN1XKpEIVXSQq1TqZjZQ
 vaSwmT45RfuToSsY6gnabCWB7vbfDPcHHa+9IyVMZAMe6IokNjjP1ToMALMva3LMNWQWfNiVBrw4
 UiR44u50vbAkqKwyPKavZVzJTMCWuUucTR7mhs511LPj2eIp0O1gTUeylpIKgo5PO1JEbDg9HYdY
 Dpfyrx48Ck88B4kaAQZ14eHyEftLm8EhLR15qRMWItJNAm+Q32lK5oBes507iK3LFltXIsIl3OoO
 dY=
UI-OutboundReport: notjunk:1;M01:P0:HblYQUuZE4M=;EbF6xMHyP1csC3UiShZ2RuHWiiG
 EbkuiyP77t+tw8kDrJsV7eaKZBJOTUroD+/Si4CrBWkLk1LkBnJekuUK2qRJ4IJVwzxD7DC/u
 gYvHah3JNnx19MYNGb30IBMq1F0YBXUGEqxGW/5Hy1YQ0xPpI0HZ0eiHvLUXeEccSlS+P855M
 CWvOehCujMbRcHOhTMiYqFQNmaeEjR9yGl4eW+nEiZb/44dwBPL8q6nnhrJ6aTZNntXyVUP4f
 A98QpbI19gFGLnHYLOgmUZB1yzsCHkfxH8DFCO/Kd2ay+wZCHSYyODpxKAx0TUtdSoSvR4LFd
 R6bqcGKdda2YR9VaggDVCW3JyItbih9e98wVTGmfbx4gXS7EnDydWJrJ1XL6Zxbz9j6oP4RGn
 wLghwknkbuxR/vy5vFOPmnkqKniE/SZjDnK3s3Qm/7+o684TgiD/8kGYpAn1kd1WOHC8iUw6W
 UnWx+T0YbUms9x0djeP0TpsHTaUPgD6GJQ14fplMTqOqtPsBlP57SkWk+mbOLo1M329Vb05hZ
 5ucFZ+8GGRwbkTbhQ4DYFveiI93w2UXlbUf/hz+4j+Er4nYp/Hgm0SnM3j6/p4NaZm64OQkjS
 iTaStKfE5KTov6EaJ2BgpfD6BrkMc7dGPHd4uQ09ydnBbKpQ6tdEXWOSWa78TRRyavWnw0ImF
 ZYup3Xts7GIn6BCExvNlAH/NtFruVS8oDZJAW077ZmPlRp/yGSUBCWWM7e2oUwrDCarngt6ij
 c4HQeYIzrConSoff3HzHipH2uK0oVDI160L/neijfDn12UKUScG+lUKhuo129ugJlvY4H9Nin
 k+V33eABiPsoTfLLcyMUjSEg==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_095121_354759_B7B26893 
X-CRM114-Status: GOOD (  14.10  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <vladimir.oltean@nxp.com>, Daniel Golle <daniel@makrotopia.org>, Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Alexander Couzens <lynxis@fe80.eu>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Jianhui Zhao <zhaojh329@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Just to make it clear...the issue with the copper-sfps is no regression of=
 this series it exists before.
i only had none of them to test for until this weekend....my 1g fibre-sfp =
were working fine with the inband-flag.

this patch tries to fix it in mtk driver, this was rejected (as far as i u=
nderstand it should be handled in phylink core instead of pcs driver).
and no more in the v13, so we try to fix it another way.

whatever i do in phylink_parse_mode the link is always inband...i tried to=
 add a new state to have the configuration not FIXED or PHY or INBAND

drivers/net/phy/phylink.c
@@ -151,6 +151,7 @@ static const char *phylink_an_mode_str(unsigned int mo=
de)
                [MLO_AN_PHY] =3D "phy",
                [MLO_AN_FIXED] =3D "fixed",
                [MLO_AN_INBAND] =3D "inband",
+               [MLO_AN_INBAND_DISABLED] =3D "inband disabled",
        };

include/linux/phylink.h
@@ -20,6 +20,7 @@ enum {
        MLO_AN_PHY =3D 0, /* Conventional PHY */
        MLO_AN_FIXED,   /* Fixed-link mode */
        MLO_AN_INBAND,  /* In-band protocol */
+       MLO_AN_INBAND_DISABLED

is my start the right way?

i noticed that sfp-handling is always calling phylink_sfp_config_optical a=
nd this calls phylink_sfp_set_config with fixed MLO_AN_INBAND.

https://elixir.bootlin.com/linux/v6.3-rc1/source/drivers/net/phy/phylink.c=
#L3038

This looks wrong for me...
First not all sfp are optical (ethtool shows FIBRE for copper-sfps too) an=
d not all use inband mode...
after changing this to my new state i see it in the configuration message.

@@ -3044,7 +3049,7 @@ static int phylink_sfp_config_optical(struct phylink=
 *pl)

        pl->link_port =3D pl->sfp_port;

-       phylink_sfp_set_config(pl, MLO_AN_INBAND, pl->sfp_support, &config=
);
+       phylink_sfp_set_config(pl, MLO_AN_INBAND_DISABLED, pl->sfp_support=
, &config);

        return 0;
 }

root@bpi-r3:~# ip link set eth1 up
[   30.186811] mtk_soc_eth 15100000.ethernet eth1: configuring for inband =
disabled/2500base-x link mode

changing the mode itself is not enough for getting the link up...
have not found spacial handling of MLO_AN_INBAND except in phylink_mac_ini=
tial_config where i added my mode to the
MLO_AN_INBAND as fallthrough (there is not autoneg set/done). also disable=
d link_config.an_enabled whereever i've found,
but this does not bring up the link on the copper sfps...it looks like the=
re must be a state-change...

but here i'm stuck with my limited knowledge ;(

regards Frank

