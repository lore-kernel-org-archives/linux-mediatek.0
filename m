Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4D3C5AD4E
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2026 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chm6WJqiFBjd1MryQLxTRtBK0kEL/sJhlApC0WV8UjY=; b=DgxZDop9yVvUVGwJJQirfYpiBJ
	JeDfkrP93h8/QPli7sjPD6ZKEKoUSDys+114iMBFqHZPSoN9H79NMnxJx1366KW4w5BO3alyiSsbY
	pQcON83lL4qEyoSH0+hYspJ9TtxkGvyA2sdtNcqnMQhDEmjIIjQHfceoEVitcPb+gVgswstuh4N6h
	jZTJaFDsgz2nEp4X7VjsTy25IxwgAwznjaOP1NxM+zDunq5yAo+DWL5LMyv1BfD4QR2+B95SP3+Pn
	FvgvI0+4/P1z1AFvsbTGEQVB4VxlgwfRL6ZuOPKC4ZkIwlpoXBo5pXQF47ddtSnpMwYVFzrpSP963
	OY7XZDXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63a-0000000ATWQ-0F3H;
	Sun, 09 Aug 2026 16:07:26 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt63V-0000000ATNq-2dIm
	for linux-mediatek@lists.infradead.org;
	Sun, 09 Aug 2026 16:07:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49553515a8bso16954325e9.1
        for <linux-mediatek@lists.infradead.org>; Sun, 09 Aug 2026 09:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786291640; x=1786896440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=chm6WJqiFBjd1MryQLxTRtBK0kEL/sJhlApC0WV8UjY=;
        b=CuthCgv67uBRYA5lbjpxfiyDhLIfXFcvLyAH36s4GNMh0x2ZlPxAWy23fyy5OiOpGI
         HVPnlhrTr0S4qHa4P8CItQ4ikLP963V3dYcIezdaYTpcPXyMrUFctfNVpclkM7CBzvzU
         MkNxPW4JexIjkXPkJH26wCLUhaYd+FAt0I0ZazqHVv+3W5BPDIwVaOmrk1iLOvjzTJKn
         7wPkWCnNyRnrKWcBeIbiY6WCS4XAH/xch919wtGydDK827RbP7MGQ2JE25MuaS2z5Jsp
         LE/NLdIN1ptCUTb0eyca0DVYsR0Oe4LguqY8c0XfYdTirRcN5I3RDKWS7VwZ8Txzn6a1
         4JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786291640; x=1786896440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=chm6WJqiFBjd1MryQLxTRtBK0kEL/sJhlApC0WV8UjY=;
        b=qEyt5cHIOQ9NB8qROtUx71futUe6US0S+5gjabNWRPkmcqmiVdn+Z5ID8Vvw5mDAK8
         Sr1X4Ir4Nr+tZI38EGVzWzO54+wuKRIAa4VVj+W6WztVfokEp7wxTkqGYPqdlYyCBI/U
         bVR1iFfGrBFCpkYCVv//f0IzUCP/xzJ9HpMDz74vXNt0FCL6xsrP+0iYiZRd/Zm78gr2
         t2YsLLCHyBR0e1CFKCgqEgElbGOZceqV64YDxm5M/YBr8Hej43AAze+vBtCY84US1oHD
         xUqN5I4N0eazYIBF7MLHwcuNS8XTmAGdaRtRo/l/n4sinCNrioGG0Up/OEMD+4Z5DndJ
         yDpg==
X-Gm-Message-State: AOJu0YxA3mdGKnkAi9ZGE4oV1hextrnzNcWG6Lz9fz14Jb2h3SMwRaEB
	pe0Isf0V6W8izIg6PnASDn7ulPWHG909CrZpm0hGIfVNi0nPqA8TdY4ZDzcD8PgSplncIw==
X-Gm-Gg: AR+sD11u1wvrKkYLmZ5KxIrRqjpLBAqj5aTX8rvHYkfCosZEs+en0TbU6izOncl/RLt
	uz+nPonaFdtzsxdBZr0sn2076M3LBKyP2iynxDIxDhJwv7quJJDcNFKkJOVcOXNCu9X0Mki6KXo
	CHf05i94j5TebDP9d7BbsYXYFwA4YNLhTNoW90m+caiJlSDMbb5ZsUB0/vbRsM4G20QRD4fk+8R
	BvIskTe4dv7bpMJnJebnbJW5SNPiBMs8DKg8gVaOKeX9ncT0I4mZIMi1FvC6X775Amea1Y4BBwb
	aFRnN9G+YA3jtARfS4X6u+4jWHl4pUDoHbBSTlJ9WwxQ+Llll9oyvVLZ56LNh+kMvNtp4HdDSIP
	RHOf7zhbBk3j4n5vMai32L/ty0qM2FXco2GZWj2pqzeOzD6YGSyPywYMnUG0fJeWrvmU99q5tDp
	6NnsffWrTdS+gvhp7eKS23DEgoMZ9IeS9T7JX0uVPeCNqqv0GowT3Q+Hozuf7CC1YD
X-Received: by 2002:a7b:c7d3:0:b0:496:c977:3b6d with SMTP id 5b1f17b1804b1-49959e2f01bmr250237915e9.12.1786291639315;
        Sun, 09 Aug 2026 09:07:19 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995c7b2b68sm209832495e9.4.2026.08.09.09.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 09:07:18 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 7/8] arm64: dts: mt8167: Properly describe the SoC watchdog
Date: Sun,  9 Aug 2026 18:03:31 +0200
Message-ID: <20260809160643.33991-8-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260809160643.33991-1-l.scorcia@gmail.com>
References: <20260809160643.33991-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_090721_697098_DB322A7F 
X-CRM114-Status: GOOD (  11.59  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and the reset bits are
different from mt6589.

Use the dedicated mediatek,mt8167-wdt compatible for the watchdog driver,
as it correctly describes the SoC resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..edfffe35ec14 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8167-clk.h>
 #include <dt-bindings/memory/mt8167-larb-port.h>
 #include <dt-bindings/power/mt8167-power.h>
+#include <dt-bindings/reset/mediatek,mt8167-resets.h>
 
 #include "mt8167-pinfunc.h"
 
@@ -95,6 +96,13 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
-- 
2.43.0


