Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B5DC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 02:43:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C517608FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 02:43:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C517608FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GAIZiyEoF+w4BwzfXQHevkROQ+7/88onOm/M2vzAP7U=; b=gJBxFe8TMtTuRKk2YEDsV8CB7X
	am4sGIW1Yf509RxRLbpGycMExHJLdYF+C3BGMShMlKh2eMLhNI4cc9aQdnIVfE2yjAVajdo3ZWksN
	gieb3abTAnB90UGtICgfSUAGMomOkzwJ7nk0zwgPgZ7zlsjRrycGSLC+Js3dGNy1cjST+ScatKQAq
	YaKIhucgZMS3PClgrDYAhmCF4GZcog3bdtX2GVHRxlVdRCU0pu1Izi+KVI7tFw25fgnn5gpLVODAd
	aTOEJx3hxpb2sF0xpe0sytzqWJ/Ga/5EsvviZrNtAID/Jxs7JJSozFeOlTgYBocVlyWFrq8TgLvgZ
	kkcFtr7w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYgLh-00B0Rv-8v; Tue, 20 Apr 2021 02:42:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYgLS-00B0Qs-3k; Tue, 20 Apr 2021 02:42:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=vgiP4tU1wMC+CJHD44H3YeER60YK9xQvr6oaVCV9rsk=; b=LprkJzQkkHLDt4Zs2HHLp7Tfjq
 pZlMaNvpJsRWrZrpRSqYtlB8mw1oDuaj9H1J45FGBVf3erLzbAPyHFGQRorHCC7cK9tt5Tz9OvoEA
 YYpNJLdRlJE/FvQji3/EvX6yMDQELhSX9kRlG9sZIT5d5vVSqmnDvKWHeD6ybyPZ3ylyuE1qg1Co8
 PX7YUxOCWVwb+s5YLHpeKwtfH7L0IRrHgbcp/QqOZT/fbNPz5fnj8Is3fdEkJUAz6Tbiyt76ob3+A
 R88RnNoc/PBVkkl9QeEKRdaXNmr6RDbHnfgNcUf/jHJLPuyphTGI8E+Vw4RN9lQhJQaNHKsAC/oRv
 nB/ka0oQ==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYgLM-00Bm6w-CX; Tue, 20 Apr 2021 02:42:31 +0000
Received: by mail-pj1-x102e.google.com with SMTP id nk8so5873202pjb.3;
 Mon, 19 Apr 2021 19:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vgiP4tU1wMC+CJHD44H3YeER60YK9xQvr6oaVCV9rsk=;
 b=QtuEPPD86//F655qiNYQxqN77KSntpKAIoqm+zg7u8dEv59YucwUoWk50Ycz9UEOIU
 35qPSGeWHH20Wi9d7+zUVBzXypizz061qNme/S0Xq1AFJYbnck8Zm/yTzXYnPNny+Q3e
 DwNy6oK+gTWVt35aPEaGxhrYGHrCC5VApEuxlca0RBK7WUmsPytYN7EDJ9s4quA06rYm
 W1pHE3bFU3KqpuzgnsT2TyH6fbu+3wbPNGRh98lsVBEWkIp8bNnypiOwbtaO46qXfUPQ
 exgB6eMBvn7+P7vk3U0K3t4idUUwL2Lve3/4NW8JSRzDswwzCJEVeLb/iz5DhfDJe0um
 WdFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vgiP4tU1wMC+CJHD44H3YeER60YK9xQvr6oaVCV9rsk=;
 b=IZnsB/X+kUD1D9U+5KnKGR9gyjd+aeUF3QL7bZCSSHwEe0dUpZptfx+EwpLXwCMZ4e
 cebhPh5A+M4LULVzQrdZxAyhP16j+LoSDmgGABWsPjaJIrH+6jFcirFu4lEN2lyLyryA
 lS1/RZGVgll+mrkSG2hzwq//5Z6cqp1haWHDYDDZ+02zU44UH2NZk1zz2rtJUHj0M8f8
 rx32V/xsR/oZ7bSg64WfvJwWBEEyOCxZKWUKU/1xR6b+677b5hddmr4JvKV9JACKLGIZ
 oNUOWivhDT9z0dE7Y+rmBqS65pZ1CO4Wp4IYsov32LIEun7qu4PQOS+tH5Q8a4CRtrCi
 KRGw==
X-Gm-Message-State: AOAM530z2oEUwhiUiwuYx5MigP/WEc2g1bhPL1m3ycxAnHpcGKWembHd
 I4D8e3q/8X+1fKbyCxqQazo=
X-Google-Smtp-Source: ABdhPJynt95tAQkz/zKdCFlqeduCsz1O5bigcmXEvuBhGdtCg+rJ3gupItvL6kCVf0/q8AYmGmPNrA==
X-Received: by 2002:a17:90a:b398:: with SMTP id
 e24mr2417117pjr.141.1618886547546; 
 Mon, 19 Apr 2021 19:42:27 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id 14sm13524425pfi.145.2021.04.19.19.42.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 19:42:27 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 John Crispin <john@phrozen.org>
Subject: [PATCH] dt-bindings: net: mediatek/ralink: remove unused bindings
Date: Mon, 19 Apr 2021 19:42:22 -0700
Message-Id: <20210420024222.101615-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_194228_465485_FD5C4EB2 
X-CRM114-Status: GOOD (  16.21  )
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

