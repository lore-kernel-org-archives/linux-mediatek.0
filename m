Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C178AC54EE9
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 01:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GBBwVF5JufH4F/fd4oF3ipJQLCv3QCvFcC7fK00SEIc=; b=v+p9b5bdtiDdPAsbUj9eMtpqz6
	e04mARXGwMOLWPQtcrNoJBQCHAqoV1Crp7faJyQ9EfMIjAXV2/fgGzi5VVDgTqj4JxcMHCHd2UK+1
	vuMoxwup00KuFQUZUFn2qV+VGdlGDvC+5KnohFwQNQY5fnZVvaCm2k+AbykWVJDFEXo3Ze1ohEISV
	xLwNzt0NJbxOqPBu6NW4qqBbjyjEByZQgUpohVOJG2HT2OwIP7/rOcioK62jX5vXmv3m2hsVt7aVQ
	MiOpU2ONzASGprjzsrtLvLneiM5aCDNKxe3zhP3UxPY9PuVYihUhvHLNLQH3mamVlOyt5sENgcGR+
	agj9Wv5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obXCe-000uSJ-3K; Fri, 23 Sep 2022 01:10:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obX9W-000t9m-96; Fri, 23 Sep 2022 01:06:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28N0x3i1019555;
	Fri, 23 Sep 2022 01:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=GBBwVF5JufH4F/fd4oF3ipJQLCv3QCvFcC7fK00SEIc=;
 b=Bmmy0rbVNBKD0GMl3GlRq18sIBARIxbMYM1RvxRVQzzHJuUfi9XcqH9Ze1HkJzGzw76C
 rTvj7ssfuo5ocGItMRm0tYFZfAOg7/0Lqu5SsEyznbuSrebECiUlKbwSmrvJTBODLg7j
 gKAmmDeEcjFT2ZvvRDvWP3mnUoq0GoUn/LvVkB8Hwh4W2KoJpfDPeKL5VHmDDJXmuFpG
 QkDlWIUtcIMz7D2fPu+XokIn3ZbGzLyPcvATvbRKb2Kko3HgFXX1+i8T7qn0CvMZvkU5
 5Dmr95ioy3rOGv9sn37jSwgxMe1bJtYEIh70uwVeYWxFr2RTW38KbwgJG/WrZxNrofkX IA== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3jrg4ctw30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 01:06:28 +0000
Received: from nasanex01a.na.qualcomm.com ([10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 28N16RCn015628
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Sep 2022 01:06:27 GMT
Received: from asutoshd-linux1.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 22 Sep 2022 18:06:26 -0700
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
        Matthias Brugger <matthias.bgg@gmail.com>,
        open list
	<linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support"
	<linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: [PATCH v1 02/16] ufs: core: Introduce Multi-circular queue capability
Date: Thu, 22 Sep 2022 18:05:09 -0700
Message-ID: <fa3d70c1642c64ce75461f630eabe84b3b974d4e.1663894792.git.quic_asutoshd@quicinc.com>
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
X-Proofpoint-GUID: M4bs7s3cq_iaalSHfH1fSnJut6lSrTMm
X-Proofpoint-ORIG-GUID: M4bs7s3cq_iaalSHfH1fSnJut6lSrTMm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_16,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0 mlxlogscore=999
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209230005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_180650_523671_8236D960 
X-CRM114-Status: GOOD (  20.44  )
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

Adds support to check for MCQ capability in the UFSHC.
This capability can be used by host drivers to control
MCQ enablement.

Co-developed-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Can Guo <quic_cang@quicinc.com>
Signed-off-by: Asutosh Das <quic_asutoshd@quicinc.com>
---
 drivers/ufs/core/ufshcd.c |  5 +++++
 include/ufs/ufshcd.h      | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 4b9ae83..24661fc 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -89,6 +89,7 @@
 #define FDEVICEINIT_COMPL_TIMEOUT 1500 /* millisecs */
 
 #define EXT_IID_CAP_SHIFT 10
+#define MCQ_SUPP_SHIFT 30
 #define ufshcd_toggle_vreg(_dev, _vreg, _on)				\
 	({                                                              \
 		int _ret;                                               \
@@ -2240,6 +2241,10 @@ static inline int ufshcd_hba_capabilities(struct ufs_hba *hba)
 	if (err)
 		dev_err(hba->dev, "crypto setup failed\n");
 
+	hba->mcq_sup = (hba->capabilities & MASK_MCQ_SUPPORT) >> MCQ_SUPP_SHIFT;
+	if (!hba->mcq_sup)
+		return err;
+
 	hba->mcq_capabilities = ufshcd_readl(hba, REG_MCQCAP);
 	hba->ext_iid_sup = (hba->mcq_capabilities & MASK_EXT_IID_SUPPORT) >>
 		EXT_IID_CAP_SHIFT;
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index da1eb8a..da7ec0c 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -660,6 +660,12 @@ enum ufshcd_caps {
 	 * notification if it is supported by the UFS device.
 	 */
 	UFSHCD_CAP_TEMP_NOTIF				= 1 << 11,
+
+	/*
+	 * This capability allows the host controller driver to turn on/off
+	 * MCQ mode. MCQ mode may be used to increase performance.
+	 */
+	UFSHCD_CAP_MCQ_EN				= 1 << 12,
 };
 
 struct ufs_hba_variant_params {
@@ -820,6 +826,7 @@ struct ufs_hba_monitor {
  * @complete_put: whether or not to call ufshcd_rpm_put() from inside
  *	ufshcd_resume_complete()
  * @ext_iid_sup: is EXT_IID is supported by UFSHC
+ * @mcq_sup: is mcq supported by UFSHC
  */
 struct ufs_hba {
 	void __iomem *mmio_base;
@@ -969,8 +976,14 @@ struct ufs_hba {
 	u32 luns_avail;
 	bool complete_put;
 	bool ext_iid_sup;
+	bool mcq_sup;
 };
 
+static inline bool is_mcq_supported(struct ufs_hba *hba)
+{
+	return hba->mcq_sup && (hba->caps & UFSHCD_CAP_MCQ_EN);
+}
+
 /* Returns true if clocks can be gated. Otherwise false */
 static inline bool ufshcd_is_clkgating_allowed(struct ufs_hba *hba)
 {
-- 
2.7.4


