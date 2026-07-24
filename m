Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3C2C531FC
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 19:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4Ic8NabspzFl1YQzO0CBvVxP+4q7RfeLVihZdCAEtA=; b=MtwiEToOr+xvWONHCgs7B2zIxV
	unarMa+pR7+cEt53PbhlPPTdUonT0zeHqckeuXOXuk/g4aXpyMi8SJCG90KCnDmhfz8cpNwG8itig
	ZhXqtr67e7e94UgyQoNIw12kHWghgbeBAIof8nija+y7sGLs3+Yilab1FqilzBfYx4JWHWVZNtJYK
	AHOLNKx+AktVmekN/SjVwg41r1cE9fZ8jUL1+pYNvBjFMEJ0/fXOW5pz+wQBynvLgETFPrGTfgqxv
	DYjgJM1f9DPYklG/cRwDccNI+p+reRGC0dcrJ0rY9lZP3TG0jU25tn5wFD8zrGDdDXjaryYF1JY4r
	cLIsvWjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLGD-0000000H7kp-2KAR;
	Fri, 24 Jul 2026 19:08:41 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLG2-0000000H7cB-0HNi
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 19:08:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso7224225e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 12:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784920108; x=1785524908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j4Ic8NabspzFl1YQzO0CBvVxP+4q7RfeLVihZdCAEtA=;
        b=qbRrxhrka1ZPe9Y85DDlOjmCBPfBadknlN4GRvuIWiu8cyf50YKsLbdilgZ3GqSIdn
         0cuWqTxfTfvyMojEgZnsxRUgs7+XraW8YhU/txNKgjYiRPO1CsWLakFspHBAgWXWxfDY
         2C3/b1GsuCnfsocewpkou9Ry6oA16UcJgw7oTfA4qJLaxsnmC5dZyYX0wCPjOuqmEIin
         14ZPIbfPZNjziqoDcBFqnxHK7L2a3xlUN1NN46kPvPfYCcGvNWJzNecYyU5M5G+eVkTS
         IhlxwKF5INqb09KZoEwxzUrw0i9x5aDY9g8pxtU9FUy8qYpdf36ZmtLjQc0Nsa9W21o5
         7cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784920108; x=1785524908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=j4Ic8NabspzFl1YQzO0CBvVxP+4q7RfeLVihZdCAEtA=;
        b=JiQ8z3Vw0wMlrHx1SCKN31mWXqoz3+WYUapFlqcSAHNOYyaiZWKWTPkKZjcDoTnn2E
         Jw6TaStrlBZGKPDcbFJuyQj0x2PXUq2J6F+KSMDiAyQu1MqqkQywAxTp/3TgwNvW04cy
         W8fQYK7aQaF3lAnwvm1EsseZRq1AXfgiDvzRqo0yCGu50ya+blJtZTCSYDkTKMpvLjq3
         Z3Sxlj2QSP4dO3lG3wMM6wsycodtlcob4bRXuZoJ1nnKj7a5cSqXjuQOJe6Je/3W4wAX
         dXpDD3kYkA+J19ugGonVNGNXSbi3PL3LLU/gtus0XQuANWpdJ8aLjhaLpgr5tmOjR83t
         qFIA==
X-Forwarded-Encrypted: i=1; AHgh+Rp1SbxfJ2izA1HFE1z55KUaPNwQzelMDB/0J9Y3Q56NvlA1Yh3SySxHLPFk7ALSGS7mwkGnw+EmPb1vu32P0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFOpVmrdZUQunxJUsmmsMl4r6BdfqUPeAtm4gHPTvqBnxYMWjL
	RjMjNpxkIfvRQqUKdZnK5JjKKkSm0ZLBg5YUJhESz8iru/4bwVdnlHbg
X-Gm-Gg: AR+sD123LKpWweMCZ8mPJzTy10fvcK/Gk2tObvzwSDd2T9WsRU8XDlT4e7TYB8t0zgj
	xmYVATxvgO3030/gI+GidKgrIIcEqPAk3GaWJo3NSguozIkf/4T/NqcqsQQ0PPHTBYuQ6L3ROsI
	RcaKeCsQxhB33Id8H+1Xr1FIIzzsDVXLkVHMe7fn1BDG2lpKTODK8SzuISRLeCWzOyOlOx5e6qS
	rWNZX+nk0vQIkFOYCgi3zRyeQTAcm7BG7GofscQ1FKedIy23UTHJT9KsdHpPgqi4vUeyng/3cag
	6pcnfli9bHbrDgHDH90hWdlUr1Sc8jDu9vFAoOpcgtvild/sPOpAintpKngI/t4a42exfgP7apW
	n4ba/bCQJOUSPz1Ibmme17QQV9E2ElALuVw2Q70XWpkl3HqgRuMQc4LGr5D7NJ6BliI+Yk3wcuW
	sCA0oiUXBLMlAU9KPri00zG1iUbxQDMA3ZFoV5RsGZFtGTuf9jip7BSPgj7IaLkgL3
X-Received: by 2002:a05:600c:1d23:b0:495:77e3:88ba with SMTP id 5b1f17b1804b1-49577e388c0mr81039295e9.27.1784920108360;
        Fri, 24 Jul 2026 12:08:28 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496b4c8d6b5sm5893755e9.2.2026.07.24.12.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:08:27 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 3/6] net: phy: mediatek: generalize cal_cycle function for GE SoC
Date: Fri, 24 Jul 2026 21:08:06 +0200
Message-ID: <20260724190811.198339-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724190811.198339-1-ansuelsmth@gmail.com>
References: <20260724190811.198339-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_120830_169102_D9BA29A1 
X-CRM114-Status: GOOD (  14.77  )
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
index c25292f7178a..b4d73954072e 100644
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
index 349dfbdff1fa..9aaa7e3caa41 100644
--- a/drivers/net/phy/mediatek/mtk-ge-soc.h
+++ b/drivers/net/phy/mediatek/mtk-ge-soc.h
@@ -345,4 +345,7 @@ enum CAL_MODE {
 	SW_M
 };
 
+/* MTK GE SoC common functions */
+int mtk_cal_cycle_wait(struct phy_device *phydev);
+
 #endif /* _MTK_GE_SOC_H_ */
-- 
2.53.0


