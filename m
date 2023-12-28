Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA85C47073
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Dec 2023 11:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2t1Go123KrbvwoQv/ZHc6CDGIwGg0c6HjALyiieqVng=; b=g8KMC2vexlheFqoIYjuzkvubnJ
	UQR+vY+ReyxEJ404hJof14VPmqq9GGztxb0rKPUveCXaam0Xx7fgrAYPXOYZ9Vii2bAVkj4f30Wld
	aAFI5UP3cDTxxrc5js4feKGBVSLwt2Ovqzi2WxCYTOjwl22N1qZv2YVmSLo9lNF/mOmmNxRSmANuJ
	rWlHBGW7Gjd8+sPffjRoVWb1Apm/BGPXU+xd0prODthTOXhj6hgI9+xY4gzZylprsTEl7464fmG7l
	4U1l0j0EiwdYoxOzjxM0M1Wfb7mazWu4+zXYIhtv+sS77gzvpnunr1wlah1ugnxzDLUyhnghhFrPt
	Fdj3xthA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIode-00Gg2C-2B;
	Thu, 28 Dec 2023 11:33:22 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIodJ-00Gfox-09;
	Thu, 28 Dec 2023 11:33:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703763179;
	bh=1fDv/5V6e9fx+iroantkLNTc4mnm6R4J0fjeEoEc4gY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P/Txb1JlYklMHWMqG5aL1Rd6kvgcuOFKWHiJPZb2JM9vbOVhLzip4crXixn6QzW9f
	 0GD80b2W55XA+b1YY/FSIrSYlMBqWai6uxlxWh6zquqIaVFSb9UcTB/1he33Ecjs8G
	 CCd+ApnsTMfWVQP+sMYDRwOpngI7oPH7ZNVOUnflTxoGJVDQ5/SetHH8vQPJLA4yBy
	 R4I4SrQ33x5cSHDxi28A6FuRLJzL0NwZWR4l1zZBCcGkwjUeJDJrdvJIr5nC1RHtEY
	 PGeKgHQxzc8zk9cIUvT08vnxbmhlT8nKOq14ZZnffXrvkUfmXD0nkQ10eCEqGtLapA
	 Iy0zYYJjIL9Kg==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: ehristev)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 05F3D37813D0;
	Thu, 28 Dec 2023 11:32:58 +0000 (UTC)
From: Eugen Hristev <eugen.hristev@collabora.com>
To: tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org
Cc: eugen.hristev@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	robh+dt@kernel.org,
	kernel@collabora.com,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 4/6] dt-bindings: media: mtk-vcodec-encoder: add compatible for mt8186
Date: Thu, 28 Dec 2023 13:32:43 +0200
Message-Id: <20231228113245.174706-5-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231228113245.174706-1-eugen.hristev@collabora.com>
References: <20231228113245.174706-1-eugen.hristev@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_033301_254768_2857F27F 
X-CRM114-Status: UNSURE (   8.46  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes in v3:
- collect R-b
Changes in v2:
- new patch.
 .../media/mediatek,vcodec-encoder.yaml        | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek,vcodec-encoder.yaml
index 849721c0571a..b45743d0a9ec 100644
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


