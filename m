Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B25CC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:25:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF22420857
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 08:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF22420857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Y1BqKZbKaRT3hQLXaNLFxb4LEsGJN6HByzhwddWKxoU=; b=S2IcIAk7j9vy18wiGSrxMiPXx
	5VBgk9sZrHFi28V5JqQDeABbcC2CKNNjt2qi+JZrYb9bdXeNLlCbhQ2TyMqvrbsnahKQCdcAEqZPI
	zGHOWTjfqTeUWvnOOB2JUNdwJHV3z7wOJGxd8QFReccx6rufg7tpHx4m0kR8HCThe4eNSx78/yJ12
	wpweDletCPAYgu7heg77QwKC0G4LFiTkJ85lM/DKJS3oCti2PYJCrc1iCBTMkzA5VBVvf/Ilzt+9l
	S0lqifUOUdoP6UTTuXa47/Cs6qqgUrESCfhjxzm9Y3mYGwaGZppO6KkpIkXoyKZUU7/IHMmqGZe6p
	5seaftTcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krzSs-00038F-1Q; Wed, 23 Dec 2020 08:25:46 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krzSh-00033H-LO
 for linux-mediatek@lists.infradead.org; Wed, 23 Dec 2020 08:25:36 +0000
Received: by mail-pg1-x534.google.com with SMTP id 15so10158887pgx.7
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Dec 2020 00:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=WThy4tT62F3b3zf0PgQRiQWDvTgvmZESA9P7XUtvIQc=;
 b=lm/gAASMc8UZvLfJCPhTrygCJnvjXm/AgIJtR846gqbmtV/Z9xMScDs4z2klDYCZXa
 xitLyUpJQ7GhOJ4B/3K9Bn/OGgr46nwQda0iPJyr/MPDZ/E4Jlfcgu5f3ieDmOgniDjp
 VYvE8Ofugj7cXljMRJQzCHIZhclSCNeJ4ktpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=WThy4tT62F3b3zf0PgQRiQWDvTgvmZESA9P7XUtvIQc=;
 b=oWh647KXf4IClgPkUfVwi36QyI/+krsd7DMY93uAVkW/0sEzev9516SCTTBPFJNg4o
 7HsxmBsnFFzWSEJS89Mvmvf5PXMIgHwWYsyjkV3sBjH17L4lCyZ4IT83DRjaEDklAYgt
 T1gtgsUNn80fZymzuuAs6Pwr9SfJHQGWKPQCyiz9FKs/5tvWhKZ5r5Hhbc1LskvHZqmg
 RpfP+hVN5VTNLbLuCXiNHwI1hlcGP+VB7TdObLYjksVKMAsNvHLd6KRW164BJK3rTYL/
 7xFKLYpi47Xa+5VbEAHmMdb5FpyG7QHQ8vMXNZx/Uty+mJMdL3TI7r5k70Mc+3xzUg5J
 1MXw==
X-Gm-Message-State: AOAM5308WH8qcQ6cIbzIwki5tPnhBEsHAZCRCTpHnCHVZRL8e44H50P0
 HDPqFMjERiqCTXECFvtM0Xjpxg==
X-Google-Smtp-Source: ABdhPJypg4hGOlyNgx6/zOot9YXwUix2EbRuZvx1p0wnv9B3ytcx7t9ecSD2W9nXEkM/rMgQwZKs4w==
X-Received: by 2002:a05:6a00:1392:b029:1a3:c284:521f with SMTP id
 t18-20020a056a001392b02901a3c284521fmr23329507pfg.81.1608711933463; 
 Wed, 23 Dec 2020 00:25:33 -0800 (PST)
Received: from chromium.org ([2401:fa00:8f:2:a28c:fdff:fef0:43bf])
 by smtp.gmail.com with ESMTPSA id p9sm22298444pjb.3.2020.12.23.00.25.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Dec 2020 00:25:32 -0800 (PST)
Date: Wed, 23 Dec 2020 17:25:27 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v5 15/27] iommu/mediatek: Add fail handle for sysfs_add
 and device_register
Message-ID: <X+L+97OBxC6I5pUv@chromium.org>
References: <20201209080102.26626-1-yong.wu@mediatek.com>
 <20201209080102.26626-16-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209080102.26626-16-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201223_032535_764955_77069EDA 
X-CRM114-Status: GOOD (  20.60  )
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
 Tomasz Figa <tfiga@google.com>, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, chao.hao@mediatek.com,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, anan.sun@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Dec 09, 2020 at 04:00:50PM +0800, Yong Wu wrote:
> Add fail handle for iommu_device_sysfs_add and iommu_device_register.
> 
> Fixes: b16c0170b53c ("iommu/mediatek: Make use of iommu_device_register interface")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 39478cfbe0f1..09c8c58feb78 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -746,7 +746,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  
>  	ret = iommu_device_register(&data->iommu);
>  	if (ret)
> -		return ret;
> +		goto out_sysfs_remove;
>  
>  	spin_lock_init(&data->tlb_lock);
>  	list_add_tail(&data->list, &m4ulist);
> @@ -754,7 +754,16 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>  	if (!iommu_present(&platform_bus_type))
>  		bus_set_iommu(&platform_bus_type, &mtk_iommu_ops);
>  
> -	return component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
> +	ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
> +	if (ret)
> +		goto out_dev_unreg;
> +	return ret;
> +
> +out_dev_unreg:

Shouldn't other operations be undone as well? I can see that above
bus_set_iommu() is set and an entry is added to m4ulist.

> +	iommu_device_unregister(&data->iommu);
> +out_sysfs_remove:
> +	iommu_device_sysfs_remove(&data->iommu);
> +	return ret;
>  }
>  
>  static int mtk_iommu_remove(struct platform_device *pdev)
> -- 
> 2.18.0
> 
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
