Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE58D3B7ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Dec 2025 14:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4fmZfYSUNdsaSTLHpM8yeyepmqTOQi5Ko0nHpOXwYuc=; b=XP0igxqfx5bjBjbvf1s1mcy5I8
	wwA2PSQSF9/kvzNRKoCa2bQPY9ad3V7/cMGfBMCSfDmXKAyc5M03RfvAiMlw4MgKHsovEsYYQNpsM
	EJe2W+IuxubSpEf4/vNeabEatuUZSzfVQ2eHmGdAw2TH10dvlodc6/WLaeytgCuAWJh+xdTZSs5ff
	AjqGbL+mUYZyAPv1yS0e/O+KhmTGiPrD3499RY9INK8nPjjlQyF7KtI0GX5zb90FGFKrrH43vT2qb
	YmlwX38tL6DghiQ5JcpNKBtBlyRL2A/S1MKDSaa8RUXOnFS6gqXbtL3xrFi/+qltSMHjga6jrTDXm
	q9eVkcqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyyi-0000000EQ8Y-0iC2;
	Tue, 09 Dec 2025 14:46:12 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSyyf-0000000EQ7W-04mV
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Dec 2025 14:46:10 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-b79ea617f55so1090183366b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Dec 2025 06:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765291566; x=1765896366; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4fmZfYSUNdsaSTLHpM8yeyepmqTOQi5Ko0nHpOXwYuc=;
        b=GCeXD6tJ7ihBJfQyRIxSh4yD/BG10w2s0O7cn6BvRZsRkan9E4CJ+HiCTXXjSoIEpd
         rXR4wKLJaOo+WuJb9sp0d+RYTjWXVh3r3D6CtNVZGKYFb5rgvoLMAWAyNqIPYNbZmclB
         hKah2eivo4cYWYlY1OKNoDA4402WbVhxpO9KfeCsSzWaVlSx/T1y1sUot5s/hvNcXRIg
         oprMFjFFIUiQs5zFiIJYBZwYAxgXr8nyA6RrWF2+yJj8hAoEd8c3kMOvNqwVjFuJ/ZP2
         Xjyw6wfVIlKh5rzsLh+9zoF+/YNRu8WTG8MGOvsz/05av/7oO3Kc/1Lx/33krbGVIB7H
         b6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765291566; x=1765896366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4fmZfYSUNdsaSTLHpM8yeyepmqTOQi5Ko0nHpOXwYuc=;
        b=JAip6FUFxf9r18mN++aoueeW0r9nHyqu5gVbMPAt9gxrTVJqQ1IzvOHoAiWHf/rQU+
         6flAqshkAKA5MhsLVrNxBREPGQm+PD51OgzIs6kq9MpxA8hahZ6wg15Zm9EMI1z4NGgb
         RMRGL+YwHYS7WvO/eUqxP8PwQBOMkVnrZYNPevNnB7/o4+LmoR2Mgl2bZ8Ts0sAIoiXF
         bmOkjQ/YAkaxB1lWWezW4wkIhJ7vejZrvrOobZYXZdonp8rbRclVb2riEdogNz74umJV
         xlSswKPZ0CoxKQaHwKr2Y3tET9OagQdhJkb4zwG7eriTgW5okthU/o+b67pyVckk8bRS
         FJhA==
X-Forwarded-Encrypted: i=1; AJvYcCUMAbUKri1VZzsoMm2Vl+UvBP47Sv2YO2KT0wQm2AwNaq0gYEIi8TvxuFbzdw1YYx1OyBaacJMlY5m8TDwopQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWmgbeJqBTtZ9ZkpWdDTp2QaD6dxV2Px5jmDD3k05q8drbhsiM
	lYTSvKqCrv046bOB64jIoeMDfgPcNudQDNkVIf0KMwRtryb6lpD4U2NUtWXb7VIfUDWDpwgz+oL
	s4QPvQEQYXuJNlxUfhQCoXlz8qky5viQ=
X-Gm-Gg: ASbGnctsZRGw2bpXnWaCYl+yGvCQXcQD2OT3xE1JD49vQGzr7qX53Gme8E8MXPpOA3n
	78FNy+9g3YH5fjkURvw4ZJG0JDWhOE3qbEWdBUwIXwNZdtlBZwWe6FrnRlNuFcbmC+Z28TvaTFu
	l2a4ux0/ncdcgI83aj8NCN7H7sEX8nfonLUMU3YNkJpeo24MC7QpPz75eXgjgSj0GAuGUhqB6SP
	a8TYIhVTETlrXhatxP4JhKxKqpyIgIBDwnZPCod4Bke9cCj6nYelZKnQB98MKQJMw1YVsi6WevZ
	YW0L7Ea9Y8iqewJ1jxLaXLZLE4V4j045YyNaN3xCF4RpH4rk3WwSo4PqEmhcAZInukQLyCE=
X-Google-Smtp-Source: AGHT+IGlXu3dCFc83X6xkCFhuuTuzxpgBAzwDgILyS6ZUDAbBGi1U97b1Qfz8jIne/sjhUc3CyUOVqmVWZN3jo3XIyM=
X-Received: by 2002:a17:907:d9e:b0:b73:845f:4432 with SMTP id
 a640c23a62f3a-b7a2455d577mr1325347966b.32.1765291566315; Tue, 09 Dec 2025
 06:46:06 -0800 (PST)
MIME-Version: 1.0
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
 <20251209-iio-inkern-use-namespaced-exports-v2-1-9799a33c4b7f@bootlin.com>
In-Reply-To: <20251209-iio-inkern-use-namespaced-exports-v2-1-9799a33c4b7f@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Dec 2025 16:45:29 +0200
X-Gm-Features: AQt7F2rGwi5_TocOmRGciLvaWe8Y7Fghi7KYuOXmk6PhKTOAwIFDPQlb6Jsx554
Message-ID: <CAHp75VcX_z6q879gmWcb76SeFHtqMvpZ=y9PwNn0=eVFb06wAw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] iio: dac: ds4424: drop unused include IIO consumer header
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Guenter Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Mariel Tinaco <Mariel.Tinaco@analog.com>, 
	Kevin Tsai <ktsai@capellamicro.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Eugen Hristev <eugen.hristev@linaro.org>, 
	Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Hans de Goede <hansg@kernel.org>, 
	Support Opensource <support.opensource@diasemi.com>, Paul Cercueil <paul@crapouillou.net>, 
	Iskren Chernev <me@iskren.info>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Matheus Castello <matheus@castello.eng.br>, 
	Saravanan Sekar <sravanhome@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Casey Connolly <casey.connolly@linaro.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Amit Kucheria <amitk@kernel.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-pm@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_064609_071466_901CC11F 
X-CRM114-Status: UNSURE (   8.23  )
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

On Tue, Dec 9, 2025 at 10:26=E2=80=AFAM Romain Gantois
<romain.gantois@bootlin.com> wrote:
>
> To prepare for the introduction of namespaced exports for the IIO consume=
r
> API, remove this include directive which isn't actually used by the drive=
r.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

