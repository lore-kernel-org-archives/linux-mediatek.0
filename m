Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21198C531C9
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 19:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZsRXfT5ibQiwiJAzw9HJHDQeaykvfcjebj1qaMIo5g8=; b=Es3diKigRYLi4K/nrrEdEMnqYL
	a+ADumMGYumbF7weVXhiEfIb/0nkZzmTT5BJSZiCw0NHt1ntH9Mvo5G9sQTGKqxt2npxP8v2+/IHv
	FJz0N9501RDm6da9Ue2IIWrAFYyTbDmmkMHQlM3e0LjKmy7OAqF6zugpXtl4TXRbi/ZbS9oZbjyoo
	zfO+GVkCEmrcOd3WeXjfmG+kTR5PU+JHrCWp+t4qvSEEKupmu+wvQ3ePGkEDh8ePkDhknZY+3Vpnx
	Fl9BT/FOnJUOe+6w9mCWQVYkt1Wpu2dlPKe4acdF78cyKbxPmnWt8t3DD3ERmqAnyU3AGoj9d97xB
	t15OOguQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLG7-0000000H7hF-1LtV;
	Fri, 24 Jul 2026 19:08:35 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnLFz-0000000H7aY-03cP
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 19:08:28 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-493b966dd74so5260975e9.3
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 12:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784920105; x=1785524905; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZsRXfT5ibQiwiJAzw9HJHDQeaykvfcjebj1qaMIo5g8=;
        b=iOYTxvygoMoCbTAJr7UbK8qbPfdrL+JKN6+IFufyA5pOftG6wcPRDaOsXutKR00Jqj
         MUpj+kbNsbQLBl9gjc1ktfVy0zCa2TabUgsiQ4ISW4WD4WKYzu+ob5qSjtGCf4npVhH3
         1IgLGB/+NBZNB3KooGwndpMYZHnF2drdT8E6wQcVaYDWxkVRPWD34za1pexMQkuUwrjP
         tYyVzp7hAUvOQscmMrEbS882G+Vmmjmu1DcyJDN1ueO76L85nRG9aUSAw/G80XvfNc4o
         GY7eAWqd1Zt1vcE4pK3e63vkpyC749tyAWRluhW7UPJaBoqMo1DRnFCQI7SAi+L5Kfhu
         keEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784920105; x=1785524905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ZsRXfT5ibQiwiJAzw9HJHDQeaykvfcjebj1qaMIo5g8=;
        b=oqrdsGmzzA3/o45e9hxMj8s1xcNbkRj7rxdNZJRjuFOBNFLRrdeYv27svIAZMvyrgg
         LKYux87E9NA4DyVZG4xzfPwVmDGlLQvm/50X/pKcDTkYkC1GTiUc9naln9lVp9DLjl0C
         f6XQEOOP2K8SMCMobJRszlm5uee/c4XBSUZDGFNQnUovvHc3Zrkpn0buH90jGWmRqcIv
         NCouIQUJwdrRzbwGFhtL5yOlIN+h8WLl3N6MTlFXDQIV9cWAySzJn5AFxg2tB/fB4DuL
         7muN5590ZeqjN187pWjkjouiTKmDF0zZBGVOsfV1Ifv5ARoCgWDYEli+/tPfTRRXz+VN
         bMBw==
X-Forwarded-Encrypted: i=1; AHgh+Roq5ECiKXzJk41qGJ2L2tExaHHAUPMHrv7YDFbhP7AmBqBDpZO+5CU3l3z2Bj8+1S5vjaX5P9EVdAzcHbqO7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPaEwZToGEJhfGvFWtRkL2kN56S6f24iRFa9gY+bBNvgNDpN9x
	DHQ7BFFILuhyBW2YiLaPJhnbO55ShDMBv3p3+QXKOcWvGhR9Q2uDO3jG
X-Gm-Gg: AR+sD10PvL6Oani9EWuFf9cO/lhm/5iFNhKBkYzDv9BVeY20ZTHn/jdcgRFjk1U7W8S
	2b5mJGw20L6zYe6uv0+5aBhtpiY2XOTdE7uVGv+gE4oUoEPJCgJGVD88LzpxkV0EBFpv2kq4UdA
	LgG2J1ua0EcHWc+rlDsY4Yxnvy4GcwXR2WlXC8LTGwOUIbgwxvvuhYgCXspM+6hpuBGW0GyV7tJ
	9bx60aRpDGZIL10dt8ZQNwA+nXiXSeRjlfRR0IDj8INYkM+lpUZ82eO2B78ypudC9TWR6BESox4
	Q1KOUH6HwidFSWemW6fOPfPpnPDOQtRWacGj0Mr7pAH0gnaLfaIwKEzkti0OnPtVbVKGc6iTOsa
	cV28bnDqTWDfKe14GeUQLqVYUYHeC5f+WENd8Exqf8TvuBLYYIHwK7QG/W1eSapwXb9tvh0KRpt
	cK5UsgdVSmFUoWPHvEV9KFhf+Kc3slvzPlODNa7M3jX/r/YHWi2ZKiBlofNulLTtUR
X-Received: by 2002:a05:600c:198b:b0:495:6c0c:c221 with SMTP id 5b1f17b1804b1-49573d20820mr99735945e9.31.1784920104929;
        Fri, 24 Jul 2026 12:08:24 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-87-3-249-180.retail.telecomitalia.it. [87.3.249.180])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-496b4c8d6b5sm5893755e9.2.2026.07.24.12.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:08:24 -0700 (PDT)
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
Subject: [PATCH net-next v2 1/6] net: phy: mediatek: export __mtk_tr_write
Date: Fri, 24 Jul 2026 21:08:04 +0200
Message-ID: <20260724190811.198339-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260724190811.198339-1-ansuelsmth@gmail.com>
References: <20260724190811.198339-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_120827_064158_53D3C501 
X-CRM114-Status: GOOD (  10.60  )
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
index dfd0f4e439a2..78b998af5238 100644
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
index 320f76ffa81f..f172f7d671c9 100644
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
2.53.0


