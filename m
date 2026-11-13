Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62810606B34A
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 18:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JQ3Pvl+e;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nDaMOK5u
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oKYwtAy384se2IlC59uUmr1JNttg2fedjzRBumwdbzc=; b=JQ3Pvl+eEa6+4rhXYG6AnDYRjA
	jxQ81KWALy5FLMKVTeuYKRCiNRuXT9E5zsOh1teHNiq9GEZ9CyEytPDujMlbaIHqIgTFRVnl0YOE/
	ukB2zyylgfzL5t4Hy/IfAyVPPCGEBquWJDdVFcq5J3Vu5mYXFsuFjGqFL5sfug5F4YMSCZvRACT4r
	t9i1GOtjA3ApN0noxkIWkESqmkI1vdTebS7Fgkct5lWECruJcvVNrLeROGt07kmO9DXcxr1SSO/5B
	D+0mPfDBv8bXkNs6h9Bj6OoYhWja4lcC+gNinQX2GtshKjVeYxOYhO63hBNmels5guiPMb6t8pv/Y
	1+F+lsAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwUh-0000000E3iN-46YS;
	Fri, 13 Nov 2026 18:59:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwUb-0000000E3ex-3uuu;
	Fri, 13 Nov 2026 18:59:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 696DA41509;
	Fri, 13 Nov 2026 18:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A1A1F000C8;
	Fri, 13 Nov 2026 18:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794596361;
	bh=oKYwtAy384se2IlC59uUmr1JNttg2fedjzRBumwdbzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nDaMOK5ufaeDqLt20jMUOOFsoToU8KhFAITZrzYGZ5tnRHmbk8MNbY5DTp1RyyRhY
	 pwu+PiHZ4SYlcc/o4KvRMOD8wmuah0AswpS378uqlDWhL+qtabrTTsYD3XIGAFbgAM
	 naVKXN0cCv+oFBi7TLU2v41Lva+96UI9hqUYc8wyhFgWXmAybc+i2W2Jjp9bc5A0J4
	 XqGijg3octrWxKt6+JH4v0sT3ciI7yM1CJ6pmnqlzKO6vg+r3rDUvBc9+QjNjMBSqR
	 ZWsdA5AskjJaRMxWZRo8XcFbtRa1Dfhzx6LdAUieE7Ac+ZxfJlGePWNAA+Lh4Q51Sx
	 GOzvkKh0TXAmA==
Date: Fri, 13 Nov 2026 18:59:08 +0000
From: Lee Jones <lee@kernel.org>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Andy Shevchenko <andy@kernel.org>, AnilKumar Ch <anilkumar@ti.com>,
	Arnd Bergmann <arnd@arndb.de>, Binbin Zhou <zhoubinbin@loongson.cn>,
	Brent Casavant <bcasavan@sgi.com>,
	Chong Qiao <qiaochong@loongson.cn>,
	Corey Minyard <corey@minyard.net>,
	David Lechner <dlechner@baylibre.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Felipe Balbi <balbi@ti.com>, Gyungoh Yoo <jack.yoo@maxim-ic.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Joshua Kinard <linux@kumba.dev>, Kai Svahn <kai.svahn@nokia.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Kumar Sanghvi <kumar.sanghvi@stericsson.com>,
	Linus Walleij <linusw@kernel.org>, linux-crypto@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org, linux-omap@vger.kernel.org,
	Mattias Nilsson <mattias.i.nilsson@stericsson.com>,
	Mattias Wallin <mattias.wallin@stericsson.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>, mfd@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Milo Kim <woogyom.kim@gmail.com>, Ming Yu <tmyu0@nuvoton.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Pantelis Antoniou <panto@antoniou-consulting.com>,
	Pat Gefre <pfg@sgi.com>, Paul Burton <paulburton@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Qunqin Zhao <zhaoqunqin@loongson.cn>,
	Rabin Vincent <rabin.vincent@stericsson.com>,
	Rachna Patil <rachna@ti.com>, Roger Quadros <rogerq@kernel.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Shi Hao <i.shihao.999@gmail.com>,
	Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
	Stanislaw Skowronek <skylark@unaligned.org>,
	Stephen Warren <swarren@nvidia.com>,
	Sundar Iyer <sundar.iyer@stericsson.com>,
	syed khasim <x0khasim@ti.com>,
	Thomas Bogendoerfer <tbogendoerfer@suse.de>,
	Tony Lindgren <tony@atomide.com>,
	Yinggang Gu <guyinggang@loongson.cn>
Subject: Re: [PATCH v2 00/27] mfd: Assorted resource lifetime, teardown, and
 error-handling fixes
Message-ID: <20261113185908.GI6323@joneslee-macbookpro.roam.internal>
References: <20261027093306.2812695-1-lee@kernel.org>
 <179458365250.76424.12505088783548230611.b4-ty@b4>
 <5a68f043-7c9a-44ef-b297-2821886bdcfe@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5a68f043-7c9a-44ef-b297-2821886bdcfe@bootlin.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026, Thomas Richard wrote:

> Hi Lee,
> 
> On 11/13/26 4:27 PM, Lee Jones wrote:
> > [26/27] i2c: cgbc: Propagate hardware errors when polling read status
> >         (no commit info)
> 
> I noticed you did not applied this patch. It conflicts with my ongoing
> series "Congatec Board Controller: Add storage devices support". For the
> V5 I rebased it on top of Krzysztof's series that you applied and this
> series.
> 
> I don't know what is your plan for this patch. Will you apply it? Should
> I pick it into my series, or should we have to deal with I2C tree?
> Please let me know.

I didn't merge it because it's not mine to take.

I can either take it with an Ack or happy for anyone else to take it.

-- 
Lee Jones

