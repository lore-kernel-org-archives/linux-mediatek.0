Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0841CF6491
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 04:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qN+Z85uKhFcsA7I0FPVuQftO8kS+uCqLckN4FbzXu4E=; b=UOfogwP9IMmW5tBDYNEWLjn2hw
	abY1cc4Ks9eKimZcZ/6vpALsNx1yqDRCVnqTnE34vQnJdkGxeyiKR9XLVXsO9ZENifuX7QiJm/1vb
	qDi9aWwzweKHrNo8c2LZRgCbI8u062XLNwwbV24UClMSsO1B3QBj3zYFGasf4FUTcYFovOtGGw+xm
	+YOvntpPYJDTzq4XVPnQMqQqp26T8rU8d46ZDRQCkrrYWTZe3r7CoDhl4sPyjtCwC40zQpqlhSOy6
	13ioUVWnlP2xBoq5je/4Ycv2P62TlUPVJ+rlSxFKOLsiqeL4Eu6bD/GxR8PAR8mpzY4+ra87HRb6Z
	Dy4ZxDQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sv8Nb-0000000FvNL-3oPG;
	Mon, 30 Sep 2024 04:51:27 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sv8J2-0000000Fujz-1APz
	for linux-mediatek@lists.infradead.org;
	Mon, 30 Sep 2024 04:46:46 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-20b6c311f62so8037925ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 29 Sep 2024 21:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727671603; x=1728276403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qN+Z85uKhFcsA7I0FPVuQftO8kS+uCqLckN4FbzXu4E=;
        b=ZIQ3SJQdJf3nb9FhRf/5YmAOg64ioDLIKOFIC54oU0xlxzSYawLW4W7VkWZKk56heU
         78W7etcf+jiDN297kw+2O0d8Csn5aIyhCMBf1u2Huf0eo9OTULgr460N20fvREbPe++t
         ak+y8XYyD1i2T6v9ef+4jnmlmiYIw0lt4dBCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727671603; x=1728276403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qN+Z85uKhFcsA7I0FPVuQftO8kS+uCqLckN4FbzXu4E=;
        b=cQAy9uo8OQ16S8aGbqA3paa0wJI2C6r85RufTLkXOKFSg49JVgbEUR825S/oIRbAKh
         QWms/eKPPyXXRk/PRn88duup/UFH7mdhEfQpn5+Fzlmp4oeA+q+E/t1kD/uuhTI0tcPT
         8A8Cx+pBjj3QF6+fAuwgb9A559DgAo2np68TLlFXUpgj+6hfNUSK2eODiWzoaeRZZpT7
         0Q+zAFGZ7UPeVSPR07sSrmV/Dp0Sotq0OOpV/TOQu/DbVqxxc6Qm6iTHkPA4TC6Fpjap
         H5gk+ntNAzuxD8y648aoSaNUvTkBqJ7F/azT4OyynrNKsD574t6CmcPSG3CLnQrNbiRF
         PiWg==
X-Forwarded-Encrypted: i=1; AJvYcCWH91wmn4GFr8JLpBjUSXiptO/2ICWtjgWcnp9R00uCYxf6X3rwDNmB9Iis78w/AKtPtCKNZo17+Sp/SUfmBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCMcGwbCE9JdL6GD4gjVk7Zdro3C/W+LfaTfG+icCj03wpobmj
	oOokX4qtptjqhlKAYA5E9gVMtiQCteaJNRH3HdXg57kUVVANGIyd8O5IRkHkhQ==
X-Google-Smtp-Source: AGHT+IHsHQaIS+I9VX9gHEq3fHW0VJ8hm8miY4PsryP7g4DCTMesviF4MlhqkaQ76u1RTM6qq7VZ2g==
X-Received: by 2002:a17:903:32c7:b0:20b:6458:ec83 with SMTP id d9443c01a7336-20b6458ef88mr67264665ad.4.1727671603389;
        Sun, 29 Sep 2024 21:46:43 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:659b:6caf:831b:3926])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20b37e0d65asm46236925ad.123.2024.09.29.21.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 21:46:43 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Pablo Sun <pablo.sun@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: [PATCH v9 3/3] pmdomain: mediatek: Use OF-specific regulator API to get power domain supply
Date: Mon, 30 Sep 2024 12:45:23 +0800
Message-ID: <20240930044525.2043884-4-wenst@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20240930044525.2043884-1-wenst@chromium.org>
References: <20240930044525.2043884-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240929_214644_330873_A92486BF 
X-CRM114-Status: GOOD (  18.38  )
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

The MediaTek power domain driver contains a hack that assigns the device
node of the power domain to the struct device of the power domain
controller in order to use the devres regulator API.

Now that there is a proper OF-specific regulator API, and even a devres
version, replace the hack with proper code.

This change is incompatible with incomplete device trees. Instead of
assigning the dummy regulator in cases where the power domain requires
a supply but the device tree does not provide one, the driver will just
error out. This will be seen on the MT8390 EVK, which is missing
supplies for the IMG_VCORE and CAM_VCORE domains. And likely all the
MediaTek EVBs, which have no power domain supplies specified. This is
however the correct behavior. If the power domain's supply is missing,
then it should not work. Relying on other parts of the system to keep
the unattached regulator enabled is likely to break in ways less easier
to understand.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v7:
- New patch

The other option is to follow what Rockchip will be doing: getting the
regulator supply upon first use / enable [1]. This will result in less
breakage: only the power domain that is missing its supplies will fail
to be attached.

[1] https://lore.kernel.org/all/20240919091834.83572-6-sebastian.reichel@collabora.com/
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index 88406e9ac63c..3580913f25d3 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -353,7 +353,6 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 {
 	const struct scpsys_domain_data *domain_data;
 	struct scpsys_domain *pd;
-	struct device_node *root_node = scpsys->dev->of_node;
 	struct device_node *smi_node;
 	struct property *prop;
 	const char *clk_name;
@@ -388,16 +387,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 	pd->scpsys = scpsys;
 
 	if (MTK_SCPD_CAPS(pd, MTK_SCPD_DOMAIN_SUPPLY)) {
-		/*
-		 * Find regulator in current power domain node.
-		 * devm_regulator_get() finds regulator in a node and its child
-		 * node, so set of_node to current power domain node then change
-		 * back to original node after regulator is found for current
-		 * power domain node.
-		 */
-		scpsys->dev->of_node = node;
-		pd->supply = devm_regulator_get(scpsys->dev, "domain");
-		scpsys->dev->of_node = root_node;
+		pd->supply = devm_of_regulator_get_optional(scpsys->dev, node, "domain");
 		if (IS_ERR(pd->supply))
 			return dev_err_cast_probe(scpsys->dev, pd->supply,
 				      "%pOF: failed to get power supply.\n",
-- 
2.46.1.824.gd892dcdcdd-goog


