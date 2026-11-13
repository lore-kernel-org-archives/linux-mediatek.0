Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C96606A88C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 15:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=earsyvSK;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WZu7uyDc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=dn1PYMhmAemnRiDJqW2cW62E5ZzPoGIhWGuklhK85T4=; b=earsyvSK9ecdCg
	YeIQeXQImWLkBDC3i8jjx1lDrNNYYU7GoIjjx/PjMrWn28Z5z+8/ZWn9bVDoylp9yb/nu9cAONQPa
	J4mxcyTE3A8A+ZZiMd335rvUdUoQSmVat0cZzOJt3wF7opQarlgxl1buLJb3x8daSHncFp5H8P/GU
	rgMb4J3/dmmkY8fL0/Z9alQXlKq9Kfj9/yptyUo0vZcUZozn31ay1fgFEVgcd5ATNdLNuJ/O+FfYH
	Le8TuG092Xt0/gO6Sh9lWriGpOaJSEhYwQUcSxmcc2PGixNMbE9aMDmkqjmJR1+VBxwWQ+q6eGc84
	XdvWwjB23gywEp1sXstw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtBr-0000000DOpR-3PtL;
	Fri, 13 Nov 2026 15:27:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtBp-0000000DOoe-2Utp;
	Fri, 13 Nov 2026 15:27:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D00B627C1;
	Fri, 13 Nov 2026 15:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B411F000C4;
	Fri, 13 Nov 2026 15:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794583664;
	bh=dn1PYMhmAemnRiDJqW2cW62E5ZzPoGIhWGuklhK85T4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WZu7uyDctg0eCwV+wpjftd0x5++UZFQP/ONB5i24vRp/Dhw7pGnVM+QJ6VhLRk1FC
	 JVDSFUo9c4f1WL6yMr6G2Vd2rv6q+XzIabY08dIp8KNAKlQqDZmB19p04fsGXFV8QB
	 h/Zdf2CV4t3nzJ4kOiYATXNF8tGXDDWgEsQDfiixoa2bErw0FomcYpLFLLcKLp4o18
	 3ufw1rRI3NgqNsykygCHHQmGdmYL51p5aN3ZUNEqRNNUkQ0to2TO6x6ZcsYMVKsSZx
	 OkijanQXK9iCjcHzgEY/zX+46RJVztRuspN4xKxpNLQMXZVWvJk3II6eXn2OBSYmnU
	 pO4u4wAFhj0og==
From: Lee Jones <lee@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Lee Jones <lee@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andi Shyti <andi.shyti@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Andy Shevchenko <andy@kernel.org>, AnilKumar Ch <anilkumar@ti.com>, 
 Arnd Bergmann <arnd@arndb.de>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Brent Casavant <bcasavan@sgi.com>, Chong Qiao <qiaochong@loongson.cn>, 
 Corey Minyard <corey@minyard.net>, David Lechner <dlechner@baylibre.com>, 
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
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
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
 Stephen Warren <swarren@nvidia.com>, 
 Sundar Iyer <sundar.iyer@stericsson.com>, syed khasim <x0khasim@ti.com>, 
 Thomas Bogendoerfer <tbogendoerfer@suse.de>, 
 Thomas Richard <thomas.richard@bootlin.com>, 
 Tony Lindgren <tony@atomide.com>, Yinggang Gu <guyinggang@loongson.cn>
In-Reply-To: <20261027093306.2812695-1-lee@kernel.org>
References: <20261027093306.2812695-1-lee@kernel.org>
Subject: Re: [PATCH v2 00/27] mfd: Assorted resource lifetime, teardown,
 and error-handling fixes
Message-Id: <179458365250.76424.12505088783548230611.b4-ty@b4>
Date: Fri, 13 Nov 2026 15:27:32 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 09:30:29 +0000, Lee Jones wrote:
> These issues were reported by Sashiko.
> 
> This series addresses a collection of resource lifetime, teardown
> ordering, error-handling, and bounds-checking bugs across several MFD
> drivers.
> 
> v1 => v2:
>  - Collected Acked-by, Reviewed-by, and Tested-by tags from the list
>  - Dropped "mfd: cgbc: Zero-initialise version buffer in
>    cgbc_get_version()" in favour of Thomas Richard's upcoming central
>    cgbc_command() validation series
>  - Restored Fixes: tags (without Cc: stable@vger.kernel.org) on the four
>    non-Stable MFD cell stack-pointer clean-ups (ls2kbmc, bd96801,
>    ti_am335x_tscadc, and db8500-prcmu)
> 
> [...]

