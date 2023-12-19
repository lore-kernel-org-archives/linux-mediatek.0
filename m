Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63061C46CCD
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Dec 2023 12:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=joXe0JDjE0yH/MFEqasL/tzU5VgyYOAlp0Y+wuUKFpw=; b=lpF7ANtsZY3NN/EaKb8w1miQfS
	THHGPo8cMSV+ZR7aE+Tw60TzWuJ4sibJNN3nwvpguSkdtPyC10mytSIOdiZUgfdpcJsfKlk+/KBhU
	ossXajpHEJjPSa/hPSUY/FRbWlM4XCIOcbjX3zxe9O6+JdEvraHiUj8vaFlMgcNVz3bBtUtQB9/1E
	xEcuCmTCh6jtqNBphi5ozUN3xFzqgZvcmFDnqhC+1LBH423hqWKsVLh+Onvw6hsGod8DwG0crMCTC
	lUN8E3UrsjlQPDRpkxlk6LP7xF2CJb0KokCPKZqaxZCCqav8RSuTnJL1oPhMmFxzIJWd8161lP+gk
	5sMAqaGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZMH-00E2he-17;
	Tue, 19 Dec 2023 12:38:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZME-00E2gM-16;
	Tue, 19 Dec 2023 12:38:00 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BJAgXDl022689;
	Tue, 19 Dec 2023 12:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=joXe0JDjE0yH/MFEqasL
	/tzU5VgyYOAlp0Y+wuUKFpw=; b=HatCoCl75zgoADTzmCc9sgR+EOckaZDwGMyT
	2znsbUjfqqNmgMFe7I+mL40ocoHUA346KzEwJ0uMGStmEHGtqeCnGbtGTF160X2F
	XSUgjpj2hTDTR1nuq7YznzJTHqloNF/Bfell+7iQJEdzq+lQaXLB/Fu0EutQORbV
	z8rPsIbG2fMI62nvIfsLyTDqgOIxR99lENBiAjXv5ZjC/5op0o0DUsKErF5CHAfj
	aWtyNMcTPhTbvirNpA98EnkijwNPKNRVadMdUhcZ2RdzVoOmEmbvFunjG/4uJt1f
	vqsRkUyJPjMMU4ICxffJuDfBcEv2SAv7SpFgJSTvYCVVic6LSw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v39n8r9ke-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Dec 2023 12:37:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BJCbofD001935
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Dec 2023 12:37:50 GMT
Received: from hu-mnaresh-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 19 Dec 2023 04:37:45 -0800
From: Maramaina Naresh <quic_mnaresh@quicinc.com>
To: "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen"
	<martin.petersen@oracle.com>,
        Peter Wang <peter.wang@mediatek.com>,
        "Matthias
 Brugger" <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Alim Akhtar <alim.akhtar@samsung.com>, Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Stanley Jhu <chu.stanley@gmail.com>, <linux-scsi@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_cang@quicinc.com>,
        <quic_nguyenb@quicinc.com>
Subject: [PATCH V6 1/2] ufs: core: Add CPU latency QoS support for ufs driver
Date: Tue, 19 Dec 2023 18:07:05 +0530
Message-ID: <20231219123706.6463-2-quic_mnaresh@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231219123706.6463-1-quic_mnaresh@quicinc.com>
References: <20231219123706.6463-1-quic_mnaresh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: cQNRuKaTjSKtyKMymHVx95J2IOs-C2T8
X-Proofpoint-GUID: cQNRuKaTjSKtyKMymHVx95J2IOs-C2T8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 suspectscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0
 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2312190094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_043758_414424_20DE8E25 
X-CRM114-Status: GOOD (  22.96  )
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

Register ufs driver to CPU latency PM QoS framework to improve
ufs device random io performance.

PM QoS initialization will insert new QoS request into the CPU
latency QoS list with the maximum latency PM_QOS_DEFAULT_VALUE
value.

UFS driver will vote for performance mode on scale up and power
save mode for scale down.

If clock scaling feature is not enabled then voting will be based
on clock on or off condition.

Provided sysfs interface to enable/disable PM QoS feature.

tiotest benchmark tool io performance results on sm8550 platform:

1. Without PM QoS support
	Type (Speed in)    | Average of 18 iterations
	Random Write(IPOS) | 41065.13
	Random Read(IPOS)  | 37101.3

2. With PM QoS support
	Type (Speed in)    | Average of 18 iterations
	Random Write(IPOS) | 46784.9
	Random Read(IPOS)  | 42943.4
