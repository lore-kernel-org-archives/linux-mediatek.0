Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4766BC43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 03:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRH0Z2gHk+lFkcPjK0if++oCXdGJoCwdBEQVCpEb5hA=; b=Nhxw+gqx0m7HO9
	aHm6g8a9D/PrRY0pVdxTzxEk6bJgR0oUZ4vBnXUct8YrHgGaCXkG6Do9O/BPPUVDe/fiShgkRv4VY
	rMeIZSfNUUI0cM95qGzh0VSTkC9vfF3ONxF0g059r8McbPO7IXPaVmqI40SGAFv1fxvRUB+InbNSn
	hRxeUGPPK5agnXb6Ov58/dgUNRlxB8ycA69r6ULE4ZX5a62d7Htq/PJXTTkP5DRSIErQW0f+eYLO/
	eDIFwIJ60WAwN/oGzyRnHrlFDjwbJpRFhkO+9tQAGaD1FDVtTr5GaaTqvs1N9zIBBDeTBEA9dwLSC
	Dbx54vd8SBO3/+Wfpzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyQ3H-004V4N-OW; Tue, 07 Jun 2022 03:38:43 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyQ36-004V29-US
	for linux-mediatek@lists.infradead.org; Tue, 07 Jun 2022 03:38:34 +0000
Received: by mail-ej1-x632.google.com with SMTP id m20so32520696ejj.10
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 20:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lJ9t0JsMzf9+b8G+NsrCGuGZ2WHm7yJdraWRSfiKGkA=;
        b=luqlEGHcZ3EsuUaCVY6GMNpFf/WWxyuViWZVeRqUEErf9I9VtVM1lds0X9kadOzOJN
         cszTD9YoVUoRI7Y7blXJ11oo9McRcIKLzrEKA7N554p76iZLgY8Rd3ITfDBweQcSXSEp
         ZvIHkSGHIxEHuVqKNxRubd5d5H8shRx58lWHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lJ9t0JsMzf9+b8G+NsrCGuGZ2WHm7yJdraWRSfiKGkA=;
        b=TXvjfosqJcL3IBmlLb2w+XjBN127rRvMAe5qEmLO0V8oEZoRlvLHHxmbAEiCmtv0q4
         m1NItM06HOs609U+br4fuW3GjRVmeRvt+t9yoq2lE7Y+eewFbevw+eH/aXvqpOjI9B8E
         lw9yB53Dck8l6zxntT81XJk2JdSsbSPxW9f8QRjClnSsXfooYjLRUMVgPLx4/h3wLBFW
         nnV8PLRRt1ayZdecp7i9zup+p03mEd7XYVeIlzHdTJVpMQZ19xQyXg962RyCou51L6Pm
         lPBQ4MKsK5nXlxoR/fwiUZFBSURe+3PeyGPYoTdpkZvap4HohJ1H6zUS0mk5vNY+naL0
         BsDw==
X-Gm-Message-State: AOAM533pYJD5yY4GPprs3oQhXSqcT44xsqgrWogs85VDvHsDwPLGaX3S
	/Nhe63j1rCYznl5H40ha8TzloVu3Tp/qkU8RQ4t20w==
X-Google-Smtp-Source: ABdhPJxvmyTN4ySZ5rqR9pOFJ1zEcnVcYm+SktOdEe+JR5rDOKDREJpcaAfPg15x/AOi9cNPiXshMUiWFFvhktMChtw=
X-Received: by 2002:a17:907:868f:b0:702:f865:55de with SMTP id
 qa15-20020a170907868f00b00702f86555demr24650686ejc.24.1654573109183; Mon, 06
 Jun 2022 20:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220606152431.1889185-1-hsinyi@chromium.org> <20220606152431.1889185-9-hsinyi@chromium.org>
 <CAE-0n51Lq381dQW6zw3D0fibdj=Jm4r3uAYG59ySo4CXbx+EpA@mail.gmail.com>
In-Reply-To: <CAE-0n51Lq381dQW6zw3D0fibdj=Jm4r3uAYG59ySo4CXbx+EpA@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 7 Jun 2022 11:46:24 +0800
Message-ID: <CAJMQK-hoKB+W4AY8trW-ni145oxde4ot1_z+d6sbxGrbQ6aMig@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] drm/mediatek: Config orientation property if panel
 provides it
To: Stephen Boyd <swboyd@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, Rob Clark <robdclark@chromium.org>, 
	Douglas Anderson <dianders@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_203833_054152_62FAA5A1 
X-CRM114-Status: GOOD (  18.48  )
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

On Tue, Jun 7, 2022 at 3:16 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Hsin-Yi Wang (2022-06-06 08:24:31)
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index d9f10a33e6fa..c56282412bfa 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -822,6 +823,12 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
> >                 ret = PTR_ERR(dsi->connector);
> >                 goto err_cleanup_encoder;
> >         }
> > +
> > +       /* Read panel orientation */
> > +       if (dsi->panel)
> > +               drm_connector_set_panel_orientation(dsi->connector,
> > +                               drm_panel_get_orientation(dsi->panel));
> > +
>
> It could be simplified like so?
>
>         drm_connector_set_orientation_from_panel(dsi->connector, dsi->panel);
>
> Then the API could get the orientation if the panel pointer is valid.
> Does any code need to use/modify the orientation value besides
> drm_connector_set_panel_orientation()?
>

We can add another function to call
drm_connector_set_orientation_from_panel(), which will be like

void drm_connector_set_orientation_from_panel(connector, panel)
{
     if (panel)
          drm_connector_set_panel_orientation(connector,drm_panel_get_orientation(panel));
}

Though it's very should but I can add this if this can make the caller
more convenient.

> >         drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> >
> >         return 0;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
