Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3471C64ED6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyQ5BWTyYJlfx1hxo9jGb9AQdRNIY7zP6P8241WIMOs=; b=F6BK7PUcFn0z0cYAT1/gx8LP6j
	mZldvEO4200fZwS4kc+k0/14oLL5W1KSicU3Gf5fJcw8FA4aGD6ydkmXunnZZh4gpXaGmS9fO/0jh
	ZjApTTeU9f4BOJm7JjpdjzvcSisag/tU45NCzCK5+nP+zCwrp53sq67foN/z3ewXNfVIfq5/cknVQ
	LmOtdKzz+5vFFIPufI4rt0MC3rsY1feOcXjwavt3SU1jLWTuWhgUNB0+LBZW3k5rXzKdHIp6QudFS
	Y9uso9YwCmAEasOMNKH+6AATNGLHpF8mvgVocgwAJHpo7XNRRi2XocCguqkV48aO/NGPSQNFj6htF
	pShKmi8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxg2-00Cpf7-Nb; Tue, 28 Feb 2023 10:57:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWc-00Ck3T-AO; Tue, 28 Feb 2023 10:48:03 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 929D76602FDC;
	Tue, 28 Feb 2023 10:48:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677581281;
	bh=xNmiw2ujYQURCmwW9t7m1kerphWvM2Xx2d/qe8evz/4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EsL4UoDdDIceOXiCYkSlqmWUwfG44aQh0lfZSEHL8OECQjdQuvUBvh1ZolqJtIaU8
	 RUj2bFLzPSTuVesYRUOmQ282jVzYJ4RGjhKZuRh3Ss8MAywL1z7ohC3E9bNreQMTPL
	 0au+IEQ+7cZbTtuXWwX1Dc3uzp1egiNOGXeVcqIn7zIXQSny54lpAt2JviiQ2Smngf
	 Hoqk1M8I7WShI7dgWtT63W9sUUNyAGTS9FYvqSNR5yAuUl/UMWfS1RYA1aJdtvdeYi
	 sCuc1Gl4WImVJz6Z4H4F1Naerwq6+b+Wj2r50WzbPfU8Ob3ShzqvsMkymKAmcT63h8
	 jk8AQxf7bYZlg==
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
Subject: [PATCH v3 18/18] arm64: dts: mediatek: mt8183-evb: Override vgpu/vsram_gpu constraints
Date: Tue, 28 Feb 2023 11:47:41 +0100
Message-Id: <20230228104741.717819-19-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_024802_524686_87FCF723 
X-CRM114-Status: UNSURE (   8.20  )
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

Override the PMIC-default voltage constraints for VGPU and VSRAM_GPU
with the platform specific vmin/vmax for the highest possible SoC
binning.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Suggested-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
index fd327437e932..3e3f4b1b00f0 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
@@ -138,11 +138,17 @@ &mmc1 {
 };
 
 &mt6358_vgpu_reg {
+	regulator-min-microvolt = <625000>;
+	regulator-max-microvolt = <900000>;
+
 	regulator-coupled-with = <&mt6358_vsram_gpu_reg>;
 	regulator-coupled-max-spread = <100000>;
 };
 
 &mt6358_vsram_gpu_reg {
+	regulator-min-microvolt = <850000>;
+	regulator-max-microvolt = <1000000>;
+
 	regulator-coupled-with = <&mt6358_vgpu_reg>;
 	regulator-coupled-max-spread = <100000>;
 };
-- 
2.39.2


