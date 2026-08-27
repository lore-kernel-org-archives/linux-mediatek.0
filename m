Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FF2C5DF9D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 06:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5a4Ct2TQR5GyrAmZBM32R/OaAnB2Eg0670ccoq9Z+7c=; b=vjFP2jgoxe+fsBpp7pkYy2DT9E
	vGDBvAWYgGz0gwnD65eFh4dSIuvqoDypvZe3iOjCQaZxgv3rXlAJ4IFblEn1Q6yFGgdCBhf5qIEuO
	hA7pcj5TDUDvYS3TvUi5EKKYb2EDnVqy/n2sE0POElM1mkQ1X7tILwiRtEF2P0n7kdbGFxAw8JY04
	EOBsuKKae/B4Oh0ioeuI6CPU7Q9SF/asU4PWJy32JeZzp6sYiVxWE+E3JeckRRIQV5G7y4k3qIRxB
	qUPgFZ/tQfr3H4OLzczTjSgtwt4hW9Gzxd4oJI3Ek07SfqY83axXmDeQ35ft5chjkaDl5R9C7vnIR
	qgm1OsOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzU5X-00000003Voe-1RwW;
	Thu, 27 Aug 2026 06:59:51 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzU5R-00000003VlS-0X6P;
	Thu, 27 Aug 2026 06:59:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D74841F09C3;
	Thu, 27 Aug 2026 08:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1787813982; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=5a4Ct2TQR5GyrAmZBM32R/OaAnB2Eg0670ccoq9Z+7c=;
	b=e1TRsqKf1MY1Z2YTX9FOrv3ln5C2eqR2/d10MpigS+XCHz4nXUFhZ40VB99yeOWWLlp70I
	6rCmyxDwRu9XSqkfQv2UUQRFUD7xqr8kl3sNPCsvGov6GEIGcnoNXxcZPGQ2lzxteYnOas
	q+wywY/FH+BkZmNnT96FrDDSCTJil4KK24RHeqGRkgaxTiI8E5F1eRp2Q1e4mHoAXHgNs1
	Ii88+C11biKjUjq9PJfd0kLNugDvMTMUVrhF5QbhLdEyQLXa1iPlf2rxcJezIFFdt3sTPt
	lMkeo6OfcZ+gNwl6FwfT82Ksgg6WfSc4KfG8dV7oHxOwUBAXEO5SFlPeileAaw==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: netdev@vger.kernel.org
Cc: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	daniel@makrotopia.org,
	naseefkm@gmail.com,
	joey@tinyisr.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v2 net-next 1/2] net: phy: mediatek: differentiate MT7530 GE PHY from EcoNet FE PHY
Date: Thu, 27 Aug 2026 06:59:29 +0000
Message-Id: <20260827065930.2618729-2-cjd@cjdns.fr>
In-Reply-To: <20260827065930.2618729-1-cjd@cjdns.fr>
References: <20260827065930.2618729-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_235945_365996_64A3A769 
X-CRM114-Status: UNSURE (   8.43  )
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

MT7530 gigabit PHY has the same ID as an EcoNet EN751221 10/100
PHY. Differentiate by checking whether the PHY supports 1000BASE-T
which is always supported by MT7530.

Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
---
 drivers/net/phy/mediatek/mtk-ge.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
index 73d9b72f9d9e..3b4d774057c2 100644
--- a/drivers/net/phy/mediatek/mtk-ge.c
+++ b/drivers/net/phy/mediatek/mtk-ge.c
@@ -96,6 +96,19 @@ static int mt7531_phy_config_init(struct phy_device *phydev)
 	return 0;
 }
 
+/*
+ * MTK_GPHY_ID_MT7530 collides with ECONET_FEPHY_ID_LEGACY
+ * but this is a gigabit PHY so ESTATUS lists 1000BASE-T.
+ */
+static int mt7530_phy_match(struct phy_device *phydev,
+			    const struct phy_driver *phydrv)
+{
+	if (phydev->phy_id != MTK_GPHY_ID_MT7530)
+		return false;
+
+	return (phy_read(phydev, MII_ESTATUS) & ESTATUS_1000_TFULL) != 0;
+}
+
 static struct phy_driver mtk_gephy_driver[] = {
 	{
 		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),
@@ -106,6 +119,7 @@ static struct phy_driver mtk_gephy_driver[] = {
 		 */
 		.config_intr	= genphy_no_config_intr,
 		.handle_interrupt = genphy_handle_interrupt_no_ack,
+		.match_phy_device = mt7530_phy_match,
 		.suspend	= genphy_suspend,
 		.resume		= genphy_resume,
 		.read_page	= mtk_phy_read_page,
-- 
2.39.5


