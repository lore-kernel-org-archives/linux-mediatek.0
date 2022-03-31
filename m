Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F435C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 07:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ro5ccLsH1RR9FTQy916FcbWExZOUjzQkrISAF3jMt0s=; b=wxNh/pachS9W5I
	ypRuAZpkasMGEgPYR2NTUemdarcEFq12co4XIRibgPAM3aBgncwgU8Nc2xpJq1/QHv2Ca0lJzVo9U
	s0/qYrtuYBfcPsPmCnq2SI3/eZZEGqppl5ySL9/g2kQJcNOTMGbtYQKj2wMx4hMmVwEaTY6W1WwWw
	k8T95fyZY1VavDgffjqtD2io48TMm8QnXO7gLLLPefUiEjAsB46WFbNydl1elH+7wKuxDVR/yimPl
	+0nojU5ZG/rvjWd50wgWOsEriZr/Ekod/+/su8yUoi+tGYFAbu4nTE/fQB97GBjyfSKscZncUuyl5
	XSws8pHBVvwCN1O5qm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZpi2-001ATn-Mi; Thu, 31 Mar 2022 07:59:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZphK-001AGE-UU; Thu, 31 Mar 2022 07:58:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 944311F463AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1648713503;
 bh=y3JCRm10jYxeUBsRwyqWt92P6frgVizXaZzEykkJWO8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iElVHcm3V0A28bXHHrDfLYiPxF5y1hTcV5eWdK17MGp12rzIxXrdzD1EaWT4bY79k
 z89udUzUa8Y2jfLsL2p28HVqmbrzyawEcI11R9otwlT69r+AXcz1i6vRIWVqPz79Zi
 R+dIbiZj2+FUVP/p2Jmkr5y6GSJbpFQIqBGyV4dZH1/dPQaIwmXjHyEP5xniMxBvlC
 cRzWcWu7mxZPuU20Xc0UZhuIrtTvZjS+l8ps79uG+OuNDFThkix1/48SK6u4k0ZsSD
 eZxfh6C7W5nadUHsFPDTaqjobJpwXxQoIrFPAKPBlJMNq2i7bbh49FoPWNCzJ6Pdc3
 qJ03/MRTjkIDA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 1/3] soc: mediatek: pwrap: Use readx_poll_timeout() instead
 of custom function
Date: Thu, 31 Mar 2022 09:58:15 +0200
Message-Id: <20220331075817.7122-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331075817.7122-1-angelogioacchino.delregno@collabora.com>
References: <20220331075817.7122-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_005827_300927_0E4408C3 
X-CRM114-Status: GOOD (  13.08  )
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

Function pwrap_wait_for_state() is a function that polls an address
through a helper function, but this is the very same operation that
the readx_poll_timeout macro means to do.
Convert all instances of calling pwrap_wait_for_state() to instead
use the read_poll_timeout macro.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 60 +++++++++++++++-------------
 1 file changed, 33 insertions(+), 27 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index bf39a64f3ecc..54a5300ab72b 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -13,6 +13,9 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#define PWRAP_POLL_DELAY_US	10
+#define PWRAP_POLL_TIMEOUT_US	10000
+
 #define PWRAP_MT8135_BRIDGE_IORD_ARB_EN		0x4
 #define PWRAP_MT8135_BRIDGE_WACS3_EN		0x10
 #define PWRAP_MT8135_BRIDGE_INIT_DONE3		0x14
@@ -1241,27 +1244,14 @@ static bool pwrap_is_fsm_idle_and_sync_idle(struct pmic_wrapper *wrp)
 		(val & PWRAP_STATE_SYNC_IDLE0);
 }
 
