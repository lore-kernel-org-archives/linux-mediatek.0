Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C81C61DF4
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Nov 2023 00:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dIxvgOZ7CQB51UQDLaqUtiZU2S4aMllQ5M3VTMe+bkw=; b=Tu4t5ssNqhgMNqwRz5Vk4jGOlF
	tlJ9fzHkhE+poi2RCBJNxY2F5kQDLFv4OPWTXAgsJLDFXRG0N6amNvyWc+ROAXtmfVfVEGraBmu+i
	6gzVy/umUggw2oq0m2PB9kXKhT/W1Th9oT8+ESUGPr7oZwPAuOxAtvE5CTW/AuYtHMkyQilpAz1WJ
	abpzqycAEmmIRf1ewToUjgT+niZBwzX9+ECgI9jODmIsI8BmIeVUsdRcmN545XjUQf04Ohybm/bJb
	OaChu9DUCSb2RKPddUKX5mDbyzwZsJhfmE8C6GMEKa7HLmnNFBKbq1gW41poGSSUz18Xe2ma5cJKu
	KAABXV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6ge3-008FJK-1B;
	Sat, 25 Nov 2023 00:35:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6gdo-008FBE-27;
	Sat, 25 Nov 2023 00:35:25 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40b27726369so17262835e9.0;
        Fri, 24 Nov 2023 16:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700872523; x=1701477323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIxvgOZ7CQB51UQDLaqUtiZU2S4aMllQ5M3VTMe+bkw=;
        b=ZfISH92F4QkecGpuWuI/K3F3S1IZnWjwOIjjy8wFcYWsBalMwtrRixDRpCB1NYXxsw
         UooN9PRC/ja4mmJfgD3XZQGyNqtAkQ8XUrZuL1LBCkQW8PFsPyzvZ8WsjBhfkt2g6asW
         JGf5I6VN6f9QRxjHoY7B2hqKDNlmGLjS28028hxfECI9/8ad2Wb3T81djLf5glSK/biz
         N1KUw0zxWrauXHgzGI8tapTdlzTWF++D/TmNG23aeK0kqdhVRkhBxQV+SeiNhPLWkGyT
         NlLAxFbw8/Fs6LT9NrIlYLkoaxbNQmWludqKSFhb5ITYkqgub+7Ekf3fgCf+XdQfi1dD
         1ZUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700872523; x=1701477323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dIxvgOZ7CQB51UQDLaqUtiZU2S4aMllQ5M3VTMe+bkw=;
        b=j1p/3TbmL3JYMms4VuZunl47R1hnj/TCHMknv14dR01kpdyIQaQ8JfSHawo03we99r
         GZtN193T3w5qpqYm/YK6LS+C5fG70Pxdwk7OgMMej4vNKtQoLsMw1RAifxwKYcDkSv4l
         FKn2BuRZdnwlWVqrP+jbdxch9TFPhy3EvjH2gbXtIdcX7LMmzYdVZCt6KDCpGeIj1HQ3
         HimQYHjkTpFBJW3ROEHxMbMfWm0lPoLYBGVqjlNeWjZMs+1clWU6C6mbyzu6yoYn1Sl4
         HqmpQOBese5B5zmoFOn0/isHJkdEU4kw++Nix2SLiWSi34VRPLZxUOudIveJ3U3AAy7v
         0aPQ==
X-Gm-Message-State: AOJu0Yyb7KJ2rKCJjTrJbln0hT4GlceMH4EviG3jYBTnnhvNM1VrrlHi
	Q5AupbUJO272UZ6zTTLCFVk=
X-Google-Smtp-Source: AGHT+IH/mvvyiDwu8lL8P1HQUIBWCAEL0g1NitUnqWOlQjTwYyV/wmLg6LqR3UnY3YBLKXEQ++UQuQ==
X-Received: by 2002:a05:600c:3ca0:b0:40a:48af:4820 with SMTP id bg32-20020a05600c3ca000b0040a48af4820mr4085044wmb.30.1700872523082;
        Fri, 24 Nov 2023 16:35:23 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u13-20020a05600c00cd00b00405718cbeadsm4268005wmm.1.2023.11.24.16.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 16:35:22 -0800 (PST)
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
Subject: [net-next RFC PATCH v2 04/11] net: phy: add support for shared priv data size for PHY package in DT
Date: Sat, 25 Nov 2023 01:11:20 +0100
Message-Id: <20231125001127.5674-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_163524_696773_8D80437E 
X-CRM114-Status: GOOD (  16.64  )
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

Add support for defining shared data size for PHY package defined in DT.

A PHY driver has to define the value .phy_package_priv_data_size to make
the generic OF PHY package function alloc priv data in the shared struct
for the PHY package.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phy_device.c | 7 ++++++-
 include/linux/phy.h          | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index f25bedb69b90..454dc8256e94 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3198,6 +3198,7 @@ static int of_phy_package(struct phy_device *phydev)
 	struct device_node *node = phydev->mdio.dev.of_node;
 	struct device_node *package_node;
 	const u8 *global_phys_offset;
+	int shared_priv_data_size;
 	int *global_phys_addr;
 	u8 global_phys_num;
 	u32 base_addr;
@@ -3236,8 +3237,12 @@ static int of_phy_package(struct phy_device *phydev)
 		global_phys_addr[i] = addr;
 	}
 
+	shared_priv_data_size = 0;
+	if (phydev->drv->phy_package_priv_data_size)
+		shared_priv_data_size = phydev->drv->phy_package_priv_data_size;
+
 	ret = devm_phy_package_join(&phydev->mdio.dev, phydev, global_phys_addr,
-				    global_phys_num, 0);
+				    global_phys_num, shared_priv_data_size);
 	if (ret)
 		goto exit;
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3f75ae85b740..4ddf08e89624 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -895,6 +895,8 @@ struct phy_led {
  *  global PHYs for PHY package global configuration.
  * @phy_package_global_phys_num: Num of the required global PHYs
  *   for PHY package global configuration.
+ * @phy_package_priv_data_size: Size of the priv data to alloc
+ *   for shared struct of PHY package.
  *
  * All functions are optional. If config_aneg or read_status
  * are not implemented, the phy core uses the genphy versions.
@@ -914,6 +916,7 @@ struct phy_driver {
 	const void *driver_data;
 	const u8 *phy_package_global_phys_offset;
 	const u8 phy_package_global_phys_num;
+	unsigned int phy_package_priv_data_size;
 
 	/**
 	 * @soft_reset: Called to issue a PHY software reset
-- 
2.40.1


