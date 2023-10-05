Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBD1E92725
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 18:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OMcqqa1LovqwpJcoFuXPlVZW2k01ePyUDHDlcXz2dos=; b=FxB3J3aTCR/uRkg4Y3l0ht3iIW
	xjop1T47hj3dhvZ5iHCkZZERHowEsXdmmvvJRWiol2KcUoXnv4kesSy/pQZ9Y4JuLvvgyovCsPGZ2
	FSCRDxJTaAqWqtv8v3Kezn1L+gQs5Vuz+9/ixQ67kxQe1332Qoayw2IXvXOBWjYhcNrw/JqCY0YRx
	koVD7SDiK+hq36yVvuApL4Ih7X8xAcT1nAt8Qreh8Lm3ZqZrvQ7TSNDpBMnUj6u9Zj+K/y/0q3Ugi
	jiQ5iOCCLNnqsweyJtIr6S7gcvpcj1HxF6+BYtodyX/cRYtAfyO7L9ZaRR3xv8USre8Sue4sBzWcQ
	WbgiJf4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoT5M-004Hmr-2m;
	Thu, 05 Oct 2023 18:28:32 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoT5H-004HiC-1y
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Oct 2023 18:28:31 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-6c4f1f0774dso852602a34.2
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Oct 2023 11:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696530503; x=1697135303; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OMcqqa1LovqwpJcoFuXPlVZW2k01ePyUDHDlcXz2dos=;
        b=PSYhJdLGHfF3wjLlSrvqA4bZ2E4v08SsllSJFRymPzhjuxjYXqQYHW5VfEBRwzfBCI
         POun+KdGDY4ITak/JFeucw6NmST+z+hfQ7F3bpL1P6sHVuJv/U+T3HIPANIW2PMLHElU
         LlPdaQqENHB45kH+WgC+GjVFZPoOUzsrdE/R4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696530503; x=1697135303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OMcqqa1LovqwpJcoFuXPlVZW2k01ePyUDHDlcXz2dos=;
        b=XeWh2xPKy1SiPEn7nMJaxJzkF4lQsiDEctNZOamG3PQgC1yF52JEwwNwtquxPzGseq
         onqmRcNtOsmgXIZ6Q97k60ajy2IOVTWMaW9u615/MEaLKau4m8N9nQhHDNKV1vYicK8g
         5ajEHVOsfRzw9WTUa3kBT7p1ynOoHDKHsk61zuAmRmCywJWwC3pmRPkKgyqbr0ox6WsQ
         sZIAqFm8nCtvcXF2Qd+HEhWpJZNGvfKPxMi2V6rdb2EfveWEdrSAaSQ2TlCWHdrUTNmU
         eAhYPfZ5+i5R07XSMG1uvlbu4Z0L/62Erbpgy4Qg1qCAdrXNk4j8MldTcLJY0gz3EQy2
         mTaA==
X-Gm-Message-State: AOJu0Yyw7IbwviIhqhlKEhq75O7r2gAABOHTFgMASQi0D80XRHBAoNwS
	7MtroT1rskgVAQy/oGkYTzmgaEnFPCbS5mz7A0R+Bw==
X-Google-Smtp-Source: AGHT+IHYbHMUrTrmor7aa2xPGaR96QNF9urqFDhCGJGtucSFIieFcvATx/342Mtzc1GeLA+R4C8NjgkMA9Je+0IfIJw=
X-Received: by 2002:a9d:6e09:0:b0:6b9:ed64:1423 with SMTP id
 e9-20020a9d6e09000000b006b9ed641423mr5935370otr.2.1696530502812; Thu, 05 Oct
 2023 11:28:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230925150010.1.Iff672233861bcc4cf25a7ad0a81308adc3bda8a4@changeid>
 <b0037c9f-588b-4eb8-6415-0fe75bed264f@collabora.com> <CAD=FV=UWQgLLfU4X+6OUR5AWOkJKwG9J7BbKGRCgze6LTY6JNw@mail.gmail.com>
 <CAD=FV=UqG6DiAyjcLKeoUWKutepGd46Zx=8O-NWKoYC-fZEG6g@mail.gmail.com>
In-Reply-To: <CAD=FV=UqG6DiAyjcLKeoUWKutepGd46Zx=8O-NWKoYC-fZEG6g@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 5 Oct 2023 11:27:57 -0700
Message-ID: <CAJMQK-gHVRFbkBDP3Mbo8ofEPjK=ckpi+xaJvPFc_gr1ZFTfXw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Move AUX B116XW03 out of panel-edp back to panel-simple
To: Doug Anderson <dianders@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@gmail.com, daniel@ffwll.ch, 
	jitao.shi@mediatek.com, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org, neil.armstrong@linaro.org, 
	quic_jesszhan@quicinc.com, sam@ravnborg.org, 
	Anton Bambura <jenneron@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_112827_655010_731FCF30 
