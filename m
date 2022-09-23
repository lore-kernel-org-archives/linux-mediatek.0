Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A5FECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 01:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5OWmThHHnYoTaTCl1UR7vmMwMGcWtV88d+2WlOlCiBg=; b=lBlst9zvBX4/PfSPCi30N0k3hA
	7WYFYvouHoZHbDd/7BvB1GeBrMasDfBz6pbHc9yNQ257Jsp16qbUhpV96hq+lakPPEHzMEiY8FVSd
	Lr0O0PUQdgCdY863e3hVzdqfdS9YK6ywn+1LoYDFAwprvjGNvGDfecZ65HqckjbSyd5PA/dKQIBnd
	Dbcp4A0pva8jKjaoUEYupiGev5AmaPe0Cxvl78/B8yrJyjy5bCGz0sm6aGIZwj2kcTNczFVMw44Dp
	4iAYmwkyDr5GkXhMQB7agdGyP9gf0YBGUIz2nB8DN3fCm3E1Nm6Jl+uii2zKPvlLSzSxEfS+6KXkz
	5n+ntxuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obXEJ-000v6B-2y; Fri, 23 Sep 2022 01:11:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obX9y-000tKz-Gf; Fri, 23 Sep 2022 01:07:20 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28N0elte004877;
	Fri, 23 Sep 2022 01:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=5OWmThHHnYoTaTCl1UR7vmMwMGcWtV88d+2WlOlCiBg=;
 b=mxckLb82gzQwLn4/ZwgnTU1RNIlWd4ooYLXBWu2mksd40wrvdKXjMTepEXqczPtA/RJZ
 IzaJrfTHLcJ0msjDbeKa5Cqobi9dBmToDEk/oT2ot+r2n8g6jShIRxRHkVzQoMkPqpJW
 j5gHkM2Y26eBK0TiNTw7cOHrPiYgYTlct9rc629AL+/empPx2VAr+k5E5QQMY6aYaMMg
 CGwAnXTBwRX9abSIoXOZObmisiywp4F0e7tLI8okHEGpqGbTOBcfTOyBfi7GGchtM659
 LiIPxdlvLH8JbJ19Bo+TvTjhjK0COyOnGu0zbZh3jikXvnPI1qRI4M+Nw07ALKJbqlc5 Mw== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jrmnf2e39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 01:07:10 +0000
Received: from nasanex01a.na.qualcomm.com (corens_vlan604_snip.qualcomm.com [10.53.140.1])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28N179RZ031963
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 01:07:09 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 22 Sep 2022 18:07:09 -0700
From: Asutosh Das <quic_asutoshd@quicinc.com>
To: <mani@kernel.org>, <quic_nguyenb@quicinc.com>, <quic_xiaosenh@quicinc.com>,
        <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>,
        <quic_rampraka@quicinc.com>, <quic_richardp@quicinc.com>,
        <stanley.chu@mediatek.com>, <adrian.hunter@intel.com>,
        <bvanassche@acm.org>, <avri.altman@wdc.com>, <beanhuo@micron.com>,
        <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, Asutosh Das <quic_asutoshd@quicinc.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
	<jejb@linux.ibm.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Jinyoung Choi
	<j-young.choi@samsung.com>,
        Kiwoong Kim <kwmad.kim@samsung.com>,
        open list
	<linux-kernel@vger.kernel.org>,
        "open list:ARM/QUALCOMM SUPPORT"
	<linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 06/16] ufs: core: mcq: Calculate queue depth
Date: Thu, 22 Sep 2022 18:05:13 -0700
Message-ID: <e0a5115eac57ee19df10bae2e3411cbbc7943303.1663894792.git.quic_asutoshd@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1663894792.git.quic_asutoshd@quicinc.com>
References: <cover.1663894792.git.quic_asutoshd@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: liOHV4KPoDfl8OKmEtqpaIcjrVY7OODS
X-Proofpoint-ORIG-GUID: liOHV4KPoDfl8OKmEtqpaIcjrVY7OODS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_16,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 adultscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209230005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_180718_628590_4610F19B 
X-CRM114-Status: GOOD (  28.94  )
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