(Improvement with PM QoS = ~15%).

Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Co-developed-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
Signed-off-by: Naveen Kumar Goud Arepalli <quic_narepall@quicinc.com>
Signed-off-by: Maramaina Naresh <quic_mnaresh@quicinc.com>
---
 drivers/ufs/core/ufs-sysfs.c | 49 +++++++++++++++++++++++++++++++++++
 drivers/ufs/core/ufshcd.c    | 50 ++++++++++++++++++++++++++++++++++++
 include/ufs/ufshcd.h         |  6 +++++
 3 files changed, 105 insertions(+)

diff --git a/drivers/ufs/core/ufs-sysfs.c b/drivers/ufs/core/ufs-sysfs.c
index e6d12289e017..3d049967f6bc 100644
--- a/drivers/ufs/core/ufs-sysfs.c
+++ b/drivers/ufs/core/ufs-sysfs.c
@@ -405,6 +405,53 @@ static ssize_t wb_flush_threshold_store(struct device *dev,
 	return count;
 }
 
+/**
+ * pm_qos_enable_show - sysfs handler to show pm qos enable value
+ * @dev: device associated with the UFS controller
+ * @attr: sysfs attribute handle
+ * @buf: buffer for sysfs file
+ *
+ * Print 1 if PM QoS feature is enabled, 0 if disabled.
+ *
+ * Returns number of characters written to @buf.
+ */
+static ssize_t pm_qos_enable_show(struct device *dev,
+		struct device_attribute *attr, char *buf)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", hba->pm_qos_enabled);
+}
+
+/**
+ * pm_qos_enable_store - sysfs handler to store value
+ * @dev: device associated with the UFS controller
+ * @attr: sysfs attribute handle
+ * @buf: buffer for sysfs file
+ * @count: stores buffer characters count
+ *
+ * Input 0 to disable PM QoS and 1 value to enable.
+ * Default state: 1
+ *
+ * Return: number of characters written to @buf on success, < 0 upon failure.
+ */
+static ssize_t pm_qos_enable_store(struct device *dev,
+		struct device_attribute *attr, const char *buf, size_t count)
+{
+	struct ufs_hba *hba = dev_get_drvdata(dev);
+	bool value;
+
+	if (kstrtobool(buf, &value))
+		return -EINVAL;
+
+	if (value)
+		ufshcd_pm_qos_init(hba);
+	else
+		ufshcd_pm_qos_exit(hba);
+
+	return count;
+}
+
 static DEVICE_ATTR_RW(rpm_lvl);
 static DEVICE_ATTR_RO(rpm_target_dev_state);
 static DEVICE_ATTR_RO(rpm_target_link_state);
@@ -416,6 +463,7 @@ static DEVICE_ATTR_RW(wb_on);
 static DEVICE_ATTR_RW(enable_wb_buf_flush);
 static DEVICE_ATTR_RW(wb_flush_threshold);
 static DEVICE_ATTR_RW(rtc_update_ms);
+static DEVICE_ATTR_RW(pm_qos_enable);
 
 static struct attribute *ufs_sysfs_ufshcd_attrs[] = {
 	&dev_attr_rpm_lvl.attr,
@@ -429,6 +477,7 @@ static struct attribute *ufs_sysfs_ufshcd_attrs[] = {
 	&dev_attr_enable_wb_buf_flush.attr,
 	&dev_attr_wb_flush_threshold.attr,
 	&dev_attr_rtc_update_ms.attr,
+	&dev_attr_pm_qos_enable.attr,
 	NULL
 };
 
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 7fb1758384e2..188f4324f49c 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1014,6 +1014,48 @@ static bool ufshcd_is_unipro_pa_params_tuning_req(struct ufs_hba *hba)
 	return ufshcd_get_local_unipro_ver(hba) < UFS_UNIPRO_VER_1_6;
 }
 
