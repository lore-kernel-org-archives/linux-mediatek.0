Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A9A1E7E637
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 14:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBohR+UrQgBr4N5azTZZcBABGSeyKmANhNOajTqGdkY=; b=IvCKOQftWZXDhvxQApb3EETtIN
	WdGXALzgNeexNfmfoPtB+ayzMFylXnrZiLSsd+gFne1QRLuU9CdqOrBmBSTOSpg+ezm6IseXqRhmS
	5k7PCF1N8YlqM6/rDTOorVoDtnFgfYvSd+cxY7pLNVsMtqV4rrp0AglhQkw4lZoEpHmPUtH2W85Gw
	LKxMA7DtixTNvsATyJYH9amNe3Ha2TQJVXRWvM9dDUKtblWtCpymPFwavq5hilJmC/nHswpauvf8X
	aOYf2jTh8TQDF1znGoydE71BmNyZFOLvhf6dt4YcsDajn+W3FhPHKNjGnTHG7Uo2UGn6dJ0BYBGR4
	Ly+lw3uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ql8lk-00GWyB-12;
	Tue, 26 Sep 2023 14:10:32 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ql8lh-00GWxd-0m
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Sep 2023 14:10:30 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-991c786369cso1071901666b.1
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Sep 2023 07:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695737426; x=1696342226; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FBohR+UrQgBr4N5azTZZcBABGSeyKmANhNOajTqGdkY=;
        b=ije8vH9syCRzqFegTMy+NUluxdMbKFBKXwhVIqPxpWj0SDdZYWknP6vqmgYJVfUmDm
         ViO+Xec8a65Qtrr6WoiGoJQmOiMkwer2nduWtReCAuhP8NUi+9e+VL6bgFtGPm9+ZOJa
         Ly9WU8ECeFqwwf84Ynxf9DcCXPsminwisqixY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695737426; x=1696342226;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBohR+UrQgBr4N5azTZZcBABGSeyKmANhNOajTqGdkY=;
        b=CJMpXhfrUcqkeshF+t5lMWM6oxvv4jaVKDxW+yJy5wbI0wAZVNqbjG86R55Iu87Wsp
         q1TJXWAm/G/e/SflLgGzXIXbjDf2QJnpwK+3AtgSj7d6+ixmQbZDv5VqdHCKo21XJ32t
         mEh8IkQeNyRWlExxm/NpL6YtezDqB7eBO8B3mfcC4+tp4eF+h0fA+25Ez6v9HFcWVn+2
         3R+RhViGjp39CvbguRUBlofyzsZU+/SMz3BbfhhFhH3jMcf3V4t5ceHflMAtVXIsTnqe
         2MRkMmZUyREaRKzZqENj6IpF8m1tbk+o/R/Jr0vN/UTrUf9P788yYgs1gRX7J/88V3dN
         jaKQ==
X-Gm-Message-State: AOJu0YwLbfWWcTOAUZP+jhkaHKVbqPgTpO1b+q8dsxhgdviqtrfOtvmx
	keCzdO4OVsMysEkJZz33Yh6q65qmIQC4/asrVIjbfMdM
X-Google-Smtp-Source: AGHT+IG0czYpZ6sQiXpnt7uFuoWVh92YcS3xPleAhZeN3oWu0mHsg7PxYfpG3HVw3iDqk6bwF8KuKg==
X-Received: by 2002:a17:907:1c23:b0:9a2:139:f45d with SMTP id nc35-20020a1709071c2300b009a20139f45dmr10859772ejc.43.1695737426440;
        Tue, 26 Sep 2023 07:10:26 -0700 (PDT)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id gx10-20020a170906f1ca00b0099cb349d570sm7889255ejb.185.2023.09.26.07.10.26
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Sep 2023 07:10:26 -0700 (PDT)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-534694a9f26so10100a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Sep 2023 07:10:26 -0700 (PDT)
X-Received: by 2002:ac2:548e:0:b0:501:a2b4:8ff5 with SMTP id
 t14-20020ac2548e000000b00501a2b48ff5mr54282lfk.7.1695736932511; Tue, 26 Sep
 2023 07:02:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230925150010.1.Iff672233861bcc4cf25a7ad0a81308adc3bda8a4@changeid>
 <b0037c9f-588b-4eb8-6415-0fe75bed264f@collabora.com>
