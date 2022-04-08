Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7652C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 05:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/1+YeJ2QJre/TfJRwsuO023gD9KqAcJ6N7VDYmQ0fqY=; b=E9jIEQE2eCiXU5
	oBVf/XBCR/p7yPgd5rvNRUQ3vhjjxtS6MhKSSNNGDnltDikrtiI4gtbqgwsyB10hiFKA+OZUDfCwp
	MwTrSHKUxui9Y5VqcPxKIGsM+93/b1c72cZhh/Zk7no5Fyj4U/wOWKVQpYGBuMC5YDy/zVByaG4fA
	Hrqcqgop5dPdfehxgg2WG4OiphhPKxx8sndoxlU+czpqrDNG17N8dzTmOfgST6840EsL1gPQWD/aM
	AY2qqjl/2aGYacThOywj+Iw0g4GIyBrEKicxZcUadzlIhQKIOb/UT6pOZsVzl+ExM5o3Tv9ka/dln
	rsqJhPK0JDDtwg8m51pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncgyA-00F4hg-VX; Fri, 08 Apr 2022 05:15:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncgsB-00F1BQ-TI; Fri, 08 Apr 2022 05:09:29 +0000
X-UUID: 0b73d5e5e1ca427b97a299e42a1725f0-20220407
X-UUID: 0b73d5e5e1ca427b97a299e42a1725f0-20220407
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1761558759; Thu, 07 Apr 2022 22:09:15 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 7 Apr 2022 21:59:19 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 8 Apr 2022 12:59:12 +0800
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [PATCH V2 09/15] cpufreq: mediatek: Add .get function
Date: Fri, 8 Apr 2022 12:59:02 +0800
Message-ID: <20220408045908.21671-10-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_220927_993014_602C689C 
X-CRM114-Status: GOOD (  11.33  )
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
index 0be5609ee82e..9e9bce0ff235 100644
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
@@ -581,7 +590,7 @@ static struct cpufreq_driver mtk_cpufreq_driver = {
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
