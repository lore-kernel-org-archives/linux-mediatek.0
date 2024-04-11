Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4208ACD1284
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 08:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EyJMTK7z7OJHZgbnsmBrgMOg7eglpjt9NodWnan3COc=; b=k0DgnLdAjlTC40PE5HEy8XXHTc
	FSxpzMl69g2ho/rZs9JijyrIWygb9SWm6XcgbSF4JwazORXkHkyooRHNywEgazwin25N63gIvj7Qf
	lrzcNJ6T3SGSbCX8H6wJS+ivi0q1CkxAylgVYEpPWGhq2K3eAZ+0ul3WIUayvSbjNn60Y3G3+tTgu
	hdE5gz2pq/SOqJ3k0gFdJuxLa1vhk8xaE1S32RaFEw+y2DElAXCrFR1BRqzoM1lBDMeP8AT/Fi/uk
	QjSfjdjL1FzvHYwklGhGM/pNr3tvq0Rcac/ZqHOm0IbRel/i/D8xeWTxXh+WnamyTJqBT5R08qbo4
	e8LKpa/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupr1-0000000B5xD-0kkF;
	Thu, 11 Apr 2024 08:32:19 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rupqk-0000000B5jH-0xWj;
	Thu, 11 Apr 2024 08:32:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712824321;
	bh=qvwukQ63ru7c/su/YXR6zlEYXzSPY/kzv1TeqWamDO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tbv3N6UkWXQ3FwscFqj284jPwjO1i8h8kykuyl6pf1ztcSQ7NqnBmlOAXNenTtw0z
	 KADZtve/5TXBl6DuxO8pdBqLO20VCyb1aD7O74TR025UdSMMBBJO3KvVl95OPN9x69
	 y65lREzpxn3l4ud07dBNZC8Mapg0vlrSk5Pwun04EYFTY995JJ3VTVm9LugVZmzttC
	 49DOI2amJX+/WCRBX8u+w3AfI384OABE/JBfEgpcJFqzoE13fnDqvRJ/uTdwEg5qej
	 doNiJ/5tGFo1sqM9RRw+J9uz9RoMg7esE2KInqME7nJvNrpJqBVZ2ZHW1AInfRxH39
	 rPHdNEGOSRPMQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id BF3A33782134;
	Thu, 11 Apr 2024 08:31:59 +0000 (UTC)
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
	kernel@collabora.com
Subject: [PATCH v1 5/8] dt-bindings: ufs: mediatek,ufs: Document MT8192 compatible with MT8183
Date: Thu, 11 Apr 2024 10:31:46 +0200
Message-ID: <20240411083149.78537-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240411083149.78537-1-angelogioacchino.delregno@collabora.com>
References: <20240411083149.78537-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_013202_960873_F36C214B 
X-CRM114-Status: UNSURE (   9.29  )
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

In preparation for adding MT8195 to the mix, the MT8192 compatible
was added as enum instead of const.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/ufs/mediatek,ufs.yaml        | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index 32fd535a514a..adcd13023866 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -14,9 +14,15 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8183-ufshci
-      - mediatek,mt8192-ufshci
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt8183-ufshci
+              - mediatek,mt8192-ufshci
+      - items:
+          - enum:
+              - mediatek,mt8192-ufshci
+          - const: mediatek,mt8183-ufshci
 
   clocks:
     maxItems: 1
-- 
2.44.0


