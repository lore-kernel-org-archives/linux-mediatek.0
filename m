Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE768C197A0
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Nov 2023 13:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+bK4gHzJ+y3tePc89TtX9q7l+Za/0YYi8syFPOCy8lg=; b=h+PPhoRrJ0rlZ+xaDTaLdkHmv0
	mHxhB4a3v+FozxHwQqMGsNrVisb321xkxrJrJ34SnRcKdv8B0LLgICtlZCLiGHoKYlJ3LtGnQK126
	QxqwZi4esYEwX+8sESJAnUvNpglx7nIx9rcGLXPaiu3nLkIDZpdOzvDKEOOxEfqR33T6aZy7zpaGg
	Kou+0dPHBD/d7z8lRBdDDxwpuMCHMws6O8NnL6V3yvkmQj7je/mKBuVRTLNKX1xdKu3+PHoVkq3Yv
	wcXmnje2xpAnMewhTB2m00Z6KPVBBo2wctaHTlNCeJtVOjnahFqZ+nj1DHwrl2gMuBBFgoE7WznV/
	v53Lsn9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r54i0-00CCFv-1s;
	Mon, 20 Nov 2023 13:53:04 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r54gW-00CBmg-13;
	Mon, 20 Nov 2023 13:52:17 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-32fb190bf9bso3271038f8f.1;
        Mon, 20 Nov 2023 05:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700488290; x=1701093090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+bK4gHzJ+y3tePc89TtX9q7l+Za/0YYi8syFPOCy8lg=;
        b=KMf+N1wiRJ/rEg26PJlZwQQexqIIB5/Kw2jsPP0R0deRuGWTjMAns+2wqp1obQ1+bh
         GHQs8Thb0Z2hvq8YT7H0zE4G3sz5eNwONuFEfAEUMkF8cBg3wC9jc9BnQbz82Gkv0Z6e
         T13dY3U3yRVldqGFALmH2w+dmG4nRCR1FyU5UOr/LqGj4uuGzUh/YozjOhVo6SOYnJvi
         Ukfs+lAZ2XWOyoGrzy23f7Lofjvj4nCMg8L5Wman2/UBTQ41/QMdC+qdsMc8PNjj7H7F
         enj9lZ6Qe2SeBYB82y1VkZWYJmO7gVzFXajMC2eCe5OmDNQapVEwmBzyWoJ5X78qpnH/
         g6xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700488290; x=1701093090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+bK4gHzJ+y3tePc89TtX9q7l+Za/0YYi8syFPOCy8lg=;
        b=Xwg/rc5SSrnegpF71GEa3dsbRdxlfqkAbip9Uj8d4v9yO/J047/WT3f5m7vJOfhRKU
         uLfpmXsxKldQI769RQipSwiXIJNsYNe93OGbuJ0k7SVOuM76kR7EtOt80oYYaiQ2ZV4Q
         3o/O/mhkvZ7TrOiirx/s7POnUJP5MmHYh+7qmvtMppnNSd7Hzm1NEt4csMfLfy6yOMes
         KU0Xea1Iv2xHOwcY2IEqcL4veOz2kTfYhZXwALpQ46FteyCQg2a1yam39e/k/kpm/QG5
         QOEKADv/NI1r4YvyLR/eajhcw9HYOM38RjToqm2wmoEFvgpS5mT37jsKc77oLX6Wo3vX
         Jdiw==
X-Gm-Message-State: AOJu0Yxw8oSTg6NwPLyw03Ed8yAnq4RqMvYDlMyo9/PIOofB8FI3Bl80
	vSINcweycqvRldNZROnHX4k=
