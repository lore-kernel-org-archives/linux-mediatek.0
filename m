Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A00BC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 16:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9iCtw35jqsHFfEwm9ZZi17aybFR2nP+16dQgMSIXDC8=; b=k+lK9fom/FoVhZ
	I4UWqck9QzcEBQ/ka5tBQS9h/8P6g0FRyZQ0AYjqL1GzUN+gz8GhToRX1MEhCYqvRpqDq85utDvpn
	4G57dnmVdEK3wMZdD1oJRcspO7O7qgc7Y8ERANrPOyMy/ACqMSYT5Y4A2pTfQx9b+pjCwnZGYilI/
	Do/y6gcqZVGiVoNyljTXPayBkOTcwo4uCCqW8z86dWjvdFxr/veHp/E07WDMq+UXVKdOR/OC+NFrw
	ftJMEePVZ7IlvHQ/H9JFoLlevCzVBffO/xx4F3y958IFUyisz2d68tZhJ4EKnzfIUQB5Tp019QpgV
	qEWs84AAJSXD4Zh+Lt3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyFDK-001x2o-UI; Mon, 06 Jun 2022 16:04:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyFDK-001wd2-9Z
	for linux-mediatek@bombadil.infradead.org; Mon, 06 Jun 2022 16:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jyxL+BH8EJsxCMAAiGGCnlS8DDdn5hMkob0TGGobKOQ=; b=lYOY12cNbhDL5KnDpwGuJdESBC
	O7FrMMbx2apVRGjxIhu8f2bS+HL2/Zofhmhm80/pFFR8CzgsUzk7LkYeGmQZaSv19iL1z4m9JYpxr
	kCkYSXQ8LF1lzlHZmsHMmLvMo9OoHbMG3PJaN22Rah4OzdgNSC6uG4gdCK8EFjdyIHAn5U/TRzx2S
	R0VhFvX5qvJWBizm8G4I9HhE7Em5YTM4K+f2PaIk/LuMBredISMVe0nxgVa1oXIXWaSMsFl86sB8c
	/ThoyCMdovHZu2lAdplUqpQdOkM8bJyopxvPT6o8oMgv/ntZlk4A7HsS1R9aMrSRD03fovL7wPgOV
	zbkhYROg==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyEcJ-005Tvr-9S
	for linux-mediatek@lists.infradead.org; Mon, 06 Jun 2022 15:26:12 +0000
Received: by mail-ed1-x534.google.com with SMTP id er5so19290201edb.12
        for <linux-mediatek@lists.infradead.org>; Mon, 06 Jun 2022 08:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jyxL+BH8EJsxCMAAiGGCnlS8DDdn5hMkob0TGGobKOQ=;
        b=MuDldpm1cvqxr24yvJdNMyzrGSjeMSKf+Bab5l69mqs7HvGPDxQ8Q1fe4WoY0H+G5r
         l9Bm1R3E5SCPxyYhhjozppQo48CSVDtR6gCNdS9FHy3q0sm0D6jQAvjcaS3bpbJGbp/P
         r1P/JbiX/z/W9OLBkbGU6jO4HkqX8KRdb+wms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jyxL+BH8EJsxCMAAiGGCnlS8DDdn5hMkob0TGGobKOQ=;
        b=y55rtNV8Gqyf0RBnlC+aF8xD3bKMNcYwD0ToxiXYeQ12UtsEVGCKdWQjDj2ntWbBBQ
         /MF4bxz2L2YvUAMquKPCMl/lLJb1IQvD9e2rpBPC0hwv5IS9Q+Bizyu5K8YBbKaAZSzT
         FBJphaljWF37V3ZXWQGoVXE8dw3CZuaqbgeAxR/ZePWZ9puAFYf7LICLWZ0H8AP0qjCP
         Fu9XVCO6xK2DWFGGVHgqM++hQupaQPRVOd4+9i02KR2+/n8BbfpXfNhWwfOVpHkL7hxt
         8S67zie5kHfzd/R9ucSnmkjYkdL5SEj9EcxpoktM9a0txeiHehvX/Oo4I6waL/s0Tjln
         wW4g==
X-Gm-Message-State: AOAM532urX1Urr+W9/Ao8iOE0IfCRtqBKN3LzTSDTZSIZbTgSaMKy/0k
	Bf+EOpvPIp1wD4/HlbYJRYw+7aH3u3ojVz2grT3yAw==
X-Google-Smtp-Source: ABdhPJxhQN3Xu1w0I4dYqU9lpzE49XRnQMcVNRaxVrPyusT/cmzzOtLDPj++i33HivGz/uQU6S5aCoH0N0W9ykdflaU=
X-Received: by 2002:a05:6402:84a:b0:423:fe99:8c53 with SMTP id
 b10-20020a056402084a00b00423fe998c53mr27231732edz.195.1654529164971; Mon, 06
 Jun 2022 08:26:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org> <20220606044720.945964-5-hsinyi@chromium.org>
 <CAD=FV=XQbXK13M_X_AsqSPS+D_zQqLtAGFGz=YbHoPu3bcvhZQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XQbXK13M_X_AsqSPS+D_zQqLtAGFGz=YbHoPu3bcvhZQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 6 Jun 2022 23:25:39 +0800
Message-ID: <CAJMQK-gWsMp24O2doGJtvgNCWQvjsx-6N5S9dx+PdTO1_H7Yyw@mail.gmail.com>
Subject: Re: [PATCH v3 4/8] drm/panel: lvds: Implement .get_orientation callback
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
X-CRM114-CacheID: sfid-20220606_162607_922212_D7523EEC 
X-CRM114-Status: GOOD (  17.83  )
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

On Mon, Jun 6, 2022 at 10:27 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sun, Jun 5, 2022 at 9:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > To return the orientation property to drm/kms driver.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> > v2->v3: add comments for notice.
> > ---
> >  drivers/gpu/drm/panel/panel-lvds.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/panel/panel-lvds.c b/drivers/gpu/drm/panel/panel-lvds.c
> > index 27a1c9923b09..239527409b00 100644
> > --- a/drivers/gpu/drm/panel/panel-lvds.c
> > +++ b/drivers/gpu/drm/panel/panel-lvds.c
> > @@ -102,15 +102,29 @@ static int panel_lvds_get_modes(struct drm_panel *panel,
> >         connector->display_info.bus_flags = lvds->data_mirror
> >                                           ? DRM_BUS_FLAG_DATA_LSB_TO_MSB
> >                                           : DRM_BUS_FLAG_DATA_MSB_TO_LSB;
>
> Can you rebase your patch and send again? There's a context conflict
> with the above line because your tree is lacking commit 83c784e70036
> ("drm/panel: lvds: Use bus_flags from DT panel-timing property")
>
Rebased in v4.

> In any case:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
