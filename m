Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FF69C433EA
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 20:47:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B04C2065E
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 20:47:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vOq8aOSV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B04C2065E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aY7jwtvbr1jcQ5T4gOuri8+BxO7e2acoStljcpVPS2o=; b=vOq8aOSVLLjsonBaJC+6H38w0
	Hh6oeZ+wronWsK2Np00QY24FEOIbxJzEQtzi8cVmbKi0QYsn29MlSvVeoddMXb8xcR4zdrp83MS9S
	TFwbBY10T+cy2kJxAy+bTZymtUQy9oF/U1spSptbdC2vgoYWGZc1/v+wvjSnCq0tReYEfWKijRP26
	Fgaws6zUMP2HIMd1l+59SC1/BxuwzslWcLprZigbkkSUWDhZkNcGyj05rn1+F2Il7IgJ/Xsy3+C9u
	YxUspTgvwU1h0lrG+HzbGb1rmPqRinzIQ6wRDlw2c6xUBixxQvRSVzWhUah++92hdxc8ZhTJpsX5k
	DY9x3QPsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyi7r-0000Co-3m; Thu, 23 Jul 2020 20:47:35 +0000
Received: from mail-il1-f195.google.com ([209.85.166.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyi7o-0000C3-Qx; Thu, 23 Jul 2020 20:47:33 +0000
Received: by mail-il1-f195.google.com with SMTP id x9so5512844ila.3;
 Thu, 23 Jul 2020 13:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/ykIh0i0xy9qqdWkp/0xl4AY6xx/230nGu1DDjaI5lo=;
 b=hrs6JtT7uqVYXz++NXnFyxDnRN841fu+389xaFG23xcbCFmob0DL9LKJ9agQUY0wXm
 +43GfYUm6eLrOXgboeA48ibuFTubMyhn1WJ7bk6dIsA0EtzWehpt5fgyf9X1nc8r3pgc
 A0IkAAOmt4teLRmnYPR/OcjmqDooiSkyPqkNChqidpJEX2hm6cvLmpIw6LasC5j3S+Wz
 dgGrcJlRugJ91wO+YAxUgii1GQ2UyegG+JK5ekrUQZdN1I5fMVww2Uis4Nq0ecEjSH08
 fmv6mxhjhwT1dY/4o3dL/uLuYMdazinpDWPJkZk0a9lJKb3Oj+AFiutaNNcCOtguj6IX
 RMjw==
X-Gm-Message-State: AOAM532fkWkKJk0ypDGHp18feId3V3jQCldu9akQYsI1J8ubtdtCzIB4
 4KBRzwQXOWUq13l4hP4hdQ==
X-Google-Smtp-Source: ABdhPJxj977xyK987KA25YXvHJw0KF0pYIdsSwCRmIfXKkWWW85uigcOZS4pmbBfQX5gRynZmqjiXQ==
X-Received: by 2002:a92:c792:: with SMTP id c18mr7006999ilk.223.1595537251697; 
 Thu, 23 Jul 2020 13:47:31 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id w5sm2032325ilm.46.2020.07.23.13.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 13:47:30 -0700 (PDT)
Received: (nullmailer pid 833108 invoked by uid 1000);
 Thu, 23 Jul 2020 20:47:29 -0000
Date: Thu, 23 Jul 2020 14:47:29 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH 18/21] iommu/mediatek: Add support for multi domain
Message-ID: <20200723204729.GA823856@bogus>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
 <20200711064846.16007-19-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200711064846.16007-19-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_164732_901586_97DC8109 
X-CRM114-Status: GOOD (  13.99  )
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
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Jul 11, 2020 at 02:48:43PM +0800, Yong Wu wrote:
> Some HW IP(ex: CCU) require the special iova range. That means the
> iova got from dma_alloc_attrs for that devices must locate in his
> special range. In this patch, we allocate a special iova_range for
> each a special requirement and create each a iommu domain for each
> a iova_range.
> 
> meanwhile we still use one pagetable which support 16GB iova.
> 
> After this patch, If the iova range of a master is over 4G, the master
> should:
> a) Declare its special dma_ranges in its dtsi node. For example, If we
> preassign the iova 4G-8G for vcodec, then the vcodec dtsi node should:
> 	dma-ranges = <0x1 0x0 0x1 0x0 0x1 0x0>;  /* 4G ~ 8G */

BTW, dma-ranges should be in the parent node of the vcodec.

> b) Update the dma_mask:
>  dma_set_mask_and_coherent(dev, DMA_BIT_MASK(33));

This should happen for you automatically. The DMA PFN offset 
should also be 4GB here.

> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/iommu/mtk_iommu.c | 49 ++++++++++++++++++++++++++++++++-------
>  drivers/iommu/mtk_iommu.h |  3 ++-
>  2 files changed, 42 insertions(+), 10 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
