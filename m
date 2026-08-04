Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF35C55838
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Aug 2026 11:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uNVTFfdfEZG90+jAE3BzNE+piQiVWzc95vgbhLXgILA=; b=sJIeoGAhxNlcXRXw/WF2LJW4YQ
	oo54pw2W9NXvdvemO2HkjDn2uZr6RfUfGsjiNt6LbA8i0g2X8BqRJupC1Bj8Q8a2thoOvHyNX9xlF
	/nDsHgvQ3R96IUlfP9vzVYE5/GB8mHkXhpruPEzbzQD+W/XprVPcVaMps1SjVXNin1P9wGlRrRs/N
	MkXl+qOx21S8bzMJt8Fsbg6wwyuci8uHHKki5uts1BYffIGPscsJpwEpGfarkrchDekxfA1RabvvH
	Qa2dk+vPDqnkbVkDmMO9vpUdcO/CYiBZYIYUJL+nYrIS3Hfu7GMS/VnTuGAxJXRadYK9FRizTykWP
	imNyqPaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDQq-00000001iVJ-3xfc;
	Tue, 04 Aug 2026 11:35:40 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrDQo-00000001iS4-0tZv
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Aug 2026 11:35:39 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cbb973e6749so4994842a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Aug 2026 04:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785843337; x=1786448137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uNVTFfdfEZG90+jAE3BzNE+piQiVWzc95vgbhLXgILA=;
        b=lJqO9jUD0QsGG32XOGzfuYq3yobUPEJNkmh4Q0Q2duGMpZfgXkU5KZ23h6n8YS1zwa
         JFabZUNGCvECiATCzIy3hqK4i1dpqnHcAwWsFSsIlcIpGAl5f+e/hphIfKM9jwdXOLn4
         drNA6OWXQbWydK4Atk9s0V/EX6hbQtj35FHZypZrTFRGU+6fqn3lJmMngr774yonisap
         BPZxWicv5/0sDvEsqcEFM1/FB1CDKZ10tcqsUs4zRuzexJiAeyjTPAaWX5S0ayVMxp3C
         RPCossCijJ1eEQmi92lSKqf5LrIXBRNfbendKUU2W8q5IF5nHb9f42Rf0az92FBc0Sgk
         n0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785843337; x=1786448137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNVTFfdfEZG90+jAE3BzNE+piQiVWzc95vgbhLXgILA=;
        b=dFx4Mfsje9H6JROf1PEfTPvTCXY8ld1KFDPnReEcfZ49OKoKY19MZ68vFMAbNS9g1h
         AYRGcmf0DzAQcrRjwkwdsWycEtnXGz8gxCulWcyVVoJL/FjaQMKZt+btUpbrlc3L+AcH
         VAomXT/wdj9FzvDC220GLaeL9JfV78UEvOzBF/wMSugyY9w3BMGzHQinQ48oOxNtucuq
         S6IAyBQt4cFDieH9tj7BGwmlw1bfEpSs2DmX2pvSsOiLUyWhsrTw9i90UypBo+mQy197
         MQzO4mguHO1/CLvgSZ4KADRTHyCxvtzC008cZ1w6SJwBQvmLR2DOOBPra3OOSFWK8Bv4
         vwzg==
X-Forwarded-Encrypted: i=1; AHgh+RoZ2GNMlZ5W6ROleM6Zonm2VyPQbkX24dqm7vC9uS35P4apWxF1baRPMnVGf/yXlB8IYRLu+zM2ug9zodlPBA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/ZRH3/ws8jHjnVuZku7dl097iCxUr57RbpfAzKaBc1lbKP0Ge
	HBxMU+qCDVH2/GrSkM6hKT75JU9uKv1dRkaTN7uyaI96DiniZ8ijARDy
