Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC982606A326
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2026 10:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZXIcxzZH;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iASb0re8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=5EJSPUzg0whVepx7G/qDLZdM2wsz34VCNLXrTAyw3pI=; b=ZXIcxzZH5uTDzIOfVKh8CC/M6q
	R78411O4k5Z/jYefGAvgHN+Sn6RBOE205iLskNYcKRvEdR+LQO/6A7eNfcnOEwLsc2FnSvYKcmriu
	DPZF8DHfyq0krZZwZtjUis4ts2v0d4uxJ9kjaP6fwcVQ2/6ME/0xEgzvse2cLqKezrezxDejpShBJ
	sFEsyQAQVtDkKINl2jySiwIPAIHJUqHYyNXWQ7M5YtpksswDDgFTMrqYU8v9qNvXN1c+B/reql3Ad
	DT2SiZ+e7h6WXgri69lZUj2ON0ru9zvi6M5vRUhPKjdWSYanXb2ag/uxvGvcvTjdO4yQeghVkhkBQ
	emrQXDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeXQ-00000004J0i-1Qjz;
	Tue, 27 Oct 2026 10:36:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeXP-00000004J0W-0P5l;
	Tue, 27 Oct 2026 10:36:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C88941AF8;
	Tue, 27 Oct 2026 10:36:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC191F01825;
	Tue, 27 Oct 2026 10:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793097374;
	bh=5EJSPUzg0whVepx7G/qDLZdM2wsz34VCNLXrTAyw3pI=;
	h=From:To:Cc:Subject:Date;
	b=iASb0re8vO6SmQzI3jESEFwNxt38qBTygyrDAMU44uQSV25dLenh7KNtveoOoALIB
	 vraMrLKDeOVJPBQDRh1irshh95EmTzfsHSsNJ+c3FzgKVugeofULumW2D9m7YZEudc
	 URWw9XIS7TuXb/v5ZpgQwMhKIwLpErX/ngkDurb6vIoI5VH00LuWjtQpH1ZWqMb6tt
	 qp6UsJfvfPdgz3giYTeRGL74w5tDFtnbFn6wu2rXZV76NfCjNDclsh7qxZ05SP71jc
	 pv7FNSGRndDCszm7EQzmxXGO1ibkeHJDKG1cnZRjj09Y/zYDNQtMBo6MiqPX2fgmt3
	 epay1ZXJEKWkA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andreas Kemnade <andreas@kemnade.info>,
	Andy Shevchenko <andy@kernel.org>,
	AnilKumar Ch <anilkumar@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	Brent Casavant <bcasavan@sgi.com>,
	Chong Qiao <qiaochong@loongson.cn>,
	Corey Minyard <corey@minyard.net>,
	David Lechner <dlechner@baylibre.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Felipe Balbi <balbi@ti.com>,
	Gyungoh Yoo <jack.yoo@maxim-ic.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Joshua Kinard <linux@kumba.dev>,
	Kai Svahn <kai.svahn@nokia.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Kumar Sanghvi <kumar.sanghvi@stericsson.com>,
	Linus Walleij <linusw@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Mattias Nilsson <mattias.i.nilsson@stericsson.com>,
	Mattias Wallin <mattias.wallin@stericsson.com>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	mfd@lists.linux.dev,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Milo Kim <woogyom.kim@gmail.com>,
	Ming Yu <tmyu0@nuvoton.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Pantelis Antoniou <panto@antoniou-consulting.com>,
	Pat Gefre <pfg@sgi.com>,
	Paul Burton <paulburton@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@ti.com>,
	Qunqin Zhao <zhaoqunqin@loongson.cn>,
	Rabin Vincent <rabin.vincent@stericsson.com>,
	Rachna Patil <rachna@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
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
	Thomas Richard <thomas.richard@bootlin.com>,
	Tony Lindgren <tony@atomide.com>,
	Yinggang Gu <guyinggang@loongson.cn>
Subject: [PATCH v2 00/27] mfd: Assorted resource lifetime, teardown, and error-handling fixes
Date: Tue, 27 Oct 2026 09:30:29 +0000
Message-ID: <20261027093306.2812695-1-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

These issues were reported by Sashiko.

This series addresses a collection of resource lifetime, teardown
ordering, error-handling, and bounds-checking bugs across several MFD
drivers.

v1 => v2:
 - Collected Acked-by, Reviewed-by, and Tested-by tags from the list
 - Dropped "mfd: cgbc: Zero-initialise version buffer in
   cgbc_get_version()" in favour of Thomas Richard's upcoming central
   cgbc_command() validation series
 - Restored Fixes: tags (without Cc: stable@vger.kernel.org) on the four
   non-Stable MFD cell stack-pointer clean-ups (ls2kbmc, bd96801,
   ti_am335x_tscadc, and db8500-prcmu)

