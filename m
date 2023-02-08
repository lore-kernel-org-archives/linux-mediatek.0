Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BCB7C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 10:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpQEMnT2mE9S2Q/Rfx0LEXp4xpBYE+Hc3DJAUY3BY9Q=; b=tUSOQLi+dKsjfOkbNT8y9ayuH+
	PL82Kl6UMjvC138EBmvTkq9gEPArEdSqkGPJUCl+jLP5SJx2/FnfEk3sGs1MG0Mf2Huv9jd/ai/n6
	bO++p11lrcoID1W032Z2MZicxH0PBXzpqOLqNa4jVl/2WjDtNUlMO/grfYqIJaGP7L4UrOU5XGTsr
	8bBPOpEyFzxkMu6747PKppL2dWkTTLK/EKoqTxm2icyFP/TXHxPR79e94/y+oBHkYWQQBDHTgqPrs
	7S8mtrnftkOQZrtK4YKFe9q5HjhvCui+8EqXKMm0yBtvcFGfp8vYoa9K7Nh4z+pz+7pyeMuTKnn5u
	GbiE87yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPi5d-00FMUd-3X; Wed, 08 Feb 2023 10:54:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhxR-00FHxY-JU; Wed, 08 Feb 2023 10:45:47 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A65D566020A3;
	Wed,  8 Feb 2023 10:45:43 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675853144;
	bh=quJa/fW2LVMTtC5MQkjKN9wJG9aVtfzfxHeqN/YECfI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kc0e79TS9SeIszeVKiY/2le7uAj/md+QgGVW/xAB4n8GXJLPTmogz/ufCKh/yovLw
	 GXp70b6CVLRKg0lyipJBPcYwPsKHVZvWZTpDdyenvDMcuIar+PZsFwuGmfFbtrcI24
	 Xs51hNzTdiUdt9cySgEhHEC9ofLAagfooQ1wYea76YUOohenQv9KPLW5EBhve/SO9E
	 lAPbVYAt6OK9bW36Jsnvw74t1BU0hJ2Foh7C51fQQ0erKG+wTQZcwPRGpf95eZyIEW
	 +noHDqzjp8UKcFUiPp1g6YghCjNyAZz2MZTEJRCFI08NAfr1yGnNqjFCHd2gz/bPKU
	 U/yfp0rP7c22w==
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
Subject: [PATCH 12/16] arm64: dts: mediatek: mt8192-asurada: Enable GPU
Date: Wed,  8 Feb 2023 11:45:23 +0100
Message-Id: <20230208104527.118929-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
References: <20230208104527.118929-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_024545_817924_716CCC69 
X-CRM114-Status: UNSURE (   8.54  )
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
2.39.1


