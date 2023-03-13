Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2823C6FD19
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Mar 2023 18:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vTsMXNc65OipbsCbY1erxjCgutOBgLPWH4O5ZeTp2K0=; b=af1KkezrEPRRJdHtgsKSTuVLdk
	PPGc/W/LbT/Idj2yi1iBB6jwxBZOeZxDdrEfjJvRSVCsEeUUSYWFnmYgXJ5kYPZgxlTaaWH6v8MqQ
	2VhSiekhYUHbNywnzztfjz8L8zQhaicO6yATBQVkfbIP3ESxPRtkEElzUwlHE0dQ1VVI3FdsueIMH
	OODA3M0e2AHx3ZoNzWTi8V0byAFk4XxCtmD4+Ibd8QMvu1ubJmsoJTxsDpgoaoDrR2vwAuWhIK+UO
	WnBggTy+whTI/djCUDxJy8scVet1dHkdINEweChdCg7z2DjG12Xd3V0wEWOuURT0yOScF2k7Xfuyg
	vDzem6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbmmo-007HGO-UA; Mon, 13 Mar 2023 18:20:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbmmc-007HDN-Of; Mon, 13 Mar 2023 18:20:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DDBAF6146B;
	Mon, 13 Mar 2023 18:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB93AC433D2;
	Mon, 13 Mar 2023 18:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678731629;
	bh=1k+17pceWuz4rSCcRjkRFIddbKW4ybClD+tgo7no39E=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Ilby0VO8KhswP+sNBOB1Scx6AP/OGbMJswQgv6SUaOS/JihC1/IN66ytBUWIYi/L9
	 jg1hnG1M4HK7pzXvCisry0+UdXjEQeyE0jEmIR9wieYbq+9hIKVXZwAh6Rb0HN2Qos
	 qYwaGbi3GO1cwASGE05A+h2zZ4Dgm6K0whZdHye188J7bVITqcTeL6GjWu1bPC2RBB
	 3wBN+JNxQuUglraoSEBrhIaund88t9dkv2zpiK37WJHYkx0ahbQth9HmhERlb76Egu
	 fuudSeztn+3Pd45badX1HRQODgBEWpcEmqvXtYag7AYFMm6jcNNxOb1YwlY/us59uf
	 Nz+oFG/J9J1aw==
From: Mark Brown <broonie@kernel.org>
To: Kamal Dasu <kdasu.kdev@gmail.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>, 
 Andi Shyti <andi@etezian.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
References: <20230310222857.315629-1-krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 01/16] spi: armada-3700: Drop of_match_ptr for
 ID table
Message-Id: <167873162468.102913.17330751630125213207.b4-ty@kernel.org>
Date: Mon, 13 Mar 2023 18:20:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13-dev-bd1bf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230313_112030_922465_A3A15EE6 
X-CRM114-Status: GOOD (  14.51  )
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

On Fri, 10 Mar 2023 23:28:42 +0100, Krzysztof Kozlowski wrote:
> The driver can match only via the DT table so the table should be always
> used and the of_match_ptr does not have any sense (this also allows ACPI
> matching via PRP0001, even though it is not relevant here).
> 
>   drivers/spi/spi-armada-3700.c:807:34: error: ‘a3700_spi_dt_ids’ defined but not used [-Werror=unused-const-variable=]
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[12/16] spi: pxa2xx: Mark OF related data as maybe unused
        commit: d94df25e8b9c8deefc5d7fcd344eb5d4bd41cf7b
[13/16] spi: bcm-qspi: Mark OF related data as maybe unused
        commit: 6340fdf2e13c5f1ff3a9622f0cb3b8e9c3955a31
[14/16] spi: sh-msiof: Mark OF related data as maybe unused
        commit: d946b6b0ed01949b1a3856e03469361fc9168318
[15/16] spi: sc18is602: Mark OF related data as maybe unused
        commit: 833f43308234600e934e9c6fa70fd8b7eebc632b
[16/16] spi: rspi: Mark OF related data as maybe unused
        commit: edfa970370a759c2c6a38b2884887937b1aea552

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


