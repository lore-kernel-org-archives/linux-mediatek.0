Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D077C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Dec 2021 15:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ys2Fdi5ISHISrZ6Yh5jIMmYNuoWxN5jUFnf9YIlla+Q=; b=BnHA7Gs4dCsWp8
	nqNCRNegYFrCzbceL2jDqkpoC+Y9N4aA0bwz/wCrBMDEX/EHotBkigia4E2go3+Makd8BrAy5TGWw
	hD27Z1poWP6OAnXNuJDiLJBy0uPTwCoVCnap8MmjUfqrSWSX1y4+DcVUkvfG40XHSYzcHehwpyFjU
	O1bQ2nzN4gYCD7rPDgaSehjwK13aIz3eYSe6Xq6jLltLXW1ceF2kselvsC16rSk3/6q3D396ooUZW
	RpXFztYU1Kxdqxb+zx2DBwVXuIV8EJ2eEMiAlKWdzoN5VI6Jh84M3QKEg9kSvKUbRopF1ocDL0SvH
	t1Luxi/wLL/ybVU2TmaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mx9UT-00Eb5e-2b; Tue, 14 Dec 2021 15:13:17 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mx9UP-00Eb40-RN
 for linux-mediatek@lists.infradead.org; Tue, 14 Dec 2021 15:13:15 +0000
Received: by mail-lf1-x135.google.com with SMTP id b40so37357528lfv.10
 for <linux-mediatek@lists.infradead.org>; Tue, 14 Dec 2021 07:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H+bLnAgO3b5siLg+4Vc0pITri5Pyuz0KEVByfdnYDUc=;
 b=kCE7rz4ty8OGXocOaIZ3U4M6gf6ZOKVj3wNbZYF0cgfawnSE7lraEFy4XZSw/fLgSF
 +znofuf+MuVMaaLS3TEXk10vJMTERr9+PeavbiQTq8Tls0YR5gjguTMLcRzSVqJt99K/
 0je4UkVDApqGfFNiKg32fiTXAGdspkepqWSlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H+bLnAgO3b5siLg+4Vc0pITri5Pyuz0KEVByfdnYDUc=;
 b=7Oh/Mo9nCYHyxnKWnZ0g9zC9SVHKxJ+tf21nIfFUnaBlLGLFUPO/LK8xNFod08rnnz
 UVoJEV710U8EuiNH4jhLw20wIVSabYHkzQ0DmfVXhA3Wn0lzuJC9WZ5zmBrGcpRfQSoF
 0bQXwvwqNSDs/pLrF85KyuJ5cI8fQW4Ll81wnMLr7ySjQ4Hml+W+wjNLoFiDmdrL9tUP
 knZaMgkxvFERCQtY+EergbTSlF+6rP4pquyb1hxrNkeAXrSGIK7xeO4p/AQrsqcdjYNl
 SudpTaioo5U9q3JzPAjYOHCFKZ80jF6/KNikNVKP49+rfu3Lal74S4twnS2BOWIeQv09
 8azQ==
X-Gm-Message-State: AOAM531sFP9A6Y6jKmCOEGPSFJqinrDx0ebCpPcBADbLnDYFsxMlxNbv
 sSeA25cTnZ2/itRaTaeOgmrK6BuQXoTueyCjqoszhw==
X-Google-Smtp-Source: ABdhPJyJT7xqBLUyVs9umwlaLSNF7gCLRF7yhoSNNTuBadwQHuxuZn1gHe8yhGYuShqyro78Lu0JCvDSqBPxCAMGnYs=
X-Received: by 2002:a05:6512:1510:: with SMTP id
 bq16mr4926777lfb.628.1639494791345; 
 Tue, 14 Dec 2021 07:13:11 -0800 (PST)
MIME-Version: 1.0
References: <20211022172413.195559-1-markyacoub@chromium.org>
 <20211026011318.GF2515@art_vandelay>
In-Reply-To: <20211026011318.GF2515@art_vandelay>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Tue, 14 Dec 2021 10:13:00 -0500
Message-ID: <CAJUqKUopyQEyLh7w32UnHfUJv0nNUoE_PHAdkEj8JOnkhVqbbQ@mail.gmail.com>
Subject: Re: [PATCH] mediatek: Set default value for Panel Orientation
 connector prop.
To: Sean Paul <sean@poorly.run>
Cc: linux-mediatek@lists.infradead.org, seanpaul@chromium.org, 
 Mark Yacoub <markyacoub@google.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211214_071313_946493_399932C0 
X-CRM114-Status: GOOD (  17.27  )
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

Hey CK, can we have this merged?
Thank you!

On Mon, Oct 25, 2021 at 9:13 PM Sean Paul <sean@poorly.run> wrote:
>
> On Fri, Oct 22, 2021 at 01:24:03PM -0400, Mark Yacoub wrote:
> > From: Mark Yacoub <markyacoub@chromium.org>
> >
> > [Why]
> > Creating the prop uses UNKNOWN as the initial value, which is not a
> > supported value if the props is to be supported.
> >
> > [How]
> > Set the panel orientation default value to NORMAL right after creating
> > the prop.
>
> Reviewed-by: Sean Paul <seanpaul@chromium.org>
>
> >
> > Tested on Jacuzzi(MTK)
> > Fixes IGT@kms_properties@get_properties-sanity-{atomic,non-atomic}
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index 0ad7157660afa..b7c2528a8f41c 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -1039,6 +1039,8 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
> >               DRM_ERROR("Unable to init panel orientation\n");
> >               goto err_cleanup_encoder;
> >       }
> > +     drm_connector_set_panel_orientation(dsi->connector,
> > +                                         DRM_MODE_PANEL_ORIENTATION_NORMAL);
> >
> >       drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> >
> > --
> > 2.33.0.1079.g6e70778dc9-goog
> >
>
> --
> Sean Paul, Software Engineer, Google / Chromium OS

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
