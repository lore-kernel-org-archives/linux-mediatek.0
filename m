Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12C3DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Dec 2021 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tmDV4+2iQ+Tc/a2jVA8Nh6SGSy0lnj/QyhPMkKui+4s=; b=Y1g4z+Bix5foOa
	7yPSQnGlvSpa/ORepP2gOP+92C7b91R9NMC5wjBdCO5cGO6lth/nvIO8/716xU1TTH+IsMYhSvYI3
	Q6FoqD2IcEmhOD5WXU2LX0iUm0sN63jzPE+NKH/gyZA2UwmwZXF9+0BhglQNjJBf0vVq//M4P2pkR
	DDpuV0Fpb/VcqD3T82M5d+y53uWzZt3iuQAieMONEMf7MhnlkIKNaC6je689ib+r6evPYYJPbCxWd
	zY/BhNknMMdfQwOqsOXROWABSKjnPvdrrKvVyiA5Q7ungx1qBTBBgOucadocVuKxHgSmODYqwWmPr
	0/Y4bd9/zcRnr5I2SXBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvJES-00G1i7-VT; Thu, 09 Dec 2021 13:13:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvJDD-00G1AI-3O; Thu, 09 Dec 2021 13:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oBofdXdd8iAHU1rD7qsP3yeRZuW/vNIcXKBxzUDJmBM=; b=yrMd8i4rVDPe5Nd20N4U2rpkIz
 AU+UNRZrQzPYiKuA0bgAZduhlFV4hvuyD/WBeX1XfVI4jhnKiBPsMcmgl0sbW/5GyrZI9kcH4sqIi
 WeAmWPWvuql8wNY5T5RxNREdPu63JYxskgu9k9JQazrvi7CT4Nqs0i2NnJiDDYOX4GJsv0OsqHGh8
 ZGecoHGoxImLq3aBkIpC6tRrRuWH/MJXvxSUq7nEu2sX6ZKB3eWowbUJYEpwMyaCSQyn308gjREdz
 vCucWWNUsmRGJtjsHhbHXEsHInQPpGQurBA7vMkVzOs1hXyVRZGKj7g8m4c24zHF/BFxfu5IQCQK5
 B6oqGezA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:45534 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mvJDA-0008TM-Ml; Thu, 09 Dec 2021 13:11:48 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1mvJDA-00F949-8I; Thu, 09 Dec 2021 13:11:48 +0000
In-Reply-To: <Ya+DGaGmGgWrlVkW@shell.armlinux.org.uk>
References: <Ya+DGaGmGgWrlVkW@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Chris Snook <chris.snook@gmail.com>, Felix Fietkau <nbd@nbd.name>,
 Florian Fainelli <f.fainelli@gmail.com>, John Crispin <john@phrozen.org>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 4/5] net: phylink: use legacy_pre_march2020
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1mvJDA-00F949-8I@rmk-PC.armlinux.org.uk>
Date: Thu, 09 Dec 2021 13:11:48 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211209_051151_238198_0E2D0995 
X-CRM114-Status: GOOD (  20.03  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use the legacy flag to indicate whether we should operate in legacy
mode. This allows us to stop using the presence of a PCS as an
indicator to the age of the phylink user, and make PCS presence
optional.

Legacy mode involves:
1) calling mac_config() whenever the link comes up
2) calling mac_config() whenever the inband advertisement changes,
   possibly followed by a call to mac_an_restart()
3) making use of mac_an_restart()
4) making use of mac_pcs_get_state()

All the above functionality was moved to a seperate "PCS" block of
operations in March 2020.

Update the documents to indicate that the differences that this flag
makes.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Resent with the correct cover-letter message-ID.

 drivers/net/phy/phylink.c | 12 ++++++------
 include/linux/phylink.h   | 17 +++++++++++++++++
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index 8e3861f09b4f..e47f2baf4b07 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -742,7 +742,7 @@ static void phylink_mac_pcs_an_restart(struct phylink *pl)
 	    phylink_autoneg_inband(pl->cur_link_an_mode)) {
 		if (pl->pcs_ops)
 			pl->pcs_ops->pcs_an_restart(pl->pcs);
-		else
+		else if (pl->config->legacy_pre_march2020)
 			pl->mac_ops->mac_an_restart(pl->config);
 	}
 }
