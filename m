Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B41C27C53
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jun 2024 16:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4zyNQTIq2I6bGzfO6ANQkwyFQAtcRA8n30vnfURCfX4=; b=qrenDyR0+R5jTOY9IT+eE8jeYh
	XbP4J0qCgkevPxaUoRaioqJub/Hp76/e+p3vRVuSve6bD9nbZZMlkIFvTmi5BvL19RUqxsQuP+5tn
	v0CPZpRt05CaNXA6rODrR5IRnLKFA27FmkOEmgCHhFCmvDa3JWNUTOHv+3negppRU/JYf45uV+I6c
	bGMG78n+Bp9VtIyr80uy2Z3XFKNwrx84nBLmJgQt1F+wEEt5n93NScfCBlivw8YulkOHOJ+ZRwc19
	WKal50WkLUTlM32+stnoPtDwpT+awmR6D8SL+F7rpnnr4GAqz7LDNHQnewXRXmc0WqmGolhAcBW3S
	TFO7uf1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc3F-0000000Eq0l-1bIV;
	Fri, 07 Jun 2024 16:02:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFc3B-0000000Eq07-0nkb;
	Fri, 07 Jun 2024 16:02:46 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 457EmnwF010653;
	Fri, 7 Jun 2024 16:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4zyNQTIq2I6bGzfO6ANQkw
	yFQAtcRA8n30vnfURCfX4=; b=bIhnUW/isCLT0Z+5Jmiezpp0Nt5GmOlKO1TVxU
	WF01DyMVFNxDR9ldgg8FKy1QZNfSaLzHanEboC7I+0EPJMhRhZB9plP7lwvuGnU8
	wR/y7j3cfI/n7Lz4Qrq2KPL2v5pihyNfhJqYh+a+zHU5kb/E+47X1CWzUOZjpcDP
	FcAcwMg/a/ThvIlFw41v6F+Cugu847Uar6PBil5z9t9yOulp3wms1YrtKAzTiQgd
	YB1SL9839Ls/MyBvkEjT2TC2WkBnQyGjC5oQTkH7U9yQERWaX0dqzczBS191Bc5E
	MikG9fAVNoT8PTYsAAsw8hEwM96mk95p2YPaBLlcSgqL24Nw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ym49w066w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Jun 2024 16:02:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 457G2YII024794
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Jun 2024 16:02:34 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 7 Jun 2024
 09:02:34 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Fri, 7 Jun 2024 09:02:33 -0700
Subject: [PATCH] pwm: add missing MODULE_DESCRIPTION() macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240607-md-drivers-pwm-v1-1-27237a2bec6a@quicinc.com>
X-B4-Tracking: v=1; b=H4sIABgvY2YC/x3MQQrCQAxG4auUrA2MpejgVcTFtPlrA85YEq2F0
 rs7uvwW723kMIXTpdnIsKjrs1QcDw0NUyp3sEo1taHtwimcOQuL6QJznj+Z49hJFEGMEqhGs2H
 U9T+83qr75ODeUhmm3+ah5b1yTv6C0b5/AdiyANt/AAAA
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Shawn Guo
	<shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Pengutronix
 Kernel Team" <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-pwm@vger.kernel.org>, <imx@lists.linux.dev>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Xsaju1_HnI3ToMw3WAE6tj1QihTgS0au
X-Proofpoint-GUID: Xsaju1_HnI3ToMw3WAE6tj1QihTgS0au
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-07_09,2024-06-06_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 bulkscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 mlxlogscore=999 clxscore=1011 malwarescore=0 priorityscore=1501 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2406070119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_090245_445409_98748E79 
X-CRM114-Status: GOOD (  11.16  )
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

make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-imx1.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-imx27.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-intel-lgm.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-mediatek.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-pxa.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-samsung.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-spear.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pwm/pwm-visconti.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
This addresses all of the issues in driver/pwm

Let me know if you want any of the individual module changes
segregated into separate patches.
---
 drivers/pwm/pwm-imx1.c      | 1 +
 drivers/pwm/pwm-imx27.c     | 1 +
 drivers/pwm/pwm-intel-lgm.c | 1 +
 drivers/pwm/pwm-mediatek.c  | 1 +
 drivers/pwm/pwm-pxa.c       | 1 +
 drivers/pwm/pwm-samsung.c   | 1 +
 drivers/pwm/pwm-spear.c     | 1 +
 drivers/pwm/pwm-visconti.c  | 1 +
 8 files changed, 8 insertions(+)

