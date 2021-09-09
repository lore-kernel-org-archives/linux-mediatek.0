Return-Path: <SRS0=kQJD=N7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3BA5C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 15:39:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B7DE6023D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Sep 2021 15:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B7DE6023D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jpcfmHmvSyzv/QMo7wccvCFgddqcGq4MJ8IKEynbM5g=; b=F9bnzL7e8jPFYX
	4HCNtovHOOHRN4B1rtomEBBIMfrED+Fl/IhhN6IbUzeYa0nXTM/suCW+jmwSabIKdmq4uh4UjuV1D
	uMqmt2XOx2lESMJ1/fK7x2Q2rNR3k3SpRniAv7vYGaPAKgnhPUe29lCNVLDMgRAQGuMeze1+6YCeb
	xlu4XXfM/zXG7XHhD8BM/Rz7r0y2/KIHDPlvhZ0uB/KV1XlRHPfoIyvm5XDnX3Lf1+Rs8/NRQ5s2t
	yHqd9eONFuHdJ+Feh5mW0bFRyXunrR4N0FABdNBidkbZYbBonbYJYSL2cx4FPNevWGG6OdFBcKVGk
	X0taiqUxBsAJEeLdlMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOM9P-00AHkx-0K; Thu, 09 Sep 2021 15:39:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOM9B-00AHhz-Kf; Thu, 09 Sep 2021 15:39:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EAB4761101;
 Thu,  9 Sep 2021 15:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631201968;
 bh=tkOzf4SWBI/A4DwsroAtEgpaaPJWTwSJSjBkhkWXmMA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nJhV9fvfNFeICwBDTUrqTTlfXKOrQ7ggctzbNDG8N1pai6ZW3kD0BiudT68fNafJ0
 nw+xWdmdXcE/rZOTItwmQZFMTEAuN9XPe0Ckvo5A1kA/s1H1yJS9SntciWBfQkscju
 t+Ejk5J2dwsBrLywTaXg5yjTdnM3se9sNUk6vX0QMpFtj9LuqT6D/JOkNsTOOOrUyK
 Sgk4A1T23zChKVB/1ZRKW5/L3v8q3gxB2jedgFRX6/huZlSRKVo1crlbFfTECMegYv
 d0oo1//1Mk4qEJf3d3ZXyEXrb1pynXGWlAzm0P+cnBgUQtezcL/sKMsGN5U5FJzbnA
 a27MmWQhZkD2A==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com
Cc: Mark Brown <broonie@kernel.org>, wenst@chromium.org,
 linux-mediatek@lists.infradead.org, rdunlap@infradead.org,
 jiaxin.yu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shane.chien@mediatek.com, alsa-devel@alsa-project.org,
 bicycle.tsai@mediatek.com, geert@linux-m68k.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: mediatek: add required config dependency
Date: Thu,  9 Sep 2021 16:38:49 +0100
Message-Id: <163120168199.50116.8060254144301490373.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210909065533.2114-1-trevor.wu@mediatek.com>
References: <20210909065533.2114-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_083929_747588_E6C54AD9 
X-CRM114-Status: GOOD (  11.88  )
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

On Thu, 9 Sep 2021 14:55:33 +0800, Trevor Wu wrote:
> Because SND_SOC_MT8195 depends on COMPILE_TEST, it's possible to build
> MT8195 driver in many different config combinations.
> Add all dependent config for SND_SOC_MT8195 in case some errors happen
> when COMPILE_TEST is enabled.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: add required config dependency
      commit: 5a80dea93191d55840f42252ed3e4565a125a514

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
