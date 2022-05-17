Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F42C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t4zog41QWDI15OpoT22HFJCkFe5UGbpm6zZURhOaUSo=; b=GaOjtFyeMHs+xw
	ckmEowzn97RnqdTwDKs3oPJ4EHO9fDyJJ+fZ3sf6ERuvoQAONCgGjtRK+RYj/JvFuGcGGfFXs6Dbx
	TRJw2P/VA4LaradnrX3WSIZfTyC1AZvD7mcdb97R/dk3h2HRwJuBA6nlGLnt24EHlUrKBsxhm+iZP
	JQhlNMHWKPL4D932d4ID9ru19wkO3LExDmoZWcblm9bJ/5TjmeL71a/tEmCGOpto37jRsZ4uZCiak
	wWFz2hz5Pp1hx6xxFOrnquiijQYAnwd5JUesOOGX39SqV5sVyhWbW/+DQLuC+qyY0mU7kK8MkMqe2
	JwSwgH2RiVpf0zyGrfEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquFG-00Czfi-8X; Tue, 17 May 2022 10:16:02 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nquEb-00CzM7-Nn; Tue, 17 May 2022 10:15:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B30531F443BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652782520;
 bh=yD0K1LzG4sl17Wt8hLcimPzliudGfQA7GrWMkET9a1g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y2VeW1mF5P+bz0Wp52qj1JfvQcWLqA1g13V0NcabygswWM+vcSxj+O1EhPYfx9tiF
 MRaFMLCHDkw3LCLqZ3CU3fK0wOGEgw6AjVbXyCJrkKx95BzfWgugBbRg1TeTLku7Yx
 dndIBqlaxPVq8PS3NzqSkrNv20/v87VOqIPDP4b7D6dObkx6qXCh+uEeK3STrAu1ND
 Sp2JCxYrWRDfOXPHTIPyPTRZVhgNOfk2CZTO5CkAuafegW3TanXw8+KoFTL+Z52MqO
 Blam74p/7Xgx8M8JKaR4JmWcfQG/KUIk4YhU8dP7OfXHOlBQbg+eDCl/ZbosxgP+wB
 b9UmsnZufNlbA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, wenst@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] dt-bindings: arm: mt8186-clock: Remove unnecessary
 'items' and fix formatting
Date: Tue, 17 May 2022 12:15:09 +0200
Message-Id: <20220517101514.21639-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
References: <20220517101514.21639-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_031522_014419_DBCD645C 
X-CRM114-Status: UNSURE (   8.06  )
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

There's no need for 'items' when there's only one item; while at it,
also fix formatting by adding a blank line before specifying 'reg'.

Fixes: f113a51aa2cf ("dt-bindings: ARM: MediaTek: Add new document bindings of MT8186 clock")
Signed-off-by: AngeloGioacchino	Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../arm/mediatek/mediatek,mt8186-clock.yaml   | 28 +++++++++----------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
index cf1002c3efa6..371eace6780b 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml
@@ -21,20 +21,20 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - mediatek,mt8186-imp_iic_wrap
-          - mediatek,mt8186-mfgsys
-          - mediatek,mt8186-wpesys
-          - mediatek,mt8186-imgsys1
-          - mediatek,mt8186-imgsys2
-          - mediatek,mt8186-vdecsys
-          - mediatek,mt8186-vencsys
-          - mediatek,mt8186-camsys
-          - mediatek,mt8186-camsys_rawa
-          - mediatek,mt8186-camsys_rawb
-          - mediatek,mt8186-mdpsys
-          - mediatek,mt8186-ipesys
+    enum:
+      - mediatek,mt8186-imp_iic_wrap
+      - mediatek,mt8186-mfgsys
+      - mediatek,mt8186-wpesys
+      - mediatek,mt8186-imgsys1
+      - mediatek,mt8186-imgsys2
+      - mediatek,mt8186-vdecsys
+      - mediatek,mt8186-vencsys
+      - mediatek,mt8186-camsys
+      - mediatek,mt8186-camsys_rawa
+      - mediatek,mt8186-camsys_rawb
+      - mediatek,mt8186-mdpsys
+      - mediatek,mt8186-ipesys
+
   reg:
     maxItems: 1
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
