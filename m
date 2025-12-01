Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83501D116F3
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 20:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tl4KlTdJXESH1UKuri6PD/44H7q8TPZNg4IF3xxQ4Rk=; b=QLYj3c6PmUDR6s39QjqeUDZM1o
	XQAiK1cQrcJRk4nruSbhuqAclZCyS+mOoP9+1aT/geFo4laUhlFKUbdKd6fM5w3owLDRA5TI8V4WB
	+vQz5m1kvGVDHwUJpcuftFsvQZQMMHpSpnXF+91jzB7voGXXQ+19z0R0urtW+yL6jNOJEAW1mdzs6
	XHQy9TlXIW9g7BXv5W9ut9sgX39Dwoe3ycjAt1GCrIDRVd2DP/DK05bpjTQwJdj0JIh/UdabWeWMS
	SAQ3yzFp6UxZK5sdKrvzNJ2uBy2oacjQPh64lcx8vW7EwXajEeMp+jDY4Z/qtElyqewnT2s5Zg4ds
	N2i+QF4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQAOA-00000004Uuh-2cjI;
	Mon, 01 Dec 2025 20:20:50 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQAO8-00000004Utt-0RoE
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 20:20:49 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2a484a0b7cfso6599025eec.1
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 12:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764620447; x=1765225247; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tl4KlTdJXESH1UKuri6PD/44H7q8TPZNg4IF3xxQ4Rk=;
        b=f6hpY6381vHApfLhN0FZ95pQOOWdoT8OcEyVAarol1hhZoFQ9pyPO93q7y/2pcuaz5
         fV+qLtK+Y4KEtn3dSWPUVRBHrZ+93ims/3dDC1PfxkIQAQoHn0M23GM0Y4N20JpRH+oZ
         wCK96OkMEomWnZqBn+ARmOYwr7eDGocXeSiU9PxXYeTZETnyP/2ooeIZclyFpEM9L6Ac
         C13Ii7CriLTBYLnI7tU6pEhtWG2uzPdrzpdHYVsjrFXpHM9+porQ2sC1/j/dXnPQphil
         SPVpw11UJcQvhTOMBCjdT8/53dWqQUwFZAs2wJy2fBlRMJylf9nNv2edXFIiYGy6rrrB
         +QQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764620447; x=1765225247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tl4KlTdJXESH1UKuri6PD/44H7q8TPZNg4IF3xxQ4Rk=;
        b=ZT0HN3fUYm8XqfMo9DP+P/ziQe3CEnnoOc4OPZCfE+j26lV+Srj5dtjV7BBuqYSLX+
         v9dXmEoFnpcVY93vFu2eZcMyFrpCbp9goNlShH3bL90/F6RRdnWJJfMLAuqVcxaGNZEq
         uYIVlseoSgV2hMccmq1LTckBuzlWMga6gklpsTP6R1r/b8wkQMFZ6/kmB5wfMfCvZGGn
         W7YnwYRMQp1rM8ISrqPPPswURrlOl5uQhi0ckg3Hqep5JxNpr4e7ggLOiRGtgSCBaThA
         VKa7xUzjeKlOQnixhWYkY67mOvahxNDiaHHHV0M4aMvCWfwD1o4i3Yro+J0zuSIqUd8W
         Nj3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVM/iKTfR6KxVg5vmCaV2kVLcEXbUfUQrxFGfEirTUk7tUxIJh/Vp5gAYyCNWDIUgBjmQi4pnoY0dTyJfhPag==@lists.infradead.org
X-Gm-Message-State: AOJu0YyA29hzyY0Vhspguvu7V7eNjbHKdXOXB1SP6n1LW76rwHoWPSJ0
	mJF8H5i5LJK2d47bObaw/Z3mczpJuv3oHx9Bm1OnRanBjgiXGDImEicL
X-Gm-Gg: ASbGncvNaqNQm0oxrun9f/U+qEAZAp+9VDHXZ8Zoo0tUEVTV57Va4vfIHD6NcjCqjRi
	7uFWXeFWZI9sltmicbf09ioNCU2XI+SWfoD+0WF17C27gSVK1VnbXpDIDztBvowkoi1Ub/xLcBb
	mWh1FnuHPCxpAvXz4BYZnPs4FhkTepodhblEHSV9qVFDkPydXXy1zR0joiImyJP4gdsniCQ0+Yt
	kxYk7kDxF22oXBXa15KNi/Fb/e8mR0+6MgmZy2p3ZY36lblrNHGOMbeoaJDUfn9XVrbDKR7AnOY
	CCFBi0TkquuIh8XTMPJJpwEvJ8XRWm1dgvs7ajEmvWzLtOUF92R/rds+geILfeM09bSN8izo+00
	5I3hzz+pxrbC8Y3BVQbpsgMbza1h3QkLQFVRR6EDt6ZXfuSlIG0veDBLPzpr4T0+p9PWUx8A7Qz
	IjbL4aL4ktU7SqQVDWUptf1NY=
X-Google-Smtp-Source: AGHT+IEKYg7dqAFBQA5yqyy/4gBG0pLJPO1wg8rofbFAF4WSvH7ZOKVnsnUBP8EQlCPhsTPLoRMRqg==
X-Received: by 2002:a05:7300:ce8b:b0:2a4:7dbd:1d7a with SMTP id 5a478bee46e88-2a718664ddemr19837071eec.11.1764620446566;
        Mon, 01 Dec 2025 12:20:46 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a96560986csm71991900eec.2.2025.12.01.12.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 12:20:45 -0800 (PST)
Date: Mon, 1 Dec 2025 12:20:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Rosin <peda@axentia.se>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Mariel Tinaco <Mariel.Tinaco@analog.com>,
	Kevin Tsai <ktsai@capellamicro.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Hans de Goede <hansg@kernel.org>,
	Support Opensource <support.opensource@diasemi.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Iskren Chernev <me@iskren.info>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matheus Castello <matheus@castello.eng.br>,
	Saravanan Sekar <sravanhome@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Casey Connolly <casey.connolly@linaro.org>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] iio: inkern: Use namespaced exports
Message-ID: <8d7a5210-f88c-4af2-80f8-61a390586fd2@roeck-us.net>
References: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201-iio-inkern-use-namespaced-exports-v1-1-da1935f70243@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_122048_154682_8BA66103 
X-CRM114-Status: UNSURE (   9.56  )
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

On Mon, Dec 01, 2025 at 11:59:43AM +0100, Romain Gantois wrote:
> Use namespaced exports for IIO consumer API functions.
> 
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>
> ---
...
>  drivers/hwmon/iio_hwmon.c                       |  1 +
>  drivers/hwmon/ntc_thermistor.c                  |  1 +

for hwmon:

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter

