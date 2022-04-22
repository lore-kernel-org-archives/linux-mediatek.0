Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1CBC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 07:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yKHVYMmf6NjIDMGlNl16SWfYM8QMKC8yVXSSkkTpEZ4=; b=dYUf1pnSSsuuY7
	Ph4oJoyqdyGKFQ3KjmMK+Q7XT92QIojCW6Jq5/ZsKZkJAbuMYN4xS/R7+/KqBKPQ1iY/x7OiulHVY
	AmIrdou+rok3T8Q7t7ROHv3jm9AfqlVmLvUM/JL8PZypE4QafO3UbN/4gvXj3FTe7cmMOjApkBn3x
	5SWdNcIjZnaoCwyT/2OpZ56ZGmXzXOSwCuLiR2+jV5m2ybDjW1f7KWv/uObre/5ORxCwlveI1MKyw
	am5a+eOKanj5NVv33aQZB5HvQQPQiCdyb9ABNSatUECl9VpYL430a0jZXBTPHRPqZnUFcGwn4SRSu
	HmSO0gzyv4YHfSslVpoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhoAX-00H2Xs-MM; Fri, 22 Apr 2022 07:57:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhoA9-00H2PS-KO; Fri, 22 Apr 2022 07:57:11 +0000
X-UUID: 97417e702749461692671fb49720100f-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:fbc94fdd-6558-4b2f-af7c-fc15e4f0dd50, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:25,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:25
X-CID-META: VersionHash:faefae9, CLOUDID:1a6797f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 97417e702749461692671fb49720100f-20220422
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1346712263; Fri, 22 Apr 2022 00:57:04 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 00:52:48 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 15:52:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 15:52:45 +0800
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
Subject: [PATCH V4 07/14] cpufreq: mediatek: Add .get function
Date: Fri, 22 Apr 2022 15:52:32 +0800
Message-ID: <20220422075239.16437-8-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_005709_715357_6672740E 
X-CRM114-Status: GOOD (  10.93  )
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

We want to get opp frequency via opp table. Therefore, we add the function
"mtk_cpufreq_get()" to do this.

Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 drivers/cpufreq/mediatek-cpufreq.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index e070a2619bcb..0b2ca0c8eddc 100644
--- a/drivers/cpufreq/mediatek-cpufreq.c
+++ b/drivers/cpufreq/mediatek-cpufreq.c
@@ -71,6 +71,15 @@ static struct mtk_cpu_dvfs_info *mtk_cpu_dvfs_info_lookup(int cpu)
 	return NULL;
 }
 
+static unsigned int mtk_cpufreq_get(unsigned int cpu)
+{
+	struct mtk_cpu_dvfs_info *info;
+
+	info = mtk_cpu_dvfs_info_lookup(cpu);
+
+	return !info ? 0 : (info->opp_freq / 1000);
+}
+
 static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
 					int new_vproc)
 {
@@ -588,7 +597,7 @@ static struct cpufreq_driver mtk_cpufreq_driver = {
 		 CPUFREQ_IS_COOLING_DEV,
 	.verify = cpufreq_generic_frequency_table_verify,
 	.target_index = mtk_cpufreq_set_target,
-	.get = cpufreq_generic_get,
+	.get = mtk_cpufreq_get,
 	.init = mtk_cpufreq_init,
 	.exit = mtk_cpufreq_exit,
 	.register_em = cpufreq_register_em_with_opp,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
