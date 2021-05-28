Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F4BC4708C
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 16:22:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3071613E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 16:22:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3071613E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4DNbNcWgntDzGpTiJ2tZ2ueTxeS7ui66eCY9xMKeju8=; b=qy6+dpVk8I+jtp8hO4Q+fdQshC
	0P09xlmbzGqkuTP7Tv3DZVKm4wAdbGBxKtpkRELk9sr3t0Qho+PAfXhoz4jq+hT0KmmJXiE9Nqtbi
	jKDL9CTkSBRWSrCWi2FTv/91NdnRvlqvEttYfXdI/icwztrxAkpTtLVoPT4Ylu5iEWLheXt6yRxUz
	qUPFAvdAAt8RLi6EUQ5NNszVjbFPp9C5xU9ljpWaDVSmXUnrzJeidlDqKrIguattYmPwoJDAQBi4W
	rJ/vxjzU5OXAqEe6X9/cM7h7f1oeEbNJl9PGtu2s2QyhsNWAgdZW10XBhvey5T5xeN9FKYNblKAjH
	9Ss4zo7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmfFg-00GxRu-T6; Fri, 28 May 2021 16:22:24 +0000
Received: from c-73-157-219-8.hsd1.or.comcast.net ([73.157.219.8]
 helo=[10.0.0.253])
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmfFe-00GxOI-7V; Fri, 28 May 2021 16:22:22 +0000
Subject: Re: [PATCH v5 3/3] power: supply: mt6360_charger: add MT6360 charger
 support
To: Gene Chen <gene.chen.richtek@gmail.com>, sre@kernel.org,
 matthias.bgg@gmail.com, matti.vaittinen@fi.rohmeurope.com
Cc: broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 inux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 gene_chen@richtek.com, Wilma.Wu@mediatek.com, shufan_lee@richtek.com,
 cy_huang@richtek.com, benjamin.chao@mediatek.com
References: <20210528081300.64759-1-gene.chen.richtek@gmail.com>
 <20210528081300.64759-4-gene.chen.richtek@gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <61bc1ea0-0a67-0b36-6d9f-407ca074c815@infradead.org>
Date: Fri, 28 May 2021 09:22:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210528081300.64759-4-gene.chen.richtek@gmail.com>
Content-Language: en-US
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

On 5/28/21 1:13 AM, Gene Chen wrote:
> diff --git a/drivers/power/supply/Kconfig b/drivers/power/supply/Kconfig
> index e696364126f1..3257b1ad5e36 100644
> --- a/drivers/power/supply/Kconfig
> +++ b/drivers/power/supply/Kconfig
> @@ -577,6 +577,17 @@ config CHARGER_MP2629
>  	  Battery charger. This driver provides Battery charger power management
>  	  functions on the systems.
>  
> +config CHARGER_MT6360
> +	tristate "Mediatek MT6360 Charger Driver"
> +	depends on MFD_MT6360
> +	depends on REGULATOR
> +	select LINEAR_RANGES
> +	help
> +	  Say Y here to enable MT6360 Charger Part.
> +	  The device supports High-Accuracy Voltage/Current Regulation,
> +	  Average Input Current Regulation, Battery Tempature Sensing,

	                                            Temperature

> +	  Over-Temperature Protection, DPDM Detection for BC1.2
	                                                  BC1.2.


thanks.
-- 
~Randy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
