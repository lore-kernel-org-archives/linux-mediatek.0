Return-Path: <SRS0=DTTl=YY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770EBCA9ECB
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2019 13:23:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 499E520873
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2019 13:23:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MDuvz9te";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk header.b="w1GXU7OL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 499E520873
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:
	In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=mi1GNeW4UrCqXJBHYW03GWcsQij6Zf6DXUB+5soMSRU=; b=MDu
	vz9telkjCNP8AZiDV+aTFzuDCrNKnEBhsbS2nyUFF9+8usXH7eVYP1omGWyRa37RmK3PgOIgwwNGL
	BOfk+icsVlkR89IeQaFUTKxPXkwbnmWzgZvIg1Rd/LhblYhFRk4WsNT509xfmEzG+ByJw6a9aU41t
	N2O/e1Fh1bfcwpnZBBLc1xGhGSG2poY71Lz6Y2XhN+MyPLJAPxkHuvG0wFN7lTwYSdGN9CLkrdllo
	jl97u3M2wHXSaEyRfu4z48Km6PopqRy5PRa9Sjy3P0PNLPIiN+IxHh9YqNtMsXzuAjj76g7InrEeu
	rqX+gSvG4Pdx2Sii4b3+d8BGqvVR3cA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQAQf-0005V9-Uz; Thu, 31 Oct 2019 13:23:57 +0000
Received: from heliosphere.sirena.org.uk ([172.104.155.198])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQAQS-0005Kl-H6; Thu, 31 Oct 2019 13:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=cX2GQwx79KGhyI+8o2ddFRP7SU55uxLjju8Bx0zNqbU=; b=w1GXU7OLZ6V9
 NOlCeGWK+uVSClvkjcRzuo/o3l28fh9fTqmntUC3CxAMXZbyyEhVLz8thrd9JSq8WC+IZJcgUheOy
 AswowT/c5ZDEURBcNqn1LcApNg7ae2XT2Rahmf+6bGkCr7jeSdXSFfIcLmWo8tdC2FrqIB2gHcbzX
 fViD0=;
Received: from [91.217.168.176] (helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <broonie@sirena.org.uk>)
 id 1iQAQQ-0007p7-C8; Thu, 31 Oct 2019 13:23:42 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 100F1D020AA; Thu, 31 Oct 2019 13:23:42 +0000 (GMT)
From: Mark Brown <broonie@kernel.org>
To: Luhua Xu <luhua.xu@mediatek.com>
Subject: Applied "spi: add power control when set_cs" to the spi tree
In-Reply-To: <1572426234-30019-1-git-send-email-luhua.xu@mediatek.com>
X-Patchwork-Hint: ignore
Message-Id: <20191031132342.100F1D020AA@fitzroy.sirena.org.uk>
Date: Thu, 31 Oct 2019 13:23:42 +0000 (GMT)
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191031_062344_569204_D8AD4890 
X-CRM114-Status: GOOD (  13.47  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The patch

   spi: add power control when set_cs

has been applied to the spi tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-5.5

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

From d948e6ca189985495a21cd622c31e30e72b6b688 Mon Sep 17 00:00:00 2001
From: Luhua Xu <luhua.xu@mediatek.com>
Date: Wed, 30 Oct 2019 17:03:54 +0800
Subject: [PATCH] spi: add power control when set_cs

As to set_cs takes effect immediately, power spi
is needed when setup spi.

Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Luhua Xu <luhua.xu@mediatek.com>
Link: https://lore.kernel.org/r/1572426234-30019-1-git-send-email-luhua.xu@mediatek.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 drivers/spi/spi.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 5ba19ef809c2..294d0038eea6 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3261,7 +3261,20 @@ int spi_setup(struct spi_device *spi)
 	if (spi->controller->setup)
 		status = spi->controller->setup(spi);
 
-	spi_set_cs(spi, false);
+	if (spi->controller->auto_runtime_pm && spi->controller->set_cs) {
+		status = pm_runtime_get_sync(spi->controller->dev.parent);
+		if (status < 0) {
+			pm_runtime_put_noidle(spi->controller->dev.parent);
+			dev_err(&spi->controller->dev, "Failed to power device: %d\n",
+				status);
+			return status;
+		}
+		spi_set_cs(spi, false);
+		pm_runtime_mark_last_busy(spi->controller->dev.parent);
+		pm_runtime_put_autosuspend(spi->controller->dev.parent);
+	} else {
+		spi_set_cs(spi, false);
+	}
 
 	if (spi->rt && !spi->controller->rt) {
 		spi->controller->rt = true;
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
