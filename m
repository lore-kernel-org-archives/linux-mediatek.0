Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7156DC0755A
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Nov 2023 01:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6/qmHve1L25MiRLoatLwS+Zmpj0CqjsbvwNeXg845w=; b=qXbl7BrMQJ9f5nnpibkES5YuIB
	D8iZPZsNsPkNgB6GEVEg3kVXqFUnGHS4UWalRjslqSMS8QM0kx4eHlX4Jqcc1Nkiv0sA1u/Ve23pP
	fWS6x1nDZwgOJ72YWJxmdY5isW1L8hNiNtA2GXoSimbrQmtCIiQmoz8TSYe4X6zeu0oUE8Suc7kZb
	1vYCWyJGfHtwnUHuTU1BcZoO9oUZ4Tm56JdXzekYVeVxPB1GyvMBwyWSBnhTuxAMegIW47WeqvIWN
	6q/ZEeB9F4cExPaMHG3dE+iUQ36p2VPuTzdl/cQiGiCevklB9MI00S6bjTiyHk1Idexly9AgLK1BX
	EHSR6CdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r74La-00A4h1-0y;
	Sun, 26 Nov 2023 01:54:10 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r74LO-00A4ZZ-2H;
	Sun, 26 Nov 2023 01:54:00 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40b2ddab817so22068605e9.3;
        Sat, 25 Nov 2023 17:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700963637; x=1701568437; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T6/qmHve1L25MiRLoatLwS+Zmpj0CqjsbvwNeXg845w=;
        b=JuP/FYtP5dsvYUoDc5Fb1hWj3mY1Xv3hhfEVAIKFXs7F5d5ubLYzP4B/Z7y+MEkgwg
         e8/VJYUdzgVMndDoPAnBmdnm/QjUE6vpO56XG4U0EmPQZlG9Gzux75SLhdUTsSAVCDV9
         4B3NBzUD0ctVLdEidrNJVf9xZuN4xurN33x3GPoiw2aM5EMhh4lgcfr7AkY0299sFFC3
         q/5WEcT4m5XJ929lkkn9sHDEs+WIKerCR6wTjMLsKtPJREGLhjLGUHLoh0m3fXB9yOV2
         96VugDi0dmg/CF868p1kHai8q8yprQ5r45YkK/dozc48qRlZD23HmLQb5eWrygAy6d+k
         YWww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700963637; x=1701568437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6/qmHve1L25MiRLoatLwS+Zmpj0CqjsbvwNeXg845w=;
        b=PfgwYDDqCARUHfb5V9+i1xZCqnxlrNI6FxitnsGf8X/nJTKJpIRA9eqN7TQMsk/zUt
         i0O/CzLVHpJbThT/w/dFjHmFqP3JNQ9buDWWL5LLsb50A7SpyOD4gQ/60qEIPeOtCEM1
         HC4kEl8964HOFmSBwYYy1tse90CUy3XOhlJYp88xCC+zBWi0jftl1twSCrdpdGQ+Pg4N
         Jt43ridmiUDTLOe+RaTn8h8DXyJxpbTXR4hko8bXc6uqddl1qNQqJzOXY1zeRS3A5hVM
         ZLfLMKKCfYjtJrO1QK9NqoCwGjtSChhPdlTvlQ3u0o3SE4+/He4aPLHFgIlr+oF5alR1
         OOxQ==
X-Gm-Message-State: AOJu0YwBWPifOIWRIgSvGWUIn4XB61BysEI2tGR0ZdwAgWXCDX9FZbHe
	upJby9g0bBZsf3qVjoQLOHI=
X-Google-Smtp-Source: AGHT+IGFPIhYuPbdoh4RQpznTFaMlEGRX1LxY1xuT3XNZe5QH9o+8Q9NhKq9xrZp6+5zj8BaO1AVEA==
X-Received: by 2002:a05:600c:3306:b0:40b:36d3:ce0a with SMTP id q6-20020a05600c330600b0040b36d3ce0amr1961117wmp.16.1700963636826;
        Sat, 25 Nov 2023 17:53:56 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id p34-20020a05600c1da200b00406408dc788sm9875344wms.44.2023.11.25.17.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 17:53:56 -0800 (PST)
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
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH RFC v3 3/8] net: phy: add support for shared priv data size for PHY package in DT
Date: Sun, 26 Nov 2023 02:53:41 +0100
Message-Id: <20231126015346.25208-4-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126015346.25208-1-ansuelsmth@gmail.com>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_175358_746492_0A75206D 
X-CRM114-Status: GOOD (  16.99  )
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
index f416f7434697..87f06b4ecbfe 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3178,6 +3178,7 @@ static int of_phy_package(struct phy_device *phydev)
 {
 	struct device_node *node = phydev->mdio.dev.of_node;
 	struct device_node *package_node;
+	int shared_priv_data_size;
 	u32 base_addr;
 	int ret;
 
@@ -3194,8 +3195,12 @@ static int of_phy_package(struct phy_device *phydev)
 	if (of_property_read_u32(package_node, "reg", &base_addr))
 		return -EINVAL;
 
+	shared_priv_data_size = 0;
+	if (phydev->drv->phy_package_priv_data_size)
+		shared_priv_data_size = phydev->drv->phy_package_priv_data_size;
+
 	ret = devm_phy_package_join(&phydev->mdio.dev, phydev,
-				    base_addr, 0);
+				    base_addr, shared_priv_data_size);
 	if (ret)
 		return ret;
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 80a4adaeb817..c4e6d0b3a86c 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -884,6 +884,8 @@ struct phy_led {
  * @flags: A bitfield defining certain other features this PHY
  *   supports (like interrupts)
  * @driver_data: Static driver data
+ * @phy_package_priv_data_size: Size of the priv data to alloc
+ *   for shared struct of PHY package.
  *
  * All functions are optional. If config_aneg or read_status
  * are not implemented, the phy core uses the genphy versions.
@@ -901,6 +903,7 @@ struct phy_driver {
 	const unsigned long * const features;
 	u32 flags;
 	const void *driver_data;
+	unsigned int phy_package_priv_data_size;
 
 	/**
 	 * @soft_reset: Called to issue a PHY software reset
-- 
2.40.1


