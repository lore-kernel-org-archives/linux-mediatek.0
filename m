Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B995C61DF4
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Nov 2023 00:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcMwiWHz9qYe+Y9Zq1AR8weNzBMQy4Mg6NfLIwNy3q4=; b=lrp38PeXfb2RNkwzIZpzyIFleg
	VGbGIzjCji6a+9VlVRCozTRkIbC9lA5xSwv86XmnQI73DHYS62PFhYH81zZF58iLig6ZJbkEkJxMh
	ix9sOLYkEWnkFBwO5zQBs+Sel+1nzCMTbHMrmTKVmmyA4TsaUllB2BHqzh0dxJgGYNiQ3P95pa9Ad
	fvDLqRPr40HzKPZl8TaOHyxhlq5dQTukGldp5z7YbklfCG9hkbd/snCAwFS3V/KMrv47gtD8KBBX8
	WF32jPpeWiZGMlIUcET1XV+YVUnJ3vqX7/R3VDRw7ksL+UVu4FSA6eRAQTMOKcEDVAA6otLTY/nKS
	6G70tGkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6geV-008FdN-0F;
	Sat, 25 Nov 2023 00:36:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6gdu-008FBn-0s;
	Sat, 25 Nov 2023 00:35:31 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4079ed65471so18196595e9.1;
        Fri, 24 Nov 2023 16:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700872526; x=1701477326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcMwiWHz9qYe+Y9Zq1AR8weNzBMQy4Mg6NfLIwNy3q4=;
        b=Ahg605kYO6W8pDAIxf3UCiQYMrJx4IUEGIgzc8KqH0pPekfFInOrx8qXsTQX3+f+6o
         2jvxmH3wXURLaQi/yP/KI7sfoO7XmO+8R3PrycI/EveCLWRIli39FQt/dWhFVzoaiIrR
         pS5uJgC5qzTHX7En03isBGqPspE592rM0BG5GgNfBdn4D4W2kQ6EAiKrL1C9vyXiZhFz
         nTtwDoLXmd55gxz9AAzePAIWcLiKzgk05uCiswAatP5WP38vXQ9It4yoMd/1ubKGXzTe
         cvFYXSojQZP0h9SrTYNr+swYfqO02lOW1aVtwVQ3L97W0e9wUaZ16YVuD5jNnkLWk0LT
         U0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700872526; x=1701477326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vcMwiWHz9qYe+Y9Zq1AR8weNzBMQy4Mg6NfLIwNy3q4=;
        b=PSArwD7k4+2Q1+xGgdJxMQI7ImWDRWbGB1MlIVHWC1MdayRRsB/meX9DDMAYiH0Zl6
         AsFHZsK7DJKJfeSNI7nDQa5XMcAMD1PqmHnVoOZRKM9ObyarFEonR1kaTdS1R78uBib5
         zpzoP3VKKUtgXLnfkEb5d7fdNR+vk9jbboU9VjnrZVmvmVkaRZdotu7sC4CoapWu7XVt
         y0NFyPViX9zum3UkRD4u5BeJDbFXfCstVRnKxOQ9OzndlaGLzbC89ppVa8xppmz4avXg
         KciAfmGchuI0UPOHH6R0/PMPwc3aPCDjKMxh2ksB6hmb9maSYR06a2iPmJ7kQBDQHYOR
         TiPg==
X-Gm-Message-State: AOJu0YygnAGqJYNZhlNkjX9l3hSqz76fNbu2f0NxyRnFyNEcOg4EH3cG
	p6ihovvlNa+IgtaIt3KhNlw=
X-Google-Smtp-Source: AGHT+IFXmHhNEQUs3v0Z74fnQ+w5I7liDT133TiEHE1H6er7Lzi3dwTa6E8rghUZEgwLREoIIGNEZw==
X-Received: by 2002:a05:600c:314c:b0:405:95ae:4a94 with SMTP id h12-20020a05600c314c00b0040595ae4a94mr3259912wmo.5.1700872526488;
        Fri, 24 Nov 2023 16:35:26 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u13-20020a05600c00cd00b00405718cbeadsm4268005wmm.1.2023.11.24.16.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 16:35:26 -0800 (PST)
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
	Vladimir Oltean <olteanv@gmail.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Harini Katakam <harini.katakam@amd.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next RFC PATCH v2 06/11] net: phy: move mmd_phy_indirect to generic header
Date: Sat, 25 Nov 2023 01:11:22 +0100
Message-Id: <20231125001127.5674-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_163530_307153_2D61D2E9 
X-CRM114-Status: GOOD (  13.21  )
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
index 677b5bceac45..0f3b21c90583 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1356,6 +1356,20 @@ static inline int __phy_modify_changed(struct phy_device *phydev, u32 regnum,
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


