Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DFA0C197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 15:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TooJwdKX/NbwarJe/arvXU+/yWQ/ijJnXp3t5io/O14=; b=z1oaYjm8T72xn6RdYPsmAz5py7
	zthhDh75lK9QzaI44wT+5/58ONmvEwxyaD7m4VU85utT47SznHiWoNeIHEe/6xBrkbPpPGGAYbCca
	YVDBX40XupKN6pgfdB+I0xDDQJ4qp+lkuKn0ORC4yO6hyINmoVf5JuJ91DKa52oaqizZkBSSkYe49
	IBrpsi8c98adDxmH1LRciduKU6LQ/7olbCOhqAPBReU7IAK0QEqEeJD3uj4rljMue107XbnQ/kepT
	YOsyQakGyd/Q12SP/8sNY0dOw9CuyI8oIx8jX34iuSGKnZN+hslG6BW+agu2ESwIhXmAgFOv+LfMt
	YkzebQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r55lO-00CRpF-3B;
	Mon, 20 Nov 2023 15:00:38 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54gM-00CBfn-1O;
	Mon, 20 Nov 2023 13:51:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-40806e4106dso10789525e9.1;
        Mon, 20 Nov 2023 05:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488280; x=1701093080; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TooJwdKX/NbwarJe/arvXU+/yWQ/ijJnXp3t5io/O14=;
        b=BqHIgvS+bE4plCI3W7VzduptWKnRENxaVkOO+aY2mLes1/k/xgd5pVaRHoOlE6zNYm
         9+R1k7QaSRK2USoQed7tOp/od1MPg602/e+F7zykaAlJjcgdkvS95/a22XEkmdJcRD0f
         pF5P//QE3fE6AqZAP5l1DArnp4yosEVgxTNDbsR6fOxIwjrdAfHk/FgVBE0bOp+oaNLa
         exCSwp5rSVFjmm4PTjSgerE8LwTYY++0FgUnzIrnHU9Z0qeQB7Z53QUN7H5GQD4V+AAS
         9ipUU7SCcWEJviX6SLcKYJSuNzBSR5ScTAekkLHxnjuN/2RIjkBVVkSIpTIT3kwhDKnw
         788g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488280; x=1701093080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TooJwdKX/NbwarJe/arvXU+/yWQ/ijJnXp3t5io/O14=;
        b=XcM3kMClDF+F8rqZXN6PiTEEll885TR90tmlnXajhlf5ogXq444ADEJWxZkw+C+BjO
         u/BvYQ1bL0ThUOwzQLKhGcwhZeLrOInrU2jem6/Taueo7n8zPdRza4EgzZQvtlSoaOeD
         pXJpiSbhXw+rw584gGpF7RlWaLkz5n5kJBIOX2TUYD/UKu/wY/JY4uErBj/WYD1bJxc0
         Yx8sHQo+ChX8PwJK6YFKYgZ6Z4EwjfVYeTFdvn6PAFNwZAXfg9qc/Wzla5PDwxiWfGBq
         +Qapz/fMhxCqEndCMQMZJF8eWD+hgusXPa0HYLzsA/3dijPddqCKRwQQFQbc3f9DRrHs
         kzIw==
X-Gm-Message-State: AOJu0YzrNbwbdvzIo2nJV/FQE3Z9jpzo81aZplBn1U9z1BKAb/EO8e63
	/ZQBzhFpOHm5h8KhOAjYD68=
X-Google-Smtp-Source: AGHT+IGbR/jLe62wvESEe8CFVjFJBQOHE36zG4blKfXpV72kg2YCPBmafC4MW5hggXNjObGvZiPqSQ==
X-Received: by 2002:a05:600c:1c22:b0:40a:4c6c:c87a with SMTP id j34-20020a05600c1c2200b0040a4c6cc87amr6787606wms.3.1700488279771;
        Mon, 20 Nov 2023 05:51:19 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:19 -0800 (PST)
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
Subject: [net-next RFC PATCH 05/14] net: phy: add support for named global PHY in DT PHY package
Date: Mon, 20 Nov 2023 14:50:32 +0100
Message-Id: <20231120135041.15259-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120135041.15259-1-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_055122_741385_567F85FE 
X-CRM114-Status: GOOD (  19.38  )
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

Add support for named global PHY in DT PHY package definition.
A phy-package node can provide the property "global-phy-names" to
provide named global PHY to correctly reference the phandle defined in
the global-phys list.

Each PHY driver has to define the .phy_package_global_phy_names list
to verify correct order of named PHY phandle defined in DT with the
expected order in the PHY driver.

If the list is not defined or "global-phy-names" is not defined in
DT, global phy addresses are insered in order defined in the "global-phys"
property.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/phy_device.c | 13 +++++++++++++
 include/linux/phy.h          |  6 +++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 9ff76d84dca0..452fd69e8924 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3198,6 +3198,7 @@ static int of_phy_package(struct phy_device *phydev)
 	struct device_node *node = phydev->mdio.dev.of_node;
 	struct of_phandle_args phy_phandle;
 	struct device_node *package_node;
+	const char *global_phy_name;
 	int i, global_phys_num, ret;
 	int *global_phy_addrs;
 
@@ -3236,6 +3237,18 @@ static int of_phy_package(struct phy_device *phydev)
 		if (ret)
 			goto exit;
 
+		ret = of_property_read_string_index(package_node, "global-phy-names",
+						    i, &global_phy_name);
+		if (!ret && phydev->drv->phy_package_global_phy_names) {
+			const char *name;
+
+			name = phydev->drv->phy_package_global_phy_names[i];
+			if (strcmp(global_phy_name, name)) {
+				ret = -EINVAL;
+				goto exit;
+			}
+		}
+
 		global_phy_addrs[i] = addr;
 	}
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 5bf90c49e5bd..5e595a0a43b6 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -892,6 +892,10 @@ struct phy_led {
  * @driver_data: Static driver data
  * @phy_package_global_phy_num: Num of the required global phy
  *   for PHY package global configuration.
+ * @phy_package_global_phy_names: List of global PHY names used
+ *   for PHY package global init. If defined, list is compared
+ *   with DT values to match correct PHY phandle order. List
+ *   last element MUST BE an empty string.
  *
  * All functions are optional. If config_aneg or read_status
  * are not implemented, the phy core uses the genphy versions.
@@ -910,6 +914,7 @@ struct phy_driver {
 	u32 flags;
 	const void *driver_data;
 	unsigned int phy_package_global_phy_num;
+	const char * const *phy_package_global_phy_names;
 
 	/**
 	 * @soft_reset: Called to issue a PHY software reset
@@ -1154,7 +1159,6 @@ struct phy_driver {
 	 */
 	int (*led_hw_control_get)(struct phy_device *dev, u8 index,
 				  unsigned long *rules);
-
 };
 #define to_phy_driver(d) container_of(to_mdio_common_driver(d),		\
 				      struct phy_driver, mdiodrv)
-- 
2.40.1


