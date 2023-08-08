Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C454CC001B0
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Aug 2023 17:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3zA4+kW9ou/Ai2rxJFEtIuJMqdSONhERY2J3z9xnJAs=; b=DnMATAcyuHN5rRdxgrWqkG0O6g
	twufdtgCrlhsPvZOmuKU7W/h7yyTQXiHqoMaOXFUmntOQd1OWDK2vCyuzgrSwMDKxWKFYrovNYtKR
	qbusd+sZ/r6Fr6dj1uf+naFmwwMI4r/a5Lej/jUMQDW2sYuZvu/CD8LNSbjgnG9vks5oIaO9QvkpA
	jmym/wBIQvAKcFYXTviDlnqJnP8eYZqfc8kIqfGbCHq0WU+ZBk58wZy1kH+jzKvRGkD25XlPvD4nq
	jGK5rKEG5UkpHfBo0CgCeLGFvdefhEX0VC8HljQe/v0ekAnMfBBrc7wBzKfjAudwh8Wj2NLP99YkA
	AKfyZZIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTQ6S-0034hz-0r;
	Tue, 08 Aug 2023 17:02:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTQ6O-0034gp-2O;
	Tue, 08 Aug 2023 17:02:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 30E1F62811;
	Tue,  8 Aug 2023 17:02:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9664C433CA;
	Tue,  8 Aug 2023 17:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691514155;
	bh=ATXpfxlq2nkVzaslrJEtPL7Am1LPKQ5nq2x9hWexo9A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=VqehRm5FttgFzXgTZNvxsHCKo6dwAPk9EklpjDPrze+zGQ+Q8VGADnGr1umjHfufn
	 54ZxjciXNdsAUhOnNio5g1VoPdfLfz8bb232ZZun7gZLuTw0nO1HPzD27FrjK0Gv70
	 quYZ5DCR+obScBWw/Z7bS+2kGU0POXpNeFX+Bf0VwNrRC7JZTV9emjZK/OUNADAQDV
	 /hdPRsou1GAGvQyzTD1Z9y2gxhfdD1TBXuHkVQ3/Q9vQ7nNIyDaPBuCnNTUtNM8St/
	 eODKIgaOXVmx71/hIp17f4x9k0FaIwkj0La8EvHUr8jjjcl207KBfeNcHy2UhNztrz
	 dgJdKXDILsQ/w==
From: Mark Brown <broonie@kernel.org>
To: Tony Lindgren <tony@atomide.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Claudiu Beznea <claudiu.beznea@microchip.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
References: <20230808-descriptors-regulator-v1-0-939b5e84dd18@linaro.org>
Subject: Re: [PATCH 00/11] Regulator legacy GPIO header removal
Message-Id: <169151415259.72832.7760300817402372059.b4-ty@kernel.org>
Date: Tue, 08 Aug 2023 18:02:32 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_100236_865836_89FD3DB5 
X-CRM114-Status: GOOD (  11.80  )
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

On Tue, 08 Aug 2023 15:46:27 +0200, Linus Walleij wrote:
> This removes some low hanging dangling <linux/gpio.h>
> includes.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[01/11] regulator: tps65910: Drop useless header
        commit: 9b966639b0cc742a9c4b6329a8e27128e4424cf1
[02/11] regulator: s2mpa01: Drop useless header
        commit: d0d58fe27b344fb6d0edb5fd2038372b5e5ed95b
[03/11] regulator: rpi-panel-attiny: Drop useless header
        commit: 052eff402fb754f3472833cb679ceef954ebf2a0
[04/11] regulator: rk808: Drop useless headers
        (no commit info)
[05/11] regulator: rc5t583: Drop useless header
        commit: 2f26d97863f05b83b8f7872aff81ecb9d6b76b50
[06/11] regulator: mt6311: Drop useless header
        commit: 4eb351fb89d68efeaca3625dccbbf492f5450801
[07/11] regulator: mcp16502: Drop useless header
        commit: 2e903eac35ec0ea1f44af5a53d87d98309295fc3
[08/11] regulator: max20086: Drop useless header
        commit: d150c73aa233d6469392282ef648dba5fd4b4821
[09/11] regulator: lp8755: Drop useless header
        commit: e4d48f64fcd469feeb09fc452f8cd1dfc00b43f6
[10/11] regulator: bd71828: Drop useless header
        commit: a5c9a1444088099c6d52939ed2f34049d5d00b5f
[11/11] regulator: bd71815: Drop useless header
        commit: f321708da4db6b15a8691dc64b2d5169234937bc

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


