Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDB0C47DB3
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Jan 2024 11:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1PwXNbOSzmmcOnrrXNWhBBczgfzE4P1QBgC2EhbCIs=; b=UMA0JW3qM59w+tCKdPR4sG63io
	If9HOj02L5BxPgDT2cwlq0/eeM8zjFuPhhvpfciNXf+UaqaipPzR+ycttHvSGi1ZRrCT2pJIVkiH3
	Mj0oACNlsmJfUSSQUW+Ek5EF8RagCO/lVQ9cRdU06ChxMrhlg3y224dJEippN4FkNUwfdoFHQVK2L
	prlf38HqvoGzGFYlINY2snpnd1kTQQst+vj79Rz0ykP8dSB8itiRp/cJIZOyS+dzAlzTqgBmucQjm
	tlMnpY50ZvXQMHrnMywXkKRQzqHDBCURgGSz3AHLFswhoCyYF9h82XJ2uVdfcDl7R6rS0G8juyLiq
	83RdDrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8Tm-000000030CN-2s7E;
	Wed, 31 Jan 2024 11:10:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rV8TV-00000003008-2wWo;
	Wed, 31 Jan 2024 11:09:51 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40V8GajE030363;
	Wed, 31 Jan 2024 11:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=n1PwXNbOSzmmcOnrrXNWhBBczgfzE4P1QBgC2EhbCIs=; b=G9
	934sjEouHlMhJaylyPB8BHiDAzg+n+BR6oNuS4R4vMnSjbge3rizPvWmJz/NJW7O
	V/owU7ZgX9skb0E8KuZ3qtrdl9pBNGhs3vogb2vWpItXB20BAUbPaM8UaenXG3yx
	30bM9UVVAO6bIpSX/8kMQbuIrzO9t5NVCGLKm9HwWFVyELWBV8ffGWRsOtzGHqCO
	Bfs0EorK7kpOlVeffH6fmdHWfpUDq8RK/Kzhc+yD+vI/9sFkfl3pXAWkPm5dbdA8
	xXhxrynFQTa3hQ43Lyl8J7F9Ngsnb6MCX7wxbpRfMSx+VHkYc+OntjjiyAujBfoB
	gHggXhyCbF3A8T8aS0jw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vygp7gsv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:09:36 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40VB9a3X028550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jan 2024 11:09:36 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 31 Jan 2024 03:09:26 -0800
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
Subject: [PATCH v8 05/10] init: export linux_banner data variable
Date: Wed, 31 Jan 2024 16:38:32 +0530
Message-ID: <20240131110837.14218-6-quic_mojha@quicinc.com>
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
X-Proofpoint-ORIG-GUID: WLJ5pHQMny6-dyzctECR7-WiKqaofJd6
X-Proofpoint-GUID: WLJ5pHQMny6-dyzctECR7-WiKqaofJd6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_06,2024-01-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015 adultscore=0
 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2401190000
 definitions=main-2401310085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_030949_830554_09FB9F43 
X-CRM114-Status: GOOD (  12.85  )
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

Some debug loadable module like minidump is interested in knowing
the kernel version against which it is being build. Let's export
linux_banner.

Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
---
 include/linux/init.h     | 3 +++
 init/version-timestamp.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/include/linux/init.h b/include/linux/init.h
index 58cef4c2e59a..d3d96188551c 100644
--- a/include/linux/init.h
+++ b/include/linux/init.h
@@ -145,6 +145,9 @@ extern char *saved_command_line;
 extern unsigned int saved_command_line_len;
 extern unsigned int reset_devices;
 
+/* Defined in init/version-timestamp.c */
+extern const char linux_banner[];
+
 /* used by init/main.c */
 void setup_arch(char **);
 void prepare_namespace(void);
diff --git a/init/version-timestamp.c b/init/version-timestamp.c
index 043cbf80a766..a48f2c19e5d7 100644
--- a/init/version-timestamp.c
+++ b/init/version-timestamp.c
@@ -6,6 +6,7 @@
 #include <linux/refcount.h>
 #include <linux/uts.h>
 #include <linux/utsname.h>
+#include <linux/init.h>
 
 struct uts_namespace init_uts_ns = {
 	.ns.count = REFCOUNT_INIT(2),
@@ -28,3 +29,4 @@ struct uts_namespace init_uts_ns = {
 const char linux_banner[] =
 	"Linux version " UTS_RELEASE " (" LINUX_COMPILE_BY "@"
 	LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION "\n";
+EXPORT_SYMBOL_GPL(linux_banner);
-- 
2.43.0.254.ga26002b62827


