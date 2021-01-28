Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9A7C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 08:42:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C9DD60235
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 08:42:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C9DD60235
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mdMwRCNL/pbMXXEmrV48Ydpm0IMx2nRXxmWfPXl3Z6Y=; b=U/azoX9sNNCH3uW7g2dB4ukiK
	rrDug2lz6xmsMjPrCFegBaepxmzA5q3Uac/N8tLwJF/A1f8fLhf1KYIIS7zUNOn6eae7EFtDONBLg
	v7Lx+rZEjwtq3nLJNA7z5DoXWJr1oHshT3uYzYbcICdHYwwl80w2NfsPcsGC+0ikSeN2IFkVWr7QX
	ePZjPlv4NolDp8KFjQMymC8OzSXEToWjF4VnwOwwybF38fZIPXVEcUKip962MAUEiwC0uE76Y6Om7
	R4NcGQ92TPOX1dxrf1dWbMbBeiQRnESVI9Zgqjblr0xKI1Wcv+aDQRinwHIVEpbQ5p+B/dyIVCEE1
	5gcBg+0Xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l52sL-0004NE-PV; Thu, 28 Jan 2021 08:42:01 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l52sH-0004Lp-Lp
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 08:41:58 +0000
Received: by mail-io1-xd2a.google.com with SMTP id y19so4777239iov.2
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Jan 2021 00:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mu1RhY5vdfd0PTGfJwJGRCpzx0IqBE4gizmtkvOgrag=;
 b=jkiPQtgKKFoLMfK+SFzZuQc0bycRMssH7w1bBAF7dDfG9hUkPsyg3rqsBsZ7q9bsc5
 xWGTX7X8OxS6qjRZ6u0va7mjVOemzy1AwSRTrVSqMK3wkmyfVqa4TP2sD6s12W8a/5qT
 ruHgEeJDLUy8NNS2DSVNt0qk2kjDH0SrYWz28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mu1RhY5vdfd0PTGfJwJGRCpzx0IqBE4gizmtkvOgrag=;
 b=d84HV14q4kL+U8gOEWig8ZtDRaag2BE8M/c0a/jVlXR6wmHxCjP8GvCbyKn20fJ+Bu
 3Bs6ls9bpebUIC4kK9oCtsXSnfr0RI80DWZz55mSXwnj1dI1hrzmgwR4gRvN5e201rEG
 UYVwPz/aBL3QGb0YMLUYLK7CU9SkDJ4ItJrxsmCeL7fUoWOQ4mth2N+7e5GduB6vDsB5
 KiMk1LiFYG8PSSFSzaiEQnH0DErCkBjKETCTYUPUprA4IBqtEkgQhTIFCm2kR2d6d9VU
 Yif2CD+RGaXwm184WxiBAgp2K/RXnmfhCo4ZwKokasCEDR8CvSO6qkpMT8f28D72v3at
 taHw==
X-Gm-Message-State: AOAM530LjMpTIjR2VG5QXbkATe6n1fZq/JfNxoydgN213AZvux51E7n9
 RRhDsZ3ytjSu4OIkuGkAwjS/RQ5o5+h87wH/HClwpQ==
X-Google-Smtp-Source: ABdhPJzZiOa3nQIoXOADguUymQXk0d1c2N5Z23LxFqwIuGzQUSONJoOQ2Z0t9YOgq72GDzGog90V2y/lROFB/q16NIY=
X-Received: by 2002:a02:aa9a:: with SMTP id u26mr12050398jai.4.1611823315806; 
 Thu, 28 Jan 2021 00:41:55 -0800 (PST)
MIME-Version: 1.0
References: <20210128072802.830971-1-hsinyi@chromium.org>
 <20210128072802.830971-8-hsinyi@chromium.org>
 <1611819766.16091.4.camel@mtksdaap41> <1611820770.1947.8.camel@mhfsdcap03>
 <1611821233.18369.4.camel@mtksdaap41> <1611821396.1947.10.camel@mhfsdcap03>
 <CAJMQK-h1_d1+SpxMC8LGPJK=X9HHoJ_ueFzV2Sq44buCiaXFUA@mail.gmail.com>
 <1611822524.23925.4.camel@mtksdaap41> <1611822729.1947.14.camel@mhfsdcap03>
