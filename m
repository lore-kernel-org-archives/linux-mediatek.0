Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51232CDB485
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 19:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OVZCqq/chP4rxGDQYZJWg42hg+RWlOex6MbvzquphzE=; b=K3foLteaWG1kLYbXmm+cogBcaj
	Moxz82eXqAkjFjKkqqQaeUDIXLeTx/ToCqzRAC4SR+ujyyoVWKQBRhbEJL/bLsZ0DozwoSyDGQ3rU
	trlCCZmJv0I/zr/Fa8cj7S3CE1UHutRk07d96u7lH1xTPgClj5U+BOOgbZRJLzqbTo2KMx/NIrI8c
	gIhBt6zcnIQo8KeJfySu4iLLjeBqPj1N9FAC6m9ptTNMeNP024LiIxQ6OIdO17Me00xo+Cz2wet16
	puDv2w0P5qSzYpF/3ZXAy99HSo5MyUJPdjgr95rkS7Eq0RitfiSlptyvoQvgkkJ+nL63wuS45PBT+
	o/3Eirjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qspOO-00D2y7-0Q;
	Tue, 17 Oct 2023 19:06:12 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qspOA-00D2ls-32
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Oct 2023 19:06:00 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-53e08b60febso9379187a12.1
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Oct 2023 12:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697569553; x=1698174353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OVZCqq/chP4rxGDQYZJWg42hg+RWlOex6MbvzquphzE=;
        b=Eqre3sl/3VltlJ/tNSbtwMDORFTWFwyckvCK5gmKK4co3dx3E5TLX9ZIo2QGKUV3kk
         WaebV3REkS+kAXVudoSiqCKMKW69ERpZ0xvD2zLqR0sft3TumNtRbx5VtR/uNIDvm6bz
         afAIvEuIgLWkAmqg0JCwAOtFEuWH5OXqi5eaiPa5CLoXNe+j2wIqtMvKaBsQNi9Lb/cX
         jMz/GjJVFwVZGKlDZjiFDoUYXzbhF4600ezl7wsJjAKVjo9eQdnKL3NMK8qlXhpRAqhl
         FzB7X9HalfraD6pHXairZUlsJU/03CiPxM4kp1IwMYfv1I2dtFAv5gaT3iNOS5vINxBU
         TjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697569553; x=1698174353;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OVZCqq/chP4rxGDQYZJWg42hg+RWlOex6MbvzquphzE=;
        b=prC+9EVQGnEsv51CQmeaPH+6Kz+U16oxi70tPwgWVcf15C9gJhu9T93BaHx9fm1+Ob
         u78mNHJlUQ6d8UXXlKX5l81xk/oHIxawB+uBgLECfmvuWQ3QDmtFac4uT6Dn5xMiMrR2
         nyONoXJPo8UCV6tZLnjtR+fNCmbsZDJJ+jA8oU6CYWqSDikvy7ro7Q2RefLv0lfpIb4r
         XFjMk9rp1+4QGQOUucB+n/ZYWKiLXHl0XvdJgZQsv+cCdUTZcsI/7wT29fHH/Fw5ZqoQ
         NWcQIcK2J5pFhcO9Qef37ai7qgKEpTficYwwsOaE+k8DO/4wmt8bP4Vb5wqfsh8UwlJn
         vacA==
X-Gm-Message-State: AOJu0YwSEFpMJCYrhj5vGSp1JmPoS5tmSrddiJRm7pcB5LgY6iOpDCiT
	QjwLj8iVC5iZiqzVbCgaOBiDNQ==
X-Google-Smtp-Source: AGHT+IHj2HuyJALAM/occuP6U4giNRg5GB6Vy2tZcBVRhxnSKtz5iV+Nt8aVKPhjOfSd93WeNRPaAA==
X-Received: by 2002:a50:8719:0:b0:533:9df5:ede with SMTP id i25-20020a508719000000b005339df50edemr2459365edb.14.1697569552825;
        Tue, 17 Oct 2023 12:05:52 -0700 (PDT)
