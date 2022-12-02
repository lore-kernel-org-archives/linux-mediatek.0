Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69570C4321E
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 13:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zMFPVqlqBQs6ia+sA7fd8K4faUX2pktBS0Qj5wmxQCk=; b=Blup5c7ocrdv9iCH3yX0a3YjnI
	Ig7D6JbGWZQfw9uHRNR+zGOjyqBq+7bnbPQ63ktlCPus04TldUWawQu69Dv6BbUpijvgNaC0LjRlZ
	WEYqgqcsAIqp05FW5lZca8n6Pk9CGOOOgB5kxp+0e5QzCS64+ytRaD25JJNZbueIfx/t6fHlYAIKw
	NxRtWl/P2GcttorOaxX1XgciYRs299EH23WUDHbHT6FE9BtcNcDuxk/cNnfFfBzvYyXWzjBLjpWEh
	s+PFxzpCdtFv1XpRSX2MgsTX2L4N4kV1iCbbs2vaaEZVpUrV0BsmipA2LpnoMY/xhXIaONRP6/UgE
	EToNpVpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16Ug-00GhWj-Bz; Fri, 02 Dec 2022 13:54:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p16UV-00GhTZ-CE; Fri, 02 Dec 2022 13:54:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E98CA6224E;
	Fri,  2 Dec 2022 13:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D1CEC433D6;
	Fri,  2 Dec 2022 13:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669989250;
	bh=RFXCeixnCunq7uJ4AjC78qdV2fWmcwMrZZsz81rWnIM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SPfxmdxf9gwCFoh//pEuYmUPLbbBzxchJnkaB8/P9bagFZFkCT3YUalsgfm3eu9ta
	 qLrwpQ0FYMdGUlrXgFXrDIzeWS8MCI1Cc3RSga9uYWqGjSLrCi1lDo48dv21iuLnlE
	 kJv1h1FSSCkgpp9rZ7hqMttcfQSazDd/zUk50Do6FQpBM+i8t8EnUTE21DpdyG3dMU
	 rm2Amo6XlIM3Qh0F7G7pVQjEAaEW9aif51+fOJS3d1CNO7HeEilmg4kBqkMlrlQmE1
	 sCc2zKbgGc/7pObJV0p4z8cIs9Zyqxn7ymDwd3OtPb1KPrDktOqdFESfXhaoq3WllD
	 RXCBy0KDBOrLQ==
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Fabien Parent <fabien.parent@linaro.org>, Flora Fu <flora.fu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Mergnat <amergnat@baylibre.com>, Alessandro Zummo <a.zummo@towertech.it>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Tianping Fang <tianping.fang@mediatek.com>,
 Chen Zhong <chen.zhong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Pavel Machek <pavel@ucw.cz>,
 Liam Girdwood <lgirdwood@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-leds@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>
In-Reply-To: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
References: <20221005-mt6357-support-v7-0-477e60126749@baylibre.com>
Subject: Re: (subset) [PATCH v7 0/8] Add MediaTek MT6357 PMIC support
Message-Id: <166998924420.1252747.5635155323391634201.b4-ty@kernel.org>
Date: Fri, 02 Dec 2022 13:54:04 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.11.0-dev-8af31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_055411_514637_7D8CA4AB 
X-CRM114-Status: GOOD (  15.43  )
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

On Tue, 29 Nov 2022 16:56:59 +0100, Alexandre Mergnat wrote:
> This patch series adds MFD, PMIC keys, and regulator support for MT6357.
> MT6357 is a MediaTek PMIC very similar to MT6358.
> 
> Currently, MTK bindings related to the PMICs are not converted yet (still .txt):
> 
> soc/mediatek/pwrap.txt (all PMIC parent)
>       |
>       V
> mfd/mt6397.txt (support lot of mt63XX PMIC)
>       +---------------+----------------+---...
>       V               V                V
> regulator/...      rtc/...          codec/...
> 
> [...]

Applied to

   broonie/regulator.git for-next

Thanks!

[2/8] regulator: dt-bindings: Add binding schema for mt6357 regulators
      commit: b4387db19d7f1caf166852782a5f0e5a393bdf24
[7/8] regulator: add mt6357 regulator
      commit: dafc7cde23dca239987d3cd000b11cdccc3728ea

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

