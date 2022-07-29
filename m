Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02579C19F29
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 10:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HmNOe2hc2y6J2xVNfFJcznFnqME4OoaZijZzi53xAto=; b=fp2JmlNiFRneInGzOc2qmXLW2M
	QZo2mVEmDvvnyLorVD2G9nPW0TTzhFR36YoZSBRsEEez21AnOjojiTLLIP8KjmlbICdlnsusIVMov
	+V5TAADsUZpYU91JTXWMdYwzXK8S+h27N+9wc7bi881kk4CGnKXI7dwXJgOGgUmKu0TfNV0LJRpmf
	xVp1ahEMnJsdY41B5TaAXjxs5/zz+1UjeEZZ10+7X8hmWcx2RVCl/T/aGyAKQvb6QgMeNIuKm+jgN
	4RNhL9QL3RByq1pzoOtpBGX4zhLL0j/rIoiK2T9IlC/nBu63xP66it4LPlRU2e4KTUN2t6EtwAsZ3
	uScGJsFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNXR-004Bxp-EQ; Fri, 29 Jul 2022 10:48:13 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHNUN-0049zj-3w; Fri, 29 Jul 2022 10:45:04 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id BB4FD6601B71;
	Fri, 29 Jul 2022 11:45:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659091501;
	bh=KHcQKTlIo6mCV2UKqcNxwuM/2dLWF39lYb6bnCpx53Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gwUT9zuOSrT8H5P4zToiy+Yl6pA2pulVODhkXMqwm+n2Nzs6hwZE28f/4cmrzq6WS
	 ScijsulJB37EnnP7WXkNM7w5t7yYLRHsE/2fB7jE2qanD/8E5xAjfqKd15wYzl2qMv
	 LqWent0iYNsl1AfUsLfcCPmrM+y/nCzMnFQ+e+N/IP1n5zdDmDiFUbITNFQ9prAUxR
	 SoXQFBSlgfMsoFkxZaHfs7PkdO2osJuM9dwrvGGbJAQ5Jlgh3lo8NVVazT38yNQA4d
	 myuTXqnCJMmMA8kjb8Rv4isxk0twfkvYhtThe1rsraIEHM///fvjhSU+CJ5EbO4SOx
	 EdZJRpVOvAPsQ==
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
Subject: [PATCH 7/8] dt-bindings: arm: mediatek: Add compatible for MT6795 Sony Xperia M5
Date: Fri, 29 Jul 2022 12:44:40 +0200
Message-Id: <20220729104441.39177-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
References: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_034503_360398_E97F8068 
X-CRM114-Status: UNSURE (   8.08  )
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
index 07c0ea94e850..c162b0df299b 100644
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
2.35.1


