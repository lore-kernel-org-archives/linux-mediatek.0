Return-Path: <SRS0=WlSZ=LD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EE10C47095
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 07:47:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 426F461029
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Jun 2021 07:47:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 426F461029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GI/XikyoIxszN72rpvQkUIgMslnvIjHZRxLPuD/ZPJU=; b=D0cHULd00Xwn7nIW3wHUDIVzGh
	7zEz0IzUo54cTBIui2+hkh0Yqha7f919+/jPXDe2Bb9LnqKZcH8c9LZYpAMjpUg7WC84g7OGJ14EH
	3tGMf4to3rEnY/Jcvfki/YMgxRG1Vd+mmsXR3SXI3SgxtUxIKpzRsoqNpNoJHkAlfEi9BDEWjwvh/
	34M3IAcf4Rew8ZqIjz+z6/Jv67sJjzJUIHbHAZvnN7xAA4giOL4Yyi5Mpn35opt6TZTOqO2pMBHxx
	SScD93oaMSw+CXZEJaTQfaWSAuYLdnJHFgwbv4EDtLKM0JeozHNTyFuRuCRiUEstOi1tcSvKRDtKK
	Sc+EIvow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqsvJ-00CA4U-Rp; Wed, 09 Jun 2021 07:46:49 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqsvH-00CA3u-L2; Wed, 09 Jun 2021 07:46:49 +0000
Received: by mail-wr1-x435.google.com with SMTP id m18so24353159wrv.2;
 Wed, 09 Jun 2021 00:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mfF8AjJH5axTBcPP0IxexexYabY3e1he3WLMrp8BjK8=;
 b=IgAZFn/WHkagwnBqkoL0xUnTvaGUW1R+i+upYBkYG/N35EWOwSaMkevwNHWNRqsV29
 DvxkVyuIMfd5rj0rgZDe/gHmtWveCrw1dxdNxy6epxsI9RrkRQXrKs+2/FMm/yCKiP8s
 GBsYM/gc11fh3z5yKSTZ5BTVQhikMHchjNlgN4pYkJbSSpcVQBGUDOAWKlMz+4FnAwWt
 yoEjqp2kHmPfLIrj1TU3vmtpPEadeYiVbq9e2QC67nxTCxWE0HDg6DOZvvy6iAMLXziM
 uFHOJthRSe9goTjZq7o7m7TiaQICvSymXVahJTyP++dum3sWzGw8xhOxYqWhMnELf+UK
 xzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mfF8AjJH5axTBcPP0IxexexYabY3e1he3WLMrp8BjK8=;
 b=biGxeujWl8QJ2TO/fvSasrOiVVzrdhRLeYKZD/y+DYPMrefWaOj02pkL+huguD1+uJ
 dddIOdAMQsXBwve92jGe1m1LFL33X5R+atq7/WG7UGWV1H7KUt0MBvWtVBuVlKFPBAwH
 gjhO4/75SbtrCeJL/2WwxjQI6uRbcLhBChLJPHH3zdvtWb3KegVteh9kfT+TV1bK/8P3
 AfBS145zGLF9xWzKenVDgoyoySO8oraiylCDU3HmTEPvO0jg6yHrltHlf8P0RLKZrpG3
 0IiZEErRIgn8nmSJQDvOkpUmFNWHRxU0RRBLmFmcrDXUlX9uHYI2WRNp52kHChDm2ybZ
 w5oQ==
X-Gm-Message-State: AOAM532RtWiqNC23xJ88+C0bGCzr3rXAbA6mMlnh8fcWphiwKvTbg97y
 DlShRTROdUWnSyPwzYiU0Cg=
X-Google-Smtp-Source: ABdhPJxwaNus7YWPn57nqY0Er0FpsC7q84dR0F9oofTVVONfuhFu7p/dA/7CkWaxhVWRofM1dNEAsQ==
X-Received: by 2002:adf:f54a:: with SMTP id j10mr26111411wrp.383.1623224805989; 
 Wed, 09 Jun 2021 00:46:45 -0700 (PDT)
Received: from ziggy.stardust (81.172.61.185.dyn.user.ono.com. [81.172.61.185])
 by smtp.gmail.com with ESMTPSA id h9sm5571159wmm.33.2021.06.09.00.46.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 00:46:45 -0700 (PDT)
Subject: Re: [PATCH v2] arm64: dts: mt8183: add jpeg enc node for mt8183
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, maoguang.meng@mediatek.com,
 yong.wu@mediatek.com, tfiga@chromium.org
References: <20210609044854.393452-1-hsinyi@chromium.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <7a96166f-70d9-bc0e-72cc-53a8612741e8@gmail.com>
Date: Wed, 9 Jun 2021 09:46:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210609044854.393452-1-hsinyi@chromium.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_004647_724885_38B4E111 
X-CRM114-Status: GOOD (  16.24  )
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



On 09/06/2021 06:48, Hsin-Yi Wang wrote:
> From: Maoguang Meng <maoguang.meng@mediatek.com>
> 
> Add jpeg encoder device tree node.
> 
> Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v2: rebase to latest
> v1: https://patchwork.kernel.org/project/linux-media/patch/20200914094012.5817-1-maoguang.meng@mediatek.com/
> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index c5e822b6b77a3..fffe0c52909ce 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1329,6 +1329,17 @@ larb4: larb@17010000 {
>  			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
>  		};
>  
> +		venc_jpg: venc_jpg@17030000 {
> +			compatible = "mediatek,mt8183-jpgenc", "mediatek,mtk-jpgenc";

We are missing "mediatek,mt8183-jpgenc" in mediatek-jpeg-encoder.txt. Would be
great if you could help to convert it to yaml before adding the new compatible.

Thanks!
Matthias
> +			reg = <0 0x17030000 0 0x1000>;
> +			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_LOW>;
> +			iommus = <&iommu M4U_PORT_JPGENC_RDMA>,
> +				 <&iommu M4U_PORT_JPGENC_BSDMA>;
> +			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
> +			clocks = <&vencsys CLK_VENC_JPGENC>;
> +			clock-names = "jpgenc";
> +		};
> +
>  		ipu_conn: syscon@19000000 {
>  			compatible = "mediatek,mt8183-ipu_conn", "syscon";
>  			reg = <0 0x19000000 0 0x1000>;
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
