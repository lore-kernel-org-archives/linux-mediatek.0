Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A8DCD1284
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 11:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5Q14NVvZpWi5vGBA+ndlDjkHlaukO5kSDOvBtqq8WY=; b=e+yCBEmYy23cGM7+MgtpqGfdyN
	u10P3gH/8n+mXYUrj/biodXmGGy9YyDE50CVEqRvt84gYr5aoW1lhJ/zv6CWWEqEHuUqet3dRVeK6
	fi0aU7qlJj3hITxFt14SV9dL8Ns+3bTHArdMlDRqIwpzhLuqGGZdY68xZS7m69jdBX2TKUSOVSP95
	7nfv5BPUGQWn1bR9oRv9sA7QgOcUIkrZTqer2ihPSlMGidDBp19Xn71AE8m2c/bfSaiv3yNYgxjaB
	29v6Kjcb7ImCqeo1t6tHpEwXeNqw+RFqGgTiioc0Ea3VDzd0z3fkD7QpNc5QZ/heULzLcY7FmhO+E
	SZunPucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rusqg-0000000BmYE-2nqI;
	Thu, 11 Apr 2024 11:44:10 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruspx-0000000Bm0r-3dGj;
	Thu, 11 Apr 2024 11:43:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712835795;
	bh=GuvA/DRMxI0WIit88vBOOF9cxqJqFuEuz4b3EKsPftc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QuKlKOR7aMM+sLqdhb/WMLya6mDI7djcoX1wqAT9KwAhyBJ1kxGVxoQGW2WlCkkv4
	 h65DYklhQ7zWhIltlIrQxEZVTFKUdK/C91dP3NHQvpmF/7i+lPz/pa0oF07nBke2wi
	 2UiQRUzzWqQSc3/I+0fCipRiHR5NUjLoVe9hL2ciKGnnB152YincNhLiH0KAfYMEeX
	 1q1MYJBoWGfumqOq+Fwl9Z7U0jMqL6fIDKHqW53bEPHYDP+YOanNOKM78qoFyOUY3f
	 9DhUCSyse16hlGLotr20rZXp5fj69tYkSRCAWmGHF5/G5CBFTyGop+6X+CTlYCN4MY
	 sVTpDtefpUI8g==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EE5F23782132;
	Thu, 11 Apr 2024 11:43:13 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-scsi@vger.kernel.org
Cc: alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	peter.wang@mediatek.com,
	chu.stanley@gmail.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	stanley.chu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 7/8] dt-bindings: ufs: mediatek,ufs: Document additional clocks
Date: Thu, 11 Apr 2024 13:42:59 +0200
Message-ID: <20240411114300.169055-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
References: <20240411114300.169055-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_044327_811942_6C1A3E00 
X-CRM114-Status: UNSURE (   8.71  )
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

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/ufs/mediatek,ufs.yaml      | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index e2c276da3f2c..21b038db100c 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -26,11 +26,23 @@ properties:
           - const: mediatek,mt8183-ufshci
 
   clocks:
-    maxItems: 1
+    minItems: 1
 
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
2.44.0


