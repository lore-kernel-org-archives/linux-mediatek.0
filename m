Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85233C7EE31
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2+ffK6k3wuxRJkjIkwzv9FZHaR6LLvsyi/OIXg5VlQo=; b=4bn/BKEQ2uVkLsZIpb09JJgRNw
	wA9WzP7hIMSvHYcXEDbIBTtWMhCX8B+QIKLxPedZ2UzrFfsBzCWC2dh0gQTIx0aokNFWaI95lJYpb
	iPK60TKd64SWfWxqrHYXzIrUD4/Wg0y9p/J2p/0yvfD2uBvjjZWic2rQYvQAB55cclPVGcaXfIGW7
	gtNNT3GNnXPt5ouh/05oHVrLzF2ILfZamuXu11UeSXPQQj2+VjKbsKnG0iaeyAwVeBaMZOFsEroK9
	IJM4sw3LlvgqCkEHn+u0nsiDWPpVYQFENwM73GLX4IlzRm4k2/bkYoS19R09VI74mWVYIpHkDPrTm
	rUFTWDaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxXV-00CkZM-Sg; Tue, 28 Feb 2023 10:48:57 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWT-00CjvI-6i; Tue, 28 Feb 2023 10:47:54 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 87EFD6602FDB;
	Tue, 28 Feb 2023 10:47:51 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677581272;
	bh=iTiXsbcvL98tLYBNMasBh9C/GsvGSy9IVHh+FRRt/uQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JUS5j3F6XoHW0m9VpkYAIFNOvfhSr5WYYwQlBODNQmGx6LU3E7Gu8H1TB92gy8Xjd
	 Kq8eF5nFyJbUGP+bKRFb4ly03VMEG7gXr88VMTxkAgeMycW30vbYKZeTxY5GOHnUkY
	 9uLnnuXfvwbnQ9QdnH/A0ESKNlKVZOe43ZVPbkcI/xQchKJW3z/A4mLOF9n08ljlwh
	 xYB3Q7tWUGWaeFC7Sqa9wJ9iQboVT6OMANFbFI+qau7j/iTk1UBInJP8FvXB5wrR86
	 JoMTMJhx3jbt5f6V/SLnOmfLmCcAxnU06nODrQa0PQl5k9UZgEKCYu/MZCpf6sHIc8
	 p8qn5ynxr+8Hg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org
Subject: [PATCH v3 04/18] arm64: dts: mt8183-pumpkin: Couple VGPU and VSRAM_GPU regulators
Date: Tue, 28 Feb 2023 11:47:27 +0100
Message-Id: <20230228104741.717819-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_024753_394624_1EB7D854 
X-CRM114-Status: UNSURE (   9.23  )
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

Add coupling for these regulators, as they have a strict voltage output
relation to satisfy in order to ensure GPU stable operation.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index a1d01639df30..c228f04d086b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -71,7 +71,6 @@ &auxadc {
 
 &gpu {
 	mali-supply = <&mt6358_vgpu_reg>;
-	sram-supply = <&mt6358_vsram_gpu_reg>;
 };
 
 &i2c0 {
@@ -176,6 +175,16 @@ &mmc1 {
 	non-removable;
 };
 
+&mt6358_vgpu_reg {
+	regulator-coupled-with = <&mt6358_vsram_gpu_reg>;
+	regulator-coupled-max-spread = <100000>;
+};
+
+&mt6358_vsram_gpu_reg {
+	regulator-coupled-with = <&mt6358_vgpu_reg>;
+	regulator-coupled-max-spread = <100000>;
+};
+
 &pio {
 	i2c_pins_0: i2c0 {
 		pins_i2c{
-- 
2.39.2


