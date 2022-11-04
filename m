Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05508C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Nov 2022 15:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ZMIvZlN2RweJkUN5B//uFf7tgMLArGLgtt1G8UfvMA=; b=Y8X4h2F44exPKhDwze77tDrpvs
	eIRYcPoo5TMebXXFZUPVVssqFAx01hGWzq9x11xrKYvmf7xFcE0YOLUl0YtXavr0ThI7tIERy2rVf
	aVlDgHxDOOIRPG3pW63KJ0GxVIl6yicHVeAXaBEfWWlHB7hVsDkhhTNHZ9Pd+T066NOMLdRIgAye0
	M3qxrbo5nNZyxLQnMGRLbcnrcC79TAjUm5RaPohwGo8FdqgDM3Qx0WX6VFMhOW64+yi+85HCtlDkf
	wcafpdrLTEuw1rA8IfcX8CBaGP0/afP2URP/DSAW8YY1+9jCQhcSlBuZpyxgE5T3tEbgJ/e/jKPpk
	/ykpojJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqydk-004Drx-Fa; Fri, 04 Nov 2022 15:29:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqybv-004D5W-Tw
	for linux-mediatek@bombadil.infradead.org; Fri, 04 Nov 2022 15:28:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7ZMIvZlN2RweJkUN5B//uFf7tgMLArGLgtt1G8UfvMA=; b=P4coRcKVbeEo+f4zvsnXlNtVHp
	gP0SQ6Rctu1lOCHNQ+T47tevixqDryRGUL8pbU9I1x7BHs7sOGqpD1Brt+ruSqVaFbcKYn/LlrGUA
	7Jv2rtjNWUUsBRT2yJs6eIs6pjHHK36SuPmKddKF4806LjZ2BME2o6TCR+fxdCXZ2tSSoXVS/BoQ5
	QVILQ91OhuK6hTzpeMmQCJ7jNSp9wvnDXQqDW1owhjtQCT8yaFjvPadjJHysrCdmMWBawK5O+O7vw
	cmKqlC+ffesf2sRmpTkq/vxeQrZhy8L+HZ3NnJ07AFj3zkL4Blu14/xUUWJLaktsj5BWd+IbIpUYq
	WZoPMWQg==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqxSo-008zJY-U8
	for linux-mediatek@lists.infradead.org; Fri, 04 Nov 2022 14:15:08 +0000
Received: by mail-wr1-x42a.google.com with SMTP id g12so7205292wrs.10
        for <linux-mediatek@lists.infradead.org>; Fri, 04 Nov 2022 07:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ZMIvZlN2RweJkUN5B//uFf7tgMLArGLgtt1G8UfvMA=;
        b=vaZQ6TBoKkbx6TGxCcFW+YH+RxWS+kSPBpJm20J0qkLGMHIEa0T1ZM2r2Zqy6pJ5gF
         1q5R0qy6Cx33RKk0/W4UYWCc3HAqeVlyBulwzqdGQ4r6019aq24y6lYW/8hd/8C8ynqL
         xIl4S6/k4pj9slu3IkHzLkj6jHAp3cWFHdS3XbU8OHjl/IpRC8JmYlVRpIqlyV0wVP+Z
         0141hvtRLwVgnNzOCE+ahZzOOgGzGq2BLnrRBJlONSwoGtZVYYdEri//pLry3Cf7ibyT
         meRI7L/rIoGsKpR3HROJLlLhdp8PBdIUk8AyBYOqpoyNk1lHRar4rDHdxG++TFo4zafr
         HhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZMIvZlN2RweJkUN5B//uFf7tgMLArGLgtt1G8UfvMA=;
        b=pAtwaLw86IzH7e6nvqKjqyDd/zGIJj6psD59D1w9XL2Q4m0nbtfabROgJ5yqZ1U20a
         Hqh3nanx0HpCOa7mHvt6fb2b2S/UOhC8qGMM8RLCVfOBVgBinXyzADcHJEdmA9u2PYR1
         PjLOBhjYM0xoWHeGjl/dxiiuG2ZXm2DhiAxsPuLwgJRzxMHb1FGmG5g0qRoxXJZ+BVtV
         nvoXg5MSluEU7QAMuQHmsINLDQ/dYcZzyjdPWL/eyLCd8kD2+oazC7cm3SmLWpz6Poa2
         gK/IV2mie/sanU/Q7cqzy1io8VlzCn0e7Yls+mJS7i9IA0Gk/8GkAXpLzr7d7mSAwNng
         RmXw==
