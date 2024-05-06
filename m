Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59928C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 06:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYbwDjo4JnZ5uHAXkvG9I+rCsMuqLE4wlNoSCofJHgs=; b=ckjVoWQ7doJH+ZrC+7u27LnIHG
	bqq2hIHANq0qnXthSzNnBhig8td0owZABSxZQpj7wiCp9d29WuD6kg0uYR+wBhlUwHM6Q22dSokLt
	YjIqY9kIoydGELxq/IPuCJnXNTTyq+IgrSVxZgXJdKXyNUnVIxZkSSYIWK2RVnirKqsgGM6jkFbCK
	nm95bQa6CrIIqwWdQ6hJlAfGnBPtlp0EcF89tR66BvJFg+lUl3gfPMD8za1MXOPy9jxD0EEloF8IU
	AVnvuxXaMpNdd1KfEK25rbJG4VZddcyTPX95qILPq+6rPx0ld+JDGr/SZYa4mKQPTZDHKM4oHSU9/
	ZZSO+h4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3sDX-00000006Mb1-0YPd;
	Mon, 06 May 2024 06:52:55 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3sDT-00000006MZY-1rdc
	for linux-mediatek@lists.infradead.org;
	Mon, 06 May 2024 06:52:53 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-dbed0710c74so1223481276.1
        for <linux-mediatek@lists.infradead.org>; Sun, 05 May 2024 23:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714978370; x=1715583170; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYbwDjo4JnZ5uHAXkvG9I+rCsMuqLE4wlNoSCofJHgs=;
        b=k6qWVlnCh2VvUNgmwRkTlHAdQHsqIVj9CoSDMwwe1AkJwuKOl1yloVW/1GlEOtKfRj
         zO7EO56EcOdwVwwQzgsGpEkwFFM2cS7HIMkb3gzHh1uqjdWQRvCGPzuNQcAxeEtFMogi
         NDnQFzXjP/88ptIM+5yf8yu17p/CMefepI/clUO6QP/e037o5+aYBsIHKnAo11fnT726
         DCLy6cTijr+eLo2nQxLedJV5gcNd3Kd68Zf3BbH2nrH5dmrPlWBCUjwxHafOYIRQkzPE
         VT2vOJViz7/mcSNe+t2FSjMvC1qz3WU9seis8PGr0ERlH1+za764vJBU+IE1ZpNwPsGI
         QvIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714978370; x=1715583170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gYbwDjo4JnZ5uHAXkvG9I+rCsMuqLE4wlNoSCofJHgs=;
        b=GTNcvP4eG3hM3wKBdSzZf/bWLUdasXAevO9X6C4E8dkg1mmywcxjZk2guK7oGbxHl5
         N4EppSqB51NCmfWBCO5rLsnfIZr8KR6+KC66I6dlle/MWSkuz8wHgJChiY3mMIs1sC9A
         4eBw2KBF3rOviXN3sYGBpfhfJMR52EE49esbr0KCKN91Ku8511QuB2g5UCjkm7Zm4+LW
         KPrrpkxUXrNTFDlJ32r8jwMl5Yi9MLxKcS/5j3l9pnyKkp86W66Yq4uTmz4Q4fFPB+3J
         oCCw345ZQ7PnaacZbuyC8hx82dNZ4VdemLdLMr8cF8VUga5rtizwnPhL/j+bJ2rfa8rO
         gYyw==
X-Forwarded-Encrypted: i=1; AJvYcCVD2AmQU5m74PY46hZuIyVNPO1HZBa8JOppiLn4kbbFbOi3jStBVFIozsiFi0tgevefb8Vh03O2n4STZTOdbjSKEC4v/FAx1np4izJGzGFb2VHW
X-Gm-Message-State: AOJu0Yxjb0Fj6vl+u4nsIYhXlHV1l/NEK3T3pa+LUfCLAIxScXkgdWjE
	KmY1n8R2uUWEG1iHFXvEA4u7sFZ9zCJuootnXgL5uwsqtKIn+yCrU/XFwqTlirrziyMqUL8mJim
	tn7dFqh1h/ZI94OqPVBAb9EQ0IOxGoxch693APg==
