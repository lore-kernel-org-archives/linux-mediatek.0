Return-Path: <SRS0=gQ79=JX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30057C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 05:20:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8A8261003
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Apr 2021 05:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8A8261003
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IZec8ld1/6edtVe99KidMSd4ZPpPVqIxqOHsXT6Vo2k=; b=Vhy4/qz9ldaccwJiB0bqE4ggS
	jbuQs2W/uOs4hsVkTtS3aWTimQg4PLXM9qS/BjnqXKxSYNg/mz42D4j++IrSSGRFxM+QhIZRr2Nk1
	JQQnvlcV1c7bQC8Vf7WqppIu4nCxFW24v+8s5AlFVY2ZbpAVPxRSjvAPtj7K89kIlyk6SYjnKz8pv
	RSkKe160zu8VDNiC+BvJgRg0dR5G5nCRy5KgwUYmsqnYAoo42BM6LGNPx0Yp+/HVvS+reGZw6NWZi
	dcjUJDviP1VT0mhxM29+NiiMrsrh4To0rqh3NfRt5UxHnnrramy4ulUSzCMXcSktwJ8W2A8b1QwDi
	1ULGhPQog==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1latfl-006w20-G3; Mon, 26 Apr 2021 05:20:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1latfZ-006vyE-Gt
 for linux-mediatek@desiato.infradead.org; Mon, 26 Apr 2021 05:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=zpMkjz9KyykiFO6l5ZQQuINgIfMM9OaiAAxRnjrTqLo=; b=o95NHl8PBMRcnO9tY8lnbvbaD1
 tvHjrZTQVXdeGakJY3Pure7CEbIGVK1HPBGl+HT9iC5U3IJ4ygtpMg3oAzxqpL/KAQM2o5EDt70iN
 yEp0nkrbHJF+qk3rvq464pBjSbBU4rRN+1STI1Wb3kVCGKZkffBrjC35Sgb2Q1CL48sxFqBZj3Wje
 PgmidLebx+57wlnFLdlq3dijfp40jfnurqD4ANKbUmSg+5vrU5T3UYcaj4gLFj2rednLPTWwyKLlU
 V+s0ubzl1YUqF26Twt6h/f/n0TUSqKVDsQog40tgQEAyEpnXPQ+6bmgjgCfJO4kP4XESa7hyDsm66
 EmHX4WLA==;
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1latfW-00FjmA-Os
 for linux-mediatek@lists.infradead.org; Mon, 26 Apr 2021 05:20:28 +0000
Received: by mail-io1-xd36.google.com with SMTP id t21so3918250iob.2
 for <linux-mediatek@lists.infradead.org>; Sun, 25 Apr 2021 22:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zpMkjz9KyykiFO6l5ZQQuINgIfMM9OaiAAxRnjrTqLo=;
 b=diwNewPbdQFBq8nbfkdx9BlVdn6q+QQ7rkY5vw2F1FJFAl9k5Sx3CJGLUbm8kEplp1
 pKV4i/aMsoZXuMwyoElTvs0J6OWy9/je+pyvdyU40uSSP2iAOhtOnWp73VtHbaYdOvF5
 /almRjcvW7teXIf1nHh/cuafbPEmiyXMjiWfA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zpMkjz9KyykiFO6l5ZQQuINgIfMM9OaiAAxRnjrTqLo=;
 b=iDvmII8PtenO1PuoPq3ioeSz6sCXvfOrIntMbqt+5ks7Zbj1VFFt3h7asFMDD7uF0S
 DfDvUHD0ili9od1ZQWlqaJLKBN8GkxKOQyqqbq12cxGJUSnydtBJW9zkkNdFihWOJlDT
 mxFUWfK2TeUtqqsCdB+yuHlmMAX/OK49roXpy9R0eY+6ta128ikM6eLEXFr+67SSObUB
 56Zc6DNo27pJMgxhkBMwSsSNCAaC45eLh3odw5C+qhh3ul49IWbm2uyemwbrQET2KmxM
 KMHmW5S93TZ717c2bAS5H/8Fpc5VCHKvls4oRr4C6RFicci+3SnHdyCz7L2wOb/Qap/r
 v6yg==
X-Gm-Message-State: AOAM532zhk1PheNuTehrV9c+klqVWSO4m2mJyZJu2BHy8YDFUYWWnM0Y
 sN3u9/zntf92gxojhjOREqUhx588LhgpO27VFp42XA==
X-Google-Smtp-Source: ABdhPJzl+nlI65EpIE3bLCS7G3KC95MAVHm0nvQs80CqTwdYNWAv1l/fLJqKJxUcdszePkWtP+JyptF55LMMQziX0SY=
X-Received: by 2002:a02:a40a:: with SMTP id c10mr14239901jal.98.1619414424923; 
 Sun, 25 Apr 2021 22:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210409045314.3420733-1-hsinyi@chromium.org>
 <CAMavQKJUpYP8jo2JDGMYNBGtbPSSO7z9BAComm5JQoty=HPtJg@mail.gmail.com>
In-Reply-To: <CAMavQKJUpYP8jo2JDGMYNBGtbPSSO7z9BAComm5JQoty=HPtJg@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 26 Apr 2021 13:19:59 +0800
Message-ID: <CAJMQK-govRgDfKhzxhe-GPBQ27EEfpmsxbbNH6X=6CTni=uqRA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/mediatek: set panel orientation before
 drm_dev_register().
To: Sean Paul <sean@poorly.run>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, devicetree <devicetree@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210425_222026_816538_A8DE6631 
X-CRM114-Status: GOOD (  30.34  )
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

