Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A3E109E52B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 01:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CbgWdtvoVS7M+6QnLSKprAcnYUtt5FoK/jELfbmZ4WY=; b=wtslbIszN07V48SY0acZtqOUwt
	J8wgBk04ClEic/CoiOqcEqJdxSc1YY/Fo7CUWP15scGWYFcY3sLW3NJ4Pi71sSC4WpBJQGl+b5fKV
	EfCgKO55eOQuGwy8fbdtsAEbnKtsKRehUC/2mxG9hjxFtzEHsIejmn31N3LmCVbSDjOx2n16QQg5N
	ZM3R4OM17lm+KTjIBA0dwNNwfIPbwugGDSAR+k3RYSGBSSFB+8YXmairFQwzgApO+7lNkKuv5wrJY
	QXlc1X1Ja75kb6EKD4AClLNl1LqWoOgnDAE4dejQWoRsXsiYQiPAVxALDXt/sFV1fCY8bNuBSuDuO
	beO/7q8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Z5f-00000004Urh-37hu;
	Thu, 26 Mar 2026 01:00:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Z5e-00000004UrK-2OAx;
	Thu, 26 Mar 2026 01:00:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E80860053;
	Thu, 26 Mar 2026 01:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4F2FC4CEF7;
	Thu, 26 Mar 2026 01:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774486848;
	bh=lyRbHi+OdyYuf4O4gqm9rBgjcRMxdLni+ze0KPaLbdQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=H8Ol9WCOVZKWHac5yz3H5F+i71pUzkU52JVRkesbRzWFHzi4pPJ/9R3RjS8pfOmtl
	 RFw31IgpV0OU7IoJq1GUpN3cc1y6bMNZfszIDb5BUgyf0fSvndxGB7bmAVeS8tuxjN
	 3ryzJQGk4q32diLDjYTLCbxSN8/POKjJwt7BcAU02DU4jB3ax7sqBWbJzr+5M+im0n
	 EslYP7j2DMzhgmlJUyY2CwNOIOmim/lS+KWwNugVkgDDs236l92Z0mj/+qnKCIuz0Z
	 DX42610j23h0HIGrEZuyDlqUW9e2vfeyak6wjpSzjnKLt6YCW9nyc/r+lVMkR+8FJK
	 9uYiKt/6pA6UA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0388109E52B;
	Thu, 26 Mar 2026 01:00:48 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 26 Mar 2026 03:00:47 +0200
Subject: [PATCH] clocksource/drivers/timer-mediatek: initialize GPT6 as
 system counter
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-archtimer-v1-1-5328574e5935@protonmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNT3cSi5IySzNzUIl1jU/MkA6M0cxMDUwsloPqCotS0zAqwWdGxtbU
 AfxNdA1sAAAA=
X-Change-ID: 20260325-archtimer-357b02f74058
To: Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Akari Tsuyukusa <akkun11.open@gmail.com>, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774486847; l=2040;
 i=rva333@protonmail.com; s=20260325; h=from:subject:message-id;
 bh=yXLTuLAUXSGAa9XhaQxQZMpIErABYX5VH7iq2PdHl/I=;
 b=CkjxoHpTP04gLssC28KwNiKO/2GD1L0djaFjsZPxG+Xdk1tr1Ar+H+0rQ8dlleGW5YWaDdQvz
 KXCJOx3HpXYB5CxlTCwQUDILFRGTPuOmHDxlW4PgJnhBEcsplRiSDro
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=euuVBZGtA2Cqb8Dju84qpQPhvwxyUirJlXpqEPQWKBM=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260325 with
 auth_id=695
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

On certain MediaTek SoCs like mt6572 (likely before the CPUXGPT was
introduced), the generic arch timer is fed by the GPT6. Some bootloaders
don't initialize it properly, leading to dead arch timer.

Fix this by configuring GPT6 when the MediaTek timer is probed. This
makes arch timer work properly and removes IPI overhead from MediaTek
timer broadcast when arch timer is used.

If the timer was configured by the bootloader, this change is no-op.

Tested-by: Akari Tsuyukusa <akkun11.open@gmail.com> # MT6589
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
On certain MediaTek SoCs like mt6572 (likely before the CPUXGPT was
introduced), the generic arch timer is fed by the GPT6. Some bootloaders
don't initialize it properly, leading to dead arch timer.

Fix this by configuring GPT6 when the MediaTek timer is probed. This
makes arch timer work properly and removes IPI overhead from MediaTek
timer broadcast when arch timer is used.

If the timer was configured by the bootloader, this change is no-op.
---
 drivers/clocksource/timer-mediatek.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/timer-mediatek.c
index 7bcb4a3f26fb..7de34cace572 100644
--- a/drivers/clocksource/timer-mediatek.c
+++ b/drivers/clocksource/timer-mediatek.c
@@ -22,6 +22,8 @@
 
 #define TIMER_SYNC_TICKS        (3)
 
+#define TIMER_SYSCNT            (6)
+
 /* gpt */
 #define GPT_IRQ_EN_REG          0x00
 #define GPT_IRQ_ENABLE(val)     BIT((val) - 1)
@@ -335,6 +337,9 @@ static int __init mtk_gpt_init(struct device_node *node)
 
 	mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
 
+	/* Configure GPT6 to feed arch timer */
+	mtk_gpt_setup(&to, TIMER_SYSCNT, GPT_CTRL_OP_FREERUN);
+
 	return 0;
 }
 TIMER_OF_DECLARE(mtk_mt6577, "mediatek,mt6577-timer", mtk_gpt_init);

---
base-commit: 05f7e89ab9731565d8a62e3b5d1ec206485eeb0b
change-id: 20260325-archtimer-357b02f74058

Best regards,
-- 
Roman Vivchar <rva333@protonmail.com>



