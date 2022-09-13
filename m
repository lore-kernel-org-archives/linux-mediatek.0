Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 542E9ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 16:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8kStY2Og2g3FQ4Uh+BWFfEr+7o6KsjtohOa8XqQso/8=; b=jr0aTfkAcl+/FcyL3h/nwrDLzg
	3lpPLNTHuejRY1g1gpWB25pZq3VgcXW0P4W8Z6nj/mxRs8oe7akHi1f/mI00x2v+0gcUCnFK64LfN
	j2llqalmVZtXosy+2P7uh8gjNh1Xl18TS+VBAyRRBGPixr2t5/GiTYDDVnsyVYfqVf9FGtdTdQ8y/
	4/3xwPGUHHk5VrIxQBqTiIaFMj1P/5Ix+GKYJH5wv4hSVj5f49An6DaEKcskn4VUPaSbPpZ+eYmY5
	ouCK04ft5m7quaFMIo03NJmzzqYwNr6u6sPq/SmEw207D8IhVwPQ0sJA81it2Rds9y3CO0YfqtNhJ
	s6mL9lPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY97j-00Da6p-84; Tue, 13 Sep 2022 16:50:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY91a-00DWKD-3l; Tue, 13 Sep 2022 16:44:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7B5D66151F;
	Tue, 13 Sep 2022 16:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D4C7C433D7;
	Tue, 13 Sep 2022 16:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663087477;
	bh=LazoKil10sVAZo5jouuuvttZYHH0Wrl8ysZuo+MFHqA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UGMg0ZxrSB5Y6y8eMg/Y0A/G+j9ibH66bPhWEedVUf2YD4QweIwj/SbhyEWlWNG36
	 rK7QXPvjiOQq18oefDdZs7C7wm2umGln1VW2I4LhUmnFYpzgpes8lfP2ZutmGnyGS3
	 vqpzYJYyQewKn4+iIszV+eOoSQRaYy+/5og1k4DlTJ7Ktd1KoegY5gf9gwWl9ahJuT
	 EpGhjwUIa8wCC2Tp+knxbWDkSXBRuCNIl958P4h/C2eHOJvEaSQSCqhF00yLKCQ+0z
	 qnddPHDYBAJNgbxrByylGyfQA72RswR6iHn2N1MSoIXGO0N3OvGr51L3d/1aZR+iDz
	 Bj9/kwajdbHog==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzysztof.kozlowski+dt@linaro.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, matthias.bgg@gmail.com
In-Reply-To: <20220913123456.384513-1-angelogioacchino.delregno@collabora.com>
References: <20220913123456.384513-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 0/4] MediaTek Helio X10 MT6795 - MT6331/6332 Regulators
Message-Id: <166308747505.261771.11158894502965288583.b4-ty@kernel.org>
Date: Tue, 13 Sep 2022 17:44:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-7dade
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_094438_439292_44F7DAF6 
X-CRM114-Status: GOOD (  14.67  )
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

On Tue, 13 Sep 2022 14:34:52 +0200, AngeloGioacchino Del Regno wrote:
> In an effort to give some love to the apparently forgotten MT6795 SoC,
> I am upstreaming more components that are necessary to support platforms
> powered by this one apart from a simple boot to serial console.
> 
> This series adds support for the regulators found in MT6331 and MT6332
> main/companion PMICs.
> 
> [...]

Applied to

   broonie/regulator.git for-next

Thanks!

[1/4] dt-bindings: regulator: Add bindings for MT6331 regulator
      commit: 6385e21692bbb0b35eca8120d576b3c1ba1ad9d3
[2/4] regulator: Add driver for MT6331 PMIC regulators
      commit: 6f7a71f804287a7566314ab1a73d8ca2c18ca0d7
[3/4] dt-bindings: regulator: Add bindings for MT6332 regulator
      commit: e22943e32e1fc314b8e2b095ae3495d1bfa9aca5
[4/4] regulator: Add driver for MT6332 PMIC regulators
      commit: 1cc5a52e873a4f9725eafe5aa9cd213b7b58e29e

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

