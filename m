Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955C8C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 19:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=944Erm5fSMdl88HHtnkJKxJKD/uoQrpGGmowPzmOm6w=; b=xv2Df6NpnAf8sPCfR2eXD0gIb6
	K4Wyt0cOdpz9a10ZYgzXMFusmcq+LpS06l29lv4yvQPFSZH7bA9Yj7xDPayYTLibswuyMXtW/Eoai
	9uuKPTQSugUTryDuDcvCXDBCQvfDGYDVTBRLoJOmVUmWI/wrDoP74IF/Ue9LTd25J0yP8unl7PNX0
	gHCJQbSrJVNiyDSyC3cl1aop812m1a8pbd6Zm0qkzgeqU4MSJM3ImtEBd2RnWWRMBA7ZvGBgEcNto
	y+4Xmvq0aAJdj/xOVhYb9xbXPs6n+4aVSDZGF57rW7mrmTzwjqbDm679vPqQbB64iEVfxzu2LCWla
	JWHYo3fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o46L3-00C7Oa-JO; Wed, 22 Jun 2022 19:48:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o46Kz-00C7NA-Jy; Wed, 22 Jun 2022 19:48:31 +0000
Received: from [46.183.103.8] (helo=phil.sntech)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o46KG-0004LY-G0; Wed, 22 Jun 2022 21:47:45 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: soc@kernel.org,
	Olof Johansson <olof@lixom.net>,
	arm@kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Heiko Stuebner <heiko@sntech.de>,
	openbmc@lists.ozlabs.org,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Tony Lindgren <tony@atomide.com>,
	Joel Stanley <joel@jms.id.au>,
	linux-arm-msm@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Michal Simek <michal.simek@xilinx.com>,
	linux-aspeed@lists.ozlabs.org,
	=?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-input@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Gross <agross@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Wei Xu <xuwei5@hisilicon.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	devicetree@vger.kernel.org,
	Peter Rosin <peda@axentia.se>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Li Yang <leoyang.li@nxp.com>,
	linux-tegra@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-omap@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Tero Kristo <kristo@kernel.org>,
	NXP Linux Team <linux-imx@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	Andrew Lunn <andrew@lunn.ch>,
	Nishanth Menon <nm@ti.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: (subset) [PATCH v3 00/40] dt-bindings: input: gpio-keys: rework matching children
Date: Wed, 22 Jun 2022 21:47:36 +0200
Message-Id: <165592714968.3933570.9891201783444800337.b4-ty@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
References: <20220616005224.18391-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_124829_712230_D488D2C5 
X-CRM114-Status: GOOD (  12.56  )
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

On Wed, 15 Jun 2022 17:52:24 -0700, Krzysztof Kozlowski wrote:
> Merging
> =======
> 1. dt-bindings: rebased on top of Rob's:
>    https://lore.kernel.org/all/20220608211207.2058487-1-robh@kernel.org/
> 
> 2. DTS patches are independent. They can be picked up directly by sub-arch
>    maintainers, by Arnd or Olof, or eventually by me (if you wish).
> 
> [...]

Applied, thanks!

[26/40] arm64: dts: rockchip: align gpio-key node names with dtschema
        commit: 517ed0ffd3cc691bef747288d51d01d2705b2251

        In the pinenote dts the original patch changed "cover" to
        switch, so to keep the cover information intact, I changed
        the node to "switch-cover" ... similar to other "switch-lid"
        instances in some other Rockchip devicetrees.

[27/40] ARM: dts: rockchip: align gpio-key node names with dtschema
        commit: 271e2c92285075a890c58cba9ad5979a8959f6ff
[28/40] ARM: dts: rockchip: rk3288-tinker: correct gpio-keys properties
        commit: e5a3cbe8b45b0a436a39cc969b7bcc8353248018

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

