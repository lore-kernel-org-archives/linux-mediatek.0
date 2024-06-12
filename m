Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90438C27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 05:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Asvj8P9d0rg7S+Y9SuvlcxFTOWajvcFsS63XkgAaQcs=; b=lWgckPmxMiZX+2eS3l1mFjUEGr
	uq2beK+fgHLGaEh8jYknCJcG4CsyJLlnmf3Pv2IgM03nO3tsV/ghudxErVUU/dfGSJ6M/zSoyQiXd
	x75HTRbn7Wbcah7F5POt/SclIxz4bEL6DhHauhtDr/Z32weI3xOesBIXfAbQIkqekl6kkXe8kqohK
	ghErmmn76GLhxBhU9P/vWPqFDeFevTSH5hYOuWe2ET+EUCSGvl/AZx1qhau0mv/x18GPK3FG1ohG9
	OV8aq0eLVyZWVzUOZI5neu2Y8t4p3Bcohapv8VM3itmB2ulX5j+16Hsm0z3R5Blytan24GIexvaXn
	ha4w68eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHGtA-0000000BC8y-2VOh;
	Wed, 12 Jun 2024 05:51:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHGt6-0000000BC7j-1HKj;
	Wed, 12 Jun 2024 05:51:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45BL0gJK013157;
	Wed, 12 Jun 2024 05:51:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Asvj8P9d0rg7S+Y9Suvlcx
	FTOWajvcFsS63XkgAaQcs=; b=gwnI6Xkm+yhcXJUattorbWIJEMMBxOKi+CSvuO
	x9IxN8RMGhMVMoTy+pdArLvx09skrEfPLaV/khLAcA0zxRGmYMXnzhlkFzbbbTSD
	zF53fxHQxYsiHstm7nN0M0lwb1gzxBaea5+dhs8zRaFaQNVkXXlbRq/LMG5ObX0F
	VgGuvXMaSdHCGphTP8KhLnr287iS9cNOKmrdybzG2ycFeAY+U1l/XvBTRDkMCAMB
	j24h8jdKbBouPDJ164OTN6f1Tz5QuHR8sE6ND5LvY2g1OvGdh7IlkE4LVzgHfp9b
	bjgtoMQMrBydNNsTSf7ZXFjWGPMxYY0NARloKz0dV7NQrbDA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ypm45aj40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 05:51:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45C5p1uH001793
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 12 Jun 2024 05:51:01 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 11 Jun
 2024 22:51:00 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 11 Jun 2024 22:50:58 -0700
Subject: [PATCH] soc: add missing MODULE_DESCRIPTION() macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEE3aWYC/x3MTQ6CQAxA4auQrm0yHQmIVzEu5qdKExlMq4SEc
 HdGl9/ivQ2MVdjg2mygvIjJXCro1EAaQ3kySq4G73zrOiKcMmaVhdXQ5oTUX1yk4Tx0vocavZU
 fsv6Ht3t1DMYYNZQ0/jYvKd8Vp2AfVtj3A080wx5/AAAA
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman
	<khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>,
        Shawn Guo
	<shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "Pengutronix
 Kernel Team" <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        "Matthias
 Brugger" <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: hemcyYV9GAtAfb0bwsG1uX_Te_dWyefs
X-Proofpoint-ORIG-GUID: hemcyYV9GAtAfb0bwsG1uX_Te_dWyefs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-12_02,2024-06-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1011 priorityscore=1501 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406120040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_225112_606188_14878182 
X-CRM114-Status: GOOD (  12.17  )
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

With ARCH=x86, make allmodconfig && make W=1 C=1 reports:
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/imx/soc-imx8m.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-qmgr.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/ixp4xx/ixp4xx-npe.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/mediatek/mtk-cmdq-helper.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/soc/amlogic/meson-clk-measure.o

Add the missing invocations of the MODULE_DESCRIPTION() macro.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
This is the last of the issues that I see in the soc directory
---
 drivers/soc/amlogic/meson-clk-measure.c | 1 +
 drivers/soc/imx/soc-imx8m.c             | 1 +
 drivers/soc/ixp4xx/ixp4xx-npe.c         | 1 +
 drivers/soc/ixp4xx/ixp4xx-qmgr.c        | 1 +
 drivers/soc/mediatek/mtk-cmdq-helper.c  | 1 +
 5 files changed, 5 insertions(+)

diff --git a/drivers/soc/amlogic/meson-clk-measure.c b/drivers/soc/amlogic/meson-clk-measure.c
index 3f3039600357..a6453ffeb753 100644
--- a/drivers/soc/amlogic/meson-clk-measure.c
+++ b/drivers/soc/amlogic/meson-clk-measure.c
@@ -688,4 +688,5 @@ static struct platform_driver meson_msr_driver = {
 	},
 };
 module_platform_driver(meson_msr_driver);
+MODULE_DESCRIPTION("Amlogic Meson SoC Clock Measure driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index ec87d9d878f3..fe111bae38c8 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -252,4 +252,5 @@ static int __init imx8_soc_init(void)
 	return ret;
 }
 device_initcall(imx8_soc_init);
+MODULE_DESCRIPTION("NXP i.MX8M SoC driver");
 MODULE_LICENSE("GPL");
diff --git a/drivers/soc/ixp4xx/ixp4xx-npe.c b/drivers/soc/ixp4xx/ixp4xx-npe.c
index 35825ee95dff..34a6f187c220 100644
--- a/drivers/soc/ixp4xx/ixp4xx-npe.c
+++ b/drivers/soc/ixp4xx/ixp4xx-npe.c
@@ -764,6 +764,7 @@ static struct platform_driver ixp4xx_npe_driver = {
 module_platform_driver(ixp4xx_npe_driver);
 
 MODULE_AUTHOR("Krzysztof Halasa");
+MODULE_DESCRIPTION("Intel IXP4xx Network Processor Engine driver");
 MODULE_LICENSE("GPL v2");
 MODULE_FIRMWARE(NPE_A_FIRMWARE);
 MODULE_FIRMWARE(NPE_B_FIRMWARE);
diff --git a/drivers/soc/ixp4xx/ixp4xx-qmgr.c b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
index 244ad8d7e80b..cb112f3643e9 100644
--- a/drivers/soc/ixp4xx/ixp4xx-qmgr.c
+++ b/drivers/soc/ixp4xx/ixp4xx-qmgr.c
@@ -465,6 +465,7 @@ static struct platform_driver ixp4xx_qmgr_driver = {
 };
 module_platform_driver(ixp4xx_qmgr_driver);
 
+MODULE_DESCRIPTION("Intel IXP4xx Queue Manager driver");
 MODULE_LICENSE("GPL v2");
 MODULE_AUTHOR("Krzysztof Halasa");
 
diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
index 046522664dc1..dd70d4d2bed7 100644
--- a/drivers/soc/mediatek/mtk-cmdq-helper.c
+++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
@@ -526,4 +526,5 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
 }
 EXPORT_SYMBOL(cmdq_pkt_finalize);
 
+MODULE_DESCRIPTION("MediaTek Command Queue (CMDQ) driver");
 MODULE_LICENSE("GPL v2");

---
base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
change-id: 20240611-md-drivers-soc-1780b1939627


