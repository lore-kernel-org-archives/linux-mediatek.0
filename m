Return-Path: <SRS0=ob7z=MH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71B84C1B08C
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 11:10:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C715613BA
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Jul 2021 11:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C715613BA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqmGIcpnM6LWx9Mp8iyNNUC6629BARLPzElHApPEaGY=; b=vMTAtTfq996ffe
	gbaX19sOZ00vdDcdoGic18srdPit3ypByZ3+Mx7kvtaGj7WNQHfdweQ376BCjbF3M/pWK42MWuk3p
	jRR364cs8TziqhKFprNv02DH2R6BgaoYcHfzdcaRqruXyKB4SgBy7qcDvYv408sIAILSHUkP65mS0
	R2lM/uJrhzFGqDLd5czfaSBzKp9xTEuUl0z8Poc/CmVNnDKvetnf+WmYdqwxgWWQGu6k0Mx7rLgrg
	LX784cu9CeO2V1tHoWGHTyxT/wcfkOREBokr2rBvrYOLKU1jAGgmdw7KTKfTH93FNDXO24S5GzpLT
	H1cEroP1aECU9xCmY2kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3zFe-000YE8-Bb; Thu, 15 Jul 2021 11:09:58 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3zFb-000YCr-Rc; Thu, 15 Jul 2021 11:09:57 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso5710825otu.10; 
 Thu, 15 Jul 2021 04:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VnIvSXzuiLKWuvgulqfarspmLG2dOzwb7htWyTzwsjw=;
 b=jZSvmaYSy8ADTgcCb9b7ny+VGlsNNLLNOYJdU7McebyVX4mq0pGAcstpYcMq1Aiv6S
 XOo3xy1FWet7MXd7e7bhh9ULV6oDNaPZwU83/HY/YN+avkBCc7WRn8rrw01zsWV94kqD
 zveDrhVhYXZNw9+xQg2SBfo7OMbtziipz+BPTRr2nVTwTX5Zbj3LNmo5gqPZla4YgjUr
 CMVnzDdH9YVyJCAxYWCz6i0n7jvRINXJv0bLBQO52VA4L5QduTy2cR8drOamqk/LOftw
 kysUkWgyiG6dY9FlEfnonTf57JurQjQ+0MQUH4y/eduUeozIhN6rWYTFT2mAUx+bFtCa
 eVcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VnIvSXzuiLKWuvgulqfarspmLG2dOzwb7htWyTzwsjw=;
 b=kHlHX3ACwmNC+D5ME9X7J7cL4X7bOc0NxU1zx7am/rAXYGexApcPBBhV+iSxhuEvKh
 zHylzLh4UadUOcJlPTxMCnzhBEmL8lszaxirHoPH4iAm3wf72/auGjD3bPIvPQo4s62R
 Kxn7oAWM+aVUTZhSN+yiqa1ySB1Ql8Ao5tONZj/lLoX7ndk8E38iSUB4Y35KocvqDEDm
 7umygQHP33gq5rNsPLzm9orjd8BWkEccja4/A0hRycKU46LAT1kMVCxfjad3s4uqynXT
 X1UiimYDJw+eFJ4PcpaKYFPi9KxB9iI8K66SJHZuUXhTtTVQ/kLibaIvU+KmO1QaLVq3
 2NKw==
X-Gm-Message-State: AOAM5328tAB1TbBIr5wWqr4+nxke/0uwWFNrgBIB0TG9jXqZSX6J9c8b
 9CL4+eLSm6ZisaIadq9zc8ssOUBcVgL7a0PQ2Fo=
X-Google-Smtp-Source: ABdhPJyE6O2CsuPYvTE0fEvIRod8YkMOcqSCGJb0RhRrpq/XyumDEFhAFhjuy8zGn19Bma0gQJuRs9BuxAPgAU8c3Mw=
X-Received: by 2002:a05:6830:19cd:: with SMTP id
 p13mr2307456otp.362.1626347395013; 
 Thu, 15 Jul 2021 04:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210624105517.3886963-1-hsinyi@chromium.org>
 <20210624105517.3886963-2-hsinyi@chromium.org>
In-Reply-To: <20210624105517.3886963-2-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 15 Jul 2021 13:09:43 +0200
Message-ID: <CAFqH_51zDMC6N-1DBiSfARTM-SG0SH9VAXOX=G1W6yHJaVBL3A@mail.gmail.com>
Subject: Re: [PATCH v6 RESEND 2/3] drm/mediatek: init panel orientation
 property
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org, 
 devicetree <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Sean Paul <sean@poorly.run>, Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_040955_954220_5415C598 
X-CRM114-Status: GOOD (  19.20  )
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

Hi Hsin-Yi,

Thank you for your patch.

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dj., 24 de juny
2021 a les 12:55:
>
> Init panel orientation property after connector is initialized. Let the
> panel driver decides the orientation value later.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

As together with the other two patches works and I don't see any
problem on the Lenovo IdeaPad Duet, and the panel has the proper
orientation


> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index ae403c67cbd92..9da1fd6491319 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -964,6 +964,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>                 ret = PTR_ERR(dsi->connector);
>                 goto err_cleanup_encoder;
>         }
> +
> +       ret = drm_connector_init_panel_orientation_property(dsi->connector);
> +       if (ret) {
> +               DRM_ERROR("Unable to init panel orientation\n");
> +               goto err_cleanup_encoder;
> +       }
> +
>         drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>
>         return 0;
> --
> 2.32.0.288.g62a8d224e6-goog
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
