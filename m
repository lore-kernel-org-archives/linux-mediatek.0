Return-Path: <SRS0=5OX0=OD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E83C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 10:55:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9DE161004
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Sep 2021 10:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9DE161004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vnGFUhXis9T3Od+ws2VCjXAjn+EZZLkB/A4EYER5iFM=; b=zag5z0SSxMwXUt
	zK/enT1Kup63DuAki8d7Jcv4HNCQprZ+XS1b1axPLyqLnigm+GH3xR1p/4h6+HaFgmyr23gmwLB3Q
	7JxfKX+7qF0nBO4b0+cSAd37IqUbFXWyut2JFB+6xbX5Hxmfkr+vd4Ll2RtJP1cnhrpV9Mbcx1yaB
	dDDPKln4Y941NfRs1qB66kx0ajeoOgTT0+E17yMUHPf3FbLxvxfj+9W5n2S2jJ9ZDapAS/1Ziv9tp
	dek31F7zrjxcfFcEYOGtTmxBJlRPUEEOzjW+lRhOxFRhpr5JFGJaVX6Rs2zI+Rgx9u7mjHdnd63uO
	nvyNe8KVoM9sDZc254VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mPjcO-001Ohf-Ke; Mon, 13 Sep 2021 10:55:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mPjc8-001OdA-Qq; Mon, 13 Sep 2021 10:55:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E90861004;
 Mon, 13 Sep 2021 10:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631530504;
 bh=adzHkMe7QmqPw8mLlHRzTAcZPu5KFFN4TF0NE5fBBzI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=j8Ntwz91WlimLio4nImgaFi/iKuvbcXXcsfwl/+3mdXBR6WtISZlRBF9WYxKnj0PI
 iqihBxsZWawgUnhmJp8KLd9knRR7kL3jJy06N8qwYplhfmPn+EbVqdJhCg3E8Ye58L
 aTRTMIXtz6so53Of6/XP/YQdO1lAcn17qHE3GvS7MSzqb9L2wvrMdIZixEcUU+nmdF
 MAM+tKWA644giBPOl2YJa+QTVyndPvljFoHMIlBNeswnlDF76gUz1XoFZGUVIMRSrH
 Yyn8Z6VMncU42MfgtJ0tLf8j51eul68NtespESTVcRVltD3yrBIqHKCqmflY4KxxwK
 K3AWl5v1bW4Gw==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 Colin King <colin.king@canonical.com>, Liam Girdwood <lgirdwood@gmail.com>,
 alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 linux-mediatek@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Fix unused initialization of
 pointer etdm_data
Date: Mon, 13 Sep 2021 11:53:24 +0100
Message-Id: <163152996585.45703.6144242874194833843.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903114928.11743-1-colin.king@canonical.com>
References: <20210903114928.11743-1-colin.king@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210913_035504_929002_370D9807 
X-CRM114-Status: GOOD (  13.03  )
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

On Fri, 3 Sep 2021 12:49:28 +0100, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> The pointer etdm_data is being inintialized with a value that is never
> read, it is later being re-assigned a new value. Remove the redundant
> initialization.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: Fix unused initialization of pointer etdm_data
      commit: d67bbdda25c4156da079312a3594a41770123abd

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
