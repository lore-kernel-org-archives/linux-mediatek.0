Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FD7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Dec 2021 15:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=STBwu8x3tNR5TL6pEeYaxDAi1BA/zOlMQvuknbqCGSg=; b=Xh7CoDx/AevEZe
	JtY+GvVo5F7xIZHhZ/mMzhFUSAPnZGQbkvejxCIZ9SPAvYhAdXFic+U9IiM9x1wffPJ7BKfNMpufd
	h1teHsAQUJ/oOqaOqpP3VTmXJj+jkiyFrtQPo3kbWNLOrMXRoZ0+5gVgm2pR8NQeiDQeFtoLYHcq1
	CdbytNNNs08LKLy/ExY67cFo+QUXf2SUhl72JoRUTWWkcrvaxRqr+tMyTq9iQJRyxRaM6+lBh0Dhi
	y8moHeLD3FxIpSCPpHBz8l4ckJGLUcZwj5EfbCxdfyKZPxnk+L5kJSt0QBRBy3NNLwMvAtAy9fjia
	DwDVR90pchAuQAFUGlqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msoMo-00Cr61-76; Thu, 02 Dec 2021 15:51:26 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msoG1-00Cp0n-Hm
 for linux-mediatek@lists.infradead.org; Thu, 02 Dec 2021 15:44:27 +0000
Received: by mail-ot1-x32f.google.com with SMTP id
 n17-20020a9d64d1000000b00579cf677301so139846otl.8
 for <linux-mediatek@lists.infradead.org>; Thu, 02 Dec 2021 07:44:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=mha4IRrpog1qVnjYvKNVuPiAcmnva6w/RxT97qGpt+E=;
 b=6Tevb4YX8JsF65ra9qPtARVQQKCm98bX6vDJpNpcfglIbXm3hJ92v8fs3QJZiEnEhD
 4VnpJu6H+WNqZioFYg3eYBL84LZ2vD2kUZ93bSsmlu41bQCCALqR27Rb/hpoiz+cMGy5
 yXZDjnL5fxsmW/FfroLyPx6SfIMeumL3zM9yQCHUsGSy2J9h8/BWhBpDCxYqBQhyFTOY
 XIBmehSx/vg82/8p+fX7wDQ9aGrj2Y90G65dlPpjultTJBRM6Xm4vhGQg683qaSqR3db
 4kEywXfEdFSzsoPBLGon+SCKUS4+lml9WYdxTgraez4v3+Ch85iUmDsOJcftdsqRZCJs
 kSSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=mha4IRrpog1qVnjYvKNVuPiAcmnva6w/RxT97qGpt+E=;
 b=hzE8QW8uosgqhXNDQY8pMByE1LqiMqel8+zZFySo+N/1sqtHkZ6MBpE3zpBabeLdsH
 jzV5zYmGb+/L3rgvaN1Ej7oVEXQ6K19Dtway/zlxfp8yAm0o8RAVJg9mzLz19we6azTn
 FstNMC/xaD+PTycpVangcMJSBhgnvi1qq4bf3/76XwBS/DBuBL4VVZ7ADGsFB+ZGX951
 uXtm4N8GzqiOS/jvuDqGc5vpByd1r2/L9h1eaHLz1FrbfK4nPjYYtDXrk8djLWgGZ9ep
 1HH113bUOKZ0o71TSqG9ZnZQ8WTwVVnO1lOHJ89Ce9H9PMI2caJOGgO2Js3rb0HIpA9o
 TWag==
X-Gm-Message-State: AOAM530WyYWZbWXjbWUvlRF9Hx65Z3217QJuzCmelABLHlSqhvEEmR7d
 imjDunWKjpf1BwPj+syb0eP48LX3zWbQHQOALB1yWA==
X-Google-Smtp-Source: ABdhPJyfKFQ+ePrvb2e9Jj4FP1ONqiYfTYoOifN623p8cRKL7FHIXa4IPGK0rwcwduTF0VSdBKomy7OiuXHE1qAf8gY=
X-Received: by 2002:a05:6830:200d:: with SMTP id
 e13mr12435630otp.109.1638459864319; 
 Thu, 02 Dec 2021 07:44:24 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 2 Dec 2021 07:44:23 -0800
MIME-Version: 1.0
In-Reply-To: <20211108000847.14320-1-granquet@baylibre.com>
References: <20211108000847.14320-1-granquet@baylibre.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Thu, 2 Dec 2021 07:44:23 -0800
Message-ID: <CABnWg9ubi4Lr1jEh8TRGdLEDJE9raKSizhnEo08xf2vXYnA+aA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] drm/mediatek/hdmi : split legacy driver and add
 mt8195
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211202_074425_622392_54DDB4A2 
X-CRM114-Status: GOOD (  30.95  )
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

Hi Chun-Kuang,
Quoting Guillaume Ranquet (2021-11-08 01:08:45)
>
> Following the review of "[v1,4/4] drm/mediatek: add mt8195 hdmi TX support" [1] , I've been asked to try to merge the "legacy
> HDMI driver with the "new" mt8195 HDMI driver. Though the registers and IPs are rather different, I've made an attempt at the
> excercise on which I would like some comments before submitting a new version of the patchset.
>
> I've created a new mtk_hdmi_common.{c,h} which contains what I could identify as common enough to be added in there.
> I have not renamed the mtk_hdmi.{c,h} driver to something else yet.
> I've then added mtk8195 hdmi driver on top of this work.
>
> The code is still rather sketchy and I have some questions on best practices for that kind of exercices?
> In no particular order, here's a bunch of random questions:
>
> 1 would you rather have:
> - as presented here: a boolean with a bunch of if/else in the common code to handle the discrepencies between the two drivers
> - function pointers, with an "ops" structure set in the drvdata... though the ops are a bit random and wouldn't really
> make sense to be grouped together?
>
> 2 I'm not really happy with how the mt8195 driver and ddc are sharing the same __iomem regs and not sure how to exactly
> handle this now that both hdmi drivers are tied together... it was hackish from the begining, but now I'm a bit out of
> solutions to handle this peculiar "feature" of the mt8195 hdmi/ddc driver. any hints would be appreciated.
>
> 3 Should the "legacy" and mt8195 drivers be under the same menu entry?
>
> 4 I'm looking into the clock framework and I'm wondering if there would be benefits to switch to the "bulk" interface? as
> both driver seem to request them all once and for all? the code might end up easier to read.
>
> 5 Would it be beneficial to further split the driver with audio on one side and video on the other? from what I understood,
> the main complaint was that the driver was too big to review... that could help with that at least?
>
>
> Thx for your patience... any further comment is welcome.
>
> Thx,
> Guillaume.
>
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20210929094425.745-5-granquet@baylibre.com/
>
> --
> Guillaume Ranquet (2):
>   drm/mediatek: extract common functions from the mtk hdmi driver
>   drm/mediatek: add mtk8195 hdmi display driver
>
>  drivers/gpu/drm/mediatek/Kconfig              |   10 +
>  drivers/gpu/drm/mediatek/Makefile             |    5 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi.c           |  635 +-----
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c    |  521 +++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h    |  258 +++
>  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c    | 1835 +++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h    |   26 +
>  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c    |  530 +++++
>  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h    |   20 +
>  .../gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h   |  329 +++
>  10 files changed, 3560 insertions(+), 609 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h
>
> --
> 2.32.0
>

Since you have requested that I merge both drivers, could you give me
your feedback on this RFC so
that I know how to move forward? I'm planning on making a v2 soon
based on this RFC (and hopefully its
outcome).

Thx,
Guillaume.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
