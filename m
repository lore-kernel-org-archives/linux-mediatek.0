Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7A1EEE57DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Sep 2023 10:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tz8rKdVo2TshdvaxQGBb5GEOXGLShJh7mmZE7uPCmnA=; b=bWH69bmBEV/aye/cdGZVM5Ef6i
	xEE6jt0n9I34ZiPm/G/4fbb32qagz27hh9OPPRD595SUAKMyD7zZbQ3hKAodPpjFaaHboUFQH1T5i
	g3nArm5rXJuPxQVDsF9LtyjWbEdJpvIXckdX3LHoQZeROCT+nMuT9swm1EUHF4e0SdFGpwaFOgUf/
	+0uUAHwIZ5Plh9slkyevN6tJ0GdFkUXHYKyGlNiwLYTlv5bOLk7tdcs20v5GFrKVbkHpVfEHX9jUs
	/WzJ4f9Yfl8OaRJh49mx3SuGfIA8EhuKn/xSO8hcOPLtDZ0OK/MsuE7PjeB47PjnyFGtfpA0koPyN
	6wJWMPJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeb2-000Jqh-2S;
	Mon, 11 Sep 2023 10:56:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfeat-000Jk1-1z;
	Mon, 11 Sep 2023 10:56:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38BAfZvh020901;
	Mon, 11 Sep 2023 10:56:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=tz8rKdVo2TshdvaxQGBb5GEOXGLShJh7mmZE7uPCmnA=;
 b=dgyBpGDzCCjhyp1QzhTJnh+KHQ0iaRJSKBLN0ugMzV7AJ5eF1lL32RVOz422QphpOjSW
 1kUExDz5mjCAeKr4OvBjIPTNLbcuFW+gF9ihol/nPNo8m+duJCG4bf2P6R3cMhB5uuUE
 +L7jAXCp7ID48jgAL3j7FzmdFTcRmgVk4byfYNdT9K3GW7+LK+gCIeMrKJCtotx1HPRv
 xkNXYH/Q69dnWYucpGHzXjfWpiCOfmtjmfW48y6q0wmGcqP6XP751HlQ6stfpY8MhZ40
 Itawazlw24eAc1yPlqZ0NEk0AQb9IjqUNI4pM1vEMRBE+KgTRiFPLuHPPcrMXoGfWD4k vw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t1whx8mkp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 10:56:13 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BAuCVq006051
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 10:56:12 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 11 Sep 2023 03:55:10 -0700
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <corbet@lwn.net>, <agross@kernel.org>, <andersson@kernel.org>,
        <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <keescook@chromium.org>, <tony.luck@intel.com>, <gpiccoli@igalia.com>,
        <mathieu.poirier@linaro.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>, <linus.walleij@linaro.org>,
        <andy.shevchenko@gmail.com>, <vigneshr@ti.com>, <nm@ti.com>,
        <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>,
        <quic_tsoni@quicinc.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_mojha@quicinc.com>
Subject: [REBASE PATCH v5 07/17] soc: qcom: minidump: Add pending region registration
Date: Mon, 11 Sep 2023 16:23:49 +0530
Message-ID: <1694429639-21484-8-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
References: <1694429639-21484-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CAjt0WKIBtWJDk56gxZfH8CjV2n3Yoo_
X-Proofpoint-ORIG-GUID: CAjt0WKIBtWJDk56gxZfH8CjV2n3Yoo_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_035639_688207_DC1AAD52 
X-CRM114-Status: GOOD (  24.22  )
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

Pending regions are those apss minidump regions which came for
registration before minidump was initialized or ready to do
register the region.

We can add regions to pending region list and register all of
them from apss minidump driver probe in one go.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 drivers/soc/qcom/qcom_minidump.c | 140 ++++++++++++++++++++++++++++++++++++---
 1 file changed, 130 insertions(+), 10 deletions(-)

diff --git a/drivers/soc/qcom/qcom_minidump.c b/drivers/soc/qcom/qcom_minidump.c
index 86f4d09a7b4e..4ce36f154e89 100644
--- a/drivers/soc/qcom/qcom_minidump.c
+++ b/drivers/soc/qcom/qcom_minidump.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -63,6 +64,33 @@ struct minidump {
 	struct mutex			md_lock;
 };
 
