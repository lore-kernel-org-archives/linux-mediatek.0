Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1363AFF8867
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2026 09:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbFTOOkv6dPtgzTmCiIAdOPhV8eruPa0S/zqRRv5UlQ=; b=A2wE86hAHzipcrgQSClLPKv05A
	HxbliSmHQsmfOH91yuFktd8pUt71cboJdA3vnGDWsin+RzRsBhQw4hTcyqO8XnXRudysJlqBHRedR
	c2ciEP77VYSoVpI2ZYIjryLnNUKSeO/gfUqVdYcQehW4W9i4GIO1FaFcTfKCkk2VSVgDE1g0hZicQ
	tOsjeg4N7Xps7C78uYjhTckVWJs6klsRNgIpbsVEMEHYH8fzFkIN5rqyQI4Dsth9ENGkfI5dwbwSF
	KLxIaYW/lIabV1OZjFkKRYT1Pf0wh6Ec+piBSadnoB90i+LeU3I8Mrt8Wf+0NcfpC9bwBGO+iOGbN
	DiYkL0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Tx-00000003Mw8-0sPv;
	Wed, 29 Apr 2026 09:45:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1Tk-00000003Mje-1uty;
	Wed, 29 Apr 2026 09:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777455909;
	bh=bh0uY2NrxRuSPR7bJjjP3NnW4WJYh4INGqbmgLPQ6JI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fHFA8Omt7vbqDuLprpTF1JdYKuemipqgH3jAcgV/aK73g6KhdFhznbNEXObTIKX9q
	 Vdz92SKJ9ZRsV9zWGACUr+P+wdm3fviE6U89yG7m4mxPLMt2vANzigzGxIGAl8Uend
	 o2bwtkv/z1T2M6TDMZkMPX+bWkzROHRmtxrGDE7PptFpYl68OJELaVI+spLOD0hIJ0
	 ynLB5/C3oUsfVbWd3wQs9s6tgWOxGkJ/V/0Et0C9j9RXZk5BoucInxMntyf16TBtwK
	 T9xNHusPsDz3SO5EY81m6dUfgZnLIpkuJimA7VuhbDrGeaTTru+B3jUZGlNQFAa3z6
	 JuJx2JxWlJ1yg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 35C4417E1513;
	Wed, 29 Apr 2026 11:45:08 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Apr 2026 11:44:16 +0200
Subject: [PATCH 3/9] dt-bindings: input: mediatek,pmic-keys: Add MT6365
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260429-mediatek-genio-mt6365-cleanup-v1-3-6f43838be92f@collabora.com>
References: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Chen Zhong <chen.zhong@mediatek.com>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-input@vger.kernel.org, linux-iio@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777455902; l=1402;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=bh0uY2NrxRuSPR7bJjjP3NnW4WJYh4INGqbmgLPQ6JI=;
 b=+JPMFfnaPFBWysGTvk1GTeK7AFS9wWrVKFQUF2Z5aaZggdcTGDcPaH5YlQNjkNQdVbgCONTo7
 9h7Qty+RGpCDwV9DU6G7SJuNPMpjs/2W8mn/F962wGajQ3ebMouiZpx
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_024512_720442_E7DA4B87 
X-CRM114-Status: UNSURE (   9.94  )
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

Add compatible string for the pmic keys block found on the MT6365 PMIC,
that is compatible with the one found in MT6359.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../bindings/input/mediatek,pmic-keys.yaml          | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index b95435bd6a9b..140a862ecfbe 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -23,14 +23,19 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt6323-keys
-      - mediatek,mt6328-keys
-      - mediatek,mt6331-keys
-      - mediatek,mt6357-keys
-      - mediatek,mt6358-keys
-      - mediatek,mt6359-keys
-      - mediatek,mt6397-keys
+    oneOf:
+      - enum:
+          - mediatek,mt6323-keys
+          - mediatek,mt6328-keys
+          - mediatek,mt6331-keys
+          - mediatek,mt6357-keys
+          - mediatek,mt6358-keys
+          - mediatek,mt6359-keys
+          - mediatek,mt6397-keys
+      - items:
+          - enum:
+              - mediatek,mt6365-keys
+          - const: mediatek,mt6359-keys
 
   power-off-time-sec: true
 

-- 
2.54.0