X-Google-Smtp-Source: AGHT+IGQpqPZK+oPA2rWRqOtnSOKMxcGuZz5hDx228kkb7ZrMwBDn5rbRsE/t5rqE8I++LpS4paQag==
X-Received: by 2002:a05:6000:1445:b0:332:cb0e:73b6 with SMTP id v5-20020a056000144500b00332cb0e73b6mr1341263wrx.2.1700488289753;
        Mon, 20 Nov 2023 05:51:29 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id j33-20020a05600c1c2100b0040772934b12sm18205846wms.7.2023.11.20.05.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 05:51:29 -0800 (PST)
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
Subject: [net-next RFC PATCH 11/14] dt-bindings: net: add QCA807x PHY defines
Date: Mon, 20 Nov 2023 14:50:38 +0100
Message-Id: <20231120135041.15259-12-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231120135041.15259-1-ansuelsmth@gmail.com>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_055132_606646_9DD07100 
X-CRM114-Status: GOOD (  15.04  )
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

From: Robert Marko <robert.marko@sartura.hr>

Add DT bindings defined for Qualcomm QCA807x PHY series related to
calibration and DAC settings.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/dt-bindings/net/qcom-qca807x.h | 45 ++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 include/dt-bindings/net/qcom-qca807x.h

diff --git a/include/dt-bindings/net/qcom-qca807x.h b/include/dt-bindings/net/qcom-qca807x.h
new file mode 100644
index 000000000000..42c45c7d5210
--- /dev/null
+++ b/include/dt-bindings/net/qcom-qca807x.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Device Tree constants for the Qualcomm QCA807X PHYs
+ */
+
+#ifndef _DT_BINDINGS_QCOM_QCA807X_H
+#define _DT_BINDINGS_QCOM_QCA807X_H
+
+#define PSGMII_QSGMII_TX_DRIVER_140MV	0
+#define PSGMII_QSGMII_TX_DRIVER_160MV	1
+#define PSGMII_QSGMII_TX_DRIVER_180MV	2
+#define PSGMII_QSGMII_TX_DRIVER_200MV	3
+#define PSGMII_QSGMII_TX_DRIVER_220MV	4
+#define PSGMII_QSGMII_TX_DRIVER_240MV	5
+#define PSGMII_QSGMII_TX_DRIVER_260MV	6
+#define PSGMII_QSGMII_TX_DRIVER_280MV	7
+#define PSGMII_QSGMII_TX_DRIVER_300MV	8
+#define PSGMII_QSGMII_TX_DRIVER_320MV	9
+#define PSGMII_QSGMII_TX_DRIVER_400MV	10
+#define PSGMII_QSGMII_TX_DRIVER_500MV	11
+/* Default value */
+#define PSGMII_QSGMII_TX_DRIVER_600MV	12
+
+/* Full amplitude, full bias current */
+#define QCA807X_CONTROL_DAC_FULL_VOLT_BIAS		0
+/* Amplitude follow DSP (amplitude is adjusted based on cable length), half bias current */
+#define QCA807X_CONTROL_DAC_DSP_VOLT_HALF_BIAS		1
+/* Full amplitude, bias current follow DSP (bias current is adjusted based on cable length) */
+#define QCA807X_CONTROL_DAC_FULL_VOLT_DSP_BIAS		2
+/* Both amplitude and bias current follow DSP */
+#define QCA807X_CONTROL_DAC_DSP_VOLT_BIAS		3
+/* Full amplitude, half bias current */
+#define QCA807X_CONTROL_DAC_FULL_VOLT_HALF_BIAS		4
+/* Amplitude follow DSP setting; 1/4 bias current when cable<10m,
+ * otherwise half bias current
+ */
+#define QCA807X_CONTROL_DAC_DSP_VOLT_QUARTER_BIAS	5
+/* Full amplitude; same bias current setting with “010” and “011”,
+ * but half more bias is reduced when cable <10m
+ */
+#define QCA807X_CONTROL_DAC_FULL_VOLT_HALF_BIAS_SHORT	6
+/* Amplitude follow DSP; same bias current setting with “110”, default value */
+#define QCA807X_CONTROL_DAC_DSP_VOLT_HALF_BIAS_SHORT	7
+
+#endif
-- 
2.40.1


