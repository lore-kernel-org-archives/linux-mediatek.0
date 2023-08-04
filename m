Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCC4C001DE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 16:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LyHD1yV2bJDAhL6yCAU8kaYRct3HjQ5s+oa9dgsR0hU=; b=DDztVJ4qL7MyxDrWqykIXjkNBA
	7MttPg2HQc4vnUiCZlW8c7TKQ3FLfqW7KbvM4p0bOA1X0srwAXLv5zPVHp11wwP0cbOQQjvC+366C
	wvsbMEAkcMyXGlqdYlNPhOBINm33FtGim9WV+6ktfcYgLt5+G4aYSTWugYgxLinooiBhcGS/OpHeH
	+IkBnGS7T74OeIaDqOy/KrHpKFWfNdq/ZSLBbV+rXUneD5SnBhrCtSOj5WQlTaripPraqgQjxdBux
	FufsAPplSIzu49xiKwLbyFbkCBbUGsKeEfLOzQFpod9JEFByRx0G4uADfl28h3S1cNOwfmFgPxyUq
	75z2H5WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRy7K-00CqLP-05;
	Fri, 04 Aug 2023 16:57:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRy7F-00CqK0-2t;
	Fri, 04 Aug 2023 16:57:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C2A9620D2;
	Fri,  4 Aug 2023 16:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A87BC433C7;
	Fri,  4 Aug 2023 16:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691168249;
	bh=EypImsegK9bJKnJsBqy304+rYPk0LV8Bbnk7RSxHhMQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EqmSMS7TudlJ8JTc68GnSkQ6v1QbSvx9urhSxPhIn/xrw5CTd1uycJqW1/W0L5bC3
	 ljN6G13tUtgvK7PVwW47ThVqaEbCpgUF6+uD7cN6LDO93uFywUhiGt/bBv3J9TL5NK
	 YLbNxe2WbSqUI1beL+vIS4IxDbYPZpqbt5NWHblnyiXGY7AgyTp0nuGuoLBr4bpmQO
	 WH5YwDEOcPn9xfBYlZ0kmRoWo8qzvdsJmb/IW2ackNKNMZS62bmq2VVla2dIBe1+Iq
	 zZlRnfWHNJtbL/AOvQZOv7fQ2i7V/QD96XsnUNt3kzRhTDBaX+AH8tuYpYy72Hx6sh
	 zUSZwSs/CmwHg==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com, 
 yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, 
 kai.vehmanen@linux.intel.com, daniel.baluta@nxp.com, lgirdwood@gmail.com, 
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com, 
 angelogioacchino.delregno@collabora.com, Trevor Wu <trevor.wu@mediatek.com>
Cc: yc.hung@mediatek.com, allen-kh.cheng@mediatek.com, 
 sound-open-firmware@alsa-project.org, alsa-devel@alsa-project.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20230803075028.32170-1-trevor.wu@mediatek.com>
References: <20230803075028.32170-1-trevor.wu@mediatek.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: mt8186 modify dram type as
 non-cache
Message-Id: <169116824521.110745.9626523635220489877.b4-ty@kernel.org>
Date: Fri, 04 Aug 2023 17:57:25 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-034f2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_095729_976743_C85C0A07 
X-CRM114-Status: GOOD (  12.94  )
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

On Thu, 03 Aug 2023 15:50:28 +0800, Trevor Wu wrote:
> To prevent incorrect access between the host and DSP sides, we need to
> modify DRAM as a non-cache memory type. Additionally, we can retrieve
> the size of shared DMA from the device tree.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: mt8186 modify dram type as non-cache
      commit: 1d54134df47684ee29d4d4bbe28174a4282389e0

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


