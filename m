Return-Path: <SRS0=Vpwr=D2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C51CC433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 10:27:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC840207DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 10:27:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QQAwdkXf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="obkwTA2D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC840207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nGcw1g1KjCG+Z9jnIAbDuUwlj/d30F9og0POnrosEw8=; b=QQAwdkXfqmWYu7W7UeZoFVUL6
	rtg/DzmS/A1Mf5Lis8qnsBemaNLCAG/CyvjB+4SzE1XY3HIr1GuMiFf1PD0hXOW5Rhz2g/O3Pkpz9
	IE23WVv2jLMyhLkvnIb5dfHmaIw2l7cQASoXNsurnw8tCILcRfmiuWcYGE87svr3WXD68W9XJRz08
	AgTL4FRRIs3Sq1Aw/qTytjf7/DFHtGDcTtQcZNzD7Sk01ciNeT3R7uyF+K0QTHdPoKShRKshY3cZu
	IDJmkb5lrfP+eA97Qujd6JRmt5x0WD5seBKvak9dqlWs6bGcG2HPre7o3vwHOiaDY19SsNthPRVR0
	UG1HsznvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUSNu-0007Sd-0q; Mon, 19 Oct 2020 10:27:22 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUSN0-00072d-PW; Mon, 19 Oct 2020 10:26:40 +0000
Received: by mail-wr1-x443.google.com with SMTP id b8so10820591wrn.0;
 Mon, 19 Oct 2020 03:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CSFSoiR2kJzHsrWAKRK/Ut+Hlk5kE7JUM9hjKMQmGRw=;
 b=obkwTA2DFeVTQnEWisa4neWookHBPbVwGq3WSQodi3oUf3SElhmcFt3m7u5dWWug15
 Asz+OdW5hWRDucIsPrWLgZBfZ62ELluqL2IbbtkBuuuTOKel+Wlg75lSHTFbVGOjnrZu
 uqaazjkxamiSbUVXKmq3PH+Y5FLqVYS2Ht39pS0WqXRrcKSEtRxzg97hblAIgzpNG1O5
 lZBM1Ji9agdIgF8hyU+HnxvykkDSV8YOLQyDJ8QVLmjp8iNspYlRZ9eObZPqEAq7ZeCi
 CvXr7xemNw2OQAzKRntoc9Rrryy0Juml8ntenShaIIQMYxtnzUcr3GbQ1lFry67Z/9Gc
 dLmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CSFSoiR2kJzHsrWAKRK/Ut+Hlk5kE7JUM9hjKMQmGRw=;
 b=nP5+ituQLn1XOqAKV0xhhB90AMjVFCQ0YN3jWykSG/7nyUrbKsNwEAdFEb/ECHm0e/
 VvhDe5BzfIWJ4y2UcaMm5/1YiFxAvIwUTER26jPwfp6nodbdTR391xiVMOWeEFxRT/4Q
 UdM312Ny4b1PuBG4jrs/MAXvq4TMPgepmjKUPwrUu0WK+ORLmw9NsnT0vF0qzhurm8EF
 fvjmDrH2B/3QJtCheLyYhDTmn5lfIhws7UeL9xC51mqeUDjvYA8TzSVJFyKzHfLDf8QK
 60+s/TyDzFTlMBC78cSRObiHZ1YWIMnBQQ23rT23EOy/hJnzOAxZG+zt3wN1cpFuc3b7
 7Mrg==
X-Gm-Message-State: AOAM5320tydyjayU4PGoSFDyaKWEHynyh3Mhc1B4IiWyteCosIj6zguX
 tqdAUD5Og1Y6jvC/RszQkb9LAnpFLTxWJg==
X-Google-Smtp-Source: ABdhPJy8+YMruJQW57HunDCnKkl6sQa+5912udPLIa8YPWx3CfbHC/Ux2jidWwCooqsBwazhJONZcQ==
X-Received: by 2002:a5d:6341:: with SMTP id b1mr911619wrw.373.1603103184718;
 Mon, 19 Oct 2020 03:26:24 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id k6sm12185969wmk.16.2020.10.19.03.26.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 03:26:24 -0700 (PDT)
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8516: add usb1 node
To: Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20201014162404.1312544-1-fparent@baylibre.com>
 <20201014162404.1312544-2-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <d2dc75dd-04ec-d1ec-a84b-f7c5cccafa73@gmail.com>
Date: Mon, 19 Oct 2020 12:26:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201014162404.1312544-2-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_062627_005290_CDE34A89 
X-CRM114-Status: GOOD (  19.11  )
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
Cc: robh+dt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 14/10/2020 18:24, Fabien Parent wrote:
> The MT8516 has 2 USB instances. Add support for the second USB instance.
> usb1 can only work in host mode.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Applied to v5.10-tmp/dts64

Thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8516.dtsi | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> index 50049b6c1ba7..eca7969e15ab 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> @@ -455,6 +455,20 @@ usb0: usb@11100000 {
>   			status = "disabled";
>   		};
>   
> +		usb1: usb@11190000 {
> +			compatible = "mediatek,mtk-musb";
> +			reg = <0 0x11190000 0 0x1000>;
> +			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_LOW>;
> +			interrupt-names = "mc";
> +			phys = <&usb1_port PHY_TYPE_USB2>;
> +			clocks = <&topckgen CLK_TOP_USB>,
> +				 <&topckgen CLK_TOP_USBIF>,
> +				 <&topckgen CLK_TOP_USB_1P>;
> +			clock-names = "main","mcu","univpll";
> +			dr_mode = "host";
> +			status = "disabled";
> +		};
> +
>   		usb_phy: usb@11110000 {
>   			compatible = "mediatek,generic-tphy-v1";
>   			reg = <0 0x11110000 0 0x800>;
> @@ -469,6 +483,13 @@ usb0_port: usb-phy@11110800 {
>   				clock-names = "ref";
>   				#phy-cells = <1>;
>   			};
> +
> +			usb1_port: usb-phy@11110900 {
> +				reg = <0 0x11110900 0 0x100>;
> +				clocks = <&topckgen CLK_TOP_USB_PHY48M>;
> +				clock-names = "ref";
> +				#phy-cells = <1>;
> +			};
>   		};
>   
>   		auxadc: adc@11003000 {
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
