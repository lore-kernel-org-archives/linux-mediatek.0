Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187D2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 11:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RAhrq34/2KsWok09ZGxwVwAQcSeS1r5UyJ2ifxM69Ks=; b=X/nvx9LXJB9Vxn
	qKLjCbfE/ZwIgh4KxOQIiALNvvxcSMFCsbJiMxOiDFFovtItrC0ZzgxzhwaPTpCMtpelFlwiFOB4S
	/iyFGCEQBHz0BvAnMwKV00s0OgQjk3iV3Sn0INCs/XX4C2KEcH4FDWm0nU0eIFmF+rhQ1V8NmXeTa
	ih3e1J8NjRaw4gTEi6HTY+JhNWOpMOKrf6bwRnqgr04goUkfRuMimA+0De2BVmUiFh5LSYKfr9B6g
	zYGabG5lw3cY+wu0wykLqruSEPYvoMC9Z+w51xmSD0Lsdr77G/KHOJX+IofGYi1pf674ZtZqnlJ/7
	DVLK0LMS/ksN1l8SbV9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ns0eu-00C3tW-Th; Fri, 20 May 2022 11:19:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ns0ei-00C3pT-M4; Fri, 20 May 2022 11:18:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4066C61DAB;
 Fri, 20 May 2022 11:18:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B16EC385AA;
 Fri, 20 May 2022 11:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653045529;
 bh=UhFND29rKzFNk/PM3lmGrodeQwn/fNPjQBAAKBp20gY=;
 h=From:To:In-Reply-To:References:Subject:Date:From;
 b=qYqeBTUNoNrIVAwTHKSCHB3plxVJLKocoriVJmA4aOa7hh3BcI12PHAdCbTd4+ih7
 orY0T+lvoqnSV587qMOMU8jApzkpzW0m5sQ15uJxkoEfCSNxrgUEad0krHecwGmnj0
 3tG6DvV+kxmPB6Ic9xgJT0dxoDNkTgf4cz0TRWgz6D6Swn+XmuTLJbAER0y/Am5cDn
 v4JtnIe17vTWVc0pr+B0sHFCSET0ozsA9ZrBWfesyTASYP8bQ+DaDRZVrjiYP8WSho
 XoSgPkp09sgS2m1HXPcdPHFusSNmURAWfoHzgphCFbiKJoXilhxDiAE5DmiU7WhCxl
 JBLRGl/oEvUcg==
From: Mark Brown <broonie@kernel.org>
To: yc.hung@mediatek.com, matthias.bgg@gmail.com,
 pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 linux-mediatek@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, daniel.baluta@nxp.com,
 linux-arm-kernel@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 peter.ujfalusi@linux.intel.com, Allen-KH.Cheng@mediatek.com,
 kai.vehmanen@linux.intel.com, geert@linux-m68k.org, yangyingliang@huawei.com,
 wanjiabing@vivo.com, sound-open-firmware@alsa-project.org
In-Reply-To: <20220518125902.13407-1-wanjiabing@vivo.com>
References: <20220518125902.13407-1-wanjiabing@vivo.com>
Subject: Re: [PATCH] ASoC: SOF: mediatek: remove duplicate include in mt8195.c
Message-Id: <165304552575.45439.1697552885187311521.b4-ty@kernel.org>
Date: Fri, 20 May 2022 12:18:45 +0100
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_041852_775082_87B8A0F7 
X-CRM114-Status: GOOD (  11.21  )
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

On Wed, 18 May 2022 20:58:57 +0800, Wan Jiabing wrote:
> Fix following checkincludes.pl warning:
> sound/soc/sof/mediatek/mt8195/mt8195.c: linux/of_platform.h is included more than once.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: SOF: mediatek: remove duplicate include in mt8195.c
      commit: 0f653c95c4f4b6b623ce8bd995002daf8032bfc3

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
