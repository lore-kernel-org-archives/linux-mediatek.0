Return-Path: <SRS0=osr7=J7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7845AC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 12:56:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E81BF61040
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 May 2021 12:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E81BF61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ARzHqJaJUST2JAy2IEvxonVrDupwoNmZzMnGiCob/I0=; b=D4ik7aHXaSk07KOlTZ0UZc2lO
	ygpJEZDziK77TuTTSy9R2mNXB4u0fOBhFtzloagipnWhTsDa5L4NIqvnOphCVWc414sVl9f4p42ky
	SlkYOo7HveNN8jGialuvQFOwYaRqE6gw175QgWfsgjejYrMW7rEXyUMWpzZFKkb9I2hO13sWVn1X1
	C7EfRq3IfRMS6MiZTowrbnsd1lnpu4d9FMA4nzJX/Ekc/1ODtjIs1M/I/9CwD9dOsQmwWiyA/wH4A
	mq/wtz7+dpg1L9kMtM1KL9f4eZm9mL7wmzsx7EyB96PXtxFfWivGeQpSjnUdInpOy1wgMxdsl6ePW
	GGtUihu+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lduax-00GEQq-Ez; Tue, 04 May 2021 12:56:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lduaw-00GEQh-Es
 for linux-mediatek@desiato.infradead.org; Tue, 04 May 2021 12:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=1ZEIfQIWplyJsRjhAB9oJ0mVxCOsZMQEFoeb6pJvTqk=; b=wZiAA1OvYDfYkS5qN0Gkf4KOmb
 3XyAQceUY7mFWLydDecHbgJO8EALWwv59s92sjBSTEnN1npUw9BAw4A8q34AqvvCjWiS4Uen8uhZ8
 J7D+ex+S/fHTWzfQ/Z9hHv9eQRaqmw8RfR4sxvc7qFLcbTYYUlxn1lQavG7zOhO9xCtlHxSj8lrhM
 hW7XjBygMl7Lf1FLUWuVQIUHAfFHFL3nQELlURKYAuixFn2jHMmdJHANciUZoM0PqIaYjU9y5rJnS
 gfLrKVnbTbJvsacIm1Xqql3grh2sN/AM8TMMvA5X+M/v5vwwBG5e1ANkfyJtAyJC8CW5oNxbtZmb0
 2Zzt3T0w==;
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lduat-003yp2-K4
 for linux-mediatek@lists.infradead.org; Tue, 04 May 2021 12:56:08 +0000
Received: by mail-lf1-x136.google.com with SMTP id z13so13139466lft.1
 for <linux-mediatek@lists.infradead.org>; Tue, 04 May 2021 05:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ZEIfQIWplyJsRjhAB9oJ0mVxCOsZMQEFoeb6pJvTqk=;
 b=P2xiwxC9N7JTjuvp40yQtJbPylijakcYl1ZZ7HGbdTWla3UaPkanl5AEiQcR4rhrM3
 WjaO3gBAyqKEHCnQ34sF3SBIAPXIuO35j963dIxZRlM7Nb+22HonRKQL2nb6aHKYp/gS
 I/5u/1nThzvX3AOyBptLIhReutJxeW15knqcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZEIfQIWplyJsRjhAB9oJ0mVxCOsZMQEFoeb6pJvTqk=;
 b=mQ9t0ga5k7A3kDtoWfQZ/vNuQC6xkACKpxbYnE8/UUwCEjD3MmQ76IUiaS7UHt+8XH
 ypImchJlTZPL8a4ClkMi35AuYTlHdLx9WX/1QK85MVZlbMG3FjXOnx2yVVTlnEFrkm3p
 YOMxm6G2evUqJkzpkMZCKD5oiYq3SXcpYLSkX+CfQuRzXUfWxT0zlWX3iT+yyeOPXIhp
 qnG6DEbxAixU0z0m5b91AQES/z6Ckh38zBC6qp6DHcZwSAZ7uDdMNBSpF5xmJHLScokX
 +xl7GLuJE959zc+iv62KNDjZLzChjJn7HkL+GAlXN3YUi+gtgWxOhsjAVlvs3FpppPrk
 Homw==
X-Gm-Message-State: AOAM530pzbRXIZGvDP5XVe08h+I4qmnyloopYzF8GecQlcuBtKQu8kFF
 eYZiqWS2tfgh1RbFcsvdVLxhfySI8bl77w==
X-Google-Smtp-Source: ABdhPJxeiv++hT1Nhi5diAFHDQ9tUGEZ7FfWCTts1p/1LbYhfzNCWrifZxYyQjP4f2igKbi7rT092A==
X-Received: by 2002:ac2:44d7:: with SMTP id d23mr15891093lfm.221.1620132964637; 
 Tue, 04 May 2021 05:56:04 -0700 (PDT)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com.
 [209.85.167.50])
 by smtp.gmail.com with ESMTPSA id w15sm1658497ljm.76.2021.05.04.05.56.03
 for <linux-mediatek@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 May 2021 05:56:04 -0700 (PDT)
Received: by mail-lf1-f50.google.com with SMTP id c3so9071329lfs.7
 for <linux-mediatek@lists.infradead.org>; Tue, 04 May 2021 05:56:03 -0700 (PDT)
X-Received: by 2002:a05:6512:108c:: with SMTP id
 j12mr16512793lfg.403.1620132963589; 
 Tue, 04 May 2021 05:56:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210427111526.1772293-1-acourbot@chromium.org>
 <20210427111526.1772293-9-acourbot@chromium.org>
In-Reply-To: <20210427111526.1772293-9-acourbot@chromium.org>
From: Alexandre Courbot <acourbot@chromium.org>
Date: Tue, 4 May 2021 21:55:51 +0900
X-Gmail-Original-Message-ID: <CAPBb6MWhP+uJSHzMHuH93fxgFosw=FPUoHOLuDX1ZYGunWX11g@mail.gmail.com>
Message-ID: <CAPBb6MWhP+uJSHzMHuH93fxgFosw=FPUoHOLuDX1ZYGunWX11g@mail.gmail.com>
Subject: Re: [PATCH v4 08/15] dt-bindings: media: document mediatek,
 mt8183-vcodec-dec
To: Rob Herring <robh+dt@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_055607_684459_5AC3D0D7 
X-CRM114-Status: GOOD (  16.56  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob,

On Tue, Apr 27, 2021 at 8:16 PM Alexandre Courbot <acourbot@chromium.org> wrote:
>
> MT8183's decoder is instantiated similarly to MT8173's.

Gentle ping on this, could we get your Acked-by for this minor change?

Thanks,
Alex.

>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
> ---
>  Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> index 06db6837cefd..a2a2a9e2ade3 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> +++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
> @@ -9,6 +9,7 @@ Required properties:
>    "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
>    "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
>    "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
> +  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
>  - reg : Physical base address of the video codec registers and length of
>    memory mapped region.
>  - interrupts : interrupt number to the cpu.
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
