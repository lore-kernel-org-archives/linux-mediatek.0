Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFEBDD58CA1
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Mar 2026 22:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHlux91S1pcszks5LnQqDKbd7Lhdihe1iwVw4ZIiPgU=; b=JrP5neavnW4B4Edv5VubBFIV8T
	nvxwNRSXXr+4EyKDRzcx5Kg1mK7vyMF6boRbqZaief/mp37Bso+XxtDYd7qSaL8aWGuv/jFAygG2H
	ae/Ep8XfX4fjXEY3Imp6ER0xnAGaS7131hfy/5wAFgp7EfwSbBs6CtWeQzLuuR+kvNNWJM3q3fLTi
	6Knv75gBU3OYyehedC65DDJOntli6aunSaQ9zmkArtJbumGN5lmoH57zVjf1akWCMVYH5T6P+1fMx
	uMz3IY4fWEW//uYBbrc2Bz6y9r/6rAlmhiLcyX0F5t5fORvTVtdJ9AnA4V84PNd16z04DR+jEhLgB
	5TnVkFGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4RDk-0000000FiQZ-0q8O;
	Sun, 22 Mar 2026 22:24:32 +0000
Received: from mail-dy1-x132d.google.com ([2607:f8b0:4864:20::132d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4RDg-0000000FiPq-2kn4
	for linux-mediatek@lists.infradead.org;
	Sun, 22 Mar 2026 22:24:30 +0000
Received: by mail-dy1-x132d.google.com with SMTP id 5a478bee46e88-2c0ecaae7dfso6138580eec.1
        for <linux-mediatek@lists.infradead.org>; Sun, 22 Mar 2026 15:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774218267; x=1774823067; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wHlux91S1pcszks5LnQqDKbd7Lhdihe1iwVw4ZIiPgU=;
        b=gxd8CJTZ9AQODd25sqVcrR1WH+FRPYbsmqZHvqGDv56KQbQ3qbIfAz83UJWdMuLZNH
         XXw4ctwRdZkj/cg5vMeh1IwuGpNzRXqHGO+o0S3/9j0P46H3YgcObQqrf9N4G3gQGKBz
         TNQ+D35/iC9AQ8CdEHsfk0pjKajVKikrel5ujvhRh3mKuUD4dpI6UNKLKNFHXZlD7cBk
         jGH7Pmpv8Xd7B6NlpZdo/XNquSIstvFioTJMFLGc2YT/jEUGtP/YqcP6hLISvAjg3W2e
         LGB8BaCCHKXqUr6+EEDrau/M1A8YkFxr6/U5vUTRs+uArut5Jl6eqX2ZuQzuzR9DEnMi
         8S3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774218267; x=1774823067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wHlux91S1pcszks5LnQqDKbd7Lhdihe1iwVw4ZIiPgU=;
        b=QAXuQ8zsSzhExYwtjfTlFgok9pug8SfnypUE7r0JRmS1kZ1syh2MvxHFG1ZF/m8yrJ
         78kia6HIsbHIQ5yWxZLv8QX5kCGmreCRrt2jc/YdzHDYjWifE5+NO18Qpri86WQlf9W2
         mm5YNTpO1X441kFAXNTXtHkAPiNayTGrH8HHeJRaWFuEHYbbV30pnpLfvrfR/46qOmTz
         Do5fyw91FvWgZOKMOFuXEDX+f2KgiWiD0ELqH0uUsUT50VS2MSZ4+6jhARwPJO1SLzwP
         I476ubaYuE+bt/WN57I96V5xdlbtHnLfpVFuEbWb+EYwAr48I4YGZcfsQUQzk/y5z31o
         4YXg==
X-Forwarded-Encrypted: i=1; AJvYcCV4GqSOIAZ9hHbtZeX9HA9ZJAqkbIKYvQ1GE5518XID6sEpy/xdTPrNn5NzCBgQfWEf2IqVG8UTO2aHwzL1Yg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyIP60PIIXcVgozvFLI0nEQCnTxrKZxEnS+4itGsApN1PyGHYDk
	59GcA6SRq4rcoeeYY4pIdyCVgEpGOBtfczCl2IWMJTj54mTLmi0AVazP
X-Gm-Gg: ATEYQzwpHF49oXaP8SYWujnBwqwYY+9rh/d15+DmLC+WWxjVknQR3I2TJ7lZ1ZlvKjj
	auUVwt6/+QFTCxE4XBc4kmTdZlI/cnAAepMcjewOf+/WJYeceg3GibNFed5d50aorb2BGLTV1jb
	vP3K/a3mznZCT0Gg8rcbpd6+oFe5RGVWRMT0ns17gTpbe3rsNOZMohuPbFB1AAZF/mVX1BeCGAS
	3K/RtrPdwKtkB3HZfqrrexhD2PKWXJr3W8hU+8NFMFIbF2lDYfE0dxdDr7GVA7YPLwW0F9ZIxBc
	RUUaQh93rA4y1rMRkOF20kHE/ywP6RfiZgzAOXo6rAwf3vE95xfs/Tbkk6IxO9rUh2Py8xg5Bir
	aWs90RJ1r0azRFuCJKDZrM04WTQ6GiCDfVN0+ipveUe0qDHP6BFDh06gKc36s2TcXZi1ZV9iNCX
	zi5F1of0P86yrdz7YN34bVNeS1Ec7/q+i+K8JP2EdwKC+sHEr3RJ0IEw4VHNilfFYXmIlKtpj+b
	mA=
X-Received: by 2002:a05:7300:134a:b0:2c1:7ca:ceb1 with SMTP id 5a478bee46e88-2c109567522mr4864099eec.6.1774218266887;
        Sun, 22 Mar 2026 15:24:26 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:b768:22ed:3eba:aeb3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b1a88e5sm13452469eec.13.2026.03.22.15.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 15:24:26 -0700 (PDT)
Date: Sun, 22 Mar 2026 15:24:21 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Romain Gantois <romain.gantois@bootlin.com>
Cc: MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Guenter Roeck <linux@roeck-us.net>, 
	Peter Rosin <peda@axentia.se>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Mariel Tinaco <Mariel.Tinaco@analog.com>, 
	Kevin Tsai <ktsai@capellamicro.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Eugen Hristev <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Hans de Goede <hansg@kernel.org>, Support Opensource <support.opensource@diasemi.com>, 
	Paul Cercueil <paul@crapouillou.net>, Iskren Chernev <me@iskren.info>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Matheus Castello <matheus@castello.eng.br>, Saravanan Sekar <sravanhome@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Casey Connolly <casey.connolly@linaro.org>, 
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-phy@lists.infradead.org, linux-pm@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2 2/2] iio: inkern: Use namespaced exports
Message-ID: <acBr-W2ILu9tnMyd@google.com>
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
 <20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_152428_694614_31AE3833 
X-CRM114-Status: GOOD (  12.87  )
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

On Tue, Dec 09, 2025 at 09:25:56AM +0100, Romain Gantois wrote:
> Use namespaced exports for IIO consumer API functions.
> 
> This will make it easier to manage the IIO export surface. Consumer drivers
> will only be provided access to a specific set of functions, thereby
> restricting usage of internal IIO functions by other parts of the kernel.
> 
> This change cannot be split into several parts without breaking
> bisectability, thus all of the affected drivers are modified at once.
> 
> Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> # for power-supply
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>

For input:

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

