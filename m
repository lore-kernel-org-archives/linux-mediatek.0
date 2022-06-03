Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104ABC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 04:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCxbUoYmg4wNo4LrgalTkwl7jL+p/AKhapor/MK0/sc=; b=ulZtEWBick3Eqi
	zv9WqrQKv6eUMQXu0mzNwngB2/QonnZfJd+vX8e9hGSdQUkastDTGW6YrU07iBhNYaxcJr1DBdQ2z
	bjoyDISJlae4+GDMR+ObUROGFXJVcMx4DRYzv+GUcke7f+iR+/oXN5YWir3waJDQ+J06i10y+shmo
	Nq2N+BtUPZd3AVJ6lCj5eGfUXuMyjD5N4Fv7/rQBWvhMSLw3cOq1csijBc6c3WpyQFHmcTd/DRKSR
	C2EHFm6ThHMXaQcWn2v1upa3ASO3zIzZlfTvs99EGusSjEwX89E7hLMhiXhQunYNLL95Fhh9DIJCu
	L6QCwgRU1/EyXO9pzNrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwyVR-005ikA-At; Fri, 03 Jun 2022 04:01:49 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwyVF-005igu-Fx
	for linux-mediatek@lists.infradead.org; Fri, 03 Jun 2022 04:01:38 +0000
Received: by mail-ej1-x635.google.com with SMTP id fu3so12116055ejc.7
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jun 2022 21:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W8bVxKeCs+luEXxpnTLIbgpg19GNEZEh9tmWHWEe4S4=;
        b=fD7kHLPGCLB6BwqWqEUYpaRcFdRj6SfBXhNT8BN4I9zVIbzLaLp78HxuCGvWRZQMTi
         uyG/1hzIApR7fvPr0IySLfmaArCFTCp8JebyXa3+LDLDErePMizdjtRfFzLMYQpXcFiQ
         DZ2TCHIo3llis01Zupghoa06ycO+92zWx1r+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W8bVxKeCs+luEXxpnTLIbgpg19GNEZEh9tmWHWEe4S4=;
        b=2crX+A6jJt07Oh/lpxfEXZ8MKO2ehwCVQzGAnHDsWtc8nWVDKwBP1whvzGOMEKjNyP
         cBBpFqWYiTrZbK+guVaF9tiAwuWzXLTMPysuS/sMszEP/am02MQ2MqLcikJgexfj6/BN
         e7R+3Ign7k95uJ86ajROwnE4cokOL6bG/jJilkDdc5E2RkGGS4pNqdVXPRKNYrc/PG1R
         tMRcU2GDnCsZHNQ73sX1e6YPVFmxjvcL9h9spjsoFB91AZxsx1EYMxLjxRF+F1ViF8RG
         YG41A9kasmnABmBEa8tiSsYb1a3mnje4xO+vcJQ9tiocWhjrnTDHw8y8VBYKS1Gusjic
         k+MA==
X-Gm-Message-State: AOAM533LLL8766JzulDDxP2Q9hqpALEq6Lf5HvLNPEDsRpIzFxWGDXyC
	4i8YzEyvFz+1slJdoE3A+6AsH1SeH2Y67OctsYUrCQ==
X-Google-Smtp-Source: ABdhPJyw/i2NBojqg3RSMKZ6XZsX0ph8P35ta717/u7cXFNMwFYFBna4UYDnpqAg0IP9EfLOD4BvkdnYqa5fefRVriI=
X-Received: by 2002:a17:907:2ce2:b0:6ff:30e2:25c3 with SMTP id
 hz2-20020a1709072ce200b006ff30e225c3mr6928613ejc.494.1654228892918; Thu, 02
 Jun 2022 21:01:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220601094637.1200634-1-hsinyi@chromium.org> <20220601094637.1200634-4-hsinyi@chromium.org>
 <CAD=FV=XnA80P7BoaAX6JD9Q4ggnk4g4M3wmJFEDNij3+10aL4g@mail.gmail.com>
In-Reply-To: <CAD=FV=XnA80P7BoaAX6JD9Q4ggnk4g4M3wmJFEDNij3+10aL4g@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 3 Jun 2022 12:01:06 +0800
Message-ID: <CAJMQK-g7CdR8sgVssGGYPCaeGz3dKwqsWBnCRCdMvsh1Mtph6g@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] drm/panel: panel-edp: Implement .get_orientation callback
To: Doug Anderson <dianders@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Hans de Goede <hdegoede@redhat.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, dri-devel <dri-devel@lists.freedesktop.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, Rob Clark <robdclark@chromium.org>, 
	Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_210137_581636_A5F7C7BB 
X-CRM114-Status: GOOD (  28.04  )
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

On Fri, Jun 3, 2022 at 5:51 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Wed, Jun 1, 2022 at 2:46 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > To return the orientation property to drm/kms driver.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> >  drivers/gpu/drm/panel/panel-edp.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> > index 1732b4f56e38..a2133581a72d 100644
> > --- a/drivers/gpu/drm/panel/panel-edp.c
> > +++ b/drivers/gpu/drm/panel/panel-edp.c
> > @@ -609,6 +609,13 @@ static int panel_edp_get_timings(struct drm_panel *panel,
> >         return p->desc->num_timings;
> >  }
> >
> > +static enum drm_panel_orientation panel_edp_get_orientation(struct drm_panel *panel)
> > +{
> > +       struct panel_edp *p = to_panel_edp(panel);
> > +
> > +       return p->orientation;
> > +}
> > +
> >  static int detected_panel_show(struct seq_file *s, void *data)
> >  {
> >         struct drm_panel *panel = s->private;
> > @@ -637,6 +644,7 @@ static const struct drm_panel_funcs panel_edp_funcs = {
> >         .prepare = panel_edp_prepare,
> >         .enable = panel_edp_enable,
> >         .get_modes = panel_edp_get_modes,
> > +       .get_orientation = panel_edp_get_orientation,
> >         .get_timings = panel_edp_get_timings,
> >         .debugfs_init = panel_edp_debugfs_init,
> >  };
>
> I'm curious: should we be removing the old
> drm_connector_set_panel_orientation() from panel_edp_get_modes()?
> ...or maybe you want to keep it for now because you're only adding
> support to the mediatek driver and for other drivers the WARN_ON is
> better than no orientation support at all?

Right, for the drm/kms drivers that calls
drm_connector_set_panel_orientation(), the
drm_connector_set_panel_orientation() called in panels is no-op, but
others they still need this to be called in the panel.
>
> Maybe you could put a comment next to the old
> drm_connector_set_panel_orientation() saying that it's deprecated and
> that drm drivers are expected to add a call to get_orientation()? Then
> when people see the WARN_ON splat they'll quickly figure out how to
> fix it. ...and eventually we can probably remove all the old calls
> from get_modes() ?
Sure, sounds good to me. I will add this.

>
> -Doug

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
