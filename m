Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D26C64ED6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Feb 2023 10:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZEd3g//7mpoq/lQlfiRNR3X3NLQ4XWrdrl3CYDAo+k=; b=4EEfB0cHe0QlVJrkjdofHG6SsP
	JpfdG39/yZd29JQTYcXVfNorCiji5FZVvirbiE6dtYnz+fuL7nQY/TFt6pan3dYahe4uZCUnkepnZ
	wGqiMHCV55t/RNIC9UF17mSFPckiM4jYUMP2KDpQrjhFU8KMj8Bqvpg2GOZGstLISI/I++tjIEFft
	PAaqvdTDVNSfPa1EISINV92dAGWuDINVIhxGlUJNzzBE40DY88Fvks0mauoVR0vj/zZSxHpXsXKM5
	A8rRQWRVTiKufaNORGba5s7yqhXTbSeMEoGFiDBWC2hO8OrLizskBuTgX/Y+Qb3MP4hISVB5Fb6L+
	vZFtM4cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxbL-00Cmx8-S0; Tue, 28 Feb 2023 10:52:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWxWY-00Ck02-D5; Tue, 28 Feb 2023 10:47:59 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AF3B56602FDB;
	Tue, 28 Feb 2023 10:47:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677581277;
	bh=ZrDmD1sWJzuZxLXrgoqDyjE5ZroJ8Fh1Xr2mllsFmVQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bzE81dy4xS0Ef1DuEpeSeEggU2pTIVv0EEEeHxy2rgtWa6PLl78uXWV5jKW57KKIc
	 1Q2clOeaUFd6WKMZqR3Bp1eRJZPSxtDVNFhIaUUNgsIG6cfEUlayeJtPTT9enM46y9
	 wPzHDPulBQGKMzJHvKKOVNUF9S1gTWW5PWbqFdKz2yanajmh0WDSLcykvKFyzgKlNq
	 OoEWATOBFu2YUX1PS1mJKXI7798a8hFgNcBBwXZxe7mGD+8jQ8XXNY935R9IRPxn0P
	 37csBH6y/ZPxiDWkMo5mAQXD96snxtWPQ4xF+5zWWjxNEPB3ZPQ6I/8iw/142ZIStF
	 lltp0oZWz6ATQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v3 12/18] arm64: dts: mediatek: mt8192-asurada: Enable GPU
Date: Tue, 28 Feb 2023 11:47:35 +0100
Message-Id: <20230228104741.717819-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
References: <20230228104741.717819-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_024758_600889_08C7BD1F 
X-CRM114-Status: UNSURE (   8.34  )
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

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Enable the GPU with its power supplies described.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
[wenst@: patch split out from MT8192 GPU node patch]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
[Angelo: Minor commit title fix]
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index c8b6e1a9605b..067685191ba6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -275,6 +275,11 @@ &dsi_out {
 	remote-endpoint = <&anx7625_in>;
 };
 
+&gpu {
+	mali-supply = <&mt6315_7_vbuck1>;
+	status = "okay";
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.39.2