+/**
+ * struct minidump_pregion - Minidump pending region
+ * @list       : Pending region list pointer
+ * @region     : APSS minidump client region
+ */
+struct minidump_pregion {
+	struct list_head	     list;
+	struct qcom_minidump_region  region;
+};
+
+/**
+ * struct minidump_plist - Minidump pending region list
+ * @plist	: List of pending region to be registered
+ * @pregion_cnt	: Count of the pending region to be registered
+ */
+struct minidump_plist {
+	struct list_head  plist;
+	int 		  pregion_cnt;
+	struct mutex	  plock;
+};
+
+static struct minidump_plist md_plist = {
+	.plist = LIST_HEAD_INIT(md_plist.plist),
+	.pregion_cnt = 0,
+	.plock = __MUTEX_INITIALIZER(md_plist.plock),
+};
+
 /*
  * In some of the Old Qualcomm devices, boot firmware statically allocates 300
  * as total number of supported region (including all co-processors) in
@@ -336,6 +364,26 @@ static bool qcom_minidump_valid_region(const struct qcom_minidump_region *region
 		IS_ALIGNED(region->size, 4);
 }
 
+static struct minidump_pregion *
+check_region_in_plist(const struct qcom_minidump_region *region)
+{
+	struct minidump_pregion *md_pregion;
+	struct minidump_pregion *tmp;
+	bool found = false;
+
+	list_for_each_entry_safe(md_pregion, tmp, &md_plist.plist, list) {
+		struct qcom_minidump_region *md_region;
+
+		md_region = &md_pregion->region;
+		if (!strcmp(md_region->name, region->name)) {
+			found = true;
+			break;
+		}
+	}
+
+	return found ? md_pregion : NULL;
+}
+
 /**
  * qcom_minidump_region_register() - Register region in APSS Minidump table.
  * @region: minidump region.
@@ -344,16 +392,44 @@ static bool qcom_minidump_valid_region(const struct qcom_minidump_region *region
  */
 int qcom_minidump_region_register(const struct qcom_minidump_region *region)
 {
+	struct minidump_pregion *md_pregion;
 	struct minidump *md;
-	int ret;
-
-	md = qcom_smem_minidump_ready();
-	if (!md)
-		return -EPROBE_DEFER;
+	int ret = 0;
 
 	if (!qcom_minidump_valid_region(region))
 		return -EINVAL;
 
+	mutex_lock(&md_plist.plock);
+	md = qcom_smem_minidump_ready();
+	if (!md) {
+		if (md_plist.pregion_cnt >= MAX_NUM_ENTRIES - 1) {
+			pr_err("maximum region limit %u reached\n", md_plist.pregion_cnt);
+			ret = -ENOSPC;
+			goto unlock_plock;
+		}
+
+		md_pregion = check_region_in_plist(region);
+		if (md_pregion) {
+			pr_info("%s region is already exist\n", region->name);
+			ret = -EEXIST;
+			goto unlock_plock;
+		}
+		/*
+		 * Maintain a list of client regions which came before
+		 * minidump driver was ready and once it is ready,
+		 * register them in one go from minidump probe function.
+		 */
+		md_pregion = kzalloc(sizeof(*md_pregion), GFP_KERNEL);
+		if (!md_pregion) {
+			ret = -ENOMEM;
+			goto unlock_plock;
+		}
+		md_pregion->region = *region;
+		list_add_tail(&md_pregion->list, &md_plist.plist);
+		md_plist.pregion_cnt++;
+		goto unlock_plock;
+	}
+
 	mutex_lock(&md->md_lock);
 	ret = qcom_md_region_register(md, region);
 	if (ret)
@@ -362,6 +438,10 @@ int qcom_minidump_region_register(const struct qcom_minidump_region *region)
 	qcom_md_update_elfheader(md, region);
 unlock:
 	mutex_unlock(&md->md_lock);
+	return 0;
+
+unlock_plock:
+	mutex_unlock(&md_plist.plock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_minidump_region_register);
@@ -374,16 +454,28 @@ EXPORT_SYMBOL_GPL(qcom_minidump_region_register);
  */
 int qcom_minidump_region_unregister(const struct qcom_minidump_region *region)
 {
+	struct minidump_pregion *md_pregion;
 	struct minidump *md;
-	int ret;
-
-	md = qcom_smem_minidump_ready();
-	if (!md)
-		return -EPROBE_DEFER;
+	int ret = 0;
 
 	if (!qcom_minidump_valid_region(region))
 		return -EINVAL;
 
+	mutex_lock(&md_plist.plock);
+	md = qcom_smem_minidump_ready();
+	if (!md) {
+		md_pregion = check_region_in_plist(region);
+		if (!md_pregion) {
+			ret = -ENOENT;
+			goto unlock_plock;
+		}
+
+		list_del(&md_pregion->list);
+		kfree(md_pregion);
+		md_plist.pregion_cnt--;
+		goto unlock_plock;
+	}
+
 	mutex_lock(&md->md_lock);
 	ret = qcom_md_region_unregister(md, region);
 	if (ret)
@@ -393,6 +485,10 @@ int qcom_minidump_region_unregister(const struct qcom_minidump_region *region)
 unlock:
 	mutex_unlock(&md->md_lock);
 	return ret;
+
+unlock_plock:
+	mutex_unlock(&md_plist.plock);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(qcom_minidump_region_unregister);
 
@@ -532,6 +628,27 @@ static int qcom_apss_md_table_init(struct minidump *md,
 	return 0;
 }
 
+void qcom_apss_register_pending_regions(struct minidump *md)
+{
+	struct minidump_ss_data *mdss_data = md->apss_data;
+	struct minidump_pregion *md_pregion;
+	struct minidump_pregion *tmp;
+
+	list_for_each_entry_safe(md_pregion, tmp, &md_plist.plist, list) {
+		struct qcom_minidump_region *region;
+
+		region = &md_pregion->region;
+		mutex_lock(&md->md_lock);
+		qcom_md_add_region(mdss_data, region);
+		qcom_md_update_elfheader(md, region);
+		mutex_unlock(&md->md_lock);
+
+		list_del(&md_pregion->list);
+		kfree(md_pregion);
+		md_plist.pregion_cnt--;
+	}
+}
+
 static int qcom_apss_minidump_probe(struct platform_device *pdev)
 {
 	struct minidump_global_toc *mdgtoc;
@@ -571,7 +688,10 @@ static int qcom_apss_minidump_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	mutex_lock(&md_plist.plock);
 	platform_set_drvdata(pdev, md);
+	qcom_apss_register_pending_regions(md);
+	mutex_unlock(&md_plist.plock);
 
 	return ret;
 }
-- 
2.7.4


