Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ADE9C61DD8
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:48:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B097820B80
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 17:48:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aS1OqOFN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B097820B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ivjiuJpngxPbEa6Wne08GhDHHgPfFuHfGtHCvmnYTo0=; b=aS1OqOFNtD/i3sFw6LgFYSXuV
	fncBhcdwkqZkS0WByds2OLwd/ou7rdYvdhaAHUSMcn1V0lg4gZhsKiSLrcO4/Mpr73pkLcWgaxxp7
	GEbVBcPKhhTnObztLDuvTpzX06TPQpFcqXhYH3LZsy7rq27m7Q51S1qWy4NOIy+mDoQ8yGD7T++ky
	YH1in4r+AjE7ArEvhw/un7a3GFq44nj/gwGI1pRP/nKgBCuWva3jbgpuatH7VYQAZVr2bZKmIVIJI
	EgE/DEHJfp6n2LJ9we2I1XPbjp8Pi96UwHI1lel7fLfgFVFO53B46QOpBzisBWOa9CVLCl5bC9IXk
	Mp5Q9ajbw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keibT-0007Un-JJ; Mon, 16 Nov 2020 17:47:47 +0000
Received: from mail-oi1-f195.google.com ([209.85.167.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keiXs-0005Eq-JG; Mon, 16 Nov 2020 17:44:05 +0000
Received: by mail-oi1-f195.google.com with SMTP id m143so19687583oig.7;
 Mon, 16 Nov 2020 09:44:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=aDraipXgK+j9ThnWRAuoxovGZzBsfeJ+1er3RHu2IRg=;
 b=o+SrlAdQk/S1rGvBf7N1Q4PbWA2DoThzP/ykW/atawhFIK9iZnhVHdTA5uF8ov6OgE
 4/Yy05CUN5Zr6OTloqQjWt8/l2bB2WOBly/qf1ZNs/Vly7yBqCL6hFpkc3Y6IkxJmudV
 W4Eexu1IyivrjdiqdNOwo3tH3arMKpb+78ZU8TItJXd6puzO7pwMC6DRceoy7FjZRqG6
 rQp6L/36DTinoL/VVSxLxOPKd+RcaTMLXF0K3fsllnfrPKg721cD07UMUurefZp9N6Co
 A84X5+6HOwz/lWt0B/b8q/awz2LFv8DU0iWgliMqyI3TN1Ftk5pkevGAX6MTbiAhjLeX
 hgPQ==
X-Gm-Message-State: AOAM5314tlvaN1ezIPOF6SSrUx643g6a3MD+BR6sRRQYOjHULkDiID8i
 xvSvB1D1IPs4TEcnDCr8kg==
X-Google-Smtp-Source: ABdhPJyGW1TUwaevOXIBOiYNkYrlF4+cuSOA6lvXI2KLAfneT0Oy+X6YDbPqkJCXzeLvwXi5szqGJg==
X-Received: by 2002:aca:bbc2:: with SMTP id l185mr424763oif.172.1605548643381; 
 Mon, 16 Nov 2020 09:44:03 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id k11sm4871965otr.14.2020.11.16.09.44.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 09:44:02 -0800 (PST)
Received: (nullmailer pid 1862027 invoked by uid 1000);
 Mon, 16 Nov 2020 17:44:01 -0000
Date: Mon, 16 Nov 2020 11:44:01 -0600
From: Rob Herring <robh@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v4 04/24] dt-bindings: memory: mediatek: Add domain
 definition
Message-ID: <20201116174401.GA1861980@bogus>
References: <20201111123838.15682-1-yong.wu@mediatek.com>
 <20201111123838.15682-5-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201111123838.15682-5-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_124404_719879_585E4E15 
X-CRM114-Status: GOOD (  16.74  )
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
 chao.hao@mediatek.com, kernel-team@android.com, Joerg Roedel <joro@8bytes.org>,
 anan.sun@mediatek.com, Krzysztof Kozlowski <krzk@kernel.org>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Evan Green <evgreen@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@google.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 11 Nov 2020 20:38:18 +0800, Yong Wu wrote:
> In the latest SoC, there are several HW IP require a sepecial iova
> range, mainly CCU and VPU has this requirement. Take CCU as a example,
> CCU require its iova locate in the range(0x4000_0000 ~ 0x43ff_ffff).
> 
> In this patch we add a domain definition for the special port. In the
> example of CCU, If we preassign CCU port in domain1, then iommu driver
> will prepare a independent iommu domain of the special iova range for it,
> then the iova got from dma_alloc_attrs(ccu-dev) will locate in its special
> range.
> 
> This is a preparing patch for multi-domain support.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  include/dt-bindings/memory/mtk-smi-larb-port.h | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