In-Reply-To: <b0037c9f-588b-4eb8-6415-0fe75bed264f@collabora.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 26 Sep 2023 07:01:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UWQgLLfU4X+6OUR5AWOkJKwG9J7BbKGRCgze6LTY6JNw@mail.gmail.com>
Message-ID: <CAD=FV=UWQgLLfU4X+6OUR5AWOkJKwG9J7BbKGRCgze6LTY6JNw@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Move AUX B116XW03 out of panel-edp back to panel-simple
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
	Hsin-Yi Wang <hsinyi@chromium.org>, matthias.bgg@gmail.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@gmail.com, daniel@ffwll.ch, 
	jitao.shi@mediatek.com, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org, neil.armstrong@linaro.org, 
	quic_jesszhan@quicinc.com, sam@ravnborg.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_071029_300883_29CF9A36 
X-CRM114-Status: GOOD (  31.10  )
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

Hi,

On Tue, Sep 26, 2023 at 1:06=E2=80=AFAM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 26/09/23 00:00, Douglas Anderson ha scritto:
> > In commit 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of
> > panel-simple") I moved a pile of panels out of panel-simple driver
> > into the newly created panel-edp driver. One of those panels, however,
> > shouldn't have been moved.
> >
> > As is clear from commit e35e305eff0f ("drm/panel: simple: Add AUO
> > B116XW03 panel support"), AUX B116XW03 is an LVDS panel. It's used in
> > exynos5250-snow and exynos5420-peach-pit where it's clear that the
> > panel is hooked up with LVDS. Furthermore, searching for datasheets I
> > found one that makes it clear that this panel is LVDS.
> >
> > As far as I can tell, I got confused because in commit 88d3457ceb82
> > ("drm/panel: auo,b116xw03: fix flash backlight when power on") Jitao
> > Shi added "DRM_MODE_CONNECTOR_eDP". That seems wrong. Looking at the
> > downstream ChromeOS trees, it seems like some Mediatek boards are
> > using a panel that they call "auo,b116xw03" that's an eDP panel. The
> > best I can guess is that they actually have a different panel that has
> > similar timing. If so then the proper panel should be used or they
> > should switch to the generic "edp-panel" compatible.
> >
> > When moving this back to panel-edp, I wasn't sure what to use for
> > .bus_flags and .bus_format and whether to add the extra "enable" delay
> > from commit 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash
> > backlight when power on"). I've added formats/flags/delays based on my
> > (inexpert) analysis of the datasheet. These are untested.
> >
> > NOTE: if/when this is backported to stable, we might run into some
> > trouble. Specifically, before 474c162878ba ("arm64: dts: mt8183:
> > jacuzzi: Move panel under aux-bus") this panel was used by
> > "mt8183-kukui-jacuzzi", which assumed it was an eDP panel. I don't
> > know what to suggest for that other than someone making up a bogus
> > panel for jacuzzi that's just for the stable channel.
> >
> > Fixes: 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight when=
 power on")
> > Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-simp=
le")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > I haven't had a snow or peach-pit hooked up for debugging / testing
> > for years. I presume that they must be broken and hope that this fixes
> > them.
>
> We could avoid backport breakages by avoiding to backport this to any ker=
nel
> that doesn't contain commit 474c162878ba ("arm64: dts: mt8183: jacuzzi: M=
ove
> panel under aux-bus")... because creating a dummy panel to get two wrongs
> right is definitely not ok.

Sure, except that leaves us with ... a breakage. :-P

Although I haven't tested it, I have a hard time believing that
exynos5250-snow and exynos5420-peach-pit will work properly with the
panel defined as an eDP panel. That means that they will be broken. If
someone cared to get those fixed in a stable backport then we'd be
stuck deciding who to break. If you have any brilliant ideas then I'm
all ears.

...then again, I presume this has been broken since commit
88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight when power
on"). That was a little over 3 years ago. Maybe I'm wrong and somehow
things still limp along and sorta work even though the panel is
defined incorrectly?

-Doug

