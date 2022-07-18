Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99895C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 14:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hg3iXY1o7QqdSzzmthQ+yqIXe5tHwrVs7bf3daQB6wg=; b=uhQSD3X4yOBrFpC9PbWqJof/Jc
	IE0hyr244flP1b0sEnECxHVWoA6qsuNKEKvW86kZOgZ3DOb1A1xZ4avEQxNmCVyp3aEEF4nOGMuPI
	Bag2jG66ux0wzGqgNlgqWPkwfRFW4hsqrwpg7JY3EuoPT3UhGH5S3jOzxpfIkd1ib64rNIkz15NAI
	2/az9t+49qMdTnFS/1VaXQz1BzymOERwl/z5bM1BUW6+soVHcG7T2cmUuo3Tnv1YC2ymzBS4L0GOr
	RDS8iLrXmQF4Cu5T0hbrzS+dhhYjBUWEQw+O7lTNaGz0X92Ol1srtH+bvmqILeeKZy9qKZNKKy10y
	f/XNeoVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRXs-00EYak-Gp; Mon, 18 Jul 2022 14:16:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDRXb-00EYNM-4h; Mon, 18 Jul 2022 14:16:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A80F60A5C;
	Mon, 18 Jul 2022 14:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7383DC341C0;
	Mon, 18 Jul 2022 14:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658153765;
	bh=aLKEXqH+iK0TIbbqnSk+kdHP+hrFwQ1Kd8T8kvQmRiU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qpyLZyEX+qCdhosZiguYz6Fkw6k8+mA1UaPjdTIeW1OSm2P4VD5/4ZcYxe+MDTplE
	 /rAYVDXhurNNN/zl5hEAJ8/SQ2Ru8B/7yrd3156oRLwtnRg3EuN5X8PN1/j1xuQON8
	 hb1YW3PPHxlt1ZgndPwp5uZwdweMCVumxPwxpQktJOOHTdsh8tect8539E6YAcZcJj
	 NgtipGFq1xlN44poqlyeyxvTRBAj4TaBiZT+WdLIp3fRwUzyO2ItV/Yu6f3MiwcNDu
	 Yri6ojb+N+2FzPDAfWL4j0GS9Nnfrd/yYdiA7DyGmSibZjf3dtLMwcKXgb+ah5dOHy
	 L2B2tt80Bat/g==
From: Mark Brown <broonie@kernel.org>
To: srinivas.kandagatla@linaro.org, matthias.bgg@gmail.com, robh+dt@kernel.org, johnson.wang@mediatek.com, krzysztof.kozlowski+dt@linaro.org
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20220715120114.4243-1-johnson.wang@mediatek.com>
References: <20220715120114.4243-1-johnson.wang@mediatek.com>
Subject: Re: (subset) [PATCH 1/3] spi: dt-bindings: Add compatible for MediaTek MT8188
Message-Id: <165815376317.235243.3004661183751772073.b4-ty@kernel.org>
Date: Mon, 18 Jul 2022 15:16:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_071607_239074_80BEC886 
X-CRM114-Status: GOOD (  11.51  )
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

On Fri, 15 Jul 2022 20:01:12 +0800, Johnson Wang wrote:
> This commit adds dt-binding documentation of spi bus for MediaTek MT8188
> SoC platform.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: dt-bindings: Add compatible for MediaTek MT8188
      commit: 0ee0ab0bdab4f9e6754cc6a294e90c46b53f565b

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

