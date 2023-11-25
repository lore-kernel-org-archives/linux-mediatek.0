Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95B3C61D97
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Nov 2023 00:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7OVOcGHUcPnU+8BUU2tjf4Y7gvtOJAy7pXlV7RvF1I=; b=rYufdekhUidEV1lLtxUOcrAQzw
	zeh2P+jNLoqXxMK2ttTWVGD8DNrVLMB1t93iP/0EKnXnxPON228PdHsK7pVZeeSfQoHYrvHtZbLBK
	jXVmrAB38TCzDD/5lCh1fZtADTc/txOPKcae0JTwL4AsthjmX++Li+DYA1Bx/z3fnae4GV1NnQOfe
	rmFZHD7ytsEMQgvZPR0otZUT1T89dHCAaAxCaMrhz54wi7aAmAm9dSYiAd+6ZD21bA8D2M323n4j5
	+cDIWtuqJSvHaExHUkmCAi6qIW3SIFgbIR4ekYzLYkqLYpIWPmr9yvI3+y8d/ZWyyIunLy6vT6/fi
	82KVPC8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6gej-008FoP-1V;
	Sat, 25 Nov 2023 00:36:21 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6gdv-008FCj-2c;
	Sat, 25 Nov 2023 00:35:33 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-40b2ddab817so17151215e9.3;
        Fri, 24 Nov 2023 16:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700872528; x=1701477328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7OVOcGHUcPnU+8BUU2tjf4Y7gvtOJAy7pXlV7RvF1I=;
        b=PGUHzFOa30Hlt6KcMUg00UcL61yJ3ausx+DLdsQA7JXOkPIAsOcu1vIyDmVQo82yBO
         vuWKRa4SvWY2/j4jpkXdCe8bnGsr6iut+bEOwv8pu5gBj0Fks3Qk1DPFIeO4BkShBgIt
         wajqQ1sZHFKdRqbxI0J5ntCsAvRpv1//4jtavSE3mx6UqksK7l4CY92VaheFOMOGctUB
         bfZg5jVo4yuBcpmd6mZDAeEUci0hvenFkgUKFZkSRj9m01k6ceTjHBwaljWUJttpDJYb
         LwCjnNStxZT4GEXLyWQa2WZDRsSFLHHe48qf1CPUyfzT++0RXVwUndpxyy/WGKJPC0DJ
         HASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700872528; x=1701477328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s7OVOcGHUcPnU+8BUU2tjf4Y7gvtOJAy7pXlV7RvF1I=;
        b=gBpZXmFRb8U7jk1+EOfLUEl1fqZbW5S8/L520i5TQrxZOY5kebhj8vGBk02amkzOl7
         3PnjgZUIOiCMCrMWZsBkPE9G+UVRn/3VRiZrAuEbjb8EUtnU/bm2P2Ts2cCk3G9QaT10
         GXGQmmcBp5TiDYPtsKjuI7JBMhGecYl2+VU9nYNnGwo2Bsik7nVrDOFDUp+I5m35G6Jc
         hkFRnb9PtIKW5GZZ1cj0RdnhK+pJv8RU3FvHgV1pCfNY7WaZfonnVdVgwkOmEQFDjrfJ
         D0kPzxWOxmDmBQJyY0Zdo5YQGV6GVx2E0TJA8R8/k49Y2kWx9oCDv137hQy/6Xn7xYpT
         w3Rw==
X-Gm-Message-State: AOJu0Yx6RIBhrp07ec9pGBNueJxdK3CCh/RlwsXpPZ9lDvXYeJOo7aHH
	DZrWZdxdvP72Ri2p9ccaMfo=
X-Google-Smtp-Source: AGHT+IGcE1dOF2/4XmII3D8k9pAOirkX3JthCM23UGSAVeigejq1ME7yX5mhXBajq2F60t3CrBZvGg==
X-Received: by 2002:a05:600c:3b16:b0:3fe:ba7:f200 with SMTP id m22-20020a05600c3b1600b003fe0ba7f200mr3564351wms.20.1700872527977;
        Fri, 24 Nov 2023 16:35:27 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u13-20020a05600c00cd00b00405718cbeadsm4268005wmm.1.2023.11.24.16.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 16:35:27 -0800 (PST)
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
Subject: [net-next RFC PATCH v2 07/11] net: phy: add support for PHY package MMD read/write
Date: Sat, 25 Nov 2023 01:11:23 +0100
Message-Id: <20231125001127.5674-8-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_163531_861035_3DBD5DFE 
X-CRM114-Status: GOOD (  12.63  )
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

Some PHY in PHY package may require to read/write MMD regs to correctly
configure the PHY package.

Add support for these additional required function in both lock and no
lock variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/linux/phy.h | 72 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 0f3b21c90583..4c5856d9865d 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2104,6 +2104,78 @@ static inline int __phy_package_write(struct phy_device *phydev,
 	return __mdiobus_write(phydev->mdio.bus, addr, regnum, val);
 }
 
+static inline int phy_package_read_mmd(struct phy_device *phydev,
+				       int global_phy_index, int devad, u32 regnum)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	struct mii_bus *bus = phydev->mdio.bus;
+	int addr, val;
+
+	if (!shared || global_phy_index > shared->addrs_num - 1)
+		return -EIO;
+
+	addr = shared->addrs[global_phy_index];
+
+	phy_lock_mdio_bus(phydev);
+	mmd_phy_indirect(bus, addr, devad, regnum);
+	val = __mdiobus_read(bus, addr, MII_MMD_DATA);
+	phy_unlock_mdio_bus(phydev);
+
+	return val;
+}
+
+static inline int __phy_package_read_mmd(struct phy_device *phydev,
+					 int global_phy_index, int devad, u32 regnum)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	struct mii_bus *bus = phydev->mdio.bus;
+	int addr;
+
+	if (!shared || global_phy_index > shared->addrs_num - 1)
+		return -EIO;
+
+	addr = shared->addrs[global_phy_index];
+	mmd_phy_indirect(bus, addr, devad, regnum);
+	return __mdiobus_read(bus, addr, MII_MMD_DATA);
+}
+
+static inline int phy_package_write_mmd(struct phy_device *phydev,
+					int global_phy_index, int devad,
+					u32 regnum, u16 val)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	struct mii_bus *bus = phydev->mdio.bus;
+	int addr, ret;
+
+	if (!shared || global_phy_index > shared->addrs_num - 1)
+		return -EIO;
+
+	addr = shared->addrs[global_phy_index];
+
+	phy_lock_mdio_bus(phydev);
+	mmd_phy_indirect(bus, addr, devad, regnum);
+	ret = __mdiobus_write(bus, addr, MII_MMD_DATA, val);
+	phy_unlock_mdio_bus(phydev);
+
+	return ret;
+}
+
+static inline int __phy_package_write_mmd(struct phy_device *phydev,
+					  int global_phy_index, int devad,
+					  u32 regnum, u16 val)
+{
+	struct phy_package_shared *shared = phydev->shared;
+	struct mii_bus *bus = phydev->mdio.bus;
+	int addr;
+
+	if (!shared || global_phy_index > shared->addrs_num - 1)
+		return -EIO;
+
+	addr = shared->addrs[global_phy_index];
+	mmd_phy_indirect(bus, addr, devad, regnum);
+	return __mdiobus_write(bus, addr, MII_MMD_DATA, val);
+}
+
 static inline bool __phy_package_set_once(struct phy_device *phydev,
 					  unsigned int b)
 {
-- 
2.40.1


