Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2726C61D97
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 12:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KpBUxqYvBKX4tX03KjbJxbiKYB0CW1q5AbspkuYc90k=; b=wZh13D0CZW0vGpLo6v8pfA7TJn
	tJtcK3R01kduhdHyyEWmYt3HTdIXQl9yyeUa3eTiZZbccdlNTeL10ojGzdw8K5jVe4dfsAydSmNBa
	eWyv7ux838+6wWWEpieSXtBD+3Wz987n0y9Gja0rKI0ONBh8VaPaKDFlzcLJL+woBZpQhvP+FUrJ+
	qxDeFNwH949DhZYqDNqlZdbkW+qgjmSpa+ZxOUomcOHvO8q1Etcga0M/rsK3Xxh8WLoa57qoY1fRr
	2FM5laAl0Guu4geLMnNsf5BBPK8m5KCPxeRK8XyVzuAmUacmsNnG5DTMXfN3iI29MH29nY2dzVsvp
	3ROtbVZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QES-00Gkie-1Z;
	Tue, 21 Nov 2023 12:52:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QDd-00Gk1u-0V;
	Tue, 21 Nov 2023 12:51:10 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 16530660731B;
	Tue, 21 Nov 2023 12:51:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700571067;
	bh=XEVVBoXHkUpKz+mYu2BhuD+v7qTvXaba6bcEiQ5SYSg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MZro2lpEW2iayt+uvYR2PTq9KhFa++lNx+CbzXMb7cp3Ubs0sFYy4r78aUbs/fvpg
	 UH8SHKdesT/NlI//U1jqxnS1toFZ5MWz1lNuyZKDGrEa/rzp4P/ZTsqHQBIsbzRlp2
	 YVJjVdpWaVxlz9MHvFHIPIylXH54DLlstNsxIpSMEqEAt3+wxN5syNY2WpYRMG5MOq
	 JTa3vp1ecqa2ak+7zz1hJXTYAu+ukJJDGN/NRUKyiPQC5gj+nEMxUa9ijkRcAcUsXb
	 qvs2VoU7LgveWfsgQzDB6at+oArRypvPS8vZDUi8P3kXxtV3l+SNXkZ3CxeWO2NCEF
	 gPs80gfSkhxkQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v3 16/20] soc: mediatek: mtk-svs: Check if SVS mode is available in the beginning
Date: Tue, 21 Nov 2023 13:50:40 +0100
Message-ID: <20231121125044.78642-17-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121125044.78642-1-angelogioacchino.delregno@collabora.com>
References: <20231121125044.78642-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_045109_353661_BDC5FA58 
X-CRM114-Status: GOOD (  13.70  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The svs_init01() and svs_init02() functions are already checking if the
INIT01 and INIT02 modes are available - but that's done in for loops and
for each SVS bank.

Give those a shortcut to get out early if no SVS bank features the
desired init mode: this is especially done to avoid some locking in
the svs_init01(), but also to avoid multiple for loops to check the
same, when no bank supports a specific mode.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index ae0cc22a2941..16a16c5a3f24 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1400,6 +1400,16 @@ static irqreturn_t svs_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static bool svs_mode_available(struct svs_platform *svsp, u8 mode)
+{
+	int i;
+
+	for (i = 0; i < svsp->bank_max; i++)
+		if (svsp->banks[i].mode_support & mode)
+			return true;
+	return false;
+}
+
 static int svs_init01(struct svs_platform *svsp)
 {
 	struct svs_bank *svsb;
@@ -1408,6 +1418,9 @@ static int svs_init01(struct svs_platform *svsp)
 	int ret = 0, r;
 	u32 opp_freq, opp_vboot, buck_volt, idx, i;
 
+	if (!svs_mode_available(svsp, SVSB_MODE_INIT01))
+		return 0;
+
 	/* Keep CPUs' core power on for svs_init01 initialization */
 	cpuidle_pause_and_lock();
 
@@ -1575,6 +1588,9 @@ static int svs_init02(struct svs_platform *svsp)
 	int ret;
 	u32 idx;
 
+	if (!svs_mode_available(svsp, SVSB_MODE_INIT02))
+		return 0;
+
 	for (idx = 0; idx < svsp->bank_max; idx++) {
 		svsb = &svsp->banks[idx];
 
-- 
2.42.0


