Return-Path: <SRS0=0yQJ=AZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 544B5C433E3
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 10:01:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2511221D7A
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2020 10:01:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kr2yn5QA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uNkBXfsr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2511221D7A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kbdYwQfGYoEgB7uln9Uxnp1anmSfAu8IfUDPRfdRp5g=; b=Kr2yn5QASrd/DMrR1scXoRAL/
	0T+Wlemv//rq02qZ//SgDkNdgVnXqVafKa7Sju7tJrOtYAn7YbtIRuj6IEWbIHsj2jO/N+eVaZSTn
	RiqSlTuEfw9i6y0KKqr38UYQZzd+MT/OFx9HOg0vGMJG6vN3o8HTJuzF9LHjeIKakuwrDrJpCSvBE
	XcZTL5NWhPVHGg6iq583hvEvfXRb8BeMe3B+heuoQYjH34+5uTMs6jNzd/XXLAdCsO+fOYmdMMf62
	L59gux7ojYIyFRvWmHCVg0soU+UIzQu7hGrEE90el1YTE8iKYag4os/roKVyJUp/Zj5Jv1vPocL6s
	FQWUSwFHg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvHkn-0002VQ-GX; Tue, 14 Jul 2020 10:01:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvHkf-0002R3-FX; Tue, 14 Jul 2020 10:01:30 +0000
X-UUID: f6b68b0410a04a0eaea337d77d50af3a-20200714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=EOnqpqtyRMZc50/a4xzdJxk6bVs42IqQ6iAz6guwSpU=; 
 b=uNkBXfsrGz6ePSxmqInaorrGbXXXfv4OlJtFJjcqZYg71bF3v74cGsS29JqoyLFusfT/7SlCTqRUmIVzN1/p29pJrhgOtdE3KdKmEDSleW8CWNJHFweP1aMKY8TzxAYOiNPAozQE7MajsOd3GJZaRs/8kjqBXk9TKPxCvSmAOjI=;
X-UUID: f6b68b0410a04a0eaea337d77d50af3a-20200714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1914766406; Tue, 14 Jul 2020 02:01:25 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 02:54:06 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Jul 2020 17:54:05 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 14 Jul 2020 17:54:06 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Argus Lin <argus.lin@mediatek.com>
Subject: [PATCH 3/3] soc: mediatek: pwrap: add pwrap driver for MT6873/8192
 SoCs
