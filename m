Return-Path: <SRS0=gQ79=JX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC62C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 23:57:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A1D261178
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 23:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A1D261178
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:Cc:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NcEyH+1qnW++w1Z8N2dm4zKH4ej7hdazWgS6+k2rv04=; b=pFVGds54JmJAeiC67OtUBDfLK
	RDddTfGSIlgqlnf4A5825mcFWck9d7gsd4BxQrA57reBvHb68fBNHjxXUxOpVDaJM2aopaQSMaEX+
	vRlGlGD2neaAwn4pqxm3VhInwMFAzUlFKlbuN/zZo/YpBgcao+kUm8vb8lpAZw6EurvIMjPyUEof1
	GKcz5EulMZVanmyPkxBLR0mxo689AJHH8fixgfHZRJW/HyzO6qaWNfGv/teEuRNOcv3Qd7rMuPBL8
	7Te0vODT9KZMiktZS+xDENTV9qQ52G8ZQIzNvMEuH1L4czPJOqqRTYbF7sba9Gcg04o0f5CLiTbmF
	TxJjQhlSQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbB6B-000Ge1-L3; Mon, 26 Apr 2021 23:57:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbB64-000GcO-8L; Mon, 26 Apr 2021 23:57:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=SdabRXw+KZyuYBY3LzBY1S17jr/5ae5K5GInfZuI7yU=; b=do/bvZtZD5JLOueIjgFslyBSCm
 1UYgvlH158o5AqDPwlLhXbThFo2/ORbKQEaKr3/YF9ukqVcUVQFLA7SbuzVAJ363BOsIDTELSs0MX
 aCNgmkuKMRmOGYRr2Y1y/jg8PcComitdUa52H9UhqLPQ1+JWqs/pty+e70zbhYZchd3tsxh0Y/E06
 9LSw8yr408i4/93K6+FH2k3PZoMlN/Ifotminp9ITyMKhMMuuAVCx9ybxmPYReMYsyFaqr/6wLFQs
 BzscKkrIJn0RAThMVqLUb9Xy9RZ8V3Xa6uEmSCn1sKmOP27eD/Exi+Wghhk1R3NHzsiMKjNVqVj+6
 mD1R9Wjw==;
Received: from gate.crashing.org ([63.228.1.57])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lbB61-00GK55-9Q; Mon, 26 Apr 2021 23:56:59 +0000
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 13QNi8nL025548;
 Mon, 26 Apr 2021 18:44:08 -0500
Message-ID: <3677398ebb77f334abb4899770db633d9658fe82.camel@kernel.crashing.org>
Subject: Re: [PATCH net-next v4 2/2] of: net: fix of_get_mac_addr_nvmem()
 for non-platform devices
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>
Cc: QCA ath9k Development <ath9k-devel@qca.qualcomm.com>, Microchip Linux
 Driver Support <UNGLinuxDriver@microchip.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, netdev
 <netdev@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, "open list:MEDIA DRIVERS FOR RENESAS
 - FCP" <linux-renesas-soc@vger.kernel.org>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, "open
 list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-oxnas@groups.io, linux-omap <linux-omap@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev, Andrew Lunn
 <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Michael Ellerman <mpe@ellerman.id.au>, Paul
 Mackerras <paulus@samba.org>, Andreas Larsson <andreas@gaisler.com>, "David
 S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Maxime
 Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@siol.net>, Joyce Ooi <joyce.ooi@intel.com>, Chris Snook
 <chris.snook@gmail.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Sunil Goutham
 <sgoutham@marvell.com>, Fugang Duan <fugang.duan@nxp.com>, Madalin Bucur
 <madalin.bucur@nxp.com>, Pantelis Antoniou <pantelis.antoniou@gmail.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta
 <salil.mehta@huawei.com>, Hauke Mehrtens <hauke@hauke-m.de>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Vadym Kochan
 <vkochan@marvell.com>, Taras Chornyi <tchornyi@marvell.com>, Mirko Lindner
 <mlindner@marvell.com>, Stephen Hemminger <stephen@networkplumber.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, Bryan Whitehead
 <bryan.whitehead@microchip.com>, Vladimir Zapolskiy <vz@mleia.com>, Sergei
 Shtylyov <sergei.shtylyov@gmail.com>, Byungho An <bh74.an@samsung.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Giuseppe Cavallaro
 <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@st.com>, Jose
 Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Kevin Hilman
 <khilman@baylibre.com>, Neil Armstrong <narmstrong@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Vinod Koul <vkoul@kernel.org>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Grygorii Strashko
 <grygorii.strashko@ti.com>, Wingman Kwok <w-kwok2@ti.com>, Murali Karicheri
 <m-karicheri2@ti.com>, Michal Simek <michal.simek@xilinx.com>, Radhey Shyam
 Pandey <radhey.shyam.pandey@xilinx.com>, Kalle Valo <kvalo@codeaurora.org>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Stanislaw Gruszka <stf_xl@wp.pl>,
 Helmut Schaa <helmut.schaa@googlemail.com>, Heiner Kallweit
 <hkallweit1@gmail.com>, Frank Rowand <frowand.list@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, =?ISO-8859-1?Q?J=E9r=F4me?=
 Pouiller <jerome.pouiller@silabs.com>, Vivien Didelot
 <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Date: Tue, 27 Apr 2021 09:44:07 +1000
In-Reply-To: <108f268a35843368466004f7fe5f9f88@walle.cc>
References: <20210412174718.17382-1-michael@walle.cc>
 <20210412174718.17382-3-michael@walle.cc>
 <730d603b12e590c56770309b4df2bd668f7afbe3.camel@kernel.crashing.org>
 <8157eba9317609294da80472622deb28@walle.cc>
 <CAL_JsqLrx6nFZrKiEtm2a1vDvQGG+FkpGtJCG2osM8hhGo3P=Q@mail.gmail.com>
 <108f268a35843368466004f7fe5f9f88@walle.cc>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_165657_820362_E2CCFC88 
X-CRM114-Status: GOOD (  12.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-04-26 at 12:54 +0200, Michael Walle wrote:
> Before I'll try to come up with a patch for this, I'd like to get
> your opinion on it.
> 
> (1) replacing of_get_mac_address(node) with eth_get_mac_address(dev)
>      might sometimes lead to confusing comments like in
>      drivers/net/ethernet/allwinner/sun4i-emac.c:
> 
>      /* Read MAC-address from DT */
>      ret = of_get_mac_address(np, ndev->dev_addr);

You could leave it or turn it into "from platform", doesn't matter...

> (2) What do you think of eth_get_mac_address(ndev). That is, the

Not sure what you mean, eth_platform_get_mac_address() takes the
address as an argument. I think what you want is a consolidated
nvmem_get_mac_address + eth_platform_get_mac_address that takes a
device, which would have no requirement of the bus_type at all.

Cheers,
Ben.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
