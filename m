Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEEED5B16F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Oct 2024 09:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpAfK6tyrvwMS8L2PbzrGqnbfuzjHJrlMvInkHIHnZI=; b=wYJjl2+fn1kI/KlhOvJrimDhiO
	WYrov5Dcvhw2Gk3b4V8s0PAiYw58jrQHomnMcWpGe/bL6P2k1bokZ2XxSbt+igmzhL0ORs1fmdySl
	vMqdDzgXCr/6SOyc16KcOJK+yCVDLpzW0F4RBKAK8MiTQabhWVOIIF2+fvvdj61WtTiipgmkHiphz
	4WGieM9CedCst7O07eoiuCz3Qqfu4vaQWb2BSw+LxtaTYn00/4jydxSTVaCehsLYiNLuyAuXUrpVD
	sQaqFxHBswNjwoMU69lftD3WColsmNYWYDX/ZO8+OouUEPU6m7Vku6W/adk+fd5zjV96Jx/o3thQt
	8MbYicSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iEs-0000000DpVd-3aWq;
	Tue, 29 Oct 2024 09:10:10 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5i8u-0000000DoVH-0pNn;
	Tue, 29 Oct 2024 09:04:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C68791BF204;
	Tue, 29 Oct 2024 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730192635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hpAfK6tyrvwMS8L2PbzrGqnbfuzjHJrlMvInkHIHnZI=;
	b=WkhI/DVqn/dDgEGXg5ze24s00SnuWWK8bmgYFAQaSQSgHS/3+b0O5sNNKTStjAxR/jf+4h
	0o6b25F5CM6hzS4ApkL7rjJteF/3WsvIXr9Is7v7RNPDr1hM6SgZtytzIUP4gZ5dtlEpLg
	COgrRCbWe5DTxWzSVRzksGVJyb597rnqQCl5AJLLhtHIb4htqmGNuaCLmKvnbildk9oQPe
	IqjYlYEsv6PJq4Tpe9bBIT7sk8n1gJbWFWN3kIUiX2Dd+Sk2UHidAD1P51iPnXfsSARzVl
	nu+FDRAug3FdoWJxDLz5FVgjrXmtG+m82/IUNQdOKDRvvPwaBoAqjYk9s9Gx2w==
Date: Tue, 29 Oct 2024 10:03:47 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Qiang Zhao
 <qiang.zhao@nxp.com>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Huisong Li <lihuisong@huawei.com>, Linus Walleij <linusw@kernel.org>, Imre
 Kaloz <kaloz@openwrt.org>, Karol Gugala <kgugala@antmicro.com>, Mateusz
 Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>, Yinbo
 Zhu <zhuyinbo@loongson.cn>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor
 Dooley <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alim Akhtar <alim.akhtar@samsung.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Michal
 Simek <michal.simek@amd.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Duje =?UTF-8?B?TWloYW5vdmnEhw==?=
 <duje.mihanovic@skole.hr>, Mark Brown <broonie@kernel.org>, David Wu
 <david.wu@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, Jay
 Buddhabhatti <jay.buddhabhatti@amd.com>, Radhey Shyam Pandey
 <radhey.shyam.pandey@amd.com>, Izhar Ameer Shaikh
 <izhar.ameer.shaikh@amd.com>, Naman Trivedi Manojbhai
 <naman.trivedimanojbhai@amd.com>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] soc: Switch back to struct platform_driver::remove()
Message-ID: <20241029100347.542b56d4@bootlin.com>
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
References: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_020400_531235_91EBEF61 
X-CRM114-Status: GOOD (  12.53  )
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

Hi Uwe,

On Tue, 29 Oct 2024 08:48:58 +0100
Uwe Kleine-König <u.kleine-koenig@baylibre.com> wrote:

> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/soc to use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> On the way do a few whitespace changes to make indention consistent.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
...
>  drivers/soc/fsl/qe/qmc.c                    | 2 +-
>  drivers/soc/fsl/qe/tsa.c                    | 2 +-

Acked-by: Herve Codina <herve.codina@bootlin.com> # for fsl/qe/{qmc,tsa}.c

Best regards,
Hervé

