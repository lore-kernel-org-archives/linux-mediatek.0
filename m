Return-Path: <SRS0=PAw8=BP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F6E9C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 13:56:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B89B23130
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Aug 2020 13:56:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ovMbFu6K";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mPCsyVau"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B89B23130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0YMxjMG9OGH0yDyBhExiwkOvrBJgMAiTd8cI7AGsjBw=; b=ovMbFu6KimDIX0HbArtzmXcuM
	e/OhbkBwpZwWhRzBkx8beqCePByf6/Z3cdU/XPAb3NqhHGsraKyhmm27ECVkHb37RrffadaneNbbE
	GcQLyudsjtjJ0ltW0BX2BPBw1TjR+1hasUn3AE0fkg93K29UtIOkz1C6ZRLWrkQvU1tVwM66FPV5o
	AzLsgfy7Dd9dKSwBriZFep1bWz16J7veJ6jAhrzLefWs6o1aO14JNqXe5WKnNwHTgAYnMIm/0Ylkk
	jYF3s1gWeAH4zZzHtRsO1SgC1Oox21rAVnJOjbjoztlVXTpAYniNzujyBlx4i02Nal3csbOJL9nk2
	MuuqndldA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3JtX-0007Ai-WF; Wed, 05 Aug 2020 13:55:52 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3JtU-00079q-P8
 for linux-mediatek@lists.infradead.org; Wed, 05 Aug 2020 13:55:49 +0000
Received: by mail-wr1-x444.google.com with SMTP id 88so40762148wrh.3
 for <linux-mediatek@lists.infradead.org>; Wed, 05 Aug 2020 06:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ja++vUWPJ08EOA6SgZWSzzzNGHnYWDLpTD9FHTxS0rw=;
 b=mPCsyVauudhQuP/KJCzACLzD1hGJ28aiHs4qkIVT+dJsG9lMfuT7dSoXYJbFizKZRP
 kR2I6h/RpqcqrsXsr0WOQrAgDwfnAX/8FSgglt/yxTXrl83b60/gxayRpC2euEgFfaQN
 aKk3SV25A7zijFrcxS9Y8ftx/QbxX1RciA4Z8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ja++vUWPJ08EOA6SgZWSzzzNGHnYWDLpTD9FHTxS0rw=;
 b=iM4FkUcwe3sRI+YEsSy9efQQUdEanPLadrUegnxlChfWYgciA1z6fhmNWfuLnop4fm
 hzOqeieLY1nPRUsmMQhJqngJIukb4XkGQkArNH8SiQe1C13et6HNEr//L7RUQG7GNKA3
 4AGgnLxBaoAKbmGIXf+79omt4A0YjkmXv2ym4Zu/lGjj86b3Sh0eXYesFgKbuO58GN2k
 SXMtN4uoYN3t0xR3ouBCVutmYJqGBRAr96J0T71Ikroiby6Qhylz4xqx4wcShlmV7Fx+
 YKEkzYRnYogjGlNBS6iTDPF19dSgXytYX3BXuLK/u9G0zZoHG33LPqbgMCDeGAzB98EP
 kcgw==
X-Gm-Message-State: AOAM533TuMEauwIB8Xx8ugiMYJp7YH7lEM9ww+c1X+EhvWR2LCgRmYzi
 AdvMqbpRH9yk67vAdXJ81lQTUw==
X-Google-Smtp-Source: ABdhPJxYNtjsQJjSF6xJ7nBQbZo3fBriXEe6OI14ms3Hr23UwjYAMHhqsXQOBERea4H+jC1NM69TBw==
X-Received: by 2002:a5d:5485:: with SMTP id h5mr2759249wrv.427.1596635746822; 
 Wed, 05 Aug 2020 06:55:46 -0700 (PDT)
Received: from chromium.org (205.215.190.35.bc.googleusercontent.com.
 [35.190.215.205])
 by smtp.gmail.com with ESMTPSA id p14sm3039630wrg.96.2020.08.05.06.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 06:55:46 -0700 (PDT)
Date: Wed, 5 Aug 2020 13:55:44 +0000
From: Tomasz Figa <tfiga@chromium.org>
To: Xia Jiang <xia.jiang@mediatek.com>
Subject: Re: [PATCH v11 22/28] media: platform: Change the call functions of
 getting/enable/disable the jpeg's clock
Message-ID: <20200805135544.GA1014704@chromium.org>
References: <20200804034102.22983-1-xia.jiang@mediatek.com>
 <20200804034102.22983-23-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200804034102.22983-23-xia.jiang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200805_095548_871803_C181738E 
X-CRM114-Status: GOOD (  19.07  )
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
Cc: drinkcat@chromium.org, devicetree@vger.kernel.org, mojahsu@chromium.org,
 srv_heupstream@mediatek.com, Rick Chang <rick.chang@mediatek.com>,
 senozhatsky@chromium.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Xia,

On Tue, Aug 04, 2020 at 11:40:56AM +0800, Xia Jiang wrote:
> Use the generic clk_bulk_* helpers to enable and disable clocks.
> 
> Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
> ---
> v11: specify the names of the clocks in the driver
> ---
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.c   | 28 +++++++++++++------
>  .../media/platform/mtk-jpeg/mtk_jpeg_core.h   |  8 +++---
>  2 files changed, 23 insertions(+), 13 deletions(-)
> 

Thank you for the patch. It looks good to me.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

One comment below about a thing that should be fixed in the future,
separately from this series.

> diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> index 7881e9c93df7..47d570f32e3f 100644
> --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> @@ -783,14 +783,15 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
>  	ret = mtk_smi_larb_get(jpeg->larb);
>  	if (ret)
>  		dev_err(jpeg->dev, "mtk_smi_larb_get larbvdec fail %d\n", ret);
> -	clk_prepare_enable(jpeg->clk_jdec_smi);
> -	clk_prepare_enable(jpeg->clk_jdec);
> +
> +	ret = clk_bulk_prepare_enable(jpeg->num_clks, jpeg->clks);
> +	if (ret)
> +		dev_err(jpeg->dev, "Failed to open jpeg clk: %d\n", ret);

The errors in this function should be propagated to the caller and
handled properly across the whole call stack.

Best regards,
Tomasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
