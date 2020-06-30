Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1312FC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 16:57:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D561F20759
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 16:57:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rBd1fOoK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RFqYuhFL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D561F20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iHijrFqc7fHJJo7c413pWz7uqNX56b6UpiAPYSN2UsY=; b=rBd1fOoKVdT1JDRduRY9IbVlx
	KR9Er02JPMmJ2tlvqieYyqTegbMaPcP8Y7No6tH205ZxiWYP0RNGpxD29kcuDcTs56DyWN2y1OtPk
	0lUwh/kVZM6te1W6vBqdUxC4fUkMmQibWLI0NW9NDbDw9tR5mhRcxE02AbEK+nHn9B3ryEBEIXn3t
	sTjWGSCGiLgShuX3TbA9VQ+7suAJ7+8IUQ4rlHycRDm2F3o8wQ9xRY8zXzMjB+cPBcGUUJlt5LE93
	labzVg/46RZHJjt6p3Wpgyed0qdOjxtZE7PgJ4xOwyO1N7Q/KiWU+vZHCtgnbG/oVyN/I/BckNlsK
	32azqrPsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqJZH-0004xO-5l; Tue, 30 Jun 2020 16:57:11 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqJZ9-0004uV-7c
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 16:57:09 +0000
Received: by mail-wm1-x342.google.com with SMTP id l2so18810800wmf.0
 for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2020 09:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=F1OVcMRdH7pfFMyxoqH7cO8CnvCQwxHqOdJ8t5mlJ+4=;
 b=RFqYuhFLqVjsyWdGQ9GHbHyRyDnPG/M/cqmGqFMCIwjdRLdiVpGrYhpUoBD0qH0TjP
 m0BPgZ4VdFm+LloP3pVQQba7mNsNLGh/bBWMKgAmKZp841rSctvs0EjosoBY2a9TyAuq
 TcD8nZt4GVrbsrp7huNpZCQHENgKUZXHC55w8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=F1OVcMRdH7pfFMyxoqH7cO8CnvCQwxHqOdJ8t5mlJ+4=;
 b=cReE+4TVQCbq15rZmIJGdXzlLt4wLfqzOiMZMaFXCNZFvkGRCRuBrB0JJhDRJqu7Tt
 VGJOehIQ29qKrIALyryPmPFqn1hNia2AITSHFXIVDgJeX8qtWOHNyRKoyN1oh+clehQn
 UcCbmZhMUaVIATrz74fH3pF7Xa25x4PNRNS+UhNjfP4rH039+k8Q6Vyi7JXM81u62rlw
 XVR2g7tlMJhob/xB9fCVHxixNgJSPpCnSDIk9i3eNSswpdEDLvGC9e4Z0NQamyoOjY7f
 lEgHPymRPTL7ps2lOWbKHXJ3exakeQ5NFAKD3+dtFd+6KdTiC+X3yfTEtirphr0m80Wp
 1G9g==
X-Gm-Message-State: AOAM530gYg8r84qYOAkucxblMiYbOUVJzHqvB4Dyvo4O1sXIEwJaX6ee
 pQAkZChsqWUDYUhk0WX1cUHlDA==
X-Google-Smtp-Source: ABdhPJze1CyJQ1QCR4KBTWFIsYVngiTV+R7vUWN3M7L2nNrUKSGogwkdt41fB1NfGMtkkwTqs4kipw==
X-Received: by 2002:a1c:2183:: with SMTP id h125mr23738626wmh.83.1593536222373; 
 Tue, 30 Jun 2020 09:57:02 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id g144sm37289406wme.2.2020.06.30.09.57.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 09:57:01 -0700 (PDT)
Date: Tue, 30 Jun 2020 16:57:00 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [PATCH V9 2/2] media: i2c: dw9768: Add DW9768 VCM driver
Message-ID: <20200630165700.GB1212092@chromium.org>
References: <20200630062211.22988-1-dongchun.zhu@mediatek.com>
 <20200630062211.22988-3-dongchun.zhu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200630062211.22988-3-dongchun.zhu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200630_125703_360498_5069EFE6 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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
Cc: mark.rutland@arm.com, drinkcat@chromium.org,
 andriy.shevchenko@linux.intel.com, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, linus.walleij@linaro.org,
 shengnan.wang@mediatek.com, louis.kuo@mediatek.com, bgolaszewski@baylibre.com,
 sj.huang@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 sakari.ailus@linux.intel.com, matthias.bgg@gmail.com, bingbu.cao@intel.com,
 mchehab@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 30, 2020 at 02:22:11PM +0800, Dongchun Zhu wrote:
> Add a V4L2 sub-device driver for DW9768 voice coil motor,
> providing control to set the desired focus via IIC serial interface.
> 
> Signed-off-by: Dongchun Zhu <dongchun.zhu@mediatek.com>
> ---
>  MAINTAINERS                |   1 +
>  drivers/media/i2c/Kconfig  |  12 +
>  drivers/media/i2c/Makefile |   1 +
>  drivers/media/i2c/dw9768.c | 554 +++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 568 insertions(+)
>  create mode 100644 drivers/media/i2c/dw9768.c
> 

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
