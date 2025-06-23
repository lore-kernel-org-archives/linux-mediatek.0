Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A2B6C77B7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jun 2025 18:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45lmqAUYpUykmyRNsOjFpkel3OPLmML527QXdh0o9zU=; b=CX09y7wLfOj5tvMMJWoc2o3fKy
	1PLis21RabGeLZ2pd6acRS5oMCBtWgONw32+islHC20xjOX2hPSnJPdAFPAh6ryOimwBWWnqbZ5le
	uw1cgrc+0jq7RFa0zy821n79uCGZW3HgznNdXjsvT/tiqzA7hF0MCe3kPethUOQeb4OvyPh++gg2Q
	7w85KA/YlcBj/wynSM0mw6D5/ZVeo6JgLpm3yKCQumqNR/Ni6j82KcXU9Gz20iDvUHzCzjmVbDMXC
	eu5vzv/KXRwz1h7x0oPhZwJbuoNQEQjLNS36jXAkRvWseKVJqe10ejSu2TEXZUrZ5rTudV1JlTnNN
	sAZVWOTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTm87-00000003j87-0FUH;
	Mon, 23 Jun 2025 18:42:55 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTis0-00000003BPb-3unj;
	Mon, 23 Jun 2025 15:14:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id EC94944288;
	Mon, 23 Jun 2025 15:13:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750691640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=45lmqAUYpUykmyRNsOjFpkel3OPLmML527QXdh0o9zU=;
	b=Dk4DRySeiEHJkC5ucZz7LZZ5UhTo8qfaM+NNpNfIAmI8eb71jZ1iyZigWxGJIVUh/eddQP
	8Xl1XY+V1ya18+kaQTE+VfNrEVges9y6YeLXaGu/C3rRQVwdpYLIzr+sV2HHzE/5UmgjzB
	/+xepzhCWX1cw6Sjteg1eK+SyfTf1nG848+wARLHC34oEtB0GGeHyHyWCzEjD96U8cz4ZV
	Q9lHqj9ZKe3ogELbhBMi//RQzmrzPpFKAf5qiAiUT/AZUHomVPjE09J5Bf3w9srIdSfWcY
	Yt4Oua24qVH3rU576TSTUWjL+lZ5mN7oW47CVCJAgdJIvxqw3/Z3LAIlRF5uqQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Pan Chuang <panchuang@vivo.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,  Daniel Lezcano
 <daniel.lezcano@linaro.org>,  Zhang Rui <rui.zhang@intel.com>,  Lukasz
 Luba <lukasz.luba@arm.com>,  Markus Mayer <mmayer@broadcom.com>,  Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
  Florian Fainelli <florian.fainelli@broadcom.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  zhanghongchen <zhanghongchen@loongson.cn>,  Yinbo
 Zhu <zhuyinbo@loongson.cn>,  Amit Kucheria <amitk@kernel.org>,  Thara
 Gopinath <thara.gopinath@gmail.com>,  Niklas =?utf-8?Q?S=C3=B6derlund?=
 <niklas.soderlund@ragnatech.se>,  Geert Uytterhoeven
 <geert+renesas@glider.be>,  Magnus Damm <magnus.damm@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Bartlomiej Zolnierkiewicz
 <bzolnier@gmail.com>,  Krzysztof Kozlowski <krzk@kernel.org>,  Alim Akhtar
 <alim.akhtar@samsung.com>,  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,  Vasily Khoruzhick
 <anarsoul@gmail.com>,  Yangtao Li <tiny.windzz@gmail.com>,  Chen-Yu Tsai
 <wens@csie.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Samuel
 Holland <samuel@sholland.org>,  Thierry Reding <thierry.reding@gmail.com>,
  Jonathan Hunter <jonathanh@nvidia.com>,  Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>,  Masami Hiramatsu <mhiramat@kernel.org>,
  Thomas Gleixner <tglx@linutronix.de>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>,  Greg KH
 <gregkh@linuxfoundation.org>,  Peter Zijlstra <peterz@infradead.org>,
  =?utf-8?Q?N=C3=ADcolas?= F. R. A. Prado <nfraprado@collabora.com>,  Conor
 Dooley
 <conor.dooley@microchip.com>,  Julien Panis <jpanis@baylibre.com>,  Arnd
 Bergmann <arnd@arndb.de>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,  Colin Ian King <colin.i.king@gmail.com>,
  Raphael Gallais-Pou <rgallaispou@gmail.com>,  Patrice Chotard
 <patrice.chotard@foss.st.com>,  Jonathan Cameron
 <Jonathan.Cameron@huawei.com>,  "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>,  Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>,  Andrew Morton <akpm@linux-foundation.org>,
  Costa Shulyupin <costa.shul@redhat.com>,  Yury Norov
 <yury.norov@gmail.com>,  Cheng-Yang Chou <yphbchou0911@gmail.com>,  Caleb
 Sander Mateos <csander@purestorage.com>,  linux-pm@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  imx@lists.linux.dev,  linux-arm-msm@vger.kernel.org,
  linux-renesas-soc@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-samsung-soc@vger.kernel.org,
  linux-stm32@st-md-mailman.stormreply.com,  linux-sunxi@lists.linux.dev,
  linux-tegra@vger.kernel.org,  linux-mediatek@lists.infradead.org,
  Yangtao Li <frank.li@vivo.com>,  Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v6 01/24] genirq/devres: Add
 devm_request_threaded_irq_probe() and devm_request_irq_probe()
