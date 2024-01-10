Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08ECBC4707C
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 14:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2owic68I20DATGgxJ34JHR73fjNMYd+pcOW+WhXYvs=; b=lPzogrKvITcOyO1ep2fAvsuB/G
	uw+CnvkQQctrQ68fZlAhvDSUJ8me042h4b7TxGKaPjcqUjg8o92ndECXjcPUPD+6tn9y/btnLHiqN
	LekCsXXP2IO7wweyYv/ToN4obN9AV0cJGdzuuiu2leQvrZon7BiRTcUaob2Mq1EqcHaZDVoxhOsze
	Tswyz8W9Rg0ieZkrKZHiIY91syqce9u/nU+TYjSHToOScZzPOEiQLcRbb1FvdmBjyrZBHB6i+cspT
	UzuPNg2rg8B1T/3/bNkx5kTJAC4U5EdlI12AssYR8P77Xh0EvWtPFgFKrS0QANqRDY443aPOFee4k
	vq0mzo5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZWN-00CJ79-1u;
	Wed, 10 Jan 2024 14:25:31 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZWI-00CJ46-0D;
	Wed, 10 Jan 2024 14:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704896724;
	bh=GruA9Ly7wkFPn1q/+QSDJ+FMjRv9dhzwRyz0dijp/xc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=xk4R8Lo4pdDJpjNYh1MtD+Fi9asVHGwd6N8WSTyS4n1YXL+rfh8hRstEzqczRMEG8
	 fU8Uk++gBqW0TPdT57E8MF8Uw5MoBResvXMQMhVzU0TF+uC+3A2ELhP1Dg31GCT6Ht
	 ZDYu469Es+04GxBmXOy7hD/7N03Qu5GnsMv01VeL6xSkqUL+wqBafX4F42UexZ5dSo
	 W8eoUnXV+e21oX3chkWAEQcPwE9yu3Sa9Jam4fArXt4w0YV4TwWmm0aaZy7+yGPUxi
	 ebfNbZE8HAaYqUh1iG4dOowf7YC/SKdSkZ7PUuJ0lixRBfWIu2Tc/XVQ8Ag3HxTdJj
	 DFJKMiAhXOZHw==
Received: from localhost.localdomain (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6EA3C378045F;
	Wed, 10 Jan 2024 14:25:20 +0000 (UTC)
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Viresh Kumar <viresh.kumar@linaro.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	"Hector.Yuan" <hector.yuan@mediatek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 2/2] cpufreq: mediatek-hw: Wait for CPU supplies before probing
Date: Wed, 10 Jan 2024 11:23:02 -0300
Message-ID: <20240110142305.755367-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240110142305.755367-1-nfraprado@collabora.com>
References: <20240110142305.755367-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_062526_241366_3F3D99A5 
X-CRM114-Status: GOOD (  16.34  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Before proceeding with the probe and enabling frequency scaling for the
CPUs, make sure that all supplies feeding the CPUs have probed.

This fixes an issue observed on MT8195-Tomato where if the
mediatek-cpufreq-hw driver enabled the hardware (by writing to
REG_FREQ_ENABLE) before the SPMI controller driver (spmi-mtk-pmif),
behind which lies the big CPU supply, probed the platform would hang
shortly after with "rcu: INFO: rcu_preempt detected stalls on
CPUs/tasks" being printed in the log.

Fixes: 4855e26bcf4d ("cpufreq: mediatek-hw: Add support for CPUFREQ HW")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

---

Changes in v2:
- Added this commit

 drivers/cpufreq/mediatek-cpufreq-hw.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq-hw.c b/drivers/cpufreq/mediatek-cpufreq-hw.c
index d46afb3c0092..a1aa9385980a 100644
--- a/drivers/cpufreq/mediatek-cpufreq-hw.c
+++ b/drivers/cpufreq/mediatek-cpufreq-hw.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
 #define LUT_MAX_ENTRIES			32U
@@ -300,7 +301,23 @@ static struct cpufreq_driver cpufreq_mtk_hw_driver = {
 static int mtk_cpufreq_hw_driver_probe(struct platform_device *pdev)
 {
 	const void *data;
-	int ret;
+	int ret, cpu;
+	struct device *cpu_dev;
+	struct regulator *cpu_reg;
+
+	/* Make sure that all CPU supplies are available before proceeding. */
+	for_each_possible_cpu(cpu) {
+		cpu_dev = get_cpu_device(cpu);
+		if (!cpu_dev)
+			return dev_err_probe(&pdev->dev, -EPROBE_DEFER,
+					     "Failed to get cpu%d device\n", cpu);
+
+		cpu_reg = devm_regulator_get_optional(cpu_dev, "cpu");
+		if (IS_ERR(cpu_reg))
+			return dev_err_probe(&pdev->dev, PTR_ERR(cpu_reg),
+					     "CPU%d regulator get failed\n", cpu);
+	}
+
 
 	data = of_device_get_match_data(&pdev->dev);
 	if (!data)
-- 
2.43.0


