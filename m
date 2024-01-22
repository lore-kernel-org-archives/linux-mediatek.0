Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E50C47DAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 11:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cj5vqLy2Mm1agi07FqWAfFs3XdXdLngHyY/oGxD31ow=; b=cX8IrqpUu0lrvaDJeYx49yEczh
	argcoo1/8W9uuMFYvR3a7/bWgfsp4Rqq2ltcj9aeuK8CkT0lrikTIp+twijMRPOdNJQQqujsYUrby
	GVUh35Cz59DFWcw36mDyPXnWWOw/K2cdbyjqQcMPEVxTH0Q05mdnVlNCmfBWxwcNBpcl1CG5BYK5+
	q2C4q0i+EPkirDo7M5CaPImZbEG6IaXUz17BUbaLrwKnE3HgWZprQI310ePawp5KWtW1ArAZKZ8Un
	32780LbdAG5+SC9oNtunWTw2j1VfuX+2SpD63GQHypymhUAnPMLcY9Pz5z4+MlTgGcyiAoyP2P/sg
	YZqntE3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRsJu-00BiPL-1m;
	Mon, 22 Jan 2024 11:18:26 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRsJm-00BiLD-1o;
	Mon, 22 Jan 2024 11:18:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705922297;
	bh=mPvguHaLpTZ96JgrvlhY8YUv14Dl6d0c0XbAb/xNTVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EsXWUxhCAXcW3y7Sq1MFm3r2eNNayJ5uy9un49YBXUtm3eRmuBrlWzz7zajHR4eWh
	 Gf+fiB6nnAaxZ4C877H2YCsfaVSr4cvPZ2glF6pAr+mjgcZQxVaB0C7C3PWspaS0p3
	 ZWpjX7phl/702Ag6GrA4XuuXAEQ5eguxd7aOiavzcbMn4uiSkKAaq+EXWARelBsUz7
	 +bJtttcQxWrxL4N8cd9NOF9DekoeqJjqTW4MqzjcTZszoH9UuXw4xhTgqLboxquSU0
	 WrjuRA+Cq2iLKhGjloEwErEbzIyRJFnErKPXBs0L/tmXoemkZTjTZkVL8oUSrIYPFn
	 1zJSaXSJwfLuQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 566FA3781FE1;
	Mon, 22 Jan 2024 11:18:16 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/2] usb: mtu3: Add MT8195 MTU3 ip-sleep wakeup support
Date: Mon, 22 Jan 2024 12:18:09 +0100
Message-ID: <20240122111809.148546-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122111809.148546-1-angelogioacchino.delregno@collabora.com>
References: <20240122111809.148546-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_031818_724732_4E24743C 
X-CRM114-Status: GOOD (  11.31  )
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

Add support for the ip-sleep wakeup functionality on the three MTU3
controllers found on the MT8195 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---

Changes in v2:
 - Dropped unused definition for WC0_IS_EN_P1_95

 drivers/usb/mtu3/mtu3_host.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
index 9f2be22af844..7c657ea2dabd 100644
--- a/drivers/usb/mtu3/mtu3_host.c
+++ b/drivers/usb/mtu3/mtu3_host.c
@@ -34,6 +34,18 @@
 #define WC0_SSUSB0_CDEN		BIT(6)
 #define WC0_IS_SPM_EN		BIT(1)
 
+/* mt8195 */
+#define PERI_WK_CTRL0_8195	0x04
+#define WC0_IS_P_95		BIT(30)	/* polarity */
+#define WC0_IS_C_95(x)		((u32)(((x) & 0x7) << 27))
+#define WC0_IS_EN_P3_95		BIT(26)
+#define WC0_IS_EN_P2_95		BIT(25)
+
+#define PERI_WK_CTRL1_8195	0x20
+#define WC1_IS_C_95(x)		((u32)(((x) & 0xf) << 28))
+#define WC1_IS_P_95		BIT(12)
+#define WC1_IS_EN_P0_95		BIT(6)
+
 /* mt2712 etc */
 #define PERI_SSUSB_SPM_CTRL	0x0
 #define SSC_IP_SLEEP_EN	BIT(4)
@@ -44,6 +56,9 @@ enum ssusb_uwk_vers {
 	SSUSB_UWK_V2,
 	SSUSB_UWK_V1_1 = 101,	/* specific revision 1.01 */
 	SSUSB_UWK_V1_2,		/* specific revision 1.02 */
+	SSUSB_UWK_V1_3,		/* mt8195 IP0 */
+	SSUSB_UWK_V1_5 = 105,	/* mt8195 IP2 */
+	SSUSB_UWK_V1_6,		/* mt8195 IP3 */
 };
 
 /*
@@ -70,6 +85,21 @@ static void ssusb_wakeup_ip_sleep_set(struct ssusb_mtk *ssusb, bool enable)
 		msk = WC0_SSUSB0_CDEN | WC0_IS_SPM_EN;
 		val = enable ? msk : 0;
 		break;
+	case SSUSB_UWK_V1_3:
+		reg = ssusb->uwk_reg_base + PERI_WK_CTRL1_8195;
+		msk = WC1_IS_EN_P0_95 | WC1_IS_C_95(0xf) | WC1_IS_P_95;
+		val = enable ? (WC1_IS_EN_P0_95 | WC1_IS_C_95(0x1)) : 0;
+		break;
+	case SSUSB_UWK_V1_5:
+		reg = ssusb->uwk_reg_base + PERI_WK_CTRL0_8195;
+		msk = WC0_IS_EN_P2_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
+		val = enable ? (WC0_IS_EN_P2_95 | WC0_IS_C_95(0x1)) : 0;
+		break;
+	case SSUSB_UWK_V1_6:
+		reg = ssusb->uwk_reg_base + PERI_WK_CTRL0_8195;
+		msk = WC0_IS_EN_P3_95 | WC0_IS_C_95(0x7) | WC0_IS_P_95;
+		val = enable ? (WC0_IS_EN_P3_95 | WC0_IS_C_95(0x1)) : 0;
+		break;
 	case SSUSB_UWK_V2:
 		reg = ssusb->uwk_reg_base + PERI_SSUSB_SPM_CTRL;
 		msk = SSC_IP_SLEEP_EN | SSC_SPM_INT_EN;
-- 
2.43.0


