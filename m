Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D73C3C433E8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 15:41:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A614D206D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 15:41:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Sz5E6h6D";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SkYe2Adf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A614D206D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zmxO65IBD8Ce4CNggVYj5PBj5nHitSF8ClQuAJd1D60=; b=Sz5E6h6D2sFXUgCiktdr7r8na
	Nq8sogMlOH5WYXt60623vxCk1fq5ntaPvuza7Aq4hpoOCc98uz3w3xSqNmZEi12QvfvswX+M7vFql
	W/cT74ECRIwaUoYA8C4uSBWD9zeqzhn5QiESC9cqBbt1Lk/e1eVZvOrjLpxayulzWB74HG86GudTL
	3al3khCMMQqDgspsfL0sX0DOV6xaznqtNJ5xPFKwJfLE2Yvvjzacf3k93aYlyKRsGA7UCxrfaL3Zy
	YsYE3fAXcK+r+uijE5KkarCJQdLKT/S8FhxsM5EBiBId+Hpzn10se9ohWSCSHtdvqlrJHkpPhQkSc
	c3RtNTbsQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jydLq-0004AE-5S; Thu, 23 Jul 2020 15:41:42 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jydLo-00049g-En; Thu, 23 Jul 2020 15:41:41 +0000
Received: by mail-wr1-x443.google.com with SMTP id r2so523759wrs.8;
 Thu, 23 Jul 2020 08:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AcBqtfKEF6k5xr/VSNWblkqKGVnRPP3ztKfalGbMQTA=;
 b=SkYe2AdfwGFlttVB8ifdFjjVZf8HGW9GVwFpei2V5+07UZ2DNP+x0zYdNcOp8FUCsF
 gNXqpKEzsxBa+Qu3MJcUipZBHqhct/OgxsNrCmknYegj38zb4BF2SLJq3N6WGMTWmraB
 B68nHR+yUFADlOABBYYUgvoAkPtscNgsZOPSOjA4kSDdAHEAMlH5xjOW4Li3I3Ulpxw8
 NpDGKc4G1rDb3mUtFK0bLrfZt7zexmcZSZBdtVbhxJgFeyBs7EUV/734GMksnuNBjAF6
 gSyn+dIOifPnVGrHxRnFVBYWGXbrkoW77cJycp0pqhWeA+sedQIrQ1DJF+nHSyDhmOw/
 Yrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AcBqtfKEF6k5xr/VSNWblkqKGVnRPP3ztKfalGbMQTA=;
 b=o7dJgSAa3mMhpn0LxauP0/4gR9oiDnwep7J3L00F3ssGhI86Lfq1nAN9qM9Syog9vB
 hn8k6KFMHvEOv/9plCWDqWADF0l7d+RBsyaCeoSANLh+HAiZ9iDr+y8i5dRmmJIX2onV
 FhmYXmdNs/00aPWmRhI989+dnCih30A2nE+Hzx/akbNSNpaMtg5+fp1f7LGxRcOw3mBo
 ClADapV1CqsR+Yg73oYjA12XNQF9x6OhsJAxNyI/JA1ur5oilSCRE9B5059IOZwxeLCo
 +q0fVDfA4hSxfF7+4iiNHcG1k/dNt75H/qYCJerpUPWaTNv+ML6u7nl9Rn2JAfxshugB
 OfEQ==
X-Gm-Message-State: AOAM530KzsbuYqCV1M6CNGqmypSdRlP4FnO5SOCk2ReS8Z/w3/mQQhK9
 A3Q0Vq9Cw14zttwXGC3eM1jobcF+8MQ=
X-Google-Smtp-Source: ABdhPJxo8GvOapToh6OIkdSOCYVuIFV3tlBpD96mQIzsqG+h/NUdrRmgV0G9vYZUqr5+YsUfvS6bxA==
X-Received: by 2002:adf:eccd:: with SMTP id s13mr4915144wro.217.1595518898886; 
 Thu, 23 Jul 2020 08:41:38 -0700 (PDT)
Received: from ziggy.stardust ([213.195.122.158])
 by smtp.gmail.com with ESMTPSA id o7sm4169352wrv.50.2020.07.23.08.41.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 08:41:38 -0700 (PDT)
Subject: Re: [v7, PATCH 4/7] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-5-git-send-email-yongqiang.niu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <b3f97fc8-d95e-8245-1178-9a70353d379c@gmail.com>
Date: Thu, 23 Jul 2020 17:41:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595469798-3824-5-git-send-email-yongqiang.niu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_114140_550427_FC2BB2FA 
X-CRM114-Status: GOOD (  18.87  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-kernel@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 23/07/2020 04:03, Yongqiang Niu wrote:
> Update device tree binding document for rdma_fifo_size
> 

Please explain better what you are doing in the patch.
Also DT binding patches should normally go as the first of a series, as this 
helps Rob to review them.

Regards,
Matthias

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>   .../devicetree/bindings/display/mediatek/mediatek,disp.txt | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index b91e709..e6bbe32 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -66,6 +66,11 @@ Required properties (DMA function blocks):
>     argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>     for details.
>   
> +Optional properties (RDMA function blocks):
> +- mediatek,rdma_fifo_size: rdma fifo size may be different even in same SOC, add this
> +  property to the corresponding rdma
> +  the value is the Max value which defined in hardware data sheet.
> +
>   Examples:
>   
>   mmsys: clock-controller@14000000 {
> @@ -207,3 +212,12 @@ od@14023000 {
>   	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>   	clocks = <&mmsys CLK_MM_DISP_OD>;
>   };
> +
> +rdma1: rdma@1400c000 {
> +	compatible = "mediatek,mt8183-disp-rdma";
> +	reg = <0 0x1400c000 0 0x1000>;
> +	interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> +	power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +	clocks = <&mmsys CLK_MM_DISP_RDMA1>;
> +	mediatek,rdma_fifo_size = <2048>;
> +};
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
