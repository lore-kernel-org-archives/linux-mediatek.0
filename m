Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAABC4167B
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Nov 2023 01:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cA+b+Z27SOao2N4LtORUgnXkn4zzcEHGz0L7SXjLLnE=; b=l/Wb3BrO8iwf6+CQfP3t/fFGGG
	9nuGUkQKJ5KbCb/RdEZxVJpbR/V/alcBBVDyHxQAzS77LRLP8Lr3YuQ2QFMPQWSTVnkbw2HHnbJ9A
	rBmZ6C6eLfR66huIT/dcSJrfAlCbeeWHka+ildLr0ngwmx+CY9GyRnQW6SzymLiqw15zySYEi1K+P
	VUMgvNIvDYD14NGze3GjKtI8PFYdh1Dzj3gjlaIseITIIEB6fFqtpGPiyh9K7FeQrWS5bYgez3gph
	Rr0LrrmEca7KctH2owgJ1/ruLNp1Tzb4mh+NKo9Swg/E1UFYrjXojEjVV4VnvG9a8Ht5CwnO901Aj
	0zuDoUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r74Lb-00A4i6-15;
	Sun, 26 Nov 2023 01:54:11 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r74LQ-00A4aM-0d;
	Sun, 26 Nov 2023 01:54:01 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40b397793aaso11005335e9.0;
        Sat, 25 Nov 2023 17:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700963638; x=1701568438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cA+b+Z27SOao2N4LtORUgnXkn4zzcEHGz0L7SXjLLnE=;
        b=N8H04duS/zffWeoUOkK0V0oGshmQeWwytYzusjNFQ/KzUNWJtsiHII5XCD3cjiR8Ap
         KBfC3mLabq/9IHgKRf4xk0EjnDKL1DBv9ruUrbS0k5vgPp8mgfg4FCvsJ8LG02+kYhJS
         +If89sPuUAMuJDa1GyFfg7WPusXeS6loJeixQZ09JNhW4apX+dFYbQeP2ow7uwkTFUfP
         ejnNr+dpji2CxnNFYi1A6YHRv3+bcmIr02L6chE3WZm3er/Aecry02aBw+T+KHtf1vJZ
         +tGugO4/KYzQXpFQzo9U2zJHgJBe2s2wlcg1pMVraytZtNBUV17Nd/6pr/i5KpQ/JXlr
         pblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700963638; x=1701568438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cA+b+Z27SOao2N4LtORUgnXkn4zzcEHGz0L7SXjLLnE=;
        b=shmuV2VJ3ijMZ6tjZ2z8+ruWps8YPv4d4ZyrB5Q9FOQkmsFilcrjEHRuTjM7Q7FYqK
         B5J/qVYUhx8M/f0jlW4Icd9x/PV9agilxFh7k4VdmmgerS010JtCQkhP8w7Ydkyiu/3H
         Ouqt0mGi4MwgWh2ef8LtYdNTqJUTLDEct/eaf6gQ9ZRs2SFP+OAS2e9eoE2cZ/7l8LZc
         PiSUAA5xQ4lbuOv3F8Vnsa77jA0IwdAxEn7UCBPjlDkqpKRc9KyJ0Lh1kMSlS5MU4Qzl
         YRWPdFprF4BDHw/QuyOUwka/kbYP0Nlky/t5Q/ntQp6h6f/L+XFf7r2O46vxxQ2+ExYz
         EU+A==
X-Gm-Message-State: AOJu0YzK8buXHZI8QAjlu98iUVBhhH6Yc4EncjQAwdkQpcoDFMlgt/ZK
	2BUUpc8pl3wnWaUH2ATCMdk=
X-Google-Smtp-Source: AGHT+IHc9ZwZx9ba3AOZTxai5SOo2xvppKqSsbXSzk/nEutwu5cewKivimHy3Dmbx6B/ya9WeEnOFg==
X-Received: by 2002:a05:600c:4ec8:b0:40b:3e6d:7a9d with SMTP id g8-20020a05600c4ec800b0040b3e6d7a9dmr3442845wmq.15.1700963638036;
        Sat, 25 Nov 2023 17:53:58 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id p34-20020a05600c1da200b00406408dc788sm9875344wms.44.2023.11.25.17.53.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 17:53:57 -0800 (PST)
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
Subject: [net-next PATCH RFC v3 4/8] net: phy: add support for driver specific PHY package probe/config
Date: Sun, 26 Nov 2023 02:53:42 +0100
Message-Id: <20231126015346.25208-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126015346.25208-1-ansuelsmth@gmail.com>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_175400_238259_8FA0F6F0 
X-CRM114-Status: GOOD (  18.29  )
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
index 87f06b4ecbfe..d52eb4ff4dac 100644
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
@@ -3325,6 +3332,13 @@ static int phy_probe(struct device *dev)
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
index c4e6d0b3a86c..7df7a854fdeb 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -910,12 +910,33 @@ struct phy_driver {
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


