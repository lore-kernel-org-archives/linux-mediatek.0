Return-Path: <SRS0=XaoX=OK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74060C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 12:02:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 315B260EE2
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Sep 2021 12:02:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 315B260EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0a1Brm6fbcyoyH1g4qOFkZYNlAlR/XjfaAr3OpUrzMc=; b=ugOpbJVy7ADL3g
	5hHdLcaQyuZrPMMFQRX8GMz2pk9xs8d9hFtWHiaWNqKxE3OY/03LEvAP8HFNPmkHdE4AoozOfCvD/
	yivbvyz97S2i7pqQMpDRXCbOj/KX2O+eItuhHSG6CNfsry1SxxmjXnUPKNCOdoqniOCyKJvEaJUII
	bHPdzeAu8LdYKKmMAIW6Gj7rFotV4W2cN+QRIoE0brYGyD1yFJXqjITtVXwjHnq8nQSf1RUBA6f6b
	Tsp5WbQzMjLIdfHQZnOLj85uswjyjJPDtcqi2y06SWPARAbxa1oKh7GFOlZsmAN3KGDFlmC9pqsRZ
	Zan4wZ17atW2zUO9kw0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSHza-001U2C-Sp; Mon, 20 Sep 2021 12:01:50 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSHzW-001U1L-6p; Mon, 20 Sep 2021 12:01:47 +0000
Received: by mail-wr1-x430.google.com with SMTP id g16so28921470wrb.3;
 Mon, 20 Sep 2021 05:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/ne40pWRrx2CrzneTyBnCtWRrTGbYgrZIHpswHWcqFg=;
 b=XQUOGT4c82LgLfAKQHMnG83GjfBn5NbeBgTZySjeCqPbRi/oPAEoMSZRRLjag6+hTP
 KV6WTUmbgmxWt3zAO7q1YlAud6ZMu8v0ORNJs5Tbd06ExzfdJCqDQ6XxmPBULWEHvKzc
 0b/QMImOjgmeJhBce1X3IDuPxmAGmjsI91Lrrzo0wgnuwqoEMvREmRKk8Hx0N/k9Lgsk
 ypY16GdBGxl3w/CHqtp4+wAVDOWyJCmowywK9hOyJYQtpTfibBFKgnasY8MaRgjwITwh
 pBn5kMGtDUqArcXygEp9xAvjxovdzHLqsFogf2Rf8uvGhqDDG51uWbzZRBaNxJx/nyX1
 K+DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/ne40pWRrx2CrzneTyBnCtWRrTGbYgrZIHpswHWcqFg=;
 b=LZt10v/4K+sUQwGVmtV8CABl8fGDTIcEWFIwfF10AzRHW2GVCGv7cvIajM6FKvIklo
 1E9NXJ8f9mokyK/i8m4HhftSV2yCNR19a1mWUxIxM6HaAAN7Qhm03YlevjrFNYS1gMWv
 eGNXuGS8g+f9x9TrlxtVcNXhxl3eVD7+otZkKnv2BJ0hzKQtZqkf/9Qqris4MmkOjUWa
 P6BrzUORybScHxQeU45RyI487E+7Hh++bHL9nWd8n3vQY1rIF6Qyr4mo72H6YSM97VSS
 aamvh4WejPBhb2LAk6xbdtk1gJFSfl8I9ePlZJV5GVNOVTQDb/W9Vf2FBGKh+smrIVvA
 2G4Q==
X-Gm-Message-State: AOAM531E0uxlbcopwjldT9i2lio2+IRDhg0zS47kvF9nvnGndaNYQqpj
 5z9yVWwhGmYfmGfKuPRDtDE=
X-Google-Smtp-Source: ABdhPJx69lUhsTXiVkcOUNtmVmoOBPXkrL/CXP1uxgR/bzPlKPCqAwWnBQwLvpTAC3aOmkWxW87b3g==
X-Received: by 2002:a05:600c:4991:: with SMTP id
 h17mr29133387wmp.74.1632139303375; 
 Mon, 20 Sep 2021 05:01:43 -0700 (PDT)
Received: from [192.168.2.177] ([206.204.146.29])
 by smtp.gmail.com with ESMTPSA id h8sm18589623wmb.35.2021.09.20.05.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Sep 2021 05:01:42 -0700 (PDT)
