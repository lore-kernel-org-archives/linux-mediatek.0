Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42684C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 11:28:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAD1364E06
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 11:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAD1364E06
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XK0+S93zMVPBwvPSJhns6zv7rHiMuRIIJiNMyshjc/c=; b=28+oKEMTtNMfRO02Xd3qWT923
	mBdXt86hpeFBZJDRJ8iDNH5kmUEn0CQMAm4FEPms2caysZqawQY0UR9QOr95hudqS4anpp3tRXsec
	KkEaPtL/cUh2LX3BKQObJq+NRpQXivBmJGKmKQspPrZ9fFBzvrpnNQlhNcyB8U4j2zDaW5YNtuAYW
	x6XApOdCH+r1amTDFWUUC+/i21zmtIXs/QqFKuPwuo8QUzKNzicLXVC+WhmqluSVbkjr9uSNzGEit
	4VmlGNj3Z7DgIp9rgxpwbNKDPl+FfKxrDv3vLziDYCSg4MVjCBugRqHRgzY73tMVtxGOqQ4j9o9VN
	wL37O7gMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Rwg-0001gy-A3; Fri, 29 Jan 2021 11:28:10 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Rwc-0001fj-KP
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 11:28:07 +0000
Received: by mail-pj1-x102f.google.com with SMTP id jx18so6198723pjb.5
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Jan 2021 03:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=UKt/ubY4NcKHPSuooMktGXNsT6JEg6MKsXcex2sGKe8=;
 b=gqMrIqM9RHMHldMrUnjAkN1fRmF4cjPTc0J0+QOB+VbL7iXONd3CsW9r7nRoIz1upF
 t1zUZXpX+e6By1m8iojw872Krj/assjDWoiEQ0X4dydPOQkKpmah0xz5+Qe/9DPSPjOs
 nIk3KYBVdlNHnb/HFAlrb1xqghvbiRfnw6ars=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=UKt/ubY4NcKHPSuooMktGXNsT6JEg6MKsXcex2sGKe8=;
 b=Aymo/Ejbrsyatmkn3XkYaf8IgH1VrECSxocspUiiFdc9cL6cCWwTXVTafitET2LCEM
 3bwhpRurJJWrJMT1SVwa4dGLWI+nCOwnJAuvQ+YMIdA++ly7+C4TLCnBmzZ7OGInX1VS
 HHHJTsYjnFYXEZHoq1GO722F+EzxQRroMbjDvoz6h+h0K9Cohh5Vd+Fq2A3pl11I1JbD
 q7VfWGYZcdqKzr+w5nHbs7BiQ0VGT5p1racHeN3zCvO1ssoVyRDqf8PhVJacFmPbQaC7
 m3XfTUmg3ZdCcMfWtQcLTf6ZMSXsZqSJbOkQ7NpAH1sdFi2VAaXxPGOlW6hpETiOxR8o
 7a2A==
X-Gm-Message-State: AOAM532c/QtNSjNIrT19+FUrz1LPM5Jd3djtf0Z7KOQuV2FxAhXAZczh
 lljMoQh344MCJtrWR6DZJwPIlQ==
X-Google-Smtp-Source: ABdhPJwyI1sjiVYZFaaB20NTokFieNiqqD/prZv9gC82hFlSGp+vl+GcwyLFrLO+OaPzTpe3i2d+ew==
X-Received: by 2002:a17:902:ec82:b029:de:8483:50b4 with SMTP id
 x2-20020a170902ec82b02900de848350b4mr3786253plg.41.1611919682569; 
 Fri, 29 Jan 2021 03:28:02 -0800 (PST)
Received: from chromium.org ([2401:fa00:8f:2:7150:e37b:6e7f:9e9e])
 by smtp.gmail.com with ESMTPSA id k11sm8695097pgt.83.2021.01.29.03.27.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:28:01 -0800 (PST)
Date: Fri, 29 Jan 2021 20:27:56 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v6 00/33] MT8192 IOMMU support
Message-ID: <YBPxPAQK29cr69+r@chromium.org>
References: <20210111111914.22211-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210111111914.22211-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_062806_845525_A75109E0 
X-CRM114-Status: GOOD (  19.44  )
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

Hi Yong,

On Mon, Jan 11, 2021 at 07:18:41PM +0800, Yong Wu wrote:
> This patch mainly adds support for mt8192 Multimedia IOMMU and SMI.
> 
> mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
> table format. The M4U-SMI HW diagram is as below:
> 
>                           EMI
>                            |
>                           M4U
>                            |
>                       ------------
>                        SMI Common
>                       ------------
>                            |
>   +-------+------+------+----------------------+-------+
>   |       |      |      |       ......         |       |
>   |       |      |      |                      |       |
> larb0   larb1  larb2  larb4     ......      larb19   larb20
> disp0   disp1   mdp    vdec                   IPE      IPE
> 
> All the connections are HW fixed, SW can NOT adjust it.
> 
> Comparing with the preview SoC, this patchset mainly adds two new functions:
> a) add iova 34 bits support.
> b) add multi domains support since several HW has the special iova
> region requirement.
> 
> change note:
> v6:a) base on v5.11-rc1. and tlb v4:
>       https://lore.kernel.org/linux-mediatek/20210107122909.16317-1-yong.wu@mediatek.com/T/#t 
>    b) Remove the "domain id" definition in the binding header file.
>       Get the domain from dev->dma_range_map.
>       After this, Change many codes flow.
>    c) the patchset adds a new common file(mtk_smi-larb-port.h).
>       This version changes that name into mtk-memory-port.h which reflect 
>       its file path. This only changes the file name. no other change.
>       thus I keep all the Reviewed-by Tags.
>       (another reason is that we will add some iommu ports unrelated with
>        smi-larb)
>    d) Refactor the power-domain flow suggestted by Tomasz.
>    e) Some other small fix. use different oas for different soc; Change the
>    macro for 34bit iova tlb flush.
> 

Thanks for the fixes.

I still think the concept of dma-ranges is not quire right for the
problem we need to solve here, but it certainly works for the time being
and it's possible to remove it in a follow up patch, so I'm fine with
merging this as is.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

I'll comment on my suggestion for a replacement for the dma-ranges that
doesn't need hardcoding arbitrary address ranges in DT in a separate
reply.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
