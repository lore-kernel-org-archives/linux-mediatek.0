Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6892DC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 20:01:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AF2664DA3
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 20:01:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AF2664DA3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a679FLfzZbIB9xqCzhTuZfb5wKCUkg19ehuu+E3RRFo=; b=wrc+nEIwdKaLj2pPWFXX5zjM4
	zFFZj7bV+LIXiCUu46RFcIvn0Uvy8s1Jqa+qS5KDd0OjQnApgnPrQDQxJiZ1Ycs7cJAOERwuCwrjW
	JbLDhzBE6u5GDIAan9aMj8qs3jf4GCyneC0NMtRTTfZbs1ZHFi08bK10/fbuGCdsaCGQSXij2SDjC
	aF+uCq5MiPTRy3RgVTxhZOo2Huyfwymek/jU/tT0roNO2WhsnZM3MUhXTjppQyfqFwzINrd4Z5uaM
	HrWHQbiIZh6vSNnlWNwrrhruwyDc2SN5BLWZFfbqYF8tkm8rpB3+0sWxLO1XzYTy7b/kCHOV1FqA+
	zoyMnCeOg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4qzo-0006iG-Sa; Wed, 27 Jan 2021 20:00:56 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4qzk-0006fr-5A; Wed, 27 Jan 2021 20:00:53 +0000
Received: by mail-oi1-f172.google.com with SMTP id k25so3478216oik.13;
 Wed, 27 Jan 2021 12:00:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rvRcBguN/96Hnzr6bI5Ag8OoiWzcrVtrxH3mL5ZfZ1o=;
 b=SxircyTDGQ3Ho2ItfZ8BDGqxylH9qvfpKmI4GKHdYL1vMVOulHa2aWZeldCUPvUHSZ
 c3PYKo1SatfTH3zEuIPfWCLBbSx8rBy7IlN4WqPXf9/oUyufhYJbRLST/8lZbLuKhGys
 dospl+qP8UFVubQbU9AShBDaHJ6Wv7xpdt8o1dzyMWhHGVzrsOY2lOfOOl+SuLCdMKRI
 vf4wvUP3s4JaOLvtgCotF4QaGEGb29iCkMUq7oi0Wg3BegzOyY1/AUbDv4bHsgJ5rmWg
 WCHmv/z9rrmpFVc5O954/IKhF1EdwSudFQyTfgfKbvHdaNI0CMagdrK4m+YxtLs5FVw2
 eCVw==
X-Gm-Message-State: AOAM531pJqe+zbfq8Q4Ns2K0LvOP0hjS4bwksNdGvD7/HpZbX7yO6Cpj
 6FEoyBEWQNB8uCmxbnuKHw==
X-Google-Smtp-Source: ABdhPJwMBL6J6h0Mdgp/mb0/qiCzzg22X3N+4Non2UUG6xKNUgZwnVj+ExesrC+lIcTiArkT8riPBA==
X-Received: by 2002:aca:fcc5:: with SMTP id a188mr4342745oii.169.1611777649178; 
 Wed, 27 Jan 2021 12:00:49 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z4sm625941ooz.5.2021.01.27.12.00.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 12:00:47 -0800 (PST)
Received: (nullmailer pid 2143114 invoked by uid 1000);
 Wed, 27 Jan 2021 20:00:46 -0000
Date: Wed, 27 Jan 2021 14:00:46 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v2] of/device: Update dma_range_map only when dev has
 valid dma-ranges
Message-ID: <20210127200046.GA2142347@robh.at.kernel.org>
References: <20210119105203.15530-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210119105203.15530-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_150052_209499_85953F2A 
X-CRM114-Status: GOOD (  14.45  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, Will Deacon <will@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 19 Jan 2021 18:52:03 +0800, Yong Wu wrote:
> The commit e0d072782c73 ("dma-mapping: introduce DMA range map,
> supplanting dma_pfn_offset") always update dma_range_map even though it was
> already set, like in the sunxi_mbus driver. the issue is reported at [1].
> This patch avoid this(Updating it only when dev has valid dma-ranges).
> 
> Meanwhile, dma_range_map contains the devices' dma_ranges information,
> This patch moves dma_range_map before of_iommu_configure. The iommu
> driver may need to know the dma_address requirements of its iommu
> consumer devices.
> 
> [1] https://lore.kernel.org/linux-arm-kernel/5c7946f3-b56e-da00-a750-be097c7ceb32@arm.com/
> 
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Frank Rowand <frowand.list@gmail.com>
> Fixes: e0d072782c73 ("dma-mapping: introduce DMA range map, supplanting dma_pfn_offset"),
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  drivers/of/device.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
