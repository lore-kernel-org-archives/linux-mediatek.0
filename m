Return-Path: <SRS0=452w=GM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F5EEC433E6
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 02:11:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BCA223A3C
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Jan 2021 02:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0BCA223A3C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=j8FuSHy1oNhc+Ctm0EEPWlK0rM6OyxOpxDG7tLci78M=; b=0Tbo3Mrr2Ss3jMsnopuwCpQ5n
	/DK+DsSij7gKCVz81Al5vxF96Lq1k6zaD22bm2qPOIYyn33oLMEGsLzp16eh2SMUBZUVaw65MCsBJ
	oHXS0AO+dPUU2d5+K8yxw4DjnGr8xmC67EBbecWgxWg0m2PVVfi1QtMpxcXpwXJW7qwfLpLLWeloK
	STm4+lR7EOcRfGZ0Q2q89STrozXAU7LlZcBpNLIsx6Yw5qmaLV6xjZUB72hITkcQK33UqEeF8bUoD
	1DnGjkHVZwDN1Kt5q5FZjWUAJqZRV2m8whhvAvd/3raevwFwE/NK0IjoZ0xQcqbWufCG5EpWzg9B0
	HN+vdYlwA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ky3if-0003Ir-K0; Sat, 09 Jan 2021 02:11:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ky3iX-0003Gv-6Y; Sat, 09 Jan 2021 02:11:02 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DC6C23A60;
 Sat,  9 Jan 2021 02:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610158260;
 bh=J8F9GtnOw2YbAF+emi5C/TcN+YhRipufocVzCIIaAFc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jNxX+FGCIjAzQrWyPmXiZ8aIr1rFK2coB0JV+SW1iZx/WddvGjrji9i/XFkMHw40S
 4Nj3NiqNvnAa+AG/gA61O0CDpFq1kuAqWRf4HnEerjnKyNZ1Eewkm32a9ccNkDKpv2
 yZPxjQKo4y7dbe9C2Zw4xwWZGxiK1o8FI4oaFPlu3p4938ZLtw8eyxybttHYg77nQa
 nh8//v2RGfizZ0gX8n7zd7Yw0q3rPgdh6G3uvRZrUvuM/7XK80H3Lukd++Mqs7vAeZ
 KKXi+0+Dx+Nq1nRNRhEhF59SjiaFN1k4a/7utJeOeqgTrvHZsuLSHLD374JO2wNZ12
 9C4oDVpiUp4dg==
From: matthias.bgg@kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] regulator: mt6358: Add OF match table
Date: Sat,  9 Jan 2021 03:10:45 +0100
Message-Id: <20210109021046.21907-2-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210109021046.21907-1-matthias.bgg@kernel.org>
References: <20210109021046.21907-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_211101_534865_8192AE93 
X-CRM114-Status: GOOD (  10.51  )
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

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---

 drivers/regulator/mt6358-regulator.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index 13cb6ac9a892..6cadb6d4dfe4 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -534,9 +534,16 @@ static const struct platform_device_id mt6358_platform_ids[] = {
 };
 MODULE_DEVICE_TABLE(platform, mt6358_platform_ids);
 
+static const struct of_device_id mt6358_of_match[] = {
+	{ .compatible = "mediatek,mt6358-regulator", },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, mt6358_of_match);
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
