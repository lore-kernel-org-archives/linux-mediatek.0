Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72271C64ED6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pb6hDVN8FtBiRxZXSTwPMzxOH1IVqv4t7H7OxKKzXGo=; b=VC9HADPypLTOrahFMGSxea0LXd
	Aa2Z7IXhMYLY31Mt6lLVaYL7wE0dAg03vc+K6ZrJssoyY3eEwrZlT4I3XPMvynUm0a+o2t3y52RPz
	VjKW4lpwXfnLaoCmG7MuJj7F+Jjpf2pF7zFTYprw61W1wd2YOPScOt20k1SG1yRqbRpYb4EsyVuo7
	1xHM8goJmfOL/d7qG87GMJkzMzJOSxffPWcWb0nhB4NYk58zdJuQ9K/ONV+5q5bvkHLawlgfeVxKy
	5BBRJVRb0ubwJLxOeJRh4T2ffrQ3Z4/M/FWve89Tq8ltZMJq8Y1KuD697lw7YVxdfoRKF8eBPubuY
	SLIxsZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxdQ-00CoCU-VH; Tue, 28 Feb 2023 10:55:04 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWa-00Ck1g-BJ; Tue, 28 Feb 2023 10:48:01 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A26596602FD6;
	Tue, 28 Feb 2023 10:47:58 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677581279;
	bh=eoUuj+cxZRXF8or5zd6PgagsDUpoYC3djot0WKXw2CA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NZ0+0OKWVIQRQzwWaxjzmQDnnUC0Hi0PNYg4+iQtCpKAJLcIdMW83XgGUT0hc4Jn0
	 oafIIAmOCzQd0WmOIpnzlc5I2WgByKaOo8pSfakuhx1p8kj20Nx+VOSh4MK0G/srDL
	 GHK5Ej/R2HfgJT8PNF0n56oAsiy/31I0juGfH8I5F9tus73xnvbTePXjjUr9K0Pzfh
	 x2T/loYUkJ1+b/7BR+ptcrNHN74bp5UeupXXWo7qPIPNQgA8HJ8pwWZs2E7hgitkzA
	 wc66iQw/Gc/NjdOnaW+F6o2mPH8jRGtaJR2GDvl98jEPPE6uBWb5X9GAjnQB3H2PTD
	 TFlgQZN/vMxwQ==
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
Subject: [PATCH v3 15/18] arm64: dts: mediatek: mt8195-cherry: Enable Mali-G57 GPU
Date: Tue, 28 Feb 2023 11:47:38 +0100
Message-Id: <20230228104741.717819-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_024800_555948_5DF8E213 
X-CRM114-Status: UNSURE (   8.88  )
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

Enable the Mali-G57 found on this platform with the open-source
Panfrost driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index 56749cfe7c33..24669093fbed 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -238,6 +238,11 @@ dptx_out: endpoint {
 	};
 };
 
+&gpu {
+	status = "okay";
+	mali-supply = <&mt6315_7_vbuck1>;
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.39.2


