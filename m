Return-Path: <SRS0=P5Ae=HM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8130C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 21:58:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 529B864E26
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Feb 2021 21:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 529B864E26
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uNIpSSMpxGXk3CqL0HIam/515PNJ+ibs3w1LiixOSrk=; b=E9DpQmbEgUbuPmhPDjner09KS
	PnjKJ2JycEzxLt0MuvvxJJ3vro5ZjdtLNKEBQH18LG4+OgBAU/B6awtQUESTqoWrlkvn1dvbjGSY7
	uFRkGc3ioXM8q2mmSpp2X8g/XT4HyXKaf3ObbFnID+WmzzE2/a/rr0gXD/RpxI4fwMMpdEZtZDXCZ
	L1KodoFsFDtinOEboLws0qv7gI5v2qMlYjdLCzfLnFFNl2VtQ9Tk143y7uNh5JWrs3SW0aKQv6uHh
	Qfm5WR8PF98wZPYs/+YPFlOzYM7SFVlGCnMCLLgLkxwk2cmXSeNYrLHny70j8+E769UQLHKgLH+Tm
	suGgFBrwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9xVL-0001En-3I; Wed, 10 Feb 2021 21:58:35 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9xVI-0001EC-U9; Wed, 10 Feb 2021 21:58:33 +0000
Received: by mail-ot1-f50.google.com with SMTP id i20so3329496otl.7;
 Wed, 10 Feb 2021 13:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uzz9hxfNfUAHoY/3tRRT+kBu3++kIrVwo6Tu0JjVTOA=;
 b=r+3jFxgCU5vLhud2kXLyQUQxMbbKuxhySLfhGtnL+ON56yMzFKuO71MPOeLOJz328J
 f8p7gty6tIQtBb025UVe6tlQ6UDuqeo8hYhSFM4/t9kuGqQPFOFUYwUbCXq8yjTLAdkY
 3Qc1IsVs3rRODNVLQZEaCQd+F3TC4nls59ucsRS/QB7TMilt3gu/e4ACXgL+HEB0c4D0
 q+qdbamIrLLvi8P1qRVX8tFAk36NdTes2mHanjSoCIaUFLPKYqikXYhj548pca+Dro8a
 +ESdtrEVWpLR8fdy+65fr+bPuJ83eZVIXIxBwiFN9TsHRCmxT6COToRMkP8ioo51zBwT
 UYrw==
X-Gm-Message-State: AOAM530SpPnaMzaxphOlFm6VPE8Npy6OCGLKWHi8et8CYEu/dl1oujcj
 uQdR6DapQ2ta15foLeLPdw==
X-Google-Smtp-Source: ABdhPJxrVr6ixP0bO6YSUh9lvjgUA5Iqr/sRXpCaKJSQpamuci/ExTOUwsJzIsx7P+OBLu+LBfKdWw==
X-Received: by 2002:a9d:7997:: with SMTP id h23mr3754841otm.296.1612994312037; 
 Wed, 10 Feb 2021 13:58:32 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id o20sm608285oor.14.2021.02.10.13.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 13:58:31 -0800 (PST)
Received: (nullmailer pid 2868209 invoked by uid 1000);
 Wed, 10 Feb 2021 21:58:29 -0000
Date: Wed, 10 Feb 2021 15:58:29 -0600
From: Rob Herring <robh@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [RFC PATCH v2 1/3] dt-bindings: usb: mtk-xhci: add compatible
 for mt8195
Message-ID: <20210210215829.GA2868150@robh.at.kernel.org>
References: <20210203102642.7353-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203102642.7353-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210210_165833_004973_90B23598 
X-CRM114-Status: GOOD (  16.06  )
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
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 03 Feb 2021 18:26:40 +0800, Chunfeng Yun wrote:
> There are 4 USB controllers on MT8195, the controllers (IP1~IP3,
> exclude IP0) have a wrong default SOF/ITP interval which is
> calculated from the frame counter clock 24Mhz by default, but
> in fact, the frame counter clock is 48Mhz, so we should set
> the accurate interval according to 48Mhz. Here add a new compatible
> for MT8195, it's also supported in driver. But the first controller
> (IP0) has no such issue, we prefer to use generic compatible,
> e.g. mt8192's compatible.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: no changes
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
