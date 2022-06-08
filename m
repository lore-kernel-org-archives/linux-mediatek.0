Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BF79C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jun 2022 08:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cryztlI5RAr2a+1UBqps08suktlLWXdCWlYdgG1b8Sk=; b=ToRQ84EpK0At+7
	Xs5oDQYkIAbLHCVzoZQEAkNpUeYIg46jbEJMitiRdeiq78TKz4T5ka55Dx/aNSDTmXV2W8u6PFDg/
	PtwAglfmDzrlDSzTkbM8GyxmReUeAsaXdb/zWW7kFmlhB4Wlv8pQMMggXXXegd6Fsu9D6YcOa7jOf
	JqpjFBa8iVsjbaI684npFcFo5DMnaeHuGNiwWK0T+bE9btRMBbFUqq8zgtNBgKh2KpZYBHzUENfWy
	EMHeLeMkUDt6UUio3TbO0PGdxv3SP8PXQfDdPhMJz1yjovGMrHsZ9xBPb8Gqzbo/MzdEB0Uwh/NjC
	jdABylOXmKL2WL1OPi0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyrBf-00C0eb-L0; Wed, 08 Jun 2022 08:37:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyrBO-00C0U7-Ls; Wed, 08 Jun 2022 08:36:57 +0000
X-UUID: 1a8b08cf4d30412f84d68cd87458c6dc-20220608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:f73086fb-eff0-4a69-87a1-f44a239adcca,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:8e3015e5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 1a8b08cf4d30412f84d68cd87458c6dc-20220608
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1544558536; Wed, 08 Jun 2022 01:36:47 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jun 2022 01:36:07 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 8 Jun 2022 16:36:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Wed, 8 Jun 2022 16:36:03 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <bjorn.andersson@linaro.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>, Benson Leung <bleung@chromium.org>, Guenter
 Roeck <groeck@chromium.org>, Sebastian Reichel
	<sebastian.reichel@collabora.com>, Daisuke Nojiri <dnojiri@chromium.org>,
	Kees Cook <keescook@chromium.org>, Tinghan Shen <tinghan.shen@mediatek.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Prashant Malani
	<pmalani@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <chrome-platform@lists.linux.dev>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, <weishunc@google.com>
Subject: [PATCH v2 8/9] remoteproc: mediatek: Wait SCP core 1 probe done
Date: Wed, 8 Jun 2022 16:35:52 +0800
Message-ID: <20220608083553.8697-9-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220608083553.8697-1-tinghan.shen@mediatek.com>
References: <20220608083553.8697-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_013654_780694_9F77534E 
X-CRM114-Status: GOOD (  17.05  )
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
 drivers/remoteproc/mtk_common.h |  1 +
 drivers/remoteproc/mtk_scp.c    | 38 ++++++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 67b41866a100..89f9e53a5879 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -153,6 +153,7 @@ struct mtk_scp {
 
 	struct rproc_subdev *rpmsg_subdev;
 	struct rproc_subdev *dual_subdev;
+	int dual_probe_done;
 };
 
 /**
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index d0e9e19e251f..b66bee4beb4d 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -937,6 +937,7 @@ static struct mtk_scp *scp_dual_get(struct mtk_scp *scp)
 	struct device *dev = scp->dev;
 	struct device_node *np;
 	struct platform_device *dual_pdev;
+	struct mtk_scp *scp_dual;
 
 	np = of_parse_phandle(dev->of_node, "mediatek,scp-core", 0);
 	dual_pdev = of_find_device_by_node(np);
@@ -947,7 +948,11 @@ static struct mtk_scp *scp_dual_get(struct mtk_scp *scp)
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
@@ -955,6 +960,33 @@ static void scp_dual_put(struct mtk_scp *scp)
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
@@ -1014,6 +1046,7 @@ static struct rproc_subdev *scp_dual_create_subdev(struct mtk_scp *scp)
 
 	subdev_core->main_scp = scp;
 	subdev_core->scp_dual_wdt_timeout = scp_dual_wdt_handler;
+	subdev_core->subdev.prepare = scp_dual_rproc_prepare;
 	subdev_core->subdev.start = scp_dual_rproc_start;
 	subdev_core->subdev.stop = scp_dual_rproc_stop;
 
@@ -1155,6 +1188,9 @@ static int scp_probe(struct platform_device *pdev)
 	if (ret)
 		goto remove_subdev;
 
+	if (core_id == SCP_CORE_1)
+		scp->dual_probe_done = 1;
+
 	return 0;
 
 remove_subdev:
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
