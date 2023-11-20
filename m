Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12308C54E76
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 13:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qB4fi/eCMZ5pGZWSsqUWAAl8tjVSzuSGp4YLf0Eq9M0=; b=JLvudJF+XQYLB3pP6/Qy0nPiIK
	3QkNGWG2RGgv7woQde+h2YeD2XkIh37qgfIpk/DrW3BRN5rFK+OBUs/1XCE1GUkkYCCRgyNwIu3QN
	V5ZrBN8shTTZtAH4GyD2FjlZ9oRE+nPMOTMNgAa8N0lujSuCAwY5g8acEx3wEm0eMgjPdZrOy1vSV
	PLLv0MUS8IQWb4TlJNyP0g/VRfsNluciqs6fMTmwRL9UeUjvMirMIn8ARObNwT1/vjJP+/0Tm/l3M
	xVBFftqU9smu3n2eXE+493s6W18l6AAwLzFobalG3KgLXgv/GUpWHA6n8BEBZffUwhBIxRJCfgXlZ
	nA19O5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r54ga-00CBpK-2S;
	Mon, 20 Nov 2023 13:51:36 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54gM-00CBga-2h;
	Mon, 20 Nov 2023 13:51:26 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4083cd3917eso16227205e9.3;
        Mon, 20 Nov 2023 05:51:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488281; x=1701093081; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qB4fi/eCMZ5pGZWSsqUWAAl8tjVSzuSGp4YLf0Eq9M0=;
        b=VGdTmz/ciryuoc9Wxe4urUzupXaloV6/4wU9HDw3hmWVQJY0W0ZUZw5YhuicD/9pJw
         bCsO1Bsj+m/SiGPeszCi33jGGfZx0ogoKVuNcL0fjxEzkco94UF2cbdQ5EGLO/4ubpAK
         ovYxJ9odaHYZH72RluLQUTxkzEbcFJxMx3ZmAXHyFKEPrt4H0oMGZHZRIc3a4qNybS/8
         goGrwzW5TUH5b9UWxqdkybHC8Tj7t30Q1nDzaVYyPNozSXhRvc8pwv2vHrH0z/z9Ei//
         KAFVJvRlTP/9tos3pvhpOLDD2pHPHFhGaMPiWqGPWc1f0Ipe8hWk9lVjMFKwHXP0vt4x
         Q7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488281; x=1701093081;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qB4fi/eCMZ5pGZWSsqUWAAl8tjVSzuSGp4YLf0Eq9M0=;
        b=AcLIByNp/JvTwVV6Pk/m79wuWirUD59k3m3bvVL6Jb+ZH4rhiZ47YxVX5rqDxLQ5bv
         LrAD1XlFfTV0LIziTXnMH/41RT+qDSQFCa3fCvm4u6G/5wTXahtrGqtp79Q4RHPTSCP3
         kZe7zPzMAvdMrATl4vr81jb6debMJeboynNcuwiAFGbMcx1JYEmea80KAm/vzRibjR8P
         Vb1qgVYlWdxI4RVg0Ni4v0PQpxwbWdLcioQ4XNAJlFvG80mzlEbPk63lNd+l4qAJfY9z
         DyiagIu5TOOatDZWxPsyQX2Pw68lRADSyC6RdaJGkDEd0KG8l9zNab2UrcFDh+nmr2cI
         cM5Q==
X-Gm-Message-State: AOJu0YzVJAEtNm4/GgDv9ovhwVNi6ElIjrOmqYF3X8yvg1J61Kdw9rab
	vseztyGPIi7JwzuIS0ps09A=
X-Google-Smtp-Source: AGHT+IFcMey6TnOXOu5MSlLdoD6XtZU3LWDsq7B13n3sOVMBzRaLsi3NtlxaruTsT9S5irAnnjq1Bg==
X-Received: by 2002:a05:600c:1914:b0:409:7d0:d20b with SMTP id j20-20020a05600c191400b0040907d0d20bmr5623787wmq.24.1700488281411;
        Mon, 20 Nov 2023 05:51:21 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:21 -0800 (PST)
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
Subject: [net-next RFC PATCH 06/14] net: phy: add support for shared priv data size for PHY package in DT
Date: Mon, 20 Nov 2023 14:50:33 +0100
Message-Id: <20231120135041.15259-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120135041.15259-1-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_055122_881504_1377521C 
X-CRM114-Status: GOOD (  17.56  )
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
index 452fd69e8924..91d17129b774 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -3200,6 +3200,7 @@ static int of_phy_package(struct phy_device *phydev)
 	struct device_node *package_node;
 	const char *global_phy_name;
 	int i, global_phys_num, ret;
+	int shared_priv_data_size;
 	int *global_phy_addrs;
 
 	if (!node)
@@ -3252,8 +3253,12 @@ static int of_phy_package(struct phy_device *phydev)
 		global_phy_addrs[i] = addr;
 	}
 
+	shared_priv_data_size = 0;
+	if (phydev->drv->phy_package_priv_data_size)
+		shared_priv_data_size = phydev->drv->phy_package_priv_data_size;
+
 	ret = devm_phy_package_join(&phydev->mdio.dev, phydev, global_phy_addrs,
-				    global_phys_num, 0);
+				    global_phys_num, shared_priv_data_size);
 	if (ret)
 		goto exit;
 
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 5e595a0a43b6..7c47c12cffa0 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -896,6 +896,8 @@ struct phy_led {
  *   for PHY package global init. If defined, list is compared
  *   with DT values to match correct PHY phandle order. List
  *   last element MUST BE an empty string.
+ * @phy_package_priv_data_size: Size of the priv data to alloc
+ *   for shared struct of PHY package.
  *
  * All functions are optional. If config_aneg or read_status
  * are not implemented, the phy core uses the genphy versions.
@@ -915,6 +917,7 @@ struct phy_driver {
 	const void *driver_data;
 	unsigned int phy_package_global_phy_num;
 	const char * const *phy_package_global_phy_names;
+	unsigned int phy_package_priv_data_size;
 
 	/**
 	 * @soft_reset: Called to issue a PHY software reset
-- 
2.40.1


