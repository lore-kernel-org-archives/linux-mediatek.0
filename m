Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EFF4CDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 16:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XB7Wf5LgsYf36+k+zhs9TduHabjcJcCiXT3QAGky0tQ=; b=faJiVFUob/1dLXkU6Mq68//tIH
	oG4VjdlWZnmuzYkBJKnntd8qYM/ZPDyC3klLh8Pg1jJYtPiKI09DqRPHcj1onb5zcbhgNjJxaDqsF
	VWzCrvsSLk3UoMf4Ko8CrYswIAu5FyBAsPO3rvDRSDfL6VUTKpMz1R0eKaKg8UVpV8MlSWVRtdzva
	NzkYEDfHx+wUVMyDBkQ/zobrPAHmLzZZm2+Xf1CpJQJ+c1lAUNCmk9SLGUXeCjUQcMDjTHVrwTmkO
	YFeqt3vVN/UnvEgDrh8PquAoHB9AYBbP87XPM9MpJQTsN/RlVgL9AzzilhAaSxsu3ZlCoE5p11MV4
	h1jlUedw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyoV-001S8e-24;
	Thu, 12 Oct 2023 16:45:31 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyoS-001S7D-03
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 16:45:29 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso1554202a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 09:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697129123; x=1697733923; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XB7Wf5LgsYf36+k+zhs9TduHabjcJcCiXT3QAGky0tQ=;
        b=fH1Y6pfn+N+gSgsfwxqrLrEMWsqbCh459kq79CQ+0b9KU38DjD1cnxeCre2pzVgFPb
         5hNdHOHDULuormM5TJElmj57Z1UIXx8AXCXyH0K1i+PXMCJQWTyU7x0ma7XwtANWXz9H
         OpBjTqRfsxBfJJgLDB3fc2p8nvIM7MLoXdixA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697129123; x=1697733923;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XB7Wf5LgsYf36+k+zhs9TduHabjcJcCiXT3QAGky0tQ=;
        b=AazXU79G9ugUAGzseT/IqTHFq3BRZ5m7pQAl4PDGelHZdoCaxLyUyXyFfxfkKM2jPe
         aUPpVsB47F2MPqOY+IJYWUp4JvhaDAF7sg+55zBSIVOjBd42mMwXE/l4rkC/PgPBsT1J
         SMxH49VASmt/XKpcAsiZROKgoFZ0IKyF4nApliipqV9V6zssx8DvbLYmf8VGoRWzAp8z
         ZW9ZbUC23M2FFvZhZDUIYarRS56jji9GW80b8sAhReRh/20tVjGiXZjiBQlddiOBKd2r
         SbXdQTZlXdUVWrvg8e62asEFqlnfUsXYjGbl/xfiU7Z4qLACa0vg0oQSY2q2Jx5tHvwh
         ujFg==
X-Gm-Message-State: AOJu0YzXr96O/tea8zJHnLQ/FR94p5bs9g88AQXDQ4M3wWXoR2tHvUVJ
	87oDg7Flmz/oape5mc55ATX8Fvueh+2AUUGyo8p0nQ==
X-Google-Smtp-Source: AGHT+IFduZumTtJmp26sA5mj2Xeu2HmOHiVQrQHBO1mh0ckz8jBtXrI7o3DMxIMHYN+tmXS6QqdDEg==
X-Received: by 2002:a17:906:20dd:b0:9ba:399b:61b0 with SMTP id c29-20020a17090620dd00b009ba399b61b0mr8258006ejc.66.1697129122827;
        Thu, 12 Oct 2023 09:45:22 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id p6-20020a1709061b4600b0098e2969ed44sm11172975ejg.45.2023.10.12.09.45.22
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 09:45:22 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-405459d9a96so1965e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 09:45:22 -0700 (PDT)
X-Received: by 2002:a05:600c:3c96:b0:3f6:f4b:d4a6 with SMTP id
 bg22-20020a05600c3c9600b003f60f4bd4a6mr262956wmb.7.1697129121865; Thu, 12 Oct
 2023 09:45:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230925150010.1.Iff672233861bcc4cf25a7ad0a81308adc3bda8a4@changeid>
 <b0037c9f-588b-4eb8-6415-0fe75bed264f@collabora.com> <CAD=FV=UWQgLLfU4X+6OUR5AWOkJKwG9J7BbKGRCgze6LTY6JNw@mail.gmail.com>
 <CAD=FV=UqG6DiAyjcLKeoUWKutepGd46Zx=8O-NWKoYC-fZEG6g@mail.gmail.com> <c3380c97-1b8c-5a68-168e-fc6150701365@postmarketos.org>
In-Reply-To: <c3380c97-1b8c-5a68-168e-fc6150701365@postmarketos.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Oct 2023 09:45:09 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WAYYv5h6oWWhEJHyZesE5cguBqVufCmK6s4gvMeNkCWg@mail.gmail.com>
Message-ID: <CAD=FV=WAYYv5h6oWWhEJHyZesE5cguBqVufCmK6s4gvMeNkCWg@mail.gmail.com>
Subject: Re: [PATCH] drm/panel: Move AUX B116XW03 out of panel-edp back to panel-simple
To: Anton Bambura <jenneron@postmarketos.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
	Hsin-Yi Wang <hsinyi@chromium.org>, matthias.bgg@gmail.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, 
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@gmail.com, daniel@ffwll.ch, 
	jitao.shi@mediatek.com, linus.walleij@linaro.org, 
	linux-kernel@vger.kernel.org, neil.armstrong@linaro.org, 
	quic_jesszhan@quicinc.com, sam@ravnborg.org, 
	Anton Bambura <jenneron@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_094528_053925_A2D42E1A 
