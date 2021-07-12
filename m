Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53DD2C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:47:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 215CF61156
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:47:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 215CF61156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vj78Mk/9nBkrS7VFd2P5kU0n5nd//STJEdO8j2h2xEQ=; b=tyRn7umqpQd4+5
	9BlVCMNBocG479b2lm8AjNW/n6edp38Uw6fHqZ8diIjd8p3YPsPbQjWtImchukZduBL96UnC+Y4/0
	hKfUxMWdmobMZzDpvbfnPTfWth+snSV+3aNgNwSrOv0yhmlOgLMaWmjXfxEgN/8P7OchJ/P3O+YVm
	lUcYNT81wbpEB5hpEX8eGw8nZlwdfL4+9OvY7gApLfvVqroYy9P+TgETGdH/foYPcG/UJdKR9JfVy
	Hhn19rPHppBvx7ydLx4zAk5sZrPM2YmAawTvS8nALMkyWE/3qa3fjJKSv1C8Bbyd3bDJ+qrFzDeZW
	52OibFBKebwZKhEb4rOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2tTB-0071F5-Lk; Mon, 12 Jul 2021 10:47:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2tSh-00717r-W0; Mon, 12 Jul 2021 10:46:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 32F7661106;
 Mon, 12 Jul 2021 10:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626086815;
 bh=s+olitVcChZMJGcS+kpqQWJ7gxyw/XxMyh2v/cXCmg8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eMH9edpbkpi1nI/fSamz9TwXwBOsZIGevcHb0hhOp2eVJeNptfX151q00O/PDAZJt
 p2wthnmzwnE9cbIwTRXzn9++jj+Kc5iH+Esv9LSkGghHqkv+0CmOqbt14+C8+0a7Ak
 5OJE/q+iZ5L8UNSn3fvzh31PG3LspVdTNtRKCb/U+SnQMsmHmeky6CCWZoW1tBIO2+
 wN5PgdBuFKIsevEaaheaZWNeyDV/EENeg4ShTLhGbiYR5yLoJF7+Xve1GwpacbNvkJ
 8kf0quxY0wLuQRmickbowGeMY1whS0QnQWbPzkfFaIA7cMqIBbHSnu+ps5zZwhurC8
 6vBGrIAqTNasQ==
From: Mark Brown <broonie@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Leilk Liu <leilk.liu@mediatek.com>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Hess <peter.hess@ph-home.de>, linux-mediatek@lists.infradead.org,
 Frank Wunderlich <frank-w@public-files.de>, linux-spi@vger.kernel.org
Subject: Re: [PATCH] spi: mediatek: fix fifo rx mode
Date: Mon, 12 Jul 2021 11:45:41 +0100
Message-Id: <162608669457.4543.2374973099687363958.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210706121609.680534-1-linux@fw-web.de>
References: <20210706121609.680534-1-linux@fw-web.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_034656_097911_9CB72C62 
X-CRM114-Status: GOOD (  11.95  )
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

On Tue, 6 Jul 2021 14:16:09 +0200, Frank Wunderlich wrote:
> In FIFO mode were two problems:
> - RX mode was never handled and
> - in this case the tx_buf pointer was NULL and caused an exception
> 
> fix this by handling RX mode in mtk_spi_fifo_transfer

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/1] spi: mediatek: fix fifo rx mode
      commit: 3a70dd2d050331ee4cf5ad9d5c0a32d83ead9a43

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
