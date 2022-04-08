Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6303C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 05:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=55ABS8fbcDkGN/MbDFoJpc/d6nN2mZRW/oDPEj8YBqc=; b=ZOIVBtszl0UZ4l
	+Q4cfJRyr7XmtY4K89cLGCQLH6JKKmT7a1lX32L8hXS/ZMDOv5LGHMZB1oNflgmiT4UMQbHhaLmX+
	xR00Wm7jYFPhnlMAkuYPo97jHKEfWssYW8DwBM5/aDsFG759s/IyRH3NKQiDh1n0/YVqZZ3eAXL+R
	L19pwdQAOd0G5IRAetNs8T+yCqpEQj3utNH/tACX6DvIVKsD+cIZ5QaMjza2wSNPQXqRJUXDeL4K/
	WJ1vl/wWShc2E95WfcbDoZKIpCaoM3DGsL+yvLMu+QA9TS1RaySsz3cxElH8S46mL1M/uCicNwtWO
	QmGEvkyKor+aNd82J1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncgvV-00F3Ca-Ec; Fri, 08 Apr 2022 05:12:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncgs8-00F1BV-Gu; Fri, 08 Apr 2022 05:09:26 +0000
X-UUID: c669e02b12b24405909efbfbe40b5ae8-20220407
X-UUID: c669e02b12b24405909efbfbe40b5ae8-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 351575292; Thu, 07 Apr 2022 22:09:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 21:59:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 8 Apr 2022 12:59:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 8 Apr 2022 12:59:12 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <rafael@kernel.org>, <viresh.kumar@linaro.org>, <robh+dt@kernel.org>,
 <krzk+dt@kernel.org>
CC: <matthias.bgg@gmail.com>, <jia-wei.chang@mediatek.com>,
 <roger.lu@mediatek.com>, <hsinyi@google.com>, <linux-pm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH V2 12/15] cpufreq: mediatek: Use maximum voltage in init stage
Date: Fri, 8 Apr 2022 12:59:05 +0800
Message-ID: <20220408045908.21671-13-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_220924_605029_CC436256 
X-CRM114-Status: GOOD (  12.56  )
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

Two or more clients may use the same regulator, and it could cause the
issue of high-freqeuncy-low-voltage.
To prevent this, we use maximum voltage in mtk_cpu_dvfs_info_init().

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index e69b16a6541e..b08ab7c14818 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -333,7 +333,7 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 {
 	struct device *cpu_dev;
 	struct dev_pm_opp *opp;
-	unsigned long rate;
+	unsigned long rate, opp_volt;
 	int ret;
 
 	cpu_dev = get_cpu_device(cpu);
@@ -417,6 +417,24 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
 	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
 	dev_pm_opp_put(opp);
 
+	/* Use highest opp voltage in the init stage */
+	rate = U32_MAX;
+	opp = dev_pm_opp_find_freq_floor(info->cpu_dev, &rate);
+	if (IS_ERR(opp)) {
+		ret = PTR_ERR(opp);
+		dev_err(cpu_dev, "cpu%d: failed to get opp\n", info->opp_cpu);
+		goto out_disable_inter_clock;
+	}
+
+	opp_volt = dev_pm_opp_get_voltage(opp);
+	dev_pm_opp_put(opp);
+	ret = mtk_cpufreq_set_voltage(info, opp_volt);
+	if (ret) {
+		dev_err(cpu_dev, "cpu%d: failed to scale to highest voltage %lu in proc_reg\n",
+			info->opp_cpu, opp_volt);
+		goto out_disable_inter_clock;
+	}
+
 	info->opp_cpu = cpu;
 	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
 	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
