Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F1CC77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 16:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOAheDVKCDiWfdL4oKkHfwyQ8HFZpRIXPurJviRWpAA=; b=Lh1lsDPmLUsQkoPfqCChduuXnj
	OxMaWR5GIld5ZyHBM0WjKrmMaGxEM7zkPk6fqh5WLrnhyOflrGHd0fEieIWN0BwecAs24sMMCttaK
	igZSkUzfWuD/uYbpi6+oNb/lv+Gd8/szDUJVZOljNkAznKGXkSP8UTsqUu1uIJjYehr7JL0JemkOe
	vGpkhROd4pSvBMEPFvuftvasPWorxMQ1ZeOuZLwzDrY5Sh/50Jf82WDhtOeGF3ArVNpJs5qKtHTUG
	wxngRYNBkEKrWWhwWd9KUvo6xD+Hy54gzd+rfnAGkwsp4Iure+0tY1ZS3FaAXxq1AfMJiHNZ0iCS2
	g+I3AOnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pluEs-00FWJl-1b;
	Mon, 10 Apr 2023 16:19:30 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pluEq-00FWIm-1C;
	Mon, 10 Apr 2023 16:19:29 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pluEp-0004vO-0N;
	Mon, 10 Apr 2023 18:19:27 +0200
Date: Mon, 10 Apr 2023 17:19:21 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: linux-i2c@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH v3 1/2] dt-bindings: i2c: i2c-mt65xx: add MediaTek MT7981 SoC
Message-ID: <4ad55cb4248db60111c20d833631a65854fa1d02.1680857025.git.daniel@makrotopia.org>
References: <cover.1680857025.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1680857025.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_091928_409271_E4F8AA38 
X-CRM114-Status: UNSURE (   9.11  )
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

Add compatible string for the I2C controllers found in the MediaTek
MT7981 SoC.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
index 685da4df688d6..fda0467cdd954 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.yaml
@@ -23,6 +23,7 @@ properties:
       - const: mediatek,mt6577-i2c
       - const: mediatek,mt6589-i2c
       - const: mediatek,mt7622-i2c
+      - const: mediatek,mt7981-i2c
       - const: mediatek,mt7986-i2c
       - const: mediatek,mt8168-i2c
       - const: mediatek,mt8173-i2c
-- 
2.40.0


