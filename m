Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FAF606A325
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Nov 2026 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4dKeBdFX;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mteItAuJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=FrqcePVIbKpJOlr0CwwEXmHuYmHa3yUMeo1BTUrWcl0=; b=4dKeBdFXUiCXzd
	nNw9giNsHfyXHdbkT9uMfGZQwOhmnkbNcus3ECGoDItYPjqaUDxXSQMtO/QrQc4Vp2YtJVjITXvjf
	l9ejYMkwVmAPtSHJdNoE5hodXfKlkO7c3OkUKPCO5hv7xBR2RWUyYeOt3WOhngOqM0Axg/MmBh6tS
	v1a5PtOutGWfIYXyw0/qncaj77nw4TMGp7tAPZbTerA0HykrQZ35INnVmPSm5sWCNo7CbkcKThtYF
	8Gi5Q9lVpNkoD7flZxgQw6M7aeb1Q+4p9RLbG44WNOVKyXyXwDwSvLpFgyPfA13D933C5XxX/26v9
	hEtLss9kEHA98zhjMVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Zf-0000000BvNA-3r2m;
	Thu, 19 Nov 2026 12:49:11 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU1Zb-0000000BvKx-0tOg;
	Thu, 19 Nov 2026 12:49:08 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7A16E1A1711;
	Thu, 19 Nov 2026 12:49:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3F14960237;
	Thu, 19 Nov 2026 12:49:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CC49311BC0673;
	Thu, 19 Nov 2026 13:48:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795092535; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FrqcePVIbKpJOlr0CwwEXmHuYmHa3yUMeo1BTUrWcl0=;
	b=mteItAuJBxCXIm6o7Tz4CiCkaMG9jXhvMU2sSQLnSpwBcZpG8f2MBEvcJ1Bx2lQIvEFPHc
	cDtQgbCpT1F3jW229XoKlV3ReW5mnP/ABdent9sCr/5183826BqbllILfT90L05VaHMgtP
	dUJUiAyMuYUR1NhbdpZFwHZONdW4QU9si+WZSm1qV6DhZI6XlaK2xQVRCAOzwBKLP1wBFh
	3qw4wVp4q47Ts1Jsp/lIRy+UYxCPzeFEV89KDKzTVDondoVzVYjpyUCZKV/Oz4GxrsbGus
	YTBzHCONs5aDQShHm1+BnPAiQ9L4baKhNKmb68Cs/uKC0//BXan270Bf1Uz6BQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,  Srinivas Kandagatla <srini@kernel.org>,
  Tze Yee Ng <tze.yee.ng@altera.com>,  Richard Cochran
 <richardcochran@gmail.com>,  Jonathan Lemon <jonathan.lemon@gmail.com>,
  Vadim Fedorenko <vadim.fedorenko@linux.dev>,  Yuqiang Sun
 <izaiahsun@gmail.com>,  Amit Kumar Mahapatra
 <amit.kumar-mahapatra@amd.com>,  Luca Ceresoli
 <luca.ceresoli@bootlin.com>,  Bernhard Frauendienst
 <kernel@nospam.obeliks.de>,  "Gustavo A. R. Silva"
 <gustavoars@kernel.org>,  Kees Cook <kees@kernel.org>,
  linux-hardening@vger.kernel.org,  Arseniy Krasnov
 <AVKrasnov@sberdevices.ru>,  Boris Brezillon <bbrezillon@kernel.org>,
  Brian Norris <computersforpeace@gmail.com>,  Jernej Skrabec
 <jernej.skrabec@gmail.com>,  linux-arm-kernel@lists.infradead.org,
  linux-sunxi@lists.linux.dev,  Samuel Holland <samuel@sholland.org>,
  Chen-Yu Tsai <wens@kernel.org>,  David Woodhouse <dwmw2@infradead.org>,
  Thomas Gleixner <tglx@kernel.org>,  Vitaly Wool <vitalywool@gmail.com>,
  David Woodhouse <David.Woodhouse@intel.com>,  Russell King
 <rmk+kernel@arm.linux.org.uk>,  Mike Rapoport <rppt@kernel.org>,
  Alexandre Torgue <alexandre.torgue@foss.st.com>,  Christophe Kerello
 <christophe.kerello@st.com>,  Maxime Coquelin <mcoquelin.stm32@gmail.com>,
  Jason Roberts <jason.e.roberts@intel.com>,  Boris Brezillon
 <boris.brezillon@collabora.com>,  Michal Simek <michal.simek@amd.com>,
  Mason Yang <masonccyang@mxic.com.tw>,  Ramuthevar Vadivel Murugan
 <vadivel.muruganx.ramuthevar@linux.intel.com>,  Lucas Stach
 <dev@lynxeye.de>,  Dmitry Osipenko <digetx@gmail.com>,  Jonathan Hunter
 <jonathanh@nvidia.com>,  linux-tegra@vger.kernel.org,  Stefan Agner
 <stefan@agner.ch>,  Thierry Reding <thierry.reding@kernel.org>,
  AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
  Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
  linux-mediatek@lists.infradead.org,  Matthias Brugger
 <matthias.bgg@gmail.com>,  Heiko Stuebner <heiko@sntech.de>,
  linux-rockchip@lists.infradead.org,  Yifeng Zhao
 <yifeng.zhao@rock-chips.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  Nicolas Ferre <nicolas.ferre@microchip.com>,
  Keguang Zhang <keguang.zhang@gmail.com>,  linux-mips@vger.kernel.org,
  Shan-Chun Hung <schung@nuvoton.com>,  Jacky Huang <ychuang3@nuvoton.com>,
  Fabio Estevam <festevam@gmail.com>,  Frank Li <Frank.Li@nxp.com>,
  imx@lists.linux.dev,  Pengutronix Kernel Team <kernel@pengutronix.de>,
  Sascha Hauer <s.hauer@pengutronix.de>,  Han Xu <han.xu@nxp.com>,
  linux-renesas-soc@vger.kernel.org,  Wolfram Sang
 <wsa+renesas@sang-engineering.com>,  Jerome Brunet <jbrunet@baylibre.com>,
  Kevin Hilman <khilman@baylibre.com>,  Liang Yang
 <liang.yang@amlogic.com>,  linux-amlogic@lists.infradead.org,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  linux-arm-msm@vger.kernel.org,  Manivannan
 Sadhasivam <mani@kernel.org>,  Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,  Kamal Dasu
 <kamal.dasu@broadcom.com>,  Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>,  Vladimir Zapolskiy <vz@mleia.com>,
  Harvey Hunt <harveyhuntnexus@gmail.com>,  Paul Cercueil
 <paul@crapouillou.net>,  Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: [PATCH v5 00/58] mtd: rawnand: retain chip and controller state
 across removal
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
	(James Hilliard's message of "Sun, 15 Nov 2026 23:29:15 -0700")
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Thu, 19 Nov 2026 13:48:02 +0100
Message-ID: <87v75tc7i5.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_044907_408309_11A5BFE7 
X-CRM114-Status: GOOD (  22.87  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi James,

On 15/11/2026 at 23:29:15 -07, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> An MTD handle can outlive controller unbind. Its metadata and NAND locks
> must remain valid, including when a writable file closes and calls sync,
> while further hardware access must be rejected after disconnection.
>
> This builds on earlier MTD removal-lifetime work. Commit 19bfa9ebebb5
> ("mtd: use refcount to prevent corruption") added MTD reference counting
> [0], but retaining an MTD reference does not by itself retain the
> driver-owned allocation containing the master. The read/unbind discussion
> also covered raw NAND [1] and draining active operations [2]. Tze Yee Ng's
> SPI-NOR series addresses the corresponding SPI-NOR paths [3].
>
> Following Greg's review [7], separate class-device data from the MTD
> backing allocation. Delete the device's interfaces and drain NVMEM and
> class PM callbacks before releasing backing data. Bare device references
> retain an independently allocated device, whose type, PM dispatch and
> final release are built in even when MTD is modular. NVMEM similarly
> disconnects and drains provider and layout callbacks before unregister
> returns; retained consumers keep core-owned metadata and receive -ENODEV
> on subsequent access.
>
> Introduce opt-in backing-object ownership for MTD masters. Registered
> nodes and acquired MTD handles retain the chip, while nested partitions
> also retain their parent metadata. Unregister first so removal notifiers
> can finish I/O, then disconnect raw NAND and drain admitted operations.
> Hardware resources can be released without waiting for open files to clos=
e.
>
> Virtual concatenations serialize publication and removal across physical
> controllers. Disconnect and drain a published concatenation before any
> component can disappear, then release its component references. An old
> handle keeps the disconnected virtual device, independently of a later
> replacement.
>
> Run NAND and controller-specific cleanup during disconnection, while
> the controller driver is still bound. Snapshot the OOB layout in core-own=
ed
> data before publication so metadata queries remain valid without driver
> callbacks. The NAND core frees retained chip and controller allocations;
> the final MTD put never calls back into the controller module. Ordinary
> MTD and NVMEM handles retain the NAND core that implements their
> operations, rather than the hardware driver.
>
> Share allocation ownership across the raw-NAND drivers, including
> partially published probes. Shared controllers remain allocated until
> their last retained chip is released. R852 allocates a new chip for each
> card, and NDFC allocates controller state per binding.
>
> Based on NAND next at 30daaf3e7897, with Tze Yee Ng's module-reference
> ordering fix [4], Karl Mehltretter's OTP cleanup fix [6], and the separat=
ely
> posted registration, operation-locking and controller probe/teardown fixes
> identified by the prerequisite metadata. TLA+ models and their assumptions
> and coverage limits are available in [5].

While lifetime issues are a real concern in the kernel, please note that
in general, removing or unbinding the flash controller driver is not a
practical operation. While highly unlikely, this is possible though. But
I am not going to sacrifice all the devm_ calls in favor of reinstating
manual error handling just for that. If there is a way, it must be
different.

Also, this kind of contribution can only be done if you *understand*
what you are doing. Getting the big picture here is not optional.

Maybe the problem is MTD refcounting? Maybe the problem is the devm_
orderging? I don't know, I haven't looked in depth at all the
patches. But the current approach is clearly not acceptable.

Thanks,
MIqu=C3=A8l

