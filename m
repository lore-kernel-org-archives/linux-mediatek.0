Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E579C433FE
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Oct 2022 16:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ukf4dE615x0DESNVVTZIQKgBm7oCRLwwO/K4NDp2D4U=; b=h/5MYDyT7QmjQi
	XHTvOfIUqfr+8Mu0kmBNr8ajIWoBZzeAqdVTTmIRjVaXgLNI1PQ2tlrgnD2B1qBUsJySGzKvZZfny
	fDSbKwNHYOM1JRMoIbF1sV3l0uG7Xui2NpK2E8caR8bVX7eJ/tQV7916amkjtIBpnhljkpa/wsQ9a
	vY7Vtuvvxz3snXC20XmwQBbIH3YsCT3ZugfgZyPmFZvv6i42MN2WotA6LjZn5BDCeS2mTysbYTwqp
	eiOmIPEHb7t8MXVPyH9dvIWDD4HrgcPP/62aZNQjgKhNAZ3bE7n/LH534B9FeVMrnMgYFvpq1QZ9c
	rPks3qJEg7nYd5brEaWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohCxm-00DlCi-58; Sat, 08 Oct 2022 16:46:10 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohCxb-00Dl6Z-Hx; Sat, 08 Oct 2022 16:46:00 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id CDE6E1008F7;
	Sat,  8 Oct 2022 16:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1665247557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ukf4dE615x0DESNVVTZIQKgBm7oCRLwwO/K4NDp2D4U=;
	b=RGW/fnkVu099eEytt5RqUWDS3UiEsoxLt9uwoxVrN+7FkATC4gQCslUR3Hyiwhv+FNxbSc
	0H9+ektC1+w/udzgxvx9wZJlGN4HOe1SG1ml5kjdU132rGAaf1evJ4Th8sgibOJL4aT1Wx
	UfQBUZvuro6h4BYmiN6jTCsYsIS9U0I=
Received: from frank-G5.. (fttx-pool-217.61.149.60.bambit.de [217.61.149.60])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 1421710042C;
	Sat,  8 Oct 2022 16:45:57 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] hwrng: mediatek: add mt7986 support
Date: Sat,  8 Oct 2022 18:45:53 +0200
Message-Id: <20221008164553.113260-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 955c1372-43fb-49a3-a48a-2ecb07b1de5f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_094559_763103_D49E036B 
X-CRM114-Status: GOOD (  10.13  )
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, "Mingming.Su" <Mingming.Su@mediatek.com>, linux-crypto@vger.kernel.org, Olivia Mackall <olivia@selenic.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Mingming.Su" <Mingming.Su@mediatek.com>

1. Add trng compatible name for MT7986
2. Fix mtk_rng_wait_ready() function

Signed-off-by: Mingming.Su <Mingming.Su@mediatek.com>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/char/hw_random/mtk-rng.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/char/hw_random/mtk-rng.c b/drivers/char/hw_random/mtk-rng.c
index 6c00ea008555..aa993753ab12 100644
--- a/drivers/char/hw_random/mtk-rng.c
+++ b/drivers/char/hw_random/mtk-rng.c
@@ -22,7 +22,7 @@
 #define RNG_AUTOSUSPEND_TIMEOUT		100
 
 #define USEC_POLL			2
-#define TIMEOUT_POLL			20
+#define TIMEOUT_POLL			60
 
 #define RNG_CTRL			0x00
 #define RNG_EN				BIT(0)
@@ -77,7 +77,7 @@ static bool mtk_rng_wait_ready(struct hwrng *rng, bool wait)
 		readl_poll_timeout_atomic(priv->base + RNG_CTRL, ready,
 					  ready & RNG_READY, USEC_POLL,
 					  TIMEOUT_POLL);
-	return !!ready;
+	return !!(ready & RNG_READY);
 }
 
 static int mtk_rng_read(struct hwrng *rng, void *buf, size_t max, bool wait)
@@ -179,6 +179,7 @@ static const struct dev_pm_ops mtk_rng_pm_ops = {
 #endif	/* CONFIG_PM */
 
 static const struct of_device_id mtk_rng_match[] = {
+	{ .compatible = "mediatek,mt7986-rng" },
 	{ .compatible = "mediatek,mt7623-rng" },
 	{},
 };
-- 
2.34.1


