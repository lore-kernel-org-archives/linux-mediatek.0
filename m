Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495B8C04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 11:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmFjrZpTt19ZQ0/n6Zc/Nd64wp2cmN6WIn+pxc+uwG8=; b=lmSemR43QQUqI7yhQlgPyoSdRe
	jVbsxkWcXJpwN7DPTrdJpbGKjz1OOWEL3eYQO+PLIENZ3aWqMcJz6bMuaZDEFPclHQt8NEWSwIs1x
	5RI+vKuSEbr3EPnKK5t6AixvWnpUHajIF6JS6sHJYvlGfDQsvvT+oNdMIDsthjNvCjoBYZEMoz1KF
	yF7Gk1wI5+0NUVpedLfkHbS4FFFxgARxpVLUg6dU5t4xTH0iroLoL8rBagmx5QrWvqDF7oRWYIXG4
	17A7S/uUVV3YtO4oMIGcCPx4QId1nyGnAhhuP2pLodKo4CFhbvhhbMSSxm2K4WUePbQRxkv0IUQaz
	AlpVNMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwK5i-00000007y26-2qVQ;
	Mon, 15 Apr 2024 11:01:38 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwK4Z-00000007xLH-2i6d;
	Mon, 15 Apr 2024 11:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713178826;
	bh=xXwyH40ijwhP2NEXGOtiRRBM5Db26dTrTLrEXJ0hCJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I3WUPgKS9DLbmHYGZdy2APm3FvTkdX7OIAgwaE0YmZ5p8CcTtE5shJBDwp9hcBrjg
	 XU+I/SDZ4PVbZnhpFbcSoUG+5uZM1OZKGXsNgz85ghPDbW7kvFx9s0u1qlnwHPrMZp
	 wOV5EetbnRFFyFYUOENiatjmickweG0ivDquo74/s0spHImYVb5ngPXXnpCCBHKWG9
	 srDEIaKX64aSpKCWX08LOWxh+l34o41JirDu1HdvMBvLcuCRjvwBFnAOt9vmgdztBX
	 hs44q7k45Dzk3a6AO/CeB5hxjGXXGK9ueHXWwAgtAR68R0P23KhxPd/yN7tWd1U0zG
	 7mCi8Ee2iX6dg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E0E2C3781107;
	Mon, 15 Apr 2024 11:00:24 +0000 (UTC)
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
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 7/8] dt-bindings: ufs: mediatek,ufs: Document additional clocks
Date: Mon, 15 Apr 2024 13:00:11 +0200
Message-ID: <20240415110012.148871-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415110012.148871-1-angelogioacchino.delregno@collabora.com>
References: <20240415110012.148871-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_040027_958679_49423C06 
X-CRM114-Status: UNSURE (   8.98  )
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
2.44.0