-static int pwrap_wait_for_state(struct pmic_wrapper *wrp,
-		bool (*fp)(struct pmic_wrapper *))
-{
-	unsigned long timeout;
-
-	timeout = jiffies + usecs_to_jiffies(10000);
-
-	do {
-		if (time_after(jiffies, timeout))
-			return fp(wrp) ? 0 : -ETIMEDOUT;
-		if (fp(wrp))
-			return 0;
-	} while (1);
-}
-
 static int pwrap_read16(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
 {
+	bool tmp;
 	int ret;
 	u32 val;
 
-	ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
+	ret = readx_poll_timeout(pwrap_is_fsm_idle, wrp, tmp, tmp,
+				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
 	if (ret) {
 		pwrap_leave_fsm_vldclr(wrp);
 		return ret;
@@ -1273,7 +1263,8 @@ static int pwrap_read16(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
 		val = (adr >> 1) << 16;
 	pwrap_writel(wrp, val, PWRAP_WACS2_CMD);
 
-	ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_vldclr);
+	ret = readx_poll_timeout(pwrap_is_fsm_vldclr, wrp, tmp, tmp,
+				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
 	if (ret)
 		return ret;
 
@@ -1290,11 +1281,14 @@ static int pwrap_read16(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
 
 static int pwrap_read32(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
 {
+	bool tmp;
 	int ret, msb;
 
 	*rdata = 0;
 	for (msb = 0; msb < 2; msb++) {
-		ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
+		ret = readx_poll_timeout(pwrap_is_fsm_idle, wrp, tmp, tmp,
+					 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
+
 		if (ret) {
 			pwrap_leave_fsm_vldclr(wrp);
 			return ret;
@@ -1303,7 +1297,8 @@ static int pwrap_read32(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
 		pwrap_writel(wrp, ((msb << 30) | (adr << 16)),
 			     PWRAP_WACS2_CMD);
 
-		ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_vldclr);
+		ret = readx_poll_timeout(pwrap_is_fsm_vldclr, wrp, tmp, tmp,
+					 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
 		if (ret)
 			return ret;
 
@@ -1323,9 +1318,11 @@ static int pwrap_read(struct pmic_wrapper *wrp, u32 adr, u32 *rdata)
 
 static int pwrap_write16(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
 {
+	bool tmp;
 	int ret;
 
-	ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
+	ret = readx_poll_timeout(pwrap_is_fsm_idle, wrp, tmp, tmp,
+				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
 	if (ret) {
 		pwrap_leave_fsm_vldclr(wrp);
 		return ret;
@@ -1344,10 +1341,12 @@ static int pwrap_write16(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
 
 static int pwrap_write32(struct pmic_wrapper *wrp, u32 adr, u32 wdata)
 {
+	bool tmp;
 	int ret, msb, rdata;
 
 	for (msb = 0; msb < 2; msb++) {
-		ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle);
+		ret = readx_poll_timeout(pwrap_is_fsm_idle, wrp, tmp, tmp,
+					 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
 		if (ret) {
 			pwrap_leave_fsm_vldclr(wrp);
 			return ret;
@@ -1388,6 +1387,7 @@ static int pwrap_regmap_write(void *context, u32 adr, u32 wdata)
 
 static int pwrap_reset_spislave(struct pmic_wrapper *wrp)
 {
+	bool tmp;
 	int ret, i;
 
 	pwrap_writel(wrp, 0, PWRAP_HIPRIO_ARB_EN);
@@ -1407,7 +1407,8 @@ static int pwrap_reset_spislave(struct pmic_wrapper *wrp)
 		pwrap_writel(wrp, wrp->master->spi_w | PWRAP_MAN_CMD_OP_OUTS,
 				PWRAP_MAN_CMD);
 
-	ret = pwrap_wait_for_state(wrp, pwrap_is_sync_idle);
+	ret = readx_poll_timeout(pwrap_is_sync_idle, wrp, tmp, tmp,
+				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
 	if (ret) {
 		dev_err(wrp->dev, "%s fail, ret=%d\n", __func__, ret);
 		return ret;
@@ -1458,14 +1459,15 @@ static int pwrap_init_sidly(struct pmic_wrapper *wrp)
 static int pwrap_init_dual_io(struct pmic_wrapper *wrp)
 {
 	int ret;
+	bool tmp;
 	u32 rdata;
 
 	/* Enable dual IO mode */
 	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_DIO_EN], 1);
 
 	/* Check IDLE & INIT_DONE in advance */
-	ret = pwrap_wait_for_state(wrp,
-				   pwrap_is_fsm_idle_and_sync_idle);
+	ret = readx_poll_timeout(pwrap_is_fsm_idle_and_sync_idle, wrp, tmp, tmp,
+				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
 	if (ret) {
 		dev_err(wrp->dev, "%s fail, ret=%d\n", __func__, ret);
 		return ret;
@@ -1570,6 +1572,7 @@ static bool pwrap_is_pmic_cipher_ready(struct pmic_wrapper *wrp)
 static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 {
 	int ret;
+	bool tmp;
 	u32 rdata = 0;
 
 	pwrap_writel(wrp, 0x1, PWRAP_CIPHER_SWRST);
@@ -1624,14 +1627,16 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 	}
 
 	/* wait for cipher data ready@AP */
-	ret = pwrap_wait_for_state(wrp, pwrap_is_cipher_ready);
+	ret = readx_poll_timeout(pwrap_is_cipher_ready, wrp, tmp, tmp,
+				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
 	if (ret) {
 		dev_err(wrp->dev, "cipher data ready@AP fail, ret=%d\n", ret);
 		return ret;
 	}
 
 	/* wait for cipher data ready@PMIC */
-	ret = pwrap_wait_for_state(wrp, pwrap_is_pmic_cipher_ready);
+	ret = readx_poll_timeout(pwrap_is_pmic_cipher_ready, wrp, tmp, tmp,
+				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
 	if (ret) {
 		dev_err(wrp->dev,
 			"timeout waiting for cipher data ready@PMIC\n");
@@ -1640,7 +1645,8 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 
 	/* wait for cipher mode idle */
 	pwrap_write(wrp, wrp->slave->dew_regs[PWRAP_DEW_CIPHER_MODE], 0x1);
-	ret = pwrap_wait_for_state(wrp, pwrap_is_fsm_idle_and_sync_idle);
+	ret = readx_poll_timeout(pwrap_is_fsm_idle_and_sync_idle, wrp, tmp, tmp,
+				 PWRAP_POLL_DELAY_US, PWRAP_POLL_TIMEOUT_US);
 	if (ret) {
 		dev_err(wrp->dev, "cipher mode idle fail, ret=%d\n", ret);
 		return ret;
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
