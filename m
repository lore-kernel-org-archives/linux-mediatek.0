Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88966C43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2026 13:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tIgAeSIeWMFrrZERdWh8nLvd/FHWfZLBVZiJ36Ls+jA=; b=EQQ1HjobeYTmge0FbxGuQl8BVK
	Xs2Cl0uUboPUtyhyjp6UWr/7grOfmj9li0WEXu+9/6D6LC9I9Rl8C1qqV0ezCITl/ASMEWGOisEEk
	bUZ8tQYSF4xhoCPa+zyhbXgRPOHZTQMSYOahjfzX8aLNL2CpqE+Z7JrrpaweQmx8JKcenruBQfwGp
	WRN2kJ8Lb/5WBIEVxOz8hoQub0XSSUTObzxK4YWBUky/15JGqp2qe+5ery/NulZ+Jj+i6J6ckoWNv
	jaX1UbJNc8KT+qlI+Q+JOr7wn5VwJa82Ksn4hm2C8MhGGH74jCQ53r2XizjVCU6Mmacf8FlmkrKSa
	HfLPLGzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGHc-00000009H3f-1noh;
	Mon, 13 Jul 2026 13:01:16 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjGHa-00000009H1h-0Ic7;
	Mon, 13 Jul 2026 13:01:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783947671;
	bh=CRTgzEIiCGF3Q0P2KDt3LTOIuTWsDk2Q75L0QVm3KT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VOumek0/g4DzFGQ0SjN/vuIYrHabgL6b7/cSTjkc8m/CxkLU6GGUi07ih3BcSEqTm
	 m33QVupRDvn1TVO68+voZOt5hSlOFx1irqnNm7aU5+EicEygSbdN3SaS9vJkC8o/O2
	 zAqW2NjCzXCKtTz6VvGCQGRdBBObDJcLdA6T3xpgMbrlxnUrL3eykBrgWMD2K32Xx5
	 dI6gVzmLwT8ALbjCrxiwzSvY2Rz1z7iJEXZISZ2NYFsqzg/QnMYIxknsMj/2WQiTlc
	 MK/1iranOLL16uFNhFIRakGhNfJjWnsERS7niJUCnlSHioFOcvMdkbCHj1MqMd2/GT
	 IC3zBNYKvCghQ==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6CAB917E010F;
	Mon, 13 Jul 2026 15:01:10 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jitao.shi@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	justin.yeh@mediatek.com,
	jason-jh.lin@mediatek.com
Subject: [PATCH v3 01/10] dt-bindings: display: mediatek: dsc: Add MT8196 compatible
Date: Mon, 13 Jul 2026 15:00:54 +0200
Message-ID: <20260713130103.34654-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260713130103.34654-1-angelogioacchino.delregno@collabora.com>
References: <20260713130103.34654-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_060114_299036_EEECDE3B 
X-CRM114-Status: UNSURE (   9.51  )
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

Add compatible for the Display Stream Compression (DSC) IP found
in the display controller of the MT8196 SoC.

This IP is compatible with the one found in MT8195.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsc.yaml    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
index a5b88eb97e3b..c8b3e86943e4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsc.yaml
@@ -23,7 +23,9 @@ properties:
       - enum:
           - mediatek,mt8195-disp-dsc
       - items:
-          - const: mediatek,mt8188-disp-dsc
+          - enum:
+              - mediatek,mt8188-disp-dsc
+              - mediatek,mt8196-disp-dsc
           - const: mediatek,mt8195-disp-dsc
 
   reg:
-- 
2.54.0