In-Reply-To: <20250623123054.472216-2-panchuang@vivo.com> (Pan Chuang's
	message of "Mon, 23 Jun 2025 20:30:34 +0800")
References: <20250623123054.472216-1-panchuang@vivo.com>
	<20250623123054.472216-2-panchuang@vivo.com>
User-Agent: mu4e 1.12.7; emacs 30.1
Date: Mon, 23 Jun 2025 17:13:54 +0200
Message-ID: <87a55ywkwd.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddujeefhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepffeghfejtdefieeguddukedujeektdeihfelleeuieeuveehkedvleduheeivdefnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepjedtpdhrtghpthhtohepphgrnhgthhhurghnghesvhhivhhordgtohhmpdhrtghpthhtoheprhgrfhgrvghlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhdrlhgviigtrghnoheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprhhuihdriihhrghnghesihhnthgvlhdrtghomhdprhgtphhtthhopehluhhkrghsiidrlhhusggrsegrrhhmrdgtohhmpdhrtghpthhtohepmhhmrgihv
 ghrsegsrhhorggutghomhdrtghomhdprhgtphhtthhopegstghmqdhkvghrnhgvlhdqfhgvvggusggrtghkqdhlihhsthessghrohgruggtohhmrdgtohhmpdhrtghpthhtohepfhhlohhrihgrnhdrfhgrihhnvghllhhisegsrhhorggutghomhdrtghomh
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_081405_268350_0EA41A34 
X-CRM114-Status: GOOD (  15.32  )
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

Hi Pan,

On 23/06/2025 at 20:30:34 +08, Pan Chuang <panchuang@vivo.com> wrote:

> From: Yangtao Li <frank.li@vivo.com>
>
> There are more than 700 calls to devm_request_threaded_irq method and
> more than 1000 calls to devm_request_irq method. Most drivers only
> request one interrupt resource, and these error messages are basically
> the same. If error messages are printed everywhere, more than 2000 lines
> of code can be saved by removing the msg in the driver.

[...]

> So add devm_request_threaded_irq_probe() and devm_request_irq_probe(),
> which ensure that all error handling branches print error information.
> In this way, when this function fails, the upper-layer functions can
> directly return an error code without missing debugging information.
> Otherwise, the error message will be printed redundantly or missing.

While I understand the goal and adhere to it, may I challenge the use of
a yet another intermediate function that 99% of the users will anyway
use? Wouldn't it be more straightforward to just add the error message
in the existing functions directly? If we really want an alternative, it
may be created and called in the few places where a dev_err_probe()
might not be relevant.

Thanks,
Miqu=C3=A8l

