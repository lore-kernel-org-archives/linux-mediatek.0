Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49250C4828D
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Feb 2024 10:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GvnB5ueesQjpAOjR8nVz/seYPxt7xYcubH1vH2siBcI=; b=HoKH3MXqs3MRiOdoemOk+4jGXA
	EWQPR3FKoovyVU9UdiTEnrAM3eNncmZrY+0Vlf44n5ZsLjfoEHwIcKx06mYAidZCb0Zy4u3XOZ60S
	fJeETx9RZDYUeohJgBgChajZk+7rzllExkz3mtGoDvQTTwgXZwI1XgsOs/qoaaXj03uE/Vo7K+I7q
	I/EoMb7h0WoSNJWr7pQdW7I7j/Ool9zQQ6LPjp03R4N/WulVMfy3KS4BqJ4OlOdP5KJucILzhb/ym
	dnJxeiNHuNzJAkwBgX8lIzGaQqSyemTlxL/9IE8oGT55PX1Qfrwe3urZfajTgFS7fwlibvZMLriZ4
	7hdWnz0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXfTr-0000000AOmo-1qPj;
	Wed, 07 Feb 2024 10:48:39 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXfTo-0000000AOlK-0O8c
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Feb 2024 10:48:37 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-dc6cbe1ac75so378060276.1
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Feb 2024 02:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707302914; x=1707907714; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GvnB5ueesQjpAOjR8nVz/seYPxt7xYcubH1vH2siBcI=;
        b=rzsbNFNJhp8frPi7l7jcWWgGUJ+h9jFW95JhtE37kfm4O4v5qL9SwXi7PFoOwEpINQ
         s48FSIdaRMrCLjfxl1BR21kk9M4xhdYNLaU3hFGt7nWCprEYK331y9SkRGCH5xpHaDVd
         WCHHWa1JXB5dyKLvrpVSvW7qSUoZLbnVCDWNkUcOyFOmsEOiM7Tk/xgD/e15Z1J6moZQ
         2JoOZmqF4OmTboqhqmzMK1sg4aQIFo+n54kjTfY/AmtKASFpow6ej3/xpewbQ/JrdtgN
         Oqbmvgzi2rkSOtVZ4O9QuJid6o5rrkFVGjdS6sHjcNRh2mrvO7X3WP9W6ANA65II7sVU
         +2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707302914; x=1707907714;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GvnB5ueesQjpAOjR8nVz/seYPxt7xYcubH1vH2siBcI=;
        b=iP62x/JN6wWaT2RndOYkzt+Re6FsxUyeVn6sIqcNnclw+zr+OXBq8Ji7F3taXOFnYV
         Ppamblt5XilX5PsFV1PZ8rlkRaaMW67HQOOkybElAOe84FE0XAzkipE3o6THoD8N43fZ
         1VXeCFj8ZJvsCgcMum0lmns2AinLlXLaPtV4frZepzgjX6fBD8cJ1oqIQzbmp4A4UqnG
         wzNkuUxk7Iq+hjEiZ0yBhJRpeQSmNsLOj/m+n2FOatsTu+eSpP9yH1ykC7qOkg53fzvl
         QDNeKzF/9po8xahax14uJeSfGnKAhJcowVqrYu986HHEz5ICqaWbaaSXUdculYCVBB43
         JOqw==
X-Gm-Message-State: AOJu0YwHCoKciMwE64jxQBrzP/O3u+JxEBoCEyXbA+hdpCgVxoSvlziX
	rS5I7M4CsW/U9nTDAyYBGnIT+unFc3nYvc8f3skpnWYyVF2QIxwZssODc0KXlO9onzi+eaPhSNw
	K35sWJWqmP2ShHhMiZoa8DVU4UjDF/7RmxLB98Q==
X-Google-Smtp-Source: AGHT+IEyeEd+YmW1ElXSMWlGNBIbSjnJ686ocEUtx/vkJsI/HbYPN0Ib4cxLvb7P2uWVdDqkJpUOfJUu6YpaPjdJ3OM=
X-Received: by 2002:a05:6902:4cc:b0:dc2:58af:2af7 with SMTP id
 v12-20020a05690204cc00b00dc258af2af7mr2987912ybs.22.1707302913682; Wed, 07
 Feb 2024 02:48:33 -0800 (PST)
MIME-Version: 1.0
References: <20240131071910.3950450-1-wenst@chromium.org>
In-Reply-To: <20240131071910.3950450-1-wenst@chromium.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 7 Feb 2024 11:48:47 +0100
Message-ID: <CACRpkdbRY70+Er-=Xv338j68NgjEKZeD5FYW9GqFY-68sCBvgA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: mediatek: Drop bogus slew rate register
 range for MT8186
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_024836_166239_ED602A8E 
X-CRM114-Status: UNSURE (   9.47  )
X-CRM114-Notice: Please train this message.
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

On Wed, Jan 31, 2024 at 8:19=E2=80=AFAM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> The MT8186 does not support configuring pin slew rate. This is evident
> from both the datasheet, and the fact that the driver points the slew
> rate register range at the GPIO direction register range.
>
> Drop the bogus setting.
>
> Fixes: 8b483bda1e46 ("pinctrl: add pinctrl driver on mt8186")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patches applied!

Yours,
Linus Walleij

