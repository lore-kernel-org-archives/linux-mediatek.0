Return-Path: <SRS0=zFd5=FP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA01AC4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 03:40:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63C0D23C16
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Dec 2020 03:40:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63C0D23C16
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xuVhiUdN4Ku7UDhe0zvZj86kfzGdF6TdtyTzngp/4Ow=; b=z3jG3S0HDKlUGjtU02t/9r2rV
	YLE/F5Uy8bryw4ZFfiLZsfQj2ncVQGqmYx8UwVY5gPRa21Zo4KXd+SdT1/hYZylkE3fJSpMQhdHzy
	yIbsxsYv4J6XtLKrCoVMMWpUxKDbeSMxRVr1326/RrZQm/SkTd4k9nTfBzQI6UxiMcIzUc+S30SZF
	GK60V1nViw8Rx4FtgqW3QLp3ZDZi6E2R60BV6sYHC/1So8cQ4AgOQKhc+qk7BX+whAXpDbXIpqEZW
	oFTR7vmK1CoPQlyAxMkfTXF40UpqHs99Fgv1f6Om9fDb4UJWWIGfKy+G9dlJdK8qV+z5YqRa/VXl8
	SLHNBtPng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knZIS-0006zt-Pl; Fri, 11 Dec 2020 03:40:44 +0000
Received: from mail-oo1-f65.google.com ([209.85.161.65])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knZIK-0006vl-OB; Fri, 11 Dec 2020 03:40:37 +0000
Received: by mail-oo1-f65.google.com with SMTP id s1so1834591oon.2;
 Thu, 10 Dec 2020 19:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rSxM3l6xp3sRDoOhEED+EOawS1LpcndGMhb9GwxCfww=;
 b=JIzNChUcgSXXmO3VKnlMPv7b2TEhuGJf9AhjYaymxsXRunWpxwW/B0d9x9sm15Os50
 RuQHWP2VD6UenEL0fpPWJK97JBxXwuLcnucpIs53mxuGgUzIFNE9bNHlKagDFq3JZ05L
 l7gnHhamTx5mz5d5HAnl3/tJUGqnjsZBSIzMCJhUzlMRN0eZZ9iuI4qPpMaALjFSemnx
 T0TxFSqc9lIM4lS9ymrr7HHD/6odjVA4/gfM5L4XiTiJxqU1tI+RYChsksxSQ3tQsQt5
 TUbj7dgY7dyyfQAebru4liq+lh6eM9tmfpRcidtRfRJCG3splV5zQwX0Q/hy5aDUHVd0
 Hewg==
X-Gm-Message-State: AOAM532xgYiSMhgxSwHTTvqBrl0rFPkqCYP8RJRhXjPWcUTzbufyjCVP
 pG0X/TJtD7k/bX1tAlkWeQ==
X-Google-Smtp-Source: ABdhPJxFbPujw6YvZQNyAnC85BoyAfgK6ZSF1q6fK4C/+dHNlgwjupZdEhRXi5NgTGB3gwOUcW492Q==
X-Received: by 2002:a4a:b144:: with SMTP id e4mr8501118ooo.3.1607658035847;
 Thu, 10 Dec 2020 19:40:35 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z38sm1118026ooi.34.2020.12.10.19.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 19:40:35 -0800 (PST)
Received: (nullmailer pid 3594506 invoked by uid 1000);
 Fri, 11 Dec 2020 03:40:34 -0000
Date: Thu, 10 Dec 2020 21:40:34 -0600
From: Rob Herring <robh@kernel.org>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Subject: Re: [PATCH v8, 1/6] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
Message-ID: <20201211034034.GA3593696@robh.at.kernel.org>
References: <1607591262-21736-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607591262-21736-2-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1607591262-21736-2-git-send-email-yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_224036_894739_4BF5D793 
X-CRM114-Status: GOOD (  18.28  )
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
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Dec 10, 2020 at 05:07:37PM +0800, Yongqiang Niu wrote:
> rdma fifo size may be different even in same SOC, add this
> property to the corresponding rdma
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  .../bindings/display/mediatek/mediatek,disp.txt          | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> index 1212207..64c64ee 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp.txt
> @@ -66,6 +66,13 @@ Required properties (DMA function blocks):
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
>  
> +Optional properties (RDMA function blocks):
> +- mediatek,rdma_fifo_size: rdma fifo size may be different even in same SOC, add this

mediatek,rdma-fifo-size

> +  property to the corresponding rdma
> +  the value is the Max value which defined in hardware data sheet.
> +  rdma_fifo_size of rdma0 in mt8183 is 5120
> +  rdma_fifo_size of rdma1 in mt8183 is 2048
> +
>  Examples:
>  
>  mmsys: clock-controller@14000000 {
> @@ -207,3 +214,12 @@ od@14023000 {
>  	power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>  	clocks = <&mmsys CLK_MM_DISP_OD>;
>  };
> +
> +rdma1: rdma@1400c000 {
> +	compatible = "mediatek,mt8183-disp-rdma";
> +	reg = <0 0x1400c000 0 0x1000>;
> +	interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_LOW>;
> +	power-domains = <&scpsys MT8183_POWER_DOMAIN_DISP>;
> +	clocks = <&mmsys CLK_MM_DISP_RDMA1>;
> +	mediatek,rdma_fifo_size = <2048>;
> +};
> -- 
> 1.8.1.1.dirty
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
