Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17132C48286
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 21:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:Cc:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONdXqAS27cKeOgWX4XGTKCxg4rE0mzWElHVnnYMMb0Y=; b=e3aqA/m/BtNsxylrzvP9Kb6Duu
	SiYypq5HrVCgfzcXVZpiscb14WbX6pc8o/FShIpke1zXfRuck8K+xGmqvam6eBUfBQ/jVLN9a5sbx
	iHLqy0J39u5Nh+s11d5cKAfh/KznjfzNmDShiOzZBpyiuSi/+K2oaW7DGmpA9Gw0eSzGRX7xCkSns
	BtanZje7W1+zfRajU8iuIQh/Vbc5ZWjyKTZcYYgdyELSS9solqPnDUqX2U2NHjJQRV7flXfaoF1YF
	k00tQDXQXxs6r7kcbjWqB2GrrArW0RLUZpYbAQMlDMTp4Qv3LgmizG91S3BWlpEsbA72gg0GDuIzf
	m2VDL6yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVeuJ-00000009RX8-07nI;
	Thu, 01 Feb 2024 21:47:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVeuF-00000009RWA-09xh;
	Thu, 01 Feb 2024 21:47:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88A646218F;
	Thu,  1 Feb 2024 21:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEB5C433C7;
	Thu,  1 Feb 2024 21:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706824052;
	bh=ONdXqAS27cKeOgWX4XGTKCxg4rE0mzWElHVnnYMMb0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYhAJw//yARcM3TA6pVCkI4LUiBLE5XWbQdyIJ2IOE9XeeW9PXuRT0u1fpPxxrkwp
	 Hurjt/dBf8xwi23T1FksMdv9e36XHyjvhrDNFhBSr1xRnTYLMYbJE3ILCL/Xokm/MD
	 5zQO0eFXQidwjXeacacwmmo5pMdGivYcXVl5OsSlyzb4uDD6zF3QHkW/ipNCSyCrkX
	 ruFySuh4tDJV4Rf4YFiYpBgTsdWdhvZKAcl5M+3wneiWVFJ2zo1QtBfWDecyRoxa73
	 fETXEmGDyXWVSu/j1Xloaznpi7OcrAoyx70CgInqn+hTw2H52XDK3rA5SorsXzUwVT
	 KByKrTZWMbAOA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Feb 2024 23:47:13 +0200
Message-Id: <CYU2MG4IOJ0Q.2UJOTK999FCCC@suppilovahvero>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Mark Brown" <broonie@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 <kernel@pengutronix.de>, "Moritz Fischer" <mdf@kernel.org>, "Wu Hao"
 <hao.wu@intel.com>, "Xu Yilun" <yilun.xu@intel.com>, "Tom Rix"
 <trix@redhat.com>, <linux-fpga@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Alexander Aring" <alex.aring@gmail.com>,
 "Stefan Schmidt" <stefan@datenfreihafen.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo
 Abeni" <pabeni@redhat.com>, <linux-wpan@vger.kernel.org>,
 <netdev@vger.kernel.org>, "Lars-Peter Clausen" <lars@metafoo.de>, "Michael
 Hennerich" <Michael.Hennerich@analog.com>, "Jonathan Cameron"
 <jic23@kernel.org>, <linux-iio@vger.kernel.org>, "Dmitry Torokhov"
 <dmitry.torokhov@gmail.com>, <linux-input@vger.kernel.org>, "Ulf Hansson"
 <ulf.hansson@linaro.org>, "Rayyan Ansari" <rayyan@ansari.sh>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Martin Tuma"
 <martin.tuma@digiteqautomotive.com>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, <linux-media@vger.kernel.org>, "Sergey Kozlov"
 <serjk@netup.ru>, "Arnd Bergmann" <arnd@arndb.de>, "Yang Yingliang"
 <yangyingliang@huawei.com>, <linux-mmc@vger.kernel.org>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob
 Herring" <robh@kernel.org>, "Heiko Stuebner" <heiko@sntech.de>, "Michal
 Simek" <michal.simek@amd.com>, "Amit Kumar Mahapatra via Alsa-devel"
 <alsa-devel@alsa-project.org>, <linux-mtd@lists.infradead.org>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 "Simon Horman" <horms@kernel.org>, "Ronald Wahl" <ronald.wahl@raritan.com>,
 "Benson Leung" <bleung@chromium.org>, "Tzung-Bi Shih" <tzungbi@kernel.org>,
 "Guenter Roeck" <groeck@chromium.org>, <chrome-platform@lists.linux.dev>,
 "Max Filippov" <jcmvbkbc@gmail.com>, <linux-spi@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 <linux-arm-msm@vger.kernel.org>, "Matthias Brugger"
 <matthias.bgg@gmail.com>, "AngeloGioacchino Del Regno"
 <angelogioacchino.delregno@collabora.com>,
 <linux-mediatek@lists.infradead.org>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "Javier Martinez Canillas" <javierm@redhat.com>,
 "Amit Kumar Mahapatra" <amit.kumar-mahapatra@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>,
 <linux-staging@lists.linux.dev>, "Viresh Kumar" <vireshk@kernel.org>, "Rui
 Miguel Silva" <rmfrfs@gmail.com>, "Johan Hovold" <johan@kernel.org>, "Alex
 Elder" <elder@kernel.org>, <greybus-dev@lists.linaro.org>, "Peter Huewe"
 <peterhuewe@gmx.de>, "Jason Gunthorpe" <jgg@ziepe.ca>,
 <linux-integrity@vger.kernel.org>, "Herve Codina"
 <herve.codina@bootlin.com>, "Alan Stern" <stern@rowland.harvard.edu>, "Aaro
 Koskinen" <aaro.koskinen@iki.fi>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, <linux-usb@vger.kernel.org>, "Helge
 Deller" <deller@gmx.de>, "Dario Binacchi"
 <dario.binacchi@amarulasolutions.com>, "Kalle Valo" <kvalo@kernel.org>,
 "Dmitry Antipov" <dmantipov@yandex.ru>, <libertas-dev@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "James Clark" <james.clark@arm.com>, "Bjorn Helgaas" <bhelgaas@google.com>,
 <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v2 00/33] spi: get rid of some legacy macros
X-Mailer: aerc 0.15.2
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
 <2024012417-prissy-sworn-bc55@gregkh>
 <c1e38a30-5075-4d01-af24-ac684e77cf29@sirena.org.uk>
In-Reply-To: <c1e38a30-5075-4d01-af24-ac684e77cf29@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_134735_191223_BE637629 
X-CRM114-Status: GOOD (  12.79  )
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

On Wed Jan 24, 2024 at 7:22 PM EET, Mark Brown wrote:
> On Wed, Jan 24, 2024 at 09:13:49AM -0800, Greg Kroah-Hartman wrote:
> > On Mon, Jan 22, 2024 at 07:06:55PM +0100, Uwe Kleine-K=C3=B6nig wrote:
>
> > > Note that Jonathan Cameron has already applied patch 3 to his tree, i=
t
> > > didn't appear in a public tree though yet. I still included it here t=
o
> > > make the kernel build bots happy.
>
> > Are we supposed to take the individual changes in our different
> > subsystem trees, or do you want them all to go through the spi tree?
>
> Given that the final patch removes the legacy interfaces I'm expecting
> to take them via SPI.

+1

least fuss approach

BR, Jarkko