X-Gm-Gg: AR+sD10uNh64svQOliKUjwCxB54MM1N4Y0XqUhein3UWjyeD3n+XU/KwnwL7GHHzCup
	wnn/m0L6UI7dKBh4xrmjjpFYjMoZ5IudXP3qUMB8pgf8Ore/eIOmcvO7ppRUX4OU05g96v5FwmI
	vk1DTF6V8PVxfYKMPxAMoIhfXW3vcMRh+7arHiAWQR0JhjlrFpsJPJ2npw3vSGZEgDDVofybIQt
	xg9gvjqq1kVUKbLXiv5Ys2TVnjkg4L2WYhkCHqfo03M9UrRREs6w064b0XQ6K2msaKz567DyiEm
	esYkcaCI8nHDUbA+PbyaWkpWMmw2NpwDPohh3VvjUivlGAg3l83X5e3CIj/jyCciZyTjuf9BrJV
	QMmSRPMbwmsVJFvtE3dvgEosOr4vtaT/w5zlF5Q+IThi62u7REdwbgJva5aeV2b4KL0dpNcRXAY
	2nrylUxewN81qShb1VJe1Kx+MuteKSY70323jWhbURs9I9dH54+D9WDVpeinW65xPTXpRD
X-Received: by 2002:a05:6a21:3a47:b0:3c0:278c:6a31 with SMTP id adf61e73a8af0-3c92a51df73mr13770829637.11.1785843337304;
        Tue, 04 Aug 2026 04:35:37 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.dm.ae ([49.47.198.15])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm3569493c88.5.2026.08.04.04.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 04:35:36 -0700 (PDT)
From: Ahmed Naseef <naseefkm@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
	Andrew Lunn <andrew@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eric Dumazet <edumazet@google.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Qingfang Deng <dqfext@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Ahmed Naseef <naseefkm@gmail.com>
Subject: [PATCH net] net: phy: mediatek: fix TX blink masks using the RX bits
Date: Tue,  4 Aug 2026 15:35:11 +0400
Message-Id: <20260804113511.3371248-1-naseefkm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_043538_271437_2EB3637D 
X-CRM114-Status: GOOD (  10.99  )
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

MTK_GPHY_LED_TX_BLINK_SET and MTK_2P5GPHY_LED_TX_BLINK_SET are built
from the RX blink bits instead of the TX ones, so both TX masks are
identical to their RX counterparts. The TX bits they should be using,
MTK_PHY_LED_BLINK_{10,100,1000,2500}TX, are otherwise only referenced
by the per-speed branch of mtk_phy_led_hw_ctrl_set().

A TX trigger selected without a link trigger therefore programs the RX
blink bits, and the LED blinks on received traffic. The masks are also
used to decode the blink register in mtk_phy_led_hw_ctrl_get(), which
as a result cannot tell the two triggers apart: an RX-only
configuration reads back as RX and TX, and a TX-only configuration
reads back as neither.

Fixes: 7f9c320c98db ("net: phy: mediatek: Move LED helper functions into mtk phy lib")
Cc: stable@vger.kernel.org
Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
---
 drivers/net/phy/mediatek/mtk.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index 320f76ffa81f..79e09727b81b 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -53,15 +53,15 @@
 #define MTK_GPHY_LED_RX_BLINK_SET		(MTK_PHY_LED_BLINK_1000RX | \
 						 MTK_PHY_LED_BLINK_100RX | \
 						 MTK_PHY_LED_BLINK_10RX)
-#define MTK_GPHY_LED_TX_BLINK_SET		(MTK_PHY_LED_BLINK_1000RX | \
-						 MTK_PHY_LED_BLINK_100RX | \
-						 MTK_PHY_LED_BLINK_10RX)
+#define MTK_GPHY_LED_TX_BLINK_SET		(MTK_PHY_LED_BLINK_1000TX | \
+						 MTK_PHY_LED_BLINK_100TX | \
+						 MTK_PHY_LED_BLINK_10TX)
 
 #define MTK_2P5GPHY_LED_ON_SET			(MTK_PHY_LED_ON_LINK2500 | \
 						 MTK_GPHY_LED_ON_SET)
 #define MTK_2P5GPHY_LED_RX_BLINK_SET		(MTK_PHY_LED_BLINK_2500RX | \
 						 MTK_GPHY_LED_RX_BLINK_SET)
-#define MTK_2P5GPHY_LED_TX_BLINK_SET		(MTK_PHY_LED_BLINK_2500RX | \
+#define MTK_2P5GPHY_LED_TX_BLINK_SET		(MTK_PHY_LED_BLINK_2500TX | \
 						 MTK_GPHY_LED_TX_BLINK_SET)
 
 #define MTK_PHY_LED_STATE_FORCE_ON	0

base-commit: 1a35da325cac4d5bcad76a2aa943408a6f1d9000
-- 
2.34.1


