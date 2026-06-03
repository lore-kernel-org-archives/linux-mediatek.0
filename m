Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A765CD6E69
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jun 2026 17:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ig4zCGf7+4ptZbdZZMypwYARwR0YB1sgjeMspwVj9PE=; b=3xGuJhewp7Lwa54GYniCdAEMDW
	CwFEEjsb6WYh2mGNR02Yk7hWKnF0/Q1IVYVBxbYKT2qjBAnqSCf8MkY08XCwuNIhaE79YsPLIAqle
	MgGTop8vk6V067rcgg7cAIzocw68mvajnswQdB1MX7wKWDsli1TOMfYDmGdy4QFei+CjXjYim/Z6V
	tDxtaYOLuSZjuxdes+KBDj781QIpCkQ7WEf8EALtp+YbMh6kHOLMD7ZLhGUj52QwcNr+W4aAloY49
	AfTL37NiSYAX2gAAsXv3h4o9csDCgBO+Yk/j4w4udex1LIFt0PHGz5MJ+PbNT0CctfIoQlgezM+Sf
	wu8FcjXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpHN-0000000FZHK-1TyX;
	Wed, 03 Jun 2026 17:21:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUpHM-0000000FZH0-2ijQ;
	Wed, 03 Jun 2026 17:21:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B9D56008A;
	Wed,  3 Jun 2026 17:21:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9B71F00893;
	Wed,  3 Jun 2026 17:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780507278;
	bh=Ig4zCGf7+4ptZbdZZMypwYARwR0YB1sgjeMspwVj9PE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=c18sJ7aSoq9r+i0IlOMIyM+kePG9Og4QNfkKdmvW9i9gHt/nkcyz7wt3X6sQ55+PN
	 9FCuhhMNrZDZj6AiihMI5VZ5eSGx75aw2BHqp+z8eJPDKPiawLxyWYNdzegnzvTLP4
	 SUK0v0AV8YpRWsaQN9Z7bVQvVxyvbFJIooaNjoNYh0o8y8mjZWNbqaH/2nGiGRSSjv
	 yhGhdlantZDthW2N7NtTDXBDCNyfOloZ32O+IlYOTFWGg3Gt/jq7bLRmckBoFSWC6R
	 Go6HqJDXVno0Uqebslcwu+6uFCc6/BDhadZDjKwxPxloA2uOX2Cy1qIxjyq10GIpqT
	 8FjWPlNqvKQSg==
Date: Wed, 3 Jun 2026 18:20:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Romain Gantois <romain.gantois@bootlin.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Guenter
 Roeck <linux@roeck-us.net>, Peter Rosin <peda@axentia.se>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, Mariel Tinaco
 <Mariel.Tinaco@analog.com>, Kevin Tsai <ktsai@capellamicro.com>, Linus
 Walleij <linus.walleij@linaro.org>, Eugen Hristev
 <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay
 Abraham I <kishon@kernel.org>, Sebastian Reichel <sre@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Hans de Goede <hansg@kernel.org>, Support Opensource
 <support.opensource@diasemi.com>, Paul Cercueil <paul@crapouillou.net>,
 Iskren Chernev <me@iskren.info>, Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Matheus Castello
 <matheus@castello.eng.br>, Saravanan Sekar <sravanhome@gmail.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Casey Connolly
 <casey.connolly@linaro.org>, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Amit
 Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba
 <lukasz.luba@arm.com>, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Arnaud Pouliquen
 <arnaud.pouliquen@foss.st.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Sebastian Reichel <sebastian.reichel@collabora.com>, Andy Shevchenko
 <andriy.shevchenko@intel.com>
Subject: Re: [PATCH v2 2/2] iio: inkern: Use namespaced exports
Message-ID: <20260603182052.7d23c067@jic23-huawei>
In-Reply-To: <acBr-W2ILu9tnMyd@google.com>
References: <20251209-iio-inkern-use-namespaced-exports-v2-0-9799a33c4b7f@bootlin.com>
	<20251209-iio-inkern-use-namespaced-exports-v2-2-9799a33c4b7f@bootlin.com>
	<acBr-W2ILu9tnMyd@google.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 22 Mar 2026 15:24:21 -0700
Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:

> On Tue, Dec 09, 2025 at 09:25:56AM +0100, Romain Gantois wrote:
> > Use namespaced exports for IIO consumer API functions.
> > 
> > This will make it easier to manage the IIO export surface. Consumer drivers
> > will only be provided access to a specific set of functions, thereby
> > restricting usage of internal IIO functions by other parts of the kernel.
> > 
> > This change cannot be split into several parts without breaking
> > bisectability, thus all of the affected drivers are modified at once.
> > 
> > Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com> # for power-supply
> > Acked-by: Guenter Roeck <linux@roeck-us.net>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> > Signed-off-by: Romain Gantois <romain.gantois@bootlin.com>  
> 
> For input:
> 
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> 
> Thanks.
> 

For anyone wondering what happened to this... I forgot to apply this at the
beginning of the cycle and by the time I remembered we had too much queued up
so it would have been messy to do an immutable branch.   Anyhow, I plan to
sort this at start of next cycle.

Jonathan