Cc: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: Andi Shyti <andi.shyti@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>
Cc: Andy Shevchenko <andy@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: AnilKumar Ch <anilkumar@ti.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Brent Casavant <bcasavan@sgi.com>
Cc: Chong Qiao <qiaochong@loongson.cn>
Cc: Corey Minyard <corey@minyard.net>
Cc: David Lechner <dlechner@baylibre.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Felipe Balbi <balbi@ti.com>
Cc: Gyungoh Yoo <jack.yoo@maxim-ic.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>
Cc: Joshua Kinard <linux@kumba.dev>
Cc: Kai Svahn <kai.svahn@nokia.com>
Cc: Kevin Hilman <khilman@baylibre.com>
Cc: Kumar Sanghvi <kumar.sanghvi@stericsson.com>
Cc: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-crypto@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-iio@vger.kernel.org
Cc: linux-input@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-omap@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mattias Nilsson <mattias.i.nilsson@stericsson.com>
Cc: Mattias Wallin <mattias.wallin@stericsson.com>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: mfd@lists.linux.dev
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Milo Kim <woogyom.kim@gmail.com>
Cc: Ming Yu <tmyu0@nuvoton.com>
Cc: "Nuno Sá" <nuno.sa@analog.com>
Cc: Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: Pat Gefre <pfg@sgi.com>
Cc: Paul Burton <paulburton@kernel.org>
Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Qunqin Zhao <zhaoqunqin@loongson.cn>
Cc: Rabin Vincent <rabin.vincent@stericsson.com>
Cc: Rachna Patil <rachna@ti.com>
Cc: Roger Quadros <rogerq@kernel.org>
Cc: Samuel Ortiz <sameo@linux.intel.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Shi Hao <i.shihao.999@gmail.com>
Cc: Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>
Cc: Stanislaw Skowronek <skylark@unaligned.org>
Cc: Stephen Warren <swarren@nvidia.com>
Cc: Sundar Iyer <sundar.iyer@stericsson.com>
Cc: syed khasim <x0khasim@ti.com>
Cc: Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc: Thomas Richard <thomas.richard@bootlin.com>
Cc: Tony Lindgren <tony@atomide.com>
Cc: Yinggang Gu <guyinggang@loongson.cn>

Lee Jones (27):
  mfd: nct6694: Allocate USB DMA buffers with kzalloc_obj()
  mfd: ls2kbmc: Unregister GPIO GSI via devm_add_action_or_reset()
  mfd: ls2kbmc: Cancel reset work on teardown via devm_work_autocancel()
  mfd: ls2kbmc: Allocate simplefb platform_data on the heap
  mfd: bd96801: Allocate watchdog IRQ resource on the heap
  mfd: ti_am335x_tscadc: Retrieve parent driver data via
    dev_get_drvdata()
  mfd: db8500-prcmu: Make AB8500 cell and IRQ resource static
  mfd: nct6694: Do not resubmit interrupt URB on endpoint stall (-EPIPE)
  mfd: ioc3: Request parent IRQ via request_irq() and free before domain
    removal
  mfd: intel-lpss: Remove registered MFD child devices on probe failure
  mfd: max8907: Manage power-off handler via
    devm_register_sys_off_handler()
  mfd: twl-core: Clear pm_power_off callback in twl_remove()
  mfd: twl-core: Clear twl_priv pointer on teardown and probe failure
  mfd: loongson-se: Check return value of dma_set_mask_and_coherent()
  mfd: loongson-se: Zero-initialise controller command structures
  mfd: loongson-se: Reinitialise completions and wait uninterruptibly
    for commands
  mfd: loongson-se: Zero-allocate driver data and initialise engine
    completions in probe
  mfd: loongson-se: Prevent out-of-bounds engine access in
    se_irq_handler()
  mfd: loongson-se: Stop controller and mask interrupts on teardown and
    shutdown
  mfd: loongson-se: Validate engine ID, DMA buffer size, and IRQ
    registration
  mfd: abx500-core: Unregister device ops on devm release
  mfd: ab8500-core: Register sysfs attribute groups via
    devm_device_add_group()
  mfd: tps65217: Manage IRQ domain teardown via devres
  mfd: mt6397: Manage IRQ domain lifecycle with devres
  mfd: mt6397: Unregister PM notifier on probe failure and unbind
  i2c: cgbc: Propagate hardware errors when polling read status
  mfd: ti_am335x_tscadc: Remove redundant ti_tscadc_dev_get() helper

 drivers/i2c/busses/i2c-cgbc.c             |  27 ++++--
 drivers/iio/adc/ti_am335x_adc.c           |   2 +-
 drivers/input/touchscreen/ti_am335x_tsc.c |   2 +-
 drivers/mfd/ab8500-core.c                 |  11 +--
 drivers/mfd/abx500-core.c                 |  29 +++---
 drivers/mfd/db8500-prcmu.c                |   8 +-
 drivers/mfd/intel-lpss.c                  |   1 +
 drivers/mfd/ioc3.c                        |  32 ++++---
 drivers/mfd/loongson-se.c                 | 110 +++++++++++++++++-----
 drivers/mfd/ls2k-bmc-core.c               |  27 ++++--
 drivers/mfd/max8907.c                     |  28 ++++--
 drivers/mfd/mt6358-irq.c                  |  17 +++-
 drivers/mfd/mt6397-core.c                 |   4 +-
 drivers/mfd/mt6397-irq.c                  |  31 +++++-
 drivers/mfd/nct6694.c                     |  23 +++--
 drivers/mfd/rohm-bd96801.c                |  11 ++-
 drivers/mfd/ti_am335x_tscadc.c            |   7 +-
 drivers/mfd/tps65217.c                    |  40 ++++----
 drivers/mfd/twl-core.c                    |  45 +++++----
 include/linux/mfd/loongson-se.h           |   8 +-
 include/linux/mfd/ti_am335x_tscadc.h      |   7 --
 21 files changed, 326 insertions(+), 144 deletions(-)

-- 
2.56.0.307.g5fe7bd680c-goog


