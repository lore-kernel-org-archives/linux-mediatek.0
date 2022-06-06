Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B9BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 19:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8iHqq1nxT+1FK/TBsNwWFsqtP7wxLvT14TTbvaJsj4s=; b=YnRivwBMDJsMi7
	DgLR6KRCJnhnKSN4kFuCu8sdwtrSSa5kuoxuGkNk+uqgkqcbrPHvGF0BUh3p+xLAnlw/O8c39nvCG
	+SxYPKHwNNPdP8kiGAUIC6PYgvrhEMC67S+2cB6VEzkaVrjssZLIV0/29n6+s/iWJq96NDxE7AQxz
	f4uHkhdNRISzgXZ3wFTFenezUYs4d2QB/FL0ytcHj6C38kPar/pK+fjK/UgeKD0itv5axvuonYoe0
	v95ULS87G4z9dP4kQjynC0W8+Eu/oIDB8sA573hsJ0Jvhnsr8o9WXvWQeSl+YjsXDDLVaFBgQnh2J
	UitqynEESxUZesDZVDsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIDm-002QXw-Ll; Mon, 06 Jun 2022 19:17:02 +0000
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyIDc-002QVv-5J
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 19:16:53 +0000
Received: by mail-ot1-x335.google.com with SMTP id f9-20020a9d2c09000000b0060bf1fa91f4so4226299otb.2
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 12:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=0ISgbHiV4o5sZcHUC78zgYQXpXhaQoJ6UxzNGiryKJ8=;
        b=CBgVQb1ZbwpHj6ip0ODYxgb4cXYCkJ38H4sisthI4mJaz8l4VaspsrbKLeJJV/1SVk
         8Ymd6q9UwbXJTbOLlTFrJW6UjBC1pWbB+mvRBlN7GK2+7gJzpmci3HP3EljH9CVYa+TF
         OvYU5zEwK/vuBrZnhYaWtD2kEY6UNXXnhrjqA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=0ISgbHiV4o5sZcHUC78zgYQXpXhaQoJ6UxzNGiryKJ8=;
        b=4mjHbBeHsOdC6WhrIdO78I5mlDF+LjBtZet1aDcqewBa26amJshj1jYZadKLkv4N+y
         +PF+NBjyJuiiKq4uXjm3cQT6vlNuBtKVzYRdEKCAuLgPdEwsgkgbYBMnqWyND/9Si8Pn
         o7d0cpMwAPFUqRgLOdB/2veNinIg3g1GMUEXaqQfgaKQRplh+oYDY7kNk40QCUPKkqwT
         DDBZu3oi5xxVTgxIuo3BxcSQxo1isAQn0daGyJUE/xgpB+gv6LWmpzovCe8R+hCbjR2y
         B3f2iEALg5K58wo8fQGZGtb4IfhiQw6Go37bWOjQPztVVdICbxTgiOE20ccxVH8Tm4MM
         wgvg==
X-Gm-Message-State: AOAM531jE7yCrz88p/nVEcvgJ183wNcnLg1m0bD4Dp3Yk2dhdGf71NG3
	2YMt5gNr3e2kK42JtN4rYDK2sjyROKua1EhD2mgqIw==
X-Google-Smtp-Source: ABdhPJzrtp9rNjx/MRKwpP7DdfW0iFsQFuzWAL7ZNWmFj9UIEt2EemDZZ/o72GqwyMu+DAw6tK2o5XVWQKasAGXXwEI=
X-Received: by 2002:a05:6830:113:b0:60b:eb0b:4054 with SMTP id
 i19-20020a056830011300b0060beb0b4054mr5483588otp.159.1654543009163; Mon, 06
 Jun 2022 12:16:49 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 6 Jun 2022 12:16:48 -0700
MIME-Version: 1.0
In-Reply-To: <20220606152431.1889185-9-hsinyi@chromium.org>
References: <20220606152431.1889185-1-hsinyi@chromium.org> <20220606152431.1889185-9-hsinyi@chromium.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 6 Jun 2022 12:16:48 -0700
Message-ID: <CAE-0n51Lq381dQW6zw3D0fibdj=Jm4r3uAYG59ySo4CXbx+EpA@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] drm/mediatek: Config orientation property if panel
 provides it
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	Rob Clark <robdclark@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_121652_226784_514E8C72 
X-CRM114-Status: GOOD (  10.82  )
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

Quoting Hsin-Yi Wang (2022-06-06 08:24:31)
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index d9f10a33e6fa..c56282412bfa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -822,6 +823,12 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>                 ret = PTR_ERR(dsi->connector);
>                 goto err_cleanup_encoder;
>         }
> +
> +       /* Read panel orientation */
> +       if (dsi->panel)
> +               drm_connector_set_panel_orientation(dsi->connector,
> +                               drm_panel_get_orientation(dsi->panel));
> +

It could be simplified like so?

	drm_connector_set_orientation_from_panel(dsi->connector, dsi->panel);

Then the API could get the orientation if the panel pointer is valid.
Does any code need to use/modify the orientation value besides
drm_connector_set_panel_orientation()?

>         drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>
>         return 0;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
