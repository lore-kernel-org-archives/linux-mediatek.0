Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8C64C48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 16:07:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A81B96120F
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 16:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A81B96120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kS0ywGh9QbhZbhMB0YorAARQtGJu33sxrCpnNk4JS+8=; b=a/daKjs/pv8+TV
	G+50MGz514VgWQLpsC59d3BQ2B4WD73yJT4p6ogWNGUtKbZiNFNa296r+se5GpY/U8FbGrsssg2Jd
	G8DBO9vq7bloPJpCd/+k5kcjrc+UOeKMSERG5Vjvlo2H4wj/qOlU+oZOWtzui9mY8TmzcAezZsyfq
	dnpLNVxJlmeTLVu3KJYvXwK+uSLDr3OZPc3P9u+6exwlxTLxYyLTI9JHH86MnZpjaqIHVOw0GLVyk
	E3wH34Ivy2c8z0AUQVBudZtcWM94K02tSgnOvhSR8TlenRMdLqVF6FS3iOc2XDiFceRhPo5RdteNf
	wzpKowrqpAA86NotgLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqeGE-009Rsd-Mz; Tue, 08 Jun 2021 16:07:26 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqeFz-009RqA-Gh; Tue, 08 Jun 2021 16:07:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A46BB61078;
 Tue,  8 Jun 2021 16:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623168431;
 bh=RLYClvzf+9zh8zPCA1AZ11On8MN7nXwqdgFy13xhXyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KQS6ecLeAgLlnZNbkCA7n22fN+y9GGAl2b/zvkSTdodMboq4PbvxDyZYUEPuOHOGN
 w28Jb08XSl0n50MnGPVdWm3R6T4BqY1iDgVFA881ALKcWN4l7QMsbDrh8nD7othG3y
 Mra1Q8FcUj99OydSA8hZs5WJufbcnfxrPMDaVMG5w160NpG7/UqMyXeNAauQnoMTAi
 Txti6e35BGe+NEx8V0QlUPEcz+aHKcsbp58X7BhLym3kpg5KbqHZ0X1AGVA3FfdDyf
 5FtVJxlcxkYCHYgdlyfZH1xjXuAKQCAjgUhW59cQYZowYdpUYuyIBvwMm2bCMwlPU1
 8ONjgJs3efp9w==
From: Mark Brown <broonie@kernel.org>
To: kaichieh.chuang@mediatek.com, perex@perex.cz, lgirdwood@gmail.com,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, tiwai@suse.com,
 lumi.lee@mediatek.com, matthias.bgg@gmail.com,
 pierre-louis.bossart@linux.intel.com
Cc: Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: mediatek: mtk-btcvsd: Fix an error handling path in
 'mtk_btcvsd_snd_probe()'
Date: Tue,  8 Jun 2021 17:06:37 +0100
Message-Id: <162316808974.49749.9800374437345817638.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <0c2ba562c3364e61bfbd5b3013a99dfa0d9045d7.1622989685.git.christophe.jaillet@wanadoo.fr>
References: <0c2ba562c3364e61bfbd5b3013a99dfa0d9045d7.1622989685.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_090711_589501_547DFC9D 
X-CRM114-Status: GOOD (  12.28  )
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

On Sun, 6 Jun 2021 16:31:09 +0200, Christophe JAILLET wrote:
> If an error occurs after a successful 'of_iomap()' call, it must be undone
> by a corresponding 'iounmap()' call, as already done in the remove
> function.
> 
> While at it, remove the useless initialization of 'ret' at the beginning of
> the function.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mtk-btcvsd: Fix an error handling path in 'mtk_btcvsd_snd_probe()'
      commit: b6052c3c7a78f5e2b9756c92ef77c0b56435f107

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
