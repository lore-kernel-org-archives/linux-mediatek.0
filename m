Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C92FC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:50:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDB562065F
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 03:50:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1TvhksOy";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="MYReN72H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDB562065F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=U0gxTTT/F3dQCf0aqjr6X6o71WQfXoBy6DcLVVKMkoA=; b=1TvhksOy5n1sqvw3s0PYX3ABu
	MG0gvpPQgnwmbSEXHGztA0UuWwnb3IPc/Tql9TvmUcE0uxW2a18NOFxPeD7m3ivA+lxJeVV849NT4
	oAhVPGS1K1LfcYLLaM4+IWX1QLvIAHrMwGncYniipH/cZbTLEerfQw0kW7W9NCTpkiH8sLKRnz3ll
	0d5aVmIRA/ytwq+3YUUaH1/spv48EwtR23F/14X/CigFPviPQSU6hs6d0LKN2qVDugIZEjRROU2jd
	CqFjkqT9MqXsxFuRk33HoEF3/CsAF8f328iXI0RMx+YeZ7TrbTLoJAp795bDYX1kAZJK5kS5eYH/0
	D+/WL2fqQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jySFZ-0002rg-KK; Thu, 23 Jul 2020 03:50:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jySFV-0002pr-5V; Thu, 23 Jul 2020 03:50:26 +0000
X-UUID: 301babf36c034a93b0f6ffa88f21bbde-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SrPkUP8o0qnzmuIeH5BNsY2yvlNKAkq0haYDD/az/v4=; 
 b=MYReN72H99jSPvijojwikF+OpV7TeHlX5aQ8MK16SvcRn9PkKLVHWZPR/OJt8HHK34e9aFa7VlGSuQjUaQoDQU/AuZy70ctN1/mdyxLyusU3HlkLg2gTjlnqeo1ufR1pwe0GMtscBdEoXBvkrZIMVP0UYXTdKmweaY0FR14qWbI=;
