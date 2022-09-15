Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95537C6FA89
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 15:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0i/TBZDs7elMmSaK59d+TIsx+y7LWOVQuu86421qJg=; b=dHvNpRDJnijaiOysrDZYd+PqXq
	wtdBjQeNBe2qy/S7kDzeOz95UiTIH909/E8VD/L0GgmZvVyEG2Ncjoi3Ib5neIuvvqnz96I7WrrCm
	JlDBdipf95Uwl27y3B6EDG0wS8ek1y+5zJ93nJ5P/qpV8R3+dYheYtKI7YF57Jro4D7b5SqoFw7iw
	yiZ6/74GVmK9U/bNXRg1YYxS4WTl7f+OcqESH3kObtF/SlnhReFTTD3gcYjARXZ3YqWRAgh9y4bjf
	tCU3zmNlBkydyDpL682YLPW4q6sI/9KFgnNPkN8hw3OZcDITz4qW3fQTX+3wvKZZ6P9eU3G5pztNT
	nCVstBWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrGy-00ClFD-Sq; Thu, 15 Sep 2022 15:59:28 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYrGv-00CkxO-B8; Thu, 15 Sep 2022 15:59:27 +0000
Received: by mail-wr1-x436.google.com with SMTP id n10so976149wrw.12;
        Thu, 15 Sep 2022 08:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=t0i/TBZDs7elMmSaK59d+TIsx+y7LWOVQuu86421qJg=;
        b=XyXui7x1eEUDQwQQYrglR5eB3aj/RM0yZ3vcjpOHBJXQ80mfYNO1sTXtlv++vne7JK
         /Mb/Gftu6+B1z//gjd9lA9w+3EskiTjR6GrT7VbfPgr8ANZ0NQS/jebJwk/HfeNa1Zda
         cZUrqR8WgC5m8Ji2tNo7qCIu2tqH3xb97rIUsEvPCDgLx71HziJjgH73WlUiIJahQ3jQ
         Q8EieUvvkme3gKk3atiXyHnvglkX8hlJtqMig2juqtb2tvbp0M+Tsmq1VTpsrErPWgaY
         irarFeT8Mcy0NfVUqciaE7pIi1+1tr4hg/t8/EBNNYe53xpssacCXSIjZsl9GO2pMdtn
         kSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=t0i/TBZDs7elMmSaK59d+TIsx+y7LWOVQuu86421qJg=;
        b=THLKrKNODY+mJCFajubgcRcsEiKkGAVl/0zJv5Hii05nBZgALy22T1IFa0SDQI2R43
         ANOQgv6XM6pca4PSNxRYk1OlC2A9l2oldIJu+AM8hVN2AZSQsn33r8q+P+n2ab3pTby+
         13ObrPE9HRg5lSTYbVt8+dk4PasG4sxYERpYK995E8K/2fo0Zonq8yJUEyiSckvVanVI
         nrMXUrPAWjvGs0/Y5ucbfF2cySGLw25QExCn00cMKowjqsBoDPVaxDDY9mu+Dh1aj4IB
         3+l+0SmLNQAihAdth40E7NMchTbDc5B2Woiri23aghjOrIpVoA5IJEh7x+26JSNXg4pA
         jJiQ==
X-Gm-Message-State: ACrzQf0GA4uibhu8EshODq6WerlDCpN4OyXgo1vEen0NtLN8svwoECVb
	AmsGLBijcfa0WXlNzExUBmo=
X-Google-Smtp-Source: AMsMyM5/jiNeWYU9WoRMSlLzfCdBR8Xnr6/lfRMXtFiqq8S+1eZjAzfpnQw1yT+m4rqEm6haKmPb+A==
X-Received: by 2002:adf:cc92:0:b0:22a:361c:20b1 with SMTP id p18-20020adfcc92000000b0022a361c20b1mr205701wrj.691.1663257563771;
        Thu, 15 Sep 2022 08:59:23 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id r17-20020a05600c425100b003a62400724bsm3475950wmm.0.2022.09.15.08.59.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Sep 2022 08:59:22 -0700 (PDT)
Message-ID: <7c2242ff-f526-a305-9d4b-650427a58a9d@gmail.com>
Date: Thu, 15 Sep 2022 17:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 2/3] drm/mediatek: dp: Remove unused register definitions
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@linux.ie
Cc: granquet@baylibre.com, daniel@ffwll.ch, jitao.shi@mediatek.com,
 angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com,
 liangxu.xu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220915075028.644-1-rex-bc.chen@mediatek.com>
 <20220915075028.644-3-rex-bc.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220915075028.644-3-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_085925_415337_A07E828A 
X-CRM114-Status: GOOD (  12.32  )
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



On 15/09/2022 09:50, Bo-Chen Chen wrote:
> Some definitions in mtk_dp_reg.h are not used, so remove these
> redundant codes.
> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_dp_reg.h | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> index 096ad6572a5e..84e38cef03c2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -153,8 +153,6 @@
>   #define CH_STATUS_1_DP_ENC0_P0_MASK			GENMASK(15, 0)
>   #define MTK_DP_ENC0_P0_3094			0x3094
>   #define CH_STATUS_2_DP_ENC0_P0_MASK			GENMASK(7, 0)
> -#define MTK_DP_ENC0_P0_30A0			0x30a0
> -#define DP_ENC0_30A0_MASK				(BIT(7) | BIT(8) | BIT(12))
>   #define MTK_DP_ENC0_P0_30A4			0x30a4
>   #define AU_TS_CFG_DP_ENC0_P0_MASK			GENMASK(7, 0)
>   #define MTK_DP_ENC0_P0_30A8			0x30a8
> @@ -171,8 +169,6 @@
>   #define MTK_DP_ENC0_P0_312C			0x312c
>   #define ASP_HB2_DP_ENC0_P0_MASK				GENMASK(7, 0)
>   #define ASP_HB3_DP_ENC0_P0_MASK				GENMASK(15, 8)
> -#define MTK_DP_ENC0_P0_3130			0x3130
> -#define MTK_DP_ENC0_P0_3138			0x3138
>   #define MTK_DP_ENC0_P0_3154			0x3154
>   #define PGEN_HTOTAL_DP_ENC0_P0_MASK			GENMASK(13, 0)
>   #define MTK_DP_ENC0_P0_3158			0x3158
> @@ -206,8 +202,6 @@
>   #define SDP_PACKET_TYPE_DP_ENC1_P0_MASK			GENMASK(4, 0)
>   #define SDP_PACKET_W_DP_ENC1_P0				BIT(5)
>   #define SDP_PACKET_W_DP_ENC1_P0_MASK			BIT(5)
> -#define MTK_DP_ENC1_P0_328C			0x328c
> -#define VSC_DATA_RDY_VESA_DP_ENC1_P0_MASK		BIT(7)
>   #define MTK_DP_ENC1_P0_3300			0x3300
>   #define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_VAL		2
>   #define VIDEO_AFIFO_RDY_SEL_DP_ENC1_P0_MASK		GENMASK(9, 8)

