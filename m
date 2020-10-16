Return-Path: <SRS0=WAzV=DX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0B2C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:21:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF85B20704
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Oct 2020 17:21:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dPQsg4AR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF85B20704
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UC9WQswaJxouuU032J9+B+54RyCniRPxLQ8/ylWTAV0=; b=dPQsg4ARGYDP63zV+RSF2VUcK
	SNJkmOxzOLbK8jKIeMAFZeXw4IBvIUoyS1x0MyjndOT4Mdql96Wm7GEyd6InAmuzdcG7Ymt3l4paN
	1S7lpVNgkDi6t6GreIj/4ZCEB0fd+4zi14OjAv6xjV2txnf1QwcIsLFfo+oPzpgchY4U8zGakco1w
	3RWg3XbRk49UZBy8sl7rGY9l5wA+AeAWtSw49WmFFa+SWTmNysr0HbLHBnvAB6YOevXwjr7fk+0m0
	NG1UzdStB0dbJnn1YTMeZoIHjBUUs7O4Vpv6m2+NMB9ZaMmGgTMNdVEzV9O/Kaje5aMuO7ijDj7vl
	0UoUvcreg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTTQI-0006ru-32; Fri, 16 Oct 2020 17:21:46 +0000
Received: from mail-ot1-f66.google.com ([209.85.210.66])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTTQ9-0006ou-Sm; Fri, 16 Oct 2020 17:21:39 +0000
Received: by mail-ot1-f66.google.com with SMTP id n61so3058882ota.10;
 Fri, 16 Oct 2020 10:21:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e8GjHty+1aRxkxB6OTZCp5dmlkx4GtpYh5aZO6NQU3g=;
 b=GkZFIkYooWWMwwIcwZXpdxAvNYICdKkuZyKZyj4GdPxcoHiliVz2RlslZg9dhLetgX
 DysH/CvuvtsAEm5Qe/Zp/3YAEKOdvCJ89O+jL67LK4U6nrbSJaXOifyZRKDJH/2jCCLq
 fOAY0zBFGqJUr0FD5TTzkYadoxG7sXKy917ng59X0dJ4rWqN/zRv3JhZftRgC7/JJ1uI
 Y95XArRxeI3hc9eNLCWykCEAkzIjg18pj8iObLvGBKYYwsqbgrQotJPt2FuxS4f9qPI3
 5fOtqMwDivHqjr+hLHzvEyo1VOjVNcogFj3RNvGjVaFGhVjjZAxs14W/ejfYHkCgqrqC
 NSbQ==
X-Gm-Message-State: AOAM533aqyM/b56sDLa1IpBStLxL2abU+svQIYJ9w6P3P660CNo1EW8g
 OG11KtdJFSaRbN3rpG/3mQ==
X-Google-Smtp-Source: ABdhPJyBmicHhExMd8UfAARs4x+dcf3v+rjvJYssd7gWuTefGO3fN6HrCSikm0AYBv0Il8i8PqXLMQ==
X-Received: by 2002:a9d:6e07:: with SMTP id e7mr3181610otr.365.1602868897389; 
 Fri, 16 Oct 2020 10:21:37 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d11sm1131458otf.44.2020.10.16.10.21.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:21:36 -0700 (PDT)
Received: (nullmailer pid 1602840 invoked by uid 1000);
 Fri, 16 Oct 2020 17:21:35 -0000
Date: Fri, 16 Oct 2020 12:21:35 -0500
From: Rob Herring <robh@kernel.org>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH v15 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20201016172135.GA1602808@bogus>
References: <20201013130503.2412-1-dongchun.zhu@mediatek.com>
 <20201013130503.2412-2-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013130503.2412-2-dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_132138_004286_FE6F05C9 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, drinkcat@chromium.org,
 srv_heupstream@mediatek.com, shengnan.wang@mediatek.com,
 andriy.shevchenko@linux.intel.com, tfiga@chromium.org, louis.kuo@mediatek.com,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 13 Oct 2020 21:05:02 +0800, Dongchun Zhu wrote:
> Add YAML device tree binding for OV02A10 CMOS image sensor, and the
> relevant MAINTAINERS entries.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  .../bindings/media/i2c/ovti,ov02a10.yaml           | 162 +++++++++++++++++++++
>  MAINTAINERS                                        |   7 +
>  2 files changed, 169 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov02a10.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
