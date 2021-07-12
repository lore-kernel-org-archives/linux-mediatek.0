Return-Path: <SRS0=CLKU=ME=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2742BC07E99
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:48:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9CE061156
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jul 2021 10:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9CE061156
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jeQn3Z3dtBc0L6kPta34FmvBJeHAU9sJGyWGyGmYKGg=; b=p63rjZkeLekg4Y
	gchmtp31pUqv0Y8nLhGo3HBA4ulwOwl07SHcit010qBxNl1/PSQKDlhRnOBNHqfcM0wW9TJ9jmlQ4
	rGMYmqbSIWl5Nr9L1ThhieWrWAP1EaGi2uO4A2MSnhuJnWA/ZTpyjRmelxIPZNhdGnys2nR7MEkl5
	H0+Gvn/vw+YbAAa5HtOT+xC8Tpj9Pibekt8zvXcf9KpuPscCJ+n0pb6D4/HeFomEUP+MYX9rNJxaI
	WGITfGHc+QcYENsejazYgVFDHcLRdLkDqu53om59SFSw3r+5hKoRNbDYDL7QokApiukH7yiYgpSWQ
	9kh34RTl6XaBfdp1CSHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m2tTh-0071VS-E5; Mon, 12 Jul 2021 10:47:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m2tSn-00718o-2z; Mon, 12 Jul 2021 10:47:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C58C61106;
 Mon, 12 Jul 2021 10:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626086820;
 bh=ZYpcfcf7qgIM+Qx1cNCzTr/iRgF5v3a7dsuOCWZerQI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IqcY7kabzCOe/xumC/yEPj+39L0m9zh4Y1QLct1cLj3pAq2sT8QHX8GWDYGDCeSdr
 sxrFVI3WeeWaSwKMaPfubJg0bHl/C78i+luF5jkQo4rGWBazJ1d8kGFi/2p4/rpEU4
 VnngVKoZuaGqdrZNau1NDR0gl1EIUWMvIftaZ4RZlyB3K4dYo425Z7ltrJhnno9u/O
 6z80yyGci6U5/fvp7OgpcigzdRpEWaYKF6qJSY93oUNCnQEZBrFEeQi50d1hv5H1FZ
 FaRf3PPRCGo7hq3m9BR9IeHjZowaxtPgfHiOm05e6+sqwwrjHg0DCT9h1y3hHcgYtw
 G74jBB5+G306w==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Mason Zhang <mason.zhang@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mason Zhang <Mason.Zhang@mediatek.com>,
 linux-mediatek@lists.infradead.org, wsd_upstream@mediatek.com,
 linux-spi@vger.kernel.org, leilk.liu@mediatek.com
Subject: Re: [PATCH 1/2] spi: mediatek: add no_need_unprepare support
Date: Mon, 12 Jul 2021 11:45:43 +0100
Message-Id: <162608669456.4543.1877349027408478150.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210629100814.21402-1-mason.zhang@mediatek.com>
References: <20210629100814.21402-1-mason.zhang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210712_034701_188429_9ABB7F64 
X-CRM114-Status: GOOD (  15.80  )
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

On Tue, 29 Jun 2021 18:08:15 +0800, Mason Zhang wrote:
> This patch add no_need_unprepare support for spi, if spi src clk is
> MAIN PLL, it can keep the clk_prepare and will not cause low power
> issue. So we no need do clk_prepare/clk_unprepare in runtime pm,
> and it will get better performance, because clk_prepare has called
> mutex lock.
> In the same way,
> clk_get_rate also has called mutex lock, so we moved it to spi_probe.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/2] spi: mediatek: add no_need_unprepare support
      commit: 162a31effc4182dd5a0675d9fd0336d5096e0ad3

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
