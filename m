Return-Path: <SRS0=P5Ae=HM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CE18C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 22:55:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C97064ECF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 22:55:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C97064ECF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HiYxLZxRAsJx4W4RY5ah0TDUG7Gep4hv9Q7HoZ/8JEM=; b=GrHk9t6H0rlfd9hFS0Y4P+jMQ
	xJrSyiqo/YO9PjmY0bFWvS3xgq4JVi+n98q7gXoLoI46ojfUcXMmsSs4QtRouewgxOnYiOVbczlwJ
	GMFtRSpzyQXU9jFLoa+htItty+m/+nBh+JPVO8UFg8ZQcztAaBTkePRVyMsZXvpeFUqQ+fkBd+4O/
	0/kuQueyJJnILdNGkazSBmJUWvMTed89L2yXIxCdRtj2GjMaoAIus7YOPAVn0aMhPQMGvVI1BL4na
	JFe2wxAYQPzk304f2ULEW+U/88CqrazvLRh3X1y3Zj/jt8wk9EjqANK5zBNzJFXkDe4dGoGy4uSJW
	QOURpI9Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9yO7-0001If-0O; Wed, 10 Feb 2021 22:55:11 +0000
Received: from mail-oi1-f172.google.com ([209.85.167.172])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9yO3-0001Hn-QG; Wed, 10 Feb 2021 22:55:08 +0000
Received: by mail-oi1-f172.google.com with SMTP id u66so3986995oig.9;
 Wed, 10 Feb 2021 14:55:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=RP/1fWgQSpnhyqyUYQC54WPzfZsZ61OQZSW7jfdfAz4=;
 b=R1Qz/0iXgZo/9iAUuD0nrtSPvd/1JqJQoS18vOYbjkFcKF5Rnr6xEmmIAou129Oo2Q
 +h0YhhMYbaUECncTvbp9g+3gGad6Ch/siCjb1Ulqtq66MlMASa/6hg/z/roOkHQUTOXc
 Fp5T0swtzs64VIsonxuN9oCgf2kgBBBR6z2IFogPT3wmhtMEmw8ErjjQnUBXNQON01b4
 DXnikiFl7TkMGmt9zkeswiOUM38nf+LSwcmuK/UEgDBHDhJ6VLiE+MufV9JkHLgsnlGX
 OZTspBM7olLiswHMjCvD4g6IY/4ymj2iGEiRTIqzu1Kkiwv4Jwo9NNWEO1zvi1UHc8vx
 o9SA==
X-Gm-Message-State: AOAM53273abQC/jeKCto5chnNASboKP/kZKNhu83ygcszgmaat4zf4lK
 Qm0mX6alBZqDtdVVOE+RcA==
X-Google-Smtp-Source: ABdhPJw/ziPtOmnTH37OtDhwg5KsWreepQYebmeB6EPWMZJ3RNDdWVHQ1zbiL7IyFGFQo3ItwY1yYA==
X-Received: by 2002:aca:1903:: with SMTP id l3mr897629oii.133.1612997706959;
 Wed, 10 Feb 2021 14:55:06 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id r4sm772458oig.52.2021.02.10.14.55.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:55:05 -0800 (PST)
Received: (nullmailer pid 2966346 invoked by uid 1000);
 Wed, 10 Feb 2021 22:53:23 -0000
Date: Wed, 10 Feb 2021 16:53:23 -0600
From: Rob Herring <robh@kernel.org>
To: Irui Wang <irui.wang@mediatek.com>
Subject: Re: [PATCH 1/5] dt-bindings: media: mtk-vcodec: Add dma-ranges
 property
Message-ID: <20210210225323.GA2961490@robh.at.kernel.org>
References: <20210203083752.12586-1-irui.wang@mediatek.com>
 <20210203083752.12586-2-irui.wang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203083752.12586-2-irui.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_175507_871390_0CD1AA26 
X-CRM114-Status: GOOD (  17.19  )
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
Cc: Maoguang Meng <maoguang.meng@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, srv_heupstream@mediatek.com,
 Alexandre Courbot <acourbot@chromium.org>, devicetree@vger.kernel.org,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Longfei Wang <longfei.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Tzung-Bi Shih <tzungbi@chromium.org>, linux-mediatek@lists.infradead.org,
 Fritz Koenig <frkoenig@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Feb 03, 2021 at 04:37:48PM +0800, Irui Wang wrote:
> Adds dma-ranges property for DMA addresses translation.
> 
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index f85276e629bf..e4644f8caee9 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -23,6 +23,8 @@ Required properties:
>  - iommus : should point to the respective IOMMU block with master port as
>    argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
>    for details.
> +- dma-ranges : describes how the physical address space of the IOMMU maps
> +  to memory.

dma-ranges is supposed to be in a bus/parent node.

>  One of the two following nodes:
>  - mediatek,vpu : the node of the video processor unit, if using VPU.
>  - mediatek,scp : the node of the SCP unit, if using SCP.
> -- 
> 2.25.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