Message-ID: <fe15479d-7500-a48e-8658-936eca0fc099@gmail.com>
Date: Mon, 20 Sep 2021 14:01:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH v4 1/2] arm: dts: mt7623: add musb device nodes
Content-Language: en-US
To: Sungbo Eo <mans0n@gorani.run>, linux-mediatek@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>, Bin Liu <b-liu@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210822041333.5264-1-mans0n@gorani.run>
 <20210830155903.13907-1-mans0n@gorani.run>
 <20210830155903.13907-2-mans0n@gorani.run>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20210830155903.13907-2-mans0n@gorani.run>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210920_050146_326063_4A07B0CD 
X-CRM114-Status: GOOD (  17.04  )
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



On 30/08/2021 17:59, Sungbo Eo wrote:
> MT7623 has an musb controller that is compatible with the one from MT2701.
> 
> Signed-off-by: Sungbo Eo <mans0n@gorani.run>
> Tested-by: Frank Wunderlich <frank-w@public-files.de>

Applied to v5.15-next/dts32

Thanks

> ---
> v4:
> * add tested by Frank
> 
> v3:
> * remove unnecessary status=okay from u2port2
> 
> v2:
> * rename usb3 label to usb0
> * move usb0 & u2phy1 nodes to the right sorted place
> * disable u2phy1 by default
> * correct u2port2 node name to match its reg address
> ---
>   arch/arm/boot/dts/mt7623.dtsi  | 33 +++++++++++++++++++++++++++++++++
>   arch/arm/boot/dts/mt7623a.dtsi |  4 ++++
>   2 files changed, 37 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/mt7623.dtsi b/arch/arm/boot/dts/mt7623.dtsi
> index 3c11f7cfcc40..21c8a291b74e 100644
> --- a/arch/arm/boot/dts/mt7623.dtsi
> +++ b/arch/arm/boot/dts/mt7623.dtsi
> @@ -585,6 +585,39 @@ spi2: spi@11017000 {
>   		status = "disabled";
>   	};
>   
> +	usb0: usb@11200000 {
> +		compatible = "mediatek,mt7623-musb",
> +			     "mediatek,mtk-musb";
> +		reg = <0 0x11200000 0 0x1000>;
> +		interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-names = "mc";
> +		phys = <&u2port2 PHY_TYPE_USB2>;
> +		dr_mode = "otg";
> +		clocks = <&pericfg CLK_PERI_USB0>,
> +			 <&pericfg CLK_PERI_USB0_MCU>,
> +			 <&pericfg CLK_PERI_USB_SLV>;
> +		clock-names = "main","mcu","univpll";
> +		power-domains = <&scpsys MT2701_POWER_DOMAIN_IFR_MSC>;
> +		status = "disabled";
> +	};
> +
> +	u2phy1: t-phy@11210000 {
> +		compatible = "mediatek,mt7623-tphy",
> +			     "mediatek,generic-tphy-v1";
> +		reg = <0 0x11210000 0 0x0800>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		status = "disabled";
> +
> +		u2port2: usb-phy@11210800 {
> +			reg = <0 0x11210800 0 0x0100>;
> +			clocks = <&topckgen CLK_TOP_USB_PHY48M>;
> +			clock-names = "ref";
> +			#phy-cells = <1>;
> +		};
> +	};
> +
>   	audsys: clock-controller@11220000 {
>   		compatible = "mediatek,mt7623-audsys",
>   			     "mediatek,mt2701-audsys",
> diff --git a/arch/arm/boot/dts/mt7623a.dtsi b/arch/arm/boot/dts/mt7623a.dtsi
> index 0735a1fb8ad9..d304b62d24b5 100644
> --- a/arch/arm/boot/dts/mt7623a.dtsi
> +++ b/arch/arm/boot/dts/mt7623a.dtsi
> @@ -35,6 +35,10 @@ &scpsys {
>   	clock-names = "ethif";
>   };
>   
> +&usb0 {
> +	power-domains = <&scpsys MT7623A_POWER_DOMAIN_IFR_MSC>;
> +};
> +
>   &usb1 {
>   	power-domains = <&scpsys MT7623A_POWER_DOMAIN_HIF>;
>   };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
