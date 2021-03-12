Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BAAC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 15:38:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8086D65006
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 15:38:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8086D65006
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r9t1aCrZlQryNAm9KqGX4m+fJAuIbfg8hsa/QufPOa0=; b=L7NSQbxxfckUy9BuDrnAF/pi1
	wd+fj8biVtWNhdZCG9Ixk21P8GmBWAPArKFmXo8fOSuaAlLC1GcupUiKnZ/rd0QpcEGhQsXGqWn5+
	DI6hFUovGYC4NAyxJMjLkQz8g5aZfogNZIuJW6y+jYohd+eiDlMyro1S6DB5LFVBMNIjPyiO/s8C5
	3/2KluMmgwbjXIVaYcu3wsPIt905A2ufLg0MDzHQdp1/IjslWclNG3LomtkZMC6nwdn+GNd2Nwu2z
	0M076Hs36uf+6nyCTSwSDtNBE2dy8KJUNyTQ5MCzKboPzFj9GmCSRJE+J7patM1QZuHCuwYH2Brpd
	ObN1vcBMg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKjrs-00Bp5u-5R; Fri, 12 Mar 2021 15:38:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKjoj-00BoPL-Sr; Fri, 12 Mar 2021 15:35:12 +0000
X-UUID: a5c3a384fc974b949e1ec1fdacaec01c-20210312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HCkbTwtUAC+VrcpLYZB5keZEZekjzGEklcF/K+XL1A0=; 
 b=ZVgzQZTK4eCqs1DShugYlNHtU43KSE2Dci0wjqngtTzInZav2qP9wYTahCj/lLxLgNhViSLX8W9TyodrvxMZ+C8/5EoYXh/ImzKXGEP4Q+oEzI1eWxY826cftjobH+Rs/AIOTmlPVivmcDTPB2kEui/E7sO9l+yRBS7HfXwe/M0=;
X-UUID: a5c3a384fc974b949e1ec1fdacaec01c-20210312
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 364085406; Fri, 12 Mar 2021 07:34:55 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 07:34:54 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 23:34:52 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 12 Mar 2021 23:34:52 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <drinkcat@chromium.org>
CC: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 2/5] soc: mediatek: pwrap: add arbiter capability
Date: Fri, 12 Mar 2021 23:34:43 +0800
Message-ID: <1615563286-22126-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1615563286-22126-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1615563286-22126-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_153510_509321_57A3F117 
X-CRM114-Status: GOOD (  19.13  )
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

Add arbiter capability for pwrap driver.
The arbiter capability uses new design to judge the priority and latency
for multi-channel.
The design with arbiter support cannot change the watchdog timer.
This patch is preparing for adding mt6873/8192 pwrap support.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
changes since v5:
- no change.
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 64 ++++++++++++++++++++++------
 1 file changed, 51 insertions(+), 13 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index c897205ad11f..a75019fa02dc 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -25,10 +25,12 @@
 
 /* macro for wrapper status */
 #define PWRAP_GET_WACS_RDATA(x)		(((x) >> 0) & 0x0000ffff)
+#define PWRAP_GET_WACS_ARB_FSM(x)	(((x) >> 1) & 0x00000007)
 #define PWRAP_GET_WACS_FSM(x)		(((x) >> 16) & 0x00000007)
 #define PWRAP_GET_WACS_REQ(x)		(((x) >> 19) & 0x00000001)
 #define PWRAP_STATE_SYNC_IDLE0		BIT(20)
 #define PWRAP_STATE_INIT_DONE0		BIT(21)
+#define PWRAP_STATE_INIT_DONE1		BIT(15)
 
 /* macro for WACS FSM */
 #define PWRAP_WACS_FSM_IDLE		0x00
@@ -74,6 +76,7 @@
 #define PWRAP_CAP_DCM		BIT(2)
 #define PWRAP_CAP_INT1_EN	BIT(3)
 #define PWRAP_CAP_WDT_SRC1	BIT(4)
