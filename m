Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6CAAC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 06:29:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FC6A2310F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 06:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FC6A2310F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AMbPs3BIO0+DRmlGIvComHVnYlg5iN/REoPgflfOs9Y=; b=hY9nmvvuMXzMz6nLt/i6U+U0BJ
	6Y30Uxsb8kdy5Ji64x0ZDGNNstGOK9IQrODEJRxvSZtSoiUhfC9kEyuIysXX60YkXi4JfuxIlQOK9
	wLuBx7dXfpsFyfV0MwDeSBWBHnQSjG3adcWQsbsIxZCNnMLmA2FOkNZZkZ2dS87AxPFNWJZM3VSaa
	HgtQfRGhyEMWmnrjQPI/sgkWO/vyJKos9mO/J73swSIKKkLFNvj5cXLvslFCF1qK2PBXmjlT725+g
	4YPQZgvUxOvHm+tHCj/LPbpPxr3X964YGcYGDR/z6af65sImP16uctOG3KySFmaLNnZbpCy3e9WQQ
	hnpQ5dAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzZeB-0006GC-D8; Wed, 13 Jan 2021 06:28:47 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzZe8-0006Eq-1l
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 06:28:44 +0000
Received: by mail-pj1-x102d.google.com with SMTP id l23so529519pjg.1
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Jan 2021 22:28:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7V7mkIm5GVfs9j4oSAoW4YEhPzX9sV7NqtlWsRJcP4g=;
 b=YPfRgekDFzXsDeLSpv6VWJ5Hynq+4zVtn9K8qTzmRCqmi+rMZBb1lm0GHIiyq/Fdrk
 JXuZnDFnfmWdv9ckKziBU51kBoJBQeJy1C48XPoKjXb2uCyDN8U9mvfhnYNtWrUe4Nuw
 yJS10PUaND9hwc2xHCZNf3gux5IarDuDrC5Wo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7V7mkIm5GVfs9j4oSAoW4YEhPzX9sV7NqtlWsRJcP4g=;
 b=FYO2u6HV3aB+WlPnk1nYrTDpd60nN1CMZxya1tLW1m9edmAuMZWDIqkySmBAzpYGDe
 xt6Y7EFzge4MlleaWZ8pQPQ/5MK4mx/fIZYShaBSrBrhOBitbzHQFLkdQixyHHPCe0ih
 8RL0zcqcZ9LeZbmpbLu4gQQpNS/dNe8I1N05QoHoxFvecrddz9R22ySFY78oNOi8bvn7
 Zfbu5g/P+n6ZvziVtRbAvAWoKzvLEYRKn6bntToD49UI9NwePProwbQzO8/hw3hgTOeL
 rTAHZDR13yiP+OJ60BWGDwTDEmmYxl/ztrVR+hlKXOuLRs3R8FsdZQzGgXuPAKOpuXpo
 opPw==
X-Gm-Message-State: AOAM533LimZhl2Tn7B2W7SrBcZyEZZuMaPMPhm1c5DakqfWAsDwmPgC1
 LF//fk1IbtPFadfqT+IH8VAAiA==
X-Google-Smtp-Source: ABdhPJyMK/Rd+1yNPiUnAIdOyIjhW7oHubC50XzAO75mm/HZoO572CWxNC5Que1TGnJWB8NwQQAZ1A==
X-Received: by 2002:a17:902:c583:b029:da:b32c:cf9f with SMTP id
 p3-20020a170902c583b02900dab32ccf9fmr649091plx.44.1610519321917; 
 Tue, 12 Jan 2021 22:28:41 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id d36sm1117473pgm.77.2021.01.12.22.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 22:28:41 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 1/2] arm64: dts: mt8183: config dsi node
Date: Wed, 13 Jan 2021 14:28:33 +0800
Message-Id: <20210113062834.4043956-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_012844_110177_2046C950 
X-CRM114-Status: GOOD (  12.11  )
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

Several kukui boards share the same panel property and only compatible
is different. So compatible will be set in board dts for comparison
convenience.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
---
 .../mediatek/mt8183-kukui-krane-sku176.dts    |  5 +++
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 37 +++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
index 47113e275cb52..721d16f9c3b4f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane-sku176.dts
@@ -16,3 +16,8 @@ / {
 	model = "MediaTek krane sku176 board";
 	compatible = "google,krane-sku176", "google,krane", "mediatek,mt8183";
 };
+
+&panel {
+        status = "okay";
+        compatible = "boe,tv101wum-nl6";
+};
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index bf2ad1294dd30..c5f41b94f154e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -249,6 +249,35 @@ &cpu7 {
 	proc-supply = <&mt6358_vproc11_reg>;
 };
 
+&dsi0 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	panel: panel@0 {
+		/* compatible will be set in board dts */
+		reg = <0>;
+		enable-gpios = <&pio 45 0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_pins_default>;
+		avdd-supply = <&ppvarn_lcd>;
+		avee-supply = <&ppvarp_lcd>;
+		pp1800-supply = <&pp1800_lcd>;
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
@@ -547,6 +576,14 @@ pins_clk {
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
2.30.0.284.gd98b1dd5eaa7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