diff --git a/drivers/pwm/pwm-imx1.c b/drivers/pwm/pwm-imx1.c
index 1d2aae2d278f..d5535d208005 100644
--- a/drivers/pwm/pwm-imx1.c
+++ b/drivers/pwm/pwm-imx1.c
@@ -194,5 +194,6 @@ static struct platform_driver pwm_imx1_driver = {
 };
 module_platform_driver(pwm_imx1_driver);
 
+MODULE_DESCRIPTION("i.MX1 and i.MX21 Pulse Width Modulator driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
diff --git a/drivers/pwm/pwm-imx27.c b/drivers/pwm/pwm-imx27.c
index e1412116ef65..9e2bbf5b4a8c 100644
--- a/drivers/pwm/pwm-imx27.c
+++ b/drivers/pwm/pwm-imx27.c
@@ -352,5 +352,6 @@ static struct platform_driver imx_pwm_driver = {
 };
 module_platform_driver(imx_pwm_driver);
 
+MODULE_DESCRIPTION("i.MX27 and later i.MX SoCs Pulse Width Modulator driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Sascha Hauer <s.hauer@pengutronix.de>");
diff --git a/drivers/pwm/pwm-intel-lgm.c b/drivers/pwm/pwm-intel-lgm.c
index f9cc7c17c8f0..084c71a0a11b 100644
--- a/drivers/pwm/pwm-intel-lgm.c
+++ b/drivers/pwm/pwm-intel-lgm.c
@@ -230,4 +230,5 @@ static struct platform_driver lgm_pwm_driver = {
 };
 module_platform_driver(lgm_pwm_driver);
 
+MODULE_DESCRIPTION("Intel LGM Pulse Width Modulator driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pwm/pwm-mediatek.c b/drivers/pwm/pwm-mediatek.c
index 19a87873ad60..0b5d68a90e83 100644
--- a/drivers/pwm/pwm-mediatek.c
+++ b/drivers/pwm/pwm-mediatek.c
@@ -395,4 +395,5 @@ static struct platform_driver pwm_mediatek_driver = {
 module_platform_driver(pwm_mediatek_driver);
 
 MODULE_AUTHOR("John Crispin <blogic@openwrt.org>");
+MODULE_DESCRIPTION("MediaTek Pulse Width Modulator driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index bb7bb48b2e6d..430bd6a709e9 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -208,4 +208,5 @@ static struct platform_driver pwm_driver = {
 
 module_platform_driver(pwm_driver);
 
+MODULE_DESCRIPTION("PXA Pulse Width Modulator driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index efb60c9f0cb3..7adf4f2b1049 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -644,6 +644,7 @@ static struct platform_driver pwm_samsung_driver = {
 };
 module_platform_driver(pwm_samsung_driver);
 
+MODULE_DESCRIPTION("Samsung Pulse Width Modulator driver");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Tomasz Figa <tomasz.figa@gmail.com>");
 MODULE_ALIAS("platform:samsung-pwm");
diff --git a/drivers/pwm/pwm-spear.c b/drivers/pwm/pwm-spear.c
index 6c6f3b38c835..4f372279f313 100644
--- a/drivers/pwm/pwm-spear.c
+++ b/drivers/pwm/pwm-spear.c
@@ -255,6 +255,7 @@ static struct platform_driver spear_pwm_driver = {
 
 module_platform_driver(spear_pwm_driver);
 
+MODULE_DESCRIPTION("ST Microelectronics SPEAr Pulse Width Modulator driver");
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Shiraz Hashim <shiraz.linux.kernel@gmail.com>");
 MODULE_AUTHOR("Viresh Kumar <viresh.kumar@linaro.com>");
diff --git a/drivers/pwm/pwm-visconti.c b/drivers/pwm/pwm-visconti.c
index 9e55380957be..28fae4979e3f 100644
--- a/drivers/pwm/pwm-visconti.c
+++ b/drivers/pwm/pwm-visconti.c
@@ -170,6 +170,7 @@ static struct platform_driver visconti_pwm_driver = {
 };
 module_platform_driver(visconti_pwm_driver);
 
+MODULE_DESCRIPTION("Toshiba Visconti Pulse Width Modulator driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>");
 MODULE_ALIAS("platform:pwm-visconti");

---
base-commit: 19ca0d8a433ff37018f9429f7e7739e9f3d3d2b4
change-id: 20240607-md-drivers-pwm-8f4d8dde88d0