The ufs device defines the supported queuedepth by
bqueuedepth which has a max value of 256.
The HC defines MAC (Max Active Commands) that define
the max number of commands that in flight to the ufs
device.
Calculate and configure the nutrs based on both these
values.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
---
 drivers/ufs/core/ufs-mcq.c     | 34 ++++++++++++++++++++++++++++++++++
 drivers/ufs/core/ufshcd-priv.h |  9 +++++++++
 drivers/ufs/core/ufshcd.c      | 10 ++++++++--
 drivers/ufs/host/ufs-qcom.c    |  8 ++++++++
 include/ufs/ufs.h              |  2 ++
 include/ufs/ufshcd.h           |  2 ++
 include/ufs/ufshci.h           |  1 +
 7 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/drivers/ufs/core/ufs-mcq.c b/drivers/ufs/core/ufs-mcq.c
index e5cc7ab..e52066e 100644
--- a/drivers/ufs/core/ufs-mcq.c
+++ b/drivers/ufs/core/ufs-mcq.c
@@ -17,6 +17,8 @@
 #define UFS_MCQ_MIN_READ_QUEUES 0
 #define UFS_MCQ_MIN_POLL_QUEUES 0
 
+#define MCQ_CFG_MAC_OFFSET	8
+#define MCQ_CFG_MAC_MASK	UFS_MASK(0x1ff, MCQ_CFG_MAC_OFFSET)
 #define MCQ_QCFGPTR_MASK	GENMASK(7, 0)
 #define MCQ_QCFGPTR_UNIT	0x200
 #define MCQ_SQATTR_OFFSET(c) \
@@ -107,6 +109,38 @@ static const struct ufshcd_res_info_t ufshcd_res_info[RES_MAX] = {
 	{.name = "mcq_vs", .resource = NULL, .base = NULL},
 };
 
