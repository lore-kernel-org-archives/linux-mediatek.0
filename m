Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D26BBC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oMJTjfB0RZiMm/i9xkEfFcyTebEGcyoR/bDpwzcnKjM=; b=u02IGbaGdKYyZv
	WIbYBpZkXP0OJzJeo7ZL+CqO0T+I49mxRLQts9DtJFUd2CJVeH2/SqMchO9lh7Liv2jZW0ufgfGNN
	X9LOqYf+txsyn3RLkOLq21gMlEafh/EMCGYH/7rXrj6z1bah7bYGlUcohTU2SadH6riYjTSm2rhHj
	TvhLQsoTPzVaR5SZc6C9idz3GKy4URXqGn/J+cFxzIc69Rje5+e56HVNs4xw1TWZph+LYPIdpl0hT
	J3OyXVV8Siumt4loOEQD8WeWGRuP8ErfH2YoChUB9be4Y68LiJzaRFBww7V8lUQhlOskNlBP3yS4E
	ts75QbY7Qpp48Qk2ifzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquGW-00D0UN-MB; Tue, 17 May 2022 10:17:20 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nquEe-00CzOE-QK; Tue, 17 May 2022 10:15:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id D5CB41F443C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652782523;
 bh=j6UwDST1RTpQZrK1XFoXP0QqL60WFGsaB1pWsCUIccs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=h1kiaYW+CqNYfHl5qFIrwH8QnujW9bPbn7+E/Y7x/IAL6Hq3Su+8yV8MXyxQLSahT
 TWvejk6ACQ484JcrAaIqj+g6Oo2jqw0aQYXHs8wtaC45Ik6cSrUka89OtbbFsKjSCK
 B+md89cBcfTch0Q1Fw4/fHfjymetSY82tfK7AymonzLJ9Ucais5B9eS8ZN8UU25CIj
 yOo/mIjR418yDC4rABhurC21jnTtqF6H3Dvt60ciHJtDFE1Xyzemb3qOF1zdN36uSr
 lPGQu7lJ7GoA062Y358nPpgsIa6GVKzRBMPt29/geJI0BQk4pugG3ck5cDVqc1W846
 ARd5Cp9g84c8A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, wenst@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] dt-bindings: arm: mt8192-clock: Remove unnecessary 'items'
Date: Tue, 17 May 2022 12:15:13 +0200
Message-Id: <20220517101514.21639-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_031525_016355_1779A669 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

There's no need for 'items' when there's only one item.

Fixes: 4a803990aeb1 ("dt-bindings: ARM: Mediatek: Add new document bindings of MT8192 clock")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../arm/mediatek/mediatek,mt8192-clock.yaml   | 45 +++++++++----------
 1 file changed, 22 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
index c8c67c033f8c..bb410b178f33 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml
@@ -14,29 +14,28 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - mediatek,mt8192-scp_adsp
-          - mediatek,mt8192-imp_iic_wrap_c
-          - mediatek,mt8192-imp_iic_wrap_e
-          - mediatek,mt8192-imp_iic_wrap_s
-          - mediatek,mt8192-imp_iic_wrap_ws
-          - mediatek,mt8192-imp_iic_wrap_w
-          - mediatek,mt8192-imp_iic_wrap_n
-          - mediatek,mt8192-msdc_top
-          - mediatek,mt8192-msdc
-          - mediatek,mt8192-mfgcfg
-          - mediatek,mt8192-imgsys
-          - mediatek,mt8192-imgsys2
-          - mediatek,mt8192-vdecsys_soc
-          - mediatek,mt8192-vdecsys
-          - mediatek,mt8192-vencsys
-          - mediatek,mt8192-camsys
-          - mediatek,mt8192-camsys_rawa
-          - mediatek,mt8192-camsys_rawb
-          - mediatek,mt8192-camsys_rawc
-          - mediatek,mt8192-ipesys
-          - mediatek,mt8192-mdpsys
+    enum:
+      - mediatek,mt8192-scp_adsp
+      - mediatek,mt8192-imp_iic_wrap_c
+      - mediatek,mt8192-imp_iic_wrap_e
+      - mediatek,mt8192-imp_iic_wrap_s
+      - mediatek,mt8192-imp_iic_wrap_ws
+      - mediatek,mt8192-imp_iic_wrap_w
+      - mediatek,mt8192-imp_iic_wrap_n
+      - mediatek,mt8192-msdc_top
+      - mediatek,mt8192-msdc
+      - mediatek,mt8192-mfgcfg
+      - mediatek,mt8192-imgsys
+      - mediatek,mt8192-imgsys2
+      - mediatek,mt8192-vdecsys_soc
+      - mediatek,mt8192-vdecsys
+      - mediatek,mt8192-vencsys
+      - mediatek,mt8192-camsys
+      - mediatek,mt8192-camsys_rawa
+      - mediatek,mt8192-camsys_rawb
+      - mediatek,mt8192-camsys_rawc
+      - mediatek,mt8192-ipesys
+      - mediatek,mt8192-mdpsys
 
   reg:
     maxItems: 1
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
