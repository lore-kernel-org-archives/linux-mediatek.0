Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 948D9C4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 13:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tgrbQMGfEsmd3EnXwYIw9vWmsd0N/cHRzr8V8gh7YC4=; b=JcMAHavgsA2pHSnagyZXpT3mKn
	eVmToZoniVOLACpv2JNx8NSQR9SpB+tK1zXkRFJzlAImLMVGz4tnzxz/VVQfZPOxpTnRdWPlv9pur
	MwayP8yX2+EPROUtcZLdF/MeoRSBvPs3NIFAEGqN/qgVrXfJ1Mv0A6LjEwL0J2wcJ6D3Dm07eRc62
	JfNCbXBccbxY44JdtbLVbnE69IBjotMMyWFqqmFKSZGI+BeaRcxp3TrgHszRwRj7Jqiczo4W/zsyw
	OlSjT5HRUSaWP3GCEM/KQq8hSlwxpWBx711plx6oRjkmbcymJyEUEBk5IKh0pkmksFsbjDxEPWDJr
	NetS15jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOHeK-002vmZ-1u;
	Fri, 12 Jan 2024 13:32:40 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOHeF-002vkV-0k;
	Fri, 12 Jan 2024 13:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705066351;
	bh=YkdDpomM6xgjjZT3f/VDi2h3qQuEYm1oWG/yoqw8ImM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GEe1UDMM/w79byImu60YnSiFe36p0UL+qBsPTpVtNNWtfFBqLiyvIan0nNcIPoyqT
	 cr6WFujt7CCY5y14VrOsh6zMUtQTUW5opwob9x15/70A+SPwIhmb7mErsOlOJ3yFYT
	 a9+QQMd+U7LawYmjrY//yHHkhWs6gCZBGnnz33LZzim/4oXyeMZqipqoVoHablgw+q
	 JWmjNIiKWDssKe2Wz1+PHC9vb+RolyZqBjPY+HBCYPBsEkFHikirS5tnstnld+RPCm
	 LEAgVIEzm4ffPAHZUfMN4q7GNtAYGySgWB7FbxWFUTxoAKd/NP3crBw+vdiFNkMPvL
	 Ri5D+h10mpRYg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8D8E73782031;
	Fri, 12 Jan 2024 13:32:30 +0000 (UTC)
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
	kernel@collabora.com
Subject: [PATCH 2/2] usb: mtu3: Add MT8195 MTU3 ip-sleep wakeup support
Date: Fri, 12 Jan 2024 14:32:22 +0100
Message-ID: <20240112133222.240038-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112133222.240038-1-angelogioacchino.delregno@collabora.com>
References: <20240112133222.240038-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_053235_402503_8EFE8D54 
X-CRM114-Status: GOOD (  11.54  )
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
 drivers/usb/mtu3/mtu3_host.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/usb/mtu3/mtu3_host.c b/drivers/usb/mtu3/mtu3_host.c
index 9f2be22af844..85f49e00e8db 100644
--- a/drivers/usb/mtu3/mtu3_host.c
+++ b/drivers/usb/mtu3/mtu3_host.c
@@ -34,6 +34,19 @@
 #define WC0_SSUSB0_CDEN		BIT(6)
 #define WC0_IS_SPM_EN		BIT(1)
 
+/* mt8195 */
+#define PERI_WK_CTRL0_8195	0x04
+#define WC0_IS_P_95		BIT(30)	/* polarity */
+#define WC0_IS_C_95(x)		((u32)(((x) & 0x7) << 27))
+#define WC0_IS_EN_P3_95		BIT(26)
+#define WC0_IS_EN_P2_95		BIT(25)
+#define WC0_IS_EN_P1_95		BIT(24)
+
+#define PERI_WK_CTRL1_8195	0x20
+#define WC1_IS_C_95(x)		((u32)(((x) & 0xf) << 28))
+#define WC1_IS_P_95		BIT(12)
+#define WC1_IS_EN_P0_95		BIT(6)
+
 /* mt2712 etc */
 #define PERI_SSUSB_SPM_CTRL	0x0
 #define SSC_IP_SLEEP_EN	BIT(4)
@@ -44,6 +57,9 @@ enum ssusb_uwk_vers {
 	SSUSB_UWK_V2,
 	SSUSB_UWK_V1_1 = 101,	/* specific revision 1.01 */
 	SSUSB_UWK_V1_2,		/* specific revision 1.02 */
+	SSUSB_UWK_V1_3,		/* mt8195 IP0 */
+	SSUSB_UWK_V1_5 = 105,	/* mt8195 IP2 */
+	SSUSB_UWK_V1_6,		/* mt8195 IP3 */
 };
 
 /*
@@ -70,6 +86,21 @@ static void ssusb_wakeup_ip_sleep_set(struct ssusb_mtk *ssusb, bool enable)
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


