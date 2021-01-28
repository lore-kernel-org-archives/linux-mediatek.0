Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCE7C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 05:10:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBFB064DCC
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 05:10:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBFB064DCC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a87CG2xSkSOOrBVwDcoWoVmeeyEIKcwG6XEFEV/cs5M=; b=fZLWUjuxWUaywYa7Wj2amX5e3
	AnV5Xf9Qj3b2QfB0sepPgJS3sLxkRXIEpatlKaK/uJPlyHss9iRe9WZ+4TXJnUezzptn+61/LPfV7
	g66m91nTlsEqEzbVUelokeun9tEAoIsancw/rlO2kI+Ci8l/yP4tNdtHq9OoHwAG/K0wlcDjBrkD1
	CgE6FKnm/WwFvObDkqX4zJFYAT3piQrW87Y6ZTvCCcv7eYSxnj1/p9BxPMAHHnS/dk/sI81fA464L
	7lIXGpAPok6EO3yut2EdToyAuuGPIXq4RC+fkePSWRgAKvCgEfQ8VGQMUjcYw7L5FU3mly9P6BmnV
	FlSqZOOfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4zZ9-0004eF-0J; Thu, 28 Jan 2021 05:09:59 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4zZ6-0004dF-0B
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 05:09:56 +0000
Received: by mail-io1-xd2a.google.com with SMTP id d13so4373634ioy.4
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Jan 2021 21:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wm/YQVXUMhIB/BMDJogyUbmGWPEi6vcYSKKfpvve88M=;
 b=XfARxNdjxfvwbLx87S4vCHGZ+hfoFXMjUJwaPdnI3B5svpibAJe2bxnEiivIvlareH
 nLMmddqGzyG0sSKdPR6iM7yvKfFBSzPSZ/UdDvm6ZTbORRtrQ52843Z4tTH4K/cmZhBr
 HouPPShhc/heV0RPWVfOFxAJ3hTmLn0UViKMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wm/YQVXUMhIB/BMDJogyUbmGWPEi6vcYSKKfpvve88M=;
 b=eyUgwERzo657j8TSHtSMJRrHO5vxox4pGA97cPPODATdssk2CkIm6owg5QMeYZksj+
 h+eyCblYSZFbU5jZnhHeNUkeMJbgEbRRKZmn3BJoIgrxtFO3ChXAwvwdjF3Y2otrGH1s
 XT9i9+qw4OtutBI1T+TPafOc27gS0eW/XI/zwQCvPtiYpc3qPP4fkMUP2qOnfOqYCGns
 tj3AxdH8cNDwec5y23tTPPtI7E4Lkuwl52FU/+sepC5eLV0ZArYF9Gm9MLnVQFyR+TSc
 HP6H8DsNMcs9kkUYBlbaWIuJMS59tARPJDjWZqyTIo68VwuD59O2RIdS4fHGDhZx7kKW
 zUvA==
X-Gm-Message-State: AOAM530WoQWk3pybcjbXmfjYqLN79LMPfMsYRlJ0cgqbh5fZ80b6bLqf
 ziB5gl9pH1XawwilBK5ULNT7ZiUAK9VoSml4XtYb/ZCO9f67iw==
X-Google-Smtp-Source: ABdhPJw9RDW4YOgrrY0K/Zhny0x/8TzsFk5NQqU8SfevdJcvgReB/EkAPUFQ4VOQjiKOfFg40N4g+dqfJBA6RuMZM68=
X-Received: by 2002:a05:6638:138e:: with SMTP id
 w14mr11568954jad.98.1611810592540; 
 Wed, 27 Jan 2021 21:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20210127045422.2418917-1-hsinyi@chromium.org>
 <20210127045422.2418917-5-hsinyi@chromium.org>
 <1611808753.19104.2.camel@mtksdaap41>
