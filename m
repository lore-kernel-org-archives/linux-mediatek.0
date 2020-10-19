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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4A96C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 10:23:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5ED4020578
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 10:23:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tA6iCo45";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ke1K2cvC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5ED4020578
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nb44KltJ8OUQxua67DW8kxrwzQs5+9Sz/Ec8Uhp7BNk=; b=tA6iCo45a934+X0rxVT5S7V3l
	kBLqSX34GbY4pacbWR7Wans6FWlbWkjgXjLx0N3cHvED7rPS617rv+HXjhxOPkc6sQSYYEo/k0dK1
	+oXqWfA6PgUpuTyvBX0O+jouphs/aii1JK/ZeOFMc95PrELk2HP/r97hTMVGgCDYkm8x4yGTEBDez
	kimg0wyruuyegIUDJBe9uOYrGeCqNesuAQmREC2VMg5hdiBv9Tnx6wmWVwPyG2+tl0paE1mXL0uiQ
	UM5OJk3f8UDsIoJlV/lGgQKA0ImXptmPQ09idQlaiC3pXLf0O3XIleLfc8bAHyZasd9Ml5zzw5Khd
	7EVzbsImw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUSJe-0005Db-AU; Mon, 19 Oct 2020 10:22:58 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUSIN-0004QP-ED; Mon, 19 Oct 2020 10:21:40 +0000
Received: by mail-wr1-x442.google.com with SMTP id b8so10803437wrn.0;
 Mon, 19 Oct 2020 03:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rDam2iBux83WmunYrPy6RIkxNQfpNh4uOchFEhMvXMw=;
 b=ke1K2cvC3R38syswmV0bDDyDWj6nZESQqkQ323WDJxIoBqa6UgZ9LKqvtaVjj85nWa
 CXLaF4bGei7QVNBj7RvSXhplu8Kk40RnFDoWo5NIAhZWCb4MOEPxtXvI8UXotFDRSCBo
 WDih8AYIYqFM1NTDcjdy5+U//3N6Dm+pzWP8C8u4/ENPrx906kzLWt+6EySP1ZbS1/s2
 GjQ/UIiQcxMCdL9rFUX6u/4R2wbmRQAnaIx15MHG0x1KaP7/SLmaP7Y3ZEGmts3RN+KY
 50H7HeHAjnRgdyKB/mBXEpN3LRGfw1iCoO1r6Cc2PuibqKalct9NAWGN57R7c8GhtlZp
 5xjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rDam2iBux83WmunYrPy6RIkxNQfpNh4uOchFEhMvXMw=;
 b=Tvl3BH9rg6cBHhlZHJPUjAnchB3EThQWB52HfLTem00jHA1ikP41k2EXVjxSN4BgXm
 LKBMd2tKEar7vUD7Ir+U2fKbtsa056kCJiB5VXSv8TSiuv9v0x7ctMJ2cEaqOT7dZiGe
 6CB4AD+IY0REyOH+9BaWgQ15ZqW4/JCaRfUmN5p/PNfb2ox1fiaDr28Ho0yyqCI9n0Q9
 /Gq4MTWMTIVS90cR5Y4NtE9Y6TFrB0bun4x9MkCYZCnojSYMdeOKdplUR/Y4wDKnbUcr
 copYR9qoDZZfFME/X4XJejy5OkOKtb1jdhm3w7bIih4WaO/0c7dD8FLV5v9k/+cjT6xc
 1p6Q==
X-Gm-Message-State: AOAM532GtCBRAoHE0oA6PYL2cWhwbwOD8UhuP1auIU2Vu4PmXTgqQppV
 lX1Ors+yWeEYxx8jDb2TDf8=
X-Google-Smtp-Source: ABdhPJymr1886oZmydcTM0lwn9ycX7wbCyMOY00WEhv3e+OOYP91KSDh0/hmDryGvGdfVtslZd4i/Q==
X-Received: by 2002:a5d:5387:: with SMTP id d7mr18692169wrv.224.1603102897459; 
 Mon, 19 Oct 2020 03:21:37 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id 130sm12047799wmd.18.2020.10.19.03.21.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 03:21:36 -0700 (PDT)
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8516: add auxadc node
To: Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-iio@vger.kernel.org
References: <20201012205218.3010868-1-fparent@baylibre.com>
 <20201012205218.3010868-2-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <ba99554d-b0e9-58bf-110e-541bd9d0e521@gmail.com>
Date: Mon, 19 Oct 2020 12:21:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012205218.3010868-2-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_062139_714491_176292C2 
X-CRM114-Status: GOOD (  18.89  )
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
Cc: jic23@kernel.org, robh+dt@kernel.org, lars@metafoo.de, pmeerw@pmeerw.net,
 knaack.h@gmx.de
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 12/10/2020 22:52, Fabien Parent wrote:
> Add node for the auxadc IP. The IP is compatible with the one found
> in MT8173 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Applied to v5.10-tmp/dts64

Thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8516.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> index 89af661e7f63..943c426e9aaf 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> @@ -470,5 +470,15 @@ usb0_port: usb-phy@11110800 {
>   				#phy-cells = <1>;
>   			};
>   		};
> +
> +		auxadc: adc@11003000 {
> +			compatible = "mediatek,mt8516-auxadc",
> +				     "mediatek,mt8173-auxadc";
> +			reg = <0 0x11003000 0 0x1000>;
> +			clocks = <&topckgen CLK_TOP_AUX_ADC>;
> +			clock-names = "main";
> +			#io-channel-cells = <1>;
> +			status = "disabled";
> +		};
>   	};
>   };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
