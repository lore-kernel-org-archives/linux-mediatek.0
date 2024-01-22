Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75496C47DAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 19:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcfV4G80rpL7Zj8hqdvDy9KXYlP8un4/Y9DH9fl7gQw=; b=iJalZ0DCW6rDKDNmiS2J32YlqK
	pLjRLH3XwQO56aJ2BpuDJR5IWJB2hvnlwGePGj1fnl25u4aLBUrzPU84NpcI8C+jRryS79cEDa9xM
	PUNMoDvp4Q1bMr4BKi1tTzGXAVlUlF43Pyg95BLxOp1sOaV33Ss0nX5fgxPeQF8flDCzW7MM2nrJV
	aG5ZLVOYQBnzsqUq5X0GGbEZoDrPVbOGGBS69PvU+jKiJ1NL+pnkoQLjzck25rofq8upXHiQxKGYq
	zvwlEm/AgREPkrRegNIlDG3cops6zs1sY5ZSQaxXbBiO7+93gFbM0m9TTPwarHMSO5Jitqhwen/VR
	Vmt9ZJiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRzuB-00DiQ7-2t;
	Mon, 22 Jan 2024 19:24:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRzu8-00DiOD-0h;
	Mon, 22 Jan 2024 19:24:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7EAD7CE2C65;
	Mon, 22 Jan 2024 19:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FBDEC433C7;
	Mon, 22 Jan 2024 19:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705951455;
	bh=MEXKZHQkB/IyiyQVHXrZDxlLURiVSiUhivYGVZLcqn0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Om7TXwRG+RLb91NjkMlGtbBbQYrAGinHi8YBBuORygdejt7BZ+vQd9Bqs0sBl/BxP
	 VCw1yjmez+FHyuigs8WrRG3xG5dxGPTpaOT2qYeFl6QHLeQijLl0kkOlguh3EaCef5
	 +AkOU52pnihuLtq9XxoisJbYHmdBJ7MWGdIGbaT+Hqd1d3bAs/JdGsBZD+YdEjOqeP
	 eiYtqYfgWpXt9iSL4haLcS9baDm6slcDBeeq4Pri4phWer/ACYdMdlNEE7R3pgjieo
	 tFpdEkRwqJLtm9GAX85YeLj+l6gbxcnR7JUDJE+8uHr22Geysx+TUOYD6M7QtotXaK
	 eSyrD1CGdOh3w==
Date: Mon, 22 Jan 2024 19:23:43 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>, Wu Hao
 <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>, Tom Rix
 <trix@redhat.com>, linux-fpga@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>,
 Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, linux-wpan@vger.kernel.org,
 netdev@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Michael
 Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, Dmitry
 Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, Ulf
 Hansson <ulf.hansson@linaro.org>, Rayyan Ansari <rayyan@ansari.sh>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Martin Tuma
 <martin.tuma@digiteqautomotive.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, linux-media@vger.kernel.org, Sergey Kozlov
 <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Yang Yingliang <yangyingliang@huawei.com>,
 linux-mmc@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, Amit Kumar
 Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
 linux-mtd@lists.infradead.org, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>,
 Simon Horman <horms@kernel.org>, Ronald Wahl <ronald.wahl@raritan.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Max
 Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, Thomas Zimmermann
 <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Amit
 Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>, Rui
 Miguel Silva <rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>, Alex
 Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, Peter Huewe
 <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, Herve Codina
 <herve.codina@bootlin.com>, Alan Stern <stern@rowland.harvard.edu>, Aaro
 Koskinen <aaro.koskinen@iki.fi>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org, Helge Deller
 <deller@gmx.de>, Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>,
 libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, James Clark <james.clark@arm.com>, Bjorn Helgaas
 <bhelgaas@google.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 00/33] spi: get rid of some legacy macros
Message-ID: <20240122192343.148a0b6d@jic23-huawei>
In-Reply-To: <e62cdf7f-ce58-4f46-a0a0-25ce9fb271b1@sirena.org.uk>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
	<e62cdf7f-ce58-4f46-a0a0-25ce9fb271b1@sirena.org.uk>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.40; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_112420_605356_529C66A6 
X-CRM114-Status: GOOD (  16.61  )
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

On Mon, 22 Jan 2024 18:18:22 +0000
Mark Brown <broonie@kernel.org> wrote:

> On Mon, Jan 22, 2024 at 07:06:55PM +0100, Uwe Kleine-K=C3=B6nig wrote:
>=20
> > Note that Jonathan Cameron has already applied patch 3 to his tree, it
> > didn't appear in a public tree though yet. I still included it here to
> > make the kernel build bots happy. =20
>=20
> It's also going to be needed for buildability of the end of the series.

Ah.  I thought intent was to split this across all the different trees
then do the final patch only after they were all gone?

I'm fine with it going all in one go if people prefer that.

My tree will be out in a few mins. Was just waiting to rebase on rc1
which I've just done.

Jonathan

