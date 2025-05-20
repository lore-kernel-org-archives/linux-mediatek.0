Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1AB9C54E90
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 May 2025 22:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F+0KGjJEeMGYRbcevFKEOSgGE0ujrUpdmrmtWjYGodk=; b=oKw6ii7RpsXd7C4RdUHIs+OsoZ
	YareVBFIDBHEXZV1vl86TLx9KszpJSE/k5HB1VgUVa3N88Sko0OcQM4kJlfOLd7DAbCgi82v737RK
	R+ccD3DeEAJiBDuKqqtCLEiDM/Tf9Ptp5hlD7xjMM/YPrH3NCqnUdcZGPRIylyWEsnJbgE2UuXrOv
	cLc67MVnBGpVXr5Pu5+373rpBNQ7Djq6tcWDsxd50/OoU8RE0xUmsvwH8kbLQCZrcBPRiol6LGicW
	ZYSqdqYaMywLYFE85PD6VcJUBFWC1m2hlFn0sTMatkYf2/0Py6xuU4+hXJ0U1aFYq3eqGi1xXt8Sa
	IjUc4l/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHViZ-0000000EJPk-39pS;
	Tue, 20 May 2025 22:45:51 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHVf5-0000000EIud-21pq
	for linux-mediatek@lists.infradead.org;
	Tue, 20 May 2025 22:42:16 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-32805a565e6so60440491fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 20 May 2025 15:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747780933; x=1748385733; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F+0KGjJEeMGYRbcevFKEOSgGE0ujrUpdmrmtWjYGodk=;
        b=spfhbEzVNb0HsPalYUfYZkfXWLKqe1694WvJn3goNYwRgFjmSqzTiyXOnK0Is64Aqd
         6Qh4TCNEVTr6rTjovuOygexsAHnZ9pKZSETi52rfOEIoDVSvJno98opTQekIsE5zRDPe
         hLea9HVi5SWfSi0fxwNpIlSUDhKXnM1gQcCMwYxb0TPaxTLlumzmT+OreejlDama5N+l
         uavUqUwYX94US5CZ4WpQwUBvEs/ukayTr4BfCDDK0iEAWnlYmUj5dp5Z1ASKQXpWjkmr
         AwYvE3jLn3leUdSuLgq0e4IoB5hezn2jntscq3OH+L0HidfhXaVWPoa3N6wjeHbG2fKf
         U4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747780933; x=1748385733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+0KGjJEeMGYRbcevFKEOSgGE0ujrUpdmrmtWjYGodk=;
        b=eWJYUL/ZPZmTaL+ycGi/ixVbUVZw3wFu1lrZhgstGWMZ4aIsDSjFh3IOq+ReoXMRl9
         MLwAVNJFyY5sss3+yION4REVQGNEbz5DwqQVrONRKMOpweCeWKvQAKgQEoCmwn/Edcoe
         roqmJTu2MYgt9Jc58bRGa3orpUxcFIhbmjOMXeAsjM+agI9vff0Tf1U6kfLChoI/v0AJ
         F8BcfyHQxS3LIXU6UD9TTaRFPOLsfne2dhDf9TuJqnvEnfUYXaCLR/6NeW6/qUX0swMC
         SV+ofum6Cx5bF5lVOmN0urQJdO3a/bSlGpMQsvN9z4BseLHAilV6ohenK689wwMHfNCH
         0T4w==
X-Forwarded-Encrypted: i=1; AJvYcCXn7g1vBcIcASlypU1irwlRjL8b0ittK0zXILREM5kWDR58OfzSV6jSuDIMoiYkoH+xssn6G1815Y3twIT2xQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYL+E/5PyMfPIdCft1HEpcnXyKUeQwSN79mkt6HK2lRv4P3NEy
	2c+FAjpYJliilkAt/LqH8ko2DQn26tw0IEu6f+B/A/IFLMM2bpNKo8bw5mBtG39vfvXng1+sQD1
	eX4QVoIgv0WhAH7937pntRDEUWOkJ8t6KQ70smf5pvw==
X-Gm-Gg: ASbGncsdVBSOT3a2UmA+vF458HE1b9MaHuKPNCrjj63ZDy/IP7ca5OkJvjpS8wcSNMT
	PNXSmzNamsObdKIbhBHCwAhaWIhVWf0T5oialH7cuFXWhdwzmQUVzNEYfVNnEtyJbGG/JH7VWz/
	l03uau2dSIbIskT8yQzlh+DvoD7Axq4Q3p
X-Google-Smtp-Source: AGHT+IHsUCF87aJBJgdi8mRkNqubc6I4D9fZMCMetg4kSiJqDTe01fpVuT5acGVm0IsXULfYXw603PwqUKvGmPST+r8=
X-Received: by 2002:a05:651c:20d5:b0:328:d50:d7cc with SMTP id
 38308e7fff4ca-3280d50d846mr35144561fa.20.1747780933368; Tue, 20 May 2025
 15:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-genio-350-eint-null-ptr-deref-fix-v2-1-6a3ca966a7ba@collabora.com>
In-Reply-To: <20250520-genio-350-eint-null-ptr-deref-fix-v2-1-6a3ca966a7ba@collabora.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 May 2025 00:42:01 +0200
X-Gm-Features: AX0GCFsxq2qbIdoCh-TtdqObwj9pvVqees80rU3HdDEUCMiHs8dNAK0ZulTRIX8
Message-ID: <CACRpkdYor2+rCZGsZLw=_Wna=0KnyXBaVtx-VahmN6Ky-zZ-Dg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: eint: Fix invalid pointer
 dereference for v1 platforms
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Hao Chang <ot_chhao.chang@mediatek.com>, Qingliang Li <qingliang.li@mediatek.com>, 
	kernel@collabora.com, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_154215_531850_11F058FF 
X-CRM114-Status: GOOD (  16.29  )
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

On Tue, May 20, 2025 at 11:16=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:

> Commit 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple
> addresses") introduced an access to the 'soc' field of struct
> mtk_pinctrl in mtk_eint_do_init() and for that an include of
> pinctrl-mtk-common-v2.h.
>
> However, pinctrl drivers relying on the v1 common driver include
> pinctrl-mtk-common.h instead, which provides another definition of
> struct mtk_pinctrl that does not contain an 'soc' field.
>
> Since mtk_eint_do_init() can be called both by v1 and v2 drivers, it
> will now try to dereference an invalid pointer when called on v1
> platforms. This has been observed on Genio 350 EVK (MT8365), which
> crashes very early in boot (the kernel trace can only be seen with
> earlycon).
>
> In order to fix this, since 'struct mtk_pinctrl' was only needed to get
> a 'struct mtk_eint_pin', make 'struct mtk_eint_pin' a parameter
> of mtk_eint_do_init() so that callers need to supply it, removing
> mtk_eint_do_init()'s dependency on any particular 'struct mtk_pinctrl'.
>
> Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple ad=
dresses")
> Suggested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@colla=
bora.com>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

Patch applied for v6.16.

If it is needed for v6.15- then I think at this point it will need to
be backported to stable. It also does not apply cleanly on Torvald's
tree, just on my devel branch.

Yours,
Linus Walleij

