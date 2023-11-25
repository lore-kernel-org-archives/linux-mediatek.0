Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AA6AC636CB
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Nov 2023 00:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMmCWPX59UJtqG86RQS8Ot62rGrmo3eqFy3GB/yFnLs=; b=u1ra2/nDPgN9KMBGG6jl2YQ9B1
	T6ukxkiXmBoEQzQBpTLgIRLD1F1O88TcPYyjKMUDlIn3gZ33Ayxlmnb9uIzGiezYEZ6SiT1nK4SOv
	EVhb2SNieJ9BFfw4HojL9YDfsj/B429YKLDnkzqXb8zyNTyzr5L/o6MUW+vl6rVsmfFP0qIP2XZIz
	8NDgCkELdigF/PuwpcZy6P4dKJ5wHO2NaKby++sKUtiCFrf9pAbMsHuZM4eyNi0faoqF/k367Edqh
	FV/FjP1BwOyzMWMCGk3KjJXqu+NKbcy6zQvP88/UfcnjwVHpDnNAKXR5ivrM70MogkVZJPEOqC8pf
	pfDU6tmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6geb-008Fit-31;
	Sat, 25 Nov 2023 00:36:13 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6gdu-008FDc-2d;
	Sat, 25 Nov 2023 00:35:32 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40b3e1f2bcfso3925915e9.0;
        Fri, 24 Nov 2023 16:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700872529; x=1701477329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMmCWPX59UJtqG86RQS8Ot62rGrmo3eqFy3GB/yFnLs=;
        b=NUS+Y8I1OTJz+6pxW2tQZSn7gIH1qghBuZ3bc9jH8aC2Bk3DyYFM+ZDUquVTSwICab
         eXIAs+Bo4aRgGkRN/jotDiRqDhhPjDqe3pzFI5au3+6r8r2zJ8B/2ZaJkEZFWEucLaUV
         +d/6So19ss60tiXP+j57LS0A+H+wp4qsGfNhut0cmAKv0nijqekSl3jMUo7Vkzw1PiVW
         ycFTKslG+i+gsTFXnMJxR+ngHpo2bEZWzmf7WPOMfB8nIlrHAl8YxxsTLhhSDqo/76dg
         Bsr5JotzF2ppz3PsOzz0QFpgi10OlOcSqRh46h4ucwt89CvHOQj5vNTmcG9d2/KPjF1i
         IfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700872529; x=1701477329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMmCWPX59UJtqG86RQS8Ot62rGrmo3eqFy3GB/yFnLs=;
        b=II24EFh8BBFaHWaGUk8lCyae9nN7oWaUrLHyugCsweK5RG/ATN9Lwa0THDb3+A7rZa
         PCisKxt0S56ew/JQOvWpjsG22QQj0fWn1jPQ5y2/DviqBbTe2/cmk0DDFvuAQfjjzwuV
         nj/UmoDGe4xM20j1fdhxi/Gxb9CwV3eH/pHyW1/z0Qb3sl0H3bBbgdi+Cda1EUqmuQjz
         y6oSQmBgHRELUgMzH3/XtNpEDNVVNVZHilsDW62Me9UDLX7zFU+BmZmCwj94HRezFF3v
         zZ6YHLyBwUCZKJIc0ytt+sgC7DAI1SUR6Xs6Ta4gLBtwUwgS1EdiG2+pZfKwSqwv+NLP
         zjKA==
X-Gm-Message-State: AOJu0YxdFNjmuDMjK7dQaU7LVgOT+VRByiGUQNoGW98BDK+xTaIZ0pEI
	gIg5wbh2gMXk8QZZYLFlvdk=
X-Google-Smtp-Source: AGHT+IFKiEoNKX+AkqKaRb0CQSvaTZ3MufoYCXx4Z6VdVsXI5K9f7c6Uqf9agFzA+WCb4EwraptDVA==
X-Received: by 2002:a05:600c:3104:b0:406:8496:bd8b with SMTP id g4-20020a05600c310400b004068496bd8bmr3949616wmo.9.1700872529488;
        Fri, 24 Nov 2023 16:35:29 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id u13-20020a05600c00cd00b00405718cbeadsm4268005wmm.1.2023.11.24.16.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Nov 2023 16:35:29 -0800 (PST)
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
Subject: [net-next RFC PATCH v2 08/11] dt-bindings: net: add QCA807x PHY defines
Date: Sat, 25 Nov 2023 01:11:24 +0100
Message-Id: <20231125001127.5674-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231125001127.5674-1-ansuelsmth@gmail.com>
References: <20231125001127.5674-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231124_163530_861954_406EB09E 
X-CRM114-Status: GOOD (  14.92  )
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
 include/dt-bindings/net/qcom-qca807x.h | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/net/qcom-qca807x.h

diff --git a/include/dt-bindings/net/qcom-qca807x.h b/include/dt-bindings/net/qcom-qca807x.h
new file mode 100644
index 000000000000..e7d4d09b7dd4
--- /dev/null
+++ b/include/dt-bindings/net/qcom-qca807x.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Device Tree constants for the Qualcomm QCA807X PHYs
+ */
+
+#ifndef _DT_BINDINGS_QCOM_QCA807X_H
+#define _DT_BINDINGS_QCOM_QCA807X_H
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


