Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 041ACC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 06:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZcV+6B9lwXPE+C4BZxOOOFZfktGNmzzlrcn0Wd8K4hE=; b=aZADrYUKqFfFpS
	cNJFnW1RAzLcE94wOcSRxCLuobpFnZO8H08vdE+ybefC8erD1CSWrwuATvuqLgakgBo0eL02NgeaH
	GLvCxZ9nmZecmrpGcmfDEVXHpBNAutwuHOBv7G9nDTJdIqIrNJHRtqq0gvOI8IJZXq/OsRq4/d3Fr
	C4svoQZMeUIn/z8QcM03LJgglxiBZ/rDP9cNekOsBI1IMx9GcGbtRA4bA/F+0kWxPGwdaZg4D9G5U
	GtsgP0jbcR0eSh9uA8xYDRn1FEFRXW+0DIPdPNEfqqx6KPCknmW0NCl6FkHrHoQjSQQQhZyrkq07U
	2qpu6hvO7zpgU6KQjMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfF08-008oGV-5Y; Fri, 15 Apr 2022 06:00:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfEzP-008nsm-AK; Fri, 15 Apr 2022 05:59:28 +0000
X-UUID: d2a753dc4d0a4453a8f09059b6726fa5-20220414
X-UUID: d2a753dc4d0a4453a8f09059b6726fa5-20220414
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1046645988; Thu, 14 Apr 2022 22:59:21 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 22:59:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Apr 2022 13:59:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 15 Apr 2022 13:59:19 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V3 10/15] cpufreq: mediatek: Add counter to prevent infinite
 loop when tracking voltage
Date: Fri, 15 Apr 2022 13:59:11 +0800
Message-ID: <20220415055916.28350-11-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_225927_384465_A920F9E4 
X-CRM114-Status: GOOD (  11.75  )
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

To prevent infinite loop when tracking voltage, we calculate the maximum
value for each platform data.
We assume min voltage is 0 and tracking target voltage using
min_volt_shift for each iteration.
The retry_max is 3 times of expeted iteration count.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index cc44a7a9427a..d4c00237e862 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -86,6 +86,16 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 	struct regulator *proc_reg = info->proc_reg;
 	struct regulator *sram_reg = info->sram_reg;
 	int pre_vproc, pre_vsram, new_vsram, vsram, vproc, ret;
+	int retry_max;
+
+	/*
+	 * We assume min voltage is 0 and tracking target voltage using
+	 * min_volt_shift for each iteration.
+	 * The retry_max is 3 times of expeted iteration count.
+	 */
+	retry_max = 3 * DIV_ROUND_UP(max(info->soc_data->sram_max_volt,
+					 info->soc_data->proc_max_volt),
+				     info->soc_data->min_volt_shift);
 
 	pre_vproc = regulator_get_voltage(proc_reg);
 	if (pre_vproc < 0) {
@@ -151,6 +161,12 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 
 		pre_vproc = vproc;
 		pre_vsram = vsram;
+
+		if (--retry_max < 0) {
+			dev_err(info->cpu_dev,
+				"over loop count, failed to set voltage\n");
+			return -EINVAL;
+		}
 	} while (vproc != new_vproc || vsram != new_vsram);
 
 	return 0;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