+#define PWRAP_CAP_ARB		BIT(5)
 
 /* defines for slave device wrapper registers */
 enum dew_regs {
@@ -340,6 +343,8 @@ enum pwrap_regs {
 	PWRAP_DCM_DBC_PRD,
 	PWRAP_EINT_STA0_ADR,
 	PWRAP_EINT_STA1_ADR,
+	PWRAP_SWINF_2_WDATA_31_0,
+	PWRAP_SWINF_2_RDATA_31_0,
 
 	/* MT2701 only regs */
 	PWRAP_ADC_CMD_ADDR,
@@ -1106,18 +1111,25 @@ static void pwrap_writel(struct pmic_wrapper *wrp, u32 val, enum pwrap_regs reg)
 	writel(val, wrp->base + wrp->master->regs[reg]);
 }
 
-static bool pwrap_is_fsm_idle(struct pmic_wrapper *wrp)
+static u32 pwrap_get_fsm_state(struct pmic_wrapper *wrp)
 {
-	u32 val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
+	u32 val;
 
-	return PWRAP_GET_WACS_FSM(val) == PWRAP_WACS_FSM_IDLE;
+	val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
+	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		return PWRAP_GET_WACS_ARB_FSM(val);
+	else
+		return PWRAP_GET_WACS_FSM(val);
 }
 
-static bool pwrap_is_fsm_vldclr(struct pmic_wrapper *wrp)
+static bool pwrap_is_fsm_idle(struct pmic_wrapper *wrp)
 {
-	u32 val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
+	return pwrap_get_fsm_state(wrp) == PWRAP_WACS_FSM_IDLE;
+}
 
-	return PWRAP_GET_WACS_FSM(val) == PWRAP_WACS_FSM_WFVLDCLR;
+static bool pwrap_is_fsm_vldclr(struct pmic_wrapper *wrp)
+{
+	return pwrap_get_fsm_state(wrp) == PWRAP_WACS_FSM_WFVLDCLR;
 }
 
 /*
@@ -1165,6 +1177,7 @@ static int pwrap_wait_for_state(struct pmic_wrapper *wrp,
 static int pwrap_read16(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
 {
 	int ret;
+	u32 val;
 
 	ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
 	if (ret) {
@@ -1172,13 +1185,21 @@ static int pwrap_read16(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
 		return ret;
 	}
 
-	pwrap_writel(wrp, (adr >> 1) << 16, PWRAP_WACS2_CMD);
+	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		val = adr;
+	else
+		val = (adr >> 1) << 16;
+	pwrap_writel(wrp, val, PWRAP_WACS2_CMD);
 
 	ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_vldclr);
 	if (ret)
 		return ret;
 
-	*rdata = PWRAP_GET_WACS_RDATA(pwrap_readl(wrp, PWRAP_WACS2_RDATA));
+	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		val = pwrap_readl(wrp, PWRAP_SWINF_2_RDATA_31_0);
+	else
+		val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
+	*rdata = PWRAP_GET_WACS_RDATA(val);
 
 	pwrap_writel(wrp, 1, PWRAP_WACS2_VLDCLR);
 
@@ -1228,8 +1249,13 @@ static int pwrap_write16(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
 		return ret;
 	}
 
-	pwrap_writel(wrp, (1 << 31) | ((adr >> 1) << 16) | wdata,
-		     PWRAP_WACS2_CMD);
+	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB)) {
+		pwrap_writel(wrp, wdata, PWRAP_SWINF_2_WDATA_31_0);
+		pwrap_writel(wrp, BIT(29) | adr, PWRAP_WACS2_CMD);
+	} else {
+		pwrap_writel(wrp, BIT(31) | ((adr >> 1) << 16) | wdata,
+			     PWRAP_WACS2_CMD);
+	}
 
 	return 0;
 }
@@ -2022,6 +2048,7 @@ MODULE_DEVICE_TABLE(of, of_pwrap_match_tbl);
 static int pwrap_probe(struct platform_device *pdev)
 {
 	int ret, irq;
+	u32 mask_done;
 	struct pmic_wrapper *wrp;
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *of_slave_id = NULL;
@@ -2116,14 +2143,21 @@ static int pwrap_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & PWRAP_STATE_INIT_DONE0)) {
+	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		mask_done = PWRAP_STATE_INIT_DONE1;
+	else
+		mask_done = PWRAP_STATE_INIT_DONE0;
+
+	if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & mask_done)) {
 		dev_dbg(wrp->dev, "initialization isn't finished\n");
 		ret = -ENODEV;
 		goto err_out2;
 	}
 
 	/* Initialize watchdog, may not be done by the bootloader */
-	pwrap_writel(wrp, 0xf, PWRAP_WDT_UNIT);
+	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		pwrap_writel(wrp, 0xf, PWRAP_WDT_UNIT);
+
 	/*
 	 * Since STAUPD was not used on mt8173 platform,
 	 * so STAUPD of WDT_SRC which should be turned off
@@ -2132,7 +2166,11 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_WDT_SRC1))
 		pwrap_writel(wrp, wrp->master->wdt_src, PWRAP_WDT_SRC_EN_1);
 
-	pwrap_writel(wrp, 0x1, PWRAP_TIMER_EN);
+	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		pwrap_writel(wrp, 0x3, PWRAP_TIMER_EN);
+	else
+		pwrap_writel(wrp, 0x1, PWRAP_TIMER_EN);
+
 	pwrap_writel(wrp, wrp->master->int_en_all, PWRAP_INT_EN);
 	/*
 	 * We add INT1 interrupt to handle starvation and request exception
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
