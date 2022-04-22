Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C157C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 07:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YU0VLDsmbmDYc1nkT7EsNMa6boBqtlDVmzjg6REjgA=; b=JOo7b1XXcpvv4h
	WJLe3ebF/+/sneXm/6IH4adN+1Lppm3soPiZYURz9rfnhytgZqE4LHki/f9BnwTGy5fH1DzGIndHI
	v2NGwubShytFoYtaXuQkVreMov5UXUWvtW+hdRHiNO5k8N/eloH9zLtI4+xxbDxFWIWWNWohwE62d
	NvYYCv6RXYvfsoX65yQObcyXXW90S8TW3NEu2/dic5snh1wuvUPUm9KZrY7FKDkjvr0z4RnVsXi4f
	Q2+L3/AiA3Vq/1xa/viu/TWOtw7m9YuWZai0tkp8QSBxLcFrSgdCB00CV2P8gPFXjLVZD+K3WS+vL
	qUATQvl0yipXGAdMCpsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhoCM-00H3TD-5d; Fri, 22 Apr 2022 07:59:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhoAC-00H2PS-Qu; Fri, 22 Apr 2022 07:57:14 +0000
X-UUID: 0c4c53c9801447d8a4b4001634eba7d7-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:a7ba1611-792d-4e6b-b0f0-55f3d88c584b, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:4f77c1ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 0c4c53c9801447d8a4b4001634eba7d7-20220422
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 393723505; Fri, 22 Apr 2022 00:57:04 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 00:52:47 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 15:52:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 22 Apr 2022 15:52:44 +0800
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
Subject: [PATCH V4 04/14] cpufreq: mediatek: Record previous target vproc value
Date: Fri, 22 Apr 2022 15:52:29 +0800
Message-ID: <20220422075239.16437-5-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_005712_898772_B6BD3BD6 
X-CRM114-Status: GOOD (  12.48  )
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
 drivers/cpufreq/mediatek-cpufreq.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
index ff27f77e8ee6..1688cf68849c 100644
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
@@ -213,7 +220,12 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
 	inter_vproc = info->intermediate_voltage;
 
 	pre_freq_hz = clk_get_rate(cpu_clk);
-	pre_vproc = regulator_get_voltage(info->proc_reg);
+
+	if (unlikely(info->pre_vproc <= 0))
+		pre_vproc = regulator_get_voltage(info->proc_reg);
+	else
+		pre_vproc = info->pre_vproc;
+
 	if (pre_vproc < 0) {
 		dev_err(cpu_dev, "invalid Vproc value: %d\n", pre_vproc);
 		return pre_vproc;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
