Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0297C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 23:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ZqL23m0nBa3Yj3ZCldHRefm+uZ/UNNnlLbjzurWWEg=; b=R2dF610ZwVonSyNDBUpBh+OiEl
	ZIsjV+U+qXryDmCsnSCWuaQgHkyKp9F0ay5lquN7klLzB+TgKMGNzvPa796yOE4SAaOrxUKpDLo9Y
	UrtbRKY8VZ+Cndmua5PLN07WrwtDw9gOMD1E/mBPsN0Bd2w0oMg8e2rDwiFvSVBO2l7OoYWe+Q9fU
	SCiPkzXLnL/auADn0lCDRQ8GNch9f1YCPi1N6dd4syUfY1eyZKmTBjUyK3hQc/t6s2seA3+6ptOaW
	QJA/dDk/rPNFB08pgWfX2/FMsFztZwOmY/qyHwXkbBVacmaVcVcRdcpvaKV24G5RE6ZbzB3BoXjw2
	YgqNvj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEIrq-00D1up-Sv; Wed, 20 Jul 2022 23:12:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEIre-00D1fD-1k; Wed, 20 Jul 2022 23:12:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9B87161DE6;
	Wed, 20 Jul 2022 23:12:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ECBAC3411E;
	Wed, 20 Jul 2022 23:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658358740;
	bh=aOLwg6/EISYMyb84RQNgohTNXRsQHE5/pdLsiinq944=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g3dcb437XYFf4PzH68vCmRlXnNdvzvZEvE/Bp7DI3beYSjS9yXZzMcVlVt7gW1Qja
	 pAzR67tUFuZt0bmB+LnNEhiNyxKO8jA+jWHs8I3Wge0rsUMrHkQ2pQSURuq7Mt68Cf
	 1nzG2+VTUYk7lfzP+xe9Ja88+XgqAf+PrQBFwxrRtbwL7A/hC8+TQXcwgGEvYRDvvX
	 Yj7CkvaTtFxNJG4Ns/9BJ6n2T0V2Lq5w4KrydwuBbzdd9JQTRl2vDgcTYZseeJ/jqO
	 qweTTsAkaq89uLLpzXyC5v2gXm/Nae9oQwVE0PcJ+JCYMu7wAttbzLthQkpUA07me9
	 BbwSjOAtCTl3w==
From: Mark Brown <broonie@kernel.org>
To: jiaxin.yu@mediatek.com, angelogioacchino.delregno@collabora.com, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tzungbi@google.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, julianbraha@gmail.com, trevor.wu@mediatek.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, aaronyu@google.com, Project_Global_Chrome_Upstream_Group@mediatek.com
In-Reply-To: <20220718162204.26238-1-jiaxin.yu@mediatek.com>
References: <20220718162204.26238-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH v10 0/8] ASoC: mediatek: Add support for MT8186 SoC
Message-Id: <165835873701.1007579.13802197177165168890.b4-ty@kernel.org>
Date: Thu, 21 Jul 2022 00:12:17 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_161222_187571_F18D6387 
X-CRM114-Status: GOOD (  14.09  )
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

On Tue, 19 Jul 2022 00:21:56 +0800, Jiaxin Yu wrote:
> This series of patches adds support for Mediatek AFE of MT8186 Soc.
> Patches are based on broonie tree "for-next" branch.
> 
> Changes since v9:
>   - Drop the definitions that unused in mt8186-afe-common.h.
>   - Use device_get_match_data() instead of of_device_get_match_data().
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/8] dt-bindings: mediatek: mt6358: add new compatible for using mt6366
      commit: 8f57d8b149b1e46b4ffa707634fe76532ec89e83
[2/8] ASoC: mediatek: mt8186: add platform driver
      commit: 097e874ad3fc69601e2b142ff3b638893c355b41
[3/8] ASoC: mediatek: mt8186: add mt8186-mt6366 common driver
      commit: a809ded89d1d982ac05d8a3c6c943b49ff1b94fa
[4/8] dt-bindings: mediatek: mt8186: add audio afe document
      commit: 344afef6b980be569f4e9325778ca6869fed82cd
[5/8] ASoC: mediatek: mt8186: add machine driver with mt6366, da7219 and max98357
      commit: 3c6e24b65b53ce22c30492b9f239853b01d2d5b2
[6/8] dt-bindings: mediatek: mt8186: add mt8186-mt6366-da7219-max98357 document
      commit: 8a8da1e6af18f51b719a142fde92e5db56a129a0
[7/8] ASoC: mediatek: mt8186: add machine driver with mt6366, rt1019 and rt5682s
      commit: 0da16e370dd7a17b33b6fa2769ad9536389a0e12
[8/8] dt-bindings: mediatek: mt8186: add mt8186-mt6366-rt1019-rt5682s document
      commit: 1bcca73ee596e46e84782514621062c0ddf9d24f

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

