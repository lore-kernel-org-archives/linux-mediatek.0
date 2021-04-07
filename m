Return-Path: <SRS0=xJt/=JE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF85C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 16:11:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D07B611BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Apr 2021 16:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D07B611BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iwiREH9oSPZAWbdSDGIdMxDW8Tc0XtX440YtH48wRLI=; b=GUirpDacbCImNujINZW0KMdTT
	bpa2KyhI8LixkU//pPE2G2ay1BK13X4YtiiOcmzm9BUW/YTpSqkf2kaNJiY5LXxG1CVVQMptnaRTm
	y9nJpyyBmTof3KEXMpU3QKBQ5LgBWFekapXJpSGpJ3y1FVKQ7V+TSanRRb9VfKMMI2jcCi+vkwaXj
	2svFEG9KlhrM2xkDQ4bIEd4Uh6AHxfc4/96AA77IdcO0Btrbmwvt4deC8KPFvJcWMk4q8emgV2HRw
	bo3V1mbrLnvKmkFTeVNAro437ef57/vr5enrumchfmULBp7t8eJzA3YNts89/6BagXKIQCRWbJFgG
	ZysIe8vBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUAlY-005Q1w-AA; Wed, 07 Apr 2021 16:10:52 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUAlP-005PzQ-Fc; Wed, 07 Apr 2021 16:10:45 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 18A9F22236;
 Wed,  7 Apr 2021 18:10:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1617811836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gjuAN9QqCnWD77UCettma95Ojaeyk86+8J2wmtLYYZo=;
 b=i99BezLwmPOE6w4/hGL0FvjE3br7uwuw9VGO9aRg8uJTlzeGu8Ac4FIxGX9vOQ8oMVP/r/
 vE3I00R508lGU6R1pfNebHfFNtH5wO92z1+kMGfRRoMcmLezfBux9iSvegup2fWrGU4qza
 5flIWUW4ulzNHWTXNBqNWa8WPLM3Izs=
MIME-Version: 1.0
Date: Wed, 07 Apr 2021 18:10:30 +0200
From: Michael Walle <michael@walle.cc>
To: ath9k-devel@qca.qualcomm.com, UNGLinuxDriver@microchip.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-amlogic@lists.infradead.org,
 linux-oxnas@groups.io, linux-omap@vger.kernel.org,
 linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
 linux-staging@lists.linux.dev
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Andreas
 Larsson <andreas@gaisler.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Joyce Ooi <joyce.ooi@intel.com>, Chris Snook <chris.snook@gmail.com>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 bcm-kernel-feedback-list@broadcom.com, Florian Fainelli
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
 <helmut.schaa@googlemail.com>, Heiner Kallweit <hkallweit1@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?Q?J=C3=A9r=C3=B4me?=
 =?UTF-8?Q?_Pouiller?= <jerome.pouiller@silabs.com>, Vivien Didelot
 <vivien.didelot@gmail.com>, Vladimir Oltean <olteanv@gmail.com>
Subject: Re: [PATCH net-next v3 1/2] of: net: pass the dst buffer to
 of_get_mac_address()
In-Reply-To: <20210406220921.24313-2-michael@walle.cc>
References: <20210406220921.24313-1-michael@walle.cc>
 <20210406220921.24313-2-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <50f474611ecf0f5e61c9a14a24b28773@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_171043_651294_90BD2036 
X-CRM114-Status: GOOD (  12.50  )
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

Am 2021-04-07 00:09, schrieb Michael Walle:
[..]
> diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
> index bc0a27de69d4..2d5d5e59aea5 100644
> --- a/drivers/of/of_net.c
> +++ b/drivers/of/of_net.c
> @@ -45,42 +45,35 @@ int of_get_phy_mode(struct device_node *np,
> phy_interface_t *interface)
>  }
>  EXPORT_SYMBOL_GPL(of_get_phy_mode);
> 
> -static const void *of_get_mac_addr(struct device_node *np, const char 
> *name)
> +static int of_get_mac_addr(struct device_node *np, const char *name, 
> u8 *addr)
>  {
>  	struct property *pp = of_find_property(np, name, NULL);
> 
> -	if (pp && pp->length == ETH_ALEN && is_valid_ether_addr(pp->value))
> -		return pp->value;
> -	return NULL;
> +	if (pp && pp->length == ETH_ALEN && is_valid_ether_addr(pp->value)) {
> +		ether_addr_copy(addr, pp->value);

Mh, I guess this should rather be memcpy(addr, pp->value, ETH_ALEN) 
because
ether_addr_copy() needs 2 byte aligned source and destination buffers.

-michael

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
