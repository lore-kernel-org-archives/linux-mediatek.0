Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E30C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 May 2022 04:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WISxUYy13RvL/G3ApyCUObIPO0AHP9ByCNguNrggaZc=; b=MoN3eoKycYwRz8
	UfLmDPWocqEeLoB+E9lmh4VcUxPXN9zl6pc/6ewlw71R4r/xgoqsCgDeThXZqWGnoV/S7ItKpgDp0
	RGGE1kAorjnDzsqzX4D2HY66RDXQ1WII0Rwb1mhsNQ6OuixE+bBlcyv5XPJQW+p1Loi1o/+kzszr3
	wDz75nvmzG4aL0FSpkcKhRlwovcsl2kF4gY3ODN5YfWEd8JXDNl6pxlM8Y0HAS5ShGMssXHpndjk/
	IK5BUzArygZn8o8VTc41sobbo9NTZAkC6GIL8BivieedFN16dgJv55Ht28Xz6P4Q0+lytoD6yDVU6
	zjYOWL0C+EJwEw7ba7Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuRzF-00Gcle-3L; Fri, 27 May 2022 04:54:09 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuRzD-00GckO-4d
	for linux-mediatek@lists.infradead.org; Fri, 27 May 2022 04:54:08 +0000
Received: by mail-pj1-x102b.google.com with SMTP id o10-20020a17090a4e8a00b001df2fcdc165so6187291pjh.0
        for <linux-mediatek@lists.infradead.org>; Thu, 26 May 2022 21:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ah0qq/44qu92lJrc/9Ym0VrmRbzTW6DXhcFw2aQA3A0=;
        b=CjLcfK30sB5zIjoOt9r3bEp/4Um7vtJFS3CPwj0l2PJ/Vt34aB2/ye5F8QCCwprSeq
         vjImnF/O+DCNYpvS4T2OSYWhJoPC8vFAIeCofmQq3HmnlayjUG3xVq8hHF+mU4+TxGfe
         r3aE6dZBTgs7+puwSYJJSQsM0jslNNP/QPMvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ah0qq/44qu92lJrc/9Ym0VrmRbzTW6DXhcFw2aQA3A0=;
        b=kjjSQje/5Z9CFMVFJRizsTxayvmaowZvYi1XDFOXYygVsy0gpYjfqxnvH2Lv5qB+TT
         KO+RNSoUp34T3fXp5qlcND9OcC7A2seQ0Y2L89KZIOpr594krDOLxZF3uQz/HevYSkZR
         kT8h8uO5mA5jdbnHTkfIhObZOyJ1I5eCwFmLPsJVWVrJ3BRqiPLK0nldT8+rJLA0cbYj
         7cTcqKVWAA2HfayYNB7mgG8kdTfPv9jiJU+OQodLw/kchLbSNICj+HjfLwvKmgQep70V
         oYEgpe1wkIo0JHEik/ctjlknZCtCj+NhCVicA/8UKsYculHV0tfDumRs4WVRbyBmySEb
         Y6Yg==
X-Gm-Message-State: AOAM533Mn8UoxKzWW/iLjovNDv53N6V9b9XSQfcyKwtNCu4iTO6nCIHL
	LxlflazrrqhhkEopALdoyolg5w==
X-Google-Smtp-Source: ABdhPJyQaVNSreDjoLxy1z7jBdXbXPN06DmgzqzQXFXxZBEMuheWNL6LT0VtrAIIdHBerUVhfbR8JA==
X-Received: by 2002:a17:902:ebd1:b0:162:224f:abbb with SMTP id p17-20020a170902ebd100b00162224fabbbmr23874766plg.160.1653627245309;
        Thu, 26 May 2022 21:54:05 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com ([2401:fa00:1:10:6eff:2f2b:6d21:12b])
        by smtp.gmail.com with ESMTPSA id l184-20020a6391c1000000b003c14af505fbsm2398481pge.19.2022.05.26.21.54.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 21:54:04 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mt8183: kukui: Split out keyboard node and describe detachables
Date: Fri, 27 May 2022 12:53:54 +0800
Message-Id: <20220527045353.2483042-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.36.1.124.g0e6072fb45-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_215407_228841_AEA86F97 
X-CRM114-Status: GOOD (  11.24  )
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

Kukui devices krane, kodana, and kakadu use detachable keyboards, which
only have switches to be registered.

Change the keyboard node's compatible of those boards to the newly
introduced "google,cros-ec-keyb-switches", which won't include matrix
properties.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi  | 6 ++++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi  | 6 ++++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi   | 6 ++++++
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi         | 1 -
 5 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index 2d7a193272ae..981c889a22ea 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -4,6 +4,8 @@
  */
 
 #include "mt8183-kukui.dtsi"
+/* Must come after mt8183-kukui.dtsi to modify cros_ec */
+#include <arm/cros-ec-keyboard.dtsi>
 
 / {
 	panel: panel {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
index 28966a65391b..4b419623c8dc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
@@ -372,6 +372,12 @@ pen_eject {
 	};
 };
 
+&cros_ec {
+	keyboard-controller {
+		compatible = "google,cros-ec-keyb-switches";
+	};
+};
+
 &qca_wifi {
 	qcom,ath10k-calibration-variant = "GO_KAKADU";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
index 06f8c80bf553..4864c39e53a4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
@@ -339,6 +339,12 @@ touch_pin_reset: pin_reset {
 	};
 };
 
+&cros_ec {
+	keyboard-controller {
+		compatible = "google,cros-ec-keyb-switches";
+	};
+};
+
 &qca_wifi {
 	qcom,ath10k-calibration-variant = "GO_KODAMA";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
index a7b0cb3ff7b0..d5f41c6c9881 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
@@ -343,6 +343,12 @@ rst_pin {
 	};
 };
 
+&cros_ec {
+	keyboard-controller {
+		compatible = "google,cros-ec-keyb-switches";
+	};
+};
+
 &qca_wifi {
 	qcom,ath10k-calibration-variant = "LE_Krane";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 8d5bf73a9099..db1388550f98 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -986,5 +986,4 @@ hub@1 {
 	};
 };
 
-#include <arm/cros-ec-keyboard.dtsi>
 #include <arm/cros-ec-sbs.dtsi>
-- 
2.36.1.124.g0e6072fb45-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
