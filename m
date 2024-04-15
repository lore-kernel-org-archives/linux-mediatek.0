Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286F1C4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 07:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4FLqHwfCeU4PV++rgyCVKI3hb8hCE1HYA0G6IIkFsvo=; b=gi72XyprjnnBnqxhlLneC8o3Nc
	jOmKGAg7R5blazziL9ZugOg7An7LGsluXpCBdgO0BKG5vLaFunvsV5IrCKjmG8kLs4fKIgsJx9kuR
	ecFJKAiZmzQsk4l8IESOo71+GY7rBDYezGIwUjP9JvbU0Cnl7vs/7CJ7X1Xa3Bez97BUBc8miqm2U
	KFsp+p91nxf5vbGDue7gp5F8+eAP1a9df4oaXZC4zZPnARrzXczzkvBmeLQccpP5I81Ttm0iayxgY
	r9LOrQQQPe+pUt82W4irvWn6XSdmKj1mQPAaLLhoUjFZL4dSdEmgekcgel2eGpyIm7mvnL7r+Xa/L
	Q8/+KcUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHBk-00000007Q4T-34qr;
	Mon, 15 Apr 2024 07:55:40 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHAY-00000007PGr-1A2x;
	Mon, 15 Apr 2024 07:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713167665;
	bh=5eT0zUq3U+SGJ+MJi1xud1dyzwBZgkKn46DTagnuY4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iNll0TlQEai9STsdsIjH3jAfNSi/LWw/2Tb3JlH35RkK7xXcyQfJRYkVz0c2QhmNz
	 BT9C9h9ubcNMdb8NWIFxmJOXMLkFAIPmUcx7CGDjIkmbhIWimCNRb4jPvCf+UV1nNT
	 9Tyge49KrRF4D27JtDWex9ODovC1pe66QYJLnbvQTk4FyJweSqnEeU7/OYFxZsdGij
	 vO76b+Nm0kGfuyalCzhdqagq4VtU5KT8MJXAS5SPiq0ewUp22qxD0JNDzeqrh0WrTM
	 y+itOn2olBw8XYuJk2KNGzailryevuW/rUM69Uo96/AMEoqrjwMNG1DHFktusxZK7g
	 LNwY87bv33O5A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8A553378213F;
	Mon, 15 Apr 2024 07:54:23 +0000 (UTC)
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
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 8/8] dt-bindings: ufs: mediatek,ufs: Document optional dvfsrc/va09 regulators
Date: Mon, 15 Apr 2024 09:54:06 +0200
Message-ID: <20240415075406.47543-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415075406.47543-1-angelogioacchino.delregno@collabora.com>
References: <20240415075406.47543-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_005426_937604_E017F947 
X-CRM114-Status: UNSURE (   7.77  )
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

Document the optional dvfsrc-vcore and va09 regulators used for,
respectively, crypt boost and internal MPHY power management in
when powering on/off the (external) MediaTek UFS PHY.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index 4df2358d440e..4d42c44da061 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -46,6 +46,8 @@ properties:
   reg:
     maxItems: 1
 
+  dvfsrc-vcore-supply: true
+  va09-supply: true
   vcc-supply: true
 
 required:
-- 
2.44.0


