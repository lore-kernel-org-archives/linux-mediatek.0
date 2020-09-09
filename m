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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F856C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:06:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1530C20758
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:06:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tl8VzLsY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jbdhf4gH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1530C20758
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/teZl67XqjzAJg7kDGpbPiMwiXBwtRyCk0l13lGsqWY=; b=tl8VzLsY//10o1R7irjON2qe/j
	d3NZvDgjBDFnJHmdanhMkj/O7vn6AY0sL9rzmfQfTCAYSIM5ykG8PKZnbvwiNZ2sU208yQkoVeryk
	R/aVWrhj3FdrkC9dPwE73/DTjpa/VT0qkytUmk+WFZwW6Q64aMLafAxjysNr+H+UMt6w/pyWbHju5
	OkN/w2GWntlWpej9WicU09dJXQdf1TOow8cYVNKoNjZ0kGFAQotR//2WVpGUnzQNxXp3bg2BgwYV/
	8zO1YrjxZ7weYIVEuh+hU9N7Xge5XhYK4W00qW+OOY0G6OfnjK2VypdoeSD4+KJXD95t9hfssttt5
	2Uw58XtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFv7O-0002wz-Fp; Wed, 09 Sep 2020 08:06:14 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFv7M-0002wC-HB
 for linux-mediatek@lists.infradead.org; Wed, 09 Sep 2020 08:06:13 +0000
Received: by mail-pg1-x542.google.com with SMTP id m5so1490969pgj.9
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2020 01:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jVlYlbWkozbz0sLJ6S/+BIlF4v5FRp4qwtHLHAvdMQ8=;
 b=Jbdhf4gHp3pe7ZAg6MfN+hmU7XutrDtvHYeWgzZC69kwrslIzxW3C5cjPf9rdszvVs
 IlpM/YR2tNGDZg3yTGtyhT7TFvneCjyhGgODs4OAECJ+6GHWMFzU+tbdmCPJtFaUGmnq
 1aG+i5wU/AK9VW/a8k5N6GsGYvM5QgSw6ixoM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jVlYlbWkozbz0sLJ6S/+BIlF4v5FRp4qwtHLHAvdMQ8=;
 b=dtM3z5gGjDNS0CcKQDS85avJZN4kQwVIeYOYNevlBLllwvtGKJlsVNmhYRr444FAey
 4GVZ5aPvOyWKOxsNBqPwFY+BitlYiyBHkm4Z/5QGAcnTnl1JWwm4916AoF+tWBwck7WO
 QMgPo9StbceFDIzVcRucS/R/hvZIdYaaWoTEreaJw7b3JCs69K3BjxZ7KSlsqqg0b+Ri
 m4mcXgq1CAZVo8A3fPN9Cl/ffBhxZ1UEkPAvhsN3KTb/Y/48POHor6KX4ne53QcxaBGG
 ZNJrwAKTvrMPj/cZA5e6Dowp9q1f1n6RT7OF/KoEjbUS+UbREGQYiqM2h9ea5XULFzU3
 u/Nw==
X-Gm-Message-State: AOAM530ALHyleR246uUC0bzbLl5A5XkcOk0jwfH+Oi3NZxl8LtlfLfjH
 3xjWD8D+4aCm2zDPPNoY98QLJg==
X-Google-Smtp-Source: ABdhPJzwx8jiPPdem7eCjQdoXrfB3KZxZs1HdZ8y27DOvo/H7K6FuYkhAgGi5eOJxtphcwcCI89QLA==
X-Received: by 2002:a63:5c66:: with SMTP id n38mr2053035pgm.217.1599638768656; 
 Wed, 09 Sep 2020 01:06:08 -0700 (PDT)
Received: from kafuu-chino.c.googlers.com.com
 (105.219.229.35.bc.googleusercontent.com. [35.229.219.105])
 by smtp.googlemail.com with ESMTPSA id d8sm1260489pjs.47.2020.09.09.01.06.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 01:06:08 -0700 (PDT)
From: Pi-Hsun Shih <pihsun@chromium.org>
To: 
Subject: [PATCH] arm64: dts: mt8183-kukui: add scp node
Date: Wed,  9 Sep 2020 16:05:58 +0800
Message-Id: <20200909080558.2409470-1-pihsun@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_040612_637485_1DA4E53E 
X-CRM114-Status: GOOD (  10.18  )
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
 <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add scp node to mt8183-kukui

Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
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
