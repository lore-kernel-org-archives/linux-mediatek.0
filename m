Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C486C636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqZy+MDKdvz7m5aRBshAv4C2pDneinerQCx22KbQCsw=; b=tSYyyZyx3M7NomCwCRegBvu/3J
	JiknO7QPPfANcjx/cr46Cg2AnTU5A/+5HnnBruAipHFrnHqZYChXGVaNH3gtr46XEyxB7QiqO4x81
	kIIAExh+sDjomhfifwJA3tParRhRnAd9hHAOTK56DC4SCH/eguYtVbmw/QE6BsDn5+ddSlMsX1mXW
	hre4Ec+pEmJSc+OoPmcVLBz0MxjlAwocUoORULEH6CbxsHaHTkVpi1zg2JRjp0MIfS3AgCsofzNKh
	I91J0e5sgetHUKfBu3mZBDv8mZZweiTBMucvGF8piG/XC9TRnZ3wzws2QMU+MLDsRc+Wj9qTuOszC
	oBEA9lTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVC3X-00GeFg-SZ; Thu, 23 Feb 2023 13:54:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBtE-00GYPD-UO; Thu, 23 Feb 2023 13:44:06 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 39FDF660220A;
	Thu, 23 Feb 2023 13:44:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159843;
	bh=5uTIKzxccTuXc8ARaKxHVjhHv2AKqCAZTuNnIoDmS70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Sw4L5ZnqFa2sLyuyW38JEOlhxqihMMNhrcOZtS0RpYhksw57hMyge1E4LSf1I8J1P
	 Ta9EdICsUkzksw7zGmVS+mf1y27y05qHPRegzsuouZLyfZ9sYpqMmZ8jYelECmMcm+
	 E3pW6wlUovBL9sGjTVjvedOMt2U4qSDQkuQ4zNSQ0Da/Cak36Ds/L83szZviB/pjzY
	 JbkYgXFpOnzsd2jVPOpkUzPwEK+lP7ZkVN9Tl7V2G1AkAt2ODXmGb7HcaHTZ+xl6GK
	 kHo8Al6Vw1vxJA6rZUg7lZ/m2dBxaxhkgox/eQ7YD35KH3XgE0P/HjOUL19kdlviVK
	 WWde/QVkRzJvA==
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
Subject: [PATCH v2 12/16] arm64: dts: mediatek: mt8192-asurada: Enable GPU
Date: Thu, 23 Feb 2023 14:43:41 +0100
Message-Id: <20230223134345.82625-13-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_054405_159902_7B7562E0 
X-CRM114-Status: UNSURE (   7.94  )
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
2.39.2


