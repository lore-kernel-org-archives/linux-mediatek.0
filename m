Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73923C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:57:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B3EE64FD6
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 14:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B3EE64FD6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=f2vNgHiXQN1zMkR/D1B8nb2qgyszFDMpC7celU6oTxs=; b=kMCm+KSRdG/eg0GDNLX+GS9uJ
	JyVq8KO1PScoUucEmoVVaamR8Za0AKbnc0TLOWJWaQXsibGpqljOQjOUGmDFASlzA32k+u0oRZSS6
	KohfxoCWLT9wu0hkmV1Q8NN2VR+s4iMnWWP+oouIYUSu42gYRghhYLcgE+Av6kk2mtqAMiKmb82EH
	LNZ/cfKqEqgrgNw68uYG0kvIH2uDpGjvKUsXlyX/GYyAGUI4CUBCmRprESY2V5yAzBVIQkA0IDb6C
	kIAlkiMxEZi09454BxnO3Wcp1jjAJWo2WoBAmE+Jz6dU9O/f2Vid/0bBYX5DwPFn7wOM9btyy33rp
	1AT7uNnBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKjDt-00Bgup-J0; Fri, 12 Mar 2021 14:57:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKjD3-00Bgfz-8P; Fri, 12 Mar 2021 14:56:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C74A664FF5;
 Fri, 12 Mar 2021 14:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615560972;
 bh=e6aLLo9i99t687jAHqhOEFnsHr18eT8QCSrvSWuados=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IUhJxiZeYkiZg60n/mwk/bIMEUsg5shOlU6VNI2OH3Tj8GuivdojXazw7yLkoONxl
 haNcALVeBW/iCIlsBPtrO7bG3ioNhfb4Y4xhZZdqgsVsNgYjyVt/WYN26pUs+S+pOP
 LIZfrTdZPuJV6ykrDyZRcwpYLaOiTcLlV5ZQ40kzLtNvyANbc9en63zCd6ah1HsCS1
 rt+9Y+V7yHt3oKZOmZZ6g1KmPVNC/23tgbT7s+J8UeKkNP7VC82RoDHZUQTLNPwixz
 3R0FfFJcf9KJKLL3jT10W5UtkcF4zHP8plIv49sivvZ2r/gd3rGB0TZGJQ/6QJE5tQ
 4+YwXI9ZrL4Lw==
From: matthias.bgg@kernel.org
To: lee.jones@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <mbrugger@suse.com>
Subject: [PATCH 4/7] regulator: mediatek: Add regulators_node to description
Date: Fri, 12 Mar 2021 15:55:42 +0100
Message-Id: <20210312145545.26050-4-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210312145545.26050-1-matthias.bgg@kernel.org>
References: <20210312145545.26050-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_145613_927796_2593D4EE 
X-CRM114-Status: GOOD (  12.58  )
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

From: Matthias Brugger <mbrugger@suse.com>