X-CRM114-Status: GOOD (  44.53  )
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

On Thu, Oct 5, 2023 at 11:11=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Tue, Sep 26, 2023 at 7:01=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Tue, Sep 26, 2023 at 1:06=E2=80=AFAM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> > >
> > > Il 26/09/23 00:00, Douglas Anderson ha scritto:
> > > > In commit 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of
> > > > panel-simple") I moved a pile of panels out of panel-simple driver
> > > > into the newly created panel-edp driver. One of those panels, howev=
er,
> > > > shouldn't have been moved.
> > > >
> > > > As is clear from commit e35e305eff0f ("drm/panel: simple: Add AUO
> > > > B116XW03 panel support"), AUX B116XW03 is an LVDS panel. It's used =
in
> > > > exynos5250-snow and exynos5420-peach-pit where it's clear that the
> > > > panel is hooked up with LVDS. Furthermore, searching for datasheets=
 I
> > > > found one that makes it clear that this panel is LVDS.
> > > >
> > > > As far as I can tell, I got confused because in commit 88d3457ceb82
> > > > ("drm/panel: auo,b116xw03: fix flash backlight when power on") Jita=
o
> > > > Shi added "DRM_MODE_CONNECTOR_eDP". That seems wrong. Looking at th=
e
> > > > downstream ChromeOS trees, it seems like some Mediatek boards are
> > > > using a panel that they call "auo,b116xw03" that's an eDP panel. Th=
e
> > > > best I can guess is that they actually have a different panel that =
has
> > > > similar timing. If so then the proper panel should be used or they
> > > > should switch to the generic "edp-panel" compatible.
> > > >
> > > > When moving this back to panel-edp, I wasn't sure what to use for
> > > > .bus_flags and .bus_format and whether to add the extra "enable" de=
lay
> > > > from commit 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash
> > > > backlight when power on"). I've added formats/flags/delays based on=
 my
> > > > (inexpert) analysis of the datasheet. These are untested.
> > > >
> > > > NOTE: if/when this is backported to stable, we might run into some
> > > > trouble. Specifically, before 474c162878ba ("arm64: dts: mt8183:
> > > > jacuzzi: Move panel under aux-bus") this panel was used by
> > > > "mt8183-kukui-jacuzzi", which assumed it was an eDP panel. I don't
> > > > know what to suggest for that other than someone making up a bogus
> > > > panel for jacuzzi that's just for the stable channel.
> > > >
> > > > Fixes: 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight =
when power on")
> > > > Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-=
simple")
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > > > I haven't had a snow or peach-pit hooked up for debugging / testing
> > > > for years. I presume that they must be broken and hope that this fi=
xes
> > > > them.
> > >
> > > We could avoid backport breakages by avoiding to backport this to any=
 kernel
> > > that doesn't contain commit 474c162878ba ("arm64: dts: mt8183: jacuzz=
i: Move
> > > panel under aux-bus")... because creating a dummy panel to get two wr=
ongs
> > > right is definitely not ok.
> >
> > Sure, except that leaves us with ... a breakage. :-P
> >
> > Although I haven't tested it, I have a hard time believing that
> > exynos5250-snow and exynos5420-peach-pit will work properly with the
> > panel defined as an eDP panel. That means that they will be broken. If
> > someone cared to get those fixed in a stable backport then we'd be
> > stuck deciding who to break. If you have any brilliant ideas then I'm
> > all ears.
> >
> > ...then again, I presume this has been broken since commit
> > 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight when power
> > on"). That was a little over 3 years ago. Maybe I'm wrong and somehow
> > things still limp along and sorta work even though the panel is
> > defined incorrectly?
>
> I dug out a exynos5250-snow out of my pile and booted postmarket OS on
> it, which was shockingly easy/pleasant (kudos to those involved!). I
> found that it was booting a kernel based on 6.1.24. Digging into
> sysfs, I found that indeed it appeared to be using the "panel-edp"
> driver, so I guess it is limping along with the wrong driver and wrong
> flags...
>
> It wasn't totally clear for me how to build a new kernel and deploy it
> for postmarket OS, so I wasn't able to confirm this change. I've CCed
> the person listed on the postmarket OS wiki though to see if they have
> any insight.
>
> In any case, it sounds as if things are working well enough on older
> OSes, so maybe we can just skip trying to do any stable backport on
> this. It still seems like we should land it, though, since the current
> state of the world seems pretty broken. Anyone willing to give a
> Reviewed-by or Acked-by tag?
>

Acked-by: Hsin-Yi Wang <hsinyi@chromium.org>

> -Doug

