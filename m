Return-Path: <SRS0=Odcq=HK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE8FAC433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 21:55:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3078F64E82
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Feb 2021 21:55:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3078F64E82
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/XeW4ZyLZ8ayawpJa6mcVN/YQizqDdMPvdumyFnmbDw=; b=NgdrRZ7mTBIkm+hpeS4SoxoEW
	Sufh3U6h8mnAF0hZVHwI8G8Fuuh9IfqmkFXEGXlDZM/x4cUx0hyBOAcGj7arS4yo6kr/7QT/jqsAH
	3Lm/dCCc40INa5PohQ71nQ61x4S7iCsXMn2yrvL2tcjlsOCjK+l1RcWOOCe4auFcw11LOVKfpCh9Y
	0YrGnYij0sTJHwUW9UJbp8E2mtJBEtOtwCMZiBYKITwv01GrAdNFIs99VmBCOnE9Ak2rbhWRYN9VF
	KZm97QgA8uFh9vxZ/i78vsmlIwK7hUzdNLlWQ3rEOv4v1UsQLtegAbZex+xrYJXsabmqnJ/bEdjE6
	Olp0cJyjw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9EV9-0003b7-9m; Mon, 08 Feb 2021 21:55:23 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9EV6-0003aX-5b; Mon, 08 Feb 2021 21:55:21 +0000
Received: by mail-ot1-f41.google.com with SMTP id l23so3992336otn.10;
 Mon, 08 Feb 2021 13:55:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=eqlb8C0ETOy8SvYjIiHc1NLlXDk6F0aQYo/gB9v56Ho=;
 b=mB9IWr4g08iPR/GI4QE4EjKD2o9O//RWCOrCdTVCYhFFfteVXkdS7e0Lk/qPK3bdgq
 RKfbI1zRAu0dM1UWlU5SLgwM+BBZ0nOGFg1IEop/SxWm56X6FTFjLRhCwxKoxhPRc0Ec
 +TMN7cSieWjHr0d05ZuRUaV1gidAqXT+afQcqmCiv0SwOHaB7qYvHwBLBMekHjotOm6I
 utELL8n+4bii5SdAvWjVDL1YlSQjouTg5c8w1P9Lru62bAh+Pk513CL07TMY8jQcxhUr
 jgpivxjLGO/hmP4wc9p2Jdf/LUW83LxZMc0TXSIOnJRogEe6O0W0Kzd2VwSLXMZUgdxu
 aMJQ==
X-Gm-Message-State: AOAM531PHwHDnEPm77XhdkH9viLhAhJdbvTsvAbC6CLP1WE0661iy9R8
 8I4j6stRJEX1a80F8fd29w==
X-Google-Smtp-Source: ABdhPJy+1GSfNEePnj5f9FpSkMeneRbLS+/hOm1zO1Clyf8W5YTWYvvJRQSNZbhhoca9Gmc9USaCMQ==
X-Received: by 2002:a9d:701c:: with SMTP id k28mr4166128otj.79.1612821319407; 
 Mon, 08 Feb 2021 13:55:19 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id z8sm3801754oon.10.2021.02.08.13.55.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 13:55:18 -0800 (PST)
Received: (nullmailer pid 2090093 invoked by uid 1000);
 Mon, 08 Feb 2021 21:55:17 -0000
Date: Mon, 8 Feb 2021 15:55:17 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [PATCH next 06/15] dt-bindings: usb: mtk-xhci: add support
 mt2701 and mt7623
Message-ID: <20210208215517.GA2090042@robh.at.kernel.org>
References: <20210116090656.11752-1-chunfeng.yun@mediatek.com>
 <20210116090656.11752-6-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210116090656.11752-6-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_165520_259805_3D8C766B 
X-CRM114-Status: GOOD (  12.45  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Min Guo <min.guo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, 16 Jan 2021 17:06:47 +0800, Chunfeng Yun wrote:
> Add two compatible for mt2701 and mt7623;
> add property "assigned-clock" and "assigned-clock-parents"
> used by mt7629.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
>  .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml     | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
