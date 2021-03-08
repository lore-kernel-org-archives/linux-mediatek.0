Return-Path: <SRS0=Z3i2=IG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06C97C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 20:09:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D9D56522E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Mar 2021 20:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D9D56522E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EdzhdE17pyhuhMqfnQ0EUBVl77/I6xs+k4+YqS3UVhw=; b=e5jnkDoqbCmuSV9bO4Adha1NE
	n9GAwjEGTt6DWRlRcA5uQ5dXnHdwqY08ScZlmCQyvVVPooQoIxo/nwyOFMwGF0S4hCkHiBk9UZv+h
	pOdZYNPL46XfFbvuheGl+p6y5qUZd2297qkEj9w2LEmvKVpGUVDY2abOqSfqghT+agfNYea9ZXqWa
	2c1MiEyGPY3FQ3lliyiMrUnhK1FJrjHQSO5it1mjnoeKnwy71bZK/chmDyV4AEswsVG6Aem2fT5WQ
	FNBxJB/qVnVJmOax1Fhl7EDBEAaOmdSzaympKHgjP1l6Sm/BUoncXaGWik/A0lEL7hujdC6iyXBks
	PtOEIKpHQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJMBA-002Pp4-81; Mon, 08 Mar 2021 20:08:36 +0000
Received: from mail-il1-f171.google.com ([209.85.166.171])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJMAP-002PKz-Ck; Mon, 08 Mar 2021 20:07:59 +0000
Received: by mail-il1-f171.google.com with SMTP id c10so9999871ilo.8;
 Mon, 08 Mar 2021 12:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hb9MlUCruG+kWO1lKH57/wKc+G9ftT/gzGlYNA3L+cY=;
 b=p1vH6cBYhZYm+/amWzhU+SiilkCvzVncmU+YbENMJuzeBAbbnvr5eBuzXvXgVKFVNn
 lPobJjH6hHaCEWgU9VN5XfSigp3KmHNJv5BoMgNjlbWJr06RrdJ6cmfOVGdvmtE4BAYF
 BKNGnj0woXrSb2AZEitgw4C+g8+oH42oBfiAhMmssJgBqE2o1pbKCFHv19GzJZuxeEft
 gt0Qf/diufPwDGPyKoUlt/6d65Fj/dNnD1LbAjJIYMT0EXNW4TxC/iMiwPnFK2x1JqZr
 WkLpJrvdYdCtCDOejKTgyRYHh/FoqGMtSvj7xcYuPV6nBDUfXCvWOw+kL0Q2r8GoVehT
 zQLQ==
X-Gm-Message-State: AOAM531BbSai40Y8G8pp54bMg5dgF58IjpWpcoD6GarQJCNR6+Ys5V6x
 PL22tZEqKl4pdpBKrti0qQ==
X-Google-Smtp-Source: ABdhPJxJSPHeVH4KC5FKA9esv3cMQl9/CgiicCpLVF3hxcpaQHUSFrOy1AD0/tRq282E/iRzM+XXBw==
X-Received: by 2002:a05:6e02:1be6:: with SMTP id
 y6mr20569869ilv.145.1615234068215; 
 Mon, 08 Mar 2021 12:07:48 -0800 (PST)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id b20sm6421949iod.22.2021.03.08.12.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 12:07:47 -0800 (PST)
Received: (nullmailer pid 2877901 invoked by uid 1000);
 Mon, 08 Mar 2021 20:07:46 -0000
Date: Mon, 8 Mar 2021 13:07:46 -0700
From: Rob Herring <robh@kernel.org>
To: Vic Wu <vic.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: mediatek - remove obsolete documentation
Message-ID: <20210308200746.GA2870408@robh.at.kernel.org>
References: <20210303093950.20309-1-vic.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210303093950.20309-1-vic.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_200750_417204_DCB34985 
X-CRM114-Status: GOOD (  22.32  )
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

On Wed, Mar 03, 2021 at 05:39:50PM +0800, Vic Wu wrote:
> The crypto mediatek driver has been replaced by the inside-secure driver now.
> Remove DT bindings documentation and update crypto engine nodes to the mt7623.dtsi files.

Wrap lines.

> 
> Signed-off-by: Vic Wu <vic.wu@mediatek.com>
> Acked-by: Ryder Lee <ryder.lee@mediatek.com>
> ---
>  Documentation/devicetree/bindings/crypto/mediatek-crypto.txt       | 25 -------------------
>  arch/arm/boot/dts/mt7623.dtsi                 |  8 +++---
>  2 files changed, 3 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/crypto/mediatek-crypto.txt
> 
> diff --git a/Documentation/devicetree/bindings/crypto/mediatek-crypto.txt b/Documentation/devicetree/bindings/crypto/mediatek-crypto.txt
> deleted file mode 100644
> index 450da3661cad..000000000000
> --- a/Documentation/devicetree/bindings/crypto/mediatek-crypto.txt
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -MediaTek cryptographic accelerators
> -
> -Required properties:
> -- compatible: Should be "mediatek,eip97-crypto"
> -- reg: Address and length of the register set for the device
> -- interrupts: Should contain the five crypto engines interrupts in numeric
> -	order. These are global system and four descriptor rings.
> -- clocks: the clock used by the core
> -- clock-names: Must contain "cryp".
> -- power-domains: Must contain a reference to the PM domain.
> -
> -
> -Example:
> -	crypto: crypto@1b240000 {
> -		compatible = "mediatek,eip97-crypto";
> -		reg = <0 0x1b240000 0 0x20000>;
> -		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_LOW>,
> -			     <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>,
> -			     <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>,
> -			     <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>,
> -			     <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
> -		clocks = <&ethsys CLK_ETHSYS_CRYPTO>;
> -		clock-names = "cryp";
> -		power-domains = <&scpsys MT2701_POWER_DOMAIN_ETH>;
> -	};
> diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
> index aea6809500d7..25e3f3b04123 100644
> --- a/arch/arm/boot/dts/mt7623.dtsi
> +++ b/arch/arm/boot/dts/mt7623.dtsi
> @@ -949,16 +949,14 @@
>  	};
>  
>  	crypto: crypto@1b240000 {
> -		compatible = "mediatek,eip97-crypto";
> +		compatible = "inside-secure,safexcel-eip97";

Please read what the new binding says about this compatible string.

>  		reg = <0 0x1b240000 0 0x20000>;
>  		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>,
>  			     <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>,
> -			     <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>,
> -			     <GIC_SPI 97 IRQ_TYPE_LEVEL_LOW>;
> +			     <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;

Where did the extra interrupt go?

> +		interrupt-names = "ring0", "ring1", "ring2", "ring3";
>  		clocks = <&ethsys CLK_ETHSYS_CRYPTO>;
> -		clock-names = "cryp";
> -		power-domains = <&scpsys MT2701_POWER_DOMAIN_ETH>;

Suddenly the h/w is not in a power domain?

Seems to me 'mediatek,eip97-crypto' should be added to the common driver 
without having a dts change.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
