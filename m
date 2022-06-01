Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A18AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dYnz9U7djP18qDa3IhFP0qcgiRReiAt3uvRt8/eEPcE=; b=im7X2P2t7+/a+G
	PO8IY2NxzH3owOEqEuiFov6quRmD369vzVq1Rsx8419a86Ipi+xAbIurC2FbCtgwTBybT23aweicl
	Uo6mqUf959kfbQmWEFlJBtc9U9O4uFjy0OdVpl1nKwXCH5ZWlQnUdojRRiL5OmZgRXswapxAy6M4m
	2eFyoKiBgaieFFu1NLYkGys1BoUX66GrouDnYPezzXVzPY1SAuBk/VG008MAGXfHaRh0M64D2wqjN
	UlEUh6aSBSu/+IzMBa92X+oNX8KokhoS38KNy3vuaECpwrvXDmU7f5//+ssi9v4Sw5UgYtvVBWhB1
	bKOEWWA/7ISb5H4F2B0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMdJ-00Feyz-SS; Wed, 01 Jun 2022 11:35:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMaJ-00FdEG-2k; Wed, 01 Jun 2022 11:32:22 +0000
X-UUID: ebecae47bf8b4092b833e6f2000b693a-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:2abdf3df-8d97-4b3b-b2e4-d768dc36e4c6,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:68d9268a-32d7-4fc0-b2ef-8776ac194f8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: ebecae47bf8b4092b833e6f2000b693a-20220601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 160539161; Wed, 01 Jun 2022 04:32:09 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 04:22:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 1 Jun 2022 19:22:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 1 Jun 2022 19:22:06 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>, Benson Leung
	<bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Daisuke Nojiri
	<dnojiri@chromium.org>, Sebastian Reichel <sebastian.reichel@collabora.com>,
	"Dustin L. Howett" <dustin@howett.net>, Tzung-Bi Shih <tzungbi@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>, "Gustavo A. R. Silva"
	<gustavoars@kernel.org>, Prashant Malani <pmalani@chromium.org>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, Brian Norris
	<briannorris@chromium.org>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>
Subject: [PATCH v1 13/15] remoteproc: mediatek: Wait SCP core 1 probe done
Date: Wed, 1 Jun 2022 19:21:59 +0800
Message-ID: <20220601112201.15510-14-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220601112201.15510-1-tinghan.shen@mediatek.com>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_043219_261929_547F9546 
X-CRM114-Status: GOOD (  17.50  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SCP core 1 driver probing must finish before start loading SCP core 1
image. Add a simple flag checking mechanism when preparing SCP core 1
subdevice.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_common.h     |  1 +
 drivers/remoteproc/mtk_scp_dual.c   |  2 ++
 drivers/remoteproc/mtk_scp_subdev.c | 35 ++++++++++++++++++++++++++++-
 3 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index a5c26e56277d..464d013ed6b2 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -153,6 +153,7 @@ struct mtk_scp {
 
 	struct rproc_subdev *rpmsg_subdev;
 	struct rproc_subdev *dual_subdev;
+	int dual_probe_done;
 };
 
 /**
diff --git a/drivers/remoteproc/mtk_scp_dual.c b/drivers/remoteproc/mtk_scp_dual.c
index 90c49716dd39..ab62ab54175c 100644
--- a/drivers/remoteproc/mtk_scp_dual.c
+++ b/drivers/remoteproc/mtk_scp_dual.c
@@ -266,6 +266,8 @@ static int scp_dual_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_ipi;
 
+	scp->dual_probe_done = 1;
+
 	return 0;
 
 remove_ipi:
diff --git a/drivers/remoteproc/mtk_scp_subdev.c b/drivers/remoteproc/mtk_scp_subdev.c
index 197fb207c756..71dc6fcad61a 100644
--- a/drivers/remoteproc/mtk_scp_subdev.c
+++ b/drivers/remoteproc/mtk_scp_subdev.c
@@ -20,6 +20,7 @@ static struct mtk_scp *scp_dual_get(struct mtk_scp *scp)
 	struct device *dev = scp->dev;
 	struct device_node *np;
 	struct platform_device *dual_pdev;
+	struct mtk_scp *scp_dual;
 
 	np = of_parse_phandle(dev->of_node, "mediatek,scp-core", SCP_DTS_CORE_REF);
 	dual_pdev = of_find_device_by_node(np);
@@ -30,7 +31,11 @@ static struct mtk_scp *scp_dual_get(struct mtk_scp *scp)
 		return NULL;
 	}
 
-	return platform_get_drvdata(dual_pdev);
+	scp_dual = platform_get_drvdata(dual_pdev);
+	if (!scp_dual)
+		put_device(&dual_pdev->dev);
+
+	return scp_dual;
 }
 
 static void scp_dual_put(struct mtk_scp *scp)
@@ -38,6 +43,33 @@ static void scp_dual_put(struct mtk_scp *scp)
 	put_device(scp->dev);
 }
 
+static int scp_dual_rproc_prepare(struct rproc_subdev *subdev)
+{
+	struct scp_subdev_core *subdev_core = to_subdev_core(subdev);
+	struct mtk_scp *scp = subdev_core->main_scp;
+	unsigned long timeout;
+
+	timeout = jiffies + msecs_to_jiffies(100);
+	while (1) {
+		struct mtk_scp *scp_dual = scp_dual_get(scp);
+
+		if (scp_dual && scp_dual->dual_probe_done) {
+			scp_dual_put(scp_dual);
+			break;
+		}
+
+		if (scp_dual && !scp_dual->dual_probe_done)
+			scp_dual_put(scp_dual);
+
+		if (time_after(jiffies, timeout)) {
+			dev_err(scp->dev, "scp-dual probe timeout\n");
+			return -ETIMEDOUT;
+		}
+	}
+
+	return 0;
+}
+
 static int scp_dual_rproc_start(struct rproc_subdev *subdev)
 {
 	struct scp_subdev_core *subdev_core = to_subdev_core(subdev);
@@ -111,6 +143,7 @@ struct rproc_subdev *scp_dual_create_subdev(struct mtk_scp *scp)
 
 	subdev_core->main_scp = scp;
 	subdev_core->scp_dual_wdt_timeout = scp_dual_wdt_handler;
+	subdev_core->subdev.prepare = scp_dual_rproc_prepare;
 	subdev_core->subdev.start = scp_dual_rproc_start;
 	subdev_core->subdev.stop = scp_dual_rproc_stop;
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
