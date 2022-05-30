Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59BDC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 11:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oZN2AGJ+ze4m0h/d+u4j86IgaodOxMXGv4K+RFV0HzQ=; b=z4wvueaKCcza8/
	zpyhtt3po/K/13q3FyjBNXacez6tQrR+VKxPrBW2Jls+xPae+ZOau4MOdUu7j5XuQf5Hf6/UKGMuB
	3ZPMmU3iqAZ1Z/HfMwKeQvQKJCxSk5CPXFZdvid1OSagPSSHzWp9Q0gkLAxnUzWZySwIJmCHc6LiC
	ZX2+S4tPCNSv4NrwRec7qxVlfOQVUTrmhoKTNZ5c0jZEIJjRqED+0JWCh18Rch2KqUgIOS0KitaQN
	zZ5HPrCC6PbG5rcDV8ZhgtHSfIi+UAh30hqdRHxrLgAZ93FBMEhwE/4NoNS7yZJj7ws5SS/uNgBUx
	rS5eGl3/ALES4huTF49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdfl-006N1e-K6; Mon, 30 May 2022 11:34:57 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvdfi-006Mzh-JG
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 11:34:56 +0000
Received: by mail-vs1-xe29.google.com with SMTP id j7so10545855vsp.12
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 04:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qavSBhjyJguHpZQtpsLoQunCmJj0UaxeZNUkFbvKHQI=;
        b=nylRUfykXAR4BPxN2kUQcQBx4UFaWucm9OU50Q26J8eVjUxEfey2e3vXkpeXlJPdBw
         yk04wEP2nFeCYhiVSzO2zQEQN7BleasMfad4K+q10YYI80QpMv9sXRHHxhDiw+J4mjqe
         y47MsyfOZhDnFZ0lbA46oIfYX2KDrn8RZ59ME=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qavSBhjyJguHpZQtpsLoQunCmJj0UaxeZNUkFbvKHQI=;
        b=XtM8/e9Tw4+zNin0PjSkfWP9N1EEBib6+RpVlWt7gaQ5PVW+5mgyc9UXrhJDlM3KJE
         pKuHztZgHaZMInb4WEA+Ng27q8M+pWwVSOfV3Gh5sQ4CI5e6IdJpLSPClMi2K6gEAkAu
         icAq0RD76W9RZ7B16RIWpxIJ7YdYvhBzzUCnimTIeJYbHXlVnnwerOGUMnBA42DYsTeT
         N9elbucmTe46WZ3VCV0luGFJoCdO7yT6SRDTYudpZFEFJKYImH7Xs9tO0GGy3WH6hMpX
         fd2T5ruWLo23/1x5H2NnlmPRxBREdtcGJ0bGfOd2PkC39Agljcq+uFr19v53C1e4fJNt
         KFzg==
X-Gm-Message-State: AOAM530e1XtDqGLRG2VQCiGobEsstkZn0BJxe40GGeVKYAMzHaYxaUcZ
	DmeHWXnnLhShDhtqJf9RF8Tyx3OCkfZfABuYClSQEQ==
X-Google-Smtp-Source: ABdhPJz7U/gg2bILW7eDQUEq+WiZSAg270VcwmISAU4Df/YG59TiLQ7aY2VN1tkTv7lkJuqBw4E/tvdvjiwMPfduP50=
X-Received: by 2002:a05:6102:1008:b0:335:e260:9ff1 with SMTP id
 q8-20020a056102100800b00335e2609ff1mr21708870vsp.32.1653910493009; Mon, 30
 May 2022 04:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220530081910.3947168-1-hsinyi@chromium.org> <a8d1fe13-e747-016a-2d45-bfb50f23f2d9@redhat.com>
In-Reply-To: <a8d1fe13-e747-016a-2d45-bfb50f23f2d9@redhat.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 30 May 2022 19:34:27 +0800
Message-ID: <CAJMQK-iM-ip7edA2mBOhp-8maWKG5+kTceZUM5U6BOLLBq1H4Q@mail.gmail.com>
Subject: Re: [PATCH v10 0/4] Separate panel orientation property creating and
 value setting
To: Hans de Goede <hdegoede@redhat.com>
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
	Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>, 
	Alex Deucher <alexander.deucher@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Emil Velikov <emil.l.velikov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_043454_720747_DEEEEF55 
X-CRM114-Status: GOOD (  28.11  )
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

On Mon, May 30, 2022 at 4:53 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 5/30/22 10:19, Hsin-Yi Wang wrote:
> > Some drivers, eg. mtk_drm and msm_drm, rely on the panel to set the
> > orientation. Panel calls drm_connector_set_panel_orientation() to create
> > orientation property and sets the value. However, connector properties
> > can't be created after drm_dev_register() is called. The goal is to
> > separate the orientation property creation, so drm drivers can create it
> > earlier before drm_dev_register().
>
> Sorry for jumping in pretty late in the discussion (based on the v10
> I seem to have missed this before).
>
> This sounds to me like the real issue here is that drm_dev_register()
> is getting called too early?
>
Right.

> To me it seems sensible to delay calling drm_dev_register() and
> thus allowing userspace to start detecting available displays +
> features until after the panel has been probed.
>

Most panels set this value very late, in .get_modes callback (since it
is when the connector is known), though the value was known during
panel probe.

I think we can also let drm check if they have remote panel nodes: If
there is a panel and the panel sets the orientation, let the drm read
this value and set the property. Does this workflow sound reasonable?

The corresponding patch to implement this:
https://patchwork.kernel.org/project/linux-mediatek/patch/20220530113033.124072-1-hsinyi@chromium.org/

Thanks

> I see a devicetree patch in this series, so I guess that the panel
> is described in devicetree. Especially in the case of devicetree
> I would expect the kernel to have enough info to do the right
> thing and make sure the panel is probed before calling
> drm_dev_register() ?
>
> Regards,
>
> Hans
>
>
>
>
> >
> > After this series, drm_connector_set_panel_orientation() works like
> > before. It won't affect existing callers of
> > drm_connector_set_panel_orientation(). The only difference is that
> > some drm drivers can call drm_connector_init_panel_orientation_property()
> > earlier.
> >
> > Hsin-Yi Wang (4):
> >   gpu: drm: separate panel orientation property creating and value
> >     setting
> >   drm/mediatek: init panel orientation property
> >   drm/msm: init panel orientation property
> >   arm64: dts: mt8183: Add panel rotation
> >
> >  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  1 +
> >  drivers/gpu/drm/drm_connector.c               | 58 ++++++++++++++-----
> >  drivers/gpu/drm/mediatek/mtk_dsi.c            |  7 +++
> >  drivers/gpu/drm/msm/dsi/dsi_manager.c         |  4 ++
> >  include/drm/drm_connector.h                   |  2 +
> >  5 files changed, 59 insertions(+), 13 deletions(-)
> >
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
