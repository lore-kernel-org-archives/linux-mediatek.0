Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2565BC433DB
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 02:11:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4B0923A3C
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 02:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4B0923A3C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UN/LHgbzDjpRV0g7IlVmmwhWF1NLdXQa18efIogpb4U=; b=opkXXweb9zEuUvZ1fTZtPx8O1Y
	o9nG8664B1D7AXJOHUJlgpmpqNX/zabQF04dewyqSGeGDcDYDfwva/cHyBtV2/IpbSrAhXDAtLOSi
	1alDSMRHQYFzDyn6d3Dc5A3jgEnFoSuL0nT11t8uZTYs3TsMLxTeSn3knFILhT33hUxmoD8zUIcIH
	TUaHgoE/2ryyfe/aa48FLj6jxPozxSI9ijxK5AUh/rRfdrYEZ53dcYz2OeQCpjCvuAxssJQiU3Tiw
	6+BFDNZmGR/RoXl+pofhNDfUsFbuwQwRMSTbo44rPo+VH0DXCEQb2pmtxREzCVQLfYuJ0ViEGfzgw
	J5xRPATQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ky3ib-0003I6-RW; Sat, 09 Jan 2021 02:11:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ky3iV-0003Gd-KF; Sat, 09 Jan 2021 02:11:00 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC761238EC;
 Sat,  9 Jan 2021 02:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610158257;
 bh=EDiuihkI2zHL3YX+YyvVNrWe26jYFlwF8QTuQEZCbkw=;
 h=From:To:Cc:Subject:Date:From;
 b=QygVfo2nV59Sajx3EWeE0ByXrAMFCYRfmPB9WAX072niACBy4umZ1FtX0N+B33xjr
 5oQdrZcBwIxnGE3Q2wlH52ow98pTlepl2c5O/NF+/sAWETV7P2IijEWoZhallGIGX7
 u9lD17bqxEacfJxZT8/Y2S9n3ftcg7D6Q0BZtFBYQvzxR6NteNtTobwhyCUqYjPqKy
 lrRlMISTXIwWN02VjH6wEt/gMul4dxghy4pwDu0aNgTygG4tbgkBQrVJYUri9Bmw71
 t5U0gTppjRwuysce9jqeH1sTmBSo1e7QLapQVGo2tZLvxYHfJdv+IlK4BkcWHO8gz7
 4MA+TCFvPPumA==
From: matthias.bgg@kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] regulator: mt6360: Add OF match table
Date: Sat,  9 Jan 2021 03:10:44 +0100
Message-Id: <20210109021046.21907-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_211059_733947_75694379 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

Binding documentation mentions that a compatible is required for the
MT6360 device node, but the driver doesn't provide a OF match table.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---

 drivers/regulator/mt6360-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/mt6360-regulator.c b/drivers/regulator/mt6360-regulator.c
index 15308ee29c13..07cbb9bb3c09 100644
--- a/drivers/regulator/mt6360-regulator.c
+++ b/drivers/regulator/mt6360-regulator.c
@@ -445,9 +445,16 @@ static const struct platform_device_id mt6360_regulator_id_table[] = {
 };
 MODULE_DEVICE_TABLE(platform, mt6360_regulator_id_table);
 
+static const struct of_device_id mt6360_of_match[] = {
+	{ .compatible = "mediatek,mt6360-regulator", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mt6360_of_match);
+
 static struct platform_driver mt6360_regulator_driver = {
 	.driver = {
 		.name = "mt6360-regulator",
+		.of_match_table = of_match_ptr(mt6360_of_match),
 	},
 	.probe = mt6360_regulator_probe,
 	.id_table = mt6360_regulator_id_table,
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
