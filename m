Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDF7C43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2026 06:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKkyiI/yiTP7cDIO4RjTJ77BW4c8hbO3ztakDA5/1iw=; b=ls+WR4uPmH6ctzMziA9/n1ghXq
	hF8KbAD+NBJAZ/VIY6aQRhQrj/DfIeA4Gb9Yu3K1KFDFZ/AOEtRqzUmbnz0q1OUvnMelCsIQHidGO
	5JpiNJkxfe+18olf3q5z1hmkrcO3QC+BVILdWeO9gIgIO6COxTt/RTbPKFbqfNZBh9mxUlhbAYwp3
	vhrbhDwOU+VERdeYK3IKq8cMqb0JtnJI2Sp/qiOPFYdWwu45whn8PaNjFc+O9/NuJkwVr02G7Hllt
	OS/l8faPQIRmDjlcdeyp2v4R8tWmAPzfQIfAvwnaUrkYkhbwRdnPzX4hCJZKjzSXegrJgBa3/C/lX
	Y2QGqbog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5op-0000000DnzK-0u2i;
	Mon, 29 Jun 2026 06:50:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we5on-0000000Dnyr-2MMa
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jun 2026 06:50:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 406DD4066F;
	Mon, 29 Jun 2026 06:50:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AC1A1F000E9;
	Mon, 29 Jun 2026 06:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782715809;
	bh=hKkyiI/yiTP7cDIO4RjTJ77BW4c8hbO3ztakDA5/1iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OJoESfbZdO83HNh7oKMhYGdqPfgIf1wHRDiEo4WkmviQ+4zoYRgCN6vF3DeNkWYf+
	 GldlaWWMZEpb7U7+EZri1NmLJdb4AXLucWpp7KC54QzO4GM8kw9fqQa+2TURqLvNww
	 yRHCpqjTe9osQmWa1xkn+OEpLj7Gt01cRFS1SsSoQkugVb0vd1msS3JmZPtk2CjMZy
	 zSC9G16OjzDms4saM/0PiXkw0UAFpgHgbcpuJFBapeMceMXuRYj0/h02jv9DPPrFvf
	 XdHYwuso1WWzT3CGcvCdDVrb7en/g0GetjF5hPFiRtTdQgZPAMe5l9pEMOU1vbPsv8
	 zOBromKNtxIWA==
Date: Mon, 29 Jun 2026 08:50:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Markus Gothe <markus.gothe@genexis.eu>, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v6 15/17] pinctrl: airoha: add support of en7523 SoC
Message-ID: <20260629-ambrosial-ambitious-jackrabbit-821d2b@quoll>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-16-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260628143733.273651-16-mikhail.kshevetskiy@iopsys.eu>
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

On Sun, Jun 28, 2026 at 05:37:31PM +0300, Mikhail Kshevetskiy wrote:
> This patch adds support of Airoha en7523 SoC pin controller.
> Also it adds corresponding device tree binding schema.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,en7523-pinctrl.yaml        |  375 ++++++
>  drivers/pinctrl/airoha/Kconfig                |    6 +
>  drivers/pinctrl/airoha/Makefile               |    1 +
>  drivers/pinctrl/airoha/pinctrl-en7523.c       | 1124 +++++++++++++++++

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.


> +    pinctrl {
> +      compatible = "airoha,en7521-pinctrl";

Wrong compatible.

> +
> +      interrupt-parent = <&gic>;
> +      interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;


