Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02099C982CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2026 23:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dUdIXrb4EJhWqsgdcMtWptyH7euJr+vzXL7VI47qrw=; b=ClM4qKlhyUgfWOWuXGqEqBfG6U
	vzVt9BjnC/JbzVL+KU4Lg5ZzhVp2d9A0PwDi1ZWlpwKzKil3Eib6bV+0kj4J45O7nO2xQIOBoD+w3
	4lcVMGd45BUNya5PNSPG2ziuAgvAKWl4/og30jyMPNz38Frk7VbQudBujKF3B9l1gZlEtjvyXKkIv
	pi6PgZ0OpKhy6NqM0uo2ApI0BGrQPqkU7I6QjWLSv+QbSWDSKf3D05E+I4EykNTp2WEp4bV8n8jP1
	IQoPKJ4Jc2AS4eYDOUeTlmb2qM5mDbXQYOSGBCTfSiTXxsKfozZ1/ZxkihWa73UBY1Ja0am/k1Cg4
	OqrjE1Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQs-0000000AGws-48xp;
	Wed, 16 Sep 2026 23:52:54 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6zQe-0000000AGfv-2UrM
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Sep 2026 23:52:42 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-482f6356f6bso171446f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 16:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789602759; x=1790207559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3dUdIXrb4EJhWqsgdcMtWptyH7euJr+vzXL7VI47qrw=;
        b=NUy0qsArDt/yD6WDUBFTU8k6Ug+S6QlpsOhaN96MbQ98Sc788s8YlzBJmvdL+7BDen
         ls49KirA4Xm6W7ymHFIKS9hZudSx5m08EWeUyM1pUXGftRwe3SrUiFL/l6tBWzOoT2UM
         hAFiylISd6T8jR/QjuWFwk1NPkiY9y/ky4i2V5Ynm5GDx4irctMA32eq6vfiJjrtlHk2
         XqS1G8sw06xe2GTYze/V/rUont5uEK5bIkfuI01XSdyXOM3ghdWYETE1W3ojRLorkaga
         QYdW4C9X3yluloIWCslcZRdPOYlcJ93JHSlpRcH/F939HnlM6QEU52lNncjn1/dXQgB+
         TAHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789602759; x=1790207559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3dUdIXrb4EJhWqsgdcMtWptyH7euJr+vzXL7VI47qrw=;
        b=cb6drMuri90dAizno92nAhz9MCRu8AaD5AgtJsSR7JCFdPe5Z4t3KrCj1UsJXFT4XE
         nNSp1Q9s3wz/Ilzy4TOt/gHYhvdOO5i4LQUEfobzpnoeKZUXr8hYZilm6IMI09PMTvAm
         KwpxfUw1b9AQbCOJsc7zBJfcFKYrxKHCaDQvAeI0EfC4pD2AOaRMnzdPay432Cmozub0
         JHDEPvqvyVuOpub2ttQz16pNGyPWrCQY8SFx03BCSlN6YjXU+cjDzkGzfxKLsM4+48Gk
         v4+PCOwYfU37LGcHQLa/JQV2VCKZkVGal5CCRU/G69AnT8MVpefGTb6NLz/NNQ++qpmq
         AQ3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwY53CMG6eXgqc76eRcifUx/ITV0PAdmn0PBaBUcQadCmakmwbfonQL0M3wYvdsxGb+y4g0qqiigk5MVQr2qQ==@lists.infradead.org
X-Gm-Message-State: AFuF++kE8CR3U6zFu8TJE+wR2DKzuUGPfQ81CEbVDztDWlLphKWljFcr
	FkCex6Pg9zEXcWV/zK4WMvDqT6w0j5JO1qd7tlPlEqht/22xe7Asx2gO
X-Gm-Gg: AYBFou0qQYDMjrQSn2Oc/zmPZoSX3VIX4IgwaefVShOSP21pcovWYhW83af5G8gQR36
	Ptcg5r6Hvsn57gJSZjDINc6WjCyYEcw7hKKpOl+kCUG92uIRYpws6TvN4bwJCz3ynGeoTed21sh
	U4s/nh9jYLWqZkI+jHT8Z2K+XDxtCr7Tp/mCDtRFzphv7bxDRWvHiVicbp0UTgyHB3IggXvKI/e
	laZr59vhczoNVaYOKvRyrOhhXj/3DG/KbJSqlEJ0jwPwtQ1bTABAC4EtRAQCYrX7JCtebG6WAQq
	A200K1u3403YSzmPsq+jAOi04kt/P8V0mdPpIxhUTGWbLVtxIW70o8+q2lmToZ5BeQwDV1MXktP
	eNUXpGMtUMxG7tmkyAbB7qnWUvLK9xgk3H1x1RN2D1ABunXYfy2GSPSOBI3J109HVAncMDAj6A8
	Y/nL+BqZ+VurKcyYlH42PdziV4UH/DiTJlfiG+MPL2zSXltqE7ZOj6tNeFcuARIi3BOAwBqJ/6w
	yzTfuBPWwL9+UDBM75a8Y47GkV+gjkOup4JNf+VRmr1sWUSOhBD7Lq7TZ1cLqr9