+/**
+ * ufshcd_pm_qos_init - initialize PM QoS request
+ * @hba: per adapter instance
+ */
+void ufshcd_pm_qos_init(struct ufs_hba *hba)
+{
+
+	if (hba->pm_qos_enabled)
+		return;
+
+	cpu_latency_qos_add_request(&hba->pm_qos_req, PM_QOS_DEFAULT_VALUE);
+
+	if (cpu_latency_qos_request_active(&hba->pm_qos_req))
+		hba->pm_qos_enabled = true;
+}
+
+/**
+ * ufshcd_pm_qos_exit - remove request from PM QoS
+ * @hba: per adapter instance
+ */
+void ufshcd_pm_qos_exit(struct ufs_hba *hba)
+{
+	if (!hba->pm_qos_enabled)
+		return;
+
+	cpu_latency_qos_remove_request(&hba->pm_qos_req);
+	hba->pm_qos_enabled = false;
+}
+
+/**
+ * ufshcd_pm_qos_update - update PM QoS request
+ * @hba: per adapter instance
+ * @on: If True, vote for perf PM QoS mode otherwise power save mode
+ */
+static void ufshcd_pm_qos_update(struct ufs_hba *hba, bool on)
+{
+	if (!hba->pm_qos_enabled)
+		return;
+
+	cpu_latency_qos_update_request(&hba->pm_qos_req, on ? 0 : PM_QOS_DEFAULT_VALUE);
+}
+
 /**
  * ufshcd_set_clk_freq - set UFS controller clock frequencies
  * @hba: per adapter instance
@@ -1160,8 +1202,11 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, unsigned long freq,
 					    hba->devfreq->previous_freq);
 		else
 			ufshcd_set_clk_freq(hba, !scale_up);
+		goto out;
 	}
 
+	ufshcd_pm_qos_update(hba, scale_up);
+
 out:
 	trace_ufshcd_profile_clk_scaling(dev_name(hba->dev),
 			(scale_up ? "up" : "down"),
@@ -9291,6 +9336,8 @@ static int ufshcd_setup_clocks(struct ufs_hba *hba, bool on)
 	if (ret)
 		return ret;
 
+	if (!ufshcd_is_clkscaling_supported(hba))
+		ufshcd_pm_qos_update(hba, on);
 out:
 	if (ret) {
 		list_for_each_entry(clki, head, list) {
@@ -9468,6 +9515,7 @@ static int ufshcd_hba_init(struct ufs_hba *hba)
 static void ufshcd_hba_exit(struct ufs_hba *hba)
 {
 	if (hba->is_powered) {
+		ufshcd_pm_qos_exit(hba);
 		ufshcd_exit_clk_scaling(hba);
 		ufshcd_exit_clk_gating(hba);
 		if (hba->eh_wq)
@@ -10121,6 +10169,7 @@ static int ufshcd_suspend(struct ufs_hba *hba)
 	ufshcd_vreg_set_lpm(hba);
 	/* Put the host controller in low power mode if possible */
 	ufshcd_hba_vreg_set_lpm(hba);
+	ufshcd_pm_qos_update(hba, false);
 	return ret;
 }
 
@@ -10667,6 +10716,7 @@ int ufshcd_init(struct ufs_hba *hba, void __iomem *mmio_base, unsigned int irq)
 	ufs_sysfs_add_nodes(hba->dev);
 
 	device_enable_async_suspend(dev);
+	ufshcd_pm_qos_init(hba);
 	return 0;
 
 free_tmf_queue:
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index 38637bea9a52..2f5e88b3e643 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -914,6 +914,8 @@ enum ufshcd_mcq_opr {
  * @dev_cmd_queue: Queue for issuing device management commands
  * @mcq_opr: MCQ operation and runtime registers
  * @ufs_rtc_update_work: A work for UFS RTC periodic update
+ * @pm_qos_req: PM QoS request handle
+ * @pm_qos_enabled: flag to check if pm qos is enabled
  */
 struct ufs_hba {
 	void __iomem *mmio_base;
@@ -1080,6 +1082,8 @@ struct ufs_hba {
 	struct ufshcd_mcq_opr_info_t mcq_opr[OPR_MAX];
 
 	struct delayed_work ufs_rtc_update_work;
+	struct pm_qos_request pm_qos_req;
+	bool pm_qos_enabled;
 };
 
 /**
@@ -1401,6 +1405,8 @@ int ufshcd_suspend_prepare(struct device *dev);
 int __ufshcd_suspend_prepare(struct device *dev, bool rpm_ok_for_spm);
 void ufshcd_resume_complete(struct device *dev);
 bool ufshcd_is_hba_active(struct ufs_hba *hba);
+void ufshcd_pm_qos_init(struct ufs_hba *hba);
+void ufshcd_pm_qos_exit(struct ufs_hba *hba);
 
 /* Wrapper functions for safely calling variant operations */
 static inline int ufshcd_vops_init(struct ufs_hba *hba)
-- 
2.17.1


