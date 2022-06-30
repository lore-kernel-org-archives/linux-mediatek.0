Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E4A2C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jun 2022 15:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3mVlA4DsuL+LpDpNAD1d0bbfWsc4lM4U90gU5VnffI=; b=gL20zmnjIlm63XfH0QNZpac3Vh
	XLNzdGmaXshNRBpLEFSTS1s0MpgSfuoe6zTNK2gNLfYWvfia7aOvlTQLj2e/+6wp7oZ03r5hfpKB2
	v9VS8Frkq4cjGKJy7jh0S5Xm0UUZGvBXikpH88nPcUYBxdfENqoRuPK6M+v1yJLYvKqLJHsKk3fxp
	kP+Dj11c4E97RmcrYDEBgT9NRUD2raC1X45JM7yiSAdji60l9jPEO7Rhn2CzfiBFTEMAFGIUsX3Qq
	h0k1YxaOS3/8VXTISCLOiWb1pGktmkvSbiDCpNeshH+WH1/r2myCxg1FWCPvfu7lqMJV8BF6X53kp
	rLYrwDOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wCg-000JaA-Lu; Thu, 30 Jun 2022 15:35:38 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6wAb-000IV5-Nu; Thu, 30 Jun 2022 15:33:31 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 730D76601964;
	Thu, 30 Jun 2022 16:33:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656603205;
	bh=2tnHNAZaZDCuDnnGZahAxPIq9YXQxYwRpKMSJ0Kgqks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ERvWj6dbuEBc2qowvzQ2tnF7WisXmOMOP8kXsmEV4ur1Dx4+bOFAu0+ci1T/Z5xG2
	 WHQn4MYcMd890UsLcQjYLUMkSqhWw7rFG6o3os5DYeuqbjsWc1cQJ604jA749oTYlU
	 tlMN3b03g4/WWcAAQDRJxv0z06uNkf+4lb6BhecWU4nOdAH1+rxLNTKl+CUXJNfZH7
	 FKwIENe5Wo4JezKyqCXE0XzfaKmddcuWJZ0eT9j8HSHR5bgVdXqCCRkkhIhqNFAn2f
	 J268ernK4Ujf5CiQq510O8pcUgY/YsdOhpncqF4Dg669rGAFo6qi0SARhBHHjr2vJR
	 IF971delu91Fw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	gtk3@inbox.ru,
	luca@z3ntu.xyz,
	sam.shih@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH 01/11] dt-bindings: arm: mediatek: Add MT8195 Cherry Tomato Chromebooks
Date: Thu, 30 Jun 2022 17:33:06 +0200
Message-Id: <20220630153316.308767-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_083329_938684_612371A0 
X-CRM114-Status: UNSURE (   7.88  )
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

Document board compatibles for the MT8195 Cherry platform's
Tomato Chromebooks, at the time of writing composed of four
revisions (r0, r1, r2, r3-r4).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index dd6c6e8011f9..3e0afa17ed2e 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -144,6 +144,19 @@ properties:
           - const: google,spherion-rev0
           - const: google,spherion
           - const: mediatek,mt8192
+      - description: Google Tomato (Acer Chromebook Spin 513)
+        items:
+          - enum:
+              - google,tomato-rev2
+              - google,tomato-rev1
+          - const: google,tomato
+          - const: mediatek,mt8195
+      - description: Google Tomato (rev3 - 4)
+        items:
+          - const: google,tomato-rev4
+          - const: google,tomato-rev3
+          - const: google,tomato
+          - const: mediatek,mt8195
       - items:
           - enum:
               - mediatek,mt8186-evb
-- 
2.35.1


