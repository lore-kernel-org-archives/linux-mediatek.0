Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7536BC43458
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2026 10:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MZ21+ULxWWWa78TMpiPCWtby85XexI0p5YBNOEvmK5s=; b=RFk9It5yw1B2I5eNSdrrN+AuwN
	EvYJX0bbA0YZqpL7ki6gDIfGiDtkLytn2ZnYSJcrvkaef42wu6hJcvzu2fDCLI6a9+Qy3/UlVrwO+
	3OTGwQ6kgFpFFFi0rEeKVAYJEfR8/WxANOf085xp4KgSzu7GctVotKbC57V73FxrT5gYpSzMc0zBw
	ZeM7oUdX7M+YzKFekKX2KRwHbbmTTcya/hKST40vnDHAD/3u7QKDybOZ2igTUWDB3oQq3f17t1dje
	NjVHL8dCZhho9tvTRvq6MEsYANnArORRn+SvoO203nK2EvEgCl+qXQXD13US6xj7rhz258T4oO/ie
	6VQo2hyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiV3h-00000006Sup-0REN;
	Sat, 11 Jul 2026 10:35:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiV3f-00000006SuW-33SO;
	Sat, 11 Jul 2026 10:35:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D18ED60051;
	Sat, 11 Jul 2026 10:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7AD7DC2BCB9;
	Sat, 11 Jul 2026 10:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783766142;
	bh=CjoIXjZYksPuoJo9b5b48NUa04niQPUqRQBlzbU9cfk=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=AwssXW6wAdd41wYEQZXUyoNlDi9QHh5D57tVqOFiT/3EW9iBmDn4jIP0Qy7i+A/gz
	 0FgrlRmIvWOJh9Wf/EykZIrxctrJndDodPst/JnfCIL5sZnCyfcq/eH4wdppveH927
	 KUn0Pgw+EzvWeUjV2+wHt9hlJepHi+TRNVZ4Bff9j/mRTp+8XN7VNW5Ghyxx4J8/ww
	 cEppUTztmRwiXb0XA93TQvz4xnJg8KxGFX2+nKj35P2/QJX+Kf4uD+Mu3ufLklMthW
	 jIYJ7SifvdduuwSkOSSa3ARMSHZv8zaW+MpicdEcDZgQjz+Kxo7IqvSS4ygTQcBPdx
	 t9UjVM2ha5QvQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57D05C43458;
	Sat, 11 Jul 2026 10:35:42 +0000 (UTC)
From: Nikolai Burov via B4 Relay <devnull+nikolai.burov.jolla.com@kernel.org>
Date: Sat, 11 Jul 2026 13:34:46 +0300
Subject: [PATCH] phy: mediatek: xsphy: clear U2 DTM0 force bits during init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-mt6858-xsphy-poweron-v1-1-dee2fb71c7d5@jolla.com>
X-B4-Tracking: v=1; b=H4sIAEYcUmoC/yXMQQ6CMBBA0auQWTtJaRTRqxgX7TjIkNA2HVQM4
 e5WWL7F/wsoZ2GFa7VA5reoxFBQHyqg3oUnozyKwRrbmHNtcJya9tTirKn/YoofzjEgkeu8Mxd
 /JAslTZk7mbft7b5bX35gmv4vWNcfgYXly3gAAAA=
X-Change-ID: 20260710-mt6858-xsphy-poweron-ccafba09b4c2
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nikolai Burov <nikolai.burov+review@abscue.de>, 
 Nikolai Burov <nikolai.burov@jolla.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783766141; l=1733;
 i=nikolai.burov@jolla.com; s=20260707; h=from:subject:message-id;
 bh=JAVmiLYc4qL5R032CUvK9+ze4/IqmRRFbWXmWnyY5tU=;
 b=T0DPUN3D5Y3CUdetCWkVyJ8WU48VXB/UEznv/4kjGDWgJZk/mqULDgRof1/ZH+idGNPgKT1a6
 pFaBDtZ/Hb3D6lHiIqqboDwvOCv8CCaBmwx/OkrHgkfRfuPuhtGdoaN
X-Developer-Key: i=nikolai.burov@jolla.com; a=ed25519;
 pk=yzpa+PD+ovHUFMIOBA9o2QqGwI110jM6hdGHLc7jtoQ=
X-Endpoint-Received: by B4 Relay for nikolai.burov@jolla.com/20260707 with
 auth_id=859
X-Original-From: Nikolai Burov <nikolai.burov@jolla.com>
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
Reply-To: nikolai.burov@jolla.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Nikolai Burov <nikolai.burov@jolla.com>

On mobile SoCs, the USB PHY is completely powered off during bootup.
As a result, various bits in the DTM0 register are set that prevent
the USB 2.0 PHY from functioning. Clear them as part of the
initialization sequence.

Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
---
 drivers/phy/mediatek/phy-mtk-xsphy.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-xsphy.c b/drivers/phy/mediatek/phy-mtk-xsphy.c
index cc1d66954212..b29220bc5592 100644
--- a/drivers/phy/mediatek/phy-mtk-xsphy.c
+++ b/drivers/phy/mediatek/phy-mtk-xsphy.c
@@ -62,6 +62,14 @@
 #define P2A6_RG_BC11_SW_EN	BIT(23)
 #define P2A6_RG_OTG_VBUSCMP_EN	BIT(20)
 
+#define XSP_U2PHYDTM0		((SSUSB_SIFSLV_U2PHY_COM) + 0x068)
+#define P2D_FORCE_DATAIN	BIT(23)
+#define P2D_FORCE_DM_PULLDOWN	BIT(21)
+#define P2D_FORCE_DP_PULLDOWN	BIT(20)
+#define P2D_FORCE_XCVRSEL	BIT(19)
+#define P2D_FORCE_SUSPENDM	BIT(18)
+#define P2D_FORCE_TERMSEL	BIT(17)
+
 #define XSP_U2PHYDTM1		((SSUSB_SIFSLV_U2PHY_COM) + 0x06C)
 #define P2D_FORCE_IDDIG		BIT(9)
 #define P2D_RG_VBUSVALID	BIT(5)
@@ -181,6 +189,11 @@ static void u2_phy_instance_init(struct mtk_xsphy *xsphy,
 {
 	void __iomem *pbase = inst->port_base;
 
+	mtk_phy_clear_bits(pbase + XSP_U2PHYDTM0,
+			   P2D_FORCE_DATAIN | P2D_FORCE_DM_PULLDOWN |
+			   P2D_FORCE_DP_PULLDOWN | P2D_FORCE_XCVRSEL |
+			   P2D_FORCE_SUSPENDM | P2D_FORCE_TERMSEL);
+
 	/* DP/DM BC1.1 path Disable */
 	mtk_phy_clear_bits(pbase + XSP_USBPHYACR6, P2A6_RG_BC11_SW_EN);
 

---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260710-mt6858-xsphy-poweron-ccafba09b4c2

Best regards,
--  
Nikolai Burov <nikolai.burov@jolla.com>



