Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC299C7EE2D
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Feb 2023 09:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XfJ0rYdMWcxfYxoBiRZC815B/wB+QDx+GSPvspHE9A=; b=X/BQPMSj7SI+7M3/3tXq/fzQiy
	O5inmFMAysmobD0V7Yx0LlDESqZto/qN4eWML1D7ypJRZELHAoVXHp+FusrV22m6DtvVrC3QB8CZ2
	mh4yMmthF9Yx3c1tL1Y+NyfvWM7R/aweAxwqr6PZeeLuBPvChk6DdcQWQZjGWxZKpXAij3yyGtYlv
	uxf3Pms2jE0GfHl/IXd21k0oWWzj997Z9t+fWX76bhnfpuQz0qU4rlKs+L9SLCC6DfzUritsiPImV
	8E/HKIbfHjKPGHsQ9CskXTtVdVf7mug/G8UYC0NgRPYeNYrBGV9BP6Qj4kApa7V1AV8M2FoQiidyd
	DuTbPjwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVr76-005Niv-Sw; Sat, 25 Feb 2023 09:45:09 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVr6x-005Ne0-G3; Sat, 25 Feb 2023 09:45:01 +0000
Received: by mail-ed1-x530.google.com with SMTP id i34so6717480eda.7;
        Sat, 25 Feb 2023 01:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0XfJ0rYdMWcxfYxoBiRZC815B/wB+QDx+GSPvspHE9A=;
        b=Ibt3vThPxyar1yG10qXGW+zeqDUX89Nlo2F/cCH4Hkxnv7gw2WGacWKz7OjQ3iXJuz
         VYT0Q6M1SdLI/zvk3y0TbD0WAh+jRuRYA9YQ4d+BJWivZtFgkoUMhQv0/DKOk8vSlKjE
         XXt8HkqTT1sQ9C0ksgFZSEll/P+5Xx2jLZVAhVyF6uJyPutSi+ypydYUMDOgllJwGi4E
         kTo6dtLDGFYYkAYLwkwaBQ6Z8+80iBN2yVBEUHpW4hMdtaDd5fouJkbJsLFwAZkLXq16
         eOnDM2HhZ+PaBI+20I+svulvaBicJyfnSyRghJIhRDbDi+qwKHA/cOPTScGafQyLuN0Z
         /LIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0XfJ0rYdMWcxfYxoBiRZC815B/wB+QDx+GSPvspHE9A=;
        b=Ilnx9NC1o5P1KrdnJnHWWq79hhpCUruskX232CJrvjgQxybXsnGt0i+cQdLksoSXyk
         /5m59B4vFA7c79TDVYDi2uE7BtTstKSY3r4yEX4do7U1UlRKrIl9wKNNxcy1CndOkZRM
         nQvIKwIIZxWpGAU1nDxg5dQbYm9ZfkoPpTkv7T0HY41Wbp78e7lmkXeHQXGs+h0n9zQH
         IwKJwxMT6fMyTecc3NXUKEIvkezHtEQsSrL6E5kFWd5H+X491d1K+EsmeLZjimogpkEV
         f8EH8kiK5rrNQWvT3ep9mUqrSMifEyOdDGMdgmy/MIdawXtCFLopO23R47sG7aNrans2
         RGPA==
X-Gm-Message-State: AO0yUKXIrkg+qKp2Ua0aIbnOz/vnC/lvsWkHS1OidSajxoD7KLuwyBFD
	hv/9Oy2X9+SxAJX3b7A6QAs=
X-Google-Smtp-Source: AK7set+kTW8Bd/Hzitz4ondWw9N/y/KY76IljewbLZ6BcTxB7B6iwalol7WvzMxc0qOMZw2HHipozA==
X-Received: by 2002:a17:906:d99:b0:8b2:2141:6de8 with SMTP id m25-20020a1709060d9900b008b221416de8mr28015259eji.73.1677318297161;
        Sat, 25 Feb 2023 01:44:57 -0800 (PST)
Received: from localhost.localdomain ([95.183.227.97])
        by smtp.gmail.com with ESMTPSA id va13-20020a17090711cd00b008b23b22b062sm653649ejb.114.2023.02.25.01.44.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Feb 2023 01:44:56 -0800 (PST)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Golle <daniel@makrotopia.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 2/4] dt-bindings: reset: Add MediaTek MT6735 reset bindings
