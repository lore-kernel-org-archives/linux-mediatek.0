Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B581C77B73
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 09:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=akMv1feg0z0Bi/UQ/OnfW5t2LZjQw2Xx/+zZkmCBsQA=; b=xQizC6vt/jnKkoIKOt90BAdWsi
	qZjSCDQxl4MKlXb6tChg/VcRphVDN2C4UInVlWxJF6pFZXp+4NkUVyLn2KrqlGR8Me2c57i0HD52/
	gC6v05mRkA0sH2/BsgNW2+zLIjXb50kbgFOHWH9sfy9j9d+Rm1LTD08c8qzD3+BdAyZpjm2Yfm1c3
	nCTB47WMwQzJs/z7KDODZivkivsrSrgRCxxywFlYKkszMy20u5/MQtFLBaBxz9c/zOfCjPW77Sl14
	8Gc/anX3NwHedOwfm+pgLo4Afc6EzWYBB7etKEUf55ZkQYbxJ+wXI4heblZc1QLNWlbJHpXR37NFF
	FyvgMCxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQqz-007ZiC-0E;
	Thu, 20 Apr 2023 09:45:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppQqR-007ZPZ-0O;
	Thu, 20 Apr 2023 09:44:52 +0000
Received: from IcarusMOD.eternityproject.eu (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D498666032C3;
	Thu, 20 Apr 2023 10:44:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681983888;
	bh=Yqz9hxxQpWZLM7rhN5aHeOJGmtYVI7oPhYrdCY62XwY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fzbdLfM1L2lDA4EF69I31/GpYjSqkZ8Yewgd7Ym3oQbNgU017Ezx+R1FN0DZTMfw8
	 GIh0PF8dBPEYGc0ujaEeoPgULCWknjDfMaNO1BNV1So1LxgOFxQPxfyilG3m40EiTd
	 Kg+Tne0YZowKPFJzng/zaRpGS+z4fvFQdj08sQ+tzsd/Udrwz8JYgHJI9TdI+gnxDX
	 bHs8DKZ/7W/idXhbDBMpD1k4lGedjnXATxFqIEwhBGm56Xv3RY7rKnwmOm8N6Dx2nf
	 g32GlXMl90pIm8u8oAZ7rp/xEKsIpZiGqqOHDB1P4mBRuuqmwyX8ZshQmR1s3ATOyy
	 BIMBtKTbGjFfQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 5/5] arm64: dts: mediatek: cherry-tomato-r1: Enable NVMe PCI-Express port
Date: Thu, 20 Apr 2023 11:44:33 +0200
Message-Id: <20230420094433.42794-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
References: <20230420094433.42794-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_024451_305996_F621680B 
X-CRM114-Status: UNSURE (   8.72  )
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

On Tomato rev1 the PCIe0 controller is used for NVMe storage.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
index 2d5e8f371b6d..11fc83ddf236 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
@@ -20,6 +20,13 @@ &sound {
 	model = "mt8195_r1019_5682";
 };
 
+&pcie0 {
+	status = "okay";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_pins_default>;
+};
+
 &ts_10 {
 	status = "okay";
 };
-- 
2.40.0


