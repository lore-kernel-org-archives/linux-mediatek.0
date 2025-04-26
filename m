Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717B5C369CB
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Apr 2025 23:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsIFs9lsBStWNO+SAUv4QwVqUpvjBQFP3/IMyXHCh3E=; b=k705uksJmJk8g/S5VgD9U428cm
	M8lKBqkHo8Iowg0qFjOP9/N+B1QPMfvRgqNPFxJBXwHeP0MXx40uqRaIAv+LXiNG8MthZvM6e9itZ
	3xN4UTDTcZgx5asi1RctTaaN3RHn1LSgTcay8gZ2qT1imatYGEwEgVKgEsG/ImbJ/6CThRu8pU7g5
	7vCqR7vSrlrvMe2QpXemegHTNeROGIJ0PoUuXGpG/nEhE6rVrNkrD7JW88EsdZbQyaJHCUBriNlUC
	ZTnqpDhgIobOI3BH37YLVCmHo6pvj2fevKzsGdB6gN5VpdG9n5/th/n6+TNBXEeLuAAt6Qr0jGH33
	Knt1NYLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8oca-00000002bto-1IYV;
	Sat, 26 Apr 2025 23:07:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8nQU-00000002Y26-0GVY;
	Sat, 26 Apr 2025 21:51:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=gsIFs9lsBStWNO+SAUv4QwVqUpvjBQFP3/IMyXHCh3E=; b=Sye5YV7NL9CEcB/oGe1RyoXudx
	aQYeOWLye+efnOo9sycbe8k309HBPzOVgvdQeo7HNweqWmNTst6ZB+Irt2iOpJ8H/1NEffnDdZR7y
	TgLUNbnl1tGVC9edgLpJsjdDVz9KATV22vbIJusuOkzh1BWrOv7meFHgBVd8ujMMJ+0j7j8QOsMFT
	EaVNMgrPlDgJ5350yiF+vMLKUHddKZe2QwTRTqSExdrfjcOz00BjshTrcn2E3x+2zTVtu8CGZOGJ8
	IWKhx20FVgecrDUhL9+p2gnRdZPAeOCOKgn7rscJFg5hpC/ZUW15rDktJhz+soODfF7KqtIQUePdJ
	PSy0q48w==;
Received: from i53875aba.versanet.de ([83.135.90.186] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1u8nLv-0001OR-UY; Sat, 26 Apr 2025 23:46:28 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	zhouyanjie@wanyeetech.com,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: (subset) [PATCH v2 00/17] Arm cpu schema clean-ups
Date: Sat, 26 Apr 2025 23:46:17 +0200
Message-ID: <174570370139.31943.759075106630349490.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
References: <20250410-dt-cpu-schema-v2-0-63d7dc9ddd0a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_145110_098937_85BE6165 
X-CRM114-Status: GOOD (  10.01  )
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


On Thu, 10 Apr 2025 10:47:21 -0500, Rob Herring (Arm) wrote:
> The Arm cpu.yaml schema fails to restrict allowed properties in 'cpu'
> nodes. The result, not surprisely, is a number of additional properties
> and errors in .dts files. This series resolves those issues.
> 
> There's still more properties in arm32 DTS files which I have not
> documented. Mostly yet more supply names and "fsl,soc-operating-points".
> What's a few more warnings on the 10000s of warnings...
> 
> [...]

Applied, thanks!

[10/17] arm: dts: rockchip: Drop redundant CPU "clock-latency"
        commit: 709a25f7a433d53dc9f0daf7cf5657f0671c5026

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>

