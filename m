Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FAAC83F25
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 16:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/9FzCqmcyJh+8Ydz6tHP0relc2+nn3FdzXGKT9u9tC0=; b=XOkGRmarK0T4cnRzKrxonvEp8n
	R+XiJfeK+MwDleMMRhtu48+MlGuZPwA013/AbnGKKIwTJfhhUAdC/YkMgWvQDmEPiQkmIo8PyfTVD
	sDi50B6xbCQwrS3mtVYqvtsPeaXYM8zieHdhsG/btlSfOt9FOeRMfZTx9GjRW6cvsSIzFON2MeUdo
	bbQ4LpfGwlunsKN2VIPvv6Vw3kbWS5zlSrzguenifAo4CPGmoVuceYuMMGdMaVwnQO6Eyqe0DL4Po
	qDUNIhIW4NJoZSwfE4jRYYk14NZyjpvHIRIG9s1jLJNBHsvI0nA4va8kuEFk69tDOWvKvsZZKYHOK
	h04J/A/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udtiM-00000000EYq-3Rja;
	Mon, 21 Jul 2025 16:50:10 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udsJo-000000003mB-49gQ;
	Mon, 21 Jul 2025 15:20:46 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1753111241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/9FzCqmcyJh+8Ydz6tHP0relc2+nn3FdzXGKT9u9tC0=;
	b=dSUpea09yTKvaap84BHTchrX/mvRMJUc48+kcHHkQxoYAlMq1o9H91n0rEyouWUQZds+Ls
	rJWeBKpdVh+r6TVg9PcQPcuj0sZz+kTaDMsLK4KCjaOjlWQYgv4f4R/F/uiKtEsxW6IPu8
	BZs7DYrF+ZLrdRacfIavNLPjVeum/qGXpUL0kBgehfj92Ae5GBzPEau0pmYMGKZYiMUTmA
	WBzzEbBwXCWSUfsni3ElVs+D8g26iSUsJ/++lpGRihfVxdZY1aFI35kcEgLVtGeA+2qJTV
	JIM9YCZ9KB6Tup50FIIXZa38Dsi7uKFBiXUKjNhkEMalmJWrVmGFGCj4lmFI7A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1753111241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/9FzCqmcyJh+8Ydz6tHP0relc2+nn3FdzXGKT9u9tC0=;
	b=Q0GGv108K0Wx0ZlG5G8V8V0Na3jr3eUG3hFHWm0zuYoWeHBjtZZPu1Oy3mIu6+M+ntdxcb
	YsPYlYqxSgIstBDQ==
To: panchuang <panchuang@vivo.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?utf-8?B?5p2O5oms6Z+s?= <frank.li@vivo.com>, Uwe =?utf-8?Q?Kleine-K?=
 =?utf-8?Q?=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui
 <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, Markus Mayer
 <mmayer@broadcom.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli
 <florian.fainelli@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, zhanghongchen
 <zhanghongchen@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>, Amit
 Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
 <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Bartlomiej
 Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter
 <jonathanh@nvidia.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Srinivas Pandruvada
 <srinivas.pandruvada@linux.intel.com>, Greg KH
 <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>,
 =?utf-8?Q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>,
 Conor Dooley
 <conor.dooley@microchip.com>, Julien Panis <jpanis@baylibre.com>, Arnd
 Bergmann <arnd@arndb.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>,
 Colin Ian King <colin.i.king@gmail.com>, Raphael Gallais-Pou
 <rgallaispou@gmail.com>, Patrice Chotard <patrice.chotard@foss.st.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, "Jiri Slaby (SUSE)"
 <jirislaby@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Andrew Morton <akpm@linux-foundation.org>, Costa Shulyupin
 <costa.shul@redhat.com>, Yury
 Norov <yury.norov@gmail.com>, Cheng-Yang Chou <yphbchou0911@gmail.com>,
 Caleb Sander Mateos <csander@purestorage.com>, "linux-pm@vger.kernel.org"
 <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev"
 <imx@lists.linux.dev>, "linux-arm-msm@vger.kernel.org"
 <linux-arm-msm@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
 <linux-renesas-soc@vger.kernel.org>, "linux-rockchip@lists.infradead.org"
 <linux-rockchip@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org"
 <linux-samsung-soc@vger.kernel.org>,
 "linux-stm32@st-md-mailman.stormreply.com"
 <linux-stm32@st-md-mailman.stormreply.com>, "linux-sunxi@lists.linux.dev"
 <linux-sunxi@lists.linux.dev>, "linux-tegra@vger.kernel.org"
 <linux-tegra@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>
Subject: Re: =?utf-8?B?5Zue5aSNOg==?= [PATCH v6 01/24] genirq/devres: Add
 devm_request_threaded_irq_probe() and devm_request_irq_probe()
In-Reply-To: <draft-87ikjnvqfx.ffs@tglx>
References: <draft-87ikjnvqfx.ffs@tglx>
Date: Mon, 21 Jul 2025 17:20:39 +0200
Message-ID: <87qzy9tvso.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_082045_169405_EB13E51A 
X-CRM114-Status: GOOD (  14.08  )
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

On Sat, Jul 19 2025 at 23:08, Thomas Gleixner wrote:
> On Wed, Jul 09 2025 at 17:13, panchuang@vivo.com wrote:
>> Hi tglx and Miqu=C3=A8l, Just a gentle ping on this patchset. I understa=
nd=20
>> you're likely busy with many other tasks, but any feedback or guidance=20
>> on how to proceed would be greatly appreciated. As discussed in the=20
>> previous thread, there was some uncertainty about whether we should=20
>> directly integrate dev_err_probe() into devm_request_threaded_irq(), or=
=20
>> if it's better to create a wrapper function. Thanks for your time!=20
>> Thanks, Panchuang

For simplicity sake just rename the existing functions
devm_request_threaded_irq() and devm_request_any_context_irq() to
__devm_request_threaded_irq() and __devm_request_any_context_irq().

Then create new functions for the API, which

   - invoke the underscore variants
   - and on error invoke dev_err_probe() similar to what I suggested in
     my reply in this thread.

In the rare case of failure, this will print error messages for the
affected drivers both in the core and at the callsite, but that's not
the end of the world.

Then go and remove the random printks from the drivers, once the core
change has hit upstream.

Thanks,

        tglx




