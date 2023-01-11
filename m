Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85FAEC54EBC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 12:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uCG4zYttmZUBQAK3IT9ABFmka0Q4FRHaDmf82O8hATU=; b=Yvr38b7sBue+t3ZjgTFN/hDm91
	cQJ7HSZxEqoJKVo6fw0VjMddgEJ0w8DbzIqe0zEvpaM9TzeTNU4kGVVbCtdtde2pVFdK8/GiIiK5w
	i1FD0/BdPu+SpKnTB4ITCFeQD3r1/DvvJ1ZRI5rx9T6x1k3lnFFydjvri9DWUt1ofOJKJQ5E72IUr
	OCNt96jhx/E+BwDXkTx+rkE3lRzdpMnnwQDxbYv/DA0hZ4QiP9qptKoxomUmY4OURzyOV8vkbunbF
	02NgU0RBZ9fUrHPuLjbFpOJcYQUAQVXBOqr9QCt0s9j/zWKOKFERcDFXXBj7Y4Vs3DZOrZB3TIB/c
	lQWHr+kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaNJ-00BIdr-5U; Wed, 11 Jan 2023 12:38:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFaMj-00BIId-5m; Wed, 11 Jan 2023 12:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uCG4zYttmZUBQAK3IT9ABFmka0Q4FRHaDmf82O8hATU=; b=cIr77fdal6jKFJ103TI3V802Px
	OLvEiu9p25pgrnwtBYzAManuL6wpTJ6OV8KmkcPDxHvtamI85BBT1m+2HcJgoxpQbWjG52VQjIJfW
	0kNXEtLeT22LF8zh3q9sJ1F9CvAJNEa2j/ndQUnYGKgElaO6O7wKwmn3LFeHdHohd2BwBk1H2aHed
	pA6GuLflE1+LaSrofBEah5fVb9jeYiAPhoyeyYnmkkaswGbP6dgvLO74m8KsDL6BH/uo8ut0Ex2/d
	+qIP9+C5BlCfAGHQs6UE0673L1Unx63bzbB9MzGYOgg3fNM5EPUl3NkRYPLSl44gGETKmZHS4qgaA
	kOPzmmOA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pFaMW-003foh-1W;
	Wed, 11 Jan 2023 12:37:51 +0000
X-UUID: c13b734e91ac11eda08d4d6090ec5a5c-20230111
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=uCG4zYttmZUBQAK3IT9ABFmka0Q4FRHaDmf82O8hATU=;
	b=FKrG4tDzLuJvP3GBknGnTt5gVD9gXOtUoZ5MWz0Z8HsIXgj1Ulah9/t7gT+h7R/dhX+WQoTAD0v+nID60VAHNW4jq94n5XXlfN5B2jNjDZthkZqpOJzaIflQQAG0aQwu/TAY0RQ4LCW77Ht1QuMgMardzMsueYld5X+M+I0/yV0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:0eda7bc3-648c-4c5b-9da8-426666e3d5af,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:543e81c,CLOUDID:6d2485f5-ff42-4fb0-b929-626456a83c14,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: c13b734e91ac11eda08d4d6090ec5a5c-20230111
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1986207163; Wed, 11 Jan 2023 05:37:48 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 11 Jan 2023 20:37:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 20:37:15 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<dri-devel@lists.freedesktop.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<hsinyi@chromium.org>, Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH 2/9] dt-bindings: spmi: spmi-mtk-pmif: Document mediatek,mt8195-spmi as fallback of mediatek,mt8186-spmi
Date: Wed, 11 Jan 2023 20:37:04 +0800
Message-ID: <20230111123711.32020-3-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_123749_212948_F52B42AE 
X-CRM114-Status: GOOD (  11.68  )
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

The mt8186-spmi is used as compatible with mt8195-spmi on the MT8186,
document this situation.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 .../devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml   | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
index abcbbe13723f..e4f465abcfe9 100644
--- a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
+++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
@@ -18,9 +18,14 @@ allOf:
 
 properties:
   compatible:
-    enum:
-      - mediatek,mt6873-spmi
-      - mediatek,mt8195-spmi
+    oneOf:
+      - enum:
+          - mediatek,mt6873-spmi
+          - mediatek,mt8195-spmi
+      - items:
+          - enum:
+              - mediatek,mt8186-spmi
+          - const: mediatek,mt8195-spmi
 
   reg:
     maxItems: 2
-- 
2.18.0


