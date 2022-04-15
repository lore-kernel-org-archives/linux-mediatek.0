Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97A1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 05:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPqJ9BHEzjRHB0XeDqxP5MIdlL6GNmbulL281MSh3sU=; b=035mV0Im7HCETL
	AurZnSGfuXKBzIyNJ0Sh+fPhZ35gHRSokJGAgwz06Ches+OQiJkVb8auHDqKNLVYIDbWg5lhjlsPo
	NLsXDBtugPr18YfnUEl6cnOy75/PijO3e260tVQs8O0/cw04K24Sr4EpVFmXvMlRflTgyA/dfvSYo
	zy1AnK6lmmQvedHaIiYILoh9YVMm2ynXQ5F9c+YuUjwC620wdrj4GzsnzRYVT8CAJpWGk6invFNeR
	Zo4fTy0oe1hyWCDA8vFud29pyJLSDAph8ZTzm03z/r48mUKn1NlVNC8VxQm4hgA2UZ2Lk9ucOCHsc
	ryzTW/9lGh6Hixa8v3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfEzq-008o9B-Ss; Fri, 15 Apr 2022 05:59:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfEzN-008nsp-NN; Fri, 15 Apr 2022 05:59:27 +0000
X-UUID: d9e378319bf341e3a53509e5debaa23c-20220414
X-UUID: d9e378319bf341e3a53509e5debaa23c-20220414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 804480568; Thu, 14 Apr 2022 22:59:21 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 14 Apr 2022 22:59:20 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 15 Apr 2022 13:59:18 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 15 Apr 2022 13:59:18 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <jia-wei.chang@mediatek.com>, <roger.lu@mediatek.com>,
 <hsinyi@google.com>, <khilman@baylibre.com>,
 <angelogioacchino.delregno@collabora.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, "Andrew-sh . Cheng"
 <andrew-sh.cheng@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Subject: [PATCH V3 04/15] cpufreq: mediatek: Record previous target vproc value
Date: Fri, 15 Apr 2022 13:59:05 +0800
Message-ID: <20220415055916.28350-5-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_225925_830018_21EB0183 
X-CRM114-Status: GOOD (  12.24  )
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

From: Jia-Wei Chang <jia-wei.chang@mediatek.com>

We found the buck voltage may not be exactly the same with what we set
because CPU may share the same buck with other module.
Therefore, we need to record the previous desired value instead of reading
it from regulators.

Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index ff27f77e8ee6..fa8b193bf27b 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -40,6 +40,7 @@ struct mtk_cpu_dvfs_info {
 	struct list_head list_head;
 	int intermediate_voltage;
 	bool need_voltage_tracking;
+	int pre_vproc;
 };
 
 static LIST_HEAD(dvfs_info_list);
@@ -191,11 +192,17 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 
 static int mtk_cpufreq_set_voltage(struct mtk_cpu_dvfs_info *info, int vproc)
 {
+	int ret;
+
 	if (info->need_voltage_tracking)
-		return mtk_cpufreq_voltage_tracking(info, vproc);
+		ret = mtk_cpufreq_voltage_tracking(info, vproc);
 	else
-		return regulator_set_voltage(info->proc_reg, vproc,
-					     vproc + VOLT_TOL);
+		ret = regulator_set_voltage(info->proc_reg, vproc,
+					    MAX_VOLT_LIMIT);
+	if (!ret)
+		info->pre_vproc = vproc;
+
+	return ret;
 }
 
 static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
@@ -213,7 +220,9 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	inter_vproc = info->intermediate_voltage;
 
 	pre_freq_hz = clk_get_rate(cpu_clk);
-	pre_vproc = regulator_get_voltage(info->proc_reg);
+	pre_vproc = info->pre_vproc;
+	if (pre_vproc <= 0)
+		pre_vproc = regulator_get_voltage(info->proc_reg);
 	if (pre_vproc < 0) {
 		dev_err(cpu_dev, "invalid Vproc value: %d\n", pre_vproc);
 		return pre_vproc;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
