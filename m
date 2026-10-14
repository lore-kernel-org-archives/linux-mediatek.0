Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7DBCC6B26
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2026 07:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=; b=qCo/e34zHycD8gZwgKnjZgO1Ud
	KiSO3rJOvI01tAEG5U8Nv2LSpLSHabQrHbhQrKYR1lAwoNTGA224+IMUgp2Bdt0NIejD8jgJnecAe
	usvpJil26qgd1qZG70Y/NKUJP6lXWCcfMUCLgPL3+CDrwEKOGY7N2cOGBPfrTQieww1XHaYeOeCSq
	mkbsMhyV9SucID+KcjP3dhb1VPhzDO0RJm75JsnV4FVbH543DCP4a5ZiZiT84pfpFfCGPWahMF4YS
	1cJ6RSGParcVyvwwebKNnnYj7ZCLCNRf4f5dOWzUmMrvwSHb3YBCDDAH3hqcOtgk+8y9u9C+/QeRr
	4S49OoDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtFV-0000000Ei1V-3VHL;
	Wed, 14 Oct 2026 07:18:05 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGtFR-0000000Ehwg-1YB5
	for linux-mediatek@lists.infradead.org;
	Wed, 14 Oct 2026 07:18:02 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a16c399641so37024015e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 14 Oct 2026 00:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791962279; x=1792567079; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=;
        b=CZU9KDGTqQtlwGxAGsywmh7mwBWI2Tc9IZK3wPa874A5FLrE87fqQu5Kc3RPD+jvDx
         ajwG/PBQ4pUTdGuCQxUexBiVFcm6GX+qvMD8mUy6/FBicoEKBC/HBtsiWYiQhRM6uqej
         QHAO4vBTRNdUQKpxBhCUzYlZZJHgT9LGgPWDW9UiSgcziT5XW89mIOT3Unlb9m/S5SHp
         e8c7RyOjGv3u3q0g8namu0Rxp0VZcEhjDTbbfhJw6fYf6LlRzMtduoMS0QkRt6dLtmnU
         zmfrU9bF6TLb17RChglCZExvacnoVH/kKWIOPrCNy5MnqZPQWzx96T22dRzVJsErRDk8
         y2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791962279; x=1792567079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+Gr5bWZcYgumQbnVFUL+12XP1Z/UJrPiizeHxuglwVk=;
        b=tEykcNTPaul+iQ8QCemYh7RUyb5S8eOCpOqkIJfPh98e0J1QAltOis699nbB6rJEKt
         MnppAmNdg0qCxj7uU842SXPXhm1G3DSixtcPFusPfU9Xrf4j3XbMPQFTWeVgTCn8XmeB
         Y9j7I24I9hPRUrZlISWVz14oEiZuy5AjI7rSbfoJlYI2QqNrDTNIDvtxiRaLeiAHCo2y
         bsX6vmJ5+pLR/4bQFnFLx1KTy2ayVIZSk1KZUOvrp14HJ+L3IncSZZjSDl8PV/ZjoA5G
         +AF5/YhYcsNaU2nl8Go68Y0Kjq6sPKTkYao4Z6GxxbkYB+omqSz84fL9845SWsgCIsi3
         axCg==
X-Forwarded-Encrypted: i=1; AKwUvBxerBSNN/lMTEx/FPDQSyRYPzU9atNoL08XZjzPeknpjAcwQ+lPJmXNeniS+UMV6hujzx+vj6fFZ2SmVUXojg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLrrSA0ylSoSYWqcr4ivnosE5upOVtpvns2ZMLl0VViJrMQZ2+g
	qZRtYJRUDtbTiglwpBXxQ9sLAG2MzglXiKcYHcYsZKz+a65O/XPM16l0
