Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19290C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 11:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iRSQcXdvFa5WQlSREqMOyoC9A2BOfSki5xDtMfxvlHI=; b=n5qUP7Pgvaeibw
	+624KYE4SRbgNfAN56ChFQHbbFRAvN/p2VbrOFJoIVC7X/AOXF28nrJDqHeNQMqQZHJby7eEoOVqk
	Mk9RTLvrkUujDubqOe98IOnwxvXmc5Qp849SPrFtlHRRzR2rIbpshtDRnKRwsVUdWsDpcjsg5M/Sc
	E6aIByf0piDBwg4px2lZfSdVsslUB44ze1YijmyDDS1Jm+qCBrEX5yrtQg2+0C8mDVujoksCvbgJ6
	ONf/FktN9iFJnmsbGmY/VF5GBDw2p+/i/0fHlvuzXeouiSDvyAem94eKujcZyoKTl36d8NQXXHds5
	1YoQha7qB79Inw0Z0wng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7FH3-00G1MB-9N; Tue, 11 Jan 2022 11:25:09 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7FF4-00G0GD-Cp
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 11:23:08 +0000
Received: by mail-pl1-x62d.google.com with SMTP id g5so7509624plo.12
 for <linux-mediatek@lists.infradead.org>; Tue, 11 Jan 2022 03:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MO9C+/y7rlHj27Tk0Qv7Ks5nBGk0gl8cyNWfCGutHPg=;
 b=XMNyqW3ffjGD7aCP26DsYfNkvK9ie+mUzx3cG++ZVjFOqppMcKCPt/SaXT9UO5JD6W
 13iklO18M+gyAsiV7wMHy5puKvT6Pt4MaWcgg5Rj/64i+CICBfFPyisF5bhP4SCLrPMJ
 7dpzceifRZu8dB+5qU1lNWREKlqsVtIhxetVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MO9C+/y7rlHj27Tk0Qv7Ks5nBGk0gl8cyNWfCGutHPg=;
 b=RGq3QlCZP3vpg9hNdbQoxY9A78Is2ezjauhQK5wajo0pc9vR6yLWJqucUgsK2lfKey
 ld7Sj337w+C4EuCN+Hbbsjidt1xp9sBrwhxR21V6GmfkFShj2eRJd/JWgRvYg7cn8mxy
 A2QCdeXciGiB9S6L2f+35wNcXmWwMGpvOG6nW9obJ44g+0msEE/WxMd4UkZznhru7+qt
 D82ra1KBh2Z5pbO7Jd4cI66exOtSGPz25kT9DWe1ZwNvhU4S1nlZZMpSZbkduq1UpFpM
 7VxC87AZ8y2gKcuLENqiuw2DOr4B1OCNpTbhavbAiVc7nfX1UXA4LadLBJ4t50OpRh54
 oJuQ==
X-Gm-Message-State: AOAM5322ALBXrHItpW4o2vjWfeNcmlLzIpgo3Zin2d455LrCOx9uMI2L
 6KLFr7EtvogM4GS53cfqC4fQoQ==
X-Google-Smtp-Source: ABdhPJyjOgTnrtdJ0sLFZX6lDQMnLzWQ2b3meTpTPAGNIGTegsNduPt3LuE/Tfw99opR/kwqXQcJHg==
X-Received: by 2002:a17:902:9a02:b0:14a:6a3:6c68 with SMTP id
 v2-20020a1709029a0200b0014a06a36c68mr4116724plp.138.1641900185952; 
 Tue, 11 Jan 2022 03:23:05 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:e7ee:1824:8575:bc5c])
 by smtp.gmail.com with ESMTPSA id f9sm2053845pjh.18.2022.01.11.03.23.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 03:23:05 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
Subject: [PATCH 7/7] pinctrl: mediatek: paris: Support generic
 PIN_CONFIG_DRIVE_STRENGTH_UA
