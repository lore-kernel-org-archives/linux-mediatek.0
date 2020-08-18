Return-Path: <SRS0=p+jW=B4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB99AC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 16:24:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA7F22067C
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Aug 2020 16:24:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="km898v/Y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CG9yiwKn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA7F22067C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cby5l0ap/NPmJqpp63mV380OLG7RBvHKg+JHgZMpRHk=; b=km898v/Yax1CntEP7VELH3McS
	shNOOMz4Er0gHsVwIOl8oACuCd8yD+wFHBuqbw6edpwYwsDo7DVqi4tpXsz+0zcyfbgS9eMoDs3B8
	3JjC1MYVU31/w5GsAS2fQdKMoelfWLptbd0uvWiY9s7D2IAqf+z2QC/Kox6sdxIl8+LRD9CGjKL81
	RbsrOwTDt/GVin4trdMU5I2/5TZVzb3oTCIPe5qTAtTZojBYsaPp6YYoZ7fUbjlYIh/9U8GRXaS0N
	6LBQgu2yVi7kfUUfhgZvWe2l3gm4iNZZIO17ghsGxgPeHabprUtuBgFjBbeypAnBasqyUPhs2aw3p
	cqwrrIKpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k84Ph-0004b0-Df; Tue, 18 Aug 2020 16:24:41 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k84Pf-0004aG-41
 for linux-mediatek@lists.infradead.org; Tue, 18 Aug 2020 16:24:39 +0000
Received: by mail-ed1-x544.google.com with SMTP id i6so15728589edy.5
 for <linux-mediatek@lists.infradead.org>; Tue, 18 Aug 2020 09:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ABFOP25vcfvo4LZNoyXDRVye0sT22qu+YFacCi1B39Q=;
 b=CG9yiwKn3liqDsNzpdCRwGkl4HE6WWUICx8UKbtOTakYd9Iaqvrsd42y6bZK1pqUXy
 GZNfBUysCXAFiarmFGDUkWbw2sf5DdUM+4MbFV0Z8BNfO+2i+TqBi6v/IFC8jIGfYp/q
 N5K9WHvT77zviPudmzqifQ+vsrG35Qi9nsuJoSdvQuIsGgMPRS0joTVoVpGUOirS7dgO
 BKc6Ll1QuKO/FX/LWzu/tjMK8JWF3Gh2ObkkBP8Zc/4BBD6afJKdDC+knjwu356PQS9v
 fQMeT+DsGcYfvWfPX8vHKxbGsxNUZNJAqj6POjpZLhpJybTVqjbpqG3yfgrNoaZmaplU
 IlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ABFOP25vcfvo4LZNoyXDRVye0sT22qu+YFacCi1B39Q=;
 b=SLI8eax8P6pha3sMblr865vBHljncdxEjm/k9dYrGVyzX7kkyzwtHH6+4iN3RvNvpA
 hnyVY8NavNLM4c/QKJcE+NQVu/Wny7nNUU80X9iwFGY8exft+1w0JVa46mai/JwGGEYH
 o1htDHyeFQwBTR4zlGtkNSFhuCt6s1kSSCM2tMW9j7CF8JbU6D6oRAOYRKXKFeyqT1CD
 fexldSgTW/JEmRvlX9/LsRXdmKK6Qps2CVmLey2qqfR2msZnK3YZrXn7wMVq43DAjmI9
 riRTrbXDrkxjWDvTIwN5UysJvK8lRqSZVlP0fam43sW5cLpD+76DBSMKV6ysFHR7qT76
 R8CA==
X-Gm-Message-State: AOAM532TuVocCx6sx3DTGLrIShpQ4pzZqt1SV7XeHSKT5yfj1BRzi1WU
 B3hHP3fFfKbvfuAh2YDmHpA=
X-Google-Smtp-Source: ABdhPJzldd7FWN+S/aRQ3C9ERX063zeUx9ZKsaVvZci3HYChB2hIMvVXEVj6gq43KyTwJwOPxJ/rwg==
X-Received: by 2002:aa7:c246:: with SMTP id y6mr21292821edo.78.1597767876264; 
 Tue, 18 Aug 2020 09:24:36 -0700 (PDT)
Received: from skbuf ([86.126.22.216])
 by smtp.gmail.com with ESMTPSA id w18sm16697068ejf.37.2020.08.18.09.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 09:24:35 -0700 (PDT)
Date: Tue, 18 Aug 2020 19:24:33 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Re: [PATCH net-next v2 7/7] arm64: dts: mt7622: add mt7531 dsa to
 bananapi-bpi-r64 board
Message-ID: <20200818162433.elqh3dxmk6vilq6u@skbuf>
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <2a986604b49f7bfbee3898c8870bb0cf8182e879.1597729692.git.landen.chao@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a986604b49f7bfbee3898c8870bb0cf8182e879.1597729692.git.landen.chao@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200818_122439_174163_CC9B668B 
X-CRM114-Status: GOOD (  15.46  )
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
Cc: mark.rutland@arm.com, andrew@lunn.ch, frank-w@public-files.de,
 f.fainelli@gmail.com, dqfext@gmail.com, vivien.didelot@savoirfairelinux.com,
 netdev@vger.kernel.org, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 18, 2020 at 03:14:12PM +0800, Landen Chao wrote:
> Add mt7531 dsa to bananapi-bpi-r64 board for 5 giga Ethernet ports support.
> 
> Signed-off-by: Landen Chao <landen.chao@mediatek.com>
> ---
>  .../dts/mediatek/mt7622-bananapi-bpi-r64.dts  | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> index d174ad214857..c57b2571165f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
> @@ -143,6 +143,50 @@
>  	mdio: mdio-bus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +
> +		switch@0 {
> +			compatible = "mediatek,mt7531";
> +			reg = <0>;
> +			reset-gpios = <&pio 54 0>;
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					label = "wan";
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					label = "lan0";
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +					label = "lan1";
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +					label = "lan2";
> +				};
> +
> +				port@4 {
> +					reg = <4>;
> +					label = "lan3";
> +				};
> +
> +				port@6 {
> +					reg = <6>;
> +					label = "cpu";
> +					ethernet = <&gmac0>;
> +					phy-mode = "2500base-x";
> +				};

Is there any reason why you're not specifying a fixed-link node here?

> +			};
> +		};
> +
>  	};
>  };
>  
> -- 
> 2.17.1

Thanks,
-Vladimir

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
