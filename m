Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D98D4C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 06:25:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 830E464DFF
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 06:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 830E464DFF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PbONd6LV7psls27VkRiaOnFNQt0PDVnKU20z5+4Feng=; b=H5dHE4ShKCogGci3fa7/92KE9
	PrLDGJsJL/k3mL+DncAfxSM5BS8fgzbdlK/6zhbxeNfpvES3E412QV82z20CntlgMDGBl3GCm/lXm
	9HVj0hsp1vFePRIZm+IQe7IakvsYyWbT8rEdQ5uCDBRRNP0kkizNwxXsnPNS7mbKu2Q15s5P8hQuk
	qzS02N2pZmGKUw5D4PEXXLeOaZRaQpCtjt8eg5vJCpZVGX3kWP//4/IgcQI2Emc7RoGhpmhkZLlFi
	K7Up4apes6OfwxDYyqXN/NPbfYFjtL96N9YMMTDxVn/CDNE30KbYEK1an/b8/jiUmqCKyNsDKNcFj
	4Juql9gSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5NDB-0003K4-4J; Fri, 29 Jan 2021 06:24:53 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5ND5-0003JB-CK
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 06:24:50 +0000
Received: by mail-io1-xd32.google.com with SMTP id u7so8182610iol.8
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Jan 2021 22:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fdJkTsg9QlUnIAnLN/MgMsR/0bzFNS4OEDx2HjTICTI=;
 b=DaP4BLsk6QESLETMI5yzpXlFJIxIWjfFE4SRMjXiEpS2L7GdeCmnAdlqfA/wLOKRwI
 2qU9SMKV6ITmkh3HEyOucBHFaRpRUXMFgWuo5suPTo53aa5sXbP1PnQ55SG+wQnNFU6i
 8Ek/SLF8oUWlPmdKNcZfkB/neWZV2GCVAOswU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fdJkTsg9QlUnIAnLN/MgMsR/0bzFNS4OEDx2HjTICTI=;
 b=D8R2Sw08RBi6Dg9lrpARZBnEafiIXRRHR5o3Pgycmgccr6rSx5CM3qsRHFpvytrcvS
 +XeXT8l09jLNT18/uoVQ48G48mgazHVEUc4lH2TWX+r6hW0Uj4WjkZWgZjFhNzlP+qRL
 IWUZZ9PKlGC8MFKolDZY+L8T97E0FMd5C3VZUYbr7CJkbL39GpoGk0QD7QBgIg5FQOUW
 ThEnB6Dek4KohwKgVZM4ShS5zbR8jdT1F6zblcql1bWzbJH74zZcrerdYLCjau70QKCF
 YvVKo5eL4oiQvRF8PChsPYkRUw9huKey4Ddx3VQGPTkcfeZ3mFvsu4TdCQ0qD4cSjJL4
 H3AQ==
X-Gm-Message-State: AOAM533zxF0PzS+6Zm6dt2wlQ+Z/KMXWOQLVwYNCXtedsjibYfx8pL9q
 Wop0npTRDRhH/RhgrjXYVmhm4kQryVmrPJ0re9ub0g==
X-Google-Smtp-Source: ABdhPJxJTAHva2F8AyL7R2uGD36xAwZUghomDXF9P40uBpjLR1/Nmwi1027a4w9d+jbPTbW5McMmNCG0d+h9avKjSqs=
X-Received: by 2002:a05:6638:138e:: with SMTP id
 w14mr2329658jad.98.1611901483908; 
 Thu, 28 Jan 2021 22:24:43 -0800 (PST)
MIME-Version: 1.0
References: <20210128112314.1304160-1-hsinyi@chromium.org>
 <20210128112314.1304160-7-hsinyi@chromium.org>
 <1611883982.5226.12.camel@mtksdaap41>
