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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1AD7C433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 10:22:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1877F2225A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Oct 2020 10:22:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ccb8PJV8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pmwp+5e6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1877F2225A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J4weLhjy8jEMnWm1hS6b3TPDLkIQjrxl/hpgDB7tfX4=; b=Ccb8PJV8JTqcu0UzwTsNJE2mK
	Fow9Rv1k/QuAItdShDGrIJ7yfPO65ub1QkKV97Mtg51Bw4lZGRCJeUIpTgcGbTIpaBYfaRHIdcLBN
	WzpfWFApg770Y+eD2HQWJ/+LpgFbXun9bwFYtbscNrF7D5qOi5BShlfRiI9QJdYi0kqftAohLksxz
	yAD39HC1uSsm8uH0knij7d1g6GeA0G/niFQFQ/yq3X803CikL2dXTpjWKnXmXHYBflS+BJSwK9vcd
	/7MN+bJZirdmGvLMnfZq4iboI58BYfEq12h4Ra6JDJza+tFka+PgpC7hk3YwDywFBRhLnRwPOTvId
	RYIDrJ+8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUSJ7-0004sV-Ce; Mon, 19 Oct 2020 10:22:25 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUSGw-0003el-Fu; Mon, 19 Oct 2020 10:20:12 +0000
Received: by mail-wm1-x342.google.com with SMTP id d81so9748177wmc.1;
 Mon, 19 Oct 2020 03:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=G+od8QsmdcNI8OZjA/3MTkatI2Okd5ynxtRsQkbg/yc=;
 b=pmwp+5e60HkAwpCaj/SLLxEqogIbgvYgFIxOzeafEv6VTReH3z9OwBI848M9V6YTKu
 IZSniaGT7oXG0lEucuJ2xYKmxd7mECOKOHDk3MxeHruFUFxn4nBsNiO1BA3Daoq7IHrF
 Pcgqqr9vWzLjbUvn6RlgZ3I+prAmYeiJOGIfpM92GoWSZTG2Q4sd747U5NY5IfEO3JD2
 4oWscg7fgEtvX96hr9OZuCRkOkJbo2++oYK5ZXTos58q5OcFKuBQq8guiZ46HppV51LB
 B8si3ER0ePrLxpQfuL3xf/MoV3JAx5NkEJAL56X7lHYlUoRQSAtyT2EF5i12G/jpIdfz
 q//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=G+od8QsmdcNI8OZjA/3MTkatI2Okd5ynxtRsQkbg/yc=;
 b=rshzUU4RXiMasoolJ7a2KPrIrd750/j4PxQkGTinboQp5SUU328P/DEB21ZxOlh+6s
 AqZ85DEU0spk0yveP+UMjwBvRWtDBDWBQV7fbLWvE5Hvh2AeViBe4nxMRzDx/KaiJWAP
 bj2iW5oqB82CFL9TFoKqc7o6B3Oo00InpkPxVE5904+yhACjPoPTsipjGxOUksK8cZ9z
 3yNiLWeyU9SfmMVTNTk9La+EuJioStEecN/i00oGQsNbFetElBXxFnsCF1M/aKfDnvSy
 m5TScLAKDsvOlezKc4Kz7QoYi4gS3ldaArjcNqDjHvIvIZlTOtTLRkFk80XBM7opDcFc
 NuDg==
X-Gm-Message-State: AOAM533IfOlrogXxqJ0EToVUxCZqePOw4kfJ/LXFW3wHQp10izSYuJy5
 BVqHHw6WVCU5wO18SXNiTb4=
X-Google-Smtp-Source: ABdhPJwaThc/I1/6bHe8HaT0JLVMEFTIjQn5CdrK0Yp5RP7RnlmLxY6edO/B86i5ytCYtGFLwJd5lg==
X-Received: by 2002:a7b:ce8f:: with SMTP id q15mr16837362wmj.88.1603102808024; 
 Mon, 19 Oct 2020 03:20:08 -0700 (PDT)
Received: from ziggy.stardust ([213.195.119.110])
 by smtp.gmail.com with ESMTPSA id i9sm16093776wma.47.2020.10.19.03.20.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 03:20:07 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: fix gce incorrect
 mbox-cells value
To: Fabien Parent <fparent@baylibre.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20201018194225.3361182-1-fparent@baylibre.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <a7798c9b-ac25-6eed-055b-af3efe5a18e8@gmail.com>
Date: Mon, 19 Oct 2020 12:20:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201018194225.3361182-1-fparent@baylibre.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_062010_886600_1D768457 
X-CRM114-Status: GOOD (  19.76  )
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
Cc: robh+dt@kernel.org, bibby.hsieh@mediatek.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 18/10/2020 21:42, Fabien Parent wrote:
> The binding documentation says:
> - #mbox-cells: Should be 2.
> 	<&phandle channel priority>
> 	phandle: Label name of a gce node.
> 	channel: Channel of mailbox. Be equal to the thread id of GCE.
> 	priority: Priority of GCE thread.
> 
> Fix the value of #mbox-cells.
> 
> Fixes: d3c306e31bc7 ("arm64: dts: add gce node for mt8183")
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Applied, to v5.10-tmp/dts64 thanks!

> ---
>   arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index 102105871db2..9a3cf95676e1 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -352,7 +352,7 @@ gce: mailbox@10238000 {
>   			compatible = "mediatek,mt8183-gce";
>   			reg = <0 0x10238000 0 0x4000>;
>   			interrupts = <GIC_SPI 162 IRQ_TYPE_LEVEL_LOW>;
> -			#mbox-cells = <3>;
> +			#mbox-cells = <2>;
>   			clocks = <&infracfg CLK_INFRA_GCE>;
>   			clock-names = "gce";
>   		};
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
