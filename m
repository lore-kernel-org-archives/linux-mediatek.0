Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208BB606EEBA
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 22:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JmApR21l;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t3qBZASO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=KVXvU2y3CWgDkb2iD40+8fhR4es61+R0ZnlRm3BwJkU=; b=JmApR21lgAUPaO
	sy2XIswGH7vta4ay/xR6I43Qp4L6ogKqM/TtJRC72Cx73jX8JRuebNoHYIjaAzndG4EY6rktyT/El
	O3xcjMCKrQtRynGUDz96NdsXBOahfpm33Zvrl04k4Nwqg08O3DUeWhGecnFKnZIXhL8lF4JWucWak
	unsbmr5qwJqNalzX6grX+Ku7JW5By54vQsUP2l/YzzpFSAZlkp93Kw+ZuTSyvhHJwsbMAr0TaDeyD
	WgcaH8xxewSlPLkVamGP/t5+0GNJPoeXaV5NjlkqGoCMQYh1XNQsTb2i3cVUdemNe8fNMvecZRUx1
	mrOPp7FOQUos+LfYIsVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMmS-00000003oHs-1dy1;
	Tue, 03 Nov 2026 22:15:01 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMmO-00000003oBS-2B0J
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Nov 2026 22:14:57 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-48e6eb21a8fso27835f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Nov 2026 14:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744095; x=1794348895; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KVXvU2y3CWgDkb2iD40+8fhR4es61+R0ZnlRm3BwJkU=;
        b=t3qBZASOElfzeRmmU0IATev4K2DTIR8M+Fv85x8+kJ6lRV0oDacjlOyc5lqfyBMkY6
         A1Dr7/VYOOh/xJHVBWfFwcxK7HOrUguuWPUwBZoeucAI01jO/f7VE/XDJS6SdVxWwlnB
         nGfiqdxDYMKKFjjVw8qOZunjzuimJKqvz0dkzDvERVa08ari3hQMVCsQMJ1YkRd5fDn0
         DesZjCDVph4suwUEgovUoV4LI3rxiLwsnp2stnhB89Zvh9Cj4mGlb6++ZShz6XGmfEQs
         pQcXQd6I/fKnFEvZRTNgU9wTaqNaAH+2dN/3necL9MnJvY4qMh08O6F1aqU4DNsiGOTl
         sjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744095; x=1794348895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KVXvU2y3CWgDkb2iD40+8fhR4es61+R0ZnlRm3BwJkU=;
        b=eaRweeSxCyMlGv7p/4zS08LXjGraAQuMTD75E6fHJw2CN8oZjACSR3X6CFkJK9rHvO
         Skj9qB1R/OAlgjj26aRle7WXRU0TPFtL9nWF82bxGMcnF3oC94lyvfYkYW7FsRcMKOFI
         CdZr17eqdSGxzlSrn+8oGZiLi7Ytibknri17eDO2SJSLCzkilIImA0ZoG6EotmwR51zC
         0+goFwSzifB0/gsuhylnA6TnojfloZqte/j4mPDsmqfuKk4ahKZV4c0Qs8bv5le8UYEz
         e7Ampke2BaqN/d8jhyH/TISQ9oQEnxyYdFzBWCxZDm7QErHAaN57nu3WFOJhYf/w+iNH
         U8pg==
X-Forwarded-Encrypted: i=1; AKwUvBxLjXVJsKq1z+Vd0dULgCdYrBrrgh1LYRlzDVF6MKVlx51+UdzzqW+f4DGwBkwdrXLtzwbTvuUPCY1tK+fEoQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Yvv+ogNoydOgV2AA7thPuEIuvjM9eOBs95agoNFWBcC0F6aiY
	EVJAfn6YqcyBA2lRAnJ8d1PNwwL0ivmQQjP4wxyDfma2emRhYN5xPN0u
X-Gm-Gg: AYBFou0bLuyuGf3dINbR5pKN422YnV1gI2uICGssKWnrCF5JwzvpUszmZ8r2m7jUp1F
	G+ZxCD3Zbv53ickobku0KT7tfxSxIw17PQ84g5NMbpAWXhsRqJOhMxZtWacfD8RSSg4NTGSz1Bf
	usPwEt3/wIcIL4pW2DFPELF0SlJsuYWaJpccRWPfOPa8oIed4AcAall8wvgLBxKQ4+MTX1OOCup
	F6gJdmizTwkDVGe1n4s+YkrcWumEYzw7F4sSRVEIZ1Pc4POzBh25cKOKMoyeQ0VUoxiyo9d2p6O
	PdCNN+hiJDyRtrJlNThRRN4Zd9mhd+mhi+44wgsUm0CH6gVMVCGQxQt1QwPXiqeKMDMwIBsHaBp
	vJA5slsX2WG9dHh7lUyBBb5suWcl7SRAue34IsZZCbTFtjsPxyP0hZDInL2N8t55fX82f3r77C/
	RpddQQ3M1jCclgMXHBYmx6+EYt4sdM9qiLaeWBl3B6b7oVJ1knRhFGpvqjybBFq19poNLVjbTZO
	RGlFbvJeEc3j0bSy55MZRmREebL7yijAgQDKU+2C7Q2PR0xR3Vj+9BPz2PTo03R5SRuF9fVd+E4
	brkhgmEuJx4M46MC1ZxxZs9R6tQOtXZMCkMdWZbOSkPoCDjhZ1+Zw99rNJW0L3D7lBqS0ZozSO4
	1MmuS60tOXgTKtZt2HvkJLmqg/8PGPi3HRQ==
X-Received: by 2002:adf:fc0d:0:b0:48d:f383:2356 with SMTP id ffacd0b85a97d-48e6e500514mr25493814f8f.53.1793744094732;
        Tue, 03 Nov 2026 14:14:54 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm328556f8f.14.2026.11.03.14.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:14:53 -0800 (PST)
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
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v4 3/6] net: phy: mediatek: generalize cal_cycle function for GE SoC
Date: Tue,  3 Nov 2026 23:14:34 +0100
Message-ID: <20261103221439.30502-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103221439.30502-1-ansuelsmth@gmail.com>
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_141456_604767_3FDABDB8 
X-CRM114-Status: GOOD (  15.09  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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


