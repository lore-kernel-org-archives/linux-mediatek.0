Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A56D5C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 09:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6M2SPn7sqPgDE+o3lCFpdJOEHPR/4P0J6bq+ZpLW0=; b=bkaeMZnyi8xyE1jGfFjzQjNrnW
	vcqSjdicR0Xl8r8P8YyTGOhYo18cg2OmM5eon36UFRCZ7hCXz9SRda6UClIHIbDtbuZNQN5RX/4p7
	MW23EzWzfH4LEs5IawW60cTSCgMdvWO+BLavd2bs4zbhhWHAokcoyYFmA0Yqw0Z0xwQu5XxXRq2wN
	PGG2zevdHOeWnz295L3CHB5zK3VrTVyVVC2IrGFfGk32V+sXl7oACpPF//8v/v1eJvyAhSvgVIjy/
	HT4lUd9D39e8NCuj1cPgscPMwwait7qAar6KakqiJ/JjloTPJdho2Hyi8UDEEp6o52nC1179K7n4x
	kmsapSrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kEo-002tk6-Jm; Fri, 08 Jul 2022 09:25:26 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kEl-002tgw-Ek
	for linux-mediatek@lists.infradead.org; Fri, 08 Jul 2022 09:25:25 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-31cb2c649f7so118503047b3.11
        for <linux-mediatek@lists.infradead.org>; Fri, 08 Jul 2022 02:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bt6M2SPn7sqPgDE+o3lCFpdJOEHPR/4P0J6bq+ZpLW0=;
        b=a56cDZTYX/zgUIqGbEScQvxd1p0LoQBd/n8XEeW0tgNp77yiXtbSvD0ucj/mFN0v9j
         vhAsMdLZDPmfkX5ajXmtqBkGDgzK/LrZTvExCBIC4OpX3YaaSNEckkp5Jw1hDcDBS0X+
         pBxpLcEGLkSFKdnmOpp6M0+5dVv7WGLIOEeZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bt6M2SPn7sqPgDE+o3lCFpdJOEHPR/4P0J6bq+ZpLW0=;
        b=CmriMFgv77JJJ2haGOm7eZbrZQcyP7gRBk+6Uj2mP+gVbmwNAvihOXtMG7USsE76pu
         /JHJWGG+SGZPoxUbEvrJrinSrc+OlEoplDhh2+b1iPeNcMksem+rwzlBi3uiuuGqQpHx
         nJnb13iCq8oelNBV64OBGbWUUPKW6s5bAlKy1nNN6qWQvYXqlZ4QO87ld85NK/huMqYn
         SdHkssZ76ZdbDdsbJmG/2DsSWdiRzpr5xPxZ4p+KlJRgw3U30SGe22KZWDghPEX01gi1
         2lFAON3+6Y+HwY/KCRcgMCfOA7Zrw2fiUVXHg/0MUclfMgLidrMqg3w+ApCD603CLeUu
         Dxcg==
X-Gm-Message-State: AJIora8aO+RrlfIJncZi4r6qvNxVcov0QmEjtG1KpTUGXwrlugf1I3IN
	QTBRKgs2paU6HwIqophntlHd5QQ6vOUI3TXYaI8RJw==
X-Google-Smtp-Source: AGRyM1vtGSuisdYLfNmPZk8yOb9MscT55bQFKNkQSzG0DCwoxrkPWyEk/g0cOBLqJZgs0WE7ycZ7QLAAiDX16u49jQY=
X-Received: by 2002:a05:690c:316:b0:314:2147:2b90 with SMTP id
 bg22-20020a05690c031600b0031421472b90mr2782649ywb.318.1657272319442; Fri, 08
 Jul 2022 02:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220701105237.932332-1-wenst@chromium.org> <20220701105237.932332-5-wenst@chromium.org>
 <daf5e3e6-8a13-3c16-5fa6-9c4e69883c49@xs4all.nl>
In-Reply-To: <daf5e3e6-8a13-3c16-5fa6-9c4e69883c49@xs4all.nl>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 8 Jul 2022 17:25:08 +0800
Message-ID: <CAGXv+5GR1+fgabiVR6SbxsqAKd03gDoByYO0KMSoX3-i2eLbWw@mail.gmail.com>
Subject: Re: [PATCH 4/6] media: mediatek: vcodec: Revert driver name change in
 encoder capabilities
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_022523_777644_60C2D60C 
X-CRM114-Status: GOOD (  27.14  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jul 8, 2022 at 5:19 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
>
>
> On 7/1/22 12:52, Chen-Yu Tsai wrote:
> > This partially reverts commit fd9f8050e355d7fd1e126cd207b06c96cde7f783.
> >
> > The driver name field should contain the actual driver name, not some
> > otherwise unused string macro from the driver. To make this clear,
> > copy the name from the driver's name field.
> >
> > Fixes: fd9f8050e355 ("media: mediatek: vcodec: Change encoder v4l2 capability value")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >  drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h | 1 +
> >  drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 6 ++++--
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
> > index 4140b4dd85bf..dc6aada882d9 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
> > @@ -22,6 +22,7 @@
> >  #define MTK_VCODEC_DRV_NAME  "mtk_vcodec_drv"
>
> Note that this patch removes the last user of this define, so
> you can drop that define as well.
>
> >  #define MTK_VCODEC_DEC_NAME  "mtk-vcodec-dec"
> >  #define MTK_VCODEC_ENC_NAME  "mtk-vcodec-enc"
> > +#define MTK_PLATFORM_STR     "platform:mt8173"
>
> Why add this?
>
> >
> >  #define MTK_VCODEC_MAX_PLANES        3
> >  #define MTK_V4L2_BENCHMARK   0
> > diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> > index ccc753074816..30aac54d97fa 100644
> > --- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> > +++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
> > @@ -232,11 +232,13 @@ static int mtk_vcodec_enc_get_chip_name(void *priv)
> >  static int vidioc_venc_querycap(struct file *file, void *priv,
> >                               struct v4l2_capability *cap)
> >  {
> > +     struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
> > +     struct device *dev = &ctx->dev->plat_dev->dev;
> >       int platform_name = mtk_vcodec_enc_get_chip_name(priv);
> >
> > -     strscpy(cap->driver, MTK_VCODEC_DRV_NAME, sizeof(cap->driver));
> > -     strscpy(cap->card, MTK_VCODEC_ENC_NAME, sizeof(cap->card));
> > +     strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
> >       snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-enc", platform_name);
> > +     strscpy(cap->card, MTK_PLATFORM_STR, sizeof(cap->card));
>
> The next patch changes cap->card again, and leaves MTK_PLATFORM_STR unused.
>
> >
> >       return 0;
> >  }
>
> I think it makes more sense to combine patches 1-3 and 4-6 into single
> patches, one for the decoder, one for the encoder. It's easier to follow
> since they all touch on the same querycap function.

I wrote this series as a revert plus additional changes. As you said, it
makes sense to squash three patches into one.

I'll respin.

ChenYu

