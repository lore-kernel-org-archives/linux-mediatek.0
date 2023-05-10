Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F22E5C7EE22
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 May 2023 23:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+3FQ3Pb3lJqR+IKZmMEYcEXjSkVddYPT3xYFpZW48U=; b=Zcos7OzR+PgOkbghDJTP/3kphJ
	w1MahN35ML4CP1Yp19+gXoa/uNY2EaP1T3p9ZmRPicmMiKqOUWpN4GfIXzcwYb16uIilztZUxmVdU
	+iIoYnMLDqnAR0KQxfRkeYiBW1s3FoQes5Ug+iqR3V8T24dAn8ntVsYxgOOjMj4qpt4qP3G0NgYct
	MmVUGqHgsfh7W+VzgnZzYeC90IDaKCC6m8LKtMNhInl/ZftWTR47AO8Uyz476k59p7AJPCAm8qpn0
	KKJyiPN+E/sknfXKqoda/XIxqDnYJ3BpDVRUTKw4u3XtUqgGe57nO3HqOtCUmM3G+HND05nGW2n8B
	IuL4ogxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwsoa-007Cnm-2V;
	Wed, 10 May 2023 23:01:44 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwsoY-007Cn8-0a;
	Wed, 10 May 2023 23:01:43 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pwsoW-0004Vu-2l;
	Wed, 10 May 2023 23:01:41 +0000
Date: Thu, 11 May 2023 00:59:46 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH net-next 7/8] net: phy: realtek: check validity of 10GbE
 link-partner advertisement
Message-ID: <3722c3cf286bdaf89343c6d9e552d3eef79a2557.1683756691.git.daniel@makrotopia.org>
References: <cover.1683756691.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1683756691.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_160142_215150_ADAAF0A4 
X-CRM114-Status: UNSURE (   9.89  )
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

Only use link-partner advertisement bits for 10GbE modes if they are
actually valid. Check LOCALOK and REMOTEOK bits and clear 10GbE modes
unless both of them are set.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/phy/realtek.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/phy/realtek.c b/drivers/net/phy/realtek.c
index cde61a30ac4c..29168f98f451 100644
--- a/drivers/net/phy/realtek.c
+++ b/drivers/net/phy/realtek.c
@@ -715,6 +715,10 @@ static int rtl822x_read_status(struct phy_device *phydev)
 		if (lpadv < 0)
 			return lpadv;
 
+		if (!(lpadv & MDIO_AN_10GBT_STAT_REMOK) ||
+		    !(lpadv & MDIO_AN_10GBT_STAT_LOCOK))
+			lpadv = 0;
+
 		mii_10gbt_stat_mod_linkmode_lpa_t(phydev->lp_advertising, lpadv);
 	}
 
-- 
2.40.0


