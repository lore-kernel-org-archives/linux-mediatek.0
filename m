Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5548FC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 18:10:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDC47253B1
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 18:10:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2GdDX9Tg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="ubAscvvy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDC47253B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ujHL1ir7Q/Gthk7KbxQl+6bcRrUdcJfTIs2INGJIeDo=; b=2GdDX9TgzEMxtlcv/KdIATl+N
	jGxuFxGG0V1pAsN4hpOb5UraeNhcEz1qzZs8DNlMTNWAIcW6ZuMTab0NNqUJ4FW4kIo3iw06j4pK0
	bY/BHEtdAek2a3iy/WZBKGuByNhtyYrq2KZ17katm7OnndmdpQ21q43RuJvhDf14aThq3/qUENeAs
	FxPa2lH03SBS/l1teqy31eVoojv4dma7VPVhFUoMxY5Xl5QCTaHh3vfbfZnuavd1kw9lDODMtaTaL
	5056mGBdldRsKtk+pR0PHz2rDSqXaQVshE8qxnDeGWCsJLPI8Rxftk8N5gN5gf9YGIKs2f6KWWDl0
	KuSp7G7HA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSOkK-0007mR-DR; Tue, 13 Oct 2020 18:10:00 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSOkG-0007l4-4p
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 18:09:57 +0000
Received: by mail-il1-x142.google.com with SMTP id q1so1158808ilt.6
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2020 11:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TE2fl/qyE0ZlA7fIvI5O4hrdLbHdTXQxQKy8JK0q3BA=;
 b=ubAscvvyW2B6KLNtkBbazSIC4pm8TD4sdIhBQKaONsIrvYUNTpwqjGh/HXGxu6zGk0
 QMxkSXVje4iKactBly7HjjNN/Y85LHLDjqSzy5vu8PqdsRIS4VQ0vo4ISr/RZyXRO1SW
 5vNVVqzKHMzQBznwTOESTZiKZFfNp/W7Kpqypn7NRp7LLhLUumuvVEJfoj3CV50qYONP
 NEqjQtrHmuYbf+0KS6HlLncpkER5ADcJzKYGbVoaUi7D6+GcFEYVTgYCWVxtyi1dhqEK
 ctbwf++/BSJI/rgrNp/BxtVtgFW2A3Cy7KCixpdFox8y8aWKlwMY43ktplNzprK5rueD
 6jpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TE2fl/qyE0ZlA7fIvI5O4hrdLbHdTXQxQKy8JK0q3BA=;
 b=OeQlAicFwFEywu8H8/DOewBHh7xJlV4BPTTX1SK/YDVSfLodgIyEy/yNzYnDZwYoh0
 iCJMicJnaD2CE+fs3U/3nyiZRo6Qhh0lVbQZqzsDMpdcvnFIH4UR1uuk2mLksbNXFLRM
 1ui9zFV9lIixDOG+U0v+Ql/M73fyEYKhjQ9D3mDbdZt3Y3Ol0CibApneB32y71RsxPIv
 auzUQxY+h1XMmYHpJDCFl2Z6B5wPgtB9jasX3mU4IxqcU7jO7blS8pbp3gsg0nxS1xR4
 xCbZniHIhXKc17anlG418AM46ay1QQKJ/L+78dTeT/7PT4vpf6bSdB6h27LR3xQUsP0N
 Eang==
X-Gm-Message-State: AOAM532zqutz49asNX1Jamiz8ySFppIMRSGog6DkMMRA3T1K7+zDa220
 Mb8SqVzjSXjxH9e5X11yCfDdWxB/nzyi+HwFFJcjOQ==
X-Google-Smtp-Source: ABdhPJwY3+uca79dB+DpzD2BqWxy386/q68+0Wx8eiiTzy3ZbGd3JtUUxsWGLmmvtTcD5QGvD2EdLVGpuAGKbrC8vgk=
X-Received: by 2002:a92:7914:: with SMTP id u20mr966643ilc.203.1602612590574; 
 Tue, 13 Oct 2020 11:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201013172832.4055545-1-fparent@baylibre.com>
 <20201013172832.4055545-2-fparent@baylibre.com>
In-Reply-To: <20201013172832.4055545-2-fparent@baylibre.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Tue, 13 Oct 2020 20:09:39 +0200
Message-ID: <CAOwMV_wo0SeXRbX-8+ipTr3zcYNPZ4fNF7-Xf8hX0RYP_EAOsw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mediatek: mtk_hdmi: add MT8167 support for HDMI
To: linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_140956_235025_1FFF8C82 
X-CRM114-Status: GOOD (  17.28  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>, airlied@linux.ie,
 p.zabel@pengutronix.de, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 13, 2020 at 7:28 PM Fabien Parent <fparent@baylibre.com> wrote:
>
> Add support for HDMI on MT8167. HDMI on MT8167 is similar to
> MT8173/MT2701 execpt for the two registers: SYS_CFG1C and SYS_CFG20
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c      | 7 +++++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_regs.h | 2 ++
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index c70f195c21be..7762be5cb446 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1835,9 +1835,16 @@ static struct mtk_hdmi_data mt8173_hdmi_driver_data = {
>         .sys_cfg20 = HDMI_SYS_CFG20,
>  };
>
> +static struct mtk_hdmi_conf mt8167_hdmi_driver_data = {

Sent the wrong patch. Sending v2 soon.

> +       .sys_cfg1c = MT8167_HDMI_SYS_CFG1C,
> +       .sys_cfg20 = MT8167_HDMI_SYS_CFG20,
> +};
> +
>  static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
>         { .compatible = "mediatek,mt8173-hdmi",
>           .data = &mt8173_hdmi_driver_data },
> +       { .compatible = "mediatek,mt8167-hdmi",
> +         .data = &mt8167_hdmi_driver_data },
>         {}
>  };
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
> index 2050ba45b23a..a0f9c367d7aa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
> @@ -195,6 +195,7 @@
>  #define GEN_RGB                                (0 << 7)
>
>  #define HDMI_SYS_CFG1C         0x000
> +#define MT8167_HDMI_SYS_CFG1C  0x800
>  #define HDMI_ON                                BIT(0)
>  #define HDMI_RST                       BIT(1)
>  #define ANLG_ON                                BIT(2)
> @@ -211,6 +212,7 @@
>  #define HTPLG_PIN_SEL_OFF              BIT(30)
>  #define AES_EFUSE_ENABLE               BIT(31)
>  #define HDMI_SYS_CFG20         0x004
> +#define MT8167_HDMI_SYS_CFG20  0x804
>  #define DEEP_COLOR_MODE_MASK           (3 << 1)
>  #define COLOR_8BIT_MODE                        (0 << 1)
>  #define COLOR_10BIT_MODE               (1 << 1)
> --
> 2.28.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
