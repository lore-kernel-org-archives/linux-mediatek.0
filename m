Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C42CD4F4C
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Sep 2024 05:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2ngmaSXcBqewvYTJxzeO329sFBXri/yhAj5w7/Inig=; b=1fQ4ZFU8B3xE8VkEcGLFvvCzge
	jVuEN6F/qlM8L0Gs47qiks8wKdGq+ovSiHV3NBHZbmouYu+rbieSVClr5pZ7NST8rPENSByW4Kw9j
	enRhN3tXmXqkFmWnVccy9b1WUAmVp8tC1lTjckesAtogbjeU+1OpF1+kc2s+sMFp7NyENYYW4AnP4
	PiUU8epULDKXHe/zw0OWDnAR6DAUlJHGEQDkrBaOpkUS79r50CUhHHjqIQNslzArJ7Y8n5r/tWDuF
	vNoMAwGe0s+taY1UE7M6ZKGhwT4G9GZCl1IpGD1z9uLr/v9aTVKYSda2gO7/u4j27KFqklZaNKxF9
	bLhJxIFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snWzT-00000000WfU-1vke;
	Mon, 09 Sep 2024 05:31:07 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snWyS-00000000WYA-20tE
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Sep 2024 05:30:06 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2f75aa08a96so23068001fa.1
        for <linux-mediatek@lists.infradead.org>; Sun, 08 Sep 2024 22:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thaumatec-com.20230601.gappssmtp.com; s=20230601; t=1725859802; x=1726464602; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M2ngmaSXcBqewvYTJxzeO329sFBXri/yhAj5w7/Inig=;
        b=TcoO69ik/Y4bzbm5Tv+FDmdwE7KQYbe+EL8xRDMja1y15pS+Hl4vxPcMyI9phJZiVd
         KOc9YDiQjif+YPwoxChFA/vhgNQHvti1RbAR/Pycyu6RWFM9xhEkFCTFROAqtuDNgOke
         CKiPylUxyQhsm8udcaiaKqhkyruItvuVXj6mK0aG/DL/i3sQpWQtoaik52+nbmig3LIu
         16vbzh8wcMbFW+H6qFlcUPku8Xw0w2KJ/Mx4UVMqrtiTCss/wcMiaO749SwvqTFUWntF
         DuVhYtrwxfeohtkOmIwNFzhlRkDJl3nXDIFCnnsjq/5xZTJNmGWx4sWceaCH0gd6hMZv
         BD4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725859802; x=1726464602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2ngmaSXcBqewvYTJxzeO329sFBXri/yhAj5w7/Inig=;
        b=m6WKw5Ovqlh3m1BUL4betqCwoZRaUgFSARYKUJbW4Fij9H0FFTTAeJzwzh7om3gAQ9
         KLJJ3YQrpmdJaSx8KWlRtmephV1TYyhCk01usb2bExEwqU22glZSMHH+7U7b92QqG1J5
         Lfw6VUseOQgya5IuR2t18AaRDxiJVGhx/uYDZgZQQoVmRFl2Io9Hh5kJMqPqMt1rxlGJ
         yjMZnF8IsZh+6gAySje3OFNrQaXlEDU2p1ijT45xwHoqibEm2c1ktNS6zEgAZfDNskUI
         6fCeBGCp44Ygx+IYiBshAduLFKuBRyxhP0HjZ8A5VX3sx7rYKLbjccEn5b8IyNt6emPZ
         kslA==
X-Forwarded-Encrypted: i=1; AJvYcCVlr2PCH5vLiNIhOHMUmX/5R0C2eOVtO+NVnIakt0UiSHwykUi3bvUhsdJxFvTvIVgp/sY750AD5SnmYERjyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YztSSOLuIVjG9UIB+ePtXOwwV9+HHGkGUipQyKm7CiKXV998I5H
	lw92iOtQlbCyyihMww+M6pdLnKCxzEV6Ehne9qNLn6SVeeGCNtMxJCpY4bRTly7fA9TP1usqKaA
	uNhk6jgxDDGRp4akNNMNYPiLEkHOlhLyAW5Pu6Q==
