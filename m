Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92032C88E75
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2026 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zdMtzOEeKhZuTFoJsqIR3X1skRiJm5fGYebmf2XTqE0=; b=tSG9glKkhYzRNXojxaO8XfYsZq
	vHI8CFtJTKrvG8rI09nPJDRl94LXOlj07yOaOzl2tyuGkZI7yaBfG2VKO5DgYqEh/B0AjFx8EcUhS
	jd8EtwwZEjXQuYr0I5yk1XFCLczaqI1x5yBLqgFm8o55MevqnbiMX1iuq99vWPFka6VA3lc6LNecX
	UDkrH6JgPN1af3v2gziNfim8s4KZntk4sBZv8RqwzP1Qo96r7T7q/FR48rQZ0vIASZBrHE8b+WehV
	iVUTeSS1DOnH5TiVpOyms4yMMr54dUwzDJnUb1ZUASly98CMpfqDm+qeYq+t2wurrOfAjK62z/8lm
	78ZRjltQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Vrd-00000007OCp-12mm;
	Tue, 15 Sep 2026 16:18:33 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Vra-00000007OC3-2kHz;
	Tue, 15 Sep 2026 16:18:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 08CB943C6E;
	Tue, 15 Sep 2026 16:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3F11F00893;
	Tue, 15 Sep 2026 16:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789489109;
	bh=zdMtzOEeKhZuTFoJsqIR3X1skRiJm5fGYebmf2XTqE0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=h27yCwED5eGU5g7CjoRIMjXid1gcL0jK0GIkjqMBQUvezag4D7EoNkuvSCEqur0D2
	 daVAKP9EZ4rnltqq1O3bZgPwu7oZPS8nB6jnIOQk0oX6i7HVATaCyQq5VgNy65h4rr
	 LBLMVmA8lx7OdSEbHtlg0JRcHdL/RCfDv4iB+HPR38r5/YcnGy5AUbNRA4v5ysSxhn
	 9dihzuIcsyXeBmoUtCp9dmFZHQHnhIo6b7LgOEvd7GubTKzN3VOSeLCkAG4WNRMyQy
	 0gFiruljocQ7QTDMYwK9+TKqxCKwaRauuIyiCB48VbWoL7wGSk1rjSF5Dv+XCOt28W
	 F09pU1HC4yPjQ==
From: Mark Brown <broonie@kernel.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Binbin Zhou <zhoubinbin@loongson.cn>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Khanh Le <khanh.le.xr@renesas.com>, 
 Ricardo Rivera-Matos <rriveram@opensource.cirrus.com>, 
 patches@opensource.cirrus.com, 
 David Rau <David.Rau.opensource@dm.renesas.com>, 
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Yingkun Meng <mengyingkun@loongson.cn>, Trevor Wu <trevor.wu@mediatek.com>, 
 Julien Massot <jmassot@collabora.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
 Shane Chien <shane.chien@mediatek.com>, 
 Daniel Beer <daniel.beer@igorinstitute.com>, 
 Sebastian Reichel <sre@kernel.org>, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
In-Reply-To: <20260915063317.28971-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260915063317.28971-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3] ASoC: dt-bindings: Use consistent indentation in
 the example
Message-Id: <178948092653.151760.9676551205398911501.b4-ty@b4>
Date: Tue, 15 Sep 2026 15:02:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1145; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xsHfdw96GFbaepBJbdXAFV0YRCZ+PaNC0b49O+JVBp0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqqW/KhCABg54MOkosoFTzPXmeLy/RlhkivifSk
 jMcT3bipsWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaqlvygAKCRAk1otyXVSH
 0LcyB/4hxF4ifiG0nOiFlkrrz1CCm5Ai3AIXbPgY9VtS02VcW230+rF+S51HzwY3b/C69z5M+sl
 E5Bz+18HBKeoMsXQemKmgV3INECe3Ea9Ar+RsVNdjlak3uOxsrweJQs3wXAmBk39p6XeKwsIxa2
 NFhIiS+s3/H5RQoltOYjzF3kbeotptgw8GlvnraZJLU3E8cvMurY4BbIb4ZdIYMR8eAYZ1TIYDC
 tE68mtQGyskHvWIMuv/9pVeHIevKetO+5V4kN/PpMhJXr++EfVuolMTpCMGWRJT/FclrHONvFUq
 MHa017eKvt2sLQlj4BPmTFz/WuSKhH6YpMhSdDizVu85Oo6q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

On Tue, 15 Sep 2026 08:33:18 +0200, Krzysztof Kozlowski wrote:
> ASoC: dt-bindings: Use consistent indentation in the example

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/1] ASoC: dt-bindings: Use consistent indentation in the example
      https://git.kernel.org/broonie/sound/c/bd1041d3e1c0

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