X-Google-Smtp-Source: AGHT+IFOLblylb9TrnaoChByyT1UT9ZH6L3PmerBlWrS+9qDdstQZNljgAayMC5QIs6xOb8GpcS5/Xt855lSyd9iOHA=
X-Received: by 2002:a25:ef11:0:b0:de8:c277:1e72 with SMTP id
 g17-20020a25ef11000000b00de8c2771e72mr9131342ybd.1.1714978370131; Sun, 05 May
 2024 23:52:50 -0700 (PDT)
MIME-Version: 1.0
References: <20240503213441.177109-1-dianders@chromium.org>
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 6 May 2024 08:52:39 +0200
Message-ID: <CACRpkdYbtfE9RLsDewV2UwnJknCp_sFEgc+cq=OF+Qd3tkTcwA@mail.gmail.com>
Subject: Re: [RFT PATCH v2 00/48] drm/panel: Remove most store/double-check of
 prepared/enabled state
To: Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
	Chris Morgan <macromorgan@hotmail.com>, Yuran Pereira <yuran.pereira@hotmail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
	Jerry Han <hanxu5@huaqin.corp-partner.google.com>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Ondrej Jirman <megi@xff.cz>, 
	Purism Kernel Team <kernel@puri.sm>, Robert Chiras <robert.chiras@nxp.com>, Sam Ravnborg <sam@ravnborg.org>, 
	Stefan Mavrodiev <stefan@olimex.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_235251_553516_9D71AEBD 
X-CRM114-Status: GOOD (  28.89  )
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

On Fri, May 3, 2024 at 11:36=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:

> As talked about in commit d2aacaf07395 ("drm/panel: Check for already
> prepared/enabled in drm_panel"), we want to remove needless code from
> panel drivers that was storing and double-checking the
> prepared/enabled state. Even if someone was relying on the
> double-check before, that double-check is now in the core and not
> needed in individual drivers.
>
> This series attempts to do just that. While the original grep, AKA:
>   git grep 'if.*>prepared' -- drivers/gpu/drm/panel
>   git grep 'if.*>enabled' -- drivers/gpu/drm/panel
> ...still produces a few hits after my series, they are _mostly_ all
> gone. The ones that are left are less trivial to fix.
>
> One of the main reasons that many panels probably needed to store and
> double-check their prepared/enabled appears to have been to handle
> shutdown and/or remove. Panels drivers often wanted to force the power
> off for panels in these cases and this was a good reason for the
> double-check.
>
> In response to my V1 series [1] we had much discussion of what to
> do. The conclusion was that as long as DRM modeset drivers properly
> called drm_atomic_helper_shutdown() that we should be able to remove
> the explicit shutdown/remove handling in the panel drivers. Most of
> the patches to improve DRM modeset drivers [2] [3] [4] have now
> landed.
>
> In contrast to my V1 series, I broke the V2 series up a lot
> more. Since a few of the panel drivers in V1 already landed, we had
> fewer total drivers and so we could devote a patch to each panel.
> Also, since we were now relying on DRM modeset drivers I felt like we
> should split the patches for each panel into two: one that's
> definitely safe and one that could be reverted if we found a
> problematic DRM modeset driver that we couldn't fix.
>
> Sorry for the large number of patches. I've set things to mostly just
> CC people on the cover letter and the patches that are relevant to
> them. I've tried to CC people on the whole series that have shown
> interest in this TODO item.
>
> As patches in this series are reviewed and/or tested they could be
> landed. There's really no ordering requirement for the series unless
> patches touch the same driver.
>
> NOTE: this touches _a lot_ of drivers, is repetitive, and is not
> really possible to generate automatically. That means it's entirely
> possible that my eyes glazed over and I did something wrong. Please
> double-check me and don't assume that I got everything perfect, though
> I did my best. I have at least confirmed that "allmodconfig" for arm64
> doesn't fall on its face with this series. I haven't done a ton of
> other testing.
>
> [1] https://lore.kernel.org/r/20230804140605.RFC.4.I930069a32baab6faf46d6=
b234f89613b5cec0f14@changeid
> [2] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.o=
rg
> [3] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.o=
rg
> [4] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.=
org

This is the right thing to do, thanks for looking into this!

As for the behaviour of .remove() I doubt whether in many cases
the original driver authors have even tested this themselves.
I would say we should just apply the series as soon as it's non-RFC
after the next merge window and see what happens. I doubt it
will cause much trouble.

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

