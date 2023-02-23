Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C37BDC61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YPNDSENDG/1IH0mca5bU4Urqg4usT5ZFZdeiD0xt3Js=; b=E2iZNUsmlsCqQS4N/0aqoVJNhs
	oKjrmc6mTEWCrJKYUyRVQIUZ2qjcPom4yQHe48ScQqth+DEIaI/SO7QA2MhBmZoUJ24fgsfD0X70Z
	9iFxV4PGHFZ4MjsmzB0oXXBBcc1zHxpkV0JK33mv7BQWmhghAhxVjYMNl7QMRERCEf89OJF9j22xH
	KBzAGzD1hLNMcofJEuu3ZJQ0hsK34aLlI1asGVZFrliJGG0fNApHh5G7gkovePYv05IIP1OPIIJ3K
	63k7NtTZG1lJFKoouFyk25t/zpyxOPRzbdM/9zkDYF3L3pFHXOyuzQBdbIIS1DVmgE8Uu5cmKJTGW
	KKCRp3JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBzb-00Gbwj-8d; Thu, 23 Feb 2023 13:50:39 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBtA-00GYLO-W2; Thu, 23 Feb 2023 13:44:02 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4182B660220D;
	Thu, 23 Feb 2023 13:43:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159839;
	bh=xAp8H2hVhd7urTj86UlUSbK9LB5eP77m4/nFArJQr+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BXpHl2GJD8EjzIABLdfe2cxa8PVrmn5m/9ru9rR2XZoZODWb6nA3ZXAKqGJjUj7nC
	 2QGK97fbrcZKjxH58Ga9BfTOUwoC7nyNIHeAxGb5PGZGf5ERzlXuaCNuDP5VtEhhJp
	 gSqilcMZrkwT8UiWt16tTFcyrQla0DgtBx5Qrqn6OodDRadOZBgMDeUesPM/qbOmy/
	 Wy3NnOdRf00hpwaaiZ49dtAzvQZYALx27n+Fpu7//NGJ/X9Vw3i1ejC+99Ak9ujsIy
	 WXUk1euFgHXIoztqm6G5Ym7sKIUqPuwNDj89poW7JyLRZVEO6jrNdLcYqiYJLKleFf
	 t4vluZ/JK87Fw==
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
Subject: [PATCH v2 06/16] arm64: dts: mediatek: mt8183: Use mediatek,mt8183b-mali as GPU compatible
Date: Thu, 23 Feb 2023 14:43:35 +0100
Message-Id: <20230223134345.82625-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_054401_219293_CEAF1615 
X-CRM114-Status: GOOD (  10.03  )
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

Use the new GPU related compatible to finally enable GPU DVFS on
the MT8183 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index e01b96adef02..5169779d01df 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1752,7 +1752,7 @@ mfgcfg: syscon@13000000 {
 		};
 
 		gpu: gpu@13040000 {
-			compatible = "mediatek,mt8183-mali", "arm,mali-bifrost";
+			compatible = "mediatek,mt8183b-mali", "arm,mali-bifrost";
 			reg = <0 0x13040000 0 0x4000>;
 			interrupts =
 				<GIC_SPI 280 IRQ_TYPE_LEVEL_LOW>,
-- 
2.39.2


