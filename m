Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A26C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 13:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXBaIVI9rZEeBVIz0XUDXxdXvzdIlKzMinKX8ryVX+E=; b=BouXaO+PvfrGPQ
	7I6FhQI/ucvwHjcSG2sEW6vcT34wEK73UHWbyl+6+Ji0JdvbOuZn+GoiCiDR54cSzeSC+MUwrYRe0
	WW7MMDqsdw04C2kxV7X4TE/EqFjWHoJtEHNgBDc8kV2qcO/MxIMfqt+vpPRP/wCIzOKLI1kSb6qAC
	RcSPqyRWccTrqbmee0TtIj8vedoas17ns/Ew84IpEl5TKINZ3vZagZ6Kkx035yw8Gam/E8x7SqmCd
	AA3Y3N5hpZgtkdM5h3td15OuPLs7d8DlSIpMbXp1tn1UH863rs9pGpb1i1Hz7QhEn4PnZzXDYpO0Y
	wJg3ce1Jty5zfZaBOR1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJxWU-002lZD-8o; Tue, 15 Feb 2022 13:05:38 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJxWR-002lXq-Cj
 for linux-mediatek@lists.infradead.org; Tue, 15 Feb 2022 13:05:37 +0000
Received: by mail-io1-xd31.google.com with SMTP id w7so23707327ioj.5
 for <linux-mediatek@lists.infradead.org>; Tue, 15 Feb 2022 05:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PaZVevCVWnJLVjvrHlW/dnI5NADyeCbLBAp7MlyZJEs=;
 b=TDZSGSZDOR6tESGKMffWCPAQg0pmlp4Qd/GfZoTuMP4o9VEdBnDeiiE6GGqWBPQsgN
 qd+VnUyyPezL+pBRqSdBPDVYO2zc+Rl12fctv8JMQmtfQHTIFV1VisAraOidRtzcv7az
 h+RdY2hixZ3rguGFXADmEsNVOk97TpExpsPCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PaZVevCVWnJLVjvrHlW/dnI5NADyeCbLBAp7MlyZJEs=;
 b=4QNPeBeBb/9lNOjAgE/EtJNHz1kUuuNJu1+o8yXVYSiRcZJ3cy7KMbDm6zZgwPGzeq
 lYK2M4jz1pnALdIQ6QaIpdGA0FY18ZY6mbDCLKq5wQb8nGvjlPG3aoLfgkrOYm5YEhQo
 jxjVs0p3YrQNIkGZcN7f/oX4WNe0Xfvhu/exDaUiOr4Cly0M883qi+M4xduuPeoiQaXk
 eGT/FaEx9HfxKimrkA/8KpbKwG2GC2oi0E+ZM14ZFamAwzlM4iEmqCoJ4eG04mVZrGik
 RPQG5qMf51zZ66qUzZ87MvzdPzq5eSDt1lHB02+G5V0bupA/95qEAwlwz0qAKyzA/7e2
 cRDg==
X-Gm-Message-State: AOAM5310Xw1i3z59ZkoVoU33RfLGMN26KAOhKYBE19rqO40ddI9dGBuE
 eohcIz/WjpD9OJcRaf6McHa1/N3jr7Y4hfgUjlfXgg==
X-Google-Smtp-Source: ABdhPJxtJIM9RHnfQcz4LMCrnzRwoEV55yIyUKbwloRDyJHYmE4ariqr/kbm/w8QO90RNrUQBhZreEm0Z7T5jqeF5Iw=
X-Received: by 2002:a05:6638:3785:: with SMTP id
 w5mr2736567jal.210.1644930334003; 
 Tue, 15 Feb 2022 05:05:34 -0800 (PST)
MIME-Version: 1.0
References: <20220208084234.1684930-1-hsinyi@chromium.org>
 <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
In-Reply-To: <CACvgo53u01BK_D0ZssV+gCepjxSz23Nr5Dy1qXeaAoJuu6VCFQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 15 Feb 2022 21:05:08 +0800
Message-ID: <CAJMQK-gvhsk3U7QK9B-28kJ4fKbO8UB01i-_rMMe_GT2pM74gg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH v8 1/3] gpu: drm: separate panel orientation
 property creating and value setting
To: Emil Velikov <emil.l.velikov@gmail.com>
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, Simon Ser <contact@emersion.fr>, 
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, Rob Herring <robh+dt@kernel.org>, 
 linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 LAKML <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_050535_477127_0EBC4C0E 
X-CRM114-Status: GOOD (  28.50  )
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

On Tue, Feb 15, 2022 at 8:04 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
>
> Greetings everyone,
>
> Padron for joining in so late o/
>
> On Tue, 8 Feb 2022 at 08:42, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > drm_dev_register() sets connector->registration_state to
> > DRM_CONNECTOR_REGISTERED and dev->registered to true. If
> > drm_connector_set_panel_orientation() is first called after
> > drm_dev_register(), it will fail several checks and results in following
> > warning.
> >
> > Add a function to create panel orientation property and set default value
> > to UNKNOWN, so drivers can call this function to init the property earlier
> > , and let the panel set the real value later.
> >
>
> The warning illustrates a genuine race condition, where userspace will
> read the old/invalid property value/state. So this patch masks away
> the WARNING without addressing the actual issue.
> Instead can we fix the respective drivers, so that no properties are
> created after drm_dev_register()?
>
1. How about the proposal in previous version:
v7 https://patchwork.kernel.org/project/linux-mediatek/patch/20220208073714.1540390-1-hsinyi@chromium.org/
we separate property creation
(drm_connector_init_panel_orientation_property) and value setting
(drm_connector_set_panel_orientation). This is also similar to some of
other optional properties are created, eg. vrr_capable.

And drm drivers have to make sure that if they want to use this
property, they have to create it before drm_dev_register(). For
example, in the 2nd patch, mtk_drm sets the property before calling
drm_dev_register().

2. I'm not sure how to handle the case that if user space tries to
read the property before the proper value is set. Currently drm
creates this property and the panels[1] will set the correct value
parsed from DT. If userspace calls before the panel sets the correct
value, it will get unknown (similar to the illustration you mentioned
below). Do you think that the drm should be responsible for parsing
the value if the panel provides it? In this way it's guaranteed that
the value is set when the property is created.

[1] https://elixir.bootlin.com/linux/latest/A/ident/drm_connector_set_panel_orientation

> Longer version:
> As we look into drm_dev_register() it's in charge of creating the
> dev/sysfs nodes (et al). Note that connectors cannot disappear at
> runtime.
> For panel orientation, we are creating an immutable connector
> properly, meaning that as soon as drm_dev_register() is called we must
> ensure that the property is available (if applicable) and set to the
> correct value.
>
> For illustration, consider the following scenario:
>  - DRM modules are loaded late - are not built-in and not part of
> initrd (or there's no initrd)
>  - kernel boots
>  - plymouth/similar user-space component kicks in before the
> driver/module is loaded
>  - module gets loaded, drm_dev_register() kicks in populating /dev/dri/card0
>  - plymouth opens the dev node and reads DRM_MODE_PANEL_ORIENTATION_UNKNOWN
>  - module updates the orientation property
>
> Thanks
> Emil

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