X-Google-Smtp-Source: AGHT+IHltu72PrN7ncZlY52C7Xqomq1WLsnBRUjIxxx0pxPEleRO1qqrTtBPbeEkK9A2Oz54wKSGz/uiIYvo9FfCW9o=
X-Received: by 2002:a2e:be0b:0:b0:2f7:5cf9:46dd with SMTP id
 38308e7fff4ca-2f75cf94792mr37355141fa.45.1725859801484; Sun, 08 Sep 2024
 22:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
 <20240506-tc358775-fix-powerup-v1-9-545dcf00b8dd@kernel.org>
 <CAHgnY3=KCD4gyJ4nL6nN1tvWcsiRQL+Oz11RNOniDdyMoEPcSg@mail.gmail.com> <D3Z9XTBHSUEN.2GW0UCIPLR6HY@kernel.org>
In-Reply-To: <D3Z9XTBHSUEN.2GW0UCIPLR6HY@kernel.org>
From: Daniel Semkowicz <dse@thaumatec.com>
Date: Mon, 9 Sep 2024 07:29:50 +0200
Message-ID: <CAHgnY3=bRyAoDDm8dCuT0z7MaF_LzCa-MDYRqQgKVqgVhFcJjw@mail.gmail.com>
Subject: Re: [PATCH 09/20] drm/bridge: tc358775: remove complex vsdelay calculation
To: Michael Walle <mwalle@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Vinay Simha BN <simhavcs@gmail.com>, Tony Lindgren <tony@atomide.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240908_223004_663449_57B1BF6C 
X-CRM114-Status: GOOD (  30.08  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 6, 2024 at 4:34=E2=80=AFPM Michael Walle <mwalle@kernel.org> wr=
ote:
>
> Hi Daniel,
>
> > > To cite the datasheet on VSDELAY:
> > >   During DSI link speed is slower than that of LVDS link=E2=80=99s, d=
ata needs
> > >   to be buffer within 775XBG before outputting to prevent data from
> > >   underflow. Register field VPCTRL[VSDELAY] is used to for this purpo=
se
> > >
> > > This driver assumes that the DSI link speed is the pixel clock (as do=
es
> > > every DSI bridge driver), after all the LVDS clock is derived from th=
e
> > > DSI clock. Thus we know for a fact, that the DSI link is not slower t=
han
> > > the LVDS side. Just use the (sane) default value of the bridge and dr=
op
> > > the complicated calculation here.
> >
> > I am not convinced this is a good idea to revert to a default
> > VSdelay value. I tested your patch series with RK3399 platform
> > and default value (5) was not enough there. There was small data
> > underflow visible, resulting in display offset. Removing this patch
> > and using the original calculation formula fixed the problem.
> > The calculated VSDELAY value seems to be a lot bigger than required,
> > but keeps us on the safe side.
>
> Did you use just parts of this series or did you port the "lp11
> notify" mechanism to the rk3399 platform? Please keep in mind, that
> this bridge doesn't really work if the reset isn't deasserted during
> lp-11 mode and lots of odd things happen.

I pulled in your complete series and ported "lp11 notify" to RK3399.
Both reset and standby pins are connected to the bridge on my board.

>
> Also, do you know if you have an EEPROM attached to the bridge or
> does any firmware part initialize that bridge?

The initialization is done only by Linux kernel driver with your patches.

>
> > It looks that hback-porch value for panel is used also on DSI link,
> > effectively delaying hactive data delivered to TC358775 bridge.
> > I suspect this causes the requirement for higher VSDELAY.
>
> It was ages ago since I've worked on this bridge and extensively
> tested and even measured and decoded the DSI link and the LVDS
> stream. But IIRC this delay was only to compensate the difference
> between the DSI clock and the LVDS clock, that is, if you push the
> pixel stream slower into the bridge than the bridge is pushing it
> out to the LVDS panel.
>
> So the back porch should be irrelevant here (?!).

That was also my initial understanding, but for some reason original algori=
thm
for VSDELAY in tc358775 driver, takes blanking period into calculation.
It does not base only on DSI and LVDS clocks.
Additionally, my experiments show that the default value is too low
in my configuration.

>
> -michael

Kind regards
Daniel

