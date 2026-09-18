Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DC4EC982DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2026 14:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dmIt+nC5rd2B63RrYxnYEeZwslXtM3bAeP8pd+OZ6w4=; b=nYjKCR4/c8cMyB
	T4ctxMcEZyQ6r/3lj4rtqQzCWll3wkAUBQWuzX/4IrshrrpOpV5e+OCFe/6pnQuQJxycZxJPRRXzM
	nAdZL1xEODBE18Eu6x4q4PTP942PghMnmLv+SoTbGm1Lyik6+NaYIrTZbGxWvDWzgslX+EQfYpCNI
	p0av6P0dZ/H2DGgx8Ey2hiVyQPnzwxPsso1/gEx69b9c5Ez9wMHz1EV94oDmjcBxhB8uQQDLlgnyQ
	Lor1014IiEaNo/BadSa0EW7aXbiTOqIlIuOaK6SwTqm/xLOiwtbGXVeDw2ZuxVvpk6yeBcQUXMnwf
	PmliXmbmvKtNTrnwQsOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zjz-0000000Ek7i-0MNk;
	Fri, 18 Sep 2026 14:39:03 +0000
Received: from mxout3.routing.net ([134.0.28.8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Zjw-0000000Ek5f-202R;
	Fri, 18 Sep 2026 14:39:01 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 4997A6106A;
	Fri, 18 Sep 2026 14:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1789742334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dmIt+nC5rd2B63RrYxnYEeZwslXtM3bAeP8pd+OZ6w4=;
	b=DIczmh1QW3CrmlJdYweGLBd27MfDRxSr3sP8ngyBTsVk+rKApQ1IStr0zI8xU9hngM/Fss
	o36+TSC1S2dIkNpw2LZsT6U1y4ZL9kpHIf79QwUGxNl5NkofsTeO7Q5tXUXEt6JPlJrp+p
	rVxoq+zXyY2XROrjhVAW8VmS3C/qdA4=
Received: from frank-G5-5590 (fttx-pool-80.245.73.6.bambit.de [80.245.73.6])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 11D4E120181;
	Fri, 18 Sep 2026 14:38:54 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] arm64: dts: mediatek: mt7988a-bpi-r4pro: add names for i2c-to-gpio chip
Date: Fri, 18 Sep 2026 16:38:42 +0200
Message-ID: <20260918143846.30458-2-linux@fw-web.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918143846.30458-1-linux@fw-web.de>
References: <20260918143846.30458-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_073900_690613_97F05979 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add line-names for the PCA9555 i2c to gpio expander to have more
information in debugfs.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 .../mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
index 1eeb72108b9b..f54787fbbc71 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
@@ -315,6 +315,24 @@ pca9555: i2c-gpio-expander@20 {
 				reg = <0x20>;
 				gpio-controller;
 				#gpio-cells = <2>;
+
+				gpio-line-names =
+					"BKEY-A-PDN",	/* GPIO0 */
+					"BKEY-A-Vset",	/* GPIO1 */
+					"BKEY-B-PDN",	/* GPIO2 */
+					"BKEY-B-Vset",	/* GPIO3 */
+					"BKEY-C-PDN",	/* GPIO4 */
+					"BKEY-C-Vset",	/* GPIO5 */
+					"SIM_SEL",	/* GPIO6 */
+					"mPCIe_AB_Vset",/* GPIO7 */
+					"mPCIe_A_PDN",	/* GPIO8 */
+					"mPCIe_B_PDN",	/* GPIO9 */
+					"BKEY-A-RST",	/* GPIO10 */
+					"VBUS_AB_PDN",	/* GPIO11 */
+					"BKEY-B-RST",	/* GPIO12 */
+					"BKEY-C-RST",	/* GPIO13 */
+					"SYS_LEDB",	/* GPIO14 */
+					"SYS_LEDR";	/* GPIO15 */
 			};
 
 			rtc@51 {
-- 
2.53.0


