Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01E79C04AA5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 12:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RpKP/3hgS7zD6yw3UQjzSyf/WlpyxgPz62sqofyMskE=; b=xiVHuA1vaAuB1MJCrAsIszvan6
	CI8GVztdj9scDLUT6hgGe/nQbRCrSSKqg823ju6UDN1rhJm/aqdV77pmN8I2IDUGKZWK6A2mY/+Oj
	x8YmhcQ6tqjReAqbnoTx7cyQiAJ9Ucf6o0oLNFbjZSEXP5OBJRRP6nRGYEv0v+cv32GPahRz9hcKb
	ZZaKzKZG+K1/qS2QxRYV94dxpjWS6RmeO/CKlFyNcnrEKwQwYGg6Mi1qU0jeIxSLS+y5F/XXd9qoE
	z8Ed3p6TpuJaQ4T18Lilr/DZNwbBmCJHKfmQUrcc6QwtXZxDwoBk2GmtgWzfF62M7NQzd6gx4pNlY
	OrCZyPvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCEf-00DydS-Rp; Thu, 25 Aug 2022 12:45:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCET-00DyWl-Cy; Thu, 25 Aug 2022 12:45:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BB2F461C35;
	Thu, 25 Aug 2022 12:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D60BC433D6;
	Thu, 25 Aug 2022 12:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661431512;
	bh=pOtQJt9kEx8p4pkA3MWq57CKBS+/4IwMA0AR5ke4v1I=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=lLxYM08fBDiqRFJl+zb/yqfIPSKEf49j9HQmj4Z9tJE3OGdfTXFYWLu7FXCPzxeDy
	 oK5AqfeNt0cm9eak1kACO5Koe0/tw4RgysM9ymQU1Qi1GyW3xTCth170Hb3n9P/p1/
	 dSJWO9Sshl0uaCsBvMdP2fJPjBsz28lCINbX1EZJ31pSYtUn8/Gjm/lKdebdHd9QsC
	 Va1KwNKEBRBl9IutX0nwRB/oYxzZX0voLVYmW089GdfU39B+dndwyhSuCLBXZJ5v7G
	 huP+/N2uTUj0g80haKehKDsRhENjpkmm7WPV7oempVCt2icrrKv76Afkx/GhyMOIot
	 OZH+Y1hwQ6sSg==
From: Mark Brown <broonie@kernel.org>
To: peter.ujfalusi@linux.intel.com, lgirdwood@gmail.com, pierre-louis.bossart@linux.intel.com,
 Chunxu Li <chunxu.li@mediatek.com>, daniel.baluta@nxp.com, angelogioacchino.delregno@collabora.com
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org, project_global_chrome_upstream_group@mediatek.com,
 yc.hung@mediatek.com, linux-kernel@vger.kernel.org
In-Reply-To: <20220825065411.31279-1-chunxu.li@mediatek.com>
References: <20220825065411.31279-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH 0/3] ASoC: SOF: mediatek: update SOF driver for mt8186
Message-Id: <166143150803.98448.11310238712995264626.b4-ty@kernel.org>
Date: Thu, 25 Aug 2022 13:45:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_054513_500112_B88ABFC0 
X-CRM114-Status: GOOD (  13.53  )
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

On Thu, 25 Aug 2022 14:54:08 +0800, Chunxu Li wrote:
> In these patches, we update SOF driver for mt8186
> 
> Chunxu Li (3):
>   ASoC: SOF: mediatek: Add dai driver for mt8186
>   ASoC: SOF: mediatek: add snd_sof_dsp_ops callbacks for pcm and mail
>     box
>   ASoC: SOF: mediatek: Use generic implementation for .ipc_msg_data
>     field
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/3] ASoC: SOF: mediatek: Add dai driver for mt8186
      commit: f3b75e9b56780e3bfaa910e560cb9ba4d8f38e53
[2/3] ASoC: SOF: mediatek: add snd_sof_dsp_ops callbacks for pcm and mail box
      commit: 82e93430e0ad13cc31e411cfa575e63118bb0ed4
[3/3] ASoC: SOF: mediatek: Use generic implementation for .ipc_msg_data field
      commit: 059846071f468da8389dcb8b8bbb38a781b02955

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

