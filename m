Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472A3C41535
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Dec 2023 10:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgF02T78B0wnNhgy6a8gbjkvk3s3L9Nk9V3Xd0plTjU=; b=37E+vumZfOWUdvW2/cIJ5pFS7L
	MwfK8U8OGSHPb8RAmV7BGTocvszWuQoqwAhJ9hCpqRWtd1bECu3CSETe39f74lhujbh/bLSAVZxiN
	d2VQ3Q5Od9MfKCPSZZ6RgqC7QNxbh7haKxpRbm+aeUnmdmOCB9JHTgLZbCtsroeqUaAsygWysq6wf
	dCzUjaNoXjbawZyBC484Id+KUD4sTb5MXyyImteNDrFOWGcOvYc/NOOzni6ALc5s3RXp5k8OW84Ar
	MUhGzgJsiuP2NfiGz1XcWMl5NaJzEdn8iEiIIYgXX+hSADwotF3Gtok2G67fuDeyXfgIPd+COLyF2
	GRsqtPNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5i1-002ojI-0c;
	Fri, 15 Dec 2023 10:46:21 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rE5hp-002ocI-2L;
	Fri, 15 Dec 2023 10:46:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702637168;
	bh=oXswsuW1anVDQblcp1XlaqlIZub/1g335nE50zD4/kU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VGwLRoadvlKFpw29V4QaM/mr5XBEqcnnxpzWyA7o+qpLCSFEiY9+qxBn1LO6uWmpJ
	 keLPBznLC99dLayG8ywwlErBJL07Vz3mIwXGbK+j+EtigulikTMppMCuBpdMr90zQz
	 qyeHO5HmT3ujs8QqmStlDrxczx3Z0jre+6cMI5nFzqBg1WyJo75LMVsP4tJOQ7Miw3
	 lFcVicD+CW0Cl2h8VgZdUyUWUy0M4s1bL2wiEoVW/WtI5ULZ5kjyAqsdHe9ky6EQH1
	 YjQ0zLUQzGKZO0rxx0QHNFv3ZGXEan050MO6n8TeSXXz6TrDSjf6fi3ZOFgs0+lEvu
	 gFOxjUHq1ve2A==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C16F73781FD9;
	Fri, 15 Dec 2023 10:46:07 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	angelogioacchino.delregno@collabora.com,
	matthias.bgg@gmail.com,
	linux-media@vger.kernel.org,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	Eugen Hristev <eugen.hristev@collabora.com>
Subject: [PATCH v2 5/7] dt-bindings: media: mtk-vcodec-encoder: add compatible for mt8186
Date: Fri, 15 Dec 2023 12:45:49 +0200
Message-Id: <20231215104551.233679-5-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231215104551.233679-1-eugen.hristev@collabora.com>
References: <20231215104551.233679-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_024609_895483_B5903C4E 
X-CRM114-Status: UNSURE (   9.21  )
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

Add compatible for the mt8186 encoder which currently works in the same
way as mt8183.

Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
---
Changes in v2:
- new patch.
 .../media/mediatek,vcodec-encoder.yaml        | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index 5166c1c6934e..dfabc2faea6c 100644
--- a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
+++ b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
@@ -16,14 +16,18 @@ description: |+
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt8173-vcodec-enc-vp8
-      - mediatek,mt8173-vcodec-enc
-      - mediatek,mt8183-vcodec-enc
-      - mediatek,mt8188-vcodec-enc
-      - mediatek,mt8192-vcodec-enc
-      - mediatek,mt8195-vcodec-enc
-
+    oneOf:
+      - items:
+          - enum:
+              - mediatek,mt8173-vcodec-enc-vp8
+              - mediatek,mt8173-vcodec-enc
+              - mediatek,mt8183-vcodec-enc
+              - mediatek,mt8188-vcodec-enc
+              - mediatek,mt8192-vcodec-enc
+              - mediatek,mt8195-vcodec-enc
+      - items:
+          - const: mediatek,mt8186-vcodec-enc
+          - const: mediatek,mt8183-vcodec-enc
   reg:
     maxItems: 1
 
-- 
2.34.1