On Fri, Apr 23, 2021 at 9:53 PM Sean Paul <sean@poorly.run> wrote:
>
> On Fri, Apr 9, 2021 at 12:53 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > drm_dev_register() sets connector->registration_state to
> > DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> > drm_connector_set_panel_orientation() is first called after
> > drm_dev_register(), it will fail several checks and results in following
> > warning. So set panel orientation in dsi before drm_dev_register() is
> > called.
> >
> > [    4.480976] ------------[ cut here ]------------
> > [    4.485603] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:45 __drm_mode_object_add+0xb4/0xbc
> > <snip>
> > [    4.609772] Call trace:
> > [    4.612208]  __drm_mode_object_add+0xb4/0xbc
> > [    4.616466]  drm_mode_object_add+0x20/0x2c
> > [    4.620552]  drm_property_create+0xdc/0x174
> > [    4.624723]  drm_property_create_enum+0x34/0x98
> > [    4.629241]  drm_connector_set_panel_orientation+0x64/0xa0
> > [    4.634716]  boe_panel_get_modes+0x88/0xd8
> > [    4.638802]  drm_panel_get_modes+0x2c/0x48
> > [    4.642887]  panel_bridge_get_modes+0x1c/0x28
> > [    4.647233]  drm_bridge_connector_get_modes+0xa0/0xd4
> > [    4.652273]  drm_helper_probe_single_connector_modes+0x218/0x700
> > [    4.658266]  drm_mode_getconnector+0x1b4/0x45c
> > [    4.662699]  drm_ioctl_kernel+0xac/0x128
> > [    4.666611]  drm_ioctl+0x268/0x410
> > [    4.670002]  drm_compat_ioctl+0xdc/0xf0
> > [    4.673829]  __arm64_compat_sys_ioctl+0xc8/0x100
> > [    4.678436]  el0_svc_common+0xf4/0x1c0
> > [    4.682174]  do_el0_svc_compat+0x28/0x3c
> > [    4.686088]  el0_svc_compat+0x10/0x1c
> > [    4.689738]  el0_sync_compat_handler+0xa8/0xcc
> > [    4.694171]  el0_sync_compat+0x178/0x180
> > [    4.698082] ---[ end trace b4f2db9d9c88610b ]---
> > [    4.702721] ------------[ cut here ]------------
> > [    4.707329] WARNING: CPU: 5 PID: 369 at drivers/gpu/drm/drm_mode_object.c:243 drm_object_attach_property+0x48/0xb8
> > <snip>
> > [    4.833830] Call trace:
> > [    4.836266]  drm_object_attach_property+0x48/0xb8
> > [    4.840958]  drm_connector_set_panel_orientation+0x84/0xa0
> > [    4.846432]  boe_panel_get_modes+0x88/0xd8
> > [    4.850516]  drm_panel_get_modes+0x2c/0x48
> > [    4.854600]  panel_bridge_get_modes+0x1c/0x28
> > [    4.858946]  drm_bridge_connector_get_modes+0xa0/0xd4
> > [    4.863984]  drm_helper_probe_single_connector_modes+0x218/0x700
> > [    4.869978]  drm_mode_getconnector+0x1b4/0x45c
> > [    4.874410]  drm_ioctl_kernel+0xac/0x128
> > [    4.878320]  drm_ioctl+0x268/0x410
> > [    4.881711]  drm_compat_ioctl+0xdc/0xf0
> > [    4.885536]  __arm64_compat_sys_ioctl+0xc8/0x100
> > [    4.890142]  el0_svc_common+0xf4/0x1c0
> > [    4.893879]  do_el0_svc_compat+0x28/0x3c
> > [    4.897791]  el0_svc_compat+0x10/0x1c
> > [    4.901441]  el0_sync_compat_handler+0xa8/0xcc
> > [    4.905873]  el0_sync_compat+0x178/0x180
> > [    4.909783] ---[ end trace b4f2db9d9c88610c ]---
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index ae403c67cbd9..45a702ee09f3 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -205,6 +205,7 @@ struct mtk_dsi {
> >         u32 irq_data;
> >         wait_queue_head_t irq_wait_queue;
> >         const struct mtk_dsi_driver_data *driver_data;
> > +       enum drm_panel_orientation orientation;
> >  };
> >
> >  static inline struct mtk_dsi *bridge_to_dsi(struct drm_bridge *b)
> > @@ -966,6 +967,8 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
> >         }
> >         drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> >
> > +       drm_connector_set_panel_orientation(dsi->connector, dsi->orientation);
> > +
> >         return 0;
> >
> >  err_cleanup_encoder:
> > @@ -1029,6 +1032,12 @@ static int mtk_dsi_probe(struct platform_device *pdev)
> >                         ret = PTR_ERR(dsi->next_bridge);
> >                         goto err_unregister_host;
> >                 }
> > +
> > +               ret = of_drm_get_panel_orientation(panel->dev->of_node, &dsi->orientation);
> > +               if (ret) {
> > +                       dev_err(dev, "failed to get panel orientation %d\n", ret);
> > +                       return ret;
> > +               }
>
> I don't think this is the right place to mine orientation since it
> duplicates the call from the panel driver.
>
> Instead, how about splitting out
> property_create_enum/attach_orientation_property from
> set_panel_orientation such that you can attach the property (with
> UNKNOWN value) in the connector init and then leave the panel to set
> it properly in get_modes (I kind of disagree with populating this in
> get_modes as well, but I don't think there's anywhere else to stick it
> right now)?
>
> AFAICT orientation is the only property which has the create/attach
> calls in the set function which seems like a perfect recipe for this
> type of failure.
>
>
> Sean
>

Thanks for the review. It is updated in v2.

> >         }
> >
> >         dsi->driver_data = of_device_get_match_data(dev);
> > --
> > 2.31.1.295.g9ea45b61b8-goog
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
