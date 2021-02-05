Return-Path: <SRS0=sOPI=HH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2484C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 01:28:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78ED264F4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Feb 2021 01:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78ED264F4A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AqHAhhG025EWbXE2I91u86e4mPY8whI9SxcbxuA1z7Y=; b=auM/5OrfhsgnRCf3AgPfNPLDL
	a8WWYRo5HCX1lnrikRPEOBiZgCEIVS4NZnag09UV/hVm6QtdhxII3G6ME7Z9IH2lYRIDBVkAWfCYX
	Lmh0jRNV3dmz2IzeWCaWQrVVo7odYZ4Sh1aF+GPbOrfdM/+DGvgQOeRP4kajcH2e+Pxm1JJevvW45
	MSCDjKYExb8d1kdL51XcaCdmDGRNrCxw11tjh06EGEW46GmfLtaDpneDM5FS4I+7kZ3LHRsVEAMjt
	uhBEq/zpu0yp1iHizt4N9hULOQlz4IqUbQaPag/R1aVSqepwsfnLu1VJamixBD3jmPtn0WhHC5Kq3
	1zFZQCA1g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7pvP-00041c-J9; Fri, 05 Feb 2021 01:28:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7pvA-0003vi-Pz; Fri, 05 Feb 2021 01:28:30 +0000
X-UUID: 64cbfdb1f41f488094bb1183731132c6-20210204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=yEYI6Ln/TvqkJILJDQXOYFVQvrkjXkVLvVk8377zGGo=; 
 b=Ir5SEosCe6Clyi/UsZoRNrFeG/+ukWOp2Zo+iPH1w5oQelfIp0dvjjSOieKER7cKo2UIJolgc89jWJqMD5BDLM7AaJTk98YmJcmkmxU1PTFKPeCSzIFNiaI2zsfdJxZcu1xVErUOKI+IFCZD2aZ5Ym50Lr3wiDf8yE3PslB3uec=;
X-UUID: 64cbfdb1f41f488094bb1183731132c6-20210204
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 426337658; Thu, 04 Feb 2021 17:28:26 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Feb 2021 17:28:24 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 5 Feb 2021 09:28:13 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 5 Feb 2021 09:28:14 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <drinkcat@chromium.org>, Argus Lin
 <argus.lin@mediatek.com>
Subject: [PATCH v5 2/5] soc: mediatek: pwrap: add arbiter capability
Date: Fri, 5 Feb 2021 09:28:08 +0800
Message-ID: <1612488491-6149-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1612488491-6149-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1612488491-6149-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1B280AB1C9C9BA49B43DDB587290C2781961180D188057B72F08B279C7F172AB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_202829_122532_6CB15D9E 
X-CRM114-Status: GOOD (  17.59  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
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
changes since v4:
- add pwrap_get_fsm_state() for better code quality.
- refine code about PWRAP_CAP_ARB capacity for better code quality.
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
