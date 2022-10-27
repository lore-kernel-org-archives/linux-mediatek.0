Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F680FA3740
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Oct 2022 13:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Content-Type
	:Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25SQ/5GtegjhrUEZs5O1w7glDSENYSyiHq9/TL2mEBs=; b=ZS8MIu07HASpZRgq7G5Z+p1fT1
	EBNjwX1T24H+NbJJBr9CTdM75uusiob47AtBiXUNGRi3sZjl80YFfxQvSO5l6WQn9kWowUH6z9fuV
	5xSefqYkhCESKfvy56NCpho2oyGwW+n8Kl415AvMuqK5TvpOuUCrgs3DUp2YyNHnpC+R2eGZXkEeO
	QJOSY2NNss3UDcx4qBdx2edDsjQ9f/LwkQ+6dNY6Iq76jZkYi6KqN1g2IvlHYgDBYfO3C7h4djOzh
	/ds2aTL1RrcTUU4cuhDyivYVIkfVhpfsBWz9EgrMj5GjyL8x9t4LM18Pk79wXB0AEyf2uNxXxOTlW
	E/7tghOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2u5-00DVBM-9F; Thu, 27 Oct 2022 13:26:37 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oo2gc-00DMol-2F; Thu, 27 Oct 2022 13:12:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=25SQ/5GtegjhrUEZs5O1w7glDSENYSyiHq9/TL2mEBs=; b=plqRWHU/sY1lYckeL9pCZcNhG1
	MWstgzoJwzcc84fBi//ucDJCGs8MFEMeUi1Rlf72BTF7rcu3v8FA6Dw5pCHUzbqHj9gzM6UE/EJNf
	9khIzY//jaOn5DJ0Bpw32OyEDqV6NR6jfVL635i/dnXUEGVXe3fCXTsXLuvzNSnV5Fzx3t1PlZY0n
	F03UxEW/EL8iNmKO0WQm9SwZtw+aNF/PqtTkwHrGba9+RrXjhSDV8WQncqUutw7g/wM7fvkYPPWzk
	s5LFTsNutpmHPCKJRbyVB6JcplK20T5b4gkX0rTp5gdhEBzTBdjQMK9rUxuuBnyPdHs/CvsFp93VF
	Vnv+h/8g==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34978 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1oo2ec-0006xT-3Z; Thu, 27 Oct 2022 14:10:38 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1oo2eb-00HF7b-Gf; Thu, 27 Oct 2022 14:10:37 +0100
In-Reply-To: <Y1qDMw+DJLAJHT40@shell.armlinux.org.uk>
References: <Y1qDMw+DJLAJHT40@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: "David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Frank Wunderlich <frank-w@public-files.de>
Cc: Eric Dumazet <edumazet@google.com>,
	Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH net-next 01/11] net: phylink: add phylink_get_link_timer_ns()
 helper
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1oo2eb-00HF7b-Gf@rmk-PC.armlinux.org.uk>
Date: Thu, 27 Oct 2022 14:10:37 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221027_061242_141737_2FE4CD83 
X-CRM114-Status: UNSURE (   8.90  )
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

Add a helper to convert the PHY interface mode to the required link
timer setting as stated by the appropriate standard. Inappropriate
interface modes return an error.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 include/linux/phylink.h | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index 63800bf4a7ac..1df3e5e316e8 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -616,6 +616,30 @@ int phylink_speed_up(struct phylink *pl);
 
 void phylink_set_port_modes(unsigned long *bits);
 
+/**
+ * phylink_get_link_timer_ns - return the PCS link timer value
+ * @interface: link &typedef phy_interface_t mode
+ *
+ * Return the PCS link timer setting in nanoseconds for the PHY @interface
+ * mode, or -EINVAL if not appropriate.
+ */
+static inline int phylink_get_link_timer_ns(phy_interface_t interface)
+{
+	switch (interface) {
+	case PHY_INTERFACE_MODE_SGMII:
+	case PHY_INTERFACE_MODE_QSGMII:
+	case PHY_INTERFACE_MODE_USXGMII:
+		return 1600000;
+
+	case PHY_INTERFACE_MODE_1000BASEX:
+	case PHY_INTERFACE_MODE_2500BASEX:
+		return 10000000;
+
+	default:
+		return -EINVAL;
+	}
+}
+
 void phylink_mii_c22_pcs_decode_state(struct phylink_link_state *state,
 				      u16 bmsr, u16 lpa);
 void phylink_mii_c22_pcs_get_state(struct mdio_device *pcs,
-- 
2.30.2