Date: Tue, 14 Jul 2020 17:53:52 +0800
Message-ID: <1594720432-19586-4-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1594720432-19586-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1594720432-19586-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_060129_711173_A31515F1 
X-CRM114-Status: GOOD (  18.72  )
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
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT6873/8192 are highly integrated SoCs and use PMIC_MT6359 for
power management. This patch adds pwrap master driver to
access PMIC_MT6359.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 98 ++++++++++++++++++++++++++++++++----
 1 file changed, 87 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index c897205..6e7f796f 100644
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
@@ -348,6 +351,10 @@ enum pwrap_regs {
 	PWRAP_ADC_RDATA_ADDR1,
 	PWRAP_ADC_RDATA_ADDR2,
 
+	/* MT6873 only regs */
+	PWRAP_SWINF_2_WDATA_31_0,
+	PWRAP_SWINF_2_RDATA_31_0,
+
 	/* MT7622 only regs */
 	PWRAP_STA,
 	PWRAP_CLR,
@@ -627,6 +634,17 @@ static int mt6797_regs[] = {
 	[PWRAP_DCM_DBC_PRD] =		0x1D4,
 };
 
+static int mt6873_regs[] = {
+	[PWRAP_INIT_DONE2] =		0x0,
+	[PWRAP_TIMER_EN] =		0x3E0,
+	[PWRAP_INT_EN] =		0x448,
+	[PWRAP_WACS2_CMD] =		0xC80,
+	[PWRAP_SWINF_2_WDATA_31_0] =	0xC84,
+	[PWRAP_SWINF_2_RDATA_31_0] =	0xC94,
+	[PWRAP_WACS2_VLDCLR] =		0xCA4,
+	[PWRAP_WACS2_RDATA] =		0xCA8,
+};
+
 static int mt7622_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
@@ -1045,6 +1063,7 @@ enum pwrap_type {
 	PWRAP_MT6765,
 	PWRAP_MT6779,
 	PWRAP_MT6797,
+	PWRAP_MT6873,
 	PWRAP_MT7622,
 	PWRAP_MT8135,
 	PWRAP_MT8173,
@@ -1108,16 +1127,30 @@ static void pwrap_writel(struct pmic_wrapper *wrp, u32 val, enum pwrap_regs reg)
 
 static bool pwrap_is_fsm_idle(struct pmic_wrapper *wrp)
 {
-	u32 val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
+	u32 val;
+	bool ret;
+
+	val = pwrap_readl(wrp, PWRAP_WACS2_RDATA);
+	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		ret = (PWRAP_GET_SWINF_2_FSM(val) == PWRAP_WACS_FSM_IDLE);
+	else
+		ret = (PWRAP_GET_WACS_FSM(val) == PWRAP_WACS_FSM_IDLE);
 
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
+	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		ret = (PWRAP_GET_SWINF_2_FSM(val) == PWRAP_WACS_FSM_WFVLDCLR);
+	else
+		ret = (PWRAP_GET_WACS_FSM(val) == PWRAP_WACS_FSM_WFVLDCLR);
 
-	return PWRAP_GET_WACS_FSM(val) == PWRAP_WACS_FSM_WFVLDCLR;
+	return ret;
 }
 
 /*
@@ -1172,13 +1205,21 @@ static int pwrap_read16(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
 		return ret;
 	}
 
-	pwrap_writel(wrp, (adr >> 1) << 16, PWRAP_WACS2_CMD);
+	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		pwrap_writel(wrp, adr, PWRAP_WACS2_CMD);
+	else
+		pwrap_writel(wrp, (adr >> 1) << 16, PWRAP_WACS2_CMD);
 
 	ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_vldclr);
 	if (ret)
 		return ret;
 
-	*rdata = PWRAP_GET_WACS_RDATA(pwrap_readl(wrp, PWRAP_WACS2_RDATA));
+	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
+		*rdata = PWRAP_GET_WACS_RDATA(pwrap_readl(wrp,
+					      PWRAP_SWINF_2_RDATA_31_0));
+	else
+		*rdata = PWRAP_GET_WACS_RDATA(pwrap_readl(wrp,
+					      PWRAP_WACS2_RDATA));
 
 	pwrap_writel(wrp, 1, PWRAP_WACS2_VLDCLR);
 
@@ -1228,8 +1269,13 @@ static int pwrap_write16(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
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
@@ -1485,6 +1531,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 	case PWRAP_MT7622:
 		pwrap_writel(wrp, 0, PWRAP_CIPHER_EN);
 		break;
+	case PWRAP_MT6873:
 	case PWRAP_MT8183:
 		break;
 	}
@@ -1921,6 +1968,19 @@ static const struct pmic_wrapper_type pwrap_mt6797 = {
 	.init_soc_specific = NULL,
 };
 
+static struct pmic_wrapper_type pwrap_mt6873 = {
+	.regs = mt6873_regs,
+	.type = PWRAP_MT6873,
+	.arb_en_all = 0x777f,
+	.int_en_all = BIT(4) | BIT(5),
+	.int1_en_all = 0,
+	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
+	.caps = PWRAP_CAP_ARB,
+	.init_reg_clock = pwrap_common_init_reg_clock,
+	.init_soc_specific = NULL,
+};
+
 static const struct pmic_wrapper_type pwrap_mt7622 = {
 	.regs = mt7622_regs,
 	.type = PWRAP_MT7622,
@@ -1999,6 +2059,9 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
 		.compatible = "mediatek,mt6797-pwrap",
 		.data = &pwrap_mt6797,
 	}, {
+		.compatible = "mediatek,mt6873-pwrap",
+		.data = &pwrap_mt6873,
+	}, {
 		.compatible = "mediatek,mt7622-pwrap",
 		.data = &pwrap_mt7622,
 	}, {
@@ -2022,6 +2085,7 @@ MODULE_DEVICE_TABLE(of, of_pwrap_match_tbl);
 static int pwrap_probe(struct platform_device *pdev)
 {
 	int ret, irq;
+	u32 rdata;
 	struct pmic_wrapper *wrp;
 	struct device_node *np = pdev->dev.of_node;
 	const struct of_device_id *of_slave_id = NULL;
@@ -2116,14 +2180,22 @@ static int pwrap_probe(struct platform_device *pdev)
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
+	if (!(HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB)))
+		pwrap_writel(wrp, 0xf, PWRAP_WDT_UNIT);
+
 	/*
 	 * Since STAUPD was not used on mt8173 platform,
 	 * so STAUPD of WDT_SRC which should be turned off
@@ -2132,7 +2204,11 @@ static int pwrap_probe(struct platform_device *pdev)
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
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
