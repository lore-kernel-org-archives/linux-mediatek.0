Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57798C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 15:19:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 257D5610CC
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 15:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 257D5610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5ky9av/8hq9r9e3nWIVsakH+5rNbRCo8wcIUShXsLw=; b=BoWP7F1BljqASI
	oOifdTSZZi+uWQ6CkVdtU0PwrxYeIxn0Y0mIwYio13szJS5Rv+BaOTAH9Yi0X0htceg0/SITUMt88
	nIii9aHcLxnO4O0y/dbQ8GZtQshFJk1/AHLsGioUIXkOdqry2omxsdWyB4G/bStTxL1de2ykbp/8w
	lrKHDzgrZI7oGgnFHglbKvS+1yay09CKV4hRiTv2+MkrAQOAuMkCee11XEwPut0D/nwFdROVL94p0
	z2L2eijL8s6jEyEp45+03Bzxol3GbqB17GshtAYJbDJIYNGb9c3w0hG1lC+TNIZBM6BKSq55UM++4
	0vsU5rcNbq4/Uvxu42rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mMAyk-00CHo6-UW; Fri, 03 Sep 2021 15:19:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mMAyS-00CHlg-6v; Fri, 03 Sep 2021 15:19:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64FD8610E6;
 Fri,  3 Sep 2021 15:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630682363;
 bh=oYmN5T7sshaoWGSEc1MfWpgCjISXeg/z9xk1wh6OKJU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UGlylsOLgVVOjPq+FLhiRA9ULl1yVvH89glH0h7EL/ekI34mqjOimsUgJ0We5A3rY
 W8npyG3wt0agsSjxDzmCfz/nAG+myRyVTa5pPslo3rIdePH9VXUUC8wp2ZW6gsDVSq
 Ym89RMSRrNkM6jKWi8D7b0RPaL050zDIRO7EL3fycbBuJITX7O6FRXM+qCu1ZmnaGA
 MadMpzYWWovy3HHMsr42VW5biCBKEAMsqdHqSV6R+n7qvfH73Fd7SW4KiNlM64gt4h
 NX1AhU1widThJS+yDh0c+IwnUDNE7KGmVz+E+KGa+gIimAUOK7PBGRd9C4FWUvLoNE
 zM8BDsurg013g==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, Trevor Wu <trevor.wu@mediatek.com>, tiwai@suse.com
Cc: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] ASoC: mt8195: correct the dts parsing logic about DPTX
 and HDMITX
Date: Fri,  3 Sep 2021 16:18:45 +0100
Message-Id: <163068203907.50844.7644629918689811156.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210903060049.20764-1-trevor.wu@mediatek.com>
References: <20210903060049.20764-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_081924_331181_3F8D4197 
X-CRM114-Status: GOOD (  12.50  )
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

On Fri, 3 Sep 2021 14:00:49 +0800, Trevor Wu wrote:
> According to the description in dt-bindings, phandle assignment of
> HDMI TX and DP TX are not required properties, but driver regards them
> as required properties.
> In real use case, it's expected that DP TX and HDMI TX are optional
> features, so correct the behavior in driver.
> 
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mt8195: correct the dts parsing logic about DPTX and HDMITX
      commit: 7eac1e24fbf6c56c9e3be302748ae73104bb40bd

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
