Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB39C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 11:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D+FjpHUioM7H8TSuKIVpl4wGWN+Ru2wL2Qkcxt0wgoc=; b=osnV2uQHErvCHL
	p0ftzVWq8LaW2ea4Y+85qebNcjk74/RmP1bRsQvdbaSd8zibVJpLIoT66Yw1FEdhrdHE++Y3Crogn
	MoOTF3AQ3ZqEAV53Py0BFuMKwvnev0OUGX3Roqk5puP5xU+T472NLxCrp5EyaaV934gPOK4uummNp
	zkMOv+lpnWBdnpXwS92KSUujO0M9VHEfDuuKtLo+rUY8Tdf/mwk9m9JN3q8dpMjoVznNl5+xKlMZg
	Fi+i+iAUnRNZmkZgamUB6c2hFgClFkUtRk8Uzfo5AdA7Nxhud4eoE5LZmpC9QOjrP4+gf6mU1c98+
	N0UFF8ZgzVYoCezxMkkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMaX-00FdKM-SU; Wed, 01 Jun 2022 11:32:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwMaD-00FdCB-3C; Wed, 01 Jun 2022 11:32:14 +0000
X-UUID: f6d62664d4ae476f89254e58b43d6185-20220601
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:48c3a6a7-c923-414e-8dc4-3212ccd43837,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:98ac8f14-f88c-475e-badf-d9ee54230b8f,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: f6d62664d4ae476f89254e58b43d6185-20220601
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2106799525; Wed, 01 Jun 2022 04:32:08 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jun 2022 04:22:08 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 1 Jun 2022 19:22:06 +0800
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
Subject: [PATCH v1 14/15] remoteproc: mediatek: Support rpmsg for SCP core 1
Date: Wed, 1 Jun 2022 19:22:00 +0800
Message-ID: <20220601112201.15510-15-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220601112201.15510-1-tinghan.shen@mediatek.com>
References: <20220601112201.15510-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_043213_158425_1CC4167A 
X-CRM114-Status: GOOD (  15.19  )
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

Reuse the rpmsg subdevice flow of SCP core 0 on SCP core 1.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 drivers/remoteproc/mtk_common.h   | 3 +++
 drivers/remoteproc/mtk_scp.c      | 6 ++++--
 drivers/remoteproc/mtk_scp_dual.c | 4 ++++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 464d013ed6b2..89e2bec0a087 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -185,4 +185,7 @@ void scp_ipi_handler(struct mtk_scp *scp);
 
 struct rproc_subdev *scp_dual_create_subdev(struct mtk_scp *scp);
 void scp_dual_destroy_subdev(struct rproc_subdev *subdev);
+
+void scp_add_rpmsg_subdev(struct mtk_scp *scp);
+void scp_remove_rpmsg_subdev(struct mtk_scp *scp);
 #endif
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index c7bf0a44ba0d..fbeaa81e914d 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -825,7 +825,7 @@ static struct mtk_rpmsg_info mtk_scp_rpmsg_info = {
 	.ns_ipi_id = SCP_IPI_NS_SERVICE,
 };
 
-static void scp_add_rpmsg_subdev(struct mtk_scp *scp)
+void scp_add_rpmsg_subdev(struct mtk_scp *scp)
 {
 	scp->rpmsg_subdev =
 		mtk_rpmsg_create_rproc_subdev(to_platform_device(scp->dev),
@@ -833,8 +833,9 @@ static void scp_add_rpmsg_subdev(struct mtk_scp *scp)
 	if (scp->rpmsg_subdev)
 		rproc_add_subdev(scp->rproc, scp->rpmsg_subdev);
 }
+EXPORT_SYMBOL_GPL(scp_add_rpmsg_subdev);
 
-static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
+void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
 {
 	if (scp->rpmsg_subdev) {
 		rproc_remove_subdev(scp->rproc, scp->rpmsg_subdev);
@@ -842,6 +843,7 @@ static void scp_remove_rpmsg_subdev(struct mtk_scp *scp)
 		scp->rpmsg_subdev = NULL;
 	}
 }
+EXPORT_SYMBOL_GPL(scp_remove_rpmsg_subdev);
 
 static void scp_add_dual_subdev(struct mtk_scp *scp)
 {
diff --git a/drivers/remoteproc/mtk_scp_dual.c b/drivers/remoteproc/mtk_scp_dual.c
index ab62ab54175c..caa57516e083 100644
--- a/drivers/remoteproc/mtk_scp_dual.c
+++ b/drivers/remoteproc/mtk_scp_dual.c
@@ -249,6 +249,8 @@ static int scp_dual_probe(struct platform_device *pdev)
 	init_waitqueue_head(&scp->run.wq);
 	init_waitqueue_head(&scp->ack_wq);
 
+	scp_add_rpmsg_subdev(scp);
+
 	ret = devm_request_threaded_irq(dev, platform_get_irq(pdev, 0), NULL,
 					scp_irq_handler, IRQF_ONESHOT,
 					pdev->name, scp);
@@ -271,6 +273,7 @@ static int scp_dual_probe(struct platform_device *pdev)
 	return 0;
 
 remove_ipi:
+	scp_remove_rpmsg_subdev(scp);
 	scp_ipi_unregister(scp, SCP_IPI_INIT);
 release_dev_mem:
 	scp_unmap_memory_region(scp);
@@ -286,6 +289,7 @@ static int scp_dual_remove(struct platform_device *pdev)
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
 	int i;
 
+	scp_remove_rpmsg_subdev(scp);
 	scp_ipi_unregister(scp, SCP_IPI_INIT);
 	scp_unmap_memory_region(scp);
 	for (i = 0; i < SCP_IPI_MAX; i++)
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
