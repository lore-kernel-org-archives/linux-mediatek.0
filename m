Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1020AC38A2D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 09:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfAR4rxMzz+Sm7v+zT54iHEvBaoodeUKO9YzjlqdI/o=; b=I7I1RBbPt8dYw+uSHoK4Z49p+n
	78D4FAUzjBOEufaQRJ63qEIvPujFHwEceM2DS8KpDMbdleXh47sCUnkMZjUNKrqpaRj7baD/R/et1
	Hi8zSCEmDruY2kPwpUsxS14GsKvt58S/Cxni+x8EQuwzzcFLSrzminn5pQ4GRGQ7Ksc2RrvQIXKcn
	ivi2NOOxyK1F22sgV99zEFTlCgJldibzTfXUoPdbAwlYFsrPjl2YeK9nrpKfczJnCDQrHxL1UkMEe
	uSYXPs1b2TtQbKjGmCm71B4jHzJOdEO3OJHEMCnhuZaf1V9k1/WV1bJRrc6cHm+ByKXwOrk/5EiL7
	0fnO27pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzcn-00Cgfb-69; Thu, 27 Oct 2022 09:56:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onzbc-00CgC7-Bj; Thu, 27 Oct 2022 09:55:21 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5CBD766028D2;
	Thu, 27 Oct 2022 10:55:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666864518;
	bh=W8SEx0xapJJdUfHfS4BFtY3HtU4jbX1ZpxNLzv2olK8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SbL5im1DrRuFVThK8Et1NFIXOa0kw9VUBh3iZ6XNTqtB6k7yRU0CGbhg1p81W9vet
	 URFH82qFjD1EpvYPczHsA+I7xoviwfe30+z9hnqGWZtGA4biNsdwpcf0RfhCWHAWex
	 1nkr7qGnByNOL5d/0//IOs7NqPLPiXRQO8meoOrE4kAtU2olEOBpbtT49qHQvzDjDv
	 qohCakq6tZE3Fk9ki9m7lcOgIb1nc3Ul++IqZYO1G8OgCIarMdLiG3MCWP1vRdOoqU
	 +Y/176vWxVIqcsw+JrGCprCTvASnpvv8sgn+XiMBSon/bfV4xRgo2gBbNIjpnNTULx
	 RN/9oVZZhSpHw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	sam.shih@mediatek.com,
	andrew@lunn.ch,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 5/6] dt-bindings: arm: mediatek: Add compatible for MT6795 Sony Xperia M5
Date: Thu, 27 Oct 2022 11:55:03 +0200
Message-Id: <20221027095504.37432-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221027095504.37432-1-angelogioacchino.delregno@collabora.com>
References: <20221027095504.37432-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_025520_591968_B7667762 
X-CRM114-Status: UNSURE (   8.15  )
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

Add a compatible for the Sony Xperia M5 smartphone.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index d76ce4c3819d..49153d66796a 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -58,6 +58,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt6795-evb
+              - sony,xperia-m5
           - const: mediatek,mt6795
       - items:
           - enum:
-- 
2.37.2


