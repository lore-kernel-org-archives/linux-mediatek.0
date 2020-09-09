Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B952C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:14:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF3A42087C
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:14:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wBfF5mAB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Gop3FjV/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF3A42087C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PPhDA2UfYi0KcoiTDtr8ciwLI/doMXVirLLHy+MWgh4=; b=wBfF5mABI/HWD6QaMamQjzH5mN
	T7vVxEcknmKMOSkDfpjPFPMQkg7BxFfV/Sm+dMOPs4D6d79VWDDcYRinMmIawKoy4D8u4QDHf+y1Z
	bmIECIXT1iJFUCIGgnpfQ5t1WzLQ1uTyITNMb8reuZP743A5UfZDH0DbvqmnfTpHJ8Jjs4AEWZHip
	mNgRWNXyTIAuX8/aseUJJ0ymVdgjNs8FYy5xvv2GRdeu+2qYaMJXg4Py99lWx6I6POsRvXBI0rD5X
	pB/tnT1idP2+sKS43PJXmfSmGqmFG1SURwWCWHWcYf3+jOeOJHJheRArSa054tTrfkZqlV0hNW5tg
	vw+jwx4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFvFS-0003l0-Go; Wed, 09 Sep 2020 08:14:34 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFvFO-0003k1-7K
 for linux-mediatek@lists.infradead.org; Wed, 09 Sep 2020 08:14:31 +0000
Received: by mail-pj1-x1044.google.com with SMTP id b17so972609pji.1
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2020 01:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3oz9E+wONrzUTZU79l0WpeVQcrmJpZqKnrl07vYkL+g=;
 b=Gop3FjV/+uMnAIYjTwuHk9mfpqIV/1ElZWNwys1AKUXB331HpDTbOHFEjvVlklQ6ah
 voPmW3BE/2PUFLx6vbWSATCv3K1L3QieKXr5JeKT8/Po1PwEJ5f/MQMF1P0K6dlDrc5T
 giu1rWaAaVgB8fNtx5gNRj/r/iRP2f5YRFBKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3oz9E+wONrzUTZU79l0WpeVQcrmJpZqKnrl07vYkL+g=;
 b=Z2fXfRBhpgC/6SguMjfEumGoVww//sNxtAKM93x115MEZMJW5yDikvrlL14jYtHWhk
 eLBCCON+Hza/uyDCJpR6/RQ3hBu0NRGfkDG0Pzh3VEA2VVkHQwKqDL2R4RFmbKo8xNkI
 q9h+PTQ0roV4TGuwhQk4T8wX0hwelsYyIoo7/WKuQUMbQcTKCPUvlE/B+wr2mpbL4goQ
 JHsa0d3LDzpvv85y5nkiI3pJJsatE1W9medP9vksNOaE/VZC5ZTylbPtEjiiGJYsrSrB
 pLasUAOFbY3dj2RH+Jbpz5iFnXL/FtcyCJwGn2DWvJIaB46Nwe8emQ+ZrWK775E1sRs/
 vi/A==
X-Gm-Message-State: AOAM533HOuLKZJ+WE6+HhbXvezwcu805Q+l29ut54ozhU0GJ3ZB8Rk99
 7yEgjBaSavofCVIuIxuJ7hatNg==
X-Google-Smtp-Source: ABdhPJwg6B7l65a9hELb6cekXm4yKt+0iW4AaOGJbjBziTTzDb99jUePR+aVNG3qQVxLlAFSRquzNQ==
X-Received: by 2002:a17:90a:b64:: with SMTP id 91mr2530834pjq.93.1599639267650; 
 Wed, 09 Sep 2020 01:14:27 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id s9sm1439672pgm.40.2020.09.09.01.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 01:14:27 -0700 (PDT)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH v2] arm64: dts: mt8183-kukui: add scp node
Date: Wed,  9 Sep 2020 16:14:22 +0800
Message-Id: <20200909081422.2412795-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_041430_345060_BF5C23B4 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Erin Lo <erin.lo@mediatek.com>,
 open list <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add scp node to mt8183-kukui

Fixes: 0d5e41709f76 ("arm64: dts: mt8183: add scp node")
Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
---

Change since v1:
* Add Fixes tag.

---
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index f0a070535b34..85f7c33ba446 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -90,6 +90,18 @@ pp3300_alw: regulator6 {
 		regulator-max-microvolt = <3300000>;
 	};
 
+	reserved_memory: reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		scp_mem_reserved: scp_mem_region {
+			compatible = "shared-dma-pool";
+			reg = <0 0x50000000 0 0x2900000>;
+			no-map;
+		};
+	};
+
 	max98357a: codec0 {
 		compatible = "maxim,max98357a";
 		sdmode-gpios = <&pio 175 0>;
@@ -524,6 +536,13 @@ pins_clk {
 		};
 	};
 
+	scp_pins: scp {
+		pins_scp_uart {
+			pinmux = <PINMUX_GPIO110__FUNC_TP_URXD1_AO>,
+				 <PINMUX_GPIO112__FUNC_TP_UTXD1_AO>;
+		};
+	};
+
 	spi0_pins: spi0 {
 		pins_spi{
 			pinmux = <PINMUX_GPIO85__FUNC_SPI0_MI>,
@@ -651,6 +670,17 @@ pins_wifi_wakeup {
 	};
 };
 
+&scp {
+	status = "okay";
+	pinctrl-names = "default";
+	pinctrl-0 = <&scp_pins>;
+
+	cros_ec {
+		compatible = "google,cros-ec-rpmsg";
+		mtk,rpmsg-name = "cros-ec-rpmsg";
+	};
+};
+
 &soc_data {
 	status = "okay";
 };
-- 
2.28.0.526.ge36021eeef-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