X-Gm-Message-State: ACrzQf0Qg1NiQX3n1WCZiScRBLIeXQpCdlrAl0pg91r2L0uXqF39d03k
	qZUD94tYZANqzDRcYXU8GoLQzg==
X-Google-Smtp-Source: AMsMyM6vxkBTMx3zpCwdVJDHci7QUsUI/9KYwNLHnBbluAYJIfNZUyVM5fn6RwNaPAlohJffVGFYwQ==
X-Received: by 2002:a05:6000:1c08:b0:236:e52d:b0d7 with SMTP id ba8-20020a0560001c0800b00236e52db0d7mr215846wrb.46.1667571264124;
        Fri, 04 Nov 2022 07:14:24 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6440-7fff-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6440:7fff:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id bj9-20020a0560001e0900b002365cd93d05sm3594512wrb.102.2022.11.04.07.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 07:14:23 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 04 Nov 2022 15:09:55 +0100
Subject: [PATCH v3 09/12] phy: phy-mtk-hdmi: Add generic phy configure callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v3-9-a803f2660127@baylibre.com>
References: <20220919-v3-0-a803f2660127@baylibre.com>
In-Reply-To: <20220919-v3-0-a803f2660127@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, stuart.lee@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Guillaume Ranquet <granquet@baylibre.com>, mac.shen@mediatek.com,
 linux-phy@lists.infradead.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_141506_184682_E533ABF4 
X-CRM114-Status: GOOD (  11.00  )
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

Some phys, such as mt8195, needs to have a configure callback defined.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/phy/mediatek/phy-mtk-hdmi.c | 12 ++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi.h |  1 +
 2 files changed, 13 insertions(+)

diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
index b16d437d6721..32f713301768 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.c
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
@@ -8,10 +8,12 @@
 
 static int mtk_hdmi_phy_power_on(struct phy *phy);
 static int mtk_hdmi_phy_power_off(struct phy *phy);
+static int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts);
 
 static const struct phy_ops mtk_hdmi_phy_dev_ops = {
 	.power_on = mtk_hdmi_phy_power_on,
 	.power_off = mtk_hdmi_phy_power_off,
+	.configure = mtk_hdmi_phy_configure,
 	.owner = THIS_MODULE,
 };
 
@@ -43,6 +45,16 @@ static int mtk_hdmi_phy_power_off(struct phy *phy)
 	return 0;
 }
 
+static int mtk_hdmi_phy_configure(struct phy *phy, union phy_configure_opts *opts)
+{
+	struct mtk_hdmi_phy *hdmi_phy = phy_get_drvdata(phy);
+
+	if (hdmi_phy->conf->hdmi_phy_configure)
+		return hdmi_phy->conf->hdmi_phy_configure(phy, opts);
+
+	return 0;
+}
+
 static const struct phy_ops *
 mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
 {
diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
index c7fa65cff989..f5aac9d352d8 100644
--- a/drivers/phy/mediatek/phy-mtk-hdmi.h
+++ b/drivers/phy/mediatek/phy-mtk-hdmi.h
@@ -24,6 +24,7 @@ struct mtk_hdmi_phy_conf {
 	const struct clk_ops *hdmi_phy_clk_ops;
 	void (*hdmi_phy_enable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
 	void (*hdmi_phy_disable_tmds)(struct mtk_hdmi_phy *hdmi_phy);
+	int (*hdmi_phy_configure)(struct phy *phy, union phy_configure_opts *opts);
 };
 
 struct mtk_hdmi_phy {

-- 
b4 0.11.0-dev

