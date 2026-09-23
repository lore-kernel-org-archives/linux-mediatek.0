Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857C6C982EA
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Sep 2026 07:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GC++7yEkGwzylqDh+PC3SB2xhKREJhD0cBQEVLS++uM=; b=nw3wes30/9XjreI4bSYPRLaUww
	q9kjwNWo1JyePAaYZ5ttIKsgHCVcmOkdCNkBwSRkqUreah2Wked2cES7/N0/adzTq1ONfvCOu8xPM
	EoG8W0evCckGjLAojEff0WjMx7479+WTb645VduipKzwwIjkKwzGc78ClYEAQZY1Y/7taXgBJBPT5
	ZMZBHFi3b9sfsnRjDB0IzINqjU4EbPrfiXPxPOdYsN4xL1yev5qlVI8R4dCpzb+d0h55OqSfcIbGr
	2rRIqF4aqFtDJdZRHUzIa09J5NYAUVkLmTVAhZq9Y6bs0owBtxzqmZCBS7XhWnku9CXa7VbECn3j1
	D3r8EWrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HKn-00000007Ogx-19bV;
	Wed, 23 Sep 2026 07:24:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9HKl-00000007Og0-1z4D;
	Wed, 23 Sep 2026 07:24:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DC1C243F3B;
	Wed, 23 Sep 2026 07:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFE05C2BCFB;
	Wed, 23 Sep 2026 07:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790148242;
	bh=bMimWP7/2n7kxCpCnfJdRq+u+0JebIhQppMg7TsGX7Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nioopepw/4/n17JYod4oij4mpiPrATm9k7rd1ibi8h+UwHWVjDBEwriAlIVsY4mr6
	 Djb4Inqk8KKh6g2bBHduTxJwnYjcnZ5QpNILZ+WdV/I0wL5S2v6aPIsLY0e5LR1VGD
	 wpGSLC8XCrYowgPBk4Q29qIHZIsmc9jpdNg/yXIn5IaOuIe4BrUwH29IVC8rDuIkA4
	 gmzxdNZ/84DNQ/8/lRLeUtrnmaBDJFwhsLT3MW0eeyUd4iu0/ubHqu33T+TpdiGHRp
	 vkcYg9ahe9GZWjPR+ANcC/brtKMT6OFYK5IijWzComQSF0JPInTBOwZzgYwzfX/m8w
	 o1vvK1nGQwC0w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A730AC98308;
	Wed, 23 Sep 2026 07:24:02 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Wed, 23 Sep 2026 10:23:35 +0300
Subject: [PATCH 2/3] cpufreq: mediatek: add mt6572 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-6572-cpufreq-v1-2-41f7af6d6d1a@protonmail.com>
References: <20260923-6572-cpufreq-v1-0-41f7af6d6d1a@protonmail.com>
In-Reply-To: <20260923-6572-cpufreq-v1-0-41f7af6d6d1a@protonmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790148240; l=1524;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=b8RMk+Zv48cfJke7eSfTbaAxttUL1iUBiWM/BLYw9Fw=;
 b=WAtqaltRs4wSpqv0CO4qpYqEoudV+Gy+Tl/BfW9ztNKoM+pdXzu5ZvgkpisnwelUGwfCf0jXZ
 TU3bA3ie/SIAkFBJYaQbX87KwRldSLbbgOO/qXeUjDSAqfNG2EZuWf4
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add mt6572 SoC platform data for CPU frequency scaling.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index f15135b2898b..615bccc77c98 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -737,6 +737,14 @@ static const struct mtk_cpufreq_platform_data mt2701_platform_data = {
 	.ccifreq_supported = false,
 };
 
+static const struct mtk_cpufreq_platform_data mt6572_platform_data = {
+	.min_volt_shift = 100000,
+	.max_volt_shift = 200000,
+	.proc_max_volt = 1250000,
+	.sram_min_volt = 0,
+	.ccifreq_supported = false,
+};
+
 static const struct mtk_cpufreq_platform_data mt7622_platform_data = {
 	.min_volt_shift = 100000,
 	.max_volt_shift = 200000,
@@ -793,6 +801,7 @@ static const struct mtk_cpufreq_platform_data mt8516_platform_data = {
 static const struct of_device_id mtk_cpufreq_machines[] __initconst __maybe_unused = {
 	{ .compatible = "mediatek,mt2701", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt2712", .data = &mt2701_platform_data },
+	{ .compatible = "mediatek,mt6572", .data = &mt6572_platform_data },
 	{ .compatible = "mediatek,mt7622", .data = &mt7622_platform_data },
 	{ .compatible = "mediatek,mt7623", .data = &mt7623_platform_data },
 	{ .compatible = "mediatek,mt7988a", .data = &mt7988_platform_data },

-- 
2.55.0



