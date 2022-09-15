Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D76ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 09:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4Dg/zaOmJSx2y9W1z/Y2HZQcqam3b8d7wi1AzHj9CI=; b=s5jNknj7R1Mg/stFiCkXDx54D5
	76IUPrJJV4jc3wlkMR2JH7ghA9+M9F489PlVi41LuaLiOcb0XNq9WN8xkLC/Qut0in0a/rqVSND6E
	5IKGcnVdf505IV/Kt6zQ/KYXr6LC+YFtT4Zu5C8oTKsyyZwHGu6lFkYGRG+9Wu1jLHAZZ/IZW00hf
	SzkV0fh1JM5WHvMLJSfJrG9l9oaHRctAHUP6uK8DSscBnYYT5RmKxqxHAkNzrJdJdMWBqQXRv5QpN
	VNtY5y793IIoK2ZWfDqYLiC4IugxAmHS510+dATp2139G+MqLXO41I6dO7qSzo190ToAKqqwP6fL6
	4ojjEcMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkxz-004yPe-KJ; Thu, 15 Sep 2022 09:15:27 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYkv4-004t62-Q5; Thu, 15 Sep 2022 09:12:28 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F2B656601FF1;
	Thu, 15 Sep 2022 10:12:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663233145;
	bh=6jfqnEPzdQK2D+P1O+BfVEHosUL5CKX6vJs+oxLvAN0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CvXgwQLs7+WFiAzDX95/l5PyPWVW9J1v9nvmZId0/+ryl+WEeZHyqYR8Jlem7nh36
	 GjJeNXrqEsCiDKW8Q53RNhykS0yrcLqOTyFlpFmgqfrwmg0qPeVUNgo4zXxToIXnGt
	 aow3xlT+9URCTAn9O5PmSUkjSj94cJZlq5oBViefIFAYE+HtBTDw2/juUTOZTtpgO8
	 oUL0lAYe5yLbP9ZhjbrvE/Lc/v1ffgYTSsW4sanVLdhULHmP/jJ6wD8nrPcWt4stIz
	 VGNsCvFTGd1sqdEfuhyFB5tN+PswXhXKNs4pNTzWa7M48WgrvFXCqGRomLqieYu2dj
	 TzN/juGL7ivQw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@mediatek.com
Cc: pavel@ucw.cz,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 4/7] dt-bindings: leds: leds-mt6323: Document mt6331 compatible
Date: Thu, 15 Sep 2022 11:12:11 +0200
Message-Id: <20220915091214.59673-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220915091214.59673-1-angelogioacchino.delregno@collabora.com>
References: <20220915091214.59673-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_021227_019074_F23BC4F2 
X-CRM114-Status: UNSURE (   9.33  )
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

Add mediatek,mt6331-led compatible for the LED controller found
in the MT6331 PMIC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/leds/leds-mt6323.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/leds/leds-mt6323.txt b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
index 45bf9f7d85f3..08dcb237a8c2 100644
--- a/Documentation/devicetree/bindings/leds/leds-mt6323.txt
+++ b/Documentation/devicetree/bindings/leds/leds-mt6323.txt
@@ -12,7 +12,9 @@ For MediaTek PMIC wrapper bindings see:
 Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
 
 Required properties:
-- compatible : Must be "mediatek,mt6323-led"
+- compatible : Must be one of
+  - "mediatek,mt6323-led"
+  - "mediatek,mt6331-led"
 - address-cells : Must be 1
 - size-cells : Must be 0
 
-- 
2.37.2


