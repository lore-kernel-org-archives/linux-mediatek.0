Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8721EE57CD
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 Sep 2023 20:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9liW1TWuilzZXgtFUTRnBpUJWzVSW/jI5dz27x+NbLs=; b=x4bzTW/4OK02UWsoKnEOGUZ37G
	Ft5re7sbNhDWLGAY33HlPM8BqscibaBJ8q1CYcA1fXB7Q6t1xAalBUtWWm5aohoATnxudaHJ2CVPp
	HBR4k3peaKgPA2nHt8jwMkV6P7E+Ws7bFsZM6Gt2Hee5CI17YMm+mORX/1AyBh4iAFAv1HTQuFW8u
	KPHEcqZ6Omk0XI+chHBuIGvj/kkG3BC9HxtkHdd0pFOfyjcQ+kL9HeemD5Jf7X3fz1t5kypt1kJ1P
	xFFfcPJX7ow3xMPXJ0IrpD6nyXpIxjXNqCXLxHAdb4eEddGeNUyAUYDY+Zlf1x34u5QpQGU17ZxOs
	Q7NaOd0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4PR-00FlZZ-1q;
	Sat, 09 Sep 2023 20:18:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qf4PN-00FlWN-1Y;
	Sat, 09 Sep 2023 20:18:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 389KI6nn002971;
	Sat, 9 Sep 2023 20:18:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=9liW1TWuilzZXgtFUTRnBpUJWzVSW/jI5dz27x+NbLs=;
 b=nYoq/Zn6qdWiz+NYlTM4P9x1yiufKNuPjSL6+ZMCXoAAWBOSAKmqyfylg5FhfTcpJOt9
 9yDUEFnCeSA7w/xrR07YWNxwcpVbq0bLzxXE/6Rjrds5oZf3bj1qQTTMRbDBYrgRKqpu
 8Wu0eNna8un4z+nfHosLndI6vL20J9xK1oszUgwOWc1MC9CIWIg4XuiIqOBVQNgh2pW1
 sFA1MEIjAvvIyEJyH+UN9guntYDljVPUJKe1xX6jibViT6bVuRGwX3GHaXqqIlx5rNLX
 L816oWY++r9kE15lB4TktI4c06w14tDo8ReC0q9B6G3hrXRLmVnCKkQhqf/Mn9+4KWI/ vw== 
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t0h3drwkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 09 Sep 2023 20:18:06 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 389KI5no007335
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 9 Sep 2023 20:18:05 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Sat, 9 Sep 2023 13:17:54 -0700
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
Subject: [PATCH v5 09/17] pstore/ram: Use dynamic ramoops reserve resource
Date: Sun, 10 Sep 2023 01:46:10 +0530
Message-ID: <1694290578-17733-10-git-send-email-quic_mojha@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
References: <1694290578-17733-1-git-send-email-quic_mojha@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: _5oy-0n1aHv_BMXkvk0sAYOaD4q2-PFQ
X-Proofpoint-ORIG-GUID: _5oy-0n1aHv_BMXkvk0sAYOaD4q2-PFQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-09_19,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 phishscore=0 mlxlogscore=999 adultscore=0 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309090187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230909_131821_633639_0CAE61E4 
X-CRM114-Status: GOOD (  19.67  )
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

As dynamic ramoops command line parsing is now added, so
lets add the support in ramoops driver to get the resource
structure and add it during platform device registration.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 fs/pstore/ram.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/pstore/ram.c b/fs/pstore/ram.c
index 2f625e1fa8d8..e73fbbc1b5b5 100644
--- a/fs/pstore/ram.c
+++ b/fs/pstore/ram.c
@@ -913,13 +913,17 @@ static void __init ramoops_register_dummy(void)
 
 	/*
 	 * Prepare a dummy platform data structure to carry the module
-	 * parameters. If mem_size isn't set, then there are no module
-	 * parameters, and we can skip this.
+	 * parameters. If mem_size isn't set, check for dynamic ramoops
+	 * size and extract the information if it is set.
 	 */
-	if (!mem_size)
+	if (!mem_size && !dyn_ramoops_res.end)
 		return;
 
 	pr_info("using module parameters\n");
+	if (dyn_ramoops_res.end) {
+		mem_size = resource_size(&dyn_ramoops_res);
+		mem_address = dyn_ramoops_res.start;
+	}
 
 	memset(&pdata, 0, sizeof(pdata));
 	pdata.mem_size = mem_size;
-- 
2.7.4