X-CRM114-Status: GOOD (  36.93  )
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

On Sun, Oct 8, 2023 at 1:52=E2=80=AFPM Anton Bambura <jenneron@postmarketos=
.org> wrote:
>
>
> On 10/5/23 21:10, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Sep 26, 2023 at 7:01=E2=80=AFAM Doug Anderson <dianders@chromiu=
m.org> wrote:
> >> Hi,
> >>
> >> On Tue, Sep 26, 2023 at 1:06=E2=80=AFAM AngeloGioacchino Del Regno
> >> <angelogioacchino.delregno@collabora.com> wrote:
> >>> Il 26/09/23 00:00, Douglas Anderson ha scritto:
> >>>> In commit 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of
> >>>> panel-simple") I moved a pile of panels out of panel-simple driver
> >>>> into the newly created panel-edp driver. One of those panels, howeve=
r,
> >>>> shouldn't have been moved.
> >>>>
> >>>> As is clear from commit e35e305eff0f ("drm/panel: simple: Add AUO
> >>>> B116XW03 panel support"), AUX B116XW03 is an LVDS panel. It's used i=
n
> >>>> exynos5250-snow and exynos5420-peach-pit where it's clear that the
> >>>> panel is hooked up with LVDS. Furthermore, searching for datasheets =
I
> >>>> found one that makes it clear that this panel is LVDS.
> >>>>
> >>>> As far as I can tell, I got confused because in commit 88d3457ceb82
> >>>> ("drm/panel: auo,b116xw03: fix flash backlight when power on") Jitao
> >>>> Shi added "DRM_MODE_CONNECTOR_eDP". That seems wrong. Looking at the
> >>>> downstream ChromeOS trees, it seems like some Mediatek boards are
> >>>> using a panel that they call "auo,b116xw03" that's an eDP panel. The
> >>>> best I can guess is that they actually have a different panel that h=
as
> >>>> similar timing. If so then the proper panel should be used or they
> >>>> should switch to the generic "edp-panel" compatible.
> >>>>
> >>>> When moving this back to panel-edp, I wasn't sure what to use for
> >>>> .bus_flags and .bus_format and whether to add the extra "enable" del=
ay
> >>>> from commit 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash
> >>>> backlight when power on"). I've added formats/flags/delays based on =
my
> >>>> (inexpert) analysis of the datasheet. These are untested.
> >>>>
> >>>> NOTE: if/when this is backported to stable, we might run into some
> >>>> trouble. Specifically, before 474c162878ba ("arm64: dts: mt8183:
> >>>> jacuzzi: Move panel under aux-bus") this panel was used by
> >>>> "mt8183-kukui-jacuzzi", which assumed it was an eDP panel. I don't
> >>>> know what to suggest for that other than someone making up a bogus
> >>>> panel for jacuzzi that's just for the stable channel.
> >>>>
> >>>> Fixes: 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight w=
hen power on")
> >>>> Fixes: 5f04e7ce392d ("drm/panel-edp: Split eDP panels out of panel-s=
imple")
> >>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> >>>> ---
> >>>> I haven't had a snow or peach-pit hooked up for debugging / testing
> >>>> for years. I presume that they must be broken and hope that this fix=
es
> >>>> them.
> >>> We could avoid backport breakages by avoiding to backport this to any=
 kernel
> >>> that doesn't contain commit 474c162878ba ("arm64: dts: mt8183: jacuzz=
i: Move
> >>> panel under aux-bus")... because creating a dummy panel to get two wr=
ongs
> >>> right is definitely not ok.
> >> Sure, except that leaves us with ... a breakage. :-P
> >>
> >> Although I haven't tested it, I have a hard time believing that
> >> exynos5250-snow and exynos5420-peach-pit will work properly with the
> >> panel defined as an eDP panel. That means that they will be broken. If
> >> someone cared to get those fixed in a stable backport then we'd be
> >> stuck deciding who to break. If you have any brilliant ideas then I'm
> >> all ears.
> >>
> >> ...then again, I presume this has been broken since commit
> >> 88d3457ceb82 ("drm/panel: auo,b116xw03: fix flash backlight when power
> >> on"). That was a little over 3 years ago. Maybe I'm wrong and somehow
> >> things still limp along and sorta work even though the panel is
> >> defined incorrectly?
> > I dug out a exynos5250-snow out of my pile and booted postmarket OS on
> > it, which was shockingly easy/pleasant (kudos to those involved!). I
> > found that it was booting a kernel based on 6.1.24. Digging into
> > sysfs, I found that indeed it appeared to be using the "panel-edp"
> > driver, so I guess it is limping along with the wrong driver and wrong
> > flags...
> >
> > It wasn't totally clear for me how to build a new kernel and deploy it
> > for postmarket OS, so I wasn't able to confirm this change. I've CCed
> > the person listed on the postmarket OS wiki though to see if they have
> > any insight.
> Tested it on peach-pit using linux-next with this patch applied. Panel
> still works and "dmesg | grep panel" returns panel_simple instead of
> panel_edp.
>
> Tested-by: Anton Bambura <jenneron@postmarketos.org>

Pushed to drm-misc-fixes:

ad3e33fe071d drm/panel: Move AUX B116XW03 out of panel-edp back to panel-si=
mple

-Doug

