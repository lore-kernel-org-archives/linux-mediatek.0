Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820D1C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 15:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXCbVMPfKsR1VpDeq0jtLSY4elGX0QVNzhaYW3gHlvw=; b=k6lfE/Fc16hV1l
	NIjQrn08BeDKytyLax+bjC9bj5YDJd9Q70Z6O2U2aM0Wvvx5XExHj/OUgV/DYv/TB1RwNcEdASfkL
	8JlpmickVDSCc9PnZMUA4EClrc1D8qgmhxDoXWcukJzxJG8K9TdIyGfnhLFThapaGHwRt7FAfwwqf
	t2PqNWGhS4L14hGQP/PeuRm8hqJrnlG2fTOQuWYzCn7tMvfK+RrS7ve7olVKyek9niaUEgGgwkWHA
	N+eprkh63yQ82uBUuTwe8qOLtrpIR+IuArHiuF2OZQOPW8wmfycO1GtuyxxrxgH/AqrrwZpDOTC08
	pGTOydtPmruH8B02YdIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no5aO-00FB9d-GE; Mon, 09 May 2022 15:46:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no5a4-00FB27-Ge; Mon, 09 May 2022 15:45:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D38A4CE19A2;
 Mon,  9 May 2022 15:45:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFB82C385B2;
 Mon,  9 May 2022 15:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652111141;
 bh=CrQ0/ckWEfkQpNpOlG4urFcVG9MU01f9luLgk3xayCw=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=IN9glv31dJR7fqENxy/LCDLC2pYcHK+AF0DM3+q+KDWhAym3fbo0tp048BRPR/IHt
 1TMwlaey9GDbWC+x7VVcNY99YleePiKoD8PkeGX1VzKCGKh1ArehVAbgobMumRROQC
 eozZYfroUnnA4I21SZKXRcbAURT+cUGD3Na3rJW8UjnN+7HnTdbGAHUh6uSA+r4NFj
 5L5nTQt+LPFkjOSNmeREoFMhUUFXh1z3IC+yKdItaKvZKj2gR7P66FaePUZz6crOtC
 7PMKpPN/VjoqI0qxGAMWpUkKFQ8V/NQXiHhj2hnKONLzo5D7kp3rWmH11ZUCvh/Ju0
 dFR0iJvOhATdQ==
From: Mark Brown <broonie@kernel.org>
To: lgirdwood@gmail.com, cgel.zte@gmail.com
Cc: chi.minghao@zte.com.cn, zealci@zte.com.cn,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220505021808.54337-1-chi.minghao@zte.com.cn>
References: <20220505021808.54337-1-chi.minghao@zte.com.cn>
Subject: Re: [PATCH] ASoC: mediatek: simplify the return expression of
 mtk_dai_pcm_prepare()
Message-Id: <165211113943.774487.12508036435286420554.b4-ty@kernel.org>
Date: Mon, 09 May 2022 16:45:39 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_084552_778945_879FFB9A 
X-CRM114-Status: GOOD (  12.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 5 May 2022 02:18:08 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Simplify the return expression.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: simplify the return expression of mtk_dai_pcm_prepare()
      commit: 74eaa8126f50e52a19f055eed002cc76cf3122dc

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

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
