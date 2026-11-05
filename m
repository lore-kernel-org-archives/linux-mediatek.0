Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6DF606A31B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2026 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d9szL/B/;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RSW+bpRC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5triMnaj+pld1/ZkHnww/ZTGYlR4kdR37WbQmvo0E+I=; b=d9szL/B/VecN+H9bEi0FhFppcn
	yeS09JLjVGjlyYzV/x6ttPySWB7QL6/qzphwyaNkIn3SJVjon4NxIc98HJYwkYa9jlzgQCqt+wuhc
	fMuktbM95u1GDv/z4uY0zGZTLBjSwvaVAMWL8k0xYgMvcePm8lSKsJdmuhIfBRCDVkOgvLufXMkFk
	ifDLPGS6UKsL2rFL+Zq3Ja+gznID+KUbBwGFEBqwrmEK61NgGOngmxSsmiZB+qglcTbo/7GsC14ar
	no9Vbx9X2nJbE98g2febZgd5GuCPj5vwG/wH5shBxsb2XC39lWIAi3U2cCHJrpP4Ua6H6wZhygi5Y
	kWPScgvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwXO-00000008wZY-3UqL;
	Thu, 05 Nov 2026 12:25:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwXD-00000008wUk-02ik;
	Thu, 05 Nov 2026 12:25:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 1EA6160F20;
	Thu,  5 Nov 2026 12:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id E9BD81F00A1C;
	Thu,  5 Nov 2026 12:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793881537;
	bh=5triMnaj+pld1/ZkHnww/ZTGYlR4kdR37WbQmvo0E+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RSW+bpRC5/OtERfddmxxD47rtdgY7drS4x1h9FWwypwvgjQQLJG4iTAm6/TUtQUbq
	 IiZuATXLd3LAxCpuw8R+bMUOvh3lciPaGvevBovd3QKWsW5Y4FEE65Abpe70tcefDW
	 LNpOF1hD396m8K4hS/U5rd0wiR8PAmrXyC2g6JAfgX8u1ym3pLHliSZ1gqRgSLW+Bc
	 HX49I5XIf2eGuAaWlxtXXmvjW7Xb6hnAMLMzc+IGOOZWZbsMS43S+7Bz5Kl63ztaNT
	 pksjjqJMzfTRz7MCNKhc/3WIhoncfEvk6Lo0/zVDsCqyHXoooOlGiXvSfl7gdoDOj4
	 ig/01HIsQNlIg==
Date: Thu, 5 Nov 2026 13:25:34 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Imre Kaloz <kaloz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
	Hoan Tran <hoan@os.amperecomputing.com>, Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, linux-hwmon@vger.kernel.org, 
	Matti Vaittinen <mazziesaccount@gmail.com>, "Enrico Weigelt, metux IT consult" <info@metux.net>, 
	Viresh Kumar <vireshk@kernel.org>, virtualization@lists.linux.dev, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-aspeed@lists.ozlabs.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-unisoc@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	Michael Buesch <m@bues.ch>, William Breathitt Gray <wbg@kernel.org>, 
	Robert Richter <rric@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 00/23] gpio: Improvements around device-id arrays
Message-ID: <le5gbua6s2mhhv32di4j77qr2we5z5ngzyzmiemhodmblvjiji@q4wf5tdgrbtv>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
 <2hfpcbk6r56vvhkqyiex2apl3pinieybad5sd3vkvvabqs3uto@lydt3gin5kxe>
 <auxh9PxpJScFO3i2@monoceros>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <auxh9PxpJScFO3i2@monoceros>
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

On Thu, Nov 05, 2026 at 12:06:33PM +0100, Uwe Kleine-König (The Capable Hub) wrote:
> 
> Maybe you just need to add `-3` to your workflow? ISTR this should be
> the default for b4, but it seems if failed to mention the -3 in the git
> am cmdline.
> 
> Should I still resend?
>

No, it's alright. I would have preferred a clean b4 shazam but that
works too, thanks.

Bart

