Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3094CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 14:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSehTgZEPMhEYf9nk+IYX3SGYZf32WO58B8/JtiTVnc=; b=ad36tji4d5w0Lm
	n1gHvPdROyuDdlwHlJIoqHBazixZm6lyee08CjFgkBMe/fYwoWS1pCzBD0hS4Xv11Z30YAugBYVN+
	fThqcBuWDO8AvavW9Vx3Lz3GSRIOJv1OmexNOvZXXWAh9c+Gu1wJ0l+BE0LZalCWjUkgfHWLefOgW
	kmAFSDxD+bTkzrrXfgL6OobIC2O3BFldXO5btjzlDDrnHch0KSNTtBWnwJHKacTw+vjSjrpzoSKoe
	hXoDIcv6/FJj70KGi04pM5CBGtpbUtpiceZmMbC6Fpf1g5mlyUCh8Epy+Te/tuNuNCo06uJN2cN5d
	s+1iWN+F2J+JD5c5tf7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nk4zY-007R6w-DO; Thu, 28 Apr 2022 14:19:36 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nk4y9-007QPe-Q1; Thu, 28 Apr 2022 14:18:11 +0000
Received: by mail-wr1-x435.google.com with SMTP id x18so7049766wrc.0;
 Thu, 28 Apr 2022 07:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=5XdPKzrNuCW9Uls4djg9CnJPr0HfyWEzzX13gHvuT9s=;
 b=WYm5siW9NgsC3mcU0a3rvvmjzgshlYltbHF/8MkclQWoK+UeqblajvhIEXxxYve1Hw
 ArzFVVgI0LhX+EQQMKgsLRnxr1l6oRxDxasL6i16yusWP0qQO05kK2pUFQ9rwO2PU7CV
 g/I+91SHjrw6N2nVnNSpIvSq/6Q2axMNSjt8G+cn8jFEaCbdNXqLDCTe+qYh+tyImRcs
 2C2UQopBi/UqDb8Z7mJP93le0PX8NtFtxYQqKo5iDqjqEk8jhUY5Mz9CaPTNwW+JgW6O
 iYGgtDnGkNWHOvHntQd/+h4c+Y7dY/FegmQSsb4AbzllTJvmfkKOktoV7v9L5Gg3S71D
 XaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5XdPKzrNuCW9Uls4djg9CnJPr0HfyWEzzX13gHvuT9s=;
 b=W2Ugg8/L4TGafx82T7WQ9mB4Qyz1/q5/nzWnf/ybgmdRNA1SR/bMiVpzaByiCEjkAF
 bZRJXqdgpZrhd3+OOLQXmxB0nKf3gSlA+MLUOuRact9EuZt1OxfAFjw+SnoAvjT7iVsk
 OUT+Kqoo2G9OG+l3Q6hmSHqpLIhU60alVKW2m7zV6HQAFaopqDryB+mG8OP6H8Gd0UJP
 hY1eUiWyU/ZSOOqTS5I1wArQgDX+l5luZbkZ1t4hpY+6unx7eQtc+1ZsCp4/RjQQBiqL
 lN+WicNRzO94CrRRkyEcv4G03yr5qalCQSp7WuLnnZqlfPCi/PHVe2OJDd3UbLdObKxH
 F/yQ==
X-Gm-Message-State: AOAM530hQye1RRz9otb4z/knlnRqw49P+Qys6U6tNQRbfDIUwDFO+fMG
 Qztwl8qJ+kld89LBQuYbLM8=
X-Google-Smtp-Source: ABdhPJx0D91qDY3rAHXrUKYpJ6EndFNu0vi5Ze7REIXxyW9yTMg00OwkJnpjgHzk30D5LZMqwVL8fA==
X-Received: by 2002:a5d:47ab:0:b0:20a:7f8a:ec69 with SMTP id
 11-20020a5d47ab000000b0020a7f8aec69mr26826607wrb.504.1651155485199; 
 Thu, 28 Apr 2022 07:18:05 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 s10-20020adf978a000000b0020ae0154f1esm12625wrb.5.2022.04.28.07.17.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Apr 2022 07:18:03 -0700 (PDT)
Message-ID: <661261a7-45be-230b-b0b2-5837d2139030@gmail.com>
Date: Thu, 28 Apr 2022 16:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 15/34] iommu/mediatek: Add IOMMU_TYPE flag
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 chengci.xu@mediatek.com
References: <20220407075726.17771-1-yong.wu@mediatek.com>
 <20220407075726.17771-16-yong.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220407075726.17771-16-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_071809_947676_4CFB6995 
X-CRM114-Status: GOOD (  16.12  )
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



On 07/04/2022 09:57, Yong Wu wrote:
> Add IOMMU_TYPE definition. In the mt8195, we have another IOMMU_TYPE:
> infra iommu, also there will be another APU_IOMMU, thus, use 2bits for the
> IOMMU_TYPE.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/iommu/mtk_iommu.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 84d661e0b371..642949aad47e 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -126,9 +126,17 @@
>   #define SHARE_PGTABLE			BIT(10) /* 2 HW share pgtable */
>   #define DCM_DISABLE			BIT(11)
>   #define NOT_STD_AXI_MODE		BIT(12)
> +/* 2 bits: iommu type */
> +#define MTK_IOMMU_TYPE_MM		(0x0 << 13)
> +#define MTK_IOMMU_TYPE_INFRA		(0x1 << 13)
> +#define MTK_IOMMU_TYPE_MASK		(0x3 << 13)
>   
> -#define MTK_IOMMU_HAS_FLAG(pdata, _x) \
> -		((((pdata)->flags) & (_x)) == (_x))
> +#define MTK_IOMMU_HAS_FLAG(pdata, _x)	(!!(((pdata)->flags) & (_x)))

That could be:
MTK_IOMMU_HAS_FLAG(pdata, _x) \
                 MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, _x)

> +
> +#define MTK_IOMMU_HAS_FLAG_MASK(pdata, _x, mask)	\
> +				((((pdata)->flags) & (mask)) == (_x))
> +#define MTK_IOMMU_IS_TYPE(pdata, _x)	MTK_IOMMU_HAS_FLAG_MASK(pdata, _x,\
> +							MTK_IOMMU_TYPE_MASK)
>   
>   struct mtk_iommu_domain {
>   	struct io_pgtable_cfg		cfg;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
