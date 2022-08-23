Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EECDC32789
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 18:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nw4nblBE9spZ19olIRVzFTYVUzxPvbQMTrBd3vT4Jko=; b=VX9LiABE12qA8nkRnbAOXGjEL0
	KZt0JQN66hD8Ai9ztXL8v9kYTX7AjQCx8HSzVm4GqUbfjTInTSraWMhy8P6t6DxVzMIj8E1e0Wr8B
	fbfvlzhXLuU7tD8N2a9K8ylPB7BnPI71RMX29db0+SWlcCXAEtMRLUoUESTaQAbUZHpEtrmqSPJQN
	HriT5DWuvy985KYuu1o+R0/tEz1NyPS7Sx7S+OscafNSN226cOA3vOsTLuvMuTQQi7Ou9fltrnISX
	QUTuL5gYTm35hPS1AJp6UrlNp/NRywnJQIDj4FM9uX2MYwK4Br5msHprdYPiCffEvGK3xcDECYw9X
	b+ivIRSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYys-008HlN-TY; Tue, 23 Aug 2022 18:50:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYyW-008H7W-Rb; Tue, 23 Aug 2022 18:50:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B63461716;
	Tue, 23 Aug 2022 18:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D17C43470;
	Tue, 23 Aug 2022 18:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661280608;
	bh=cs17o2i+l63HI0ig2H81rSYNYdqBTrrXaJ5UfzE3tPc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gegl/xff6oBa1d0RalUiCoq2qAl+HPe9CyA9nd/UG7QePRTIknGOT3k4AjlyiZ32y
	 2R3nsWxlw8i+Iqlnn2fVIAiPTAHl3dUnW2HWx/i7n/KBFWyT4RaIE40VUdftjNlnOJ
	 yEqfzL/mjGr3IbqSG3gJ0S+unCR1frZsQVtZqYpaEImQpJPbnNPaA+pDQ6GbkzJeL7
	 BPKTkD6TiH7CIXMz7mjYOaQeQTYkvikFmFV2O4d/XkxlxAAT6z0SaS9XIHecFgqDQK
	 XVHahS97Iw1Mt8VPBaf7ElESu2yPUJ7U1Lvgmm5Ytpoy1oRWQMv3paz7CH+eD+VnId
	 D7K5e8AdNPuxg==
From: Mark Brown <broonie@kernel.org>
To: angelogioacchino.delregno@collabora.com, nfraprado@collabora.com, Chunxu Li <chunxu.li@mediatek.com>,
 lgirdwood@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, jiaxin.yu@mediatek.com, matthias.bgg@gmail.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, project_global_chrome_upstream_group@mediatek.com, linux-kernel@vger.kernel.org
In-Reply-To: <20220823090735.12176-1-chunxu.li@mediatek.com>
References: <20220823090735.12176-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: rename sound card name
Message-Id: <166128060567.1031684.10706581523547029443.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:50:05 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_115008_949162_F985F63C 
X-CRM114-Status: GOOD (  12.89  )
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

On Tue, 23 Aug 2022 17:07:35 +0800, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> The field 'topology_shortname' in 'snd_soc_card' is defined as char[32],
> Current card name will be truncated when SOF is enabled, so rename the
> sound card name.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: rename sound card name
      commit: e8ee449bd7a45e871fc84fe51c773f7a6e68a02f

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

