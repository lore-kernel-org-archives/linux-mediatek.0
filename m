Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCDE6C27C7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 12:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=brA8GoAvDNp8q8xbP+QJWVaL+zpV7fP9YmTxAqc9jSQ=; b=bof96j7CQnaB3u2GvLEzDkVOOY
	u6JmeUDTbpNQE7GYZVt615yAHmn25K2/CgADaAwlv2vDFHWqTAGTOu6htTsWJNkqyAjv7gDXT3FLA
	AwJYtEY6GjeCCKiCzxHgtxqSJXJFHNsEFOkgXvEIdYJgyosZJkUsjCeTmqKz/tnPg/ZKFTKGZkwM4
	01XnaclS2ImF2jpbAOCWs1hgaX7x9OjmFW01RIplpQ5mm48/Hz8KUR2WPFM1jfHS90g6o3P96T6yv
	dcZLTnTa0muHa9Nl+/f7mDwRkUVncFK2IVO62K6AO6ifb6D2K0FpN0oUrdHFur3Caa/s8J1L4IsL9
	aqflSNWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWbjx-006LPU-2M;
	Thu, 17 Aug 2023 12:04:37 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWbju-006LOi-1A;
	Thu, 17 Aug 2023 12:04:35 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qWbjj-0001mN-0l;
	Thu, 17 Aug 2023 12:04:23 +0000
Date: Thu, 17 Aug 2023 13:04:06 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Alexander Couzens <lynxis@fe80.eu>,
	Daniel Golle <daniel@makrotopia.org>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next] net: pcs: lynxi: fully reconfigure if link is down
Message-ID: <e9831ec99acd5a8ab03c76fce87fa750c7041e60.1692273723.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_050434_402911_091F8B41 
X-CRM114-Status: GOOD (  16.56  )
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

On MT7988 When switching from 10GBase-R/5GBase-R/USXGMII to one of the
interface modes provided by mtk-pcs-lynxi we need to make sure to
always perform a full configuration of the PHYA.
As the idea behind not doing that was mostly to prevent an existing link
going down without any need for it to do so. Hence we can just always
perform a full confinguration in case the link is down.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/pcs/pcs-mtk-lynxi.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/net/pcs/pcs-mtk-lynxi.c b/drivers/net/pcs/pcs-mtk-lynxi.c
index b0f3ede945d96..788c2ccde064e 100644
--- a/drivers/net/pcs/pcs-mtk-lynxi.c
+++ b/drivers/net/pcs/pcs-mtk-lynxi.c
@@ -108,8 +108,8 @@ static int mtk_pcs_lynxi_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 				bool permit_pause_to_mac)
 {
 	struct mtk_pcs_lynxi *mpcs = pcs_to_mtk_pcs_lynxi(pcs);
-	bool mode_changed = false, changed;
-	unsigned int rgc3, sgm_mode, bmcr;
+	bool mode_changed = false, changed, link;
+	unsigned int bm, rgc3, sgm_mode, bmcr;
 	int advertise, link_timer;
 
 	advertise = phylink_mii_c22_pcs_encode_advertisement(interface,
@@ -117,6 +117,10 @@ static int mtk_pcs_lynxi_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 	if (advertise < 0)
 		return advertise;
 
+	/* Check if link is currently up */
+	regmap_read(mpcs->regmap, SGMSYS_PCS_CONTROL_1, &bm);
+	link = !!(FIELD_GET(SGMII_BMSR, bm) & BMSR_LSTATUS);
+
 	/* Clearing IF_MODE_BIT0 switches the PCS to BASE-X mode, and
 	 * we assume that fixes it's speed at bitrate = line rate (in
 	 * other words, 1000Mbps or 2500Mbps).
@@ -137,7 +141,10 @@ static int mtk_pcs_lynxi_config(struct phylink_pcs *pcs, unsigned int neg_mode,
 		bmcr = 0;
 	}
 
-	if (mpcs->interface != interface) {
+	/* Do a full reconfiguration only if the link is down or the interface
+	 * mode has changed
+	 */
+	if (mpcs->interface != interface || !link) {
 		link_timer = phylink_get_link_timer_ns(interface);
 		if (link_timer < 0)
 			return link_timer;
-- 
2.41.0

