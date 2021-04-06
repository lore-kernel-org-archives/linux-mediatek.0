Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A98BC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:27:35 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB14461246
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB14461246
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/kbsIj16Ve5A8ytJLfXmPDKcmYFL2xYUBMft9+cMUVU=; b=e2EyNZkltIdd6BhcD6L/ZmvgU
	7Ib5W3TXUzZHNsv8nmOCTskdI2m5XqKAiPPgldWShIuPisWL3Tay7kycrM8bCus4ylmQZ45znpu/z
	IJgdyNftB6U9R16vPXN82taJuINDnntQUr/HwsUNOdGUXNVUp3Fq8L0Rmf2njhpy/1vtWrmN98YwB
	015H7S8QxIxdaNy1Duz5SKrYgOwEX0ktCNAL99ZicR5KgFOVtlBESVJ8ESvEpHxT6xpiuVRlDbuR0
	CIfZdji05Rg8ilfr1RX2kRHdVPH0H0xFk4D4gDgAiPFnLIV2J14k8XNBSNa6UoByARuduzCdTnydd
	NIC1g+MsA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTjrZ-002JbD-RO; Tue, 06 Apr 2021 11:27:17 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTjrW-002JaY-4c; Tue, 06 Apr 2021 11:27:16 +0000
Received: by mail-pj1-x1036.google.com with SMTP id
 kk2-20020a17090b4a02b02900c777aa746fso7483664pjb.3; 
 Tue, 06 Apr 2021 04:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0nl9ZrgfpiKLj46y+3Cq9Nc86WR3X09T55IAR3qxOrk=;
 b=cGDnYos5h6dADjPplnotwdgqNA/r5PILJu1HlpM8gX87f4BYgPja5MLZlQvxv7LFUF
 X9P0MHPhO1CDSTV4px2eAwE5VPTno2m8mLVwISisGJSlqmsWbBPdIXj9vSpph/fIbBmr
 gzy7kxFtwjRFXJJdXiCHPus98QcMjBSvLnChXkNdS99ECHr4dY1q9oQuucZeFa63fynB
 Itv+i4CLU248afuB0UomQ/YFgQNAQ9I2cTllLr0tJGpNUnfb8V//ZKqrp06nFdB75prN
 LigKWWsRipHhNNZLbWsY7s5TnafimYPnb14M4jULw8uFTsup4K8J7BoGJOQtpENul/xm
 aEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0nl9ZrgfpiKLj46y+3Cq9Nc86WR3X09T55IAR3qxOrk=;
 b=of7bkN5TKcBmWx4FXD4PbTvUTwvFwX4t4KD95uNIxqXOmJKTv9K0SnqBc2zq+FD00B
 ShVejOHFgyTDSBhyrMPHCI/865L6h7d9vb1BUCzoEtsP+Nrh17TNVfVYbiGuoRnM5xtL
 JRT/641ISYdtnzIQlUz13wLqXM9cnQ55Ww93sZjYgELRjEmZgPYSYBP8WXoGtiLXZkVj
 Pu+8SsZ8VkKDxCXzZ5PB3zjYOIPWvUFWBebhSowJsnvn1H1gJ5scgZqlcA9RX3LzJOjM
 n2oyvrk85ziR2X+PHk1e9h2RQOEzopwYEy3RSrg4CsmTUu5Ns7m8DdPQxV1XnHXfL/lM
 7Jfg==
X-Gm-Message-State: AOAM531eyGS0aa3AHi/1izdU8GC/prVoIe6qI5Cs06uwGPU1gUv1agZ2
 pPbITxSQ9uy67U39N0b4n9o=
X-Google-Smtp-Source: ABdhPJyQ6B8vTSf8Z5mEQkYzxaMAT4FMUE2Ck4VgJ7zcWxG1OijT7Vv7Bx/6/xFLSYzuhFp1XdOHUQ==
X-Received: by 2002:a17:902:6845:b029:e4:4d0f:c207 with SMTP id
 f5-20020a1709026845b02900e44d0fc207mr28463995pln.36.1617708432583; 
 Tue, 06 Apr 2021 04:27:12 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id q5sm1939239pfj.131.2021.04.06.04.27.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Apr 2021 04:27:11 -0700 (PDT)
Subject: Re: [PATCH 1/5] arm64: dts: mediatek: mt8167: add mmsys node
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>
Cc: mkorpershoek@baylibre.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210405200821.2203458-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <0cf78980-5e3d-20f5-87cb-cc2488071211@gmail.com>
Date: Tue, 6 Apr 2021 13:27:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210405200821.2203458-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_122715_035261_8A159520 
X-CRM114-Status: GOOD (  15.55  )
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



On 05/04/2021 22:08, Fabien Parent wrote:
> Add node for MMSYS.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Applied to v5.12-next/dts64-2

Thanks

> ---
>  arch/arm64/boot/dts/mediatek/mt8167.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> index 156fbdad01fb..9d765034dfb0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
> @@ -125,5 +125,11 @@ pio: pinctrl@1000b000 {
>  			#interrupt-cells = <2>;
>  			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> +
> +		mmsys: mmsys@14000000 {
> +			compatible = "mediatek,mt8167-mmsys", "syscon";
> +			reg = <0 0x14000000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};
>  	};
>  };
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
