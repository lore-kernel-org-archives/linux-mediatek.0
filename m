Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC81C677C4
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 14:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Mm1e3mlVKmqYB4FiIftgNM3eL7zfuFRTCkznk04ZkH4=; b=MMEo3zplfUqsvMC0DcRT4qE+iF
	2hOQOENXgfFWNY1WWLtW0KkXHDIy5ihQEOrL9DOE5OJfMOXs9+WvSUXio43OvkuZiHN9LKuU0qOa1
	R1jGZrY2DRmvFVrfVVX7Get/wsy7IhYUYUxOAY4SpRMWyE/iwEDu/ksXVsjLxeggsfgCesdyNYDUH
	muxlSedVWg89o1epSb05S7k9/Bf6Plcrk2XNKYstjhhWIWgbEALlPP+4LKlhQ+DBuNQ1nHmlFc53K
	888cXYgUDnGAd6Gir4JkeUI8tsF/Axk1n/IPjM3JDoJhmAXroEyR2Lt36vHdcvPSivDdwNYd2d0Dr
	zV4Xg+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMp9-0000000AGlK-2RGi;
	Wed, 11 Jun 2025 14:53:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPJJI-00000009i5a-1NAY;
	Wed, 11 Jun 2025 11:08:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749640078;
	bh=kyPztV/dUohnVXnMILrNtW2ZYQ3QNi1+1ODBhm3jYCc=;
	h=From:To:Cc:Subject:Date:From;
	b=EfKn4yvZ2xiYkcfRUyca9I+haRGZ0RPkmqlmXhkv0WIBtQvnjakPbgRq0y0Dqao3S
	 Ve5TQEt0PtOlNxDoJi4q2CuL7BvuWhC+23Co+G56ml1hgu/hnKtPbjKQhzhWFQjs4a
	 kkDjY2Tb0hBnJBdPbO6fDtBGHxy3hCeGOofOx1o0QMp4LrRdfLSiEf4lhCorxtKnQ/
	 4/919hziMF7nF5KyzwCy6njFsbHI09Azk4ciOhNtifuf+8ddTknGE1YxnCEU9gF983
	 E2YpxqvuTN0IMdfiPw43znf5tI/zZ8AdtsMOaG7pOjJq8xAZpF4HblxuJQ7P1SXE3h
	 s9EECyYHmLOMQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F92917E0536;
	Wed, 11 Jun 2025 13:07:57 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: broonie@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	leilk.liu@mediatek.com,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 1/2] spi: dt-bindings: mediatek,spi-mt65xx: Add support for MT6991/MT8196 SPI
Date: Wed, 11 Jun 2025 13:07:46 +0200
Message-ID: <20250611110747.458090-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_040800_519937_6291593A 
X-CRM114-Status: UNSURE (   7.92  )
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

Add support for the SPI IPM controller found on MediaTek's MT6991
(Dimensity) and MT8196 (Kompanio) SoCs, with both having the same
controller IP, hence being fully compatible with each other.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/spi/mediatek,spi-mt65xx.yaml         | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
index ed17815263a8..3bf3eb1f8728 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
@@ -39,6 +39,10 @@ properties:
               - mediatek,mt7988-spi-single
               - mediatek,mt8188-spi-ipm
           - const: mediatek,spi-ipm
+      - items:
+          - enum:
+              - mediatek,mt8196-spi
+          - const: mediatek,mt6991-spi
       - items:
           - enum:
               - mediatek,mt2701-spi
@@ -46,6 +50,7 @@ properties:
               - mediatek,mt6589-spi
               - mediatek,mt6765-spi
               - mediatek,mt6893-spi
+              - mediatek,mt6991-spi
               - mediatek,mt7622-spi
               - mediatek,mt8135-spi
               - mediatek,mt8173-spi
-- 
2.49.0


