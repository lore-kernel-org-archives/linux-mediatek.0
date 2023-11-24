Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2EEC61DF4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 22:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5eTBZeeW3B0oIKYsibzqp9oXL4xrHRnjIPMFNhgnF0=; b=igPOdDeFJMz/6KvltR1ZS+Qc0t
	7R9UcHzGv8nisK+Zx+/Oz7MT8ISNRUZA8681nWtLoy29ZiBZplyN8YgddFa7F6VGRedMJjwOehYFd
	+hj2EfOHSEZPUKp3MAbU7167yq5s2lGrafKs2yEg7Q1INTzDOb3bFZCdjA1RkoXNSAlDbowMmQlvr
	p6wbPfJKhU1aPq9VHBLpugorqrxMKAbn7Le1CcFnxJgUbzT47rxcUBhKEHwweSfwB/E0vJAktPUOX
	Pltl9EpWGE/jImAo2Z9aFgen2xosBXhNZxBiooDEmJCahj6/0TEVuhRSxyhG9KSM+BMpNFLAL2Syy
	TZA9pJpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6eZG-0087ub-0v;
	Fri, 24 Nov 2023 22:22:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6eYo-0087fC-2s;
	Fri, 24 Nov 2023 22:22:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AOMJOVA032368;
	Fri, 24 Nov 2023 22:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=b5eTBZeeW3B0oIKYsibzqp9oXL4xrHRnjIPMFNhgnF0=;
 b=mxK/2EdjjVnrmjFpyttUkIAzFH6685VIp//oIOpM3MTuQV/vi4ldmtkBhd19UMXOOF8Q
 6g5ORooFeJCNSKZa0PbA2h7XWG8pT2JRMWfLWP9Qr4nssAIOrSyliKcoIgO2NzUNpuu1
 86cK5qj+YepaN+nyGspdarozNzE+Tn8Bh0lIsyBy0qMu/+VU5xROmBdXn9bKnbzRuvRR
 BHwr8hc2LJPAB9BoaSVWLnUvAGsY7Ei1rssFeW0v7SK8cbO5TN0EA3nkcyYdR06mBQ0d
 MHI736zOdlAfumZxsLpeyzL3SgWhmw1KpTrumHvtGlqt4IlDIjnRYQes05j3MIqzqJ9w dg== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uj6emusg9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 22:21:55 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AOMLsMQ016882
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 22:21:54 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 24 Nov 2023 14:21:45 -0800
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <mathieu.poirier@linaro.org>, <vigneshr@ti.com>, <nm@ti.com>,
        <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>,
        Mukesh Ojha <quic_mojha@quicinc.com>
Subject: [Patch v6 12/12] soc: qcom: register ramoops region with APSS minidump
Date: Sat, 25 Nov 2023 03:49:55 +0530
Message-ID: <1700864395-1479-13-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1700864395-1479-1-git-send-email-quic_mojha@quicinc.com>
References: <1700864395-1479-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XhP7UB1QriAxNqtp8DRhI6TdM9sUSISM
X-Proofpoint-GUID: XhP7UB1QriAxNqtp8DRhI6TdM9sUSISM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-24_09,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 phishscore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311240174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_142206_954202_60E53650 
X-CRM114-Status: GOOD (  19.50  )
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

Register ramoops region with APSS minidump so that
these region gets captured on system crash.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/soc/qcom/qcom_minidump.c | 62 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/soc/qcom/qcom_minidump.c b/drivers/soc/qcom/qcom_minidump.c
index c0f76a51d0e8..9a39b68903fb 100644
--- a/drivers/soc/qcom/qcom_minidump.c
+++ b/drivers/soc/qcom/qcom_minidump.c
@@ -18,8 +18,10 @@
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/printk.h>
+#include <linux/pstore_ram.h>
 #include <linux/soc/qcom/smem.h>
 #include <linux/string.h>
+#include <linux/workqueue.h>
 #include <soc/qcom/qcom_minidump.h>
 
 #include "qcom_minidump_internal.h"
@@ -56,12 +58,20 @@ struct minidump_elfhdr {
  * @dev: Minidump backend device
  * @apss_data: APSS driver data
  * @md_lock: Lock to protect access to APSS minidump table
+ * @work: Minidump work for any required execution in process context.
  */
 struct minidump {
 	struct minidump_elfhdr	 elf;
 	struct device		 *dev;
 	struct minidump_ss_data	 *apss_data;
 	struct mutex		 md_lock;
+	struct work_struct	 work;
+};
+
+static LIST_HEAD(apss_md_rlist);
+struct md_region_list {
+	struct qcom_minidump_region md_region;
+	struct list_head list;
 };
 
 /*
@@ -530,6 +540,52 @@ static int qcom_apss_md_table_init(struct minidump *md,
 	return 0;
 }
 
+static int ramoops_region_md_register(const char *name, int id, void *vaddr,
+				      phys_addr_t paddr, size_t size)
+{
+	struct qcom_minidump_region *md_region;
+	struct md_region_list *mdr_list;
+	int ret;
+
+	mdr_list = kzalloc(sizeof(*mdr_list), GFP_KERNEL);
+	if (!mdr_list)
+		return -ENOMEM;
+
+	md_region = &mdr_list->md_region;
+	scnprintf(md_region->name, sizeof(md_region->name), "K%s%d", name, id);
+	md_region->virt_addr = vaddr;
+	md_region->phys_addr = paddr;
+	md_region->size = size;
+	ret = qcom_minidump_region_register(md_region);
+	if (ret < 0) {
+		pr_err("failed to register region in minidump: err: %d\n", ret);
+		return ret;
+	}
+
+	list_add(&mdr_list->list, &apss_md_rlist);
+
+	return 0;
+}
+
+static void ramoops_register_md_callback(struct work_struct *work)
+{
+	register_ramoops_ready_notifier(ramoops_region_md_register);
+}
+
+static void qcom_ramoops_minidump_unregister(void)
+{
+	struct md_region_list *mdr_list;
+	struct md_region_list *tmp;
+
+	list_for_each_entry_safe(mdr_list, tmp, &apss_md_rlist, list) {
+		struct qcom_minidump_region *region;
+
+		region = &mdr_list->md_region;
+		qcom_minidump_region_unregister(region);
+		list_del(&mdr_list->list);
+	}
+}
+
 static void qcom_apss_md_table_exit(struct minidump_ss_data *mdss_data)
 {
 	memset(mdss_data->md_ss_toc, cpu_to_le32(0), sizeof(*mdss_data->md_ss_toc));
@@ -575,6 +631,9 @@ static int qcom_apss_minidump_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, md);
 
+	INIT_WORK(&md->work, ramoops_register_md_callback);
+	schedule_work(&md->work);
+
 	return ret;
 }
 
@@ -582,6 +641,9 @@ static void qcom_apss_minidump_remove(struct platform_device *pdev)
 {
 	struct minidump *md = platform_get_drvdata(pdev);
 
+	flush_work(&md->work);
+	qcom_ramoops_minidump_unregister();
+	unregister_ramoops_ready_notifier(ramoops_region_md_register);
 	qcom_apss_md_table_exit(md->apss_data);
 }
 
-- 
2.7.4


