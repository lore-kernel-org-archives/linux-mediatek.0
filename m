Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78705C27C53
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Jun 2024 05:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FOGK3CkFa+pQXmCuqHhrB+08p7S3TGqbxM0mAlsI4ms=; b=iZ10pyBdFdoP0w7tXBHXO05y2D
	tTNdMV5Q/Co5q4Se2f6LnF6IxiQK8QseEQKVHxBJXdbH67+kiiCpLDF6mVKzYBjQSNJTvjsFIV22w
	9l75z3JCQnlipKYs5KTMf7TCeywC5JbEPx6dA6B/vZqMk2KIehHCeRjwsBrUWeC8ZY8oFZMEgmuIa
	1OcZEen9a8a2+uCaGOJxy8HCNuW9Quwkeg7Pi7V8PymFT5DkClhocsSADsQYYZZaWOZ4QeqGdnjPZ
	IXp5ac2oH3t4cBYj7IyTfF1O1jSmCCWNPtjO+/sBucF3yeCfDWCy71ve0CemvQ4AiuKz08ENYNbYx
	WZ1N7XIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGAh4-00000001mrb-2IQp;
	Sun, 09 Jun 2024 05:02:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGAh0-00000001mr3-1IlI;
	Sun, 09 Jun 2024 05:02:12 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4594egxD016776;
	Sun, 9 Jun 2024 05:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FOGK3CkFa+pQXmCuqHhrB+
	08p7S3TGqbxM0mAlsI4ms=; b=JugOeTN9DahbhDeTv94iNNfS8rspPGqUHT7RhI
	5tc7TU08WibmMxs26Kc7KW9L1MCqJgTSASP3MaTz0jEkCYTeEApF5iuB+jsXJ/oY
	emH27ZC4OF2XQHVvvsq6Xd690J3Dd3t9E8TCGJUqdQfdUBpEGQjedMCl+pol9ja6
	ES4rB74ZRdL+oEOR4IxEPBoLhNpHVNA/rfq5edeh/FfeNoxOYBeexSYK25/AnCeh
	WFLaIjBzz8/QM3OOqiEQT+BdrtJyOCgnfdRTKOc64LWNeaR1OAde8E0VcQfkreoV
	Zq9rlfChIt/RhELAwGnTIykpMwyIS9VIA7AKL95cIJpE85kg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymgfk1bn2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 09 Jun 2024 05:01:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45951vbm001982
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 9 Jun 2024 05:01:57 GMT
Received: from [169.254.0.1] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 8 Jun 2024
 22:01:57 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Sat, 8 Jun 2024 21:53:29 -0700
Subject: [PATCH] regulator: add missing MODULE_DESCRIPTION() macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240608-md-drivers-regulator-v1-1-da338665db7a@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEg1ZWYC/x3MQQqDQAxA0atI1g3MxFZKr1K6iE6qAR1LoiKId
 ++0y7f4/wAXU3F4VAeYbOo654J4qaAbOPeCmoqBAl1DE+44JUymm5ijSb+OvMyGRDXFW+IgsYG
 Sfkzeuv+3z1dxyy7YGudu+M1GzeuOE/siBuf5BXzmqOuFAAAA
To: Support Opensource <support.opensource@diasemi.com>,
        Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>,
        "Jeff Johnson" <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iUnXO7HMrvR-rPnVh8eNFpAM8lOXcZ3I
X-Proofpoint-ORIG-GUID: iUnXO7HMrvR-rPnVh8eNFpAM8lOXcZ3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-09_02,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406090038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240608_220210_416908_50D8BC58 
X-CRM114-Status: GOOD (  12.57  )
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

On x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/da9121-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/max20411-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/rt4831-regulator.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/tps6286x-regulator.o

Add the missing invocation of the MODULE_DESCRIPTION() macro to all files
which have a MODULE_LICENSE(). This includes mtk-dvfsrc-regulator.c, which
did not produce a warning with the x86 allmodconfig, since it may cause
this warning with other configurations.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/regulator/da9121-regulator.c     | 1 +
 drivers/regulator/max20411-regulator.c   | 1 +
 drivers/regulator/mtk-dvfsrc-regulator.c | 1 +
 drivers/regulator/rt4831-regulator.c     | 1 +
 drivers/regulator/tps6286x-regulator.c   | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/regulator/da9121-regulator.c b/drivers/regulator/da9121-regulator.c
index 96257551bb12..3571b6242e3a 100644
--- a/drivers/regulator/da9121-regulator.c
+++ b/drivers/regulator/da9121-regulator.c
@@ -1192,4 +1192,5 @@ static struct i2c_driver da9121_regulator_driver = {
 
 module_i2c_driver(da9121_regulator_driver);
 
+MODULE_DESCRIPTION("Dialog Semiconductor DA9121/DA9122/DA9220/DA9217/DA9130/DA9131/DA9132 regulator driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/regulator/max20411-regulator.c b/drivers/regulator/max20411-regulator.c
index 8c09dc71b16d..6614e767072f 100644
--- a/drivers/regulator/max20411-regulator.c
+++ b/drivers/regulator/max20411-regulator.c
@@ -161,4 +161,5 @@ static struct i2c_driver max20411_i2c_driver = {
 };
 module_i2c_driver(max20411_i2c_driver);
 
+MODULE_DESCRIPTION("Maxim MAX20411 High-Efficiency Single Step-Down Converter driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
index f1280d45265d..1941aad5e247 100644
--- a/drivers/regulator/mtk-dvfsrc-regulator.c
+++ b/drivers/regulator/mtk-dvfsrc-regulator.c
@@ -211,4 +211,5 @@ static void __exit mtk_dvfsrc_regulator_exit(void)
 module_exit(mtk_dvfsrc_regulator_exit);
 
 MODULE_AUTHOR("Arvin wang <arvin.wang@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek DVFSRC regulator driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/regulator/rt4831-regulator.c b/drivers/regulator/rt4831-regulator.c
index 97e6f7e2a0ba..7d1ba0c82271 100644
--- a/drivers/regulator/rt4831-regulator.c
+++ b/drivers/regulator/rt4831-regulator.c
@@ -202,4 +202,5 @@ static struct platform_driver rt4831_regulator_driver = {
 module_platform_driver(rt4831_regulator_driver);
 
 MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
+MODULE_DESCRIPTION("Richtek RT4831 DSV RegulatorsRichtek RT4831 DSV Regulators driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/regulator/tps6286x-regulator.c b/drivers/regulator/tps6286x-regulator.c
index 758c70269653..65d0a5a145bd 100644
--- a/drivers/regulator/tps6286x-regulator.c
+++ b/drivers/regulator/tps6286x-regulator.c
@@ -156,4 +156,5 @@ static struct i2c_driver tps6286x_regulator_driver = {
 
 module_i2c_driver(tps6286x_regulator_driver);
 
+MODULE_DESCRIPTION("TI TPS6286x Power Regulator driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240608-md-drivers-regulator-223215da0e16


