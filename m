Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E278C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 08:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ypa5aZEbaNLw2PJGPxoX9wWArg3Zm83noIf5K/82GPk=; b=RQRGY0kDMxxqNP
	HlKQbW70gyzfa+jCDynbCuVZUjJANEhxRNzbVE3ArT/IgknOxhSaACGZ8Tgh9my2MjbheKaLbhmll
	/VzNWPvTaLH19Mnae/UrfukxdS2bdN71W7ZJgp6YyZJabsg8rKmoOenG89Pac7sWCHxiux7z/RGgA
	6djaCIbEJRQkfw9li78btSrEntwbm4/Tb1y4VyALXHj8DyonpBi+fDEAGhBSm6/M0iu545q92fOFA
	+d7UWZys0uU69uO72LrzCK61vlLD7PzMVeMl6/hMmtLExNxUP7qYWqxqdtcNQ+LdvHQNDunDIE1Fr
	EJRj16vTxUunfFGpRKzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwK4d-00ElXU-Sm; Wed, 01 Jun 2022 08:51:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwK4Q-00ElRo-PS
	for linux-mediatek@lists.infradead.org; Wed, 01 Jun 2022 08:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1654073472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HBHQYgVvAGQCOdoDn9ARukR15hBNns7Yswk58R28Ni4=;
	b=F0CRWtN4a+lPAkCP2rJd2g/Wg5IfLafjR3zaOjGAPs4YUJKe0LKZiLCLZ5NfcRbgZGWjvr
	CzuA7qfKHjvxLnuQ9I3/hrAG4GID/LUEMdaetHBKyEveJ4/bT42Xm7hIAWPeN5ry7UpPyJ
	lsrq14UMTaoRELDWHu/pCi4bcvkl4/M=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-232-UtBilE56M9eFYd5sLWF4NQ-1; Wed, 01 Jun 2022 04:51:08 -0400
X-MC-Unique: UtBilE56M9eFYd5sLWF4NQ-1
Received: by mail-ed1-f71.google.com with SMTP id en19-20020a056402529300b0042dcf51029cso765840edb.19
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Jun 2022 01:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=HBHQYgVvAGQCOdoDn9ARukR15hBNns7Yswk58R28Ni4=;
        b=VR1DUhJht0RNOgIVhkNZ9BB52tNRMs9xkxNUD1JA1uazjQ/YbExmOeoMNaUk5AeOnT
         6pLtvG0w9vkcS0pJd4YUkpf1Ru1qzNnnDdxTYmFxJ62M48lIdnjDwa2Ieu/5ZoNbVAni
         c3riGzfwQjF/lK2DS9kmfFXccIukYZnY0X5hVCgZf0eaIswgFbujj5lmkem6OE6CBNN6
         yYQbYFMecLXfZDwlDUucUHbDhFI4rYRPgbEkX/4oB+VhaHHjn+rQcACh0rt/3jD0vfNk
         aOr8VpprtT/HV8SW2k85n+BPNpOuo4wecrS9uhZ4pbESdg8q1k/+2AZuioEkcqm+cy52
         OrxQ==
X-Gm-Message-State: AOAM530JkxnWWkCCADCgn97BVEsXxOcO7TRlOWco5Qsy862IrcsuR/JA
	MJALC6SF4Oi8lMVlXKIErQlu4v3rf3zKFVRVKHR8ISq3rtpF1svgDOVldlYXB8Vu3OzbnsNuDuu
	SoSi2Riz2ksXP1QakbeMbXb/SuBnHaUGV
X-Received: by 2002:a17:907:8a19:b0:6fe:e146:d107 with SMTP id sc25-20020a1709078a1900b006fee146d107mr41841298ejc.763.1654073467612;
        Wed, 01 Jun 2022 01:51:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxz8yVDyEKGplWHg06AJJJSo0c8yw6I0zgv0YRyM+Fjpk6u4VdWfLi5qC40pTYsTW3vPqqmA==
X-Received: by 2002:a17:907:8a19:b0:6fe:e146:d107 with SMTP id sc25-20020a1709078a1900b006fee146d107mr41841278ejc.763.1654073467428;
        Wed, 01 Jun 2022 01:51:07 -0700 (PDT)
Received: from [192.168.43.127] ([109.36.130.134])
        by smtp.gmail.com with ESMTPSA id 12-20020a170906058c00b006fed787478asm444046ejn.92.2022.06.01.01.51.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jun 2022 01:51:06 -0700 (PDT)
Message-ID: <6072f500-30fd-c0a4-29dc-4fde7072018a@redhat.com>
Date: Wed, 1 Jun 2022 10:51:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 0/8] Add a panel API to return panel orientation
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Rob Clark <robdclark@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220601081823.1038797-1-hsinyi@chromium.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220601081823.1038797-1-hsinyi@chromium.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_015114_917720_BC7BA4F7 
X-CRM114-Status: GOOD (  16.25  )
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

On 6/1/22 10:18, Hsin-Yi Wang wrote:
> Panels usually call drm_connector_set_panel_orientation(), which is
> later than drm/kms driver calling drm_dev_register(). This leads to a
> WARN()[1].
> 
> The orientation property is known earlier. For example, some panels
> parse the property through device tree during probe.
> 
> The series add a panel API drm_panel_get_orientation() for drm/kms
> drivers. The drivers can use the API to get panel's orientation, so they
> can call drm_connector_set_panel_orientation() before drm_dev_register().
> 
> Panel needs to implement .get_orientation callback to return the property.
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/

Thank you for implementing this.

Patches 1-7 look good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I've a few small remarks on patch 8, see my reply
to that patch.

Regards,

Hans


> 
> Hsin-Yi Wang (8):
>   drm/panel: Add an API drm_panel_get_orientation() to return panel
>     orientation
>   drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
>   drm/panel: panel-edp: Implement .get_orientation callback
>   drm/panel: lvds: Implement .get_orientation callback
>   drm/panel: panel-simple: Implement .get_orientation callback
>   drm/panel: ili9881c: Implement .get_orientation callback
>   drm/panel: elida-kd35t133: Implement .get_orientation callback
>   drm/mediatek: Config orientation property if panel provides it
> 
>  drivers/gpu/drm/drm_panel.c                    |  8 ++++++++
>  drivers/gpu/drm/mediatek/mtk_dsi.c             | 14 ++++++++++++++
>  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  8 ++++++++
>  drivers/gpu/drm/panel/panel-edp.c              |  8 ++++++++
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c   |  8 ++++++++
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  |  8 ++++++++
>  drivers/gpu/drm/panel/panel-lvds.c             |  8 ++++++++
>  drivers/gpu/drm/panel/panel-simple.c           |  9 +++++++++
>  include/drm/drm_panel.h                        | 10 ++++++++++
>  9 files changed, 81 insertions(+)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