In-Reply-To: <1611883982.5226.12.camel@mtksdaap41>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 29 Jan 2021 14:24:18 +0800
Message-ID: <CAJMQK-gKKjLJ5xOAKOx5BM5dL2MxgFq72FVCfGTfzK4ZXzRJfA@mail.gmail.com>
Subject: Re: [PATCH v12 6/8] drm/mediatek: enable dither function
To: CK Hu <ck.hu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_012447_502613_BB7E5BB1 
X-CRM114-Status: GOOD (  26.29  )
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
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 29, 2021 at 9:33 AM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Hsin-Yi:
>
> On Thu, 2021-01-28 at 19:23 +0800, Hsin-Yi Wang wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> >
> > for 5 or 6 bpc panel, we need enable dither function
> > to improve the display quality
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 15 +++++++++++++--
> >  1 file changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > index ac2cb25620357..6c8f246380a74 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> > @@ -53,6 +53,7 @@
> >  #define DITHER_EN                            BIT(0)
> >  #define DISP_DITHER_CFG                              0x0020
> >  #define DITHER_RELAY_MODE                    BIT(0)
> > +#define DITHER_ENGINE_EN                     BIT(1)
> >  #define DISP_DITHER_SIZE                     0x0030
> >
> >  #define LUT_10BIT_MASK                               0x03ff
> > @@ -314,9 +315,19 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
> >                             unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
> >  {
> >       struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
> > +     bool enable = (bpc == 5 || bpc == 6);
>
> I strongly believe that dither function in dither is identical to the
> one in gamma and od, and in mtk_dither_set_common(), 'bpc >=
> MTK_MIN_BPC' is valid, so I believe we need not to limit bpc to 5 or 6.
> But we should consider the case that bpc is invalid in
> mtk_dither_set_common(). Invalid case in gamma and od use different way
> to process. For gamma, dither is default relay mode, so invalid bpc
> would do nothing in mtk_dither_set_common() and result in relay mode.
> For od, it set to relay mode first, them invalid bpc would do nothing in
> mtk_dither_set_common() and result in relay mode. I would like dither,
> gamma and od to process invalid bpc in the same way. One solution is to
> set relay mode in mtk_dither_set_common() for invalid bpc.
>
> Regards,
> CK
>

I modify the mtk_dither_config() to follow:


diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index ac2cb25620357..5b7fcedb9f9a8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -53,6 +53,7 @@
 #define DITHER_EN                              BIT(0)
 #define DISP_DITHER_CFG                                0x0020
 #define DITHER_RELAY_MODE                      BIT(0)
+#define DITHER_ENGINE_EN                       BIT(1)
 #define DISP_DITHER_SIZE                       0x0030

 #define LUT_10BIT_MASK                         0x03ff
@@ -166,6 +167,8 @@ void mtk_dither_set_common(void __iomem *regs,
struct cmdq_client_reg *cmdq_reg,
                              DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
                              cmdq_reg, regs, DISP_DITHER_16);
                mtk_ddp_write(cmdq_pkt, dither_en, cmdq_reg, regs, cfg);
+       } else {
+               mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, cmdq_reg, regs, cfg);
        }
 }

@@ -315,8 +318,12 @@ static void mtk_dither_config(struct device *dev,
unsigned int w,
 {
        struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);

-       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg,
priv->regs, DISP_DITHER_SIZE);
-       mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg,
priv->regs, DISP_DITHER_CFG);
+       mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+                     DISP_DITHER_SIZE);
+       mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
+                     DISP_DITHER_CFG);
+       mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_DITHER_CFG,
+                              DITHER_ENGINE_EN, cmdq_pkt);
 }

So now, not only bpc==5 or 6, but all valid bpc, dither config will
call mtk_dither_set_common() with the flag DITHER_ENGINE_EN(BIT(1)).
od config will call mtk_dither_set_common() with the flag
DISP_DITHERING(BIT(2)).
Additionally for 8173, gamma config will call mtk_dither_set_common()
with the flag DISP_DITHERING (BIT(2))

For invalid mode all of them will be DITHER_RELAY_MODE.

Just to make sure that this follows the spec? thanks

> >
> > -     mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
> > -     mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
> > +     if (enable) {
> > +             mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc,
> > +                                   DISP_DITHER_CFG, DITHER_ENGINE_EN,
> > +                                   cmdq_pkt);
> > +     } else {
> > +             mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg,
> > +                           priv->regs, DISP_DITHER_CFG);
> > +     }
> > +
> > +     mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
> > +                   DISP_DITHER_SIZE);
> >  }
> >
> >  static void mtk_dither_start(struct device *dev)
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
