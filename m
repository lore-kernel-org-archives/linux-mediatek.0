Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A02C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 08:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oTqDew4xec8Z68JtCZmitey6eYZqe8HnZ41A+r/eLf4=; b=FnjWUrv72Qoskh
	pvwXc9KfnUjmT38HergG3PWLgQwVzmRfw5c+ePbJisQYml4UyODi/YR0pxa33Axb2+elLEb6u7kLK
	l5lwGRHDsKQcUH6W+dr7zeXoM3OsCh5J8jhQprG9vt16YxZc0DUcab/5n7d+sf9ca6A4PHKMImV5x
	rdr69BlK9525BKksNsNOUNTJsP5UjJV139iar3xU1F1venYig6TZA4atduj4fgiSK/xhfeQVehZPw
	OkJfw1olMIZr/A+z6UuTHRmIT76+GQ8BWoOTuKtkDYsLorgXtBMM1y+bf/hGi3+4gXJX5Cn03z6Vu
	BwAO+C7NYPxAgmYshiig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvb9Z-00612A-Hd; Mon, 30 May 2022 08:53:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvb9Q-0060yY-Bs
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 08:53:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1653900798;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RhvgJCFXfv5RG+0oVTAct7gmCCzDguggkQSBJ+VAo/A=;
	b=DIf4hkIPDoc76M9wFf/ZVGXp+/1cgRjuUTHYY1DGmkSjBLojRtz+fxkAqO61otVdxcmfWz
	dXZtQb9K0xzW8nvRRzpdp2pbcIVZThfM+MGGYpKio/g8QB4cyeueJVlwHmGVi2doO/5S2J
	nXRrqSWpDT9Ggs4fwLH5AV+76TBdCMw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-6veFJ4H_NFmGXisdAM7UAQ-1; Mon, 30 May 2022 04:53:14 -0400
X-MC-Unique: 6veFJ4H_NFmGXisdAM7UAQ-1
Received: by mail-ed1-f71.google.com with SMTP id i26-20020a0564020f1a00b0042db93d0a7fso3890780eda.21
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 01:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=RhvgJCFXfv5RG+0oVTAct7gmCCzDguggkQSBJ+VAo/A=;
        b=Q2IKpsqlb8x8f1RO5ZB1lZmhah7KD6/7YSRzM0Tg1jCZksHYsIKPDSglIZCL0yitOy
         7QpeHmFlgvemqBIbP2+qAL3+BSO/zljYKVvA68a6PuyhthnAGq6rPapDNSu/lGgmBHsd
         a1KDkfFFSM3uULNu6gypOFTVJdqDZEGU3e0mBMt+JKtKNm/Jn4WBn8fIproj80tSDkHp
         jVBwSFBphC26N9lC0+2eZzQ3TnFMQZdk+rvzxS3h0bVCHgI3T+cjWkMm6+OKuWog1Ib2
         5M2mykOahiY+aoVeTQ2dMai9g50B2aak6sWgHTF+fxshhdo2SBv5bIu5ti2gKzLgH0u8
         SCaA==
X-Gm-Message-State: AOAM533dKk+gzzJyrVGqg7lvgb9WnM9HkrbqQ8gmh81Mb0o/9QWr3Ycc
	yB6IjxsDN/OjudgTugrj8EOOQeMTzCBTgEcnaZPEbZJQBjMFQO/1kqnwbuCTXesyTo6znhl/ZrL
	jdA7u88gtVGJ0e28gMv+CZtOFBbmsATXS
X-Received: by 2002:a17:907:6e20:b0:6ff:1541:8d34 with SMTP id sd32-20020a1709076e2000b006ff15418d34mr20498827ejc.447.1653900793121;
        Mon, 30 May 2022 01:53:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLS9X1+J2YlCZd50xUKza5F2TAaKjqsoBWgZZta9P6P5hLJgXAWFm13+BAHE9yuTPrdLSHXw==
X-Received: by 2002:a17:907:6e20:b0:6ff:1541:8d34 with SMTP id sd32-20020a1709076e2000b006ff15418d34mr20498786ejc.447.1653900792873;
        Mon, 30 May 2022 01:53:12 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id v16-20020a1709062f1000b006fea2705d18sm3807438eji.210.2022.05.30.01.53.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 May 2022 01:53:12 -0700 (PDT)
Message-ID: <a8d1fe13-e747-016a-2d45-bfb50f23f2d9@redhat.com>
Date: Mon, 30 May 2022 10:53:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v10 0/4] Separate panel orientation property creating and
 value setting
To: Hsin-Yi Wang <hsinyi@chromium.org>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Simon Ser <contact@emersion.fr>, Harry Wentland <harry.wentland@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20220530081910.3947168-1-hsinyi@chromium.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220530081910.3947168-1-hsinyi@chromium.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_015324_512203_743B6F4C 
X-CRM114-Status: GOOD (  18.44  )
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

Hi,

On 5/30/22 10:19, Hsin-Yi Wang wrote:
> Some drivers, eg. mtk_drm and msm_drm, rely on the panel to set the
> orientation. Panel calls drm_connector_set_panel_orientation() to create
> orientation property and sets the value. However, connector properties
> can't be created after drm_dev_register() is called. The goal is to
> separate the orientation property creation, so drm drivers can create it
> earlier before drm_dev_register().

Sorry for jumping in pretty late in the discussion (based on the v10
I seem to have missed this before).

This sounds to me like the real issue here is that drm_dev_register()
is getting called too early?

To me it seems sensible to delay calling drm_dev_register() and
thus allowing userspace to start detecting available displays +
features until after the panel has been probed.

I see a devicetree patch in this series, so I guess that the panel
is described in devicetree. Especially in the case of devicetree
I would expect the kernel to have enough info to do the right
thing and make sure the panel is probed before calling
drm_dev_register() ?

Regards,

Hans




> 
> After this series, drm_connector_set_panel_orientation() works like
> before. It won't affect existing callers of
> drm_connector_set_panel_orientation(). The only difference is that
> some drm drivers can call drm_connector_init_panel_orientation_property()
> earlier.
> 
> Hsin-Yi Wang (4):
>   gpu: drm: separate panel orientation property creating and value
>     setting
>   drm/mediatek: init panel orientation property
>   drm/msm: init panel orientation property
>   arm64: dts: mt8183: Add panel rotation
> 
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  1 +
>  drivers/gpu/drm/drm_connector.c               | 58 ++++++++++++++-----
>  drivers/gpu/drm/mediatek/mtk_dsi.c            |  7 +++
>  drivers/gpu/drm/msm/dsi/dsi_manager.c         |  4 ++
>  include/drm/drm_connector.h                   |  2 +
>  5 files changed, 59 insertions(+), 13 deletions(-)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
