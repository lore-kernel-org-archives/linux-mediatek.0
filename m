Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7483FC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 09:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DIJ1+39WfAtnbQS6WN21NFe7xhBUbXy4vQi6DV815nE=; b=m4VTMAGY62tedN
	QJdbUnMnpg3pW55QcObcutcr/EEFYmCXLeKRl/pntyABoScLzWwBOHIqkm9ck8f3Mk7XgJHKFrnyW
	wGQ0t/accuEawCGLVG6ZAz7ufqEzr5a3cu/ntMNoioPYVRb3Mc4h+s5vKiMg7OrYdnVK0ECZFoDSX
	ArfRLdMQOz+yJvSLDmFJzKPVSaWjiqVjLK2m0+NgGw2afq9asRPJ1MjrhGp8XHzvoV8iq+aFlxuPy
	O6zkBBgbLoQSZIFGSon23xfN0nCkfInqYZ7b2aWQmEc35THjIpYgr7Pp7cxvbcIeebquJTpNypk5c
	QNwXP/ShOW9CcCXyyXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p12jV-00F9Ea-Iu; Fri, 02 Dec 2022 09:53:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p12jK-00F9A7-7h; Fri, 02 Dec 2022 09:53:15 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BAD536602BB8;
	Fri,  2 Dec 2022 09:53:11 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669974792;
	bh=0SFbDcrjgdD7wLBImp+e4xl59u0MBvEJjOar0fcf22M=;
	h=From:To:Cc:Subject:Date:From;
	b=MpUHSJNjjrAaah9BzvQfbxFwCFmUvuLyArUQIkqitNGpRZ5UByHfyXjeoE582XThv
	 ehgRGkC8FC1TNAtRXATImVO+UAtBWoTGLl4OyuDBDJhN0foXXk6tNyt3jgro6Y0VKO
	 EIOwHdaNKoCrsFX/W8IJv7+QOt8mu0ZCIJDb72VtkNjkgB55OHYpn+Zox7vF7JxdoU
	 EYdT3cFQFK0xk7zrD2SI5qRlqlOrNtTir1TVt3hITUABWWqNiKtbGtmR7nUS3k9XwM
	 pTJ3CiHPYDlk/aJYwhJ00ndo2ceWUwic95eCqvJqoA8EUq2zVX0cm/rnbIOGIBkgK0
	 /3+qZpdk54tpg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: viresh.kumar@linaro.org
Subject: [PATCH] cpufreq: mediatek: Raise proc and sram max voltage for MT7622/7623
Date: Fri,  2 Dec 2022 10:52:27 +0100
Message-Id: <20221202095227.167492-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_015314_458668_0E0FFE74 
X-CRM114-Status: GOOD (  12.47  )
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
Cc: vincent@systemli.org, linux-pm@vger.kernel.org, rafael@kernel.org, linux-kernel@vger.kernel.org, daniel@makrotopia.org, rex-bc.chen@mediatek.com, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, jia-wei.chang@mediatek.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

During the addition of SRAM voltage tracking for CCI scaling, this
driver got some voltage limits set for the vtrack algorithm: these
were moved to platform data first, then enforced in a later commit
6a17b3876bc8 ("cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()")
using these as max values for the regulator_set_voltage() calls.

In this case, the vsram/vproc constraints for MT7622 and MT7623
were supposed to be the same as MT2701 (and a number of other SoCs),
but that turned out to be a mistake because the aforementioned two
SoCs' maximum voltage for both VPROC and VPROC_SRAM is 1.36V.

Fix that by adding new platform data for MT7622/7623 declaring the
right {proc,sram}_max_volt parameter.

Fixes: ead858bd128d ("cpufreq: mediatek: Move voltage limits to platform data")
Fixes: 6a17b3876bc8 ("cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index 7f2680bc9a0f..f9a9f08c75c4 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -695,6 +695,15 @@ static const struct mtk_cpufreq_platform_data mt2701_platform_data = {
 	.ccifreq_supported = false,
 };
 
+static const struct mtk_cpufreq_platform_data mt7622_platform_data = {
+	.min_volt_shift = 100000,
+	.max_volt_shift = 200000,
+	.proc_max_volt = 1360000,
+	.sram_min_volt = 0,
+	.sram_max_volt = 1360000,
+	.ccifreq_supported = false,
+};
+
 static const struct mtk_cpufreq_platform_data mt8183_platform_data = {
 	.min_volt_shift = 100000,
 	.max_volt_shift = 200000,
@@ -717,8 +726,8 @@ static const struct mtk_cpufreq_platform_data mt8186_platform_data = {
 static const struct of_device_id mtk_cpufreq_machines[] __initconst = {
 	{ .compatible = "mediatek,mt2701", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt2712", .data = &mt2701_platform_data },
-	{ .compatible = "mediatek,mt7622", .data = &mt2701_platform_data },
-	{ .compatible = "mediatek,mt7623", .data = &mt2701_platform_data },
+	{ .compatible = "mediatek,mt7622", .data = &mt7622_platform_data },
+	{ .compatible = "mediatek,mt7623", .data = &mt7622_platform_data },
 	{ .compatible = "mediatek,mt8167", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt817x", .data = &mt2701_platform_data },
 	{ .compatible = "mediatek,mt8173", .data = &mt2701_platform_data },
-- 
2.38.1