Applied, thanks!

[01/27] mfd: nct6694: Allocate USB DMA buffers with kzalloc_obj()
        commit: 962b44ae8126d8781ec26fc955a1fea5e2e1b78d
[02/27] mfd: ls2kbmc: Unregister GPIO GSI via devm_add_action_or_reset()
        commit: 6f1219f4275efd1e93bf5e7c96fa672c2be7b1c5
[03/27] mfd: ls2kbmc: Cancel reset work on teardown via devm_work_autocancel()
        commit: 4ed5d8d1418f1d787687d18b1adaecde323494cb
[04/27] mfd: ls2kbmc: Allocate simplefb platform_data on the heap
        commit: 7e6d7bd25e0c0f47cdcaac7b3546be3879acbb74
[05/27] mfd: bd96801: Allocate watchdog IRQ resource on the heap
        commit: c345011f0780b5924c9a2c7fc6a17ac00f6f2e8c
[06/27] mfd: ti_am335x_tscadc: Retrieve parent driver data via dev_get_drvdata()
        commit: 3d459ad2804581237bc23ad7c4d6b2accab63a1f
[07/27] mfd: db8500-prcmu: Make AB8500 cell and IRQ resource static
        commit: 512e96d26fef42f68d8aa7265b38ccb87f970a59
[08/27] mfd: nct6694: Do not resubmit interrupt URB on endpoint stall (-EPIPE)
        commit: 0b80f3fc196088829b020f23a324d4a7ba09a513
[09/27] mfd: ioc3: Request parent IRQ via request_irq() and free before domain removal
        commit: 7437e0842f5ade793e35e907b061407bf9167c08
[10/27] mfd: intel-lpss: Remove registered MFD child devices on probe failure
        commit: 55746e2587c6b69b322c0faa16d994397d35a639
[11/27] mfd: max8907: Manage power-off handler via devm_register_sys_off_handler()
        commit: c80daea8faed7d60467b5d2fdcb51b565768035f
[12/27] mfd: twl-core: Clear pm_power_off callback in twl_remove()
        commit: e1ef39e0adf2c344f05e0848ae22d2626300c6c9
[13/27] mfd: twl-core: Clear twl_priv pointer on teardown and probe failure
        (no commit info)
[14/27] mfd: loongson-se: Check return value of dma_set_mask_and_coherent()
        commit: ba2a6579f3c86db76dbd1bed3017267c140ba149
[15/27] mfd: loongson-se: Zero-initialise controller command structures
        commit: 781e5a3f2b0505163d97231e0be94349a0fb5b43
[16/27] mfd: loongson-se: Reinitialise completions and wait uninterruptibly for commands
        commit: 4ff8867e3fe3d70cf491625b431b6e6031f3dea7
[17/27] mfd: loongson-se: Zero-allocate driver data and initialise engine completions in probe
        commit: 5310684a8d3aa2837dcbae87b0297fe1ac7db598
[18/27] mfd: loongson-se: Prevent out-of-bounds engine access in se_irq_handler()
        commit: 28c94eeef56571ac1532a4df90a962654959802a
[19/27] mfd: loongson-se: Stop controller and mask interrupts on teardown and shutdown
        commit: c49c190dd05861286457b70357037ffd22896662
[20/27] mfd: loongson-se: Validate engine ID, DMA buffer size, and IRQ registration
        commit: ffedf030b26988c036341f2f3ed5153f8fdd7c87
[21/27] mfd: abx500-core: Unregister device ops on devm release
        commit: c4f3a69260795c48b759ac5341130edaaeeccf89
[22/27] mfd: ab8500-core: Register sysfs attribute groups via devm_device_add_group()
        commit: 42b533eb84f75015a60f5e135ae34cb621ac8f14
[23/27] mfd: tps65217: Manage IRQ domain teardown via devres
        (no commit info)
[24/27] mfd: mt6397: Manage IRQ domain lifecycle with devres
        commit: af087513b4455617454945783b24143af217e78a
[25/27] mfd: mt6397: Unregister PM notifier on probe failure and unbind
        commit: c0b211ae3636084d9fb45603c2adb328ef969dc7
[26/27] i2c: cgbc: Propagate hardware errors when polling read status
        (no commit info)
[27/27] mfd: ti_am335x_tscadc: Remove redundant ti_tscadc_dev_get() helper
        commit: c92739a23a80f5f0a7c6f3c10aa792102d252ac4

--
Lee Jones [李琼斯]