Define the regulator node under which the regulators are described.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 drivers/regulator/mt6323-regulator.c |  3 +++
 drivers/regulator/mt6358-regulator.c |  4 ++++
 drivers/regulator/mt6397-regulator.c | 10 +++-------
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/regulator/mt6323-regulator.c b/drivers/regulator/mt6323-regulator.c
index ff9016170db37..8b22ded43ab8a 100644
--- a/drivers/regulator/mt6323-regulator.c
+++ b/drivers/regulator/mt6323-regulator.c
@@ -42,6 +42,7 @@ struct mt6323_regulator_info {
 	.desc = {							\
 		.name = #vreg,						\
 		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("mt6323regulator"),	\
 		.ops = &mt6323_volt_range_ops,				\
 		.type = REGULATOR_VOLTAGE,				\
 		.id = MT6323_ID_##vreg,					\
@@ -66,6 +67,7 @@ struct mt6323_regulator_info {
 	.desc = {							\
 		.name = #vreg,						\
 		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("mt6323regulator"),	\
 		.ops = &mt6323_volt_table_ops,				\
 		.type = REGULATOR_VOLTAGE,				\
 		.id = MT6323_ID_##vreg,					\
@@ -88,6 +90,7 @@ struct mt6323_regulator_info {
 	.desc = {							\
 		.name = #vreg,						\
 		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("mt6323regulator"),	\
 		.ops = &mt6323_volt_fixed_ops,				\
 		.type = REGULATOR_VOLTAGE,				\
 		.id = MT6323_ID_##vreg,					\
diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
index 13cb6ac9a8929..f5c478d7baaf2 100644
--- a/drivers/regulator/mt6358-regulator.c
+++ b/drivers/regulator/mt6358-regulator.c
@@ -44,6 +44,7 @@ struct mt6358_regulator_info {
 	.desc = {	\
 		.name = #vreg,	\
 		.of_match = of_match_ptr(match),	\
+		.regulators_node = of_match_ptr("mt6358regulator"),	\
 		.ops = &mt6358_volt_range_ops,	\
 		.type = REGULATOR_VOLTAGE,	\
 		.id = MT6358_ID_##vreg,		\
@@ -74,6 +75,7 @@ struct mt6358_regulator_info {
 	.desc = {	\
 		.name = #vreg,	\
 		.of_match = of_match_ptr(match),	\
+		.regulators_node = of_match_ptr("mt6358regulator"),	\
 		.ops = &mt6358_volt_table_ops,	\
 		.type = REGULATOR_VOLTAGE,	\
 		.id = MT6358_ID_##vreg,	\
@@ -99,6 +101,7 @@ struct mt6358_regulator_info {
 	.desc = {	\
 		.name = #vreg,	\
 		.of_match = of_match_ptr(match),	\
+		.regulators_node = of_match_ptr("mt6358regulator"),	\
 		.ops = &mt6358_volt_range_ops,	\
 		.type = REGULATOR_VOLTAGE,	\
 		.id = MT6358_ID_##vreg,	\
@@ -124,6 +127,7 @@ struct mt6358_regulator_info {
 	.desc = {	\
 		.name = #vreg,	\
 		.of_match = of_match_ptr(match),	\
+		.regulators_node = of_match_ptr("mt6358regulator"),	\
 		.ops = &mt6358_volt_fixed_ops,	\
 		.type = REGULATOR_VOLTAGE,	\
 		.id = MT6358_ID_##vreg,	\
diff --git a/drivers/regulator/mt6397-regulator.c b/drivers/regulator/mt6397-regulator.c
index 0a30df5e414fc..9e8589f773eaa 100644
--- a/drivers/regulator/mt6397-regulator.c
+++ b/drivers/regulator/mt6397-regulator.c
@@ -42,6 +42,7 @@ struct mt6397_regulator_info {
 	.desc = {							\
 		.name = #vreg,						\
 		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("mt6397regulator"),	\
 		.ops = &mt6397_volt_range_ops,				\
 		.type = REGULATOR_VOLTAGE,				\
 		.id = MT6397_ID_##vreg,					\
@@ -70,6 +71,7 @@ struct mt6397_regulator_info {
 	.desc = {							\
 		.name = #vreg,						\
 		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("mt6397regulator"),	\
 		.ops = &mt6397_volt_table_ops,				\
 		.type = REGULATOR_VOLTAGE,				\
 		.id = MT6397_ID_##vreg,					\
@@ -89,6 +91,7 @@ struct mt6397_regulator_info {
 	.desc = {							\
 		.name = #vreg,						\
 		.of_match = of_match_ptr(match),			\
+		.regulators_node = of_match_ptr("mt6397regulator"),	\
 		.ops = &mt6397_volt_fixed_ops,				\
 		.type = REGULATOR_VOLTAGE,				\
 		.id = MT6397_ID_##vreg,					\
@@ -396,16 +399,9 @@ static const struct platform_device_id mt6397_platform_ids[] = {
 };
 MODULE_DEVICE_TABLE(platform, mt6397_platform_ids);
 
-static const struct of_device_id mt6397_of_match[] = {
-	{ .compatible = "mediatek,mt6397-regulator", },
-	{ /* sentinel */ },
-};
-MODULE_DEVICE_TABLE(of, mt6397_of_match);
-
 static struct platform_driver mt6397_regulator_driver = {
 	.driver = {
 		.name = "mt6397-regulator",
-		.of_match_table = of_match_ptr(mt6397_of_match),
 	},
 	.probe = mt6397_regulator_probe,
 	.id_table = mt6397_platform_ids,
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
