Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1D47C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 18:16:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCD9360184
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 18:16:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BCD9360184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qYpDHkMNU1q1A5poz1946k/EwDm6DUNyJ8dBXsOu/6M=; b=Im1haZ434SW9qn
	JskswLTyw5RnLgSb7pbWrmYYFQ2l5kNF3vbkVuWlVcTfpJQYq0Lw97a+M7H0eSjmh/ITWNWYv5EwU
	X/khUIHliKuiU46YAxxgha8/jUFgoiE89CrnnUHwAS2jW8/wH+U0jyyO7g4F6LzGlGYvXZ69DlfzB
	4nE2hJpL/vsJR6yPB0jQIdlafEL+99XyRGa4gE8t0VvLx3DJRM+Oo/ZGzxebuDRqPn1C9PRnE6tGR
	BkszjmHjtTTu35+ViMbAeYjpLqlgK+jiENguz5trRAAXHfKbsjpmuEHeQt7+YjRqpfVd/uIF7lvce
	HCrJxkDiP9gglgM77wkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLUm5-006wXU-OB; Wed, 01 Sep 2021 18:15:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLUlh-006wNy-HK; Wed, 01 Sep 2021 18:15:26 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B48B5610E6;
 Wed,  1 Sep 2021 18:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630520125;
 bh=SLkHUaFmZYSRvVymSMsqlnBse9OBxXfESd4/wbzi5iY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R2EjjjxMxvPAvYhygtAMSkK/FfvwiA5wB4CsLesD6hTUBiEDIMoXefWv0cm4n2vj6
 83fj1v4yRJu2tDuhZPjtI5bOaCYBPJ8bmfXCAmKL7v2XpiZoiYnzjsS6co7xygAHcb
 mJc/dRTQkTQ48/2a/v1hSMU3DZ5SYuwAcJMHY05vwRV9Uoeus4KIMwwx1EeGu00dNb
 4YI8EHBpJwTk90Rle5Rc/1u5eo3iWg93vGFztS57KiLo6nX3tfHp+kyY4AQ481Z094
 VrlEB+0FxLNOE3X4KH5Y+pogtFBr9IZ2K9cSxmzyGsRsjf84XQhXSlyaX+gFfGWEY6
 NSSEsRDgmZM5g==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Trevor Wu <trevor.wu@mediatek.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-kernel@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 linux-mediatek@lists.infradead.org, Takashi Iwai <tiwai@suse.com>,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ASoC: mediatek: SND_SOC_MT8195 should depend on
 ARCH_MEDIATEK
Date: Wed,  1 Sep 2021 19:14:43 +0100
Message-Id: <163051912509.21630.17446670283577790838.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert+renesas@glider.be>
References: <7e628e359bde04ceb9ddd74a45931059b4a4623c.1630415860.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210901_111525_614094_686A39E9 
X-CRM114-Status: GOOD (  14.26  )
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

On Tue, 31 Aug 2021 15:18:54 +0200, Geert Uytterhoeven wrote:
> The Mediatek MT8195 sound hardware is only present on Mediatek MT8195
> SoCs.  Hence add a dependency on ARCH_MEDIATEK, to prevent asking the
> user about this driver when configuring a kernel without Mediatek SoC
> support.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: SND_SOC_MT8195 should depend on ARCH_MEDIATEK
      commit: 940ffa19454704ca2ecd23b0d8dd604c93421bfa

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
