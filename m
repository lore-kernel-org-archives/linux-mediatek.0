Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FEEC27C7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 09:04:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q+3Vz3i2TsdrpjkC9PcCy29rOh22Klo7SY6unJ5sDoA=; b=nWYFL4iFshOiPy
	EeWLHn+Gx1rzPPh92eFKYf+lk8GjGUohX3SBC/ikYuaC5p58gAURW7jWka2O0QGTopOQkMF5eUER1
	8qEI6nyP/z2SrhQ0gaw+yR5ip5H7DHdv6fSWfLxsKeuktfLY97ODpkC40v0oN3E7DwETni3xTA95Z
	KIwsONWWGY31im5kc2cyJOyqnKy8xWSLcH64kdKEhoBwPM1g6HZggmETzbIfZpkR0xsFs6fgdyTNR
	D2Q6NMu2S9f48i7g1z5MSFxEuHlCyeS3XsBHU8mv5kMjMWwDwJ1CKtwDMH4i3ElA938cTJaYJ4Duz
	uIX+tNcMKzz5vqNeCdTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8I3-00000009wjN-32kj;
	Mon, 17 Jun 2024 09:04:39 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ8I0-00000009wiM-1jp3
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Jun 2024 09:04:37 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-52c84a21b8cso3800290e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Jun 2024 02:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718615075; x=1719219875; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q+3Vz3i2TsdrpjkC9PcCy29rOh22Klo7SY6unJ5sDoA=;
        b=ce18+rsq7zcdnH/5oMzB0bF6i/x4u/2iKYGMOxdNKAjeRDBn7whVA6vspaxX9knQ6c
         VvqFDuda3cBHgxzkDJWTv5ZtadMKAkiKc9iR9wU/DJzZTU7e51RrGLrRemv0KjVS4DTb
         lvWPd/DfKWCKuNhuLwv21xo7Z5Ih4XyUZv5LEVQoQvoC9v9O3X8c1lvUPfEInJSE6MYH
         khD1QEJudnSfsM9wEiITWR7zSguMMHR3R1F94etEtb3OJjCKP6VVmunPrqEcGFKvSbSY
         2+wIxyxaYdxa15OWJBOVM2wzX2wIWCbShaH7b/bWzHMIWq48CdyEaaF77rEAv0s2qGVn
         gtzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718615075; x=1719219875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q+3Vz3i2TsdrpjkC9PcCy29rOh22Klo7SY6unJ5sDoA=;
        b=JfyDVsDxJiLyriYd3+IRrv9pwgf9ctaa8IU5Lqci7MeFMwFciKMKHVg/y3Wuky3XXv
         1Z8gkli4+57/R/wgFOLM2Qb5pDHsm+X4GP8tOlDVT/gbNzawHsypWZA7Ju0UucrKrUTS
         G6WgNogSrJSQjZRff0XO20Pa3J7ZtBd4yPJ19gz1YT3wVFiz34G06+JYew73rK8E6IjD
         eKN33J1UkrZ4qKOzFalVkUfdRI+SGCeToGeqIHw6HtCNBcLzQ1vpSzyEF/QjV1qTpVU9
         w5xgEL2kfTgvbECrXuz1YN8ORQd4CE3U7MNteFC9lHVzRePIcxFObqsrdd2mS5h4xlUK
         RlfA==
X-Forwarded-Encrypted: i=1; AJvYcCWLrGDFFjZiIYhE8nFGHKmnYNdlj8VyY4ZTGznvxF6QX4j1+DvUx6F7xHzXYelmK1BI5b5K8oNVsLAf5Dn9EIqSaXYnMu9aqdjk6DwZXDSyaxda
X-Gm-Message-State: AOJu0YwYiAJbk2CidumWawzXc6+x+JYrA8brvPrbEsInXEktnTgbNuN7
	o+JffkBi1Okh7igD58VWj0KW/jSgEFENHrClGF7YFH4ePJv6mwgmIDirNmhMziVAH9z14UxGAjb
	PgQfuM4UPtwSbzG2fdC7Y4VizefMvJnSHTUfqqw==
X-Google-Smtp-Source: AGHT+IF+HJZcRpUbZaoti30eFGkz57My4se7oV+eTI19fCyAo/6voMtDXYoZMTNQnN/HrQtJfz8h91nbF6hk4mFYQKI=
X-Received: by 2002:a05:6512:ba0:b0:52c:8dea:c56f with SMTP id
 2adb3069b0e04-52ca6cc6e6bmr3777612e87.25.1718615072794; Mon, 17 Jun 2024
 02:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240611102744.v2.1.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
In-Reply-To: <20240611102744.v2.1.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 17 Jun 2024 11:04:21 +0200
Message-ID: <CACRpkda4KbfWnMwFyJAFKeyvJ3A32D1WuEQd=VQpQcg02-+32Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: Call drm_atomic_helper_shutdown() at
 shutdown time
To: Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_020436_461333_3BA23D4A 
X-CRM114-Status: GOOD (  16.32  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Daniel Vetter <daniel@ffwll.ch>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jun 11, 2024 at 7:28=E2=80=AFPM Douglas Anderson <dianders@chromium=
.org> wrote:

> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
>
> The fact that we should call drm_atomic_helper_shutdown() in the case
> of OS shutdown/restart comes straight out of the kernel doc "driver
> instance overview" in drm_drv.c.
>
> This driver users the component model and shutdown happens in the base
> driver. The "drvdata" for this driver will always be valid if
> shutdown() is called and as of commit 2a073968289d
> ("drm/atomic-helper: drm_atomic_helper_shutdown(NULL) should be a
> noop") we don't need to confirm that "drm" is non-NULL.
>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Reviewed-by: Fei Shao <fshao@chromium.org>
> Tested-by: Fei Shao <fshao@chromium.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