X-UUID: 301babf36c034a93b0f6ffa88f21bbde-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1178495608; Wed, 22 Jul 2020 19:50:21 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 20:40:19 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 11:40:18 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Jul 2020 11:40:15 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Argus Lin <argus.lin@mediatek.com>
Subject: [PATCH v2 2/4] soc: mediatek: pwrap: add arbiter capability
Date: Thu, 23 Jul 2020 11:39:58 +0800
Message-ID: <1595475600-23180-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1595475600-23180-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1595475600-23180-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_235025_379792_C9CF8375 
X-CRM114-Status: GOOD (  16.54  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add arbiter capability for pwrap driver.
This patch is preparing for adding mt6873/8192 pwrap support.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 67 ++++++++++++++++++++++++++++++------
 1 file changed, 56 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index c897205..8d76ed4 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -24,11 +24,13 @@
 #define PWRAP_MT8135_BRIDGE_WDT_SRC_EN		0x54
 
 /* macro for wrapper status */
+#define PWRAP_GET_SWINF_2_FSM(x)	(((x) >> 1) & 0x00000007)
 #define PWRAP_GET_WACS_RDATA(x)		(((x) >> 0) & 0x0000ffff)
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
@@ -1108,16 +1113,30 @@ static void pwrap_writel(struct pmic_wrapper *wrp, u32 val, enum pwrap_regs reg)
 
 static bool pwrap_is_fsm_idle(struct pmic_wrapper *wrp)
 {
-	u32 val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
+	u32 val;
+	bool ret;
+
+	val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
+	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		ret = (PWRAP_GET_WACS_FSM(val) == PWRAP_WACS_FSM_IDLE);
+	else
+		ret = (PWRAP_GET_SWINF_2_FSM(val) == PWRAP_WACS_FSM_IDLE);
 
-	return PWRAP_GET_WACS_FSM(val) == PWRAP_WACS_FSM_IDLE;
+	return ret;
 }
 
 static bool pwrap_is_fsm_vldclr(struct pmic_wrapper *wrp)
 {
-	u32 val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
+	u32 val;
+	bool ret;
+
+	val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
+	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		ret = (PWRAP_GET_WACS_FSM(val) == PWRAP_WACS_FSM_WFVLDCLR);
+	else
+		ret = (PWRAP_GET_SWINF_2_FSM(val) == PWRAP_WACS_FSM_WFVLDCLR);
 
-	return PWRAP_GET_WACS_FSM(val) == PWRAP_WACS_FSM_WFVLDCLR;
+	return ret;
 }
 
 /*
@@ -1172,13 +1191,21 @@ static int pwrap_read16(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
 		return ret;
 	}
 
-	pwrap_writel(wrp, (adr >> 1) << 16, PWRAP_WACS2_CMD);
+	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		pwrap_writel(wrp, (adr >> 1) << 16, PWRAP_WACS2_CMD);
+	else
+		pwrap_writel(wrp, adr, PWRAP_WACS2_CMD);
 
 	ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_vldclr);
 	if (ret)
 		return ret;
 
-	*rdata = PWRAP_GET_WACS_RDATA(pwrap_readl(wrp, PWRAP_WACS2_RDATA));
+	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		*rdata = PWRAP_GET_WACS_RDATA(pwrap_readl(wrp,
+					      PWRAP_WACS2_RDATA));
+	else
+		*rdata = PWRAP_GET_WACS_RDATA(pwrap_readl(wrp,
+					      PWRAP_SWINF_2_RDATA_31_0));
 
 	pwrap_writel(wrp, 1, PWRAP_WACS2_VLDCLR);
 
@@ -1228,8 +1255,13 @@ static int pwrap_write16(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
 		return ret;
 	}
 
-	pwrap_writel(wrp, (1 << 31) | ((adr >> 1) << 16) | wdata,
-		     PWRAP_WACS2_CMD);
+	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB)) {
+		pwrap_writel(wrp, BIT(31) | ((adr >> 1) << 16) | wdata,
+			     PWRAP_WACS2_CMD);
+	} else {
+		pwrap_writel(wrp, wdata, PWRAP_SWINF_2_WDATA_31_0);
+		pwrap_writel(wrp, BIT(29) | adr, PWRAP_WACS2_CMD);
+	}
 
 	return 0;
 }
@@ -2022,6 +2054,7 @@ MODULE_DEVICE_TABLE(of, of_pwrap_match_tbl);
 static int pwrap_probe(struct platform_device *pdev)
 {
 	int ret, irq;
+	u32 rdata;
 	struct pmic_wrapper *wrp;
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *of_slave_id = NULL;
@@ -2116,14 +2149,22 @@ static int pwrap_probe(struct platform_device *pdev)
 		}
 	}
 
-	if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & PWRAP_STATE_INIT_DONE0)) {
+	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		rdata = pwrap_readl(wrp, PWRAP_WACS2_RDATA) &
+				    PWRAP_STATE_INIT_DONE0;
+	else
+		rdata = pwrap_readl(wrp, PWRAP_WACS2_RDATA) &
+				    PWRAP_STATE_INIT_DONE1;
+	if (!rdata) {
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
@@ -2132,7 +2173,11 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_WDT_SRC1))
 		pwrap_writel(wrp, wrp->master->wdt_src, PWRAP_WDT_SRC_EN_1);
 
-	pwrap_writel(wrp, 0x1, PWRAP_TIMER_EN);
+	if (!HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		pwrap_writel(wrp, 0x1, PWRAP_TIMER_EN);
+	else
+		pwrap_writel(wrp, 0x3, PWRAP_TIMER_EN);
+
 	pwrap_writel(wrp, wrp->master->int_en_all, PWRAP_INT_EN);
 	/*
 	 * We add INT1 interrupt to handle starvation and request exception
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
