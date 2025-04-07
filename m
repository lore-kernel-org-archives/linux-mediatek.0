Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06F20C36010
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Apr 2025 16:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DN6sdMdKOpXRPjuWjDBZBgf1MF77VD/mT8Bpbj1C0ko=; b=ioSGks7mrWRXgDXQFDAmlkQ+mC
	3h2xzJuhWyknGJO8Fd0ayWHrX0WM4++CYe5eDqkVbFjr5sX2ZRoN4f5N6CZBuUUG4/crhYINdprUL
	9wrVOBbLqJPFjvkFw+MDY/hk+fuMS9y4lsukdNGZ4AApEgi/1y2MVTIhF7c3OfQe/0yBBD/1UhO8J
	I7TW0+5cbLLbikm2uPmklheXNu7IOK+3JsFqFiiX8nd4yrgq8+vZOiW535jqJ7FfMarQb7Z+UHlfs
	l+kSI1N5kVsy3ICzsj5BygI1M8PWup2q33bjLddx5x1XCvzOoozgIyKnhwxRslJHOmkcp9t5rW2IC
	fpmXUT8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1oze-000000015Jr-0CFf;
	Mon, 07 Apr 2025 16:06:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1o2Z-00000000ruY-1Dzu;
	Mon, 07 Apr 2025 15:05:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 677AEA42E9F;
	Mon,  7 Apr 2025 15:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 031B8C4CEE8;
	Mon,  7 Apr 2025 15:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744038332;
	bh=Mw9qucjIp0Omq/A9vAIb/29JeyZDGU+9uc/m9jCRX7A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gKQS3aWs5xVxCEeJcS5zafu+bQCjIu6I8wU63yWdkZqgTpN0ZX/HSRgG0wgmWL3Df
	 tO4n9x0oecWmoMZuH9gLl66GZO1AzfyrFd6iPK8hsaD1rVynbuKzMzFYofrQdqnGmp
	 YE1GFpYc3rTrfy463qTV34W6ytzsjmWknY/GRntLu/xhoBMNTaqRfPiTSkkl8yRcm3
	 JZa3p5KhofL4wTtG8vofHq+wfE28TQJYr6EcDYsDgl5WUa2CRXX81T5kYlpVYFKA1X
	 tILrVOmLhSJEvkXnYTKUB3Ueun2ZuSdoGzFkrObrHcMl3dRZeuhARHTmLzv3nTPBng
	 XpeskTYpqLJZA==
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	zhouyanjie@wanyeetech.com,
	Conor Dooley <conor@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-mips@vger.kernel.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: (subset) [PATCH 00/19] Arm cpu schema clean-ups
Date: Mon,  7 Apr 2025 16:04:56 +0100
Message-ID: <20250407-explicit-explain-a741ef76ba8e@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=698; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=3ED6nRUUmofI7rnQA5nqnPZ4e85/GutKQ3V+2IZjPhU=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOmfX85o+sg3ueWv6O3Sh03r2wxfSPGs4/kmI3wy2pZ9l jij8++rHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjI0yMM/7PeKB0VzvzRsU76 6ZZK72k+2yufHdmVoe3au+jKpq5jvk8Y/oc+Uf8o/IzxBH/rpdnLH972fP4uU2Jz797u8z9eX11 z8TcbAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_080535_457424_EEA6B6BF 
X-CRM114-Status: UNSURE (   8.48  )
X-CRM114-Notice: Please train this message.
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

From: Conor Dooley <conor.dooley@microchip.com>

On Thu, 03 Apr 2025 21:59:21 -0500, Rob Herring (Arm) wrote:
> The Arm cpu.yaml schema fails to restrict allowed properties in 'cpu'
> nodes. The result, not surprisely, is a number of additional properties
> and errors in .dts files. This series resolves those issues.
> 
> There's still more properties in arm32 DTS files which I have not
> documented. Mostly yet more supply names and "fsl,soc-operating-points".
> What's a few more warnings on the 10000s of warnings...
> 
> [...]

Applied to microchip-dt64, thanks!

[04/19] arm64: dts: microchip: sparx5: Fix CPU node "enable-method" property dependencies
        https://git.kernel.org/at91/c/ec32344d2a3b

Thanks,
Conor.

