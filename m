Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4454EC47DB3
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=erVnAJZx8ifcWPyB4Oavo8ehNHt/B3Y78dIRrq0/iQw=; b=chsp/Zfav+5hqwcIMvrRvwJGBx
	3Qwa3y8uk3k/bwOsAM8tS0mPVLLb1wXLLa8vWAEzf4ie3ldxpVpSBUw27Ykc7BSUXFP8NRpTWR3OL
	A91VnelU9FiP74OqDE+oDwLKPF2Vuj6liQhgslgC3YvFtP2SN+2e/ynHv0tiRpsjxPw/vJi2qRxhw
	NPhZ91ckzffOWIbFw9VgwUkytpruKKP3mR0W8AirVGQBqXcTfx7R1u4gkqycPoncsh0EmatilmaJQ
	wyx1uV0yXnYaNst4IXO4UXKcsdZkIMO5epdf7T6VxsMzvCY9HeFWYy6ZpMeEuZPnvZ8Ik2Wi320qM
	JdGnvJXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8UG-000000030UW-3EcO;
	Wed, 31 Jan 2024 11:10:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8Tk-0000000309o-08ii;
	Wed, 31 Jan 2024 11:10:05 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40VARgkV017838;
	Wed, 31 Jan 2024 11:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=erVnAJZx8ifcWPyB4Oavo8ehNHt/B3Y78dIRrq0/iQw=; b=J0
	IUXpiveG7zrVwEHzA6c2Z0vnZgyhwl7F9BPqe04ukjo1v5EX8S7OXvxA7fDLsKpe
	EEWaUjMhk+CvGMd1l0bfB4nPThXq7aX9RvJCNPVNFV6mlEexX7Pzoxssu6lawMpW
	NlDu2TNKR+hUG+CspLedTlv+mA5E3c0sFIbPxnLyBlHXv5qEkFmRJODBWX0XHIIv
	WZI/3k/NBtKyHlBblDlHnRvi83JL2v5VyVivnmZpIhWwiZ0DbhKu3RkzwcBQ6u+s
	iyu9C6RRw1mnZHfdsenjSb6a7JG8qdZjY0HgV2EUvjZwH4RRr57tk3bXhO8t8WeG
	pymT+To93VMrnP4MCHbg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vyjas0e0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:09:51 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VB9oDa001939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:09:50 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 31 Jan 2024 03:09:41 -0800
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: <corbet@lwn.net>, <andersson@kernel.org>, <konrad.dybcio@linaro.org>,
        <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
        <conor+dt@kernel.org>, <keescook@chromium.org>, <tony.luck@intel.com>,
        <gpiccoli@igalia.com>, <mathieu.poirier@linaro.org>, <vigneshr@ti.com>,
        <nm@ti.com>, <matthias.bgg@gmail.com>, <kgene@kernel.org>,
        <alim.akhtar@samsung.com>, <bmasney@redhat.com>
CC: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-hardening@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_mojha@quicinc.com>
Subject: [PATCH v8 07/10] MAINTAINERS: Add entry for minidump related files
Date: Wed, 31 Jan 2024 16:38:34 +0530
Message-ID: <20240131110837.14218-8-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.43.0.254.ga26002b62827
In-Reply-To: <20240131110837.14218-1-quic_mojha@quicinc.com>
References: <20240131110837.14218-1-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9AAzU-6IftE53w_J4rLOFCofHTJNri2D
X-Proofpoint-ORIG-GUID: 9AAzU-6IftE53w_J4rLOFCofHTJNri2D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_06,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxscore=0
 mlxlogscore=855 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401310085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_031004_184462_0CE1B0F5 
X-CRM114-Status: GOOD (  10.66  )
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

Add the entries into maintainer file for all the minidump related
modules.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c45587eb4c1d..a7eea6e64dce 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18176,6 +18176,16 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/regulator/vqmmc-ipq4019-regulator.yaml
 F:	drivers/regulator/vqmmc-ipq4019-regulator.c
 
+QUALCOMM MINIDUMP DRIVER
+M:	Mukesh Ojha <quic_mojha@quicinc.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/qcom_minidump.rst
+F:	drivers/soc/qcom/qcom_minidump.c
+F:	drivers/soc/qcom/qcom_ramoops_minidump.c
+F:	drivers/soc/qcom/qcom_rproc_minidump.c
+
+
 QUALCOMM NAND CONTROLLER DRIVER
 M:	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
 L:	linux-mtd@lists.infradead.org
-- 
2.43.0.254.ga26002b62827


