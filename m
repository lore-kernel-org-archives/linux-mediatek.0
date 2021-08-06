Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA7BC4320E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 00:48:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD14461206
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 00:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD14461206
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEvrL5ShuwPTlPxDgIhKI+pA7vu/pcftB1/J7bewr0Q=; b=K2TMeXg8D6RtoV
	1dVZ+LicJMF7XtiqZqrmCoGmXe+zx3OCVkZJg33optdEkbcImZ+vEjKHocfa0sA60n+mGHGLTvQ5B
	qtT7QGuzZPyE2LcRTVnjGQTXaksjCEmgbFBejuDeGVCZlSlJP7MT4rfLBlr26Q9fLYIvZM6H3N5/D
	i0li922Run8yWjOQnZrD4Wl+Il24CvrMgDnP6uyxyysfuV8GxlKXpp03j2s5QYQlCHI46JZ7OLkwo
	p3A8nWvJA4PE8GqWsy1S+OiIXlOOP6xn0yYJ5t5XtjE4sOCKoFZcuUavCF/aU4qdwUAkvM+6qQDE5
	JDTZpRT/sII63HF+j4sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBo2R-00BAUW-6k; Fri, 06 Aug 2021 00:48:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBo1z-00BALq-PJ; Fri, 06 Aug 2021 00:48:13 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDD6261179;
 Fri,  6 Aug 2021 00:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628210891;
 bh=SJngD0TLU06KGxhn5FSbzmHj0sNAqLNqGK3TJwK87Fk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gRxAgMe5obGiobD4uKlMY+JF1bnP2KKw1mO5exoIchNvLacRb9QdADJLBHA0RYjOF
 IT8K8Yv+zERFQ6hCfAogIHH+lnB3kKLDvbc/RDWLAIRSeh717m/7ZGx9qV83t3RJyw
 vPnVpNbgw0234NHkitFdlrUAyrp4MZaUF0HoYeErsIxdSYR5XkwsKq5C529AduqD4E
 ObbGCubG4rJkMvWPb01L6BzaWlZTeNQSUdBQWhbHddKnjk8g1ecoTpY67nnaIPXJ4W
 SByX82ZyaeoL0uX4rP5QDTyyuqJRLZS+gXXqK+hvhNghS4niHqXhPnUwmCALeMLOv5
 +rHq2/Vb/zrFw==
From: Mark Brown <broonie@kernel.org>
To: Mason Zhang <mason.zhang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-spi@vger.kernel.org, Mason Zhang <Mason.Zhang@mediatek.com>,
 wsd_upstream@mediatek.com, leilk.liu@mediatek.com
Subject: Re: [PATCH 1/3] spi: move cs spi_delay to spi_device
Date: Fri,  6 Aug 2021 01:47:44 +0100
Message-Id: <162821082762.19049.12115037494826323107.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210719091611.15303-1-mason.zhang@mediatek.com>
References: <20210719091611.15303-1-mason.zhang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_174811_937517_12558E2A 
X-CRM114-Status: GOOD (  11.09  )
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

On Mon, 19 Jul 2021 17:16:12 +0800, Mason Zhang wrote:
> As we know, spi core layer has removed spi_set_cs_timing() API.
> So this patch moved spi_delay for cs_timing from spi_controller
> to spi_device, because cs timing should be set by spi_device but
> not controller.

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[1/3] spi: move cs spi_delay to spi_device
      commit: 8c33ebfeeb597ea953df93f84ea25482d29c664f

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
