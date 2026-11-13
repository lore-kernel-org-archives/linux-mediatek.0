Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88AF607E040
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 17:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NAfKYjsF;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ibjhmY4D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6h0Dqd6RFqs20ugxkWa0E6efevDQATF3OOGQG5vDX9E=; b=NAfKYjsF+Lp5zd
	6MU2ELW4lQk8yhWBIzdVQvkkPi/MfyaCk0tQ5hAjek/rfgGXH/0J3u+D5dN9z7Dr7CUgDw+TnPR3p
	eVCbt10KEEVaF3NNkq1DfIL67XiVkLl8x5rIaXM0DVdvPcCh21ICzAZTOg9IO0SjNl2+VnWdzK9bn
	eHFgNmtl1G6pRomutIQRdkgqim7Qp3+V5q/eORILmTZdoUwXmuVsGkmgSWGEgtH3GCIer3YhEZISM
	tVCPPYg830FBUdGsqAbN5YCwmD7mhu01qsQK5O4A7yyYAAOFglo7EWpxmZzqzXLAlt05CH5v+fa3s
	Ih5pSBNABQrWA7/Hp7+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvQS-0000000Dnt8-1wGr;
	Fri, 13 Nov 2026 17:51:00 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvQO-0000000DnsF-1v7c;
	Fri, 13 Nov 2026 17:50:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D596A4E415AB;
	Fri, 13 Nov 2026 17:50:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8F52B60015;
	Fri, 13 Nov 2026 17:50:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 561B311BC12A2;
	Fri, 13 Nov 2026 18:50:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794592247; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=6h0Dqd6RFqs20ugxkWa0E6efevDQATF3OOGQG5vDX9E=;
	b=ibjhmY4Dn2tURhTrqtGtPu8gNw82Ui+RZy0Yt98PWN259aeg897IKBTUcITcGEvrW7wwn9
	1fO5y4X0k0HqrmMMa7u8a+UJW3xl/JHWBIDW+LCgxMI0cJZAql0PuT6zK/Gomq/FdAYNn5
	TqfhDwBA0EOu8JNSaFNINtgAg5raHVqeI/2l2LFC5EXi4oKCdfH4gEIIrIFYX/MT2B0uqt
	wVVViFZh9M9znX2iKYCwGBQpRHbIbaIqJ/KJeVY9uA1Prk5Q8pvPAlqauPat1U1/4OisOZ
	m4otyYcG125i7g5fWqP0e0N9DpGR7D4GUwQ0a5+qoo+oJBNQZ2g5lngk3Djtrw==
Message-ID: <5a68f043-7c9a-44ef-b297-2821886bdcfe@bootlin.com>
Date: Fri, 13 Nov 2026 18:50:22 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/27] mfd: Assorted resource lifetime, teardown, and
 error-handling fixes
To: Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Andi Shyti <andi.shyti@kernel.org>,
 Andreas Kemnade <andreas@kemnade.info>, Andy Shevchenko <andy@kernel.org>,
 AnilKumar Ch <anilkumar@ti.com>, Arnd Bergmann <arnd@arndb.de>,
 Binbin Zhou <zhoubinbin@loongson.cn>, Brent Casavant <bcasavan@sgi.com>,
 Chong Qiao <qiaochong@loongson.cn>, Corey Minyard <corey@minyard.net>,
 David Lechner <dlechner@baylibre.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Felipe Balbi <balbi@ti.com>,
 Gyungoh Yoo <jack.yoo@maxim-ic.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Jonathan Cameron <jic23@kernel.org>, Joshua Kinard <linux@kumba.dev>,
 Kai Svahn <kai.svahn@nokia.com>, Kevin Hilman <khilman@baylibre.com>,
 Kumar Sanghvi <kumar.sanghvi@stericsson.com>,
 Linus Walleij <linusw@kernel.org>, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-omap@vger.kernel.org,
 Mattias Nilsson <mattias.i.nilsson@stericsson.com>,
 Mattias Wallin <mattias.wallin@stericsson.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>, mfd@lists.linux.dev,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Milo Kim <woogyom.kim@gmail.com>, Ming Yu <tmyu0@nuvoton.com>,
 =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Pantelis Antoniou <panto@antoniou-consulting.com>, Pat Gefre <pfg@sgi.com>,
 Paul Burton <paulburton@kernel.org>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Qunqin Zhao <zhaoqunqin@loongson.cn>,
 Rabin Vincent <rabin.vincent@stericsson.com>, Rachna Patil <rachna@ti.com>,
 Roger Quadros <rogerq@kernel.org>, Samuel Ortiz <sameo@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Shi Hao <i.shihao.999@gmail.com>,
 Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
 Stanislaw Skowronek <skylark@unaligned.org>,
 Stephen Warren <swarren@nvidia.com>, Sundar Iyer
 <sundar.iyer@stericsson.com>, syed khasim <x0khasim@ti.com>,
 Thomas Bogendoerfer <tbogendoerfer@suse.de>, Tony Lindgren
 <tony@atomide.com>, Yinggang Gu <guyinggang@loongson.cn>
References: <20261027093306.2812695-1-lee@kernel.org>
 <179458365250.76424.12505088783548230611.b4-ty@b4>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <179458365250.76424.12505088783548230611.b4-ty@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_095056_641576_B8F3B738 
X-CRM114-Status: UNSURE (   8.29  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Lee,

On 11/13/26 4:27 PM, Lee Jones wrote:
> [26/27] i2c: cgbc: Propagate hardware errors when polling read status
>         (no commit info)

I noticed you did not applied this patch. It conflicts with my ongoing
series "Congatec Board Controller: Add storage devices support". For the
V5 I rebased it on top of Krzysztof's series that you applied and this
series.

I don't know what is your plan for this patch. Will you apply it? Should
I pick it into my series, or should we have to deal with I2C tree?
Please let me know.

Best Regards,
Thomas

