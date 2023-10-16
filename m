Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4467ECDB474
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 21:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoQtOoaiIZZbUvjcDU3OgM/pWFOD5Vkb2MmIaDetW2A=; b=FtPRMXLDFDk11FNxHHB9LWg4PM
	pWioaF2NkDAvRv1yFLyRTK/w36jfDaN96EhiqsgshL2xC/21UzaRB8djQwtTDgr08iNqa+DWQ+6GQ
	ps3hM8aWhwN6sOYAKDNMIczP9ztYzA/VtfmxNHNmYAZyLRtmxVrogRUwJA5+1eianAltfZ1MwPqZt
	c6RMvlDyuaYHjIfS4ibvB4jhXmz7GJBTUSujDy37t7aNc7BTI5pkMTmxltWe08Zr7CSKHZTCYVAOz
	XF8aiPJEa3FXA3vx9slVfodjNPkB7EBcrUgJdRX9iGpJjDUTSCQDcY5lCztTxQduZ3voFGX05xtv9
	9+z5jU+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVUs-00AdRF-0d;
	Mon, 16 Oct 2023 21:51:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVUf-00AdLO-1P;
	Mon, 16 Oct 2023 21:51:22 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04ACE11B4;
	Mon, 16 Oct 2023 23:51:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697493074;
	bh=vm0/1wlj1oWdGfLB7hd2PEG0FEkTFXDPEq9DFqp0y5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e2hVp5xH89QYDyTehal7ezrVhgc5qJv15X7Pql1aEovjRmWRqCAiqqYAUVZkU7knW
	 SWg4K/LNDtTjh2eVYFixEj9J88IV1zbZFou4/U6cgElJvk/ragTXqI6yHrflQc0e4L
	 6jSBLHkWuirCw8LKuDOANWchJDz4u9bkUWZaxO3I=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Fabien Parent <fabien.parent@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>,
	Ted Larson <ted@ologicinc.com>
Subject: [PATCH v1 2/3] dt-bindings: arm64: dts: mediatek: Add ologic,pumpkin-i350 board
Date: Tue, 17 Oct 2023 00:51:22 +0300
Message-ID: <20231016215123.30343-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231016215123.30343-1-laurent.pinchart@ideasonboard.com>
References: <20231016215123.30343-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_145121_617806_D757E263 
X-CRM114-Status: UNSURE (   7.91  )
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

Add a compatible string for the Pumpkin i350 board, an MT8365-based
board developed by OLogic.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index ae12b1cab9fb..dc34e62c6756 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -247,6 +247,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8365-evk
+              - ologic,pumpkin-i350
           - const: mediatek,mt8365
       - items:
           - enum:
-- 
Regards,

Laurent Pinchart