Revert commit 663148e48a66 ("Documentation: DT: net: add docs for
ralink/mediatek SoC ethernet binding")

No in-tree drivers use the compatible strings present in these bindings,
and some have been superseded by DSA-capable mtk_eth_soc driver, so
remove these obsolete bindings.

Cc: John Crispin <john@phrozen.org>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 .../bindings/net/mediatek,mt7620-gsw.txt      | 24 --------
 .../bindings/net/ralink,rt2880-net.txt        | 59 -------------------
 .../bindings/net/ralink,rt3050-esw.txt        | 30 ----------
 3 files changed, 113 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt
 delete mode 100644 Documentation/devicetree/bindings/net/ralink,rt2880-net.txt
 delete mode 100644 Documentation/devicetree/bindings/net/ralink,rt3050-esw.txt

diff --git a/Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt b/Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt
deleted file mode 100644
index 358fed2fab43..000000000000
--- a/Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Mediatek Gigabit Switch
-=======================
-
-The mediatek gigabit switch can be found on Mediatek SoCs (mt7620, mt7621).
-
-Required properties:
-- compatible: Should be "mediatek,mt7620-gsw" or "mediatek,mt7621-gsw"
-- reg: Address and length of the register set for the device
-- interrupts: Should contain the gigabit switches interrupt
-- resets: Should contain the gigabit switches resets
-- reset-names: Should contain the reset names "gsw"
-
-Example:
-
-gsw@10110000 {
-	compatible = "ralink,mt7620-gsw";
-	reg = <0x10110000 8000>;
-
-	resets = <&rstctrl 23>;
-	reset-names = "gsw";
-
-	interrupt-parent = <&intc>;
-	interrupts = <17>;
-};
diff --git a/Documentation/devicetree/bindings/net/ralink,rt2880-net.txt b/Documentation/devicetree/bindings/net/ralink,rt2880-net.txt
deleted file mode 100644
index 9fe1a0a22e44..000000000000
--- a/Documentation/devicetree/bindings/net/ralink,rt2880-net.txt
+++ /dev/null
@@ -1,59 +0,0 @@
-Ralink Frame Engine Ethernet controller
-=======================================
-
-The Ralink frame engine ethernet controller can be found on Ralink and
-Mediatek SoCs (RT288x, RT3x5x, RT366x, RT388x, rt5350, mt7620, mt7621, mt76x8).
-
-Depending on the SoC, there is a number of ports connected to the CPU port
-directly and/or via a (gigabit-)switch.
-
-* Ethernet controller node
-
-Required properties:
-- compatible: Should be one of "ralink,rt2880-eth", "ralink,rt3050-eth",
-  "ralink,rt3050-eth", "ralink,rt3883-eth", "ralink,rt5350-eth",
-  "mediatek,mt7620-eth", "mediatek,mt7621-eth"
-- reg: Address and length of the register set for the device
-- interrupts: Should contain the frame engines interrupt
-- resets: Should contain the frame engines resets
-- reset-names: Should contain the reset names "fe". If a switch is present
-  "esw" is also required.
-
-
-* Ethernet port node
-
-Required properties:
-- compatible: Should be "ralink,eth-port"
-- reg: The number of the physical port
-- phy-handle: reference to the node describing the phy
-
-Example:
-
-mdio-bus {
-	...
-	phy0: ethernet-phy@0 {
-		phy-mode = "mii";
-		reg = <0>;
-	};
-};
-
-ethernet@400000 {
-	compatible = "ralink,rt2880-eth";
-	reg = <0x00400000 10000>;
-
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	resets = <&rstctrl 18>;
-	reset-names = "fe";
-
-	interrupt-parent = <&cpuintc>;
-	interrupts = <5>;
-
-	port@0 {
-		compatible = "ralink,eth-port";
-		reg = <0>;
-		phy-handle = <&phy0>;
-	};
-
-};
diff --git a/Documentation/devicetree/bindings/net/ralink,rt3050-esw.txt b/Documentation/devicetree/bindings/net/ralink,rt3050-esw.txt
deleted file mode 100644
index 87e315856efa..000000000000
--- a/Documentation/devicetree/bindings/net/ralink,rt3050-esw.txt
+++ /dev/null
@@ -1,30 +0,0 @@
-Ralink Fast Ethernet Embedded Switch
-====================================
-
-The ralink fast ethernet embedded switch can be found on Ralink and Mediatek
-SoCs (RT3x5x, RT5350, MT76x8).
-
-Required properties:
-- compatible: Should be "ralink,rt3050-esw"
-- reg: Address and length of the register set for the device
-- interrupts: Should contain the embedded switches interrupt
-- resets: Should contain the embedded switches resets
-- reset-names: Should contain the reset names "esw"
-
-Optional properties:
-- ralink,portmap: can be used to choose if the default switch setup is
-  llllw or wllll
-- ralink,led_polarity: override the active high/low settings of the leds
-
-Example:
-
-esw@10110000 {
-	compatible = "ralink,rt3050-esw";
-	reg = <0x10110000 8000>;
-
-	resets = <&rstctrl 23>;
-	reset-names = "esw";
-
-	interrupt-parent = <&intc>;
-	interrupts = <17>;
-};
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
