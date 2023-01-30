Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA65C636CD
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 22:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UNYhsjqG2sWgs2gWLKftBwFAL6CYNRc5b+6o4KuBP3k=; b=cwdTcnxgZeaPreB4YKG28HRQko
	DxY9uC7JQ7q6C8wzcVAjvrmkmvmewJ8/noRsa4qjZEBEEVI9CWRtfYSQ8YSOQyaD7yNjvJF/1f8Ns
	DcjnfmZr03c/YZ+l+8HYlHekb77bpvyNQt4mvqY8YFFYhRft8pOi88a4aUHfVeMQkHR6GL7mDIgF0
	YXx1Vr9HuBMUEHoNpUdAkIFRCow9NH54ed3CgcU8qZpV1V2ldgbg819FYINQEice79zazcg/G6mqR
	kXLss+ZZK92he7MJV+aSc45K4xwNgc9u61YNZ50CfI2a5hsrJcVgETqqRRkGYkzmqrKdUmQv/WNiK
	zC+V0YhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMcyz-005hj4-7Y; Mon, 30 Jan 2023 22:50:37 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMcyw-005hi3-GI; Mon, 30 Jan 2023 22:50:35 +0000
Received: by mail-ot1-f44.google.com with SMTP id x26-20020a056830115a00b0068bbc0ee3eeso2284646otq.0;
        Mon, 30 Jan 2023 14:50:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNYhsjqG2sWgs2gWLKftBwFAL6CYNRc5b+6o4KuBP3k=;
        b=lD07494jUfR+F1RM5RKsWisb3flR2fJALi0w6X43YSZhxWR7SJpT+hw9Li8ihyuylO
         VEUBD6QvpyUR3NM8Ee1e4io8M3B9fzCAi6zAYiDegpHLdD6XyjqTblrqbdimjH9etwo/
         C7lZ+92wryt9aGnfrKtraPrtmhZz7mlgAA4yTT5i35cIJdiNmKw4srbKnzYBSOAfEjT1
         YMxiFQlhYcrawS/gT5D5tZ8zNN9SGf6wCBv0Io96KbKOvRFXUc2i4Bkt++4c5TM8xGzn
         82ubtonToXoRIIktricEUPoP66Xt2xKFapiOTYXer2ixSKOuT1iWOhsINpby/3x7EeBZ
         0zSQ==
X-Gm-Message-State: AFqh2krKM3G1ZsDwRdkiwJ8KSNcXEiF2pLYO7ptO+tGW5FCbR3UO/fDj
	5sorWeGlSG484FPr26Uu0Q==
X-Google-Smtp-Source: AMrXdXtNhfsgDIvcAEdKu4kp+ybHhn5D1DqJVvcgUAHM5OWYY9UuqtZ807Orrl5sp6zWPu6BiNyBAg==
X-Received: by 2002:a9d:7614:0:b0:66e:c863:ea94 with SMTP id k20-20020a9d7614000000b0066ec863ea94mr21399528otl.27.1675119033197;
        Mon, 30 Jan 2023 14:50:33 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b17-20020a056830311100b006863ccbf067sm5954261ots.74.2023.01.30.14.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 14:50:32 -0800 (PST)
Received: (nullmailer pid 3670295 invoked by uid 1000);
	Mon, 30 Jan 2023 22:50:32 -0000
Date: Mon, 30 Jan 2023 16:50:32 -0600
From: Rob Herring <robh@kernel.org>
To: Alexandre Bailon <abailon@baylibre.com>
Cc: yong.wu@mediatek.com, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, matthias.bgg@gmail.com, krzysztof.kozlowski@linaro.org, iommu@lists.linux.dev, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 3/3] dt-bindings: iommu: memory: Use unmanaged iommu
 domain for the APU
Message-ID: <20230130225032.GA3667757-robh@kernel.org>
References: <20230130102722.133271-1-abailon@baylibre.com>
 <20230130102722.133271-4-abailon@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130102722.133271-4-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_145034_559975_320692C2 
X-CRM114-Status: GOOD (  16.53  )
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

On Mon, Jan 30, 2023 at 11:27:22AM +0100, Alexandre Bailon wrote:
> This updates the iommu id to use unmanaged iommu domain for the APU.
> This is required by remoteproc to use the iommu.

Explain how a mixture of DTs with or without this value changed would 
work with kernels with or without support for unmanaged domains? Looks 
like a compatibility problem to me.

> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  include/dt-bindings/memory/mediatek,mt8365-larb-port.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/include/dt-bindings/memory/mediatek,mt8365-larb-port.h b/include/dt-bindings/memory/mediatek,mt8365-larb-port.h
> index 56d5a5dd519e7..86d82a8f6017d 100644
> --- a/include/dt-bindings/memory/mediatek,mt8365-larb-port.h
> +++ b/include/dt-bindings/memory/mediatek,mt8365-larb-port.h
> @@ -24,8 +24,8 @@
>  #define M4U_PORT_MDP_WROT0		MTK_M4U_ID(M4U_LARB0_ID, 7)
>  #define M4U_PORT_MDP_RDMA1		MTK_M4U_ID(M4U_LARB0_ID, 8)
>  #define M4U_PORT_DISP_FAKE0		MTK_M4U_ID(M4U_LARB0_ID, 9)
> -#define M4U_PORT_APU_READ		MTK_M4U_ID(M4U_LARB0_ID, 10)
> -#define M4U_PORT_APU_WRITE		MTK_M4U_ID(M4U_LARB0_ID, 11)
> +#define M4U_PORT_APU_READ		MTK_M4U_UNMANAGED_ID(M4U_LARB0_ID, 10)
> +#define M4U_PORT_APU_WRITE		MTK_M4U_UNMANAGED_ID(M4U_LARB0_ID, 11)
>  
>  /* larb1 */
>  #define M4U_PORT_VENC_RCPU		MTK_M4U_ID(M4U_LARB1_ID, 0)
> -- 
> 2.38.2
> 