In-Reply-To: <1611808753.19104.2.camel@mtksdaap41>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 13:09:26 +0800
Message-ID: <CAJMQK-jeBBsxZ1RnFJfT5ouNJsBwEkLbZ_+6T+VUFZ_xDQ7rpQ@mail.gmail.com>
Subject: Re: [PATCH v10 4/9] drm/mediatek: generalize mtk_dither_set() function
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_000956_087159_EE16C651 
X-CRM114-Status: GOOD (  23.96  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 28, 2021 at 12:39 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Hsin-Yi:
>
> On Wed, 2021-01-27 at 12:54 +0800, Hsin-Yi Wang wrote:
> > There may be data structure other than mtk_ddp_comp_dev that would call
> > mtk_dither_set(), so use regs as parameter instead of device.
>
> You does not change the interface of mtk_dither_set(). You move the
> common part in mtk_dither_set() to a new function which could be called
> by another caller.
>
> Regards,
> CK.
>
Current mtk_dither_set() cast dev data to struct mtk_ddp_comp_dev. But
mtk_disp_gamma in next patch would also call this function. But it's
dev data is struct mtk_disp_gamma, which is different, so we can't
cast to mtk_ddp_comp_dev. I separate the necessary parameters (regs,
cmdq_reg) out, so both component dither and gamma can both call this
separated function.

This is similar to the mtk_gamma_set_common() in the next patch, which
gamma and aal both used.

> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_drv.h     |  4 ++++
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 25 +++++++++++++--------
> >  2 files changed, 20 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > index 46d199b7b4a29..c50d5fc9fd349 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> > @@ -17,6 +17,10 @@ void mtk_color_config(struct device *dev, unsigned int w,
> >                     unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
> >  void mtk_color_start(struct device *dev);
> >
> > +void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> > +                        unsigned int bpc, unsigned int CFG,
> > +                        struct cmdq_pkt *cmdq_pkt);
> > +
> >  void mtk_dpi_start(struct device *dev);
> >  void mtk_dpi_stop(struct device *dev);
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index 7b5293429426d..53d25823a37cc 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -151,33 +151,40 @@ static void mtk_ddp_clk_disable(struct device *dev)
> >       clk_disable_unprepare(priv->clk);
> >  }
> >
> > -static void mtk_dither_set(struct device *dev, unsigned int bpc,
> > -                 unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> > -{
> > -     struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> >
> > +void mtk_dither_set_common(void __iomem *regs, struct cmdq_client_reg *cmdq_reg,
> > +                        unsigned int bpc, unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> > +{
> >       /* If bpc equal to 0, the dithering function didn't be enabled */
> >       if (bpc == 0)
> >               return;
> >
> >       if (bpc >= MTK_MIN_BPC) {
> > -             mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_5);
> > -             mtk_ddp_write(cmdq_pkt, 0, &priv->cmdq_reg, priv->regs, DISP_DITHER_7);
> > +             mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_5);
> > +             mtk_ddp_write(cmdq_pkt, 0, cmdq_reg, regs, DISP_DITHER_7);
> >               mtk_ddp_write(cmdq_pkt,
> >                             DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
> >                             DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
> >                             DITHER_NEW_BIT_MODE,
> > -                           &priv->cmdq_reg, priv->regs, DISP_DITHER_15);
> > +                           cmdq_reg, regs, DISP_DITHER_15);
> >               mtk_ddp_write(cmdq_pkt,
> >                             DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
> >                             DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
> >                             DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
> >                             DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
> > -                           &priv->cmdq_reg, priv->regs, DISP_DITHER_16);
> > -             mtk_ddp_write(cmdq_pkt, DISP_DITHERING, &priv->cmdq_reg, priv->regs, CFG);
> > +                           cmdq_reg, regs, DISP_DITHER_16);
> > +             mtk_ddp_write(cmdq_pkt, DISP_DITHERING, cmdq_reg, regs, CFG);
> >       }
> >  }
> >
> > +static void mtk_dither_set(struct device *dev, unsigned int bpc,
> > +                 unsigned int CFG, struct cmdq_pkt *cmdq_pkt)
> > +{
> > +     struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > +
> > +     mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, CFG, cmdq_pkt);
> > +}
> > +
> >  static void mtk_od_config(struct device *dev, unsigned int w,
> >                         unsigned int h, unsigned int vrefresh,
> >                         unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
