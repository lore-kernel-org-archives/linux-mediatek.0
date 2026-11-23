Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F02B606A32E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 18:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=n/oPniDq;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YxHbG4Qj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=U1MSPx3VfyoIifR48nEATYANkG7RJJfwnA8zIXFxovA=; b=n/oPniDqYYWRhT
	dtMvx0P1dGfw1qod3ubTg9JnIoh+WqvuoavCM4lQBrrej6S0ipTmnKjWyqq+KqPtMJIzdvxJMLSLl
	Y0R1RC0pPMyyL7fwMgzSB15yWXTSAQrkHNJn1pCILRYVUJAmQ192+zAgJnMSwYZ0MZHGo0DkIVHJX
	A0LyR7lyZltlnTKZyttWmZ52wdOwAZ8VkWlFtiDdrXiw3nzYrJ0MkuTBy3J1TYPc1/6MvTxhgwtpo
	6jtb5IAsQTCYx6McCSC9E1diow5XY9/c+BHcoqJFHNG8P3L5i66Px1RkZJunKToEm30M59RiFb83i
	YBqypkPi7brl/cEX9WDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYql-00000004VBk-01tU;
	Mon, 23 Nov 2026 18:33:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYqc-00000004V9R-3Jaf;
	Mon, 23 Nov 2026 18:33:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3230E446FF;
	Mon, 23 Nov 2026 18:33:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD83A1F000C4;
	Mon, 23 Nov 2026 18:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795458781;
	bh=U1MSPx3VfyoIifR48nEATYANkG7RJJfwnA8zIXFxovA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YxHbG4QjoBEKcii62/p3xWuNgfK5sV5ywr53zd7ByLM327S1//TTe0j61atw+hNzP
	 l7BX91cdgPODL6eKAUZQIVWJ38hyog4Ez9fGDgucWrQY2CtQs6kAaLKM1ZBUaKHbMM
	 hjZKaJ7mWvsJ6q9tjUZ/OhkFr3eR+w0qVmHkKs446j4jx/OyJsGm3ObXtf6fGRPwOq
	 +clCPN8Hhd9YZPplHL3Dvo6XSCQdBJH4gkeiHV5HTZyEfq7zJV1JSVc7yHLHdQI8d/
	 56nHAguwU8BaPBUeddkHI/PvGvdrgLLUqP7h2HtqaJawFEolx0h9wrSqggaeD+TKZu
	 xeuwW0rqFxbwA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Mattijs Korpershoek <mkorpershoek@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fengping Yu <fengping.yu@mediatek.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH 08/10] Input: mt6779-keypad - enable keypad clock before programming registers
Date: Mon, 23 Nov 2026 18:31:14 +0000
Message-ID: <20261123183200.3900004-9-lee@kernel.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
In-Reply-To: <20261123183200.3900004-1-lee@kernel.org>
References: <20261123183200.3900004-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt6779_keypad_pdrv_probe() writes the debounce and matrix selection
registers over MMIO before acquiring and enabling the "kpd" clock via
devm_clk_get_enabled().

When the keypad clock is gated off at boot or its clock provider defers
probe, accessing unclocked keypad MMIO registers can trigger a bus abort
or silently drop the configuration writes.

Acquire and enable the "kpd" clock before accessing the keypad
registers.

Fixes: f28af984e771 ("Input: mt6779-keypad - add MediaTek keypad driver")
Closes: https://sashiko.dev/#/bug/linux-fc15622a-407a-48b2-88db-195cdb311dbf
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/input/keyboard/mt6779-keypad.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/input/keyboard/mt6779-keypad.c b/drivers/input/keyboard/mt6779-keypad.c
index 60e6ad97cf59..a9f62f02439e 100644
--- a/drivers/input/keyboard/mt6779-keypad.c
+++ b/drivers/input/keyboard/mt6779-keypad.c
@@ -195,6 +195,10 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 
 	input_set_capability(keypad->input_dev, EV_MSC, MSC_SCAN);
 
+	keypad->clk = devm_clk_get_enabled(&pdev->dev, "kpd");
+	if (IS_ERR(keypad->clk))
+		return PTR_ERR(keypad->clk);
+
 	regmap_write(keypad->regmap, MTK_KPD_DEBOUNCE,
 		     (debounce * (1 << 5)) & MTK_KPD_DEBOUNCE_MASK);
 
@@ -208,10 +212,6 @@ static int mt6779_keypad_pdrv_probe(struct platform_device *pdev)
 	regmap_update_bits(keypad->regmap, MTK_KPD_SEL, MTK_KPD_SEL_COL,
 			   MTK_KPD_SEL_COLMASK(keypad->n_cols));
 
-	keypad->clk = devm_clk_get_enabled(&pdev->dev, "kpd");
-	if (IS_ERR(keypad->clk))
-		return PTR_ERR(keypad->clk);
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
-- 
2.56.1.750.gf70dc682cf-goog


