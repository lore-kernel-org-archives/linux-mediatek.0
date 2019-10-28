Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2334CA9EAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 02:52:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 772C1208C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 02:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YbiJwoih"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 772C1208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b04J4a7fMjAGoX4bh7jQmF7VSS8SmDbLAkAwxKKgJ3I=; b=YbiJwoih4xgpwp
	7Q/Iq88Piev86bu0fZclwDp88pK3RNrlvl5rehsAfrvHpX/gIGGGoYTO5nN60vLLZQG4u6Y5HNTAD
	WKGgvAEItyLkCU5skwdiTw+qRbESnQBgAaf4jCaexc+UJ/rUZ9ujw1DkAzo5ku9kDDNoBcuD8lIyK
	FOThHgnwahaIssQDizaEVt15429GTChvB1d5vutgBEZwksZwXfEWNZXnIgSOExVL+MJrTcsbkTBmg
	bZDx4RPvE4PKiw4e7o6nuopxI3t9xMZkbyNdaQJ2r1wxDsY4aWeTvjf7gIp5ygbMZWIPatq98Q5Fq
	/dWbpQveabyBYShx4xLg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOv9D-0005Lb-5u; Mon, 28 Oct 2019 02:52:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOv5R-0000yI-VE; Mon, 28 Oct 2019 02:48:55 +0000
X-UUID: c57b1a1271cd404d8470cd179318437e-20191027
X-UUID: c57b1a1271cd404d8470cd179318437e-20191027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1516180265; Sun, 27 Oct 2019 18:49:01 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 27 Oct 2019 19:48:26 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 28 Oct 2019 10:48:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 28 Oct 2019 10:48:26 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v8 07/14] soc: mediatek: Refactor bus protection control
Date: Mon, 28 Oct 2019 10:48:11 +0800
Message-ID: <1572230898-7860-8-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1572230898-7860-1-git-send-email-weiyi.lu@mediatek.com>
References: <1572230898-7860-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191027_194854_132939_31A2F242 
X-CRM114-Status: GOOD (  10.42  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: James Liao <jamesjj.liao@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 Fan Chen <fan.chen@mediatek.com>, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Put bus protection enable and disable control in separate functions.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-scpsys.c | 44 ++++++++++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index ad0f619..fb2b027 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -274,6 +274,30 @@ static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
 			MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
 }
 
+static int scpsys_bus_protect_enable(struct scp_domain *scpd)
+{
+	struct scp *scp = scpd->scp;
+
+	if (!scpd->data->bus_prot_mask)
+		return 0;
+
+	return mtk_infracfg_set_bus_protection(scp->infracfg,
+			scpd->data->bus_prot_mask,
+			scp->bus_prot_reg_update);
+}
+
+static int scpsys_bus_protect_disable(struct scp_domain *scpd)
+{
+	struct scp *scp = scpd->scp;
+
+	if (!scpd->data->bus_prot_mask)
+		return 0;
+
+	return mtk_infracfg_clear_bus_protection(scp->infracfg,
+			scpd->data->bus_prot_mask,
+			scp->bus_prot_reg_update);
+}
+
 static int scpsys_power_on(struct generic_pm_domain *genpd)
 {
 	struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
@@ -316,13 +340,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	if (ret < 0)
 		goto err_pwr_ack;
 
-	if (scpd->data->bus_prot_mask) {
-		ret = mtk_infracfg_clear_bus_protection(scp->infracfg,
-				scpd->data->bus_prot_mask,
-				scp->bus_prot_reg_update);
-		if (ret)
-			goto err_pwr_ack;
-	}
+	ret = scpsys_bus_protect_disable(scpd);
+	if (ret < 0)
+		goto err_pwr_ack;
 
 	return 0;
 
@@ -344,13 +364,9 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	u32 val;
 	int ret, tmp;
 
-	if (scpd->data->bus_prot_mask) {
-		ret = mtk_infracfg_set_bus_protection(scp->infracfg,
-				scpd->data->bus_prot_mask,
-				scp->bus_prot_reg_update);
-		if (ret)
-			goto out;
-	}
+	ret = scpsys_bus_protect_enable(scpd);
+	if (ret < 0)
+		goto out;
 
 	ret = scpsys_sram_disable(scpd, ctl_addr);
 	if (ret < 0)
-- 
1.8.1.1.dirty


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
