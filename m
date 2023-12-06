Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B0AC4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 05:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DSEsi6ha8d2Dap2LNtqekCrbHlg2RMsuNLxo/jOQbS4=; b=pNX/DeXMe3SWEju8ZrYZMAg9YR
	7o4IdVXHo+bdSLcGE3YYp0y0wnfyP9hKxkneQvWc/m+Nd7/9SEdtUYZMeT8YVj5Pka20EPXmKIkm9
	F977PYYt/2GKfGROtIB0bW/P/SXTPiGhjjA/MPNABthOzZw2GUwNV0AsHFoYHSISuF09XhNHYiFGO
	srEMeMcsfpTZg91fock2Ms7xBf50a2/EV/7vcNF4AztdbOHXlDq9RZFsEdmrH045mDIaQEXoJprHA
	GTgNv2ryqtF66f0gmByea4TiIV9MEFjSgxEIuzHw61Ck9BvtkUtzRqR1cqE3JIpDZvq+Hj8LDkWfZ
	2p3YblXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAkee-0097P8-1b;
	Wed, 06 Dec 2023 05:41:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAkeb-0097Ni-0Y;
	Wed, 06 Dec 2023 05:41:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B64lO5A014334;
	Wed, 6 Dec 2023 05:36:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=DSEsi6ha8d2Dap2LNtqekCrbHlg2RMsuNLxo/jOQbS4=;
 b=HUTmrx+ngT2R2pX+clnkwa8QshV9gvXuYR3aNBQeXdQF8XbjgpbyMIVpXZSYciofkhu/
 tbjpvN8TycYCUtxIMRF8sw+ZFz/JroVzsHq+dVRecwhknQez72X50IU3o+xDOic7eU8K
 e1eeKnf9Awujf1tH1C8q3RNlB3ZmqSGkX/+14qhWue7N2T/ST7zCD5DAH6xSJ/uHykEp
 acyik2seAgNu/w74BVxkeDDWqnSr7GTBgbPQDSeCNz+iPSkF7hE34DD1KmrLRn/70v1Y
 ec+XmyLWb6GVfHDnWJhz2eJwPDkr4hZBRyIWT6A8UtynTmXds2A6ujn7sBUi8yesNfz/ Ng== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utd1n0p7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Dec 2023 05:36:40 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 3B65ablv009558;
	Wed, 6 Dec 2023 05:36:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3uqwnkryxu-1;
	Wed, 06 Dec 2023 05:36:37 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B65abDk009553;
	Wed, 6 Dec 2023 05:36:37 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-nitirawa-hyd.qualcomm.com [10.213.109.152])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3B65aaCt009552;
	Wed, 06 Dec 2023 05:36:37 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 2342877)
	id C868D5000B1; Wed,  6 Dec 2023 11:06:35 +0530 (+0530)
From: Nitin Rawat <quic_nitirawa@quicinc.com>
To: "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, quic_cang@quicinc.com,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Manish Pandey <quic_mapa@quicinc.com>
Subject: [PATCH V1] scsi: ufs: core: store min and max clk freq from OPP table
Date: Wed,  6 Dec 2023 11:06:28 +0530
Message-Id: <20231206053628.32169-1-quic_nitirawa@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JcWSzxgYC0qjNSj5G2k8Q-T0vKclwx2B
X-Proofpoint-GUID: JcWSzxgYC0qjNSj5G2k8Q-T0vKclwx2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_04,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311290000 definitions=main-2312060045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_214101_354895_021830AB 
X-CRM114-Status: GOOD (  21.63  )
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

OPP support will make use of OPP table in device tree and removes
freq-table-hz property from device tree.

With OPP enabled in devicetree, clki->min_freq and clki->maxfreq
currently is not getting updated and the value is set to 0.

Soc vendors like qcom, mediatek uses clki->minfreq and clki->maxfreq
in vendor specific file. These frequencies values are used to update
vendor specific configurations. Since the value is 0, it is causing
functional issue.

Add code to store the min and max ufs clk frequency from OPP table.

Fixes: 72208ebe181e ("scsi: ufs: core: Add support for parsing OPP")
Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
---
 drivers/ufs/host/ufshcd-pltfrm.c | 56 ++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
index da2558e274b4..12fa6f7d6a97 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.c
+++ b/drivers/ufs/host/ufshcd-pltfrm.c
@@ -13,6 +13,7 @@
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
+#include <linux/clk.h>

 #include <ufs/ufshcd.h>
 #include "ufshcd-pltfrm.h"
@@ -213,6 +214,55 @@ static void ufshcd_init_lanes_per_dir(struct ufs_hba *hba)
 	}
 }

+/**
+ * ufshcd_config_min_max_clk_freq - update min and max freq
+ * @hba: per adapter instance
+ *
+ * This function store min and max freq for all the clocks.
+ *
+ * Returns 0 for success and non-zero for failure
+ */
+static int ufshcd_config_min_max_clk_freq(struct ufs_hba *hba)
+{
+	struct list_head *head = &hba->clk_list_head;
+	struct dev_pm_opp *opp;
+	struct ufs_clk_info *clki;
+	unsigned long freq;
+	u8 idx = 0;
+	int ret;
+
+	list_for_each_entry(clki, head, list) {
+		if (!clki->name)
+			continue;
+
+		clki->clk = devm_clk_get(hba->dev, clki->name);
+		if (!IS_ERR_OR_NULL(clki->clk)) {
+			/* Find Max Freq */
+			freq = ULONG_MAX;
+			opp = dev_pm_opp_find_freq_floor_indexed(hba->dev, &freq, idx);
+			if (IS_ERR(opp)) {
+				dev_err(hba->dev, "failed to find dev_pm_opp\n");
+				ret = PTR_ERR(opp);
+				return ret;
+			}
+			clki->max_freq = dev_pm_opp_get_freq_indexed(opp, idx);
+
+			/* Find Min Freq */
+			freq = 0;
+			opp = dev_pm_opp_find_freq_ceil_indexed(hba->dev, &freq, idx);
+			if (IS_ERR(opp)) {
+				dev_err(hba->dev, "failed to find dev_pm_opp\n");
+				ret = PTR_ERR(opp);
+				return ret;
+			}
+			clki->min_freq = dev_pm_opp_get_freq_indexed(opp, idx);
+			idx++;
+		}
+	}
+
+	return 0;
+}
+
 static int ufshcd_parse_operating_points(struct ufs_hba *hba)
 {
 	struct device *dev = hba->dev;
@@ -279,6 +329,12 @@ static int ufshcd_parse_operating_points(struct ufs_hba *hba)
 		return ret;
 	}

+	ret = ufshcd_config_min_max_clk_freq(hba);
+	if (ret) {
+		dev_err(dev, "Failed to get min max freq: %d\n", ret);
+		return ret;
+	}
+
 	hba->use_pm_opp = true;

 	return 0;
--
2.17.1


