Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A03C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 08:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbAfeMdHO557pQYrwYPKuBixlf9n8FSXDXBL0kAK7oI=; b=KEq5C7CeJo/dsZ
	/+Nwam8PA8i4fwxHiSck0kqlEGncj4c62UAnljODHQuKQteqkrSWM1JttD1Z20cj0WsSA+YzX4AO4
	0UuFhPwokisW54FUogh3+j9j/sLb2xOBduGxuKw29ih8PF11p4XllG3EJQ+ALbfOAl2Qj59qWEWM/
	QWZXzbFSbSWazmZ0ZJGxAbj4dbiHscihb3CuwDJzQW+q9iFycZGUE+FTcznLsRo/AgC+2Z/WdmkmJ
	tyIRvGaud2XvnhOFifxF7Ky2JKGea6ANIXEXE4h7x0k4jiBP7wfsRuD9wouMZMf3iC1go0ho1BL1E
	YiBFuG30R8b5ByaMkvVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwfs7-0029Q4-Ki; Thu, 02 Jun 2022 08:07:59 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwfrt-0029J5-F9
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 08:07:47 +0000
Received: by mail-ed1-x533.google.com with SMTP id o10so5245629edi.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jun 2022 01:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6vMm0s7j0BfbtfCeMoENN6g/p67B/T0t3t4wSxuqZsM=;
        b=DI8Qpx5MUleXyJ2zO6eq3/ipbnYwVyicYJxvtCHB4bW/NNet9TE+jNgXo7Te/Aq2I2
         c22ngnKAO/z05MJNo7ip81+yZNAoAljWGXdJ/0HnFmQKM8d79/N/jHiXev8FO/bOcD2s
         I+T6C2nlL6+p975fZBs+A8JYFVY5lgarzQQr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6vMm0s7j0BfbtfCeMoENN6g/p67B/T0t3t4wSxuqZsM=;
        b=34KHhmBD251FpURhjzoj9wuZ5ERT5PD6R3nYF4vwY7OiaHYm1+vE8BUMCHjKAosKlN
         Z+kKJ3R24JsC/ClAmgXnwJGTFUbXtD4BTZV13nQEdgN4766Jc+DHrizQ01+q7YkmR912
         1cDEmAgwxnBmSLav3K9TzoJwxZrsK2Q221L3v6E6O/DU1l6DGbr57eoZqY+Fk6pbW+32
         jI8S2lskAdgw9Tp47H+qqvwZyhWMUImJ/upIEG2VcgYy7CqxLGTVO9wmGKIma1o1nxGn
         GuH5Phu0Bdx38wAm/vsYDg4zx4meJs92SjPr6rXXXFBtshKfv2TRs5eA59bZis+tRoMb
         EMmw==
X-Gm-Message-State: AOAM530/3awudVsiYztEddlVVUodMt8lMOqB5ktVC1nJLfVoB30q8LdO
	ujoG15UTgQq2Edpc0rkM9oBJlW7b9htIGwfGXx9x2Q==
X-Google-Smtp-Source: ABdhPJwYzmq6Zn5Gn969SIbPrVPQEWs30Q+k4IKGlmSfcZd8DLQuZbom06x50wb0uWfPTopTH5Z9bOVJGvu44uXetIM=
X-Received: by 2002:a05:6402:1d50:b0:42b:6da9:ed34 with SMTP id
 dz16-20020a0564021d5000b0042b6da9ed34mr3934330edb.333.1654157260875; Thu, 02
 Jun 2022 01:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220601094637.1200634-1-hsinyi@chromium.org> <044158674aab0b40d8edcac920855a37fca58cf0.camel@mediatek.com>
In-Reply-To: <044158674aab0b40d8edcac920855a37fca58cf0.camel@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 2 Jun 2022 16:07:14 +0800
Message-ID: <CAJMQK-gyJbNBgot3NqSQP5xEb5LtFrk5A9mPQOcntEvxncsmRg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Add a panel API to return panel orientation
To: CK Hu <ck.hu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Clark <robdclark@chromium.org>, 
	Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org, 
	Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
	Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220602_010745_570803_F90DE27D 
X-CRM114-Status: GOOD (  21.82  )
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

On Thu, Jun 2, 2022 at 4:03 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Hsin-Yi:
>
> I'm curious that panel driver setting orientation in get_modes() would
> work or not. It it works, why not just set orientation in get_modes()?
> I find that exynos dsi driver has implement the get_modes() [1] but
> Mediatek dsi does not implement. Would you try this?

It's explained in the cover letter:
```
Panels usually call drm_connector_set_panel_orientation(), which is
later than drm/kms driver calling drm_dev_register(). This leads to a
WARN()[1].
```
If the get_modes() in dsi is still being called later than bind(),
then the same issue still appears.
The purpose is to set the property before drm_dev_register().



>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/exynos/exynos_drm_dsi.c?h=v5.18#n1483
>
> Regards,
> CK
>
> On Wed, 2022-06-01 at 17:46 +0800, Hsin-Yi Wang wrote:
> > Panels usually call drm_connector_set_panel_orientation(), which is
> > later than drm/kms driver calling drm_dev_register(). This leads to a
> > WARN()[1].
> >
> > The orientation property is known earlier. For example, some panels
> > parse the property through device tree during probe.
> >
> > The series add a panel API drm_panel_get_orientation() for drm/kms
> > drivers. The drivers can use the API to get panel's orientation, so
> > they
> > can call drm_connector_set_panel_orientation() before
> > drm_dev_register().
> >
> > Panel needs to implement .get_orientation callback to return the
> > property.
> >
> > [1]
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/__;!!CTRNKA9wMg0ARbw!0ytf4wPxKANnYbw_fgq-eqQARnAXIHv4jwu04ZW6X6dAxZDFsJ0CltY_PvCBAQ$
> >
> >
> > Hsin-Yi Wang (8):
> >   drm/panel: Add an API drm_panel_get_orientation() to return panel
> >     orientation
> >   drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
> >   drm/panel: panel-edp: Implement .get_orientation callback
> >   drm/panel: lvds: Implement .get_orientation callback
> >   drm/panel: panel-simple: Implement .get_orientation callback
> >   drm/panel: ili9881c: Implement .get_orientation callback
> >   drm/panel: elida-kd35t133: Implement .get_orientation callback
> >   drm/mediatek: Config orientation property if panel provides it
> >
> >  drivers/gpu/drm/drm_panel.c                    |  8 ++++++++
> >  drivers/gpu/drm/mediatek/mtk_dsi.c             | 10 ++++++++++
> >  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  8 ++++++++
> >  drivers/gpu/drm/panel/panel-edp.c              |  8 ++++++++
> >  drivers/gpu/drm/panel/panel-elida-kd35t133.c   |  8 ++++++++
> >  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  |  8 ++++++++
> >  drivers/gpu/drm/panel/panel-lvds.c             |  8 ++++++++
> >  drivers/gpu/drm/panel/panel-simple.c           |  9 +++++++++
> >  include/drm/drm_panel.h                        | 10 ++++++++++
> >  9 files changed, 77 insertions(+)
> >
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
