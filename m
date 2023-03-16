Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95434C6FD19
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Mar 2023 10:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=giKtQTON/TdzLVpitntbmk6krA10Dtr2JBzVqO8dvVw=; b=iu5gzqrhgfyKIhxJmz+9lILybk
	tkzPl6OHIvqZjsHxe446XSwy7NOT4zHSy0t/rWnpydolOj3VeCBZlHI2SWNEm+4RG5xBUcFvXon6S
	heDbUMH8XHJC5dj4RmYbk2PSOVLOkRnJjUWoSes3JH+SOgqdxa4m9nA5jSEYhwDiEL2e974zr8Lgl
	8iaQO3v9E0eczINu0hHuzrK7zpX6c5QnvFUAqKrbDtioRNmmsZpLNgoZff4I7DhdxYookJvj0M2gQ
	KZV9a5+A+Mjk7SLgXLDwzYf+JXoy2++9eVUmYbcIR88qDFuGdKC52gm287DsnU6DsKH5LeOsV4Mni
	vmO/SXiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pckjv-00G1Sq-0B;
	Thu, 16 Mar 2023 10:21:43 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pckj7-00G0qx-1N;
	Thu, 16 Mar 2023 10:20:54 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7DF9466030A3;
	Thu, 16 Mar 2023 10:20:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678962052;
	bh=K9yinOJko6zzZkMe4qGeCS9OW1OYLujXAPuZpWyodhg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PH0QDH67wQD+cAv/qmvs91HIUbrel0QvgoAcHb3NbKlvwiMFxyZShkUgQQCuHLooI
	 5k/R79dq3TBk175tqXtAx6JGwCy+iIsly/SBouQctONXkNHQWqxxPgzDN6AVyrz/7b
	 aXyIeupRe6nxRD70u2Xv23d2oOiGtcWYQNZtpWBqAJFoSOpJfZPIN5RKvZolsp1Kea
	 ArxzsDFwwpcbddr1CSkAdD/QYSa926f/a67HSQpuPcUHMCsaCuFzICRarHa5a6qeIe
	 d/d+1uw/yX7E/yTixPBVM+Bghyf7hhhlwhNUrpwqkxkdPCFN6rZM5OJA+pSw3jt8CS
	 TvP7pN0VLbdhg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v5 07/12] dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
Date: Thu, 16 Mar 2023 11:20:36 +0100
Message-Id: <20230316102041.210269-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
References: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_032053_597799_F4994760 
X-CRM114-Status: UNSURE (   8.04  )
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

The MediaTek MT8195 SoC has a Mali G57 MC5 (Valhall-JM) and has the
same number of power domains and requirements as MT8192 in terms of
bindings.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 3d0d96913b1b..3eb9a4e95e92 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -27,6 +27,11 @@ properties:
               - rockchip,px30-mali
               - rockchip,rk3568-mali
           - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
+      - items:
+          - enum:
+              - mediatek,mt8195-mali
+          - const: mediatek,mt8192-mali
+          - const: arm,mali-valhall-jm # Mali Valhall GPU model/revision is fully discoverable
       - items:
           - enum:
               - mediatek,mt8192-mali
-- 
2.39.2


