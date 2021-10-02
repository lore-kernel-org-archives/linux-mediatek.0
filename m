Return-Path: <SRS0=6vjs=OW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9973C4332F
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 00:17:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A06361B2A
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Oct 2021 00:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A06361B2A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ZeWu40ef34PaBMUT3DUHhX3jVe84uFPNyPie9nZWA4=; b=slx6aEC5V3pGia
	xA8W5g7z8fOgpJRBEanPgtQJWoTVxjhtrQUl4qsXnG25aPNXIfvoIjKJqK1vbASixCyAD26qMiLah
	FqwvMvv2i19JTzWLx4YdZKdS7n+oYkhcasZSgR/BqT9YS1VKv6L1M4zwkmQhg2S+rpkVoV+0KPjIj
	EK4Y1YUMSAplW5q+wC7ZrXsDJIwZqr3I/EKpFfW6Ou3l94LQFEBKmJdbIAvaoHfBCnwtymVE6TOkv
	HoZl8msBlEi/J0JMo9w1l5gkyQ6D+q6i0UTkJmhSlpPr1monegc8fh6Uw9R0+TpfqOCQX4DEjwHie
	ZuLSNY8b0NX2kJhF2Tkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWSih-001WlQ-86; Sat, 02 Oct 2021 00:17:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWShw-001WSI-Rr; Sat, 02 Oct 2021 00:16:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6CEE61ACE;
 Sat,  2 Oct 2021 00:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633133812;
 bh=SqkMJsnkHZDT+eZzsrisFKTL2JeLsdSMMioQ/miBr24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=V+GLco18UbSCDYlixqfJ9E5tda0Fa/sW5GEE6hFZwJnfxEfOUVMC9i5tm3nE8tW5d
 de6aoIagpe8OLsXHUlTfV1lYmvS1rvszVC8BP6oHp7XDwF4T+XMEOQPOI79Y/lpf//
 2+EFtyujN+k52GqtZ03Vd4uo4KfWYJKf8++qJeiaMvrfQ5attEOXoocz3R9BcEGYRw
 k2pWIh7XAvSVUPO3qbywCECoobcJGiSSZBz4Lzy6WhruFBjFg/guTQb/Fj5b14tJ6X
 C5XpJzVz/WsO7HF8nUIXbQYNWa0MvSPqiC+Ha+1PYliM/ox9LCx4hoyZXiJ6J6/vOW
 Zdt+3LfuHF89Q==
From: Mark Brown <broonie@kernel.org>
To: tiwai@suse.com, Trevor Wu <trevor.wu@mediatek.com>, matthias.bgg@gmail.com
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 alsa-devel@alsa-project.org, bicycle.tsai@mediatek.com
Subject: Re: [PATCH] ASoC: mediatek: mt8195: move of_node_put to remove
 function
Date: Sat,  2 Oct 2021 01:16:27 +0100
Message-Id: <163313339131.45396.13424331817826400710.b4-ty@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001031601.3953-1-trevor.wu@mediatek.com>
References: <20211001031601.3953-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211001_171652_953580_89AE2071 
X-CRM114-Status: GOOD (  13.38  )
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

On Fri, 1 Oct 2021 11:16:01 +0800, Trevor Wu wrote:
> platforms->of_node and codes->of_node are assigned in probe function,
> and of_node_put is called at the end of probe function, because of_node
> seems to be not used after probe functon
> 
> In this patch, of_node_put is moved to platform remove function in case
> of_node is used at any occasions after probe function in the future.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/1] ASoC: mediatek: mt8195: move of_node_put to remove function
      commit: bd8bec1408ab2336939bd69d93897bf19d0325ed

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
