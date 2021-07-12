Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D05C07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:47:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7EEEA61151
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:47:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7EEEA61151
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N4uLIZP+4HJgXU6mZcNoWsL3MbmpJCEGfEODFDUr/Bk=; b=E0nQTLYVFxLX68
	4cYrCEYL6OcLEMh7jQ9+GZVQIYl9QijT/g/5eCVPiCzwu4MpC4lRwF4ZuIGUTsf+22+a4ek44N6O9
	yrJcrcFFgO9FCNaZEGM/o9KOMrlfO3JAxtjcfCIVr6LilsKQOIvKGwEaEazjc85YUOEYiGnflJuj2
	97l0KKu3iyRTlHyIEGyiLOtZ/yStDbZXIgmhllrBuBTY/UHr7/xkOkrqPvQ3JJuG9l3thUd+LRurx
	7jcE2b1lY3RmmOuf0ijFS3skFpNb8/t3C4JfYVrk3vNoz5t+yu/v79JfGvzNh7CJ/mlKyWAFflH1v
	GKnvAc/xPNSw/N2ruF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2tSz-0071AF-7Q; Mon, 12 Jul 2021 10:47:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2tSf-00717F-E3; Mon, 12 Jul 2021 10:46:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A0FAD610A7;
 Mon, 12 Jul 2021 10:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626086813;
 bh=Ao3c5ZQCxM2QID6m4VZxbaPV+tdCnDhxUfo395ZRO4Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QS+DcUhYhU5EcnC3uQl6KIo23hoLVhexryf+QJgueL7Kdzc8Kp8lMucMbl1MWMg3n
 hlIKa+KL4n0x2BzsYBMbu+o5mXk3sinXUPAxGeABmDvnei6YVVmdqVWypWhmKF1fvD
 IyzuBHb2Aiyxqym7MkJ9zLGRQgkPYlYA138MCE+PYQqphSj//SSg/kU6FSQz0p2hy6
 jM+AEETvquUxCQ9RFFHK9ALAzvNoRsb7zdRWS5XQjn4mmKIjZprZgV4p18i7cGnGDm
 X7c1VN7tDz0e+4k6STP6KPJxKYWSBjuR7cXmNqDfO3eZn3z/Um3ObLVFFSA8kVNwpX
 nJSmmo3QyCl2A==
From: Mark Brown <broonie@kernel.org>
To: Mason Zhang <mason.zhang@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mason Zhang <Mason.Zhang@mediatek.com>, linux-mediatek@lists.infradead.org,
 wsd_upstream@mediatek.com, linux-spi@vger.kernel.org,
 leilk.liu@mediatek.com
Subject: Re: [PATCH 2/2] spi: mediatek: update spi master bingdings for MT6893
 SOC
Date: Mon, 12 Jul 2021 11:45:40 +0100
Message-Id: <162608669457.4543.2639315857957915855.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210629101310.21045-1-mason.zhang@mediatek.com>
References: <20210629101310.21045-1-mason.zhang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_034653_543305_1A7BC967 
X-CRM114-Status: GOOD (  10.63  )
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

On Tue, 29 Jun 2021 18:13:11 +0800, Mason Zhang wrote:
> this patch update spi master bingdings for MT6893 SOC.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[2/2] spi: mediatek: update spi master bingdings for MT6893 SOC
      commit: 3522d9aa19285bbff14da20cb3481e36ef4835fd

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
