Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4872EC64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 09:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mV5HuQ9Svg3ODFXa0ShJffVZt3rDKNlMuzzUUjGjtzc=; b=RuKv1RQVv/FWND7qvzVVd4rKgT
	0yLfnO2WBU0bebC9ob4fqXXErdjGw7rGCL5OX+7yyUK89w0HID/sluGC1eY03cyuqo9t92Rfzhkj0
	K46kGs/QYoDNEIPUxbrPabJL8/5KU4Ly2IDs9CE7B1OqE/CyvRB2Qp8e2Hu2KPQ6+Ky13fP25/NPM
	QWFTsn+DGXYgpXosrBO87pyBnYNL175ElwhjC9HWn2ydjJyCxaLUuBq840vMX2m4Pyv1jEV3Ebv6c
	f9gVjmKhqqUNpw54TeqbWE3i1YwRk9BR4xtREYAzVJXfvph0hgjMdnbHVY/4o2q6VSJkCJhkbpSRB
	bVwWX03A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJCP-00Fe0J-Dn; Wed, 01 Mar 2023 09:56:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXJBN-00FdLE-PO; Wed, 01 Mar 2023 09:55:35 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 005876602129;
	Wed,  1 Mar 2023 09:55:31 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677664532;
	bh=Ua7BwziPqVhfWLXLBzmILApbAUpa3Hpx/UhYQnsGNBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NFQfYgKmh/wAZEKNGxC8nLtuK2x3mXJaEZNe3LXZeNA+pyYRgjxz7TXDbqb8mDzHh
	 F32yXiXlRUIacfbgzJ+BLcb0CBnFkSNJBavd6zUhLsUI0ucTwr6PUY5AmNvH0/OXL+
	 +CEuZET5PQJLwGyFV/T+nEZlj7f14XjA0SZ2TrFiPGQl9dHllRAJcOxWMBFrkGOt5H
	 qec7MiXa/qYy4uo1lLvtpGZemKuMDSghuRr5/ux5JLwRGuwUjJMyxVQXq4HHjemDnB
	 D8XPHzo9b1Xo27I/BeL5W4lPvpr3XUPrTGJb+AGmITHSmM1vF4RxhibCWzENOStbdP
	 tluhzhuX6ctGQ==
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
Subject: [PATCH v4 05/19] arm64: dts: mediatek: mt8183-evb: Couple VGPU and VSRAM_GPU regulators
Date: Wed,  1 Mar 2023 10:55:09 +0100
Message-Id: <20230301095523.428461-6-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
References: <20230301095523.428461-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_015533_968383_FB636218 
X-CRM114-Status: UNSURE (   9.82  )
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
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index 52dc4a50e34d..fd327437e932 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -52,7 +52,6 @@ &auxadc {
 
 &gpu {
 	mali-supply = <&mt6358_vgpu_reg>;
-	sram-supply = <&mt6358_vsram_gpu_reg>;
 };
 
 &i2c0 {
@@ -138,6 +137,16 @@ &mmc1 {
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
 	i2c_pins_0: i2c0{
 		pins_i2c{
-- 
2.39.2


