Return-Path: <SRS0=kQBs=A2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B246C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 20:51:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D704820672
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2020 20:51:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kot+Z9+o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D704820672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Z2Jo+WqpoZBx5VWrvFIzq0qK8NAc/9dVYvKHPOr0FfA=; b=kot+Z9+oATo0mrR8Ut2ivFwJc
	Lec/GTVSgPMX76+hWCpfCwTOvYCpC+pwnywj5DcZf797EqJAtleDN2iw4f5djZl1CvmTew159DSYk
	bFVCg8BMx9Qzl1FRzbIqAFyMFjB7xhb5Rwmkt0faI4UVXICIYFTErmP7CIuWcmHbY9B8eK+itTaK+
	MxTvml0tLmB7Q149osur6gu8jFscyBUgpJGmDR6Q37tYG7h8u8mLQD4nf3bWB+czfd1g4WKGU1sBa
	gGWiVe7m+Db+TtBh0om1dKbnETfl09g5oBPHFQOk3AmUA6yAeUrBZB8RvPlaFXMEclZsLarQ9sGid
	2gWyiA+2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvoNE-0002So-Lg; Wed, 15 Jul 2020 20:51:28 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvoN9-0002Qr-5R; Wed, 15 Jul 2020 20:51:24 +0000
Received: by mail-io1-f68.google.com with SMTP id l1so3743000ioh.5;
 Wed, 15 Jul 2020 13:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q9ACE8nvrxYAkV7UmkgZ6sY12qZMuGAXz/YkNp21cP8=;
 b=jz/ZpV7XiBmGuYnjOHaBTZReerEk9vXpm3A68Qjy3n79e1bNdrezC7pAY/Rkz+42cf
 67d2f6lteevQFJ5a4uOTqBL735jwupyD4cNqWtHtA0YA+jTsESR7B9ixUaq4wnYnDjBk
 TyP8ziVVIaRqZ4ccl4jWQioW0JgwwUPVpklofSk5200gK2HeTVAwpQjr6qnwN7b1qGhV
 ZqZGtJZQ7I4+hJAdFPba5buAvRvQLxQ1SS+D0APESTWz1vf0kRAwDXTPUf1nYyNq+pwA
 X5lW/CT1FmlVdpnO13tdBS2BaoB0RCwsAhUVY4hegYjsBozmGXtRnVdRitKo2/use7Hr
 aBkQ==
X-Gm-Message-State: AOAM533vL3PBX9LL8yoXWElRZUXK4Ov1CWsitFm0WxcZvwz7V9vK6t3k
 HhpmTODg2a868ufRBqLDLQ==
X-Google-Smtp-Source: ABdhPJwJgZBHTochu4o5lfkCZewGDWCyBkruv1P6g3YXlsJ82fsfdRZEt+/xHnCbpv9RpaMjsjLcFw==
X-Received: by 2002:a6b:4409:: with SMTP id r9mr1160938ioa.158.1594846282053; 
 Wed, 15 Jul 2020 13:51:22 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id s18sm1576592ilj.63.2020.07.15.13.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 13:51:21 -0700 (PDT)
Received: (nullmailer pid 795410 invoked by uid 1000);
 Wed, 15 Jul 2020 20:51:20 -0000
Date: Wed, 15 Jul 2020 14:51:20 -0600
From: Rob Herring <robh@kernel.org>
To: Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH 1/4] dt-bindings: mediatek: add mediatek,infracfg phandle
Message-ID: <20200715205120.GA778876@bogus>
References: <20200702093721.6063-1-miles.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200702093721.6063-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200715_165123_251804_D2F65500 
X-CRM114-Status: GOOD (  17.58  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 02, 2020 at 05:37:17PM +0800, Miles Chen wrote:
> Add a description for mediatek,infracfg. We can check if 4GB mode
> is enable by reading it instead of checking the unexported
> symbol "max_pfn".
> 
> This is a step towards building mtk_iommu as a kernel module.

You determined this before without DT, so it is an OS problem and 
shouldn't need a DT update.

I'd assume there's only one instance of the node mediatek,infracfg 
points to, so just search for it if you want to get the info from DT.


> 
> Cc: Yong Wu <yong.wu@mediatek.com>
> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
> ---
>  Documentation/devicetree/bindings/iommu/mediatek,iommu.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> index ce59a505f5a4..a7881deabcca 100644
> --- a/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> +++ b/Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
> @@ -74,6 +74,8 @@ Required properties:
>  - mediatek,larbs : List of phandle to the local arbiters in the current Socs.
>  	Refer to bindings/memory-controllers/mediatek,smi-larb.txt. It must sort
>  	according to the local arbiter index, like larb0, larb1, larb2...
> +- mediatek,infracfg: a phandle to infracfg. It is used to confirm if 4GB mode is set.
> +	It is an optional property, add it when the SoC have 4g mode.
>  - iommu-cells : must be 1. This is the mtk_m4u_id according to the HW.
>  	Specifies the mtk_m4u_id as defined in
>  	dt-binding/memory/mt2701-larb-port.h for mt2701, mt7623
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
