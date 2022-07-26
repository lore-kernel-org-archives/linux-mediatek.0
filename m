Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDFAC00140
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 17:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l/TaOfiWz5vOQfAH0NfC6Q/3PGl2h+r2/JLbo7Trp0U=; b=Wcz3vPIczjKs1i0YkHiGDGcoxS
	h016Ut2nSOfSscp15ElrDZ56RJCuV2nYurKMJN7B7QBMPqYZqVM5dLVTA5lzFyNVOWHnXOMHtqWJx
	jScROhpvt5Hu8gNQrAvZ6b26OruWI2CGJAjWDv/GTjGAz6DcTQL7VFki7uaKYCKa5/1j5BRr4x1QA
	f++Xz1fU9wBbc1mwbs9JQ+3dtLce7lXXfD9X0NUQo57SKLUUMMm3Xq6fLzWGx0OqzhGN0r/pJrasL
	ZH045OHSUglkDToBmsRdonsLNHs86LQOzL488c7ipGM8ldqpC83bghS2VGkmA55o5ol9ygQ5SQalt
	k8IYVcQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGOhO-001mOm-W4; Tue, 26 Jul 2022 17:50:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGOhC-001m73-JG; Tue, 26 Jul 2022 17:50:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F1846B818D1;
	Tue, 26 Jul 2022 17:50:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85B6C433D6;
	Tue, 26 Jul 2022 17:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658857811;
	bh=oR+l1h1MF1vN8m78iopGfwp9crpfWIbUSuis05J8Ap4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bgl3T8GBdM+1bQh2EuhsjginkSwhpoKnkXfBMHDJ7WbakC98g6fT2A1Xg3exBA+NM
	 ZbOm7HmbPAmyzge/s7C1/89phrvSnyQQCVj3fjc7O81RrOxOtCT2xo7sks/6gbqlnQ
	 fddpTJZ++rYugGepeMBX80j46zd9QRwOSnbKWU7hf/hSy2yNjmSrFEKMEZ5urzYs19
	 cp/E9mUklzuMhz6H4uKI6huGJ/VXHS1IhpT2MPSbRj2LdMghvWPSElkurfjemnWoBD
	 nYozsqj6v0O4dMaEAt43K8LORu9grkwpRhiwC9K4kcjG8rGbXMqIOkiWfAMtOY2TRA
	 eT+GNDerlYfsw==
From: Mark Brown <broonie@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, angelogioacchino.delregno@collabora.com, dan.carpenter@oracle.com
Cc: aaronyu@google.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220726153130.27584-1-jiaxin.yu@mediatek.com>
References: <20220726153130.27584-1-jiaxin.yu@mediatek.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8186: set the correct string to strncmp()
Message-Id: <165885780832.800364.7549018957037633100.b4-ty@kernel.org>
Date: Tue, 26 Jul 2022 18:50:08 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-c7731
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_105014_825241_5218F596 
X-CRM114-Status: GOOD (  13.75  )
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

On Tue, 26 Jul 2022 23:31:30 +0800, Jiaxin Yu wrote:
> Fix Smatch static checker warning. strncmp() here only needs to compare
> the first seven bytes, so in order to make the code more clear, only the
> first seven bytes of the string used as the comparison are reserved.
> 
> Bug report: https://www.spinics.net/lists/alsa-devel/msg145608.html
> 
> sound/soc/mediatek/mt8186/mt8186-dai-adda.c:78 get_adda_priv_by_name()
> warn: strncmp() with weird length: 17 vs 7
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8186: set the correct string to strncmp()
      commit: 7df92384c86f36d0452e7abad21c7eaa91aeeef7

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

