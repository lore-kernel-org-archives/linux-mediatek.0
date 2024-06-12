Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0F4DC27C75
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 07:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u4XsAzG/QsINJ8mY4nVfgLpP7/ClA+cSHc5b8w1sojE=; b=du0ZIketLVxjqlr51zv+0/h/WW
	okUVBLUsHXrGAd+Zej6XVgE5YGLewuUtZD2GdZXxrLKkbpS1GxRXr1BoIgHoY2GFpRx609nD+Nc5T
	D5g6WN55qU4+dJVUaSJKy/ztoZvvnEfZk48QqmqiUJyx0GZPGRzMjduW2P60sBjfXQEzhyUHgnMg+
	SIiHiwG8SxkbUeXEijr5GeJATvyN0yERpiCQTf5Tnno0yY+hLurYDDEtO1BjBqU20NeJf9jkizHrx
	onLTZs6uMR4RQngk/l5e7S/DNwuDKmUozvp8+BJPMkTJAEkpUU29cIbCV44FTYXRQ7YpkzSgTSnwJ
	FrUg6biw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIea-0000000BUi5-2fGi;
	Wed, 12 Jun 2024 07:44:20 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIdo-0000000BU74-3oWO;
	Wed, 12 Jun 2024 07:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718178211;
	bh=TLELbug1XiDukFE3ghBiM2MHhoU3imk1/7ngSSox3e8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=crdOBphHW1I1MSSEvItDPGKYnqKmhVSresrVQRvPCzFKRubdocG1dgao4P/A2ny1k
	 vXepq99nP+SEGpD7u4Qe6ULgbJ65lPxx2kzIiwzlSeOLggycIyHHKIm60x9R2oN+8l
	 Y1LIUyK4x1gK1VfoaS9C+BwpymsXZLDQdsqc55muwpFMjDJLhhflA9wbUCZgtbV9ch
	 tUX/fiR9oCg4OeDMxloh6NL4bJ0Y5Dd3Wv2WjoaHfMHYEeFgSjvH11Z/fOrLPwcBqy
	 RMGjrvraJLszwuX+cpDJzGtMon/AnmNN4Edi1x0sjUlYFo+RBGrQ4XZS9zjrk5IzyG
	 3pYC5M9LxIMew==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 878EF37821A0;
	Wed, 12 Jun 2024 07:43:30 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-scsi@vger.kernel.org
Cc: alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	peter.wang@mediatek.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	michael@walle.cc,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 7/8] dt-bindings: ufs: mediatek,ufs: Document additional clocks
Date: Wed, 12 Jun 2024 09:43:08 +0200
Message-ID: <20240612074309.50278-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612074309.50278-1-angelogioacchino.delregno@collabora.com>
References: <20240612074309.50278-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_004333_107269_9C28D74C 
X-CRM114-Status: UNSURE (   8.65  )
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

Add additional clocks, used on all MediaTek SoCs' UFSHCI controllers:
some of these clocks are optional and used only for scaling purposes
to save power, or to improve performance in the case of the crypt
clocks.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/ufs/mediatek,ufs.yaml     | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index 5728e750761f..1df8779ee902 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -23,11 +23,24 @@ properties:
           - const: mediatek,mt8183-ufshci
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 12
 
   clock-names:
+    minItems: 1
     items:
       - const: ufs
+      - const: ufs-aes
+      - const: ufs-tick
+      - const: unipro-sys
+      - const: unipro-tick
+      - const: ufs-sap
+      - const: ufs-tx-symbol
+      - const: ufs-rx-symbol
+      - const: ufs-mem
+      - const: crypt-mux
+      - const: crypt-lp
+      - const: crypt-perf
 
   phys:
     maxItems: 1
-- 
2.45.2


