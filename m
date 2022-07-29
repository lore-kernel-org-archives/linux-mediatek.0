Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AC1C19F29
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 10:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mnC6XEXuTb6BUCNiITt8ykFbRS4TCQ2FXOmfPLprRSk=; b=tDK/kYt/PfPMabSBYRHQXK7Nzd
	bm95gwKQJE0vECSISZj8ynmGiMNby6F5Rdqh8BfLn5CSzFkHEupVHiAkgrV3U/tE+OAWWgF6Vi/3E
	Gjfn57C+9ESowzL4kRjoz5uINWgnuYlV+yuN4eOAZayTBIDR9+H5xDo5HKsCBat3zg0h5Rf9lzPkg
	RV7V96QkOVVA2i/2/b7+LxVYfHurkKZrAfVvg4sya6GZ398GvPI8X10OGc0vnBLAr37qq22/pMRvg
	xUGUAXJul/WsYfdQT3pta+B+2Z67UC0qdFcVOj9Szuv+gDnYGHn+31QK1ylCrEIhhZjz+nWSNd6Am
	tKjWloeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNUq-004AHP-Hn; Fri, 29 Jul 2022 10:45:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNUF-0049ui-9x; Fri, 29 Jul 2022 10:44:58 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EF54D6601B55;
	Fri, 29 Jul 2022 11:44:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659091493;
	bh=g+LcCft8DaAa9BeWpNJbD1ov3XINszU+afPtdnzNVwE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UuLkRXbNOEtS+yPogV3R63b1wH6QZVeIf9Fz44BXMMQUk4ChORyyAYVBXhFTrYT+y
	 /x+lY/0lg6luBq6l9rj+BTLNh+X+p7gYS5ehcMwCUaFYK/WE1fGmzBLn8CUTOp1lmM
	 TFCGRVp0IQRJAWpveTh/qg4Spg93s5H5tkqdLcSRrAwAq87JAcrK6uq4xn+c5Tx8Rl
	 ypwKYULbYpFL2Ue+JN9c9bTOxZ0cslT0JndPC0NSeqMfT0HtIt+s9FaVnr75zwbYJs
	 pazkRs4/gFK1wjoQ63V3NFI60nOMUPJ3CQirf8qRRBHEpsA/lycnbyK8PDrhH9ak5j
	 Z4uSN0yqnlPDg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	vkoul@kernel.org,
	chaotian.jing@mediatek.com,
	ulf.hansson@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	fparent@baylibre.com,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	long.cheng@mediatek.com,
	wenbin.mei@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 1/8] dt-bindings: dma: mediatek,uart-dma: Add binding for MT6795 SoC
Date: Fri, 29 Jul 2022 12:44:33 +0200
Message-Id: <20220729104441.39177-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
References: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_034455_585532_E4C9248B 
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

Add mediatek,mt6795-uart-dma to the compatibles list to support
the MT6795 Helio X10 SoC's UART APDMA.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
index 19ea8dcbcbce..9ab4d81ead35 100644
--- a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
+++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
@@ -22,6 +22,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt2712-uart-dma
+              - mediatek,mt6795-uart-dma
               - mediatek,mt8365-uart-dma
               - mediatek,mt8516-uart-dma
           - const: mediatek,mt6577-uart-dma
-- 
2.35.1


