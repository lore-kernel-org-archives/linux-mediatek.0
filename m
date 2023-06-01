Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00FAC7EE2A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jun 2023 11:08:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASh0CiHiaCAj/rAntGdv0/242NB7fKWTXkURt8j0Fqs=; b=qSzl43OIa2Kiwld5JTp1Qr9t1X
	KW4P61sXSemjiZGvRWQxBvKMNqS36lvErCRfiIht1VFNPktahBwh14IcymxVvNLZVbzTsuJfZkR2I
	nhuhpp+G5/N3hlizTzDO7k2XOz2ayGzAJsgJMmhIgguVyX3IIHkS+3ju1oIdT+xlzHDtz5sZH3R4M
	BTKku+KBHbqcHnUX0Gp2ar6rE/rmcK0pkBgkGWfVCV6F3EpPp4TrsevhpXIHWVz731Vqc+U/2eFvv
	lyBTPHARCqpOVtPkKGGASmNs0psLrx+yR88iS8/Em/agQx5odPDXU1OkWgvRcrXHqD/DizTUHYtSV
	DRbNRluA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gAP-003AxY-2x;
	Thu, 01 Jun 2023 11:08:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4gAK-003Aqp-0t;
	Thu, 01 Jun 2023 11:08:25 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E8BBA6606EC6;
	Thu,  1 Jun 2023 12:08:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685617700;
	bh=nQ0MVqFfgCHhWG42gWfQJ98uBqo9DXUvooDjVe+kw74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=es2RIr04MQGlehj8/qes9XlFsnSt1kn/mhZfx6W8aZjemF5KMuDoqVefpiEjSCx9J
	 7DoUHG9rAApWC4fBzCEZnaOfbuSe9HBMZIn8zj4tnhcRy3E7HcZxDx740I5jdT0Vd7
	 U6ikFPhHA0PrAzKoolJqYUtQJRhApi3sPOL5jwrArXzBfOqvKP7JYdmiejL/E5gtBe
	 jzXSArXh3bL4s3/nwjvG1CBxrxPpPBzyAyn+kfGxL6k73MaippcFhawuO5msPLpOud
	 s9ovp2opBLJoVbbDaciCggFZS/bsGhSffhq4r6nwtuZuNPZ/iuAowlwsZyQ3KqR5+p
	 oP/NpuExVitNA==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v3 2/8] dt-bindings: leds: leds-mt6323: Document mt6332 compatible
Date: Thu,  1 Jun 2023 13:08:07 +0200
Message-Id: <20230601110813.2373764-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
References: <20230601110813.2373764-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230601_040824_469923_848C47D2 
X-CRM114-Status: UNSURE (   8.56  )
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
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
Acked-by: Pavel Machek <pavel@ucw.cz>
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
2.40.1


