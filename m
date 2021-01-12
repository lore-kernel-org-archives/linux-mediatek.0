Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D912DC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 10:07:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82F1522B30
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 10:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82F1522B30
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tg49YdtzXaVuOj+YalxdSeoVaiBvoiHFk+P7MkJkjlo=; b=sus4did3NCWhrug7zl5xDaofqT
	D2nVIlSyfoPABheush5YyQRbCZNXoe18bL9z9JopWtTzVtt9BTDp2c0T+8PimkjxNFSSF1csSpEPo
	citu267jyjc1quU+X7YQoe4BVOMXkSdPI4aOYUOXXxOSuno2IbbHfBPYQiKdmgh0O1Fj9IKEqWdqF
	DYM3Tut+4bKzV4pN0EHf2fv33x7UjV9R1wql36RZtb9OZ9jyLj0BakDwNHVFqH5MrLtecZ8nyg5+V
	CWzRt4NkwvPg+BmQc5EMrtgIrRT7HnrPfF/yi4HyxKlzv1z0fKo8C4spuvnkNcrCNLUJKcSmGXJAE
	rPVUHUag==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzGa4-0005TC-ML; Tue, 12 Jan 2021 10:07:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzGZv-0005Pc-UH; Tue, 12 Jan 2021 10:07:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 28AB923107;
 Tue, 12 Jan 2021 10:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610446026;
 bh=vdwmtnjiAMvviv26hOvbYr6Ik1Q7vOUq5UUucWiEegc=;
 h=From:To:Cc:Subject:Date:From;
 b=EdL2vLx3V3nkkoVBN39WY2dZbTEsYPI7oeFJd/yzffxDzveGK4Pq71jmTWpdGN98K
 ypzt/DPi8AkAYmHcyOR8Tz4Wmu5IBW5L4+V/PgXL3A4EdJeON8vq+3LyV1rQKxjmoW
 rjFkH274nXB8FGArd1sKLcfkVzjJFcURfchKqhDDzjhSvHQtGne19SG099O7YE88zP
 m2YhxHaQdzREhXVYlwkGvgtWLTU8W+qXjOFiLk86RfsaBSa+inZNPSBFw3ibTM9DHk
 X1Ks4jTEaI7IL/ZJ0yeShaemKro4DGilTDJPBciLV4jb8C+lU8PkhHjBRkDPbcYpN8
 AEqJBDSWNPYgg==
From: matthias.bgg@kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v3 1/2] regulator: mt6358: Add OF match table
Date: Tue, 12 Jan 2021 11:06:57 +0100
Message-Id: <20210112100659.19350-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_050708_079987_DC0AA6A2 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: Gene Chen <gene_chen@richtek.com>, Matthias Brugger <mbrugger@suse.com>,
 Axel Lin <axel.lin@ingics.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

The binding documentation mentions that a compatible is required for the
MT6358 device node. But the driver does not provide a OF match table.
This way auto-loading is broken as the MFD driver that registers the
device has a .of_compatible set which makes the platform .uevent
callback report a OF modalias, but that's not in the module.

Fixes: f67ff1bd58f0 ("regulator: mt6358: Add support for MT6358 regulator")
Signed-off-by: Matthias Brugger <mbrugger@suse.com>

---

Changes in v3:
- drop mt6360 patch

Changes in v2:
- check for CONFIG_OF
- add Fixes tag

 drivers/regulator/mt6358-regulator.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index 13cb6ac9a892..a4ed19a54ec6 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -534,9 +534,18 @@ static const struct platform_device_id mt6358_platform_ids[] = {
 };
 MODULE_DEVICE_TABLE(platform, mt6358_platform_ids);
 
+#ifdef CONFIG_OF
+static const struct of_device_id mt6358_of_match[] = {
+	{ .compatible = "mediatek,mt6358-regulator", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mt6358_of_match);
+#endif
+
 static struct platform_driver mt6358_regulator_driver = {
 	.driver = {
 		.name = "mt6358-regulator",
+		.of_match_table = of_match_ptr(mt6358_of_match),
 	},
 	.probe = mt6358_regulator_probe,
 	.id_table = mt6358_platform_ids,
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
