Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FDEC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 15:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2DqHX9tS+6Zn1iP7P4lZX43bMDP/noYicbQY48CW24Y=; b=DbXuQK7zd6HnXTHvERoKILPrUY
	C3Y2k8cH0M41B21LCmTgmM1rP8jr1dEBTs7KYiain3n92OoLUKM3uEWr3Y/h8EgvjjN330CPG8+ko
	hQxcSYyI0k1uYM393ckTDk+WYtQIjnQXJyouwuj1xo3ZgDZWt0dvdzhS1i8p0dieZcTw1+yZknxrZ
	rkKBopUNeLagnc3gejMNBsVywkG2gU1QB9d67AFWSGSveeUz7/AkuH3uKOpvMF/FTCyZikRXtks0y
	HWa56/oZEL2viiQzvrm8keRL+aUiK7/stRxVkwEgfSkyzpxju3KvWh1UsxvQ4Al/SWxOlrHBNxsto
	BTLUHhOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmcTU-003eKs-1L;
	Wed, 12 Apr 2023 15:33:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmcTI-003eAt-36;
	Wed, 12 Apr 2023 15:33:22 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 122EE6603225;
	Wed, 12 Apr 2023 16:33:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681313598;
	bh=1+oH2VJGxX2IXpJcPBU8K/09H6Zjp51OG61aceue6n0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=It/+A/uOXs6ivhMgiksOy0vKnoqYLUSaRczY4L4AmWojKY09uzozY4sgGMDpaxcr7
	 dcKz8Uvs3/0o37xDyIZVcVtPab9aXuEsBJ7fan7PXmtqZZoir95JIlnan5KHgfE3d2
	 a7oPFD0xr0NC4jQUnCDyhJQUKm6QbqvrIWfsGPaMir6woxjqSIuOPP1SVNMUvwESIf
	 gfR8M66dO1aIg/1bkAqCbaLqun46eFmGSkJDD4Io+Z0mVtCrfTQpI18irqU52DO8Zo
	 vt7KFxSgZi5NgjCsiSeaoz+qtxNADbgT66maEJO6AdOPLJNhLh3MuDMZqTCzGDH2dt
	 7irnGfS2/1khw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: pavel@ucw.cz
Cc: lee@kernel.org,
	sean.wang@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/7] dt-bindings: leds: leds-mt6323: Document mt6332 compatible
Date: Wed, 12 Apr 2023 17:33:05 +0200
Message-Id: <20230412153310.241046-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_083321_126377_CE8D1A25 
X-CRM114-Status: UNSURE (   7.95  )
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

Add support for MT6332 LEDs/WLEDs with compatible "mediatek,mt6332-led".

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/leds/leds-mt6323.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
index 7dc63af41562..052dccb8f2ce 100644
--- a/Documentation/devicetree/bindings/leds/leds-mt6323.txt
+++ b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
@@ -15,6 +15,7 @@ Required properties:
 - compatible : Must be one of
   - "mediatek,mt6323-led"
   - "mediatek,mt6331-led"
+  - "mediatek,mt6332-led"
 - address-cells : Must be 1
 - size-cells : Must be 0
 
-- 
2.40.0


