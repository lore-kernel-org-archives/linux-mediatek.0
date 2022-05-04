Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF9FC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 15:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N+7Lco7R1Juxw7/b1d+ZkiuwAlSyI7sFLZSunanJlRQ=; b=iVAqIuTIV3Kn+I
	y9VdYrHs+pKMIIASjkGJom7+UKJpGW9o5r/C+CZ9UvTWOsFjhQQeF10bCt8KjR8Wpn0aFCyrvyWVJ
	TxBPIHVU9l90t49uxYlyHYNpXaiyU7eIH47kSG0fnKkpwhUuQZ7BTo3c8d8pXgbUnLiVg6U/EZoXx
	CwVw2q4j65wE8gfg3BEv5rSOxE8XbXn7zkM+0uoTZaX8mrsLcTliVkK6ZBGuPsdJWOhcPiZtyoz+U
	pmnv+euhPxhKlwCv857uMnz6l29Ovvi3D/fNJcuoW+37eaHC5e5SSrS0nk5fd+9ieiiVhz37M9Ser
	Koo4cOnU9y1aKs4J5znA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmGsA-00BQsS-TV; Wed, 04 May 2022 15:25:02 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmGs4-00BQqL-C8; Wed, 04 May 2022 15:25:01 +0000
Received: by mail-ed1-x530.google.com with SMTP id p4so2126320edx.0;
 Wed, 04 May 2022 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=wOYVxYLL6+BG3TePrLsXdWjDVPS5GIUfbLWvSKSl8h4=;
 b=E7T0aF/BXgKfjiVEfL+S2vuOTV2X2yNSlckCr6+J5M7W+t5VoAN+Og/Yv5P36CGu74
 VvkDxRjgzUKvk2WA0JTA5u6U/m+zPkvpUSM+bFtCUQNpjrhvSusOBZAipF95jlUXSeid
 oZ1vPEHG/g/L1B4fu1ZmNQjZlqqUv13WaosS+SE2TWD24vArT8f8QwQ1uFAliabkCjSQ
 S7HStKY/EqJRikDQe1JuWbZdS0JxTZrL5Iu4AFJTkhE3CQDiB8JRyoIr2f6YTzBwQUGM
 nVE4bRY+sKyuRdsof4VCxH9EtrcwyOcKFWC5vdaDWVbtygWvvchlxdy60RA6dKapoO6Z
 2aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wOYVxYLL6+BG3TePrLsXdWjDVPS5GIUfbLWvSKSl8h4=;
 b=hXVLOA/UcAKySpcaQc2ObAOQp2tNoqGfmmf/1LrLmSRva52crp33eEvnPEpwudvrkM
 hn+v/OFj11DYzojirlLkVoHIsGRoytIUOJQb1g3VGoc7t3jstpgC+z4hKGziWg2nPFzV
 SiI0qMvURzU4xzb4q51JotyGh/c56zXTjYPJzKyrUwSo3bAS0JYcQI662IWihtWKcZNQ
 p8xzoys1Dw9UcdJj5joMgp/sVCpAizh7f3RPCAUC8fqFcWT9bhVKt7gHE+GEILQaKHGn
 F5tDLdJUH/8JU5eJfolfelu8t1n4Y3iZUmKc9ka3RHFy/kM2s9vAbGlfmEjVke+WAi5O
 l0mA==
X-Gm-Message-State: AOAM530wH3vDAKoeuuarG4AfZMihFZrYFagPFvOIVrBGNHHTbjGjtMNY
 vn5cBhKJzYPUTQ/gyWPXDhI=
X-Google-Smtp-Source: ABdhPJxEFFzGhqnPOG0Za6rPtdUf8ua0dRw2gu36H+cAyAv37Oe0WTmKKVlESwvCZomBMQkRM2P7XA==
X-Received: by 2002:aa7:dcc1:0:b0:427:e1ae:d822 with SMTP id
 w1-20020aa7dcc1000000b00427e1aed822mr9129036edu.353.1651677892502; 
 Wed, 04 May 2022 08:24:52 -0700 (PDT)
Received: from skbuf ([188.25.160.86]) by smtp.gmail.com with ESMTPSA id
 k6-20020aa7d8c6000000b0042617ba63d0sm9311741eds.90.2022.05.04.08.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 08:24:51 -0700 (PDT)
Date: Wed, 4 May 2022 18:24:50 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [RFC v2 4/4] arm64: dts: rockchip: Add mt7531 dsa node to
 BPI-R2-Pro board
Message-ID: <20220504152450.cs2afa4hwkqp5b5m@skbuf>
References: <20220430130347.15190-1-linux@fw-web.de>
 <20220430130347.15190-5-linux@fw-web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220430130347.15190-5-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_082456_449902_7FD6774E 
X-CRM114-Status: GOOD (  16.99  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, DENG Qingfang <dqfext@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Apr 30, 2022 at 03:03:47PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add Device Tree node for mt7531 switch connected to gmac0.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - drop status=disabled
> ---
>  .../boot/dts/rockchip/rk3568-bpi-r2-pro.dts   | 48 +++++++++++++++++++
>  1 file changed, 48 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> index ed2f2bd9a016..f0ffbe818170 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts
> @@ -437,6 +437,54 @@ &i2c5 {
>  	status = "disabled";
>  };
>  
> +&mdio0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	switch@0 {

I think the preferable names are the newer "ethernet-switch@0",
"ethernet-ports", "ethernet-port@0".

Otherwise

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

> +		compatible = "mediatek,mt7531";
> +		reg = <0>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@1 {
> +				reg = <1>;
> +				label = "lan0";
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				label = "lan1";
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +				label = "lan2";
> +			};
> +
> +			port@4 {
> +				reg = <4>;
> +				label = "lan3";
> +			};
> +
> +			port@5 {
> +				reg = <5>;
> +				label = "cpu";
> +				ethernet = <&gmac0>;
> +				phy-mode = "rgmii";
> +
> +				fixed-link {
> +					speed = <1000>;
> +					full-duplex;
> +					pause;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &mdio1 {
>  	rgmii_phy1: ethernet-phy@0 {
>  		compatible = "ethernet-phy-ieee802.3-c22";
> -- 
> 2.25.1
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
