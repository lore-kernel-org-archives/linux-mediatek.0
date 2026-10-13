Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DE8CC6B1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 10:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LWAleCpYBlToJ7/WPCLhRt8yE2399HoszrhXc5+pn3Q=; b=FeWxpTzOAO6eQsuUFdlmTzU5tY
	VWBkr4oJBT2OOmmDTaPEr+M9RCeCC/MXsfqmtPlYDVau6M5/NrjBxlLxv2QC3+nTvjZN+Anpj4qdP
	55J4XXU4JAdqjBvXpGcvDC55acHYP1V5joDKgZJG8lVEzfx0r9j5zd4iKysw7kKdz9RIrBP5qTO/R
	+J44r4tgmbEcdvFkmJHne7d4n6vpZTlyVQ91iThEalr3q1RMCR5asGINJtj86ry/YfY0rXKISBvkp
	JXMeXmRK6OPMRx1SE1XEum4u+uZelcfJZ6oyLmsKySBGIplSfuVa2kp+2nPG5QvNN1eOYWqZRVKvX
	AwzYx7hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwE4-0000000FDA7-0rvb;
	Wed, 14 Oct 2026 10:28:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGwDv-0000000FD6o-01B4;
	Wed, 14 Oct 2026 10:28:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 73C6043A2A;
	Wed, 14 Oct 2026 10:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC03E1F000FF;
	Wed, 14 Oct 2026 10:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791973718;
	bh=LWAleCpYBlToJ7/WPCLhRt8yE2399HoszrhXc5+pn3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Cil4DIOKlCtMK0ChHPWRGsZIkuR+ETSpqNy02sPVq6qd79JT2tCNTFJgNM8Swqxmn
	 aol69v8n/1Q2kFlnLE84DnP2ABZpg7L8lpRt5fvMvdWQI2h+tuogX7GHZMsYwQvZHl
	 sb6m98FQDtJAx/zg/RGu1FNkxkXPWNmbjtwpXi3b7arjHiStM3YnRIR5naVxJUrx/a
	 eZzVmMBN2RLEcxGWajgFN4LleEJRW+NzM/sk2KbrXPlxDCeeDga+ITxHqOfkB5nteI
	 UQU15jwJ2oabwmaJZo5/361elT8+VpOHlZqB7Zi/h7zYsQVDWGjmNuQNaknGL6ExWi
	 nu/RHwvE1FR/Q==
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 cassiogabrielcontato@gmail.com, Haotian Zhang <vulab@iscas.ac.cn>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>, 
 Cyril Chao <Cyril.Chao@mediatek.com>, Tuo Li <islituo@gmail.com>, 
 Rosen Penev <rosenp@gmail.com>, Garlic Tseng <garlic.tseng@mediatek.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Dan Carpenter <error27@gmail.com>, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261006101606.54079-1-phucduc.bui@gmail.com>
References: <20261006101606.54079-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/4] ASoC: mediatek: Return 0 from FE startup on
 success
Message-Id: <179192410143.1606900.17860222773161459120.b4-ty@b4>
Date: Tue, 13 Oct 2026 21:41:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1818; i=broonie@kernel.org;
 h=from:subject:message-id; bh=skJdmd3tUQHGVzD6TZQsGKOJkI7UvX0V36y4xyypgz4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLORwbGPL+V+6Wu8NuXVRZFikcVeRwqUx/oLOV4qGigb
 SWmwrqwo5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABOZM4fhv2Oqd3VAaLfuiY6v
 k0UdLq7lZVwt+tLyfNzEi9PFDLf++sjI0PBzlvkUvZZVjys/zYivKNtsfGNO4cGHqgEL8leEnvE
 /xAsA
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

On Tue, 06 Oct 2026 17:16:02 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: Return 0 from FE startup on success
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> Some FE startup callbacks may return a positive value from constraint
> helpers, but ASoC expects 0 on success. This can cause .shutdown() to be
> skipped during rollback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.4

Thanks!

[1/4] ASoC: mediatek: common: return 0 from mtk_afe_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/5bbd6696d75e
[2/4] ASoC: mediatek: mt8188: return 0 from mt8188_afe_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/b6b3dbee98f1
[3/4] ASoC: mediatek: mt8189:return 0 from mt8189_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/f63317c826c4
[4/4] ASoC: mediatek: mt8365: return 0 from mt8365_afe_fe_startup() on success
      https://git.kernel.org/broonie/sound/c/240f11af9c80

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


