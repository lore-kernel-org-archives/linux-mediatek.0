Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404F1C27C77
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 07:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KbIo9HssMu+yUe/xltp9FPZYMI6FrG4gHjrXTq4Rqzc=; b=bCXhQZcOODWo4gW2k9RNfNeFfR
	r/BuvpGR5ir+/1rU0lW+Hb3vPHxrtb6UCnmaOGrBbDL9fJ4P96hB+XzymQ/w8FRRtViJJ6Kg8bEjW
	tkS3rv4SUkGWVicWESY9GwW7iQ7OcF+PDkeY2kYOUKDRxfYV2OaQ/VdKakYkk4nfy4lefpm+FEKJa
	8OcrwjZyhoFn55A2HtuP4fiEQCKk8WRnlzTGImvAcDANsjNBs53PqJKPbb/2Z0XKxWg/lnOfvtyy2
	vm5Jly8OD2kjFtPJoddMvQZQJ5G1gcFyIrr07NrRlqtfaXr906wIefoLo35jb96GfqKCKHjP/8Mvx
	oBibfVBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIeH-0000000BUUx-2fee;
	Wed, 12 Jun 2024 07:44:02 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIdm-0000000BU37-0J8m;
	Wed, 12 Jun 2024 07:43:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718178208;
	bh=K3rrJEbp/p/hbKG0ZLHrE2fpo1wxhHU8XVuRFaDmjOY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I3OdBZ2w/fBbDobKQTv1ae1lqa+mQz8L/SUhkySAJAy8RsWFdCKI8pDAAsDfsRaws
	 rXgNa69ya52w59XML8sVH5uCNkN3Fa+aCa4JxiCZD0quikLsXqfsb8wTGseHgltn63
	 2biAdVUJxNfAVSAEOYDFi9afgOwJeGsHAYFnsyR0tgyQK4Vnc2MvCw3ddeROsyrLdz
	 sRU5anUYuzeNzLmMpvjnK3QY9u9dB0h90uHjMuQ3NqwII+oQz3n2/J5o2uwB57Ibgx
	 O7+lH+icpWBTMwa5zg+K8ZKacs/kxF0ER3kOL48FazOTtHivXhgJYETjkY6LXeb/FN
	 N3Y/Agoe/sI8A==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B2D3B378219E;
	Wed, 12 Jun 2024 07:43:27 +0000 (UTC)
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
Subject: [PATCH v5 5/8] dt-bindings: ufs: mediatek,ufs: Document MT8192 compatible with MT8183
Date: Wed, 12 Jun 2024 09:43:06 +0200
Message-ID: <20240612074309.50278-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612074309.50278-1-angelogioacchino.delregno@collabora.com>
References: <20240612074309.50278-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_004330_360155_99EB0E29 
X-CRM114-Status: UNSURE (   8.96  )
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

The MT8192 UFS controller is compatible with the MT8183 one:
document this by allowing to assign both compatible strings
"mediatek,mt8192-ufshci", "mediatek,mt8183-ufshci" to the UFSHCI node.

Moreover, since no MT8192 devicetree ever declared any UFSHCI node,
disallow specifying only the MT8192 compatible.

In preparation for adding MT8195 to the mix, the MT8192 compatible
was added as enum instead of const.

Also, while at it, replace Stanley Chu with me in the maintainers
field, as he is unreachable and his email isn't active anymore.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/ufs/mediatek,ufs.yaml         | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index 32fd535a514a..f14887ea6fdc 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -7,16 +7,19 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Mediatek Universal Flash Storage (UFS) Controller
 
 maintainers:
-  - Stanley Chu <stanley.chu@mediatek.com>
+  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
 
 allOf:
   - $ref: ufs-common.yaml
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8183-ufshci
-      - mediatek,mt8192-ufshci
+    oneOf:
+      - const: mediatek,mt8183-ufshci
+      - items:
+          - enum:
+              - mediatek,mt8192-ufshci
+          - const: mediatek,mt8183-ufshci
 
   clocks:
     maxItems: 1
-- 
2.45.2


