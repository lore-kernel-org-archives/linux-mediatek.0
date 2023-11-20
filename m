Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0499BC5AE5E
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7KlciZ6HGUzRiM58ultDgzciNJogKhU8Km072RfwAf4=; b=YerGNlF/VUWYPfDFTEdC136tkK
	VkXoxqcuWrazV6r96D60X16SA+IfsMd07NkBms/kuJvys7rDFz8jpDbpQX+VmyBAf2Qst43TBKyQk
	0SGZE6s3Hk44JR2WtgmtxQtQF+2kh+NW514Ft6I7tolI3iNcryZOAeQavWx/WsUCiZgFpBA+zy8zu
	ADZZOverZ/Yw4UEzr0AMyZWguUFNOx/d7fOAbSYxysNO8hNOTcmia+V6NVtZgjE7f6++gYzVuv6Xw
	/Q7+BouWVLHIxqPSlk10zoZdafVUsrPubHeCNm97guu6HsVsysHbd9U0+H5KfL+gLNKGpHk3Acl4J
	GdaqunLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r55lU-00CRui-2t;
	Mon, 20 Nov 2023 15:00:44 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54gT-00CBlF-2g;
	Mon, 20 Nov 2023 13:52:15 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40838915cecso16120265e9.2;
        Mon, 20 Nov 2023 05:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488288; x=1701093088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7KlciZ6HGUzRiM58ultDgzciNJogKhU8Km072RfwAf4=;
        b=A1lCF1fvgs+xb6DPgLWbvfJqVpweOs7dNbug/+1E2dPDJvtQnXcktHHEBleGSjKx+n
         hp8WS3h8EZCQg54D7jLe+FijGlkkPje51Y5fa099vGOvuAve+F3U6DHrlxuP7Wj0wQcK
         m4Iz+TAjdZGHQ8bn6/PudTt4HDBI7tSz56Jyby7ebBzU7lKcFxm0NfvHBDKcbHj6v4tG
         8ET1BT+8cZ5/6TqNCHVnX3cYBy9+l05mwvnuvv9UG+P3oab3BAOjNKHoNGN/X0k0GANA
         e91J02/yAqzuayD+E2iJ6dOhhVFYBFsVEwVJG4YP6+se9K5Bkmgp9oDbpPK1phv7doSf
         Tgzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488288; x=1701093088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KlciZ6HGUzRiM58ultDgzciNJogKhU8Km072RfwAf4=;
        b=fYakkOKuYHRrdxVTSJ2lQWTIFLT6XLiO4r9Bu+vbIjgK3aikbO+qGZQ+MisQ9xOrwz
         KhMBkKZuJ+RtTFpwIP5Jy6X48eR7shFNdw1NBckwcbSmQm9aEuTbsBx5buYkvvEMip2z
         VUrwkka539xReibnE1f+ibVfa1BZWSMorKYW4vHy0pNzGzM02keDUKggFDppMFT0szMA
         VyyVHSXN81oWzYRLvXBv080JZvAYJbWSxtbNmccPQycu5iGxErFIAHQPLh3TUFy5eGTb
         IHS/MuReoU8SgGsRRqXGYngxAJu2YgeEJ75ugo/NEfhqb9aMcQ6CtGKsglPIH80/SOfn
         Ormg==
X-Gm-Message-State: AOJu0YwNEGvzKXpVjkuvhC0ptwQwyoljU9BrGN4igadVZgfaNIlthGFS
	YbXZlUVjIIru4CE3LUwGRHg=
X-Google-Smtp-Source: AGHT+IEgMWdVSmBqk/Db3v8YVKpL/4mMmUM+K0FYzCeo2AsDXwgh5SY0EbCSMcmSejPYpR8JOj4Fqg==
X-Received: by 2002:a05:600c:3113:b0:408:e441:1697 with SMTP id g19-20020a05600c311300b00408e4411697mr5904786wmo.39.1700488288141;
        Mon, 20 Nov 2023 05:51:28 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:27 -0800 (PST)
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
Subject: [net-next RFC PATCH 10/14] net: phy: add support for PHY package MMD read/write
Date: Mon, 20 Nov 2023 14:50:37 +0100
Message-Id: <20231120135041.15259-11-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120135041.15259-1-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_055129_971538_0390F32E 
X-CRM114-Status: GOOD (  12.85  )
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
index dd2381652dd1..90bfaa36689f 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2110,6 +2110,78 @@ static inline int __phy_package_write(struct phy_device *phydev,
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


