Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC8AC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 13:02:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 087B5206D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 13:02:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n121h+2v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="KTLKPAFf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 087B5206D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t+KKR6MdUw2wttOhr92jNCvClS8Kl0kwPBDpsTIQhcw=; b=n121h+2vKtCGrRtyVQUij47Ht
	LK+7cvSYgO94SM6e+fc4ZVVsd0Mjkw0tSMznBkyBDunYgj1lKaIW5lmFb45fi+0RoeaAxGoJ6dKcf
	e65rxJptKy2XrsuGX6fwGp5JnsBza/51VI+uA0GWZhdAcsJAYqtzkBmfuoBoh3i+ku0F7ku8gNCKX
	anpYvLwJLmuoKTdAW9bJ1ty3AkVaeY4gZghKa/wQE9FQkvd0Fk5ucF4L0+glWsNrhwud+9Tq7l63A
	CTjBT0imViYhzpfF0tAmPZfgKMQES/I/KrTbYIAYKxIhCXY/6cA95ZGC9gG7xwBtU1MpiytSeKizH
	EZuuWRo5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGMDD-0000oO-0q; Thu, 10 Sep 2020 13:02:03 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGMCt-0000g9-Lx
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 13:01:47 +0000
Received: by mail-wr1-x444.google.com with SMTP id c18so6593393wrm.9
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2020 06:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HphHCPdJUs9HEUbW8jhDJPa14fS8feVjDMdm8pwKQX0=;
 b=KTLKPAFfGEgTr2BImp+QKZGVPI0BzcHxU/2gi4Hz4aq6K/0m9lhzMmNEiW8wgtH2iJ
 9mMpJYcT0vvo2wEb5v4jHjlftFwV7dVCl0Mszv4QdLfjxoQJ0psBeF6XCHqyLGq2iJGT
 JG/RiC70ZixTF7vkGxFnCKBHpN8EYdTYJF8mpnSaVEfGQpo/ZvNn6b9KSpmSz6VQkZk8
 hwwQIH7wRd612A+1kyQ9+Wo0SE/5kRVFTC+Feihkv7rQIanO+n8nGntYaPSdmWrgj1MD
 7XrBCFG9+53zppoSdG3GdYpd3G32cYgfKwIU+0XDPXodzaDBsm1YhRNWsnb6pL+LeuLE
 P0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HphHCPdJUs9HEUbW8jhDJPa14fS8feVjDMdm8pwKQX0=;
 b=OuHSjxOPzL20cTWuMPIFAZMEIuglpn9I0pp04zihulKCOwJd7InddTw0cMTccRwa0j
 S8ADrSd8yj81PY2y+DKz7TOljZJRFsNOQY/t6/fc1Z9GaBKj7Cxbqsu277g2Rcx0USbt
 O4fD3lrUVr26TVfCQ/kHCI6bIPgvmwfm8RpBtxv0+r/uI4KrCE9aFXYCqCBoJEclfQMq
 B/fVBS1ODdNhK2WEBJ0uzmBbVZBOn4Ww+vJ3TbS2U/m38THxTio/38OfKbB1Q9xZdrRu
 k1HqX9fnv71TdLxmcaXnoWnWBabC8EKVqziKaF7h44ggdRw6GZk8RuTSivdX8AnOxfIW
 BSRA==
X-Gm-Message-State: AOAM533/H4NUysuUjsGwgW1z7agyZP/W1oresqPnk5BhFXtMlzqODnwt
 F9K9x3Cty74ABNTL9ZngV5jDig==
X-Google-Smtp-Source: ABdhPJxQ/7u8nEM7o5yIM0TqrL9dfyr46k2FRZOHqGju4TlGZTK0gY0DH16yhGiFzt+kO1B2bqgRGQ==
X-Received: by 2002:adf:9f10:: with SMTP id l16mr9460647wrf.77.1599742902740; 
 Thu, 10 Sep 2020 06:01:42 -0700 (PDT)
Received: from alex-xps13.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id y1sm9488269wru.87.2020.09.10.06.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 06:01:41 -0700 (PDT)
From: Alexandre Bailon <abailon@baylibre.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org,
 matthias.bgg@gmail.com, mathieu.poirier@linaro.org
Subject: [PATCH v2 4/4] ARM64: mt8183: Add support of APU to mt8183
Date: Thu, 10 Sep 2020 15:01:48 +0200
Message-Id: <20200910130148.8734-5-abailon@baylibre.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200910130148.8734-1-abailon@baylibre.com>
References: <20200910130148.8734-1-abailon@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_090143_815335_00B4DD94 
X-CRM114-Status: GOOD (  10.96  )
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
Cc: devicetree@vger.kernel.org, stephane.leprovost@mediatek.com,
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 gpain@baylibre.com, linux-mediatek@lists.infradead.org,
 Alexandre Bailon <abailon@baylibre.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This adds the support of APU to mt8183.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 39 ++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index e215f1eb3eb2..28f75452961c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -967,12 +967,51 @@ ipu_adl: syscon@19010000 {
 			#clock-cells = <1>;
 		};
 
+		apu0: apu@0x19100000 {
+			compatible = "mediatek,mt8183-apu";
+			reg = <0 0x19180000 0 0x14000>;
+			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_LOW>;
+
+			iommus = <&iommu M4U_PORT_IMG_IPUO>,
+				 <&iommu M4U_PORT_IMG_IPU3O>,
+				 <&iommu M4U_PORT_IMG_IPUI>;
+
+			clocks = <&ipu_core0 CLK_IPU_CORE0_AXI>,
+				 <&ipu_core0 CLK_IPU_CORE0_IPU>,
+				 <&ipu_core0 CLK_IPU_CORE0_JTAG>;
+
+			clock-names = "axi", "ipu", "jtag";
+
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_VPU_CORE0>;
+			status = "disabled";
+		};
+
 		ipu_core0: syscon@19180000 {
 			compatible = "mediatek,mt8183-ipu_core0", "syscon";
 			reg = <0 0x19180000 0 0x1000>;
 			#clock-cells = <1>;
 		};
 
+		apu1: apu@19200000 {
+			compatible = "mediatek,mt8183-apu";
+			reg = <0 0x19280000 0 0x14000>;
+			interrupts = <GIC_SPI 293 IRQ_TYPE_LEVEL_LOW>;
+
+			iommus = <&iommu M4U_PORT_CAM_IPUO>,
+				 <&iommu M4U_PORT_CAM_IPU2O>,
+				 <&iommu M4U_PORT_CAM_IPU3O>,
+				 <&iommu M4U_PORT_CAM_IPUI>,
+				 <&iommu M4U_PORT_CAM_IPU2I>;
+
+			clocks = <&ipu_core0 CLK_IPU_CORE1_AXI>,
+				 <&ipu_core0 CLK_IPU_CORE1_IPU>,
+				 <&ipu_core0 CLK_IPU_CORE1_JTAG>;
+
+			clock-names = "axi", "ipu", "jtag";
+
+			power-domains = <&scpsys MT8183_POWER_DOMAIN_VPU_CORE1>;
+		};
+
 		ipu_core1: syscon@19280000 {
 			compatible = "mediatek,mt8183-ipu_core1", "syscon";
 			reg = <0 0x19280000 0 0x1000>;
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
