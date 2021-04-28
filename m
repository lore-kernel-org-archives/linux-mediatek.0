Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A0D6C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 08:10:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7952361413
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 08:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7952361413
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=as+koWyxiC3SAWrXYLWvlAAXnY6wd3k7OzlfthK4BqY=; b=LCoBPEQjSYWmWy3i0f2JJpO2D
	R/Ati2GURTsUd0GeHjeHdshhhAt2dyv3qSnyD2doKD5YFGQmFmlsTEAnx6aQO45VApi3iKAms54wc
	981kP4LWYaM+AAjItGgqAjOlhxCgIe+1Fo3XKHq+BfOF20v7f+fXbPdKiJOeqsAvpNyZzY/GHxTHx
	47qlHOcEGSCIx+Ing3xO5wJEtucKICcMtDIueRHzZhrqnD9nPIcqiwjC5x+5UhcbNRiJUxzKQJghb
	Jd9HHLSly+0PR+R5dMy7kE/zOyJ2IvXDsOu6/GyRuKeeENBJvD+ql2zBAEggLbBDt2RoxFExdD2h/
	PWdgFRcqA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbfGV-0035jW-7x; Wed, 28 Apr 2021 08:09:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbfGK-0035hK-GZ; Wed, 28 Apr 2021 08:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:References:In-Reply-To:
 Subject:Cc:To:From:Date:Content-Transfer-Encoding:Content-Type:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=M9NlOCpW1MZNsl/vA/TRzY5PiytDAsgS7p11KntpwDc=; b=xBF7Ut2Q6dAfLweif9iDvZbwbO
 Jsz32v/cT66tstXnu9DyqwkYJzdXxsImBKZhjB/xkrXujiA/silWVPm33o12h24oPBTy/o2ftUabM
 JAlP3A1W4uspn+UVVjAXj39gcv7L9Y//nQ1rclvHk2W2cGWcldU99+0jQBISrS8CnmRtT9NycgSkr
 VEoMtYKUe7gr5hCa9ROVHhELaO1zmv8eCxzoitZ0peYP3X6B80zTUqGQmIWLlBRHsR2YfsVHe2zqz
 yU/he6JrjggzSkUsKNHPLDwms7v2CipvBJLdPCdfcsEaqMiEfEbcrAQDT59Ku6e32NW1tKdYYP9Jn
 AxGai7vg==;
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbfGH-00HGux-P1; Wed, 28 Apr 2021 08:09:35 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 3392E2224F;
 Wed, 28 Apr 2021 10:09:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1619597371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M9NlOCpW1MZNsl/vA/TRzY5PiytDAsgS7p11KntpwDc=;
 b=TeuOHOIozerVUFBEq+kXl+E4fsEw1MWqgROl2oA8Sc/xKOT0oXpynCQIkw1papfFwz22RM
 ZqopdTbGj/RRv3+sDFrM+3v84W6DRuM04o8XbE5Tyx09iWpSYtyaTodlAwmk1PVwQpm/hS
 zB6aEh6Z4dXpMFJB4kyQVt3Zk/Jvibs=
MIME-Version: 1.0
Date: Wed, 28 Apr 2021 10:09:17 +0200
From: Michael Walle <michael@walle.cc>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Rob Herring <robh+dt@kernel.org>, QCA ath9k Development
 <ath9k-devel@qca.qualcomm.com>, Microchip Linux Driver Support
 <UNGLinuxDriver@microchip.com>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, netdev
 <netdev@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, "open list:MEDIA DRIVERS FOR RENESAS -
 FCP" <linux-renesas-soc@vger.kernel.org>, "moderated list:ARM/STM32
 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, "open
 list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 linux-oxnas@groups.io, linux-omap <linux-omap@vger.kernel.org>,
 linux-wireless <linux-wireless@vger.kernel.org>, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev, Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Andreas Larsson <andreas@gaisler.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@siol.net>, Joyce Ooi <joyce.ooi@intel.com>, Chris Snook
 <chris.snook@gmail.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli
 <f.fainelli@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu
 Beznea <claudiu.beznea@microchip.com>, Sunil Goutham <sgoutham@marvell.com>,
 Fugang Duan <fugang.duan@nxp.com>, Madalin Bucur <madalin.bucur@nxp.com>,
 Pantelis Antoniou <pantelis.antoniou@gmail.com>, Claudiu Manoil
 <claudiu.manoil@nxp.com>, Li Yang <leoyang.li@nxp.com>, Yisen Zhuang
 <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Hauke
 Mehrtens <hauke@hauke-m.de>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, Vadym Kochan <vkochan@marvell.com>, Taras
 Chornyi <tchornyi@marvell.com>, Mirko Lindner <mlindner@marvell.com>,
 Stephen Hemminger <stephen@networkplumber.org>, Felix Fietkau
 <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
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
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>, Ryder Lee
 <ryder.lee@mediatek.com>, Stanislaw Gruszka <stf_xl@wp.pl>, Helmut Schaa
 <helmut.schaa@googlemail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Frank
 Rowand <frowand.list@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, =?UTF-8?Q?J=C3=A9r=C3=B4me_Pouiller?=
 <jerome.pouiller@silabs.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next v4 2/2] of: net: fix of_get_mac_addr_nvmem() for
 non-platform devices
In-Reply-To: <3677398ebb77f334abb4899770db633d9658fe82.camel@kernel.crashing.org>
References: <20210412174718.17382-1-michael@walle.cc>
 <20210412174718.17382-3-michael@walle.cc>
 <730d603b12e590c56770309b4df2bd668f7afbe3.camel@kernel.crashing.org>
 <8157eba9317609294da80472622deb28@walle.cc>
 <CAL_JsqLrx6nFZrKiEtm2a1vDvQGG+FkpGtJCG2osM8hhGo3P=Q@mail.gmail.com>
 <108f268a35843368466004f7fe5f9f88@walle.cc>
 <3677398ebb77f334abb4899770db633d9658fe82.camel@kernel.crashing.org>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <452795c5254b65cfba6e52cfc94d92bd@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_010934_149625_74E7EE97 
X-CRM114-Status: GOOD (  12.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 2021-04-27 01:44, schrieb Benjamin Herrenschmidt:
> On Mon, 2021-04-26 at 12:54 +0200, Michael Walle wrote:
>> (2) What do you think of eth_get_mac_address(ndev). That is, the
> 
> Not sure what you mean, eth_platform_get_mac_address() takes the
> address as an argument. I think what you want is a consolidated
> nvmem_get_mac_address + eth_platform_get_mac_address that takes a
> device, which would have no requirement of the bus_type at all.

Sure. What I meant was the following:

  eth_get_mac_address(struct net_device *ndev)
vs.
  eth_get_mac_address(struct device *dev, u8 *mac_buf)

The first would assume the destination is ndev->dev_addr (which
is true for most of the calls, but not all).

-michael

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
