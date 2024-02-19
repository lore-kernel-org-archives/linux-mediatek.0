Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E94C48260
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 08:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ufo5dEOR23OUDHHUD02/Owg1tHNKsRIz1sV3AvJTI6Y=; b=ah9Xm8m63vlZ7LIU7e1TesDWvm
	Zp/0MUJswDbA2OVOlD3B30MK2QeAjHkXDFgt8k6lNqn2+1uxOALV5RVc/g/7suixropFRNMJ1jUuP
	5kd1LB1FfKYHooOGIayRuDLoa7Q0SCy0AD2i50HGcyTtp7bvYY4bF4BTRGzlFvyrKENsskYJ+doWU
	fbwc0+lpSBeKK+GyLj40/ZHkVOnBxy4cm1rLWahqQ99j+S7JRt5VXMYvCKyMBU4Ew+P08VH5RYVGT
	z/IRkjhMIlmtoobFhIxr9Uvub90GOn1lRGdmVlqPKmJFwtGCRVgXwRs99eg0jzzjIg4E0HFGNvZ8w
	BLSrLEbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzGy-00000009dVO-3fYC;
	Mon, 19 Feb 2024 08:45:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzGv-00000009dUp-2Z6S;
	Mon, 19 Feb 2024 08:45:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A590060C3F;
	Mon, 19 Feb 2024 08:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22FCBC433F1;
	Mon, 19 Feb 2024 08:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708332308;
	bh=XCRrHzV6LyBu4+jXcasCLefrxDxH3vBtjp/y8ZvMbrc=;
	h=From:To:Cc:Subject:Date:From;
	b=ptrLcM5h+3p3S4UnLs9iw1O/cuanKKZ3WrHwxq4E62NhOE3IdSLslLenjnHjRP8/j
	 Hdu9gh9TQgqN01a91xeTtE4L9A504C3el7W0qfylpYUhI+1fDTXnlOnrWzhLVQn1aX
	 VcuHkejnW45BeWUxl3p4r29LQpmxCa0sB3W0O8MVPA8rISOSZd9TwoovM1uyHyiup6
	 9SKyl9T88sGW8qv2NlN+//9flZcwb6ArYLqbFxJxAo3+kPgxUfGMyWYmcjE4THVi8f
	 Sk6I7X3RkC+wdSLQ82kmA16+e/1kJfbXGPvsN4BgT0xlBWx3hULu95bvN1KLtecCOn
	 U0AUKSbDi97LA==
From: Michael Walle <mwalle@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	Sean Wang <sean.wang@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH v2 1/2] dt-bindings: arm64: mediatek: add Kontron 3.5"-SBC-i1200
Date: Mon, 19 Feb 2024 09:44:55 +0100
Message-Id: <20240219084456.1075445-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_004509_724484_9B69E6A9 
X-CRM114-Status: UNSURE (   8.36  )
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

Add the compatible string for the Kontron 3.5"-SBC-i1200 single board
computer.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
v2:
 - convert enum to const as there is only one specific board

 Documentation/devicetree/bindings/arm/mediatek.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 09f9ffd3ff7b..add167d8b8da 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -357,6 +357,11 @@ properties:
               - radxa,nio-12l
           - const: mediatek,mt8395
           - const: mediatek,mt8195
+      - description: Kontron 3.5"-SBC-i1200
+        items:
+          - const: kontron,3-5-sbc-i1200
+          - const: mediatek,mt8395
+          - const: mediatek,mt8195
       - items:
           - enum:
               - mediatek,mt8516-pumpkin
-- 
2.39.2


