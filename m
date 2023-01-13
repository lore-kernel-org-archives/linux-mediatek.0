Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D51C6379F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 20:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IguCUCHFRzxRVMmXqhh22XWGebEJSgkEF8LfIXngonA=; b=N2Sgi2BQ1OwcC7lQysfXDNocYW
	NJoM67c8mbZq3jwTFqtb1SZbRYLM3Bo9Jrut+2566ZcUMGyHUw0Yt9/3c0I/Zgm2YZGqKtHiArR1k
	w7dtEDdj+B539Xaf0hI6D13cDP9gB3zjegRbv4rFCCl02pynnHGtUpNNx+8kBCI3opzepd7Mr3y1g
	g2Buv3OObKE0L1etpPt/WfNpQhHiNZO0GvuBsYnsBiMP0VwX43YIsaGUaFeb8Cet/Tw93yd4GYvNm
	6MFhxHa7+RAzFVRrwVH7DzT9hZQ8lDhhNpA/5meHljQ6NsFQ6d/4+6gQRNTK4NrKlnZ5wGHesrAw0
	6GHBzfkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGR1q-004NZv-Sm; Fri, 13 Jan 2023 20:51:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGR1a-004NTB-EM; Fri, 13 Jan 2023 20:51:44 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30DKg277029509;
	Fri, 13 Jan 2023 20:51:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=IguCUCHFRzxRVMmXqhh22XWGebEJSgkEF8LfIXngonA=;
 b=EBTmDKpKR8asNsm42T8y8QymX2hnxuaE8o0ClwW8xh7G6yj8cMRO8svxdry6jaZE2W+W
 xgaBhcNgFEbVteOmk+mauu+lqU8NT9hOxwC1fG9QnQ0cD9xeBYOrQWacU+YHF37u40hR
 6uk2YMTVInIOm/zH2Jbf9sE4DQkKGaQWrwpCVe0Tq1wH4oSr64wPEEdY8CZDxV5zh7m3
 Ggv2YNoQBiSInfB0ipNdrLIJ/bgXegxNRf7oA/ts2ekjEA8MkfPreP0TlQMgxVvzqzaJ
 7Y3bvTrgoVys5LlzFUS1v9145ZAWSBZ+LZzue3TzMu/g450yBDy46QIaYPAOehYFM4Ga Gw== 
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n32wu9w4q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jan 2023 20:51:35 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 30DKpYJf022235
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Jan 2023 20:51:34 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 13 Jan 2023 12:51:34 -0800
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: <quic_cang@quicinc.com>, <martin.petersen@oracle.com>,
        <linux-scsi@vger.kernel.org>
CC: <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
        <stanley.chu@mediatek.com>, <adrian.hunter@intel.com>,
        <bvanassche@acm.org>, <avri.altman@wdc.com>, <mani@kernel.org>,
        <beanhuo@micron.com>, Asutosh Das
	<quic_asutoshd@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        Alim Akhtar
	<alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Andy
 Gross" <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konrad.dybcio@linaro.org>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        Arthur Simchaev <Arthur.Simchaev@wdc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        open list
	<linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v13 05/15] ufs: core: mcq: Configure resource regions
Date: Fri, 13 Jan 2023 12:48:42 -0800
Message-ID: <529ddae5bf34a4f2cb67d7e3d01760b0ddbbf2b6.1673557949.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1673557949.git.quic_asutoshd@quicinc.com>
References: <cover.1673557949.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Dnh9Wu2rsxo7VlWxhPu0DiGoiSDVAGUm
X-Proofpoint-ORIG-GUID: Dnh9Wu2rsxo7VlWxhPu0DiGoiSDVAGUm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_10,2023-01-13_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_125142_515280_59C9DDEA 
X-CRM114-Status: GOOD (  26.62  )
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

Define the mcq resources and add support to ioremap
the resource regions.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>
---
 drivers/ufs/core/ufs-mcq.c     |   3 ++
 drivers/ufs/core/ufshcd-priv.h |   8 ++++
 drivers/ufs/host/ufs-qcom.c    | 101 +++++++++++++++++++++++++++++++++++++++++
 include/ufs/ufshcd.h           |  30 ++++++++++++
 4 files changed, 142 insertions(+)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index 6ed3625..65c0037 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -119,6 +119,9 @@ int ufshcd_mcq_init(struct ufs_hba *hba)
 	int ret;
 
 	ret = ufshcd_mcq_config_nr_queues(hba);
