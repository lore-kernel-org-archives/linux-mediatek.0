Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5447C32772
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Aug 2022 18:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zy4NBg3FJPfatvmYMll5sRtKu0bMcLDlKjPuD3Ki1Bk=; b=E5oW5ddUk8JBtH+0uBfExkZfau
	DDXUbjYzW/hlAOz1MzYRT2IqqA+gAjlJoW7SilzeXPZldeVGEcvVQVyPpkCvkZCyLVgsVFrS9BBBI
	xNGU4EYdRwIdOhNoKeu6gE8eVi/8i0D+PdqFNwyHX/92Iyp701yNqQNkZYrxPLqqDva8JcJxs8nL1
	ua9ELKjsfpKlBuqwgCsPwEGp1Em/vUzfPAFiK2n20hhA4SDph6l5tuvGyWq5YhW4Bw8m0j+sQy7+b
	RBdUP2OENbz1OhuJwtWmet0tofHcteWzM54z1Flxf30KbU/OK9lyku1faWB+7ca10X/pYmpgzWDB3
	X0+Sw2Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYz8-008I6Z-0T; Tue, 23 Aug 2022 18:50:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQYyf-008HIj-Gc; Tue, 23 Aug 2022 18:50:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BFD7FB82061;
	Tue, 23 Aug 2022 18:50:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87473C433D6;
	Tue, 23 Aug 2022 18:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661280614;
	bh=koJ6rzVdomfaX6woLpwAmnTIiggmEx7bd6R+PBkBeJE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=khbOK72XLBDeOqniHglLFaV9Rzz0QuCWnvInfb0uyGxyUXuf/RCp8P5YfsklJMw4C
	 z756LyMUOdLbx0TKYbJbq+EAtASfSMDA5q3TV3qESe+0D8+SedqoZOrg+dpmmJbfbb
	 tT6IS3vKh5Tw1malONmOwDlqkpbw68RrlG+tAtRjUOhbgsLYq1zKg/7ygMsxIoO2d0
	 hlzoraEm+x/x1KkGuYan1Apc0mu+ZnRGhBC56pBlpikNMEfGgkGEKeL+nT9V2p61TX
	 GaPi55rpu705WVW/mkjtvXBA6ItQ7SZhtJZCbk7ipamdTPjUB6dllq6WfPyBleDzjh
	 yFh8wx/mM8+iw==
From: Mark Brown <broonie@kernel.org>
To: pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com, daniel.baluta@nxp.com,
 angelogioacchino.delregno@collabora.com, lgirdwood@gmail.com, Chunxu Li <chunxu.li@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, sound-open-firmware@alsa-project.org,
 tinghan.shen@mediatek.com, linux-mediatek@lists.infradead.org, project_global_chrome_upstream_group@mediatek.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, yc.hung@mediatek.com
In-Reply-To: <20220805070449.6611-1-chunxu.li@mediatek.com>
References: <20220805070449.6611-1-chunxu.li@mediatek.com>
Subject: Re: [PATCH v2 0/2] Introduce sof_of_machine_select
Message-Id: <166128061023.1031684.5884182401063110421.b4-ty@kernel.org>
Date: Tue, 23 Aug 2022 19:50:10 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-0c1df
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220823_115017_748658_AA4C61E9 
X-CRM114-Status: GOOD (  13.70  )
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

On Fri, 5 Aug 2022 15:04:47 +0800, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> Change since v1:
>   - remove the callback of_machine_select defined in sof-priv.h
>   - move sof_of_machine_select to common code, and called in
>     sof_machine_check
>   - rename .board field to .compatible in structure snd_sof_of_mach
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: SOF: Introduce function sof_of_machine_select
      commit: 6ace85b9838dc0162b474dbbbb6b388e7561f6a7
[2/2] ASoC: SOF: mediatek: Add sof_mt8186_machs for mt8186
      commit: 2dec9e09e955dfc4b7843fa4f9c09e7ee8931b1d

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