Date: Sat, 25 Feb 2023 12:42:44 +0300
Message-Id: <20230225094246.261697-3-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230225094246.261697-1-y.oudjana@protonmail.com>
References: <20230225094246.261697-1-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230225_014459_589223_18BE6ECA 
X-CRM114-Status: GOOD (  15.30  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

Add reset definitions for the main reset controllers of MT6735 (infracfg
and pericfg).

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 MAINTAINERS                                   |  4 ++-
 .../reset/mediatek,mt6735-infracfg.h          | 31 +++++++++++++++++++
 .../reset/mediatek,mt6735-pericfg.h           | 31 +++++++++++++++++++
 3 files changed, 65 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-infracfg.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-pericfg.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 5323f71c48fb..f617042790ee 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13101,7 +13101,7 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/mmc/mtk-sd.yaml
 F:	drivers/mmc/host/mtk-sd.c
 
-MEDIATEK MT6735 CLOCK DRIVERS
+MEDIATEK MT6735 CLOCK & RESET DRIVERS
 M:	Yassine Oudjana <y.oudjana@protonmail.com>
 L:	linux-clk@vger.kernel.org
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
@@ -13110,6 +13110,8 @@ F:	include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
 F:	include/dt-bindings/clock/mediatek,mt6735-infracfg.h
 F:	include/dt-bindings/clock/mediatek,mt6735-pericfg.h
 F:	include/dt-bindings/clock/mediatek,mt6735-topckgen.h
+F:	include/dt-bindings/reset/mediatek,mt6735-infracfg.h
+F:	include/dt-bindings/reset/mediatek,mt6735-pericfg.h
 
 MEDIATEK MT76 WIRELESS LAN DRIVER
 M:	Felix Fietkau <nbd@nbd.name>
diff --git a/include/dt-bindings/reset/mediatek,mt6735-infracfg.h b/include/dt-bindings/reset/mediatek,mt6735-infracfg.h
new file mode 100644
index 000000000000..5d24c7a1317f
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6735-infracfg.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_RESET_MT6735_INFRACFG_H
+#define _DT_BINDINGS_RESET_MT6735_INFRACFG_H
+
+#define RST_EMI_REG			0
+#define RST_DRAMC0_AO			1
+#define RST_AP_CIRQ_EINT		3
+#define RST_APXGPT			4
+#define RST_SCPSYS			5
+#define RST_KP				6
+#define RST_PMIC_WRAP			7
+#define RST_CLDMA_AO_TOP		8
+#define RST_EMI				16
+#define RST_CCIF			17
+#define RST_DRAMC0			18
+#define RST_EMI_AO_REG			19
+#define RST_CCIF_AO			20
+#define RST_TRNG			21
+#define RST_SYS_CIRQ			22
+#define RST_GCE				23
+#define RST_M4U				24
+#define RST_CCIF1			25
+#define RST_CLDMA_TOP_PD		26
+#define RST_CBIP_P2P_MFG		27
+#define RST_CBIP_P2P_APMIXED		28
+#define RST_CBIP_P2P_CKSYS		29
+#define RST_CBIP_P2P_MIPI		30
+#define RST_CBIP_P2P_DDRPHY		31
+
+#endif
diff --git a/include/dt-bindings/reset/mediatek,mt6735-pericfg.h b/include/dt-bindings/reset/mediatek,mt6735-pericfg.h
new file mode 100644
index 000000000000..90ee8ed8923f
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6735-pericfg.h
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+#ifndef _DT_BINDINGS_RESET_MT6735_PERICFG_H
+#define _DT_BINDINGS_RESET_MT6735_PERICFG_H
+
+#define RST_UART0			0
+#define RST_UART1			1
+#define RST_UART2			2
+#define RST_UART3			3
+#define RST_UART4			4
+#define RST_BTIF			6
+#define RST_DISP_PWM_PERI		7
+#define RST_PWM				8
+#define RST_AUXADC			10
+#define RST_DMA				11
+#define RST_IRDA			12
+#define RST_IRTX			13
+#define RST_THERM			16
+#define RST_MSDC2			17
+#define RST_MSDC3			17
+#define RST_MSDC0			19
+#define RST_MSDC1			20
+#define RST_I2C0			22
+#define RST_I2C1			23
+#define RST_I2C2			24
+#define RST_I2C3			25
+#define RST_USB				28
+
+#define RST_SPI0			33
+
+#endif
-- 
2.39.2