+	if (ret)
+		return ret;
 
+	ret = ufshcd_vops_mcq_config_resource(hba);
 	return ret;
 }
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 8d93ef6..e3bc4ce 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -230,6 +230,14 @@ static inline void ufshcd_vops_reinit_notify(struct ufs_hba *hba)
 		hba->vops->reinit_notify(hba);
 }
 
+static inline int ufshcd_vops_mcq_config_resource(struct ufs_hba *hba)
+{
+	if (hba->vops && hba->vops->mcq_config_resource)
+		return hba->vops->mcq_config_resource(hba);
+
+	return -EOPNOTSUPP;
+}
+
 extern const struct ufs_pm_lvl_states ufs_pm_lvl_states[];
 
 /**
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 5e7ba3b..2a1434f 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -22,6 +22,12 @@
 #include <ufs/ufshci.h>
 #include <ufs/ufs_quirks.h>
 
+#define MCQ_QCFGPTR_MASK	GENMASK(7, 0)
+#define MCQ_QCFGPTR_UNIT	0x200
+#define MCQ_SQATTR_OFFSET(c) \
+	((((c) >> 16) & MCQ_QCFGPTR_MASK) * MCQ_QCFGPTR_UNIT)
+#define MCQ_QCFG_SIZE	0x40
+
 enum {
 	TSTBUS_UAWM,
 	TSTBUS_UARM,
@@ -1396,6 +1402,100 @@ static void ufs_qcom_reinit_notify(struct ufs_hba *hba)
 	phy_power_off(host->generic_phy);
 }
 
+/* Resources */
+static const struct ufshcd_res_info ufs_res_info[RES_MAX] = {
+	{.name = "ufs_mem",},
+	{.name = "mcq",},
+	/* Submission Queue DAO */
+	{.name = "mcq_sqd",},
+	/* Submission Queue Interrupt Status */
+	{.name = "mcq_sqis",},
+	/* Completion Queue DAO */
+	{.name = "mcq_cqd",},
+	/* Completion Queue Interrupt Status */
+	{.name = "mcq_cqis",},
+	/* MCQ vendor specific */
+	{.name = "mcq_vs",},
+};
+
+static int ufs_qcom_mcq_config_resource(struct ufs_hba *hba)
+{
+	struct platform_device *pdev = to_platform_device(hba->dev);
+	struct ufshcd_res_info *res;
+	struct resource *res_mem, *res_mcq;
+	int i, ret = 0;
+
+	memcpy(hba->res, ufs_res_info, sizeof(ufs_res_info));
+
+	for (i = 0; i < RES_MAX; i++) {
+		res = &hba->res[i];
+		res->resource = platform_get_resource_byname(pdev,
+							     IORESOURCE_MEM,
+							     res->name);
+		if (!res->resource) {
+			dev_info(hba->dev, "Resource %s not provided\n", res->name);
+			if (i == RES_UFS)
+				return -ENOMEM;
+			continue;
+		} else if (i == RES_UFS) {
+			res_mem = res->resource;
+			res->base = hba->mmio_base;
+			continue;
+		}
+
+		res->base = devm_ioremap_resource(hba->dev, res->resource);
+		if (IS_ERR(res->base)) {
+			dev_err(hba->dev, "Failed to map res %s, err=%d\n",
+					 res->name, (int)PTR_ERR(res->base));
+			res->base = NULL;
+			ret = PTR_ERR(res->base);
+			return ret;
+		}
+	}
+
+	/* MCQ resource provided in DT */
+	res = &hba->res[RES_MCQ];
+	/* Bail if MCQ resource is provided */
+	if (res->base)
+		goto out;
+
+	/* Explicitly allocate MCQ resource from ufs_mem */
+	res_mcq = devm_kzalloc(hba->dev, sizeof(*res_mcq), GFP_KERNEL);
+	if (!res_mcq)
+		return ret;
+
+	res_mcq->start = res_mem->start +
+			 MCQ_SQATTR_OFFSET(hba->mcq_capabilities);
+	res_mcq->end = res_mcq->start + hba->nr_hw_queues * MCQ_QCFG_SIZE - 1;
+	res_mcq->flags = res_mem->flags;
+	res_mcq->name = "mcq";
+
+	ret = insert_resource(&iomem_resource, res_mcq);
+	if (ret) {
+		dev_err(hba->dev, "Failed to insert MCQ resource, err=%d\n",
+			ret);
+		goto insert_res_err;
+	}
+
+	res->base = devm_ioremap_resource(hba->dev, res_mcq);
+	if (IS_ERR(res->base)) {
+		dev_err(hba->dev, "MCQ registers mapping failed, err=%d\n",
+			(int)PTR_ERR(res->base));
+		ret = PTR_ERR(res->base);
+		goto ioremap_err;
+	}
+
+out:
+	hba->mcq_base = res->base;
+	return 0;
+ioremap_err:
+	res->base = NULL;
+	remove_resource(res_mcq);
+insert_res_err:
+	devm_kfree(hba->dev, res_mcq);
+	return ret;
+}
+
 /*
  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
  *
@@ -1420,6 +1520,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.config_scaling_param = ufs_qcom_config_scaling_param,
 	.program_key		= ufs_qcom_ice_program_key,
 	.reinit_notify		= ufs_qcom_reinit_notify,
+	.mcq_config_resource	= ufs_qcom_mcq_config_resource,
 };
 
 /**
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 91ca724..81c7494 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -300,6 +300,7 @@ struct ufs_pwr_mode_info {
  * @program_key: program or evict an inline encryption key
  * @event_notify: called to notify important events
  * @reinit_notify: called to notify reinit of UFSHCD during max gear switch
+ * @mcq_config_resource: called to configure MCQ platform resources
  */
 struct ufs_hba_variant_ops {
 	const char *name;
@@ -339,6 +340,7 @@ struct ufs_hba_variant_ops {
 	void	(*event_notify)(struct ufs_hba *hba,
 				enum ufs_event_type evt, void *data);
 	void	(*reinit_notify)(struct ufs_hba *);
+	int	(*mcq_config_resource)(struct ufs_hba *hba);
 };
 
 /* clock gating state  */
@@ -734,6 +736,30 @@ struct ufs_hba_monitor {
 };
 
 /**
+ * struct ufshcd_res_info_t - MCQ related resource regions
+ *
+ * @name: resource name
+ * @resource: pointer to resource region
+ * @base: register base address
+ */
+struct ufshcd_res_info {
+	const char *name;
+	struct resource *resource;
+	void __iomem *base;
+};
+
+enum ufshcd_res {
+	RES_UFS,
+	RES_MCQ,
+	RES_MCQ_SQD,
+	RES_MCQ_SQIS,
+	RES_MCQ_CQD,
+	RES_MCQ_CQIS,
+	RES_MCQ_VS,
+	RES_MAX,
+};
+
+/**
  * struct ufs_hba - per adapter private structure
  * @mmio_base: UFSHCI base register address
  * @ucdl_base_addr: UFS Command Descriptor base address
@@ -846,6 +872,8 @@ struct ufs_hba_monitor {
  *	ufshcd_resume_complete()
  * @ext_iid_sup: is EXT_IID is supported by UFSHC
  * @mcq_sup: is mcq supported by UFSHC
+ * @res: array of resource info of MCQ registers
+ * @mcq_base: Multi circular queue registers base address
  */
 struct ufs_hba {
 	void __iomem *mmio_base;
@@ -1002,6 +1030,8 @@ struct ufs_hba {
 	bool ext_iid_sup;
 	bool scsi_host_added;
 	bool mcq_sup;
+	struct ufshcd_res_info res[RES_MAX];
+	void __iomem *mcq_base;
 };
 
 #ifdef CONFIG_SCSI_UFS_VARIABLE_SG_ENTRY_SIZE
-- 
2.7.4


