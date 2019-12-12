Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2E3C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 13:25:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CD04206A5
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 13:25:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Zf1rrGRw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="L5e/4sTM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CD04206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Th6TAKwEaKyQ/6Yy/sXZkYk3d8VnA2Np1/3uCseSVt8=; b=Zf1rrGRwSJ8beF
	+pcxewq8eyGFifr8DyYKtrljGPlnvj/lhXSCSmFRcf9gM6Dezs5JgdV6zQQ7eOG1ONQYbrtGV5FfG
	pkyMysyqUnwKg56E/zoP3F++wVxHR1K+uIuAoxOqOP+6RR5YJ0zD0Y7pOw8H1We0vFfduybPXlY1S
	eQfQvBGv30LhX+cmoYNKPvUtFVUZmv8bJAd0eSWZtTSOIAdwmvnJNxC76PlSceJqyP1U6+Lf/FXRQ
	7ihynD3ifVXFtq9XD4Otb93LczR5DK016ENGwpC74QJUo877QFBg7Sz8iDBWgJf0E68shOyNIiFI6
	3VVjHpouEXhuXVEC1E/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifOTX-0000mp-2g; Thu, 12 Dec 2019 13:25:51 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifOTP-0000Ya-82; Thu, 12 Dec 2019 13:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bxnXIodnVA+EXBQ9CzKw2+L2s06f/eW1ZteOUMDWsiU=; b=L5e/4sTMJEgfoy08MJh5WXYJ6i
 vtxgJMqAJUi8fKfN/Q5KP8FQnuW4FE9UBwBZ/KRoW0xWFvLE685wFxZz9EFJekPOrDAqg783JqQJ3
 XPskH3kEU7fR0/Ph78F3bj9HvZWOr4H99XHMwhfMNb8afPT2T5Xye6Z5mz+fbKas7xlU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.92.2)
 (envelope-from <andrew@lunn.ch>)
 id 1ifOT2-0002nd-BQ; Thu, 12 Dec 2019 14:25:20 +0100
Date: Thu, 12 Dec 2019 14:25:20 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Biao Huang <biao.huang@mediatek.com>
Subject: Re: [PATCH 1/2] net-next: stmmac: mediatek: add more suuport for RMII
Message-ID: <20191212132520.GB9959@lunn.ch>
References: <20191212024145.21752-1-biao.huang@mediatek.com>
 <20191212024145.21752-2-biao.huang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191212024145.21752-2-biao.huang@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_052543_286083_FAC90CA8 
X-CRM114-Status: GOOD (  11.80  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Jose Abreu <joabreu@synopsys.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 12, 2019 at 10:41:44AM +0800, Biao Huang wrote:
> MT2712 SoC can provide the rmii reference clock, and the clock
> will output from TXC pin only, which means ref_clk pin of external
> PHY should connect to TXC pin in this case.
> Add corresponding clock and timing settings.

Hi Biao

Subject line has a typo.

> @@ -278,6 +296,7 @@ static int mediatek_dwmac_config_dt(struct mediatek_dwmac_plat_data *plat)
>  	mac_delay->tx_inv = of_property_read_bool(plat->np, "mediatek,txc-inverse");
>  	mac_delay->rx_inv = of_property_read_bool(plat->np, "mediatek,rxc-inverse");
>  	plat->rmii_rxc = of_property_read_bool(plat->np, "mediatek,rmii-rxc");
> +	plat->rmii_clk_from_mac = of_property_read_bool(plat->np, "mediatek,rmii-clk-from-mac");
>  
>  	return 0;
>  }
> @@ -287,6 +306,16 @@ static int mediatek_dwmac_clk_init(struct mediatek_dwmac_plat_data *plat)
>  	const struct mediatek_dwmac_variant *variant = plat->variant;
>  	int i, num = variant->num_clks;
>  
> +	plat->mac_rmii_clk = NULL;
> +	if (plat->phy_mode == PHY_INTERFACE_MODE_RMII &&
> +	    plat->rmii_clk_from_mac) {
> +		plat->mac_rmii_clk = devm_clk_get(plat->dev, "rmii_internal");
> +		if (IS_ERR(plat->mac_rmii_clk)) {
> +			dev_err(plat->dev, "Failed to get reference clk from MAC\n");
> +			return PTR_ERR(plat->mac_rmii_clk);
> +		}
> +	}

Please don't use a binary property. This is a clock, so describe it in
DT as a clock. Add it to the existing list of clocks.

   Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
