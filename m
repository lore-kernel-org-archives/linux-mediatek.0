Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D873C30658
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Jun 2024 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cD7f1KxN/GsuTcb74iIdg5CMVlA7CC38kO3WnLLAl3g=; b=sMM+vp8SYPgCMAl2Gw6GyCtZ/v
	J802BjO471r0FkNaF4CMoEzKXsbyp13gNm1cDqIcMN+Ddv+HFBfSvEfUaSb1RwPjWBhefc+TotwsT
	nhFkBynyYjasV0/vbLcKpl6Al/659a/vaqrgW0w5aJqPRKmFCD2VmAME0Ufj6wVI9p6g2RlIZtWeb
	/6NQYZQaKuDDnh+jmSdDTkrEljvWxqYTOIbMobOmCbypfQLXqyeYFiX0NI3rGkbWq4nhzcouArRTk
	5oePl9fTj8Ra5FTHYIR5XqEV1BvfZw82NtcomvPjHk6xVJin9L9qHgyyn18GkmDKAHY9tAe16nQEH
	F+z6OotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM9aq-00000003oU7-0CkB;
	Tue, 25 Jun 2024 17:04:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM9am-00000003oTT-0Peb;
	Tue, 25 Jun 2024 17:04:30 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45P8YhB7001496;
	Tue, 25 Jun 2024 17:04:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cD7f1KxN/GsuTcb74iIdg5
	CMVlA7CC38kO3WnLLAl3g=; b=GP6qBp3nfu9b5QWqB5BcUMajwbmCBPXj15Idzs
	uxpKSadETDuyiWmx5rOdHpAGM02RpSf4bJ6sAwG45syBOGSq/YXaC/RLeiOL34qD
	iyAlV3yG1f41MpH6vJUIjZpYhhD+LKahEOg2u+pq9+1aFNImpX035mfPwEnby6Zz
	3KpT3MHpImbdMGzbR5xBwD386OQ/WvgsMFk+rDb/C0yqModzVk6QR5PgVJPGLkLm
	Yr5kU6a/We6ftR/A62+JJurAN3UesSC1wFmBPIDWEmGs3n2AAuDvp3zPf9Jf+WD+
	FmvwGyUATb4sa85FzvVqnOUbrQt8eELOeqQG0lZOJEP74ZEg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmaeyjst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 17:04:17 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PH4HuF023610
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 17:04:17 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 10:04:16 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Tue, 25 Jun 2024 10:04:15 -0700
Subject: [PATCH v2] soc: add missing MODULE_DESCRIPTION() macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20240625-md-drivers-soc-v2-1-8bc7c03e3e69@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAI74emYC/3WNyw6CMBBFf4V07Zi2EB6u/A/DopSpTCJFp9BgC
 P9uYe/yJPees4mATBjELdsEY6RAk0+gL5mwg/FPBOoTCy11IUulYOyhZ4rIAcJkQVW17FSTN6W
 uRDq9GR2tp/DRJu5MQOjYeDscmhf5ZYXRhBn5mA8U5om/Zz6q4/S3FBUoqJ10tnHO6by4fxay5
 O3VTqNo933/AbJv14zNAAAA
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
 Brugger" <matthias.bgg@gmail.com>, <soc@kernel.org>,
        "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>
CC: <linux-arm-kernel@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
        <kernel-janitors@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 36tpm4wtSvK3ie0iutjIYwwdW_YUzX7U
X-Proofpoint-GUID: 36tpm4wtSvK3ie0iutjIYwwdW_YUzX7U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_12,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406250125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_100428_182852_F6F146FD 
X-CRM114-Status: GOOD (  14.14  )
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

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Shawn Guo <shawnguo@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org> # for amlogic/meson-clk-measure.c
Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
This is the last of the issues that I see in the soc directory
---
Changes in v2:
- No changes to the actual patch. Just collected the tags and sending
  to soc@kernel.org to put in Arnd's patchwork queue
- Link to v1: https://lore.kernel.org/r/20240611-md-drivers-soc-v1-1-8f0fc9fff234@quicinc.com
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


