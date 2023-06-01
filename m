Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACEBEC77B7A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 14:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EqeCrPQsLEQuntX99/rNUtI/8qt79bZb1lvjLcl7+QU=; b=fCgKxqe0QDgvNTYFX3+HVYYoo9
	sO9T+TK02gWvYlDBTOZbZOdjMYIwjVuhlKFQm3OJWAg6XvTib5yaR9CYqng+f4n8EZYlbLKk8ePZc
	oqPv4Q490Dvdve1JM64aTD2RGxICmhcs616KgCt8jsEYvcK7lfJ+R95WPUEtZmCK5a81fEuHrmbdg
	XEQm46NyATa27e5YskKoYisdsZkUx094uIdlpn7RJMa/iv5tvHcj/131d4HglbirhyfrUACnBBomP
	VoCW+GDnDOYAR6Y61EpXSU/U/Bp/+mG5O4ShCqtK3CBlXztcC8t0C4IidQLe3ovV4EgqR6i0zP5Oy
	y3+FKctA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4j2X-003nNm-1p;
	Thu, 01 Jun 2023 14:12:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4j2U-003nMq-1E;
	Thu, 01 Jun 2023 14:12:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D203263530;
	Thu,  1 Jun 2023 14:12:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E41C4339B;
	Thu,  1 Jun 2023 14:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685628749;
	bh=dtgREO1rMn6LkUwpPKQhnN0y9K6Zffo816EVEew9pHQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Fb3putoiBUseFxJkwI+s9QSkuvasX8/A5gDmxQ/w+TyYMG/Llp8B7QBEANUoL3TVf
	 3KTFmwfVkMp6gdOD6qu/yIyW3otXaK3GSmzcZHIZ78D22dYUBZiyvVbvhYNwQBB+Q8
	 /7LFB3TfGtd6w2fCNPxg0sDfgWxq8xY/eXxGHZwvLeJhCbxj5YUwdFLfeVCFG8q6SP
	 rqQJ6mQoJkHMx9+ciFXdNxltmvar6WyiIO2K/rfAdIHwWLYJksfL7pOmDow5tH5Pmp
	 L7OqQZXGNbn/AW1Pzsu/79pnsKVx93OBf/Z1fDVMLaS6vtL++NK14gemju4XYvG1SB
	 XhNTl8argwSCA==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com, 
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, Trevor Wu <trevor.wu@mediatek.com>
Cc: yc.hung@mediatek.com, tinghan.shen@mediatek.com, 
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230601034939.15802-1-trevor.wu@mediatek.com>
References: <20230601034939.15802-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH v3 0/1] ASoC: SOF: add mt8188 audio support
Message-Id: <168562874539.66708.811919351455149149.b4-ty@kernel.org>
Date: Thu, 01 Jun 2023 15:12:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-bfdf5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_071230_483539_0D8B6C79 
X-CRM114-Status: GOOD (  14.06  )
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

On Thu, 01 Jun 2023 11:49:38 +0800, Trevor Wu wrote:
> This series adds mt8188 audio support and dbg_dump callback for
> mt8186 and mt8188.
> 
> Changes since v2:
>   - resend the correct patch for adsp debug dump
> 
> Changes since v1:
>   - fix typo
>   - adopt reviewer's suggestion
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: add adsp debug dump
      commit: 089adf33701426869dd50d1b8b8a4abd25ae39ae

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


