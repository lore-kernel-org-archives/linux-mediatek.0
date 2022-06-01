Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B7F1C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 08:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dsAZv8A1nHUjVLBQ4mcf3/UuJBnpYqs2+Xt09D1u6Ss=; b=lX9EE/AuP/aikF
	y0SyAAmmi7K5pt0DTPGXstDGaJmMQfaBmW35MnjviqhNIY59CnMbPqTtFJ3z760rVVh8xRYw4LWKX
	B21eSWzvFCqBcb0lPHrb4jLfDYs0KpIyQKUd4wAFVi3ZpKkY8DIMtGnN/AjXGmVRs/ZOw5M5UaMj6
	hxxAJzbarqUh4PuR0cl1IajBSKEJ075SJ2AaPnSTZdJE7TYmo8G0iOW2SXTUwEhU9nNIz4cEUbA62
	GjaKTbLxzuaXCdKp4lrtGHs0qqC6np0daIvxgLOs4PF3xzjZWoNxqf1n5zTt6uqj/nstJGxBMu66P
	u4nYVA0s3tgDQNsTEdDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJh9-00EeHx-9K; Wed, 01 Jun 2022 08:27:11 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwJh2-00EeFq-Vl
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 08:27:07 +0000
Received: by mail-ej1-x631.google.com with SMTP id fu3so703917ejc.7
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 01:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=suGTguNgHNwFoVKJnInY/A0FAKDNS8MrOyf97TQ0XqE=;
        b=Kz8kZXot4lBQ750zIIvzF3+bHcnNBQtqQzQ1b2o8YXiovCx4t37CQJaYYLktnNzNWJ
         oiuAIk4+P0ht5DpbHp+/pH42JI/DYgbAj/NglXOGybp75vRdDPoI+c7MEl2u+BKuUcEg
         G0ED2t7sW1NRpNK8E9QGxnmiTuZCCtBR+LrDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=suGTguNgHNwFoVKJnInY/A0FAKDNS8MrOyf97TQ0XqE=;
        b=q7SM4WYfiMluUCtlvGYu6ZdJioBSWlPCqiv5hb5ilPLESVQRh+7CIK/rRILqv5CtRO
         VksbhYF3IT2Wo99z73wPv98DMxl87W/yeQGCYavyQah2u6Ib784PrfDrmc31ynDD+faI
         jkBFUIpyw19InCjGfSlcI5ec4+q9p7MxscDu9cTIPPxfH1HCNn21Qi+Rv/MBlJO2FHsf
         z3+8JdA7SRVc3myEM37yl5e6oR7SdzUi8W7tRt6f4fQL4IBqI3f+Ii1Zn5ocNpI2Gd7z
         /2PX6H8eBFC1g/tSxM1kwtlN/qQFqYM5Q4Mhrfyc0ruv0XAphendLkp5fJEEudt6vf8D
         NVkA==
X-Gm-Message-State: AOAM532hjty4OLHYmE2FivKFu0mKucV0kUMfRcckNVv/HN2aRzZ2Y1XL
	gva9u+6wZbtXwURseKGR9gCS4REOxqWgxlDIV2md3A==
X-Google-Smtp-Source: ABdhPJzKyQ9RhDDQ9wnQwF0m5mvEJpb5dxyTIDWPhvbLIROaZRgzrB121HfZ6Kvw/3Mtkh8DpWUjMyD3cSjoY6y1xU0=
X-Received: by 2002:a17:906:d7ba:b0:6fe:a119:c4ac with SMTP id
 pk26-20020a170906d7ba00b006fea119c4acmr54450591ejb.129.1654072023238; Wed, 01
 Jun 2022 01:27:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220530081910.3947168-1-hsinyi@chromium.org> <a8d1fe13-e747-016a-2d45-bfb50f23f2d9@redhat.com>
 <CAJMQK-iM-ip7edA2mBOhp-8maWKG5+kTceZUM5U6BOLLBq1H4Q@mail.gmail.com> <5ba0b86a-fa9c-ed97-3b43-7814599deab5@redhat.com>
In-Reply-To: <5ba0b86a-fa9c-ed97-3b43-7814599deab5@redhat.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 1 Jun 2022 16:26:37 +0800
Message-ID: <CAJMQK-iYy1ONRF-4Y5DriogsJX3F0MD_951pdKK0rpT3j=keYw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220601_012705_090352_E9324B5E 
X-CRM114-Status: GOOD (  47.98  )
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