In-Reply-To: <1611822729.1947.14.camel@mhfsdcap03>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 28 Jan 2021 16:41:29 +0800
Message-ID: <CAJMQK-g9QRhLVM77KrTscYA74D_Kx1yxxwGN_Bk0dN2Z=Dp6Eg@mail.gmail.com>
Subject: Re: [PATCH v11 7/9] drm/mediatek: enable dither function
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_034157_751534_ED4E5F0F 
X-CRM114-Status: GOOD (  34.96  )
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
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 28, 2021 at 4:32 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> On Thu, 2021-01-28 at 16:28 +0800, CK Hu wrote:
> > On Thu, 2021-01-28 at 16:18 +0800, Hsin-Yi Wang wrote:
> > > On Thu, Jan 28, 2021 at 4:10 PM Yongqiang Niu
> > > <yongqiang.niu@mediatek.com> wrote:
> > > >
> > > > On Thu, 2021-01-28 at 16:07 +0800, CK Hu wrote:
> > > > > On Thu, 2021-01-28 at 15:59 +0800, Yongqiang Niu wrote:
> > > > > > On Thu, 2021-01-28 at 15:42 +0800, CK Hu wrote:
> > > > > > > Hi, Hsin-Yi:
> > > > > > >
> > > > > > > On Thu, 2021-01-28 at 15:28 +0800, Hsin-Yi Wang wrote:
> > > > > > > > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > > > > > >
> > > > > > > > for 5 or 6 bpc panel, we need enable dither function
> > > > > > > > to improve the display quality
> > > > > > > >
> > > > > > > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > > > > > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 44 ++++++++++++++++++++-
> > > > > > > >  1 file changed, 43 insertions(+), 1 deletion(-)
> > > > > > > >
> > > > > > > > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > > > > > index 8173f709272be..e85625704d611 100644
> > > > > > > > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > > > > > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > > > > > > > @@ -53,7 +53,9 @@
> > > > > > > >  #define DITHER_EN                              BIT(0)
> > > > > > > >  #define DISP_DITHER_CFG                                0x0020
> > > > > > > >  #define DITHER_RELAY_MODE                      BIT(0)
> > > > > > > > +#define DITHER_ENGINE_EN                       BIT(1)
> > > > > > > >  #define DISP_DITHER_SIZE                       0x0030
> > > > > > > > +#define DITHER_REG(idx)                                (0x100 + (idx) * 4)
> > > > > > > >
> > > > > > > >  #define LUT_10BIT_MASK                         0x03ff
> > > > > > > >
> > > > > > > > @@ -313,8 +315,48 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
> > > > > > > >  {
> > > > > > > >         struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > > > > > > >
> > > > > > > > +       bool enable = false;
> > > > > > > > +
> > > > > > > > +       /* default value for dither reg 5 to 14 */
> > > > > > > > +       const u32 dither_setting[] = {
> > > > > > > > +               0x00000000, /* 5 */
> > > > > > > > +               0x00003002, /* 6 */
> > > > > > > > +               0x00000000, /* 7 */
> > > > > > > > +               0x00000000, /* 8 */
> > > > > > > > +               0x00000000, /* 9 */
> > > > > > > > +               0x00000000, /* 10 */
> > > > > > > > +               0x00000000, /* 11 */
> > > > > > > > +               0x00000011, /* 12 */
> > > > > > > > +               0x00000000, /* 13 */
> > > > > > > > +               0x00000000, /* 14 */
> > > > > > >
> > > > > > > Could you explain what is this?
> > > > > >
> > > > > > this is dither 5 to dither 14 setting
> > > > > > this will be useless, we just need set dither 5 and dither 7 like
> > > > > > mtk_ddp_write(cmdq_pkt, 0, comp, DISP_DITHER_5);
> > > > > > mtk_ddp_write(cmdq_pkt, 0, comp, DISP_DITHER_7);
> > > > > > other value is same with hardware default value.
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > > +       };
> > > > > > > > +
> > > > > > > > +       if (bpc == 5 || bpc == 6) {
> > > > > > > > +               enable = true;
> > > > > > > > +               mtk_ddp_write(cmdq_pkt,
> > > > > > > > +                             DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
> > > > > > > > +                             DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
> > > > > > > > +                             DITHER_NEW_BIT_MODE,
> > > > > > > > +                             &priv->cmdq_reg, priv->regs, DITHER_REG(15));
> > > > > > > > +               mtk_ddp_write(cmdq_pkt,
> > > > > > > > +                             DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
> > > > > > > > +                             DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
> > > > > > > > +                             DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
> > > > > > > > +                             DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
> > > > > > >
> > > > > > > This result in 0x50505050, but previous version is 0x50504040, so this
> > > > > > > version is correct and previous version is incorrect?
> > > > > >
> > > > > > the new version set r g b 3 channel same, seams more reasonable
> > > > > >
> > > > > >
> > > > >
> > > > > So all the setting of DISP_DITHER_5, DISP_DITHER_7, DISP_DITHER_15,
> > > > > DISP_DITHER_16 is identical to mtk_dither_set(), so call
> > > > > mtk_dither_set() instead of duplication here.
> > > > >
> > > >
> > > > dither enable set in mtk_dither_set is
> > > > mtk_ddp_write(cmdq_pkt, DISP_DITHERING, comp, CFG);
> > > >
> > > > that is different 8183 and mt8192.
> > > > mt8173 dither enable in gamma is bit2
> > > > mt8183 and mt8192 dither engine enable is bit 1
> > > >
> > > >
> > >
> > > We can still call mtk_dither_set() for bpc is 5 or 6 here, though it
> > > will be set to bit2,
> > > but later in mtk_ddp_write(cmdq_pkt, enable ? DITHER_ENGINE_EN :
> > > DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG); it
> > > will be correct back to bit 1.
> > >
> > > Is this reasonable?
> >
> > Looks weird. Maybe pass some information into mtk_dither_set() to set
> > DISP_DITHERING correctly.
> >
> > I find one thing need to be fixed. CFG should be lower case.
>
> we could modify this like this:
>
> void mtk_dither_set(struct mtk_ddp_comp *comp, unsigned int bpc,
>                     unsigned int cfg, u32 dither_enable, struct cmdq_pkt *cmdq_pkt)
>
>                 mtk_ddp_write(cmdq_pkt, dither_enable, comp, cfg);
>
>
>

Thanks, I'll add another flag to mtk_dither_set_common.

> >
> > Regards,
> > CK
> >
> > >
> > > > > Regards,
> > > > > CK
> > > > > > >
> > > > > > > Regards,
> > > > > > > CK
> > > > > > >
> > > > > > > > +                             &priv->cmdq_reg, priv->regs, DITHER_REG(16));
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > > +
> > > > > > > > +       if (enable) {
> > > > > > > > +               u32 idx;
> > > > > > > > +
> > > > > > > > +               for (idx = 0; idx < ARRAY_SIZE(dither_setting); idx++)
> > > > > > > > +                       mtk_ddp_write(cmdq_pkt, dither_setting[idx], &priv->cmdq_reg, priv->regs,
> > > > > > > > +                                     DITHER_REG(idx + 5));
> > > > > > > > +       }
> > > > > > > > +
> > > > > > > >         mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
> > > > > > > > -       mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> > > > > > > > +        mtk_ddp_write(cmdq_pkt, enable ? DITHER_ENGINE_EN : DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> > > > > > > >  }
> > > > > > > >
> > > > > > > >  static void mtk_dither_start(struct device *dev)
> > > > > > >
> > > > > > >
> > > > > >
> > > > > >
> > > > >
> > > > >
> > > >
> >
> >
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
