Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDD0FED9F6
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Mar 2026 18:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTAXSeu6BtwHvgdghXlLX79R1MN9WAcZ3+G+4vaYWf4=; b=fPkLhqmGfXLEDeglf598ajqpje
	sQ53vBoG4UYhbodol/SSq/SxveWj5UqaaVvTYZaR6ca8lLVa+z65PprD7os1VtMIz1OALAJUMvuSR
	GaTCgol8A2u1t/7fHtKYfP5tbbxoePlM0GMzaHnHQaDxoxZy09rKstYxwJp0974BDHEs2iUK8ZTFl
	h7k7SKPDl1yNFvTlKjAqb4pUS+E8bWU5Tmst9JR2sEKLALxBMIjXg/LO+VKajarpHNlPrJOnhD0GK
	G7SioLkTkVJ7D3tqZqTSQJGx2FFSnqHWNgOUB5kYuvDjFCXkTSLKxJ45KBm86NbWDJaYkcKeBj1ra
	S+Zx/lLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZQE-000000074IW-3ymD;
	Tue, 17 Mar 2026 18:45:42 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ZQC-000000074HI-3F80
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Mar 2026 18:45:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-48628ce9ab5so14360375e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Mar 2026 11:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773773138; x=1774377938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pTAXSeu6BtwHvgdghXlLX79R1MN9WAcZ3+G+4vaYWf4=;
        b=jx8AoyGGsIBx+lO/CIEFSulHa7GvVKeSQr9FaWhbsh+nARV6/xHpJBBVsQYozk+Teb
         1Jekg9PXPzVYgNZkEGvwPCsiTxKe1fPUvbDsc62XzR+VHkM46f9LNdEX6JjMruP6gRnl
         VstRZTC6RGXWiWaVex7uCnKNV7uF39ZLMBmz8QMhKbuR1Bg+dsC/FciHOIbuq899yp2w
         NwCXpznp6onOludHzOUKLhhQQCbcmyN/Rxbdmv/rFLhmbux0QhN6XkCGoDYoiUhhXOhd
         Hsv4yCKbDNcbbZom2Fe3NQAxv0QCwFmqkYxOAPbwffL1yRAPWG4nQC9CNOFuoqXmRh77
         d+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773773138; x=1774377938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pTAXSeu6BtwHvgdghXlLX79R1MN9WAcZ3+G+4vaYWf4=;
        b=Bi+yA58ugr++8Wdgq3r5SlIzmdt+MrULQOHSYPj1CB4onFJOfwNEQafz+Zw4FGra4K
         SPCZyi+dSPh1VzcTecu5Un0XYVE+SGZ5G1lWB10Gh+z1sXJx1DXg/KukN1K2HvQJw5Lm
         v/tKEbN5YKa+tbJbMWi+2kmfo11khibieCGp1SBMQtQmLR0YN2oB6MA0xjio9LlMgHBo
         1dg6Saug2oMJjQCdZpWXnlytz3LRZK3euU+m1KeuaezqMZwxh7jV6bm85E+Brer/NXqF
         tT0Sgz/jG1QT43porEeYULLW/yyg7FpuP4zvCZH+zNHYFoFz0On6b216u7u4IcZTUClv
         3SEA==
X-Gm-Message-State: AOJu0YwuNqwegKQRLjDPUB1CtgyTvaJm3WhcPjKxix040hiQ+1cWzPrU
	YpIdtP9qD3hdmGm9/dMDaOALWHUs+XWQGSsX7HEdTw4VMVAXDZK8MpcjfZA2WDC4
X-Gm-Gg: ATEYQzxMwEgVNuL3mcYZMOmljJrZz/wRt5YfJa+wXzbgXBDWsQs4ghSmIA+OrhJap1m
	FNLP7RdQfudDwpUk1MbtSL5E3DiaGos9XEnldOFJunmSJsJVR7X6KkxkMMxeKytuJ5oCkFzpuA0
	RXl2m6qilVvM/ZUro/TyZpjP8T1TDJpg6KzKCO3lSda85K/22c82CNorZTSnmucBN4D5UhVtq55
	DEHXrvr0JhE8OYXCyAL6WOK0AbpOgLWKPYij5Vm06X9A7oGh2FSi/8buyhmKeiRIhNkShpTO/4J
	NuRZqb5zVRiNYieNKXi8qjyi7lPEmTNSUVdqUwYDOSdN+IKfB/ke01msVQ12nDlavp0q91aUrKp
	ZyogsKf5MMS4+5F38qaHSXUQnca+WPvB0ksh64IVtaf56yA5LiRguVw9/easNt63sh5pl1RImfH
	A8Yw1rkkrjXemjY749uWM=
X-Received: by 2002:a05:600c:1d0c:b0:485:3d00:efd with SMTP id 5b1f17b1804b1-486f442df4bmr10381735e9.7.1773773138294;
        Tue, 17 Mar 2026 11:45:38 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4ba760esm102725e9.24.2026.03.17.11.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 11:45:37 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v3 1/9] dt-bindings: mfd: mt6397: Add bindings for MT6392 PMIC
Date: Tue, 17 Mar 2026 18:43:04 +0000
Message-ID: <20260317184507.523060-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317184507.523060-1-l.scorcia@gmail.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_114540_820610_19528A3C 
X-CRM114-Status: UNSURE (   8.93  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Fabien Parent <parent.f@gmail.com>

Add the currently supported bindings for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../devicetree/bindings/mfd/mediatek,mt6397.yaml         | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 6a89b479d10f..22b09e148d7c 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -40,6 +40,10 @@ properties:
           - mediatek,mt6358
           - mediatek,mt6359
           - mediatek,mt6397
+      - items:
+          - enum:
+              - mediatek,mt6392
+          - const: mediatek,mt6323
       - items:
           - enum:
               - mediatek,mt6366
@@ -68,6 +72,10 @@ properties:
               - mediatek,mt6331-rtc
               - mediatek,mt6358-rtc
               - mediatek,mt6397-rtc
+          - items:
+              - enum:
+                  - mediatek,mt6392-rtc
+              - const: mediatek,mt6323-rtc
           - items:
               - enum:
                   - mediatek,mt6366-rtc
@@ -92,6 +100,7 @@ properties:
               - mediatek,mt6328-regulator
               - mediatek,mt6358-regulator
               - mediatek,mt6359-regulator
+              - mediatek,mt6392-regulator
               - mediatek,mt6397-regulator
           - items:
               - enum:
-- 
2.43.0