On Tue, May 31, 2022 at 6:56 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 5/30/22 13:34, Hsin-Yi Wang wrote:
> > On Mon, May 30, 2022 at 4:53 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 5/30/22 10:19, Hsin-Yi Wang wrote:
> >>> Some drivers, eg. mtk_drm and msm_drm, rely on the panel to set the
> >>> orientation. Panel calls drm_connector_set_panel_orientation() to create
> >>> orientation property and sets the value. However, connector properties
> >>> can't be created after drm_dev_register() is called. The goal is to
> >>> separate the orientation property creation, so drm drivers can create it
> >>> earlier before drm_dev_register().
> >>
> >> Sorry for jumping in pretty late in the discussion (based on the v10
> >> I seem to have missed this before).
> >>
> >> This sounds to me like the real issue here is that drm_dev_register()
> >> is getting called too early?
> >>
> > Right.
> >
> >> To me it seems sensible to delay calling drm_dev_register() and
> >> thus allowing userspace to start detecting available displays +
> >> features until after the panel has been probed.
> >>
> >
> > Most panels set this value very late, in .get_modes callback (since it
> > is when the connector is known), though the value was known during
> > panel probe.
>
> Hmm I would expect the main drm/kms driver to register the drm_connector
> object after probing the panel, right ?
>
> So maybe this is a problem with the panel API? How about adding
> separate callback to the panel API to get the orientation, which the
> main drm/kms driver can then call before registering the connector ?
>
> And then have the main drm/kms driver call
> drm_connector_set_panel_orientation() with the returned orientation
> on the connecter before registering it.
>
> The new get_orientation callback for the panel should of course
> be optional (IOW amy be NULL), so we probably want a small
> helper for drivers using panel (sub)drivers to take care of
> the process of getting the panel orientation from the panel
> (if supported) and then setting it on the connector.
>

Hi Hans,

Thanks for the suggestion. I've sent a new version for this:
https://patchwork.kernel.org/project/dri-devel/patch/20220601081823.1038797-2-hsinyi@chromium.org/

Panel can implement the optional callback to return the orientation
property, while drm/kms driver will call a drm API to get the value
then they can call drm_connector_set_panel_orientation().
Panel .get_mode will still call drm_connector_set_panel_orientation()
but now it will be a no-op as the value was set by drm/kms driver
previously.

This is similar to the small patch below:
https://patchwork.kernel.org/project/linux-mediatek/patch/20220530113033.124072-1-hsinyi@chromium.org/
But it's now using the panel API.

>
> > I think we can also let drm check if they have remote panel nodes: If
> > there is a panel and the panel sets the orientation, let the drm read
> > this value and set the property. Does this workflow sound reasonable?
> >
> > The corresponding patch to implement this:
> > https://patchwork.kernel.org/project/linux-mediatek/patch/20220530113033.124072-1-hsinyi@chromium.org/
>
> That is a suprisingly small patch (which is good). I guess that
> my suggestion to add a new panel driver callback to get
> the orientation would be a bit bigget then this. Still I think
> that that would be a bit cleaner, as it would also solve this
> for cases where the orientation comes from the panel itself
> (through say some EDID extenstion) rather then from devicetree.
>
> Still I think either way should be acceptable upstream.
>
> Opinions from other drm devs on the above are very much welcome!
>
> Your small patch nicely avoids the probe ordering problem,
> so it is much better then this patch series.
>
> Regards,
>
> Hans
>
>
>
> >
> > Thanks
> >
> >> I see a devicetree patch in this series, so I guess that the panel
> >> is described in devicetree. Especially in the case of devicetree
> >> I would expect the kernel to have enough info to do the right
> >> thing and make sure the panel is probed before calling
> >> drm_dev_register() ?
> >>
> >> Regards,
> >>
> >> Hans
> >>
> >>
> >>
> >>
> >>>
> >>> After this series, drm_connector_set_panel_orientation() works like
> >>> before. It won't affect existing callers of
> >>> drm_connector_set_panel_orientation(). The only difference is that
> >>> some drm drivers can call drm_connector_init_panel_orientation_property()
> >>> earlier.
> >>>
> >>> Hsin-Yi Wang (4):
> >>>   gpu: drm: separate panel orientation property creating and value
> >>>     setting
> >>>   drm/mediatek: init panel orientation property
> >>>   drm/msm: init panel orientation property
> >>>   arm64: dts: mt8183: Add panel rotation
> >>>
> >>>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  1 +
> >>>  drivers/gpu/drm/drm_connector.c               | 58 ++++++++++++++-----
> >>>  drivers/gpu/drm/mediatek/mtk_dsi.c            |  7 +++
> >>>  drivers/gpu/drm/msm/dsi/dsi_manager.c         |  4 ++
> >>>  include/drm/drm_connector.h                   |  2 +
> >>>  5 files changed, 59 insertions(+), 13 deletions(-)
> >>>
> >>
> >
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
