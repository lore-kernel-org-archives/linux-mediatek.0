Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B4A6CC6B1A
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 07:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVXvU2y3CWgDkb2iD40+8fhR4es61+R0ZnlRm3BwJkU=; b=XR+OwqudJGsDG/bRkypIOXymi7
	DyCn3FWV4SwuOj/omH+TKDCckUm+P5phQz5qq3bXHgUH6hq7Rbd8GKBGAXoToXzEOgrulN1kZkz+Y
	dV3msnMVQ4FKls1/j/+PFJkf2PYUs7BSdjlOXhwoZFnM/d02kBIp/cnBiKnRi2nX1EERHfkKFlHnX
	GbRpg/gs5+uVPvJEzRpYA73ebEQNFQC/fsnN4Fi6Xd/AhyEsPLgFwXhtZj4hNu7NPT3XjFP85XB2R
	e+cGFs9GY8qQtKxijMRca5pKIJzpcdrcMpocLQXPOrZjPssBWXkXau98bo2nOGxPOSsguv+MQnOtE
	9FHVcqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtFv-0000000EiGX-4ALU;
	Wed, 14 Oct 2026 07:18:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtFe-0000000Ei6b-11gW
	for linux-mediatek@bombadil.infradead.org;
	Wed, 14 Oct 2026 07:18:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=KVXvU2y3CWgDkb2iD40+8fhR4es61+R0ZnlRm3BwJkU=; b=CoLDAchgvAJNF5SkXoD17WgeMG
	eLvn3Ci+q4o02ab9ioEQNy90Q3U2+EngUa9UXXRyMpXM5c3k/jYDPMQwqvxIB2nZa7gklBpeWKhKu
	pPWgQ9eu0zxCeymaeSrZTcER44OFR6ropZLwVieDFJELbFwA9aEFpew74bhTcMaxAWDHkEll4iAci
	IJkD7PrNejqAuwl+A3g2ts2N0Ltc2wWXosi5Et9p+8jlwJZD+Vx8qYLE8+ArdDb6H4W6mDZAQ85bQ
	w9IAoAjQ/1wjfkclb6F2T7C+2bH8t7QrEfrwM5rvGmEAB/ubVyV8yknd/Ojgv9XIejSTZx+mIjAVs
	CgFZJ1Kg==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGtFa-0000000GRHc-3zhW
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 07:18:13 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so30820355e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 00:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962289; x=1792567089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KVXvU2y3CWgDkb2iD40+8fhR4es61+R0ZnlRm3BwJkU=;
        b=oTIsIEDCVvTFQ4H23lovoZhIM7hRSxx3EPI671Gydaaztju07u3e646PF79dicz+yX
         LPFFFUl5MkS2g7a75YvWPl702ak5pqJXOBMxopoxyF80NlyHPXWDySlEZdH4AzIVgVQ6
         VaMl8as+Jz3Tzvtp5sk/hZ2QpfCewNqXkklCJDm+jASwhcBsZb9e5f7Xkj2fQC/zHNXB
         D2tdC9UM6uh3pf9afuJs3HjqV6HCgYZpuTzTLqGRbsKbjuD3nrmLYwVo2Nh+4Dyljk1g
         DYnDBXfpzhMF0gQLUWTikQypXbi9u2yzHvWYInAmTUsF9rDIVavWPo2qmYt/aiBEEfVw
         s0Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962289; x=1792567089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KVXvU2y3CWgDkb2iD40+8fhR4es61+R0ZnlRm3BwJkU=;
        b=1fKv4aUY1B6IBm2ADyR4mxKPVFDBt1Bxzfl2prB52UhTw3VjHdXaKJ3UPOG5s1cEPX
         S5c6/k1Ym0mKtwV/LFgfAgkzUQQU07QSmV5Hl+GNELgSTBCjVG41I3ysqnuv7xgfyOX2
         sA+Ew3pr4HYMpgMh0CusRysfyDPGZkvVfifBW+ixgr3NBzebvpsZqI/dyjAvSh+HACVS
         r3iK4yzX5mdNteXFQrVdAIAKNsNfonQi5zXSOoolsn4vPF5DuBrcfHBPpjALA4xv3mUA
         eK/2B9q2hy14u+qLy3HSfTJXc0ekph3z8MB+/iV5cNHa3G64fN5KAvUIA9dKWKbedGWE
         a/lA==
X-Forwarded-Encrypted: i=1; AKwUvBy8/AlIIT16erH+hd6NgKkW7LXDZNh/WHfl5DRfO6LuwNvnZVSINXVfwE0x2gKAxbhgnM+dJlNDDEiheY/NwQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJMtOuzvE+1xEko+HbnZfKzTssIEWg2n7JWq0JdXhQmJ7kp8Ofm
	CkeG6iB7Q3wOpNait+12YbHJrEvESwM2VKoZ38UsFdEwvshpY7ZOFqY7