+/**
+ * ufshcd_mcq_decide_queue_depth - decide the queue depth
+ * @hba - per adapter instance
+ *
+ * MAC - Max. Active Command of the Host Controller (HC)
+ * HC wouldn't send more than this commands to the device.
+ * The default MAC is 32, but the max. value may vary with
+ * vendor implementation.
+ * Calculates and adjusts the queue depth based on the depth
+ * supported by the HC and ufs device.
+ */
+u32 ufshcd_mcq_decide_queue_depth(struct ufs_hba *hba)
+{
+	u32 qd, val;
+	int mac;
+
+	mac = ufshcd_mcq_vops_get_hba_mac(hba);
+	if (mac < 0) {
+		val = ufshcd_readl(hba, REG_UFS_MCQ_CFG);
+		mac = (val & MCQ_CFG_MAC_MASK) >> MCQ_CFG_MAC_OFFSET;
+	}
+
+	/*  MAC is a 0 based value. */
+	mac += 1;
+	/* max. value of bqueuedepth = 256, mac is host dependent */
+	qd = min_t(u32, mac, hba->dev_info.bqueuedepth);
+	if (!qd)
+		qd = mac;
+
+	return qd;
+}
+
 static int ufshcd_mcq_config_resource(struct ufs_hba *hba)
 {
 	struct platform_device *pdev = to_platform_device(hba->dev);
diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index cf6bdd8e..6d16beb 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -51,6 +51,7 @@ int ufshcd_query_flag(struct ufs_hba *hba, enum query_opcode opcode,
 	enum flag_idn idn, u8 index, bool *flag_res);
 void ufshcd_auto_hibern8_update(struct ufs_hba *hba, u32 ahit);
 int ufshcd_mcq_init(struct ufs_hba *hba);
+u32 ufshcd_mcq_decide_queue_depth(struct ufs_hba *hba);
 
 #define SD_ASCII_STD true
 #define SD_RAW false
@@ -216,6 +217,14 @@ static inline void ufshcd_vops_config_scaling_param(struct ufs_hba *hba,
 		hba->vops->config_scaling_param(hba, p, data);
 }
 
+static inline int ufshcd_mcq_vops_get_hba_mac(struct ufs_hba *hba)
+{
+	if (hba->vops && hba->vops->get_hba_mac)
+		return hba->vops->get_hba_mac(hba);
+
+	return -EOPNOTSUPP;
+}
+
 extern const struct ufs_pm_lvl_states ufs_pm_lvl_states[];
 
 /**
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index f4bb402..a71b57e 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -7759,6 +7759,7 @@ static int ufs_get_device_desc(struct ufs_hba *hba)
 	/* getting Specification Version in big endian format */
 	dev_info->wspecversion = desc_buf[DEVICE_DESC_PARAM_SPEC_VER] << 8 |
 				      desc_buf[DEVICE_DESC_PARAM_SPEC_VER + 1];
+	dev_info->bqueuedepth = desc_buf[DEVICE_DESC_PARAM_Q_DPTH];
 	b_ufs_feature_sup = desc_buf[DEVICE_DESC_PARAM_UFS_FEAT];
 
 	model_index = desc_buf[DEVICE_DESC_PARAM_PRDCT_NAME];
@@ -8175,10 +8176,15 @@ static int ufshcd_add_lus(struct ufs_hba *hba)
 static int ufshcd_config_mcq(struct ufs_hba *hba)
 {
 	int ret;
+	int old_nutrs = hba->nutrs;
 
+	hba->nutrs = ufshcd_mcq_decide_queue_depth(hba);
 	ret = ufshcd_mcq_init(hba);
-
-	return ret;
+	if (ret) {
+		hba->nutrs = old_nutrs;
+		return ret;
+	}
+	return 0;
 }
 
 /**
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 473fad8..643a915 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -25,6 +25,7 @@
 #define UFS_QCOM_DEFAULT_DBG_PRINT_EN	\
 	(UFS_QCOM_DBG_PRINT_REGS_EN | UFS_QCOM_DBG_PRINT_TEST_BUS_EN)
 
+#define	MAX_SUPP_MAC	63
 enum {
 	TSTBUS_UAWM,
 	TSTBUS_UARM,
@@ -1424,6 +1425,12 @@ static void ufs_qcom_config_scaling_param(struct ufs_hba *hba,
 }
 #endif
 
+static int ufs_qcom_get_hba_mac(struct ufs_hba *hba)
+{
+	/* Default is 32, but Qualcomm HC supports upto 64 */
+	return MAX_SUPP_MAC;
+}
+
 /*
  * struct ufs_hba_qcom_vops - UFS QCOM specific variant operations
  *
@@ -1447,6 +1454,7 @@ static const struct ufs_hba_variant_ops ufs_hba_qcom_vops = {
 	.device_reset		= ufs_qcom_device_reset,
 	.config_scaling_param = ufs_qcom_config_scaling_param,
 	.program_key		= ufs_qcom_ice_program_key,
+	.get_hba_mac		= ufs_qcom_get_hba_mac,
 };
 
 /**
diff --git a/include/ufs/ufs.h b/include/ufs/ufs.h
index ba2a1d8..5112418 100644
--- a/include/ufs/ufs.h
+++ b/include/ufs/ufs.h
@@ -591,6 +591,8 @@ struct ufs_dev_info {
 	u8	*model;
 	u16	wspecversion;
 	u32	clk_gating_wait_us;
+	/* Stores the depth of queue in UFS device */
+	u8	bqueuedepth;
 
 	/* UFS HPB related flag */
 	bool	hpb_enabled;
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 54d742a..630a0eb 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -293,6 +293,7 @@ struct ufs_pwr_mode_info {
  * @config_scaling_param: called to configure clock scaling parameters
  * @program_key: program or evict an inline encryption key
  * @event_notify: called to notify important events
+ * @get_hba_mac: called to get vendor specific mac value
  */
 struct ufs_hba_variant_ops {
 	const char *name;
@@ -331,6 +332,7 @@ struct ufs_hba_variant_ops {
 			       const union ufs_crypto_cfg_entry *cfg, int slot);
 	void	(*event_notify)(struct ufs_hba *hba,
 				enum ufs_event_type evt, void *data);
+	int	(*get_hba_mac)(struct ufs_hba *hba);
 };
 
 /* clock gating state  */
diff --git a/include/ufs/ufshci.h b/include/ufs/ufshci.h
index ef5c3a8..ca7db49d 100644
--- a/include/ufs/ufshci.h
+++ b/include/ufs/ufshci.h
@@ -57,6 +57,7 @@ enum {
 	REG_UFS_CCAP				= 0x100,
 	REG_UFS_CRYPTOCAP			= 0x104,
 
+	REG_UFS_MCQ_CFG				= 0x380,
 	UFSHCI_CRYPTO_REG_SPACE_SIZE		= 0x400,
 };
 
-- 
2.7.4


