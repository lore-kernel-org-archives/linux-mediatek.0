Return-Path: <SRS0=ZAsA=HL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B44C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:44:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B693C64E70
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Feb 2021 20:44:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B693C64E70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Tg8KDcfpDtCm04H0HoV4fN0ObL9bgVoqBS92iGZE/GE=; b=qef8qRqHfZKjC1beGKqJZJJPk
	H7+usykF2wqHpcMGEwUzY42ZlHcGQ+IhGTsQD3AfmfpmnTHBOTa8rOtTo7hblr+2t9O0PqXq8hPqL
	Iv4BchebSP81PuSlmHJKWqBTn5CNj+C5TMHdpeMUvUxedWMTZqHRiIcDcsfWab2u2OmhVzQT2dq/M
	zJiHNdHEAvsErOPU3wnpZhjK1UyrTJDMae1gvJc+mPUBJpEqiVGjwyrJFbEPZ2kM/FyYCtTipHzM/
	Di6K4I5IukNnXFsj/UCHhHDDcsQkBqVcjnTM9TQze1R+e/ptATCebXyNV3KFxcRs/OHB8iWMFrP8H
	M6/k1eoAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9Zrv-0004zc-NI; Tue, 09 Feb 2021 20:44:19 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9Zrs-0004yp-Ha; Tue, 09 Feb 2021 20:44:17 +0000
Received: by mail-oi1-f173.google.com with SMTP id u66so18965959oig.9;
 Tue, 09 Feb 2021 12:44:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ejS4tdhR52JYnnlfzFqAKVsx5ukUQHINk1u0rYP7GiQ=;
 b=eifMm1Fj005XqZOhgvJ32XVt350ptRgK16dauzRcCT4w/NoqsIvddWTcj+2nT1PVw+
 2Im4i3FEixSymLC3mKPq810T9hAbViFjO8TByXwoUZAo2hYz3aU/rJBQrnsz7tpqpFrg
 zzg9T9/s2ILvdvO7dwS1GaADlP+wILQ+vRL9JxvYLPIJEKgpD45hmq/lvccIvYQjFoaQ
 tEjxaUoEVIDTgH2FNnpgohvg+7OWxQcaCU8GPBLJfFig4FK0ZUpRcp5SDnZpocV25Bn9
 /QL7sDUChEUXP6pgXB3gxg+UTBOkCbzTH68wDSJtJP+ktR8fBnmyoULlC5E6onFKZXks
 su9w==
X-Gm-Message-State: AOAM530WwCAtBg2VqXGh1DhlUD8CG9IO1dYVND82sURD+mzuUNKsne8q
 x2z401pQ1eRNLgOfA2c+Og==
X-Google-Smtp-Source: ABdhPJxm224h6yL74JlgUNi3P5/DM+vvsFo+4bNVs1RVW27YOiS70JDy8LW1+QNkLr8bInysPI1yyQ==
X-Received: by 2002:aca:f12:: with SMTP id 18mr3746528oip.106.1612903455452;
 Tue, 09 Feb 2021 12:44:15 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id c206sm208089oia.44.2021.02.09.12.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 12:44:13 -0800 (PST)
Received: (nullmailer pid 143147 invoked by uid 1000);
 Tue, 09 Feb 2021 20:44:12 -0000
Date: Tue, 9 Feb 2021 14:44:12 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH next v3 01/16] dt-bindings: usb: fix yamllint check warning
Message-ID: <20210209204412.GA139333@robh.at.kernel.org>
References: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210201070016.41721-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_154416_605346_354D7B33 
X-CRM114-Status: GOOD (  16.39  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Min Guo <min.guo@mediatek.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Feb 01, 2021 at 03:00:01PM +0800, Chunfeng Yun wrote:
> Fix warning: "missing starting space in comment"
> 

I'm not seeing this warning in linux-next. It may already be fixed.

> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2~v3: no changes
> ---
>  Documentation/devicetree/bindings/usb/usb-device.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
> index 7bb25a45427d..23e76cfb2066 100644
> --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> @@ -82,9 +82,9 @@ required:
>  additionalProperties: true
>  
>  examples:
> -  #hub connected to port 1
> -  #device connected to port 2
> -  #device connected to port 3
> +  # hub connected to port 1
> +  # device connected to port 2
> +  # device connected to port 3
>    #    interface 0 of configuration 1
>    #    interface 0 of configuration 2
>    - |
> -- 
> 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