Received: from ryzen9.fritz.box ([2a01:2a8:8f03:b001:fe65:a70:2777:ab31])
        by smtp.gmail.com with ESMTPSA id bq14-20020a056402214e00b00537963f692esm1637990edb.0.2023.10.17.12.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 12:05:52 -0700 (PDT)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	dunlap@infradead.org,
	e.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	wenst@chromium.org,
	ames.lo@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	abailon@baylibre.com,
	amergnat@baylibre.com,
	khilman@baylibre.com
Subject: [PATCH v5 5/5] thermal/drivers/mediatek/lvts_thermal: Update calibration data documentation
Date: Tue, 17 Oct 2023 21:05:45 +0200
Message-ID: <20231017190545.157282-6-bero@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017190545.157282-1-bero@baylibre.com>
References: <20231017190545.157282-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_120558_990646_B195315A 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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

From: Balsam CHIHI <bchihi@baylibre.com>

Update LVTS calibration data documentation for mt8192 and mt8195.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
[bero@baylibre.com: Fix issues pointed out by Nícolas F. R. A. Prado <nfraprado@collabora.com>]
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 31 +++++++++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 487401424951d..15fcf573f5cc5 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -604,7 +604,34 @@ static int lvts_sensor_init(struct device *dev, struct lvts_ctrl *lvts_ctrl,
  * The efuse blob values follows the sensor enumeration per thermal
  * controller. The decoding of the stream is as follow:
  *
- * stream index map for MCU Domain :
+ * MT8192 :
+ * Stream index map for MCU Domain mt8192 :
+ *
+ * <-----mcu-tc#0-----> <-----sensor#0----->        <-----sensor#1----->
+ *  0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 | 0x08 | 0x09 | 0x0A | 0x0B
+ *
+ * <-----sensor#2----->        <-----sensor#3----->
+ *  0x0C | 0x0D | 0x0E | 0x0F | 0x10 | 0x11 | 0x12 | 0x13
+ *
+ * <-----sensor#4----->        <-----sensor#5----->        <-----sensor#6----->        <-----sensor#7----->
+ *  0x14 | 0x15 | 0x16 | 0x17 | 0x18 | 0x19 | 0x1A | 0x1B | 0x1C | 0x1D | 0x1E | 0x1F | 0x20 | 0x21 | 0x22 | 0x23
+ *
+ * Stream index map for AP Domain mt8192 :
+ *
+ * <-----sensor#0----->        <-----sensor#1----->
+ *  0x24 | 0x25 | 0x26 | 0x27 | 0x28 | 0x29 | 0x2A | 0x2B
+ *
+ * <-----sensor#2----->        <-----sensor#3----->
+ *  0x2C | 0x2D | 0x2E | 0x2F | 0x30 | 0x31 | 0x32 | 0x33
+ *
+ * <-----sensor#4----->        <-----sensor#5----->
+ *  0x34 | 0x35 | 0x36 | 0x37 | 0x38 | 0x39 | 0x3A | 0x3B
+ *
+ * <-----sensor#6----->        <-----sensor#7----->        <-----sensor#8----->
+ *  0x3C | 0x3D | 0x3E | 0x3F | 0x40 | 0x41 | 0x42 | 0x43 | 0x44 | 0x45 | 0x46 | 0x47
+ *
+ * MT8195 :
+ * Stream index map for MCU Domain mt8195 :
  *
  * <-----mcu-tc#0-----> <-----sensor#0-----> <-----sensor#1----->
  *  0x01 | 0x02 | 0x03 | 0x04 | 0x05 | 0x06 | 0x07 | 0x08 | 0x09
@@ -615,7 +642,7 @@ static int lvts_sensor_init(struct device *dev, struct lvts_ctrl *lvts_ctrl,
  * <-----mcu-tc#2-----> <-----sensor#4-----> <-----sensor#5-----> <-----sensor#6-----> <-----sensor#7----->
  *  0x13 | 0x14 | 0x15 | 0x16 | 0x17 | 0x18 | 0x19 | 0x1A | 0x1B | 0x1C | 0x1D | 0x1E | 0x1F | 0x20 | 0x21
  *
- * stream index map for AP Domain :
+ * Stream index map for AP Domain mt8195 :
  *
  * <-----ap--tc#0-----> <-----sensor#0-----> <-----sensor#1----->
  *  0x22 | 0x23 | 0x24 | 0x25 | 0x26 | 0x27 | 0x28 | 0x29 | 0x2A
-- 
2.42.0


