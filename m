Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34344C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Jan 2022 16:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7NPoWThRADIUkYsbFMDbjTAKNkN1GJfbPX0xgrQzXA=; b=ZYNJwv5X3C/jld
	9uUQ1vbwjibRGyEGTTGoiGMhiJwHyWgdmBS4pPnn8HPrsm8An/T6f2Lflx7OXJFTCgV52UNWmF/Bt
	MJ7tZ+zZuyCcNr7gCdgkwJhpsOoNa1/YuljWTSW7DNECWagv2MrPhrdG6IOR+TuGBQ9DI5Dt4piWp
	yS4nyiuytn/eNhTt9OBdFiymQG/X7EvcuQhFU2V8Qz1zSZdBlzAMT58V5ieNzKMHOfvAfxGHhrsYM
	YbB2SX0qYDt93l7mx6SIIkTbgyIKHS0WTyeQSjo31kowV+VrSPzKWflLBuH3s/vTDlJBdeSOFegKT
	yi7gRdkjihJxPlGu8T+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEZql-009vKS-1X; Mon, 31 Jan 2022 16:48:19 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEZiS-009tk5-9h; Mon, 31 Jan 2022 16:39:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E2428B82668;
 Mon, 31 Jan 2022 16:39:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF5AC340E8;
 Mon, 31 Jan 2022 16:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643647181;
 bh=gh0ij36m+BkjuG9o19AVvOS7Qg9b2ckuyQQVFCDdQZE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=Z3K0Gir315HthdqnazCCJ/E96tk2sk3bdH+Q+n0BR6QlvRs8hgqXomtzEtb09TwMe
 vfRErpaa2vSxGIUxun/nhRTk1fVyS5h2LjSpIU+ztxqKfZdHHUic75EhA77maoAgFH
 SSrkFvPAdMs9bb/miCpYOWHY+8yqwhMfK6/vxWkU36LZdFbczFB27Smkv767dYtPRN
 6UsaGH9RYn7hLr4u0eJwpqG6uJO2adfig9YrT62Nj4OYSNoKzkrhVoXtq8gRvJdTB3
 0ljWZ9MtmPG8fvgikE8KIuKP9BSMof8TUOUlqSds8gcBMCutatvVQvicovJwNpb2WU
 piuYWJh8JebNg==
From: Mark Brown <broonie@kernel.org>
To: matthias.bgg@gmail.com, Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20220131141708.888710-1-benjamin.gaignard@collabora.com>
References: <20220131141708.888710-1-benjamin.gaignard@collabora.com>
Subject: Re: [PATCH] spi: mediatek: Avoid NULL pointer crash in interrupt
Message-Id: <164364718000.1030778.7318932635935946052.b4-ty@kernel.org>
Date: Mon, 31 Jan 2022 16:39:40 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_083944_523133_D497101C 
X-CRM114-Status: GOOD (  13.42  )
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

On Mon, 31 Jan 2022 15:17:08 +0100, Benjamin Gaignard wrote:
> In some case, like after a transfer timeout, master->cur_msg pointer
> is NULL which led to a kernel crash when trying to use master->cur_msg->spi.
> mtk_spi_can_dma(), pointed by master->can_dma, doesn't use this parameter
> avoid the problem by setting NULL as second parameter.
> 
> 

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-linus

Thanks!

[1/1] spi: mediatek: Avoid NULL pointer crash in interrupt
      commit: f83a96e5f033fbbd21764705cb9c04234b96218e

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
