Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C802AC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 07:26:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9532E22BEA
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 07:26:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="F9qFgPmR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="oKECoV8C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9532E22BEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r98JuQQxzN9qt4T69LhdNzniKicYq+xsiBLWYua0Tlo=; b=F9qFgPmRDoR6ZXMVSToOMMbPAG
	7BWUBtHzdKe7KngOpl6+PmymJQETVoh2wcB3s1oRNGBnSjaKMhO1aSbWogTRly+iL8YUfNW/tYGS+
	KRuXu+WllRQ0bBbVAf9hCo8rgcVtwpWZKg30ttEUQW73T25v8lz80H1rjRzjwM5X980X6XnwkyKX1
	teBlAsQM1u1qzbqfNNx7uJj0yZMkAcxeKfWIZTsebNBsAGFdyv9pbWVf1m7N5bljXzf9e/VCXr4xs
	uCPk+LFBaKdxW8MgJmzAJIP2ucGan2Iieo6cPq1TNkq8WdQ8L+5jx9+VB0o4Ox9nDAgGmmutk2SPG
	AzcstyQw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBCIw-00074P-Bp; Thu, 27 Aug 2020 07:26:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBCIq-00071h-0S; Thu, 27 Aug 2020 07:26:32 +0000
Received: from kozik-lap.mshome.net (unknown [194.230.155.216])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 00AA622BEA;
 Thu, 27 Aug 2020 07:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598513191;
 bh=90a9ZhlFuSPAOjQxk04wDw4LIX5PUnsmuyC3grz/ji8=;
 h=From:To:Cc:Subject:Date:From;
 b=oKECoV8CYsgDpAvjo7nOxplkehdURqkHPlg65V1JVtuu77hPtxa6fOKrcMnyoCKaQ
 DIt6A2PvzLkzmlx4pCEeF80ZdllmPjytdu/u23q6ubzm7RtTLbFWEPcTGlOjaAUGe5
 hfsdgV1C1q24sJ6MrAAE0rx1Hluvdr6ummKnbO4U=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Houlong Wei <houlong.wei@mediatek.com>, HS Liao <hs.liao@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] maiblox: mediatek: Fix handling of platform_get_irq() error
Date: Thu, 27 Aug 2020 09:26:26 +0200
Message-Id: <20200827072626.23331-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_032632_123917_5CAB0668 
X-CRM114-Status: GOOD (  13.09  )
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

platform_get_irq() returns -ERRNO on error.  In such case comparison
to 0 would pass the check.

Fixes: 623a6143a845 ("mailbox: mediatek: Add Mediatek CMDQ driver")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mailbox/mtk-cmdq-mailbox.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 484d4438cd83..76e4dfcf5228 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -525,10 +525,8 @@ static int cmdq_probe(struct platform_device *pdev)
 	}
 
 	cmdq->irq = platform_get_irq(pdev, 0);
-	if (!cmdq->irq) {
-		dev_err(dev, "failed to get irq\n");
-		return -EINVAL;
-	}
+	if (!cmdq->irq < 0)
+		return cmdq->irq;
 
 	plat_data = (struct gce_plat *)of_device_get_match_data(dev);
 	if (!plat_data) {
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
