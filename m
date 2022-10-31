Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 744D9ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 18:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HeS1sOb9YdlcvRsbVO+Dvx/uDWKvQh39hdZYXcin7QA=; b=JrcAUsuGkXmhcf84QMLBfxnXVY
	qHDxj4G2FnoATvN2+PcFLpATJOTx5mGNIjIl0dLzlzGTesg5edZ/yXZ75eXVeI/sIwJ828ue86SQQ
	5OdyKsjpn2TtJYo6/FzQFXrjtl8mSK8S6MI7XxDlLCwz8aGVOeoKyaQi4pA3zhENkQDfh0/RBnvMf
	fBT9m1uAaKVJrVBmpYgjBF3CvqZ4R++JJdcHmGW64LsLJ1yga7+e3EO3As5Wg4eZUdEht+lNB43oU
	5Qoueav5b8ynTIO8ijwQVfAOeM1EMLzi8JntT4zJY5Gq25jYif9pegf9XiiB7KTHZ0t/1iReu8R3Q
	apmrqTew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opZfg-00DpBn-B8; Mon, 31 Oct 2022 18:38:04 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opZfV-00Dp3Q-1x; Mon, 31 Oct 2022 18:37:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A8E50B81A40;
	Mon, 31 Oct 2022 18:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30B8C433D6;
	Mon, 31 Oct 2022 18:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667241470;
	bh=ZpTWBC53pD9jnfi/c4IU8fgvcZSMtpYN97AUUuaHEmI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=fISESh/PTcHRhJ2Q0Oz8ZQ5tnCGlOmSb4jvPRe5AA5BhtF/LnVD+b56qgdwKH4val
	 g5qLsOHifvGiyDA5nKe+Qhqic46cDUot977FqZeUJI/UFJTS9FyWueA/ob5+BgVkWC
	 kNRTskoHiXXZOBa38QenhnqD+P5em2EA6s3HYTUiO6AZvVTB0mMJZfPeESB34qRmzB
	 ZHc95UrMfQTq0UnvUvhrEbZRsZ/Y75ntcnpoN9/5g1UD83iBY9WvkVKiLZfaDAavkv
	 KaCOQRaskkieL72gzW9AcEGOrpgu7CX5isv7Z7LJKeTv+ldWG/6EYhnOU4J9ya/R0P
	 wWBTeu7YRimrw==
From: Mark Brown <broonie@kernel.org>
To: Zhichao Liu <zhichao.liu@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com, linux-arm-kernel@lists.infradead.org,
 leilk.liu@mediatek.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20221021091653.18297-1-zhichao.liu@mediatek.com>
References: <20221021091653.18297-1-zhichao.liu@mediatek.com>
Subject: Re: [PATCH] spi: mediatek: Fix package division error
Message-Id: <166724146867.755330.12479790403811029953.b4-ty@kernel.org>
Date: Mon, 31 Oct 2022 18:37:48 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.0-dev-fc921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_113753_264832_A45CC1CB 
X-CRM114-Status: GOOD (  13.83  )
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

On Fri, 21 Oct 2022 17:16:53 +0800, Zhichao Liu wrote:
> From: "zhichao.liu" <zhichao.liu@mediatek.com>
> 
> Commit 7e963fb2a33ce ("spi: mediatek: add ipm design support
> for MT7986") makes a mistake on package dividing operation
> (one change is missing), need to fix it.
> 
> Background:
> Ipm design is expanding the HW capability of dma (adjust package
> length from 1KB to 64KB), and using "dev_comp->ipm_support" flag
> to indicate it.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mediatek: Fix package division error
      commit: cf82d0ecb84e8ef9958721193f901609b408655b

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