X-Gm-Gg: AYBFou1XsLob0kEegbmCjj5Zi0cVD3/mB0L0xttpsu+tSrdEOOBwSfWLVo+KWPXic04
	fwKdkr/Ddm+iXZDLgNsPJzKQ7gGP53YPn5OX9nqmOmAk5k5Hu0o3epcaE4gMAYim3MlzopL4Miy
	CGxUWVH/uH22qXcJnVyOiUiJcJk9pjX1SnGtPR430soVGvgxHwjFd009meunsP/IGFe1X3bLLSZ
	21ws7bu7HvgA/178llxyidaQVQjFL9y9jbQg7Xzhg3MUEA7y0EytSp/ySacsecndiRcfF1mmxSM
	umClePxYJtX+sIVoHrs4KkMfu9zZ+W1bJLiwENeF61bo8TYPD7DLhgnVN4WHMJF3FTwk/sDf3Uy
	QHvv3tljn49AO4VBwxk0X5HU4O5lLfru+ux4vwFZYwa2YzGRBpe/EslBkbHLvA9ybY2tSOQCWlm
	xxaKlux7R/S20Y88DpVvHasiIN0jYnFkeV4DPO1gjuq46NspbBL1zvzE/6Bmrw9mjg9y0tP2Lui
	QNet9/0o5a+raY3R3pF+R6kyitCtBWeI60hSX781ib7l8lYEsm4BpjThOj8MLQ+chFAYiv4wvmW
	XReluxNN5MffWOYUcSp2uA==
X-Received: by 2002:a05:600c:1c07:b0:4a1:b044:9ccd with SMTP id 5b1f17b1804b1-4a1b0449d00mr79174665e9.28.1791962288754;
        Wed, 14 Oct 2026 00:18:08 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1b35d64e4sm18756285e9.0.2026.10.14.00.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:18:08 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v3 3/6] net: phy: mediatek: generalize cal_cycle function for GE SoC
Date: Wed, 14 Oct 2026 09:17:34 +0200
Message-ID: <20261014071739.216345-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014071739.216345-1-ansuelsmth@gmail.com>
References: <20261014071739.216345-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_081811_165949_CEE4DAE4 
X-CRM114-Status: GOOD (  15.61  )
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

In preparation for support of special Software Calibration for Airoha PHY,
it's needed to generalize the cal_cycle function as Airoha needs only
part of its logic (the wait logic) to complete a calibration cycle.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/mtk-ge-soc.c | 32 ++++++++++++++++++---------
 drivers/net/phy/mediatek/mtk-ge-soc.h |  3 +++
 2 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.c b/drivers/net/phy/mediatek/mtk-ge-soc.c
index 2b1e9923db98..f3ce6e67eb38 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.c
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.c
@@ -39,20 +39,11 @@ struct mtk_socphy_shared {
 	struct mtk_socphy_priv	priv[4];
 };
 
-/* One calibration cycle consists of:
- * 1.Set DA_CALIN_FLAG high to start calibration. Keep it high
- *   until AD_CAL_COMP is ready to output calibration result.
- * 2.Wait until DA_CAL_CLK is available.
- * 3.Fetch AD_CAL_COMP_OUT.
- */
-static int cal_cycle(struct phy_device *phydev, int devad,
-		     u32 regnum, u16 mask, u16 cal_val)
+int mtk_cal_cycle_wait(struct phy_device *phydev)
 {
 	int reg_val;
 	int ret;
 
-	phy_modify_mmd(phydev, devad, regnum,
-		       mask, cal_val);
 	phy_set_bits_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CALIN,
 			 MTK_PHY_DA_CALIN_FLAG);
 
@@ -71,7 +62,26 @@ static int cal_cycle(struct phy_device *phydev, int devad,
 	ret = phy_read_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_AD_CAL_COMP);
 	if (ret < 0)
 		return ret;
-	ret = FIELD_GET(MTK_PHY_AD_CAL_COMP_OUT_MASK, ret);
+
+	return FIELD_GET(MTK_PHY_AD_CAL_COMP_OUT_MASK, ret);
+}
+EXPORT_SYMBOL_GPL(mtk_cal_cycle_wait);
+
+/* One calibration cycle consists of:
+ * 1.Set DA_CALIN_FLAG high to start calibration. Keep it high
+ *   until AD_CAL_COMP is ready to output calibration result.
+ * 2.Wait until DA_CAL_CLK is available.
+ * 3.Fetch AD_CAL_COMP_OUT.
+ */
+static int cal_cycle(struct phy_device *phydev, int devad,
+		     u32 regnum, u16 mask, u16 cal_val)
+{
+	int ret;
+
+	phy_modify_mmd(phydev, devad, regnum,
+		       mask, cal_val);
+
+	ret = mtk_cal_cycle_wait(phydev);
 	phydev_dbg(phydev, "cal_val: 0x%x, ret: %d\n", cal_val, ret);
 
 	return ret;
diff --git a/drivers/net/phy/mediatek/mtk-ge-soc.h b/drivers/net/phy/mediatek/mtk-ge-soc.h
index 008efd148a2c..14370b5ce482 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.h
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.h
@@ -354,4 +354,7 @@ enum CAL_MODE {
 	SW_M
 };
 
+/* MTK GE SoC common functions */
+int mtk_cal_cycle_wait(struct phy_device *phydev);
+
 #endif /* _MTK_GE_SOC_H_ */
-- 
2.55.0


