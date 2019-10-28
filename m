Return-Path: <SRS0=ArXH=YV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A7BCA9EAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 02:53:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D7FC208C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2019 02:53:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oHKL8vf7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D7FC208C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BqbJ4cqwPNcYM4f2sjWgpiZs7UfnIiFH7tJVg8EqkZk=; b=oHKL8vf7CfqtYF
	fzqd+1Q0hzaTttjwXgYwe2eaMNSBvP0Gdz63TRcM3OydMmPX/2NvU5ifYECoNhf8YLnaVy4dJcSZ4
	xidNM1YdotutPzE3Jep4B1kGtNETDBnBrNew+6y/tiBOgfa+bepCW2nqzE8qlKQz/g1XgPZtlM1pF
	EkElU929iCM04FLfz7s+r3zo/lrGnHhayEB7kuKIwClkAE8qq83HDffIDnnb/6TXypgj4rQVDLW9j
	V7BuieMaI1C/JwvvJ0+U3p5g9U5+HJ3W8OhGjPUq4kfghoTLOSq4XN1y6v3RjEKlzKLr2ofN7VhZF
	lUuMSfRO6UOIoXWAoekQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOv9k-0005rx-K3; Mon, 28 Oct 2019 02:53:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOv5T-0000ys-H7; Mon, 28 Oct 2019 02:48:57 +0000
X-UUID: e7976b901c8342eaaec45a6e8dd995cd-20191027
X-UUID: e7976b901c8342eaaec45a6e8dd995cd-20191027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 392422615; Sun, 27 Oct 2019 18:49:01 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 27 Oct 2019 19:48:27 -0700
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 28 Oct 2019 10:48:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Mon, 28 Oct 2019 10:48:26 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v8 06/14] soc: mediatek: Refactor sram control
Date: Mon, 28 Oct 2019 10:48:10 +0800
Message-ID: <1572230898-7860-7-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1572230898-7860-1-git-send-email-weiyi.lu@mediatek.com>
References: <1572230898-7860-1-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 86B95A856905D4D404B343024F68AA31574B70147CDB32FD4E3CE27F2C5A48922000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191027_194855_622004_6FBEC3C5 
X-CRM114-Status: GOOD (  12.91  )
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

Put sram enable and disable control in separate functions.

Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
---
 drivers/soc/mediatek/mtk-scpsys.c | 79 +++++++++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 28 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
index 73e4a1a..ad0f619 100644
--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -230,12 +230,55 @@ static int scpsys_clk_enable(struct clk *clk[], int max_num)
 	return ret;
 }
 
+static int scpsys_sram_enable(struct scp_domain *scpd, void __iomem *ctl_addr)
+{
+	u32 val;
+	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
+	int tmp;
+
+	val = readl(ctl_addr) & ~scpd->data->sram_pdn_bits;
+	writel(val, ctl_addr);
+
+	/* Either wait until SRAM_PDN_ACK all 0 or have a force wait */
+	if (MTK_SCPD_CAPS(scpd, MTK_SCPD_FWAIT_SRAM)) {
+		/*
+		 * Currently, MTK_SCPD_FWAIT_SRAM is necessary only for
+		 * MT7622_POWER_DOMAIN_WB and thus just a trivial setup
+		 * is applied here.
+		 */
+		usleep_range(12000, 12100);
+	} else {
+		/* Either wait until SRAM_PDN_ACK all 1 or 0 */
+		int ret = readl_poll_timeout(ctl_addr, tmp,
+				(tmp & pdn_ack) == 0,
+				MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int scpsys_sram_disable(struct scp_domain *scpd, void __iomem *ctl_addr)
+{
+	u32 val;
+	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
+	int tmp;
+
+	val = readl(ctl_addr) | scpd->data->sram_pdn_bits;
+	writel(val, ctl_addr);
+
+	/* Either wait until SRAM_PDN_ACK all 1 or 0 */
+	return readl_poll_timeout(ctl_addr, tmp,
+			(tmp & pdn_ack) == pdn_ack,
+			MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+}
+
 static int scpsys_power_on(struct generic_pm_domain *genpd)
 {
 	struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
 	struct scp *scp = scpd->scp;
 	void __iomem *ctl_addr = scp->base + scpd->data->ctl_offs;
-	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
 	u32 val;
 	int ret, tmp;
 
@@ -247,6 +290,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	if (ret)
 		goto err_clk;
 
+	/* subsys power on */
 	val = readl(ctl_addr);
 	val |= PWR_ON_BIT;
 	writel(val, ctl_addr);
@@ -268,24 +312,9 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
 	val |= PWR_RST_B_BIT;
 	writel(val, ctl_addr);
 
-	val &= ~scpd->data->sram_pdn_bits;
-	writel(val, ctl_addr);
-
-	/* Either wait until SRAM_PDN_ACK all 0 or have a force wait */
-	if (MTK_SCPD_CAPS(scpd, MTK_SCPD_FWAIT_SRAM)) {
-		/*
-		 * Currently, MTK_SCPD_FWAIT_SRAM is necessary only for
-		 * MT7622_POWER_DOMAIN_WB and thus just a trivial setup is
-		 * applied here.
-		 */
-		usleep_range(12000, 12100);
-
-	} else {
-		ret = readl_poll_timeout(ctl_addr, tmp, (tmp & pdn_ack) == 0,
-					 MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
-		if (ret < 0)
-			goto err_pwr_ack;
-	}
+	ret = scpsys_sram_enable(scpd, ctl_addr);
+	if (ret < 0)
+		goto err_pwr_ack;
 
 	if (scpd->data->bus_prot_mask) {
 		ret = mtk_infracfg_clear_bus_protection(scp->infracfg,
@@ -312,7 +341,6 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 	struct scp_domain *scpd = container_of(genpd, struct scp_domain, genpd);
 	struct scp *scp = scpd->scp;
 	void __iomem *ctl_addr = scp->base + scpd->data->ctl_offs;
-	u32 pdn_ack = scpd->data->sram_pdn_ack_bits;
 	u32 val;
 	int ret, tmp;
 
@@ -324,17 +352,12 @@ static int scpsys_power_off(struct generic_pm_domain *genpd)
 			goto out;
 	}
 
-	val = readl(ctl_addr);
-	val |= scpd->data->sram_pdn_bits;
-	writel(val, ctl_addr);
-
-	/* wait until SRAM_PDN_ACK all 1 */
-	ret = readl_poll_timeout(ctl_addr, tmp, (tmp & pdn_ack) == pdn_ack,
-				 MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
+	ret = scpsys_sram_disable(scpd, ctl_addr);
 	if (ret < 0)
 		goto out;
 
-	val |= PWR_ISO_BIT;
+	/* subsys power off */
+	val = readl(ctl_addr) | PWR_ISO_BIT;
 	writel(val, ctl_addr);
 
 	val &= ~PWR_RST_B_BIT;
-- 
1.8.1.1.dirty


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
