Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C601CC61DF4
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Nov 2023 22:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K2A4dtZlUtyZnmNAqQaXcmpJGNAhsKiXHCEqZlAWciU=; b=h0rjyuRUYlh4miH/uhzKaE9bVl
	ZdVco3C8tYaAHaL5oOMBxLbkjR/uFHnqF9kTgy0YTyWXQxYGlz2XQxbGlXWo+ZGr6nOsE+6bzRzqi
	2pCfFelwakTVQxYwuTB63oAJlPewJ3drPUivAEYqVevX9Pp4T4Kh5yobUSOT/SvsL6w4s/SHuDPLO
	uin65tNBLrMMwpYowbaL2CRZGZp9qUJ70XGTloKSAc2SjSDlXORavEqFE2FWHDkEV0OLB9ind7h9o
	wCnjF9m3K/MLtwoNwZdh12fbVgC21mxMuEIg1cDtVABTu4lQIjc99kHIAwsGfVK5+1jWNygbggvWW
	HhZ4DD3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6eYP-0087NK-2C;
	Fri, 24 Nov 2023 22:21:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6eYL-0087K1-2q;
	Fri, 24 Nov 2023 22:21:39 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AOMLIQt003380;
	Fri, 24 Nov 2023 22:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=K2A4dtZlUtyZnmNAqQaXcmpJGNAhsKiXHCEqZlAWciU=;
 b=AL8DMv0BxGjWvN0etm9NtA7uzgBmTN9FJnUm/ywRxhVBQMnD9XGOzppTVBxyWEFAzwc3
 5bUZ9LnVfMSmrl9I4Jfj7F3bMja4quX4mh8/C2tiZ2Zn5Hk/bpAxkdHaiPs/r42KzfZx
 3O72mlbZvLzi11vKH49G8wOIMrmbHRtG6i8hKp8zys03hk3cP11n5xAMwn8Kocq/lDb/
 gwFjKpvXUkqfm+Wna7aOYna6Sv+abNUekQewkJwB3eXAXG3mBnSs/sH8mQfn2th9ZzGi
 c8034ECKj5qKgryek+/aJ8NGnCFaxqNAPmSFCvitUn5Eliut2jCOcS7h/i3awZ96g1F9 fw== 
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ujp8x26a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 22:21:18 +0000
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AOMLH4a016251
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Nov 2023 22:21:17 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 24 Nov 2023 14:21:08 -0800
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
Subject: [Patch v6 07/12] init: export linux_banner data variable
Date: Sat, 25 Nov 2023 03:49:50 +0530
Message-ID: <1700864395-1479-8-git-send-email-quic_mojha@quicinc.com>
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
X-Proofpoint-GUID: ULQRcOi6Lxq-hgJwtJiWVaEoqEBtblCH
X-Proofpoint-ORIG-GUID: ULQRcOi6Lxq-hgJwtJiWVaEoqEBtblCH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-24_09,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311240174
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_142137_966210_55DB1511 
X-CRM114-Status: GOOD (  17.00  )
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
 init/version-timestamp.c | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/include/linux/init.h b/include/linux/init.h
index 01b52c9c7526..01a28b367841 100644
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
@@ -28,3 +29,5 @@ struct uts_namespace init_uts_ns = {
 const char linux_banner[] =
 	"Linux version " UTS_RELEASE " (" LINUX_COMPILE_BY "@"
 	LINUX_COMPILE_HOST ") (" LINUX_COMPILER ") " UTS_VERSION "\n";
+
+EXPORT_SYMBOL_GPL(linux_banner);
-- 
2.7.4