@@ -803,7 +803,7 @@ static int phylink_change_inband_advert(struct phylink *pl)
 	if (test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state))
 		return 0;
 
-	if (!pl->pcs_ops) {
+	if (!pl->pcs_ops && pl->config->legacy_pre_march2020) {
 		/* Legacy method */
 		phylink_mac_config(pl, &pl->link_config);
 		phylink_mac_pcs_an_restart(pl);
@@ -854,7 +854,8 @@ static void phylink_mac_pcs_get_state(struct phylink *pl,
 
 	if (pl->pcs_ops)
 		pl->pcs_ops->pcs_get_state(pl->pcs, state);
-	else if (pl->mac_ops->mac_pcs_get_state)
+	else if (pl->mac_ops->mac_pcs_get_state &&
+		 pl->config->legacy_pre_march2020)
 		pl->mac_ops->mac_pcs_get_state(pl->config, state);
 	else
 		state->link = 0;
@@ -1048,12 +1049,11 @@ static void phylink_resolve(struct work_struct *w)
 			}
 			phylink_major_config(pl, false, &link_state);
 			pl->link_config.interface = link_state.interface;
-		} else if (!pl->pcs_ops) {
+		} else if (!pl->pcs_ops && pl->config->legacy_pre_march2020) {
 			/* The interface remains unchanged, only the speed,
 			 * duplex or pause settings have changed. Call the
 			 * old mac_config() method to configure the MAC/PCS
-			 * only if we do not have a PCS installed (an
-			 * unconverted user.)
+			 * only if we do not have a legacy MAC driver.
 			 */
 			phylink_mac_config(pl, &link_state);
 		}
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index d005b8e36048..a2f266cc3442 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -190,6 +190,10 @@ void validate(struct phylink_config *config, unsigned long *supported,
  * negotiation completion state in @state->an_complete, and link up state
  * in @state->link. If possible, @state->lp_advertising should also be
  * populated.
+ *
+ * Note: This is a legacy method. This function will not be called unless
+ * legacy_pre_march2020 is set in &struct phylink_config and there is no
+ * PCS attached.
  */
 void mac_pcs_get_state(struct phylink_config *config,
 		       struct phylink_link_state *state);
@@ -230,6 +234,15 @@ int mac_prepare(struct phylink_config *config, unsigned int mode,
  * guaranteed to be correct, and so any mac_config() implementation must
  * never reference these fields.
  *
+ * Note: For legacy March 2020 drivers (drivers with legacy_pre_march2020 set
+ * in their &phylnk_config and which don't have a PCS), this function will be
+ * called on each link up event, and to also change the in-band advert. For
+ * non-legacy drivers, it will only be called to reconfigure the MAC for a
+ * "major" change in e.g. interface mode. It will not be called for changes
+ * in speed, duplex or pause modes or to change the in-band advertisement.
+ * In any case, it is strongly preferred that speed, duplex and pause settings
+ * are handled in the mac_link_up() method and not in this method.
+ *
  * (this requires a rewrite - please refer to mac_link_up() for situations
  *  where the PCS and MAC are not tightly integrated.)
  *
@@ -314,6 +327,10 @@ int mac_finish(struct phylink_config *config, unsigned int mode,
 /**
  * mac_an_restart() - restart 802.3z BaseX autonegotiation
  * @config: a pointer to a &struct phylink_config.
+ *
+ * Note: This is a legacy method. This function will not be called unless
+ * legacy_pre_march2020 is set in &struct phylink_config and there is no
+ * PCS attached.
  */
 void mac_an_restart(struct phylink_config *config);
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
