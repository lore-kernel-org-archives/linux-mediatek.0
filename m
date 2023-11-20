Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C27C5AE5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 15:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aMjjq9qLyKnXGA+eO91BLzIpEsWi8EWdg29zu6S5n/U=; b=2+NAU4zjzuLWfTrctirbXBsOYa
	ncXTsr/Zs5kg9ZYnlUiOb9LocSZ7CrUyAVxEu8ed0l4rcVEO/Soqh5xCMovjZ2vpO4GvPwkvc/5hn
	Fw6Daa8ckYX2FcZLpNfQilzCwqgTXBFGOGq5PcvlP4N9PBI63vtBp2JmPrK7rpTGBvoEthHmNFOW4
	xZ2ww2g8W8l5YHd89Eibx6bt/5Wy43rcEeXKj4qEhwf4hkqQvHxxxov3gr4nai/pplamCjMBohT8Y
	RMNa8W4jQKeeynW2qsl8LREluTLbXqZkG2YzIimdsV79oG8ieb73wWRgym5IGFcB+jJm/ukr8Oy/u
	rkRAx7Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r55lT-00CRtf-33;
	Mon, 20 Nov 2023 15:00:43 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54gS-00CBkQ-0a;
	Mon, 20 Nov 2023 13:52:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4084de32db5so19085655e9.0;
        Mon, 20 Nov 2023 05:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488286; x=1701093086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aMjjq9qLyKnXGA+eO91BLzIpEsWi8EWdg29zu6S5n/U=;
        b=f/M3YF9YWG6tFgoSs9v9LBRytaUBh4AIWBoZYDCaBBV36KXzDPBNo3hLoPS2kNCR1J
         /6+rTI+tU7MuUhmjbfFIWdB+Nc4wmaLOqeZZ+Pb6ijfnFLClgKnFiNguwVl+G5NzMq6d
         XMhxMa+YhD8SgH/yHyWahb05UFpzlguZ7A1CFjVplx883j+zz+IGMGCcEdZZl1ZWj0SV
         OTyyv/4tUcLq4QHWtljP2f4zAvXVCzbrE0f0be5q7yBucRF0nT5l/YbmBriLcWcJCURJ
         QTL1D3kJUNVYLIaPgMFminBu6QvkvY8CodoePNc47CvNgZBTz+JPgM6STxrfMBdBUgx6
         7u+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488286; x=1701093086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aMjjq9qLyKnXGA+eO91BLzIpEsWi8EWdg29zu6S5n/U=;
        b=sOft7cdPA89DgTVjgaanvYYRlEQFV4CRrtbaO5aGADWFmg41g1qzHXII6OaMlnXr1T
         aqUo8aS2S6y8JL9uJQmPTFf1qU4BWhI6QEeqRkkehF1tZKiwplKW8UgAw/4cWCWOChku
         9GRHzc5kaeT7uylDwX3wYMuneNWXIt5UctkRS2R1DYlV1XEfRM9vfL101Z7qpKCxD9qg
         E1OCHpTi5jpToL0cvkWJgaDWXbDleNMVlUjmREX+Lj/RkOe2JpM3SO7+1t86vFqvPDoi
         hrwXPNAUGvsjC9xWyJiXrhRoLuMRQf+IJUhiHyxQfjUbPM5g6QNLkjgj1DizFsOlMjsY
         Qmzw==
X-Gm-Message-State: AOJu0YzKzHsXUmsOS4SbWlUl00Th0c443fVgNlP06SG0jX5Ttb9vGXc4
	2/niEwTN/0Bvz0kNXyybYyM=
X-Google-Smtp-Source: AGHT+IELaaTlk2hOemekBls41C7RViCTII0CDMoPho0KjrhB6Lc/w0Sv0fdqN6PCiINS6TOvzE03Tg==
X-Received: by 2002:a05:600c:1d1a:b0:40a:49bc:fa9d with SMTP id l26-20020a05600c1d1a00b0040a49bcfa9dmr6576777wms.26.1700488286520;
        Mon, 20 Nov 2023 05:51:26 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:26 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Simon Horman <horms@kernel.org>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH 09/14] net: phy: move mmd_phy_indirect to generic header
Date: Mon, 20 Nov 2023 14:50:36 +0100
Message-Id: <20231120135041.15259-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120135041.15259-1-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_055129_837733_C7EEEE4C 
X-CRM114-Status: GOOD (  13.16  )
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

Move mmd_phy_indirect function from phy-core to generic phy.h to permit
future usage for PHY package read/write_mmd.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phy-core.c | 14 --------------
 include/linux/phy.h        | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/net/phy/phy-core.c b/drivers/net/phy/phy-core.c
index 966c93cbe616..b4f80847eefd 100644
--- a/drivers/net/phy/phy-core.c
+++ b/drivers/net/phy/phy-core.c
@@ -526,20 +526,6 @@ int phy_speed_down_core(struct phy_device *phydev)
 	return 0;
 }
 
-static void mmd_phy_indirect(struct mii_bus *bus, int phy_addr, int devad,
-			     u16 regnum)
-{
-	/* Write the desired MMD Devad */
-	__mdiobus_write(bus, phy_addr, MII_MMD_CTRL, devad);
-
-	/* Write the desired MMD register address */
-	__mdiobus_write(bus, phy_addr, MII_MMD_DATA, regnum);
-
-	/* Select the Function : DATA with no post increment */
-	__mdiobus_write(bus, phy_addr, MII_MMD_CTRL,
-			devad | MII_MMD_CTRL_NOINCR);
-}
-
 /**
  * __phy_read_mmd - Convenience function for reading a register
  * from an MMD on a given PHY.
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 8af0a8a72b88..dd2381652dd1 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1361,6 +1361,20 @@ static inline int __phy_modify_changed(struct phy_device *phydev, u32 regnum,
 					regnum, mask, set);
 }
 
+static inline void mmd_phy_indirect(struct mii_bus *bus, int phy_addr, int devad,
+				    u16 regnum)
+{
+	/* Write the desired MMD Devad */
+	__mdiobus_write(bus, phy_addr, MII_MMD_CTRL, devad);
+
+	/* Write the desired MMD register address */
+	__mdiobus_write(bus, phy_addr, MII_MMD_DATA, regnum);
+
+	/* Select the Function : DATA with no post increment */
+	__mdiobus_write(bus, phy_addr, MII_MMD_CTRL,
+			devad | MII_MMD_CTRL_NOINCR);
+}
+
 /*
  * phy_read_mmd - Convenience function for reading a register
  * from an MMD on a given PHY.
-- 
2.40.1


