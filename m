Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7526CD6E4A
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2026 12:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=piTnkLPmaovnb4JehLIKcBF8kfJ+2Lmc5BBe1o1b/Ro=; b=Ldw7hTnJlIq9wXjP4Lrh4Wjwkc
	8xxhO/Au0knk52KFNB4un8MLfYAVA0bHTQZvUd2B6mJ0CAnM1j9qId9flLyokKivSxkp6Sl20QRVn
	5G7sIBLHBGt/DOsyzddyi8mnfmdl8RkkaUrYfLXD4FQcSZ1v3Y6i10sddoBq9S0FjVr4Iq+jgx6OQ
	G/Kz2iGUpgPJ24BM12pXhrfRHOsY1/IPgbuHwoWeh5fYh0+DfM0GYfRUWWnSS+xoH07LPom0Ey6oZ
	G4FIU1TOrYkwf3V1Y464JHOqCMoiMcBiIgXIgcwQEDID+rxPLNuNQB+jVcrHBJqprrKAiItBxEKAm
	yvOoAr/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNuJ-0000000CwNy-2MHd;
	Tue, 02 Jun 2026 12:07:43 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUNuI-0000000CwMy-1rNA;
	Tue, 02 Jun 2026 12:07:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A9CCD601D8;
	Tue,  2 Jun 2026 12:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0231F00893;
	Tue,  2 Jun 2026 12:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780402061;
	bh=piTnkLPmaovnb4JehLIKcBF8kfJ+2Lmc5BBe1o1b/Ro=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aQDR6a85/gNL1/TB3WDLQSa02j/oiCMqmjVLw2BLWtGSbOliZ3pQJLlYVHS4L1nvp
	 KChzCEFkYJQwvJkVranEbIPz8ZHpIJ0TF0beIvtJWm5Gah2DdNRfLvLTKqkc/zI22/
	 eobnXz/z0Mt3wTBd1Vpt/XlR5w0ekmY0Euw9jz9fPSJWYpj5ppwdwiBgrsWGpZFgHu
	 tUde5NiK3VpIGSW5HqVUBFqSfRn2D8k0EGYkmtxs52oiy59kYaFpyfJAN6v4i7oc1a
	 oD48giuCOQxmB8RP74gWJHaXdWR1guTwUyWmGvcLdIqKgxVBnhH9MNwbIEZkRUQ+nw
	 TDY/j7kpQIMMw==
From: Mark Brown <broonie@kernel.org>
To: linux-sound@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20260522014515.719973-1-rosenp@gmail.com>
References: <20260522014515.719973-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] ASoC: mediatek: mt2701: fix snprintf bounds
Message-Id: <178032240947.44654.12124048713123707403.b4-ty@b4>
Date: Mon, 01 Jun 2026 15:00:09 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Z2F8t9fU811BFxxoK51+9dLVAEx76j4Hzj998FZYsXI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqHseKKYdV4Z452J656y6aP6G6fsrlPshcn5unD
 kmtyEXaPvWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCah7HigAKCRAk1otyXVSH
 0B4TB/9Ll3DUSLpEBaINpdMPQqk5RjpSd19IwduAoA1oQrE+5jXrhyLYBXm1r2opP/5gbTDxusP
 EnlTH0xoiq0eaHLPm4iQT3ieL1TVBvM8IDxvvKO5hwdsqh1BWhqolXacsurrC/DNRD0jmh2Zd/A
 6dZifBXYXWMRQG8xc2uw7d22l//V3b12siI710llphPcHhx4SFXQWFKV4vbbj/SMiZ863sJfSlq
 +mFP3PMd39UzrQnFWygz//BXvLjY1OWBxYLycruT25fMcM4fdXHYk4A9YoU1wlPnc7tzrsJHUtI
 TRjnwYaSxF5Nv1Ts3xt+TV7Fd42yW36qA2wlI/r6MDvThLJV
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

On Thu, 21 May 2026 18:45:15 -0700, Rosen Penev wrote:
> ASoC: mediatek: mt2701: fix snprintf bounds

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: mediatek: mt2701: fix snprintf bounds
      https://git.kernel.org/broonie/sound/c/6c52e58dbdae

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


