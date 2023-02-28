Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 317EAC64ED6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EcWytE1zV3qPuUgTUrHlKD06haM13Dukluujzyp0c64=; b=adHpqVxXoLbUw4AE6PQ0XqEhci
	G3B/mJQjk0yQjcC3X2pQCzGhIRWTPOhl57f6ZXuGNVHGZMgSnQIEINK/R1VDSQGVB9L5w1GjaJcIt
	bYALeS2LXsr7bREbKQc695MqUbAFbcfZT2+LkZjSMPD8sJEo6cixolCxj0yii3SGQIPj6hm6XuBUk
	20jSM+qlVF33Ga7NvFWZJGRS7KHGb59GydGZkpS/qCJobigpSgQ74timiqC1MMsya5FIVytKYZTF1
	sNz/3Vvkid7tqm1SB66Uv6zYpW2EiC5h6ut4awdFuntlZIAtVM5aWnd+sPTypw1HkYz0pPU4jALdF
	Vr9DB6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWy-00CkEp-4n; Tue, 28 Feb 2023 10:48:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWS-00Cjui-84; Tue, 28 Feb 2023 10:47:53 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 459E16602FD8;
	Tue, 28 Feb 2023 10:47:50 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677581270;
	bh=hCOuhzILoJBXJQ8GwcXy/t+mRkm6ZJBcUpxH7FjYYQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OYeliOY9+LesjMYhIx7f5QCcRs2qu3uoATLfmuW161HAHJsRBbA7dGR8kJMeyWlN7
	 VknOmJMi0yrWc0B/6RBmvyxo8qwWkdRABE9k28d+72bvdQBAUB0YQvAPvs7AeviDDp
	 DZOqbEeffJY6yA8Bq5w+D8wMWQAKantkckWH84Fiitl8WN4BBh/kBWO0CdRaPvdu5+
	 FvipDMtYmV0DHmY8FNE3ZukS4sAFh4Kyrdp4c0VaKpSLjbcofQzH9wO6Lyy+5HSZgR
	 TkypHtjO/yVP2CiD2LKq7oHH+qsTZuS9D+93y3jXXYfP7YqtgXL21IMdt1fcfbTzNy
	 Cpbmyhm4b9+7A==
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
Subject: [PATCH v3 02/18] arm64: dts: mediatek: mt8183-kukui: Override vgpu/vsram_gpu constraints
Date: Tue, 28 Feb 2023 11:47:25 +0100
Message-Id: <20230228104741.717819-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_024752_431963_2198B270 
X-CRM114-Status: UNSURE (   8.07  )
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
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index de9778c85b94..63952c1251df 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -401,6 +401,9 @@ &mt6358codec {
 };
 
 &mt6358_vgpu_reg {
+	regulator-min-microvolt = <625000>;
+	regulator-max-microvolt = <900000>;
+
 	regulator-coupled-with = <&mt6358_vsram_gpu_reg>;
 	regulator-coupled-max-spread = <100000>;
 };
@@ -416,6 +419,9 @@ &mt6358_vsim2_reg {
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


