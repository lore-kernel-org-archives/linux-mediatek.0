Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC21C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 11:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vO/UmvLkCj9umjN0OSo64LG0XBWRmEZXiNTOZ2Vrsps=; b=UhuNZAjGa0YTmWradspVTJi7K+
	QZ1wwuCsROyJzn3fBCdy7CuF5wUINQR5HOoTfmd1YtSWbzpLNKvQPZR7r5y/tcD7riIrye1wEWOLL
	EeXmJwBN9V8ijJ6XKaxcXyJgwVRqH62NWbXueU+FeUpHkxoHJP4OUihy0VBE4kjveLIpF4fD++jvD
	19u7FNCVWG8FlPMS7GblY76HP0j3DoXU7sT/s2zQ+YzZFWemGej+ttkiUODCG6v60PfLI9/LlI2yu
	WPx0an3uOAzzpf2Oow9QGXF3zRuIFuGz/BekJk7SWoZmyjLm4wcFBYWqCxZFn3R1jXmcBGvpOxyCS
	S4YDDb3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYeT-002oOm-2A;
	Wed, 12 Apr 2023 11:28:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmYdo-002nes-1F;
	Wed, 12 Apr 2023 11:27:57 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F2C786603236;
	Wed, 12 Apr 2023 12:27:53 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681298875;
	bh=x/at//afCB0j0N1gb1tTAezuut76wMigos38TLiuLr8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d76OL4b4GBYmBtFLGa9qb42sqADv1D7L1HaBnbteGBcDmhmFUDAs4Iw+ANveie0o7
	 EgVkW4ygwL5AM/quWGLZWh5SGotmbz2etEJ87MeZRfNnNCOpgyA2nbVjyk82ruHq7W
	 +e83r2LiWZKmlp9ucXvq1n7JyY+hUEzDgRU3Hsw4/Ws01AnXZzAR90xymFHGLFJX5O
	 Y6lETcTYKTIrAaFuJR7a1172uyev0QyKJepzNEhP3mHfuacyv8mhFY2uy42fkNq3fx
	 HXeEFj6Xv6yarb06T4l99Ml4k9oa3tT2/yNlBpDcMSXY8uLBbpKA62Te36sD6EHaVW
	 cXZ7Q1EMgAMyQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	jassisinghbrar@gmail.com,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	chunkuang.hu@kernel.org,
	angelogioacchino.delregno@collabora.com,
	ck.hu@mediatek.com,
	jitao.shi@mediatek.com,
	xinlei.lee@mediatek.com,
	houlong.wei@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 07/27] dt-bindings: display: mediatek: rdma: Add compatible for MediaTek MT6795
Date: Wed, 12 Apr 2023 13:27:19 +0200
Message-Id: <20230412112739.160376-8-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_042756_568466_6BE7BA73 
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

Add a compatible string for MediaTek Helio X10 MT6795's RDMA block: this
is the same as MT8173.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 3ade2ece3fed..2eb99d2dfbdc 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -40,6 +40,10 @@ properties:
               - mediatek,mt7623-disp-rdma
               - mediatek,mt2712-disp-rdma
           - const: mediatek,mt2701-disp-rdma
+      - items:
+          - enum:
+              - mediatek,mt6795-disp-rdma
+          - const: mediatek,mt8173-disp-rdma
       - items:
           - enum:
               - mediatek,mt8186-disp-rdma
-- 
2.40.0