X-Gm-Gg: AYBFou2dTnpRd8mM5kXzZbwcT2xEDz1WCfHJ3GV0aUJONbsNZdDLDaZ9eUKKGthrAUS
	qRLoiWAmVOTbI7AQqnaS33/8uAWM8uqzVgVURiaOntL6/BZzeue0Om9juZzKy1dknZlW2t7YbCM
	UISatVlY/gpMaxBUE4OFQFnwXxOaZ3iwEteopATxf2o6O+Ld2EynEtLtZgEyd6xVwKaG01Ur992
	2zyD4JKWwvs0taG316/i8VwhbDi9C4fuDOVYGckyt78bvIfaV0rq0opIE2IPou7ck2FyxqJtz9k
	ydteS/8tPiifd5HpDNplMd/ie0YTfLDkUcbEpBvcez4aTo/9zcWQhu0cY7jUPKesg/sWPTBTVI/
	PYgcNjJta6bMinyCf5nD2FgaFWW+M9qEPN1Q1Prj+0aK5XMrO/GiHJMpqXc39VfdSfREepbQL/X
	tCdeF9c95OuY2tvsZ6CVHRQz4I4q0ZS8eRsDErC+eXrUJ5/MbI+01a6Bl0RDBEOVN+/+3aExgc7
	oJ5r0MRtovgGTvx1DBS4lYqbdJmLrj8aa89G0nc4l1vn4jVjtV/cvEauWbQRygc2Jyb0ib9J9jU
	1ip3R6m6j/dWuh4qoV//0I/IIbpKrBc4
X-Received: by 2002:a05:600c:3f0c:b0:4a1:85d9:13be with SMTP id 5b1f17b1804b1-4a18e498471mr318247985e9.20.1791962279370;
        Wed, 14 Oct 2026 00:17:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-235-252-189.retail.telecomitalia.it. [95.235.252.189])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1b35d64e4sm18756285e9.0.2026.10.14.00.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 00:17:58 -0700 (PDT)
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
Subject: [PATCH net-next v3 1/6] net: phy: mediatek: export __mtk_tr_write
Date: Wed, 14 Oct 2026 09:17:32 +0200
Message-ID: <20261014071739.216345-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014071739.216345-1-ansuelsmth@gmail.com>
References: <20261014071739.216345-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_001801_431759_79557F90 
X-CRM114-Status: GOOD (  10.73  )
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

Export __mtk_tr_write to directly write to debug register.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/mtk-phy-lib.c | 5 +++--
 drivers/net/phy/mediatek/mtk.h         | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk-phy-lib.c b/drivers/net/phy/mediatek/mtk-phy-lib.c
index 4c4eca870bde..3e4fb899a85b 100644
--- a/drivers/net/phy/mediatek/mtk-phy-lib.c
+++ b/drivers/net/phy/mediatek/mtk-phy-lib.c
@@ -36,8 +36,8 @@ static void __mtk_tr_read(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		*tr_high, *tr_low);
 }
 
-static void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
-			   u8 data_addr, u32 tr_data)
+void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		    u8 data_addr, u32 tr_data)
 {
 	__phy_write(phydev, 0x11, tr_data & 0xffff);
 	__phy_write(phydev, 0x12, tr_data >> 16);
@@ -45,6 +45,7 @@ static void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		tr_data >> 16, tr_data & 0xffff);
 	__mtk_tr_access(phydev, false, ch_addr, node_addr, data_addr);
 }
+EXPORT_SYMBOL_GPL(__mtk_tr_write);
 
 void __mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		     u8 data_addr, u32 mask, u32 set)
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index 79e09727b81b..3565e39b96a8 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -72,6 +72,8 @@ struct mtk_socphy_priv {
 	unsigned long		led_state;
 };
 
+void __mtk_tr_write(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
+		    u8 data_addr, u32 tr_data);
 void __mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
 		     u8 data_addr, u32 mask, u32 set);
 void mtk_tr_modify(struct phy_device *phydev, u8 ch_addr, u8 node_addr,
-- 
2.55.0


