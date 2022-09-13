Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2030FC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 12:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNXciWA6BqdgfNcUPpkPpH5Ss8dwhE8tUSEE2Y2K5zI=; b=a3N3jeIl0ODAxzqFS93vs7UAhp
	f9GaVQc2askYpDvHGXD4VAlZ/FWBZLsMWS7I9ZR4lDZdFIE9DD+YR3NThiBgliTdDhoItOVRukWTg
	xQo4gReHwoW/cY5N7bSyIzC9iGVnl1QMb1KcGXH7pMrwz0wkk8vBiRL5W+W1xLc2vOip6eg5NCj3j
	+EhH7NGsfk7OjPks5L51/bJ0bPIN+D6zGSo27RVni8BRGRS5A0TD6kl1SCTPSk2K6vl2jlIQpKqHy
	4sM3rkw/OsIt+ZZdqmDHD1pKo6VmFgsVtUsDFuBT9ly7OO4EHDvPhh8UfmZUOvfFMCpEwX/xzPtap
	+fZ4Wh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY4jj-009j63-QY; Tue, 13 Sep 2022 12:09:55 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY4jh-009ip5-PH
	for linux-mediatek@lists.infradead.org; Tue, 13 Sep 2022 12:09:55 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1274ec87ad5so31569689fac.0
        for <linux-mediatek@lists.infradead.org>; Tue, 13 Sep 2022 05:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=kNXciWA6BqdgfNcUPpkPpH5Ss8dwhE8tUSEE2Y2K5zI=;
        b=V+cqBqyzLKFbt/IIRuyx5OJFy7NMhcY0ULI71zwudeYiAg4QwlPDkqKRsYqkykruhp
         qWgRa329fAYVwmnw7dkQYPo47XdtOR27mcvVLK/a4yI9YjGXgxWKeI4WFfKQrRXX7rEO
         jpDOkr3/rLPyb1FlJtxcAsi1FqSg1zDxhA4ggMAp/K6vcxbfbIZRGLZagALKNSxzywzB
         5Pf+ASTQKvMww+iwvRB/hAiH2I5vd/cA/PF7WKzG7HEvIfcfXHywYNmB6LChO7UWoyhm
         0xmm1ZhrTB87eYcDol+z9xh+0+XUugASVwdoCp2yXaBHA+pjyIYVF7vUN5OJqW8b/Isf
         0jOw==
X-Gm-Message-State: ACgBeo03zbMZOTCGe84OobCyuG8lP19HVf8SKMAD07hWLhlZTJytcM8/
	HLViqMtmAy6WzitVR/XoLA==
X-Google-Smtp-Source: AA6agR5fZkyuOciAWUtELSCP3YTFTV07Zglo2sV7ZS9BdibB4YNvxHRswAOzTZuQE7Lzs2KdWa6ZNA==
X-Received: by 2002:a05:6808:10d4:b0:344:f380:cf8c with SMTP id s20-20020a05680810d400b00344f380cf8cmr1408701ois.27.1663070992324;
        Tue, 13 Sep 2022 05:09:52 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id a4-20020a9d5c84000000b006370b948974sm5766977oti.32.2022.09.13.05.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 05:09:51 -0700 (PDT)
Received: (nullmailer pid 3410040 invoked by uid 1000);
	Tue, 13 Sep 2022 12:09:50 -0000
Date: Tue, 13 Sep 2022 07:09:50 -0500
From: Rob Herring <robh@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com, Bo.Jiao@mediatek.com, sujuan.chen@mediatek.com, ryder.Lee@mediatek.com, evelyn.tsai@mediatek.com, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next 01/12] arm64: dts: mediatek: mt7986: add support
 for Wireless Ethernet Dispatch
Message-ID: <20220913120950.GA3397630-robh@kernel.org>
References: <cover.1662661555.git.lorenzo@kernel.org>
 <e034b4b71437bce747b128382f1504d5cdc6974b.1662661555.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e034b4b71437bce747b128382f1504d5cdc6974b.1662661555.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_050953_838845_95A603F4 
X-CRM114-Status: GOOD (  14.37  )
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

On Thu, Sep 08, 2022 at 09:33:35PM +0200, Lorenzo Bianconi wrote:
> Introduce wed0 and wed1 nodes in order to enable offloading forwarding
> between ethernet and wireless devices on the mt7986 chipset.
> 
> Co-developed-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Signed-off-by: Bo Jiao <Bo.Jiao@mediatek.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> index e3a407d03551..419d056b8369 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
> @@ -222,6 +222,25 @@ ethsys: syscon@15000000 {
>  			 #reset-cells = <1>;
>  		};
>  
> +		wed_pcie: wed_pcie@10003000 {
> +			compatible = "mediatek,wed";

This is undocumented. It needs a binding.

> +			reg = <0 0x10003000 0 0x10>;
> +		};
> +
> +		wed0: wed@15010000 {
> +			compatible = "mediatek,wed", "syscon";

Some are syscon's and some are not?

> +			reg = <0 0x15010000 0 0x1000>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		wed1: wed@15011000 {
> +			compatible = "mediatek,wed", "syscon";
> +			reg = <0 0x15011000 0 0x1000>;
> +			interrupt-parent = <&gic>;
> +			interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
>  		eth: ethernet@15100000 {
>  			compatible = "mediatek,mt7986-eth";
>  			reg = <0 0x15100000 0 0x80000>;
> @@ -256,6 +275,7 @@ eth: ethernet@15100000 {
>  						 <&apmixedsys CLK_APMIXED_SGMPLL>;
>  			mediatek,ethsys = <&ethsys>;
>  			mediatek,sgmiisys = <&sgmiisys0>, <&sgmiisys1>;
> +			mediatek,wed = <&wed0>, <&wed1>;
>  			#reset-cells = <1>;
>  			#address-cells = <1>;
>  			#size-cells = <0>;
> -- 
> 2.37.3
> 
> 

