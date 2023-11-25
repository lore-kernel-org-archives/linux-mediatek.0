Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF09C636D0
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Nov 2023 00:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AwvqFzZJu6lRLjlg2HSWxHNqqoUH9PNhraV2LjOZjE=; b=C9+zrEVa5wlGtnb5aiEq9tmnCX
	0HTIRGLMyaB8kkPLju32JbmzoOKc1xe9jiBD9NEyMuWxZHJvOEON1LZu7zDVB0iM55AAakfxbkYUv
	wkL46XUnjl45devyyh0Qj0749ERRhfXQShKKD84pcNYi3fw0AJCDv5UmiiyhoL4azADFR7W7QlguG
	nIlYcRb9z2W8+AWlwn4q4+UiGBTW7QhvuiYVeDVwvXKXDJU4v20uWAD5R0/eDEgwXdAb8DYfVgnR9
	6/IFgFknAiW6/5Y/3HAZZNfgcYKa2Ofh+lvN9jo1KFbnTr2KvS33em/4icyqflFz/j0onIoUiW1D7
	hCFLRmlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6geA-008FO9-2s;
	Sat, 25 Nov 2023 00:35:46 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6gdr-008FBT-0p;
	Sat, 25 Nov 2023 00:35:28 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32deb2809daso1564360f8f.3;
        Fri, 24 Nov 2023 16:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700872525; x=1701477325; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AwvqFzZJu6lRLjlg2HSWxHNqqoUH9PNhraV2LjOZjE=;
        b=LFEg/u3oKoV7BZBgJ+tIo0kJye4WOqPxoCnJlfCxlMEqcf1ZvlmrBAcBQO1KkIZbn0
         FFnldjXgMDe6SCa+IoalrSD4J7/xnjIF0odlMbI5YR553HYl4+KlEWfi7MGELIma9adO
         Kx7Wxw9ZwXfcOEVUUvVMwo2CoMtqfD7b2v8l2TUurLy6TZJa4hwLnEGL56QtEn/YpHUZ
         C31hpMvw2pU2O808VuNklDOttzRq4xstAH8A28Py2dIYXdII7z6FUtVB/Bm4PEOcowc0
         MqbRnA57TDgPehfR8uSd3Z3FGoqNE1xFgb0ifmP5rLpYTjucm/rj/CRhzh42mZCzCtAX
         V9vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700872525; x=1701477325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1AwvqFzZJu6lRLjlg2HSWxHNqqoUH9PNhraV2LjOZjE=;
        b=eoLSmbfZHCUq+ESN2d9koqa/1qoBL8jQf07PTN+4ofAQ30GOY+bHReuoGpXHlb6tW9
         pVlkmizz/E6YjBsj1TpuVQei62FUmdV6RMWHrBDm7QhrcDCVQ9iAZdY8Lf9AMg7+e3MM
         o9+Aeg5/ctZ2H7jvbIKR/an28WwZgnuC4EK5H0QNSVqPH0TEB3JQR3Oa/AdJqeFtRYEY
         3K5vcMOViBeZHVQKOnPqBasiI/qVhonGMJ/zEgJRwT7V1mVAcBXgdqRHlnBAkyzjQhSR
         QrofsYkB2FUypgCp7VlIc70T4D179JjczHIQghObofgudv9jV5PA8jfMapEAdlteeZnS
         m6YQ==
X-Gm-Message-State: AOJu0YyW5QKzIjkITOJ12PyM5EB8HbTVdGyZGysBQLZBisO5tsn9Pg87
	3gq4+xr9QUuup5UKjgstiUo=
X-Google-Smtp-Source: AGHT+IFhMHZ210TeORBHK1rDSRJCNFUs5mH89ZCrVUsQ18913rgA5ad1O9jEGVX3aTh0gMhWj4aTdw==
X-Received: by 2002:adf:e911:0:b0:32d:8bf9:1990 with SMTP id f17-20020adfe911000000b0032d8bf91990mr4003007wrm.37.1700872524729;
        Fri, 24 Nov 2023 16:35:24 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u13-20020a05600c00cd00b00405718cbeadsm4268005wmm.1.2023.11.24.16.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 16:35:24 -0800 (PST)
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
Subject: [net-next RFC PATCH v2 05/11] net: phy: add support for driver specific PHY package probe/config
Date: Sat, 25 Nov 2023 01:11:21 +0100
Message-Id: <20231125001127.5674-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_163527_294413_5473DDB6 
X-CRM114-Status: GOOD (  18.68  )
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

Add PHY driver specific function to probe and configure PHY package.
These function are run only once before the PHY probe and config_init.

They are used in conjunction with DT PHY package define for basic PHY
package implementation to setup and probe PHY package with simple
functions directly defined in the PHY driver struct.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phy_device.c | 14 ++++++++++++++
 include/linux/phy.h          | 21 +++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 454dc8256e94..d7cfeb1011c1 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1246,6 +1246,13 @@ int phy_init_hw(struct phy_device *phydev)
 	if (ret < 0)
 		return ret;
 
+	if (phydev->drv->phy_package_config_init_once &&
+	    phy_package_init_once(phydev)) {
+		ret = phydev->drv->phy_package_config_init_once(phydev);
+		if (ret < 0)
+			return ret;
+	}
+
 	if (phydev->drv->config_init) {
 		ret = phydev->drv->config_init(phydev);
 		if (ret < 0)
@@ -3370,6 +3377,13 @@ static int phy_probe(struct device *dev)
 	/* Deassert the reset signal */
 	phy_device_reset(phydev, 0);
 
+	if (phydev->drv->phy_package_probe_once &&
+	    phy_package_probe_once(phydev)) {
+		err = phydev->drv->phy_package_probe_once(phydev);
+		if (err)
+			goto out;
+	}
+
 	if (phydev->drv->probe) {
 		err = phydev->drv->probe(phydev);
 		if (err)
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 4ddf08e89624..677b5bceac45 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -923,12 +923,33 @@ struct phy_driver {
 	 */
 	int (*soft_reset)(struct phy_device *phydev);
 
+	/**
+	 * @phy_package_config_init_once: Driver specific PHY package
+	 *   config init call
+	 * @def: PHY device to use to probe PHY package
+	 *
+	 * Called to initialize the PHY package, including after
+	 * a reset.
+	 * Called BEFORE PHY config_init.
+	 */
+	int (*phy_package_config_init_once)(struct phy_device *dev);
+
 	/**
 	 * @config_init: Called to initialize the PHY,
 	 * including after a reset
 	 */
 	int (*config_init)(struct phy_device *phydev);
 
+	/**
+	 * @phy_package_probe_once: Driver specific PHY package probe
+	 * @def: PHY device to use to probe PHY package
+	 *
+	 * Called during discovery once per PHY package. Used to set
+	 * up device-specific PHY package structures, if any.
+	 * Called BEFORE PHY probe.
+	 */
+	int (*phy_package_probe_once)(struct phy_device *dev);
+
 	/**
 	 * @probe: Called during discovery.  Used to set
 	 * up device-specific structures, if any
-- 
2.40.1


