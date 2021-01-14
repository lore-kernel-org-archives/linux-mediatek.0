Return-Path: <SRS0=30Xp=GR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 554ECC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 19:27:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B19DB23B46
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jan 2021 19:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B19DB23B46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Oz+tOyiqnCET2g1H83QYWwjulOyDY5uyRDbBXmId9ks=; b=skDJG/+vkx4s5rdpxu+2HmTL9
	v6uazHgZL1NYasvPPyQ7Gwr0bt8spBisWNfo+Jv22A2bojPQ9V4EeVR0rxdOSVyCiW3ImSxpwKVJa
	JeN5uengkAc7lJUMKHjOwFTNU9XE47txL0t6FVKSH/rxkN8w7tdM+DsVG4p32kxncFIRAjFC6mWhg
	ESzVfTSXGufA8EbJ/dYAUhmylMg9/kB9Ym3d+CdJLjGpY1l+RAjFvT8IDZdU4+f0mymB0KVDxe7UF
	fRyZwuIcfoMj9vX571qNa0FHQtT8DAh/FgIKWG3IocXPqzooiYu3rjQOmAYaDRKGq67p2O13ksdB6
	jzuQJ38FA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l08HR-0001k9-Rb; Thu, 14 Jan 2021 19:27:37 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l08HP-0001jW-EX; Thu, 14 Jan 2021 19:27:36 +0000
Received: by mail-ot1-f52.google.com with SMTP id r9so6232222otk.11;
 Thu, 14 Jan 2021 11:27:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VEeqdZkDifn0VyJEJKrWR4ztWRK6vfNBUVg/0z1SB/E=;
 b=sceyzlufrk8y99eA6kXdeyYRLM2RN0L/qUoUrcczCleGzJviG8QtlDW3p6ER07JePy
 fd0akFVHv+VMZxiUKAyijzPFP5WWOfxksIhzVzIkkOwTaRz22zCEGaqvsdhoq8UZToFL
 cmh+rHURLjLSylatQEhBozC7feaX8c+Y0R17/Z+3gJxVGNqzpcNdhEj0aFfBxNz2N/ia
 mwuI81c8pk/PXgmJisuyLNCn+R3JiVlGWQ4q1Vs33OuUoDmlzNLtbN5UpyFXi+VFSw7D
 h8DksS90xHNGjvMP2bylPBye4awltnHAAY7qq5q+ecAz3gxiuJ8QoXbHAGXqHoZrrluO
 56vQ==
X-Gm-Message-State: AOAM533Aqo+AAMk4wZ14th4kPwhueqKRA/OizQX2w+uXAJ9yUOfRdfbx
 dpKEtIfV9un5AR7wR6V7iw==
X-Google-Smtp-Source: ABdhPJyYwiGGmezeN+wyEHvNPOPyKigxB7dYEfZtRaxnNgEofQKzxycwX+PBMxfL7z5b0J6I8OHScA==
X-Received: by 2002:a05:6830:19da:: with SMTP id
 p26mr5479965otp.80.1610652454370; 
 Thu, 14 Jan 2021 11:27:34 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z189sm1222803oia.28.2021.01.14.11.27.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 11:27:33 -0800 (PST)
Received: (nullmailer pid 3425359 invoked by uid 1000);
 Thu, 14 Jan 2021 19:27:32 -0000
Date: Thu, 14 Jan 2021 13:27:32 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v6 06/33] of/device: Move dma_range_map before
 of_iommu_configure
Message-ID: <20210114192732.GA3401278@robh.at.kernel.org>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
 <20210111111914.22211-7-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111111914.22211-7-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210114_142735_509907_62421D98 
X-CRM114-Status: GOOD (  17.34  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Frank Rowand <frowand.list@gmail.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jan 11, 2021 at 07:18:47PM +0800, Yong Wu wrote:
> "dev->dma_range_map" contains the devices' dma_ranges information,
> This patch moves dma_range_map before of_iommu_configure. The iommu
> driver may need to know the dma_address requirements of its iommu
> consumer devices.
> 
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Frank Rowand <frowand.list@gmail.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/of/device.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index aedfaaafd3e7..1d84636149df 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -170,9 +170,11 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>  	dev_dbg(dev, "device is%sdma coherent\n",
>  		coherent ? " " : " not ");
>  
> +	dev->dma_range_map = map;
>  	iommu = of_iommu_configure(dev, np, id);
>  	if (PTR_ERR(iommu) == -EPROBE_DEFER) {
>  		kfree(map);
> +		dev->dma_range_map = NULL;

Not really going to matter, but you should probably clear dma_range_map 
before what it points to is freed.

With that,

Reviewed-by: Rob Herring <robh@kernel.org>

>  		return -EPROBE_DEFER;
>  	}
>  
> @@ -181,7 +183,6 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>  
>  	arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
>  
> -	dev->dma_range_map = map;
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_dma_configure_id);
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
