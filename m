Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076D0C3ABA3
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 May 2025 12:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GMja8MzF4lJ9N3IYREdz00CybaZrxQQg0o3RyFEH1I4=; b=CDFCxbFfxby5jhhA5A10bUR6Au
	u21gCzr49YdD4Lq+6XLRwqcCVspNvEk8GF80eAq30Oo9K5iYXgXUVWcjskqxRsVdaL3XJGXyynA1R
	jz2Y9f3XnZC1ZCfotjDFqeBv1XmaoFqpXVuCEEsd4pb6g8EI5GdVHbeJ529LAtGZaNRirMW0Wx/z3
	x1J8H8Hj61k6coh8CbhxmLwSbQ5NGu/5/Q4HOb858S5FzbhziYodwYdRmvLnk6ncjKvORVedEc4jM
	OvDT0GWJspleUfJoecNolub0AFwVu8PZHkNz6IKxMFLr9cr8V2lF47Nx+vweVJuauRPdP/i1CuOLD
	A4NiBJWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApSK-00000001ttx-0Jmb;
	Fri, 02 May 2025 12:25:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uApKe-00000001sTn-1sV7;
	Fri, 02 May 2025 12:17:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746188251;
	bh=Nh/3NP0bjRTX7YboruB3JZ2xLOeP0c8eAjI6a96C+Ns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fAwyZno/6cHCUZVscF4DkoZ7XGBTZJ3WP3x3xzSDPicemItU2TSq4GDzH/CTcQvku
	 7d5N+U1CzQpasIedHwzZR4Fy00LONxfT8nhXyAFAYZXMTlh68Cvtdzj7tOWd0vvksg
	 ixrV1MgJj3hDnsjUqs3BQi4WvTz8DSKWkb1Miy5aIz3VT0R08orJeMPWhwVqG9ahSA
	 PT8cjaCa4llX8DkE9CYOjjVy5/R039U2+TEGHnYA5ukVxtxsP8X+DZT1caLP3F2cCF
	 BXNe8K8ftiCliyI6du1LQW6qCPXiiAABGXloEIlYZ7wa1+LfGEf+59wXKfbG22cRMa
	 gdZZmXLENVapQ==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE25917E1501;
	Fri,  2 May 2025 14:17:29 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 02 May 2025 14:17:18 +0200
Subject: [PATCH v5 3/3] arm64: dts: mediatek: mt8370: Enable gpu support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-mt8370-enable-gpu-v5-3-98e247b30151@collabora.com>
References: <20250502-mt8370-enable-gpu-v5-0-98e247b30151@collabora.com>
In-Reply-To: <20250502-mt8370-enable-gpu-v5-0-98e247b30151@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746188245; l=1948;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Nh/3NP0bjRTX7YboruB3JZ2xLOeP0c8eAjI6a96C+Ns=;
 b=qmFSu2pylbCfjivhz97G7x5XNAkEwik16epSM6J+vUCs0Bi+5XDSGEUacRx1zhPdR+p/l1UZ8
 BpIix3PXhqDBfi6MG/Xpdmlo3off2fhC07xuSrpB88P1Dhf5RKR4Ts8
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_051732_637515_ED82B84F 
X-CRM114-Status: GOOD (  12.83  )
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

Add a new gpu node in mt8370.dtsi to enable support for the
ARM Mali G57 MC2 GPU (Valhall-JM) found on the MT8370 SoC, using the
Panfrost driver.

On a Mediatek Genio 510 EVK board, the panfrost driver probed with the
following message:
```
panfrost 13000000.gpu: clock rate = 390000000
panfrost 13000000.gpu: mali-g57 id 0x9093 major 0x0 minor 0x0 status 0x0
panfrost 13000000.gpu: features: 00000000,000019f7, issues: 00000003,
   80000400
panfrost 13000000.gpu: Features: L2:0x08130206 Shader:0x00000000
   Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
panfrost 13000000.gpu: shader_present=0x5 l2_present=0x1
[drm] Initialized panfrost 1.3.0 for 13000000.gpu on minor 0
```

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8370.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8370.dtsi b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
index cf1a3759451ff899ce9e63e5a00f192fb483f6e5..7ac8b8d0349455922a73f35db607b2b27cad23d7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8370.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8370.dtsi
@@ -59,6 +59,22 @@ &cpu_little3_cooling_map0 {
 				<&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
 };
 
+/*
+ * Please note that overriding compatibles is a discouraged practice and is a
+ * clear indication of nodes not being, well, compatible!
+ *
+ * This is a special case, where the GPU is the same as MT8188, but with one
+ * of the cores fused out in this lower-binned SoC.
+ */
+&gpu {
+	compatible = "mediatek,mt8370-mali", "arm,mali-valhall-jm";
+
+	power-domains = <&spm MT8188_POWER_DOMAIN_MFG2>,
+			<&spm MT8188_POWER_DOMAIN_MFG3>;
+
+	power-domain-names = "core0", "core1";
+};
+
 &ppi_cluster0 {
 	affinity = <&cpu0 &cpu1 &cpu2 &cpu3>;
 };

-- 
2.49.0


