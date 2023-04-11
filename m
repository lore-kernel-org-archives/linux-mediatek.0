Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA95AC77B6F
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 14:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EJY31vKESSqQgSiQdnKI3X1ewto8Z9NZDuHi7S6nkrY=; b=jQseKmdLrh04hvJZWXaa1fv9om
	tRo3TBCt/Gh6XLJE38adx5bNxXsbX2KNRNXxUDQlc8d3Jn4oIJ7I3jMyK4U1EmxoPwwI2CEj9UKp0
	S9ct7JmXY16H6FmJy2vGRU9SyRbtBW5j7VNE+RvJCHP8h1K60bmsCj9cYQDvkYWVY5G1xs+d3q8vy
	vFjTrX/VhRZzx0ZBKWjqUZ7a9lR0zzgwcZAwumyrKpUor52KMxb0DG7e0fGPMtdJo5sfT4DZ5lhxW
	CvzcnMvItIjJ8kUJsW7B16ZYhKDLr3S9Y0ZWhIznZW0WlFwuJQ8ZxXwlXi3YmLXHXQ5Jojcn91AFp
	B6FYqAPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEpx-000ETs-0V;
	Tue, 11 Apr 2023 14:19:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmEpt-000ESe-1Z;
	Tue, 11 Apr 2023 14:19:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B38F46258A;
	Tue, 11 Apr 2023 14:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76958C4339B;
	Tue, 11 Apr 2023 14:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681222744;
	bh=CRz1qKpKwD8iOnTccK2DJ8nejiS+LrBWdZansG+v2EA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ts4sT5p2+hBzUiZXcfVFsOx79tgIGcMH1lo+o6Rs1Ct7XWGHd/ynTuAWO1yazDV8h
	 m73m6+/csj4UjqarwfQ76oOBMoCF40nOdoTe3dtlgHJOH2fAiQ7n+v6hrdYs9mqlW3
	 5HIQSZRaerGGJFiwwOq+EAjY/UqVDLKoKjbPdth1fomaiHyG887M0vEtOZye6hcUrQ
	 JjMUBDv0SAnvEfUumaO+aO+Q+wtuX7u5MdbwHPdgCv8lazawaxFMSM67bBzHv9oUlH
	 8YK00fregUCzwove319mBVhj26tc8L5x0OnIEOgbsOZO0WpHV5YYpIPgj1IoKZpdyy
	 wGhtVG2+lfvzw==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Trevor Wu <trevor.wu@mediatek.com>, Guenter Roeck <groeck@chromium.org>, 
 Aashish Sharma <shraash@google.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 kernel test robot <lkp@intel.com>, Julia Lawall <julia.lawall@inria.fr>
In-Reply-To: <20230411003431.4048700-1-shraash@google.com>
References: <20230411003431.4048700-1-shraash@google.com>
Subject: Re: [PATCH] ASoC: mediatek: common: Fix refcount leak in
 parse_dai_link_info
Message-Id: <168122274119.54453.4476599786792187877.b4-ty@kernel.org>
Date: Tue, 11 Apr 2023 15:19:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-00303
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_071905_560735_CBFC2682 
X-CRM114-Status: GOOD (  13.68  )
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

On Tue, 11 Apr 2023 06:04:31 +0530, Aashish Sharma wrote:
> Add missing of_node_put()s before the returns to balance
> of_node_get()s and of_node_put()s, which may get unbalanced
> in case the for loop 'for_each_available_child_of_node' returns
> early.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: common: Fix refcount leak in parse_dai_link_info
      commit: beed115c2ce78f990222a29abed042582df4e87c

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