X-Received: by 2002:a05:6000:186e:b0:487:1413:c644 with SMTP id ffacd0b85a97d-487152180efmr1035266f8f.30.1789602758928;
        Wed, 16 Sep 2026 16:52:38 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm11861104f8f.1.2026.09.16.16.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 16:52:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Subject: [PATCH net-next v16 09/12] net: phylink: add .pcs_link_down PCS OP
Date: Thu, 17 Sep 2026 01:51:35 +0200
Message-ID: <20260916235200.20712-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916235200.20712-1-ansuelsmth@gmail.com>
References: <20260916235200.20712-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_165240_665990_A325B97E 
X-CRM114-Status: GOOD (  14.34  )
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

Permit for PCS driver to define specific operation to tear down the link
between the MAC and the PCS.

This might be needed for some PCS that reset counter or require special
reset to correctly work if the link needs to be restored later.

On phylink_link_down() call, the additional phylink_pcs_link_down() will
be called after .mac_link_down to tear down the link.

PCS driver will need to define .pcs_link_down to make use of this.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/phylink.c |  9 +++++++++
 include/linux/phylink.h   | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index fb3fb522769b..4edad9b3c169 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -989,6 +989,12 @@ static void phylink_pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		pcs->ops->pcs_link_up(pcs, neg_mode, interface, speed, duplex);
 }
 
+static void phylink_pcs_link_down(struct phylink_pcs *pcs)
+{
+	if (pcs && pcs->ops->pcs_link_down)
+		pcs->ops->pcs_link_down(pcs);
+}
+
 static void phylink_pcs_disable_eee(struct phylink_pcs *pcs)
 {
 	if (pcs && pcs->ops->pcs_disable_eee)
@@ -1701,6 +1707,9 @@ static void phylink_link_down(struct phylink *pl)
 
 	pl->mac_ops->mac_link_down(pl->config, pl->act_link_an_mode,
 				   pl->cur_interface);
+
+	phylink_pcs_link_down(pl->pcs);
+
 	phylink_info(pl, "Link is Down\n");
 }
 
diff --git a/include/linux/phylink.h b/include/linux/phylink.h
index f06eb8b6f94a..f03c1dc0a4a1 100644
--- a/include/linux/phylink.h
+++ b/include/linux/phylink.h
@@ -528,6 +528,7 @@ struct phylink_pcs {
  * @pcs_an_restart: restart 802.3z BaseX autonegotiation.
  * @pcs_link_up: program the PCS for the resolved link configuration
  *               (where necessary).
+ * @pcs_link_down: tear down link between MAC and PCS.
  * @pcs_disable_eee: optional notification to PCS that EEE has been disabled
  *		     at the MAC.
  * @pcs_enable_eee: optional notification to PCS that EEE will be enabled at
@@ -555,6 +556,7 @@ struct phylink_pcs_ops {
 	void (*pcs_an_restart)(struct phylink_pcs *pcs);
 	void (*pcs_link_up)(struct phylink_pcs *pcs, unsigned int neg_mode,
 			    phy_interface_t interface, int speed, int duplex);
+	void (*pcs_link_down)(struct phylink_pcs *pcs);
 	void (*pcs_disable_eee)(struct phylink_pcs *pcs);
 	void (*pcs_enable_eee)(struct phylink_pcs *pcs);
 	int (*pcs_pre_init)(struct phylink_pcs *pcs);
@@ -690,6 +692,16 @@ void pcs_an_restart(struct phylink_pcs *pcs);
 void pcs_link_up(struct phylink_pcs *pcs, unsigned int neg_mode,
 		 phy_interface_t interface, int speed, int duplex);
 
+/**
+ * pcs_link_down() - tear down link between MAC and PCS
+ * @pcs: a pointer to a &struct phylink_pcs.
+ *
+ * This call will be made just after mac_link_down() to inform the PCS the
+ * link has gone down. PCS should be configured to stop processing packets
+ * for transmission and reception.
+ */
+void pcs_link_down(struct phylink_pcs *pcs);
+
 /**
  * pcs_disable_eee() - Disable EEE at the PCS
  * @pcs: a pointer to a &struct phylink_pcs
-- 
2.55.0


