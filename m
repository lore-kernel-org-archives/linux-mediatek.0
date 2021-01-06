Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF39C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 08:46:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B74523107
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 08:46:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B74523107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GpFI6HoC8Yo2CAlHSuSp9a3WFDUg9/6GcTtewcq0HJw=; b=YUVbQopAPzKvSqw6nrMCnaB5v1
	KhO8mciFwrgDhL/leUDOcp6yuPhu0kQGVgQnGfqGEMjL4DJTYgS+ZLcEczyit559CyrujgIoVv36Y
	FDMalpr/GFvH4nUp1XP2ofX6XIEQpg9X4XilyiecvqRxURmUT24bBhXSPk/qSQ8VJs3qvmcoc0sPV
	TXQgR5peFi0e/irYk9y3A1f+SeK9CCzuNQ9vDllymgiWReOJHX6bNXns8uRikpK/SLikEcvSltB2g
	uP2fjSC1HHQRDJnT6/YuGcSwy1wNHpLy5uVE/e7blptjiCifnUoV+VJmTWhP6RF/2I2XRt8i8X+Tz
	/7LSVtAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx4Sm-0004qs-2E; Wed, 06 Jan 2021 08:46:40 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx4Si-0004ow-3B
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 08:46:36 +0000
Received: by mail-pl1-x629.google.com with SMTP id x18so1215959pln.6
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Jan 2021 00:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=53HmeNCId56TyprTPiCTxLLId7kfWvnwGYjjv2jFeKo=;
 b=AdVNFfI6g/+Peyo3N6YUcwALG9C/6Lg12CpHr1ce54Xw8HxwCQXNqc3DVReRHnmnV4
 Z9HmRiOLTAOiAHowNoy6ri4ooZZwaHOOfig7ryMSQNUOt+5CMMUCfOUyVWfWfGIlUf62
 3Ave4W3jFHywlocQErtqPoiDtzCzi1JS1NYB4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=53HmeNCId56TyprTPiCTxLLId7kfWvnwGYjjv2jFeKo=;
 b=bfw5yE4t5zrPsTPHPkzAOS6x60uMIqfDF53OQwgkjNDUb4nawuXNdrjhE8jPL31u0y
 c9WBRkYWHFGbftq0sfQqkIXJKf2zlZfE2ZoR8T2PbR6LePlo6HVOaLc7X5c3g6e/Oivq
 v3QuTc6PVBobXwfw9I6y7WrmMHdRc0oXyD5jq89L6I4NaVzV0B9SUDp0wFelEmHZoUvD
 +lvyn6a5hac/qcPbPGV4m8uMi58fBeDohE+iStKj/31Tg2lCmfG+v62VGjpHTnNJzSiw
 yv3xF0mlnkkJ+r3oPRv5hlueCyYUS/pXJDBXjpAw6KicqFDVhcFLsfShgJyfBE4JfAN1
 R5Ng==
X-Gm-Message-State: AOAM532lZyzEdXrDN6QHwNLUOuToUYQEK/iy5IDIvZlpA0xQs0EQ9XBD
 yQNLEuE0tFJjwDdUk4rexzYB4g==
X-Google-Smtp-Source: ABdhPJziHVDPeUCi5Utppw8W+tY+4u1RlOrf2iChI9GgDLMJYKK8sUvnaovvgCjgcxX6igQIICAzlg==
X-Received: by 2002:a17:90a:6d62:: with SMTP id
 z89mr3337414pjj.71.1609922792324; 
 Wed, 06 Jan 2021 00:46:32 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id a31sm1913401pgb.93.2021.01.06.00.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jan 2021 00:46:31 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/2] arm64: dts: mt8183: config dsi node
Date: Wed,  6 Jan 2021 16:46:25 +0800
Message-Id: <20210106084626.2181286-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_034636_157847_D964C270 
X-CRM114-Status: GOOD (  10.34  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Config dsi node for mt8183 kukui. Set panel and ports.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index bf2ad1294dd30..4cfb3560e5d11 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -249,6 +249,36 @@ &cpu7 {
 	proc-supply = <&mt6358_vproc11_reg>;
 };
 
+&dsi0 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	panel: panel@0 {
+		compatible = "boe,tv101wum-nl6";
+		reg = <0>;
+		enable-gpios = <&pio 45 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_pins_default>;
+		avdd-supply = <&ppvarn_lcd>;
+		avee-supply = <&ppvarp_lcd>;
+		pp1800-supply = <&pp1800_lcd>;
+		status = "okay";
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi_out>;
+			};
+		};
+	};
+
+	ports {
+		port {
+			dsi_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0_pins>;
@@ -547,6 +577,14 @@ pins_clk {
 		};
 	};
 
+	panel_pins_default: panel_pins_default {
+		panel_reset {
+			pinmux = <PINMUX_GPIO45__FUNC_GPIO45>;
+			output-low;
+			bias-pull-up;
+		};
+	};
+
 	pwm0_pin_default: pwm0_pin_default {
 		pins1 {
 			pinmux = <PINMUX_GPIO176__FUNC_GPIO176>;
-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