Date: Tue, 11 Jan 2022 19:22:44 +0800
Message-Id: <20220111112244.1483783-8-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220111112244.1483783-1-wenst@chromium.org>
References: <20220111112244.1483783-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_032306_467958_0767D70A 
X-CRM114-Status: GOOD (  18.96  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some of the MediaTek chips that utilize the Paris pinctrl driver library
support a lower drive strength (<= 1mA) than the standard drive strength
settings (2~16 mA) on certain pins. This was previously supported by the
custom MTK_PIN_CONFIG_DRV_ADV parameter along with the
"mediatek,drive-strength-adv" device tree property.

The drive strength values for this hardware are 125, 250, 500, and 1000 mA,
and can be readily described by the existing "drive-strength-microamp",
which then gets parsed by the generic pinconf library into the parameter
PIN_CONFIG_DRIVE_STRENGTH_UA.

Add support for PIN_CONFIG_DRIVE_STRENGTH_UA while keeping the old
custom parameter around for backward compatibility.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

The indentation in the switch/case blocks is getting somewhat out of
control. I also have some cleanup changes to reverse the logic of the
if/break statements. Not sure if it should be done before or after this
patch though.

---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 84 ++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 678c8aa33012..5a94903ae372 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -48,6 +48,53 @@ static const char * const mtk_gpio_functions[] = {
 	"func12", "func13", "func14", "func15",
 };
 
+/*
+ * This section supports converting to/from custom MTK_PIN_CONFIG_DRV_ADV
+ * and standard PIN_CONFIG_DRIVE_STRENGTH_UA pin configs.
+ *
+ * The custom value encodes three hardware bits as follows:
+ *
+ *   |           Bits           |
+ *   | 2 (E1) | 1 (E0) | 0 (EN) | drive strength (uA)
+ *   ------------------------------------------------
+ *   |    x   |    x   |    0   | disabled, use standard drive strength
+ *   -------------------------------------
+ *   |    0   |    0   |    1   |  125 uA
+ *   |    0   |    1   |    1   |  250 uA
+ *   |    1   |    0   |    1   |  500 uA
+ *   |    1   |    1   |    1   | 1000 uA
+ */
+static const int mtk_drv_adv_uA[] = { 125, 250, 500, 1000 };
+
+static int mtk_drv_adv_to_uA(int val)
+{
+	/* This should never happen. */
+	if (WARN_ON_ONCE(val < 0 || val > 7))
+		return -EINVAL;
+
+	/* Bit 0 simply enables this hardware part */
+	if (!(val & BIT(0)))
+		return -EINVAL;
+
+	return mtk_drv_adv_uA[(val >> 1)];
+}
+
+static int mtk_drv_uA_to_adv(int val)
+{
+	switch (val) {
+	case 125:
+		return 0x1;
+	case 250:
+		return 0x3;
+	case 500:
+		return 0x5;
+	case 1000:
+		return 0x7;
+	}
+
+	return -EINVAL;
+}
+
 static int mtk_pinmux_gpio_request_enable(struct pinctrl_dev *pctldev,
 					  struct pinctrl_gpio_range *range,
 					  unsigned int pin)
@@ -151,11 +198,38 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 
 		break;
 	case PIN_CONFIG_DRIVE_STRENGTH:
+		if (hw->soc->adv_drive_get) {
+			err = hw->soc->adv_drive_get(hw, desc, &ret);
+			if (!err) {
+				err = mtk_drv_adv_to_uA(ret);
+				if (err > 0) {
+					/* PIN_CONFIG_DRIVE_STRENGTH_UA used */
+					err = -EINVAL;
+					break;
+				}
+			}
+		}
+
 		if (hw->soc->drive_get)
 			err = hw->soc->drive_get(hw, desc, &ret);
 		else
 			err = -ENOTSUPP;
 		break;
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		if (hw->soc->adv_drive_get) {
+			err = hw->soc->adv_drive_get(hw, desc, &ret);
+			if (err)
+				break;
+			err = mtk_drv_adv_to_uA(ret);
+			if (err < 0)
+				break;
+
+			ret = err;
+			err = 0;
+		} else {
+			err = -ENOTSUPP;
+		}
+		break;
 	case MTK_PIN_CONFIG_TDSEL:
 	case MTK_PIN_CONFIG_RDSEL:
 		reg = (param == MTK_PIN_CONFIG_TDSEL) ?
@@ -271,6 +345,16 @@ static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
 		else
 			err = -ENOTSUPP;
 		break;
+	case PIN_CONFIG_DRIVE_STRENGTH_UA:
+		if (hw->soc->adv_drive_set) {
+			err = mtk_drv_uA_to_adv(arg);
+			if (err < 0)
+				break;
+			err = hw->soc->adv_drive_set(hw, desc, err);
+		} else {
+			err = -ENOTSUPP;
+		}
+		break;
 	case MTK_PIN_CONFIG_TDSEL:
 	case MTK_PIN_CONFIG_RDSEL:
 		reg = (param == MTK_PIN_CONFIG_TDSEL) ?
-- 
2.34.1.575.g55b058a8bb-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
