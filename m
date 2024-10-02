Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090D0CF31B4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 11:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R67MOM4KKUTh0qCCt++0T4Ue+lkz0KBhSiql033WWVM=; b=XSbAHslpP/L44M
	LLKg2+R/jZxQy7Yyxv3Dj0K5Kupaqg6h2OtFqWHNGr8p5kdYvi6RaMBhGCo9E40uD17aQESvZkIDA
	QbVBalweqpsQqbk2lII163acILOErnbkK4wHY7vfhZl/d+ZW45b5yYOf9GqmHW2+tIRMKGbkrbrXb
	+Os1QR1UoXx5P7xP/bucdaF29SXsRa10UUPyqHW12VF5AuY3V5v6N8kiGBB0t2/iBcHGeI4vUUCKd
	5fSlKxaiKOXVH+gQxkgyOq405C0DPvQ6G+pJ/o4Nk6XhPLyfho7NVnIZSf38kqWUhH0kMHdFvj1sF
	S8aIw+XjsGU9ttu5hzFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svy0p-00000005kwd-366v;
	Wed, 02 Oct 2024 11:59:23 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svxp4-00000005hyg-0pS4
	for linux-mediatek@lists.infradead.org;
	Wed, 02 Oct 2024 11:47:15 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-71b00a97734so5747631b3a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Oct 2024 04:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727869633; x=1728474433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R67MOM4KKUTh0qCCt++0T4Ue+lkz0KBhSiql033WWVM=;
        b=AeolyXJLdJkdFpAZvJQSVPjcvJcvFGLFGwBQlhLnTuKzENPCEWYdGPbHCrLMfrs0vp
         aaIEYeqC/Uo19sfYYsd/DVad73O5tqHAN3o7MRH3X6stMKgRJS8jMFJpvMcF7qCpazi2
         HzMbj0XDTQvSuduGd6Dgw581lvp8fH6ZmHSF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727869633; x=1728474433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R67MOM4KKUTh0qCCt++0T4Ue+lkz0KBhSiql033WWVM=;
        b=ApKiDdvXXaM9tv2AnWZv3xYq0perxTUm9x45NGJ6ABZvXxrjdo0nFkM7EZGwZZ4XV8
         ynGCImrEAM4u0xzu3mSTASqJNRrviQtxc/sEHn9/OJNTMGwhJ+e2+TfEeY727/7rzlwb
         rZ1y2TmFdhbhm1zapFRzZf6g/sc4fViDnBM6hnUzMe8VuXzJBgoZnKbqGDZJksCADg46
         cONecIVT0k5BpiaiUv7BDb3o9jwJG3A3OdwhpPWubxptXQLvrfDnhslg1xTIRIdIIe6e
         kzQa0CBfDwsQreCMaoFSQ/d7uvded6sEoxMNd1ukPG4+GkNNUwevyY5Ue5Q1ydYkxuMM
         w8yg==
X-Forwarded-Encrypted: i=1; AJvYcCUwFZoLn0wvqN3CKTOGD2CLqd2XlQAg8YOb136vpGjjWSbi4hI8TcuUDp8bQHK7EGVSWpUm/okTUNfgScymcw==@lists.infradead.org
X-Gm-Message-State: AOJu0YweIj+vo3ANNtQjMfZHYrVrEKv5RRxjpNQHuik9SFb2wOR/yw5t
	vMz8OJdHz4sKzTeQrntgXcV6bvGp7+PGR+OGeLbYIKs4rdq3EPHgLqIkVQetyQ==
X-Google-Smtp-Source: AGHT+IG5W5PbB9Dg2pXJwidpYLDnewgtqTRSMPqWMUaOdFMbuHNinBNwjLa/SIhmMYymYMhGikQ+CQ==
X-Received: by 2002:a05:6a00:2349:b0:719:1df4:9d02 with SMTP id d2e1a72fcca58-71dc5d6fab5mr4373727b3a.25.1727869632648;
        Wed, 02 Oct 2024 04:47:12 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:3bd0:d371:4a25:3576])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2652baefsm9639627b3a.180.2024.10.02.04.47.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 04:47:12 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 9/9] arm64: dts: mediatek: mt8188: Add eDP and DP TX nodes
Date: Wed,  2 Oct 2024 19:41:49 +0800
Message-ID: <20241002114614.847553-10-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241002114614.847553-1-fshao@chromium.org>
References: <20241002114614.847553-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241002_044714_264313_CC239B66 
X-CRM114-Status: GOOD (  10.26  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add edp-tx and dp-tx nodes for the Embedded DisplayPort (eDP) and
DisplayPort ports to connect to DP-INTF ports and panels, and add the
efuse cell for the DP calibration data.

Individual board device tree should enable the nodes and connect input
and output ports as needed.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 943333d2567f..67c539e5d146 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -2004,6 +2004,10 @@ efuse: efuse@11f20000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			dp_calib_data: dp-calib@1a0 {
+				reg = <0x1a0 0xc>;
+			};
+
 			lvts_efuse_data1: lvts1-calib@1ac {
 				reg = <0x1ac 0x40>;
 			};
@@ -2850,5 +2854,27 @@ padding7: padding@1c124000 {
 			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
 			mediatek,gce-client-reg = <&gce0 SUBSYS_1c12XXXX 0x4000 0x1000>;
 		};
+
+		edp_tx: edp-tx@1c500000 {
+			compatible = "mediatek,mt8188-edp-tx";
+			reg = <0 0x1c500000 0 0x8000>;
+			interrupts = <GIC_SPI 676 IRQ_TYPE_LEVEL_HIGH 0>;
+			nvmem-cells = <&dp_calib_data>;
+			nvmem-cell-names = "dp_calibration_data";
+			power-domains = <&spm MT8188_POWER_DOMAIN_EDP_TX>;
+			max-linkrate-mhz = <8100>;
+			status = "disabled";
+		};
+
+		dp_tx: dp-tx@1c600000 {
+			compatible = "mediatek,mt8188-dp-tx";
+			reg = <0 0x1c600000 0 0x8000>;
+			interrupts = <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH 0>;
+			nvmem-cells = <&dp_calib_data>;
+			nvmem-cell-names = "dp_calibration_data";
+			power-domains = <&spm MT8188_POWER_DOMAIN_DP_TX>;
+			max-linkrate-mhz = <5400>;
+			status = "disabled";
+		};
 	};
 };
-- 
2.46.1.824.gd892dcdcdd-goog


