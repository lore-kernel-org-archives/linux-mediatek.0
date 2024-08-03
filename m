Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E327C49EA1
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Aug 2024 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aJHoKAB11Ae/2wa8twupEAFotnxUJVnsciLUvRiPVy4=; b=AqWNfovdPpMGw1YtW39xtMe+51
	DQDcgAZw8ap8Fd9E12SDsBXNDa9IjoiEWyrHJ0YeTl8XBOqib1OQSfHtEApKPnL/Gsv01Rz2udnyb
	Mt2FyCr1teE9G41/jVc5ObA8U8puFV3Z2WLoXbUfFA1QGgHanprasNnrfXzzVgpGK2gqnnP8k3YJV
	oqJOdxlSgK5dT9XsRZtxh1Dawh93fOgaQd/cT+cBJzvCV2aQOG227ReRBTdaAkOJwhjJo+JT1HWcG
	VUn1RCb/K4zLKCd9ZmjaPMoQBz2Aa0U98PLO/oJIFRyFyIP7lBvGRAiy3akD6IYWAe+Nd/Z/pOO0D
	owCOlReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saFqG-0000000BYcd-0WJq;
	Sat, 03 Aug 2024 14:34:44 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saFpk-0000000BYYE-0iWy;
	Sat, 03 Aug 2024 14:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722695647;
	bh=owOHmulNCYiFLR9S5cHIHYrchcu6rmh/Rs/wsMUcUNI=;
	h=From:Date:Subject:To:Cc:From;
	b=wBAcmHgHiJsDWuOYvZphH6cDoDrjqrvyB/fdB7/Eroxv1CKLF24N7pCy3U7iNZ4B0
	 Jl0bztbbX/zMMRHzZsDPQ9fQzJpnIfi6r1c48LEkjh6+Fu7MRE/VPLBciCfGWwLN24
	 vGV6GTAB0oiAdtlZEQLHybq/bzshmOD6xrSMZsB1T1Y100iSbb/pseC0DQAI/8+HD7
	 d1bzbhHdUtiup+qSeOA7unNqLAbUNeBeXYvkPfjGLuCOAb/0fiaEksUTzaaNRwuSum
	 yCmwPJ9qLrh+ZJrDYNU/rCc3LU57GIW56OyrVtY34BFmQ+MCU2blUqRD8euzPU+4/J
	 mZ6JoXxlYG6kw==
Received: from [192.168.1.67] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id C2E133781480;
	Sat,  3 Aug 2024 14:34:04 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Sat, 03 Aug 2024 10:33:25 -0400
Subject: [PATCH v3] arm64: dts: mediatek: mt8183-kukui: Disable unused
 efuse at 8000000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240803-mtk-socinfo-no-data-probe-err-v3-1-09cfffc7241a@collabora.com>
X-B4-Tracking: v=1; b=H4sIALQ/rmYC/5XNvQ6CMBSG4VshnT0GWkiJk/dhHPpzKo3QQ1rSa
 Aj3bmF00vH9hudbWcLoMbFLtbKI2SdPoYQ4VcwMKjwQvC3NeM3bWtY9TMsTEhkfHEEgsGpRMEf
 SCBgjWNl1vWiFNT1nxZgjOv86/Nu99ODTQvF93OVmX3+VcwMNOM2VsUK1UruroXFUmqI6G5rYr
 mf+l8iLKBXyrqDaGP4tbtv2AXSn/7sgAQAA
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240803_073412_527890_8D495D72 
X-CRM114-Status: GOOD (  11.90  )
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

MT8183's Devicetree describes two eFuse regions: one at 8000000 and
another at 11f10000.

The efuse at 8000000, unlike the one at 11f10000 and the efuse on all
other MediaTek SoCs, does not define any cell, including the
socinfo-data ones which the mtk-efuse driver expects to always be
present, resulting in the following errors in the log:

  mtk-socinfo mtk-socinfo.0.auto: error -ENOENT: Failed to get socinfo data
  mtk-socinfo mtk-socinfo.0.auto: probe with driver mtk-socinfo failed with error -2

The efuse at 8000000 is disabled by default but enabled on mt8183-kukui.
Since it is unused, and to prevent the errors from being thrown, disable
it on mt8183-kukui.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Changes in v3:
- Switched to removing the node from MT8183-kukui's DT instead of
  controlling whether the mtk-socinfo device was registered by mtk-efuse
- Link to v2: https://lore.kernel.org/r/20240708-mtk-socinfo-no-data-probe-err-v2-1-7ae252acbcc2@collabora.com

Changes in v2:
- Added missing include for of.h
- Link to v1: https://lore.kernel.org/r/20240708-mtk-socinfo-no-data-probe-err-v1-1-fb2acd3a47bf@collabora.com
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 6345e969efae..7c8221fe62eb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -868,10 +868,6 @@ &mfg {
 	domain-supply = <&mt6358_vgpu_reg>;
 };
 
-&soc_data {
-	status = "okay";
-};
-
 &spi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi0_pins>;

---
base-commit: f524a5e4dfb75b277c9a5ad819ca5f035f490f14
change-id: 20240708-mtk-socinfo-no-data-probe-err-d7558343dc82

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


