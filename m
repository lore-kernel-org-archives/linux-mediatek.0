Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62173D1625C
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Oct 2024 12:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qM+fK9ga/ZCw4199bv1V/rTffcVs0A/cmY5CAFr87Ps=; b=jbWkq+rUJPMGB4
	AV89TwXwe1Q5lloEPL3vCl46TjZna+WS3gV/Msu/mJn+y5y29aU2/sPBxwJOYyj1yxUX0Zd2climX
	CTcdpZTYr3kqH1WdIz8CfVHqpnaE4Grv1N/mMWL/ai2Ed2WP1ALidUlh1g8mh4JLe5kfucwIxaxDy
	+rHDDVpFn7Leu2/r73ZTCoijVG5FO8r3QH4JqBuMREhOuPSzK3mPNOBj43NHK9rDcBrHo8RuA+4uA
	ezcsQqWYxHasKVjJWaZVEFj4iCI9wqpaB7u9af/w1aYNGfTZ2s62T4W5cglNL6XYh7EEN8QM1F3kF
	8ecGD3ZoWLIrIcMTpCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KWF-000000058uc-0BYX;
	Mon, 14 Oct 2024 12:49:51 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Iz9-00000004rUw-0gW4
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Oct 2024 11:11:36 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-20c693b68f5so41509905ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Oct 2024 04:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728904294; x=1729509094; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qM+fK9ga/ZCw4199bv1V/rTffcVs0A/cmY5CAFr87Ps=;
        b=g24ZdFe7J9BeXzLXO8XDwiKEqTZ77a3CpAeKNl4x0yzpvs6qwB3nKdSigGZUsu8szP
         HJP1fey69cVCD73nHuWSsH5Xn9/RfjOJUFJ+NYhzRwzpcoCkTkdf+UK5WeWK6yH94Fl0
         oTl1qR0AVoqF8lv4g75I/CyK5W5htKbsxb9G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728904294; x=1729509094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qM+fK9ga/ZCw4199bv1V/rTffcVs0A/cmY5CAFr87Ps=;
        b=a6/2EyvBBmkAFTdhve63LiC7Lt7AkgL1E2KUivRRevAvM+V4ZhqZyDdqfNJ7PTlElE
         JPc+GqrRD+5C4N/lC8snZ6xtdIZ21uEY8LA1qn9xznYe44dshxBK5dINzibPng+S8l+D
         JTBUS8n6d7l8hKvYjGuTejViJI/W4qH0sSQ/5NrCM+VyXeR+vBxl46dc4hOYF1EI+Cug
         mOaPtB7czo8hVG4161rVYiJzRcvVEfy0RAj/XVgszyV6Rqbgl1DMRHqI5jaE9obfbA5r
         chzLzpjk1FZL0HG0Zn0z3okbLObglK0KK9/LMWTOm8CFwbAJL6d1jWfVsE6OxBYpQQW4
         2AFA==
X-Forwarded-Encrypted: i=1; AJvYcCUKajnVlaG0UO8BzYX2GQ/LY0jEI4/yTwHd62Rv/8DMy0FyaMjt5v3U7mbjWUaCFHGZn1hO9vqcTkZyx9VR/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYcv+2d9gBdWcDdIHvZDb5of+Iu+dA52S+73cYhULazh9h6agU
	kPqMW5JroPwEXHdh+gcZB3TIu3MuII4pe0kwEXPQZymJqDxfnPIZYbb3Nvhksg==
X-Google-Smtp-Source: AGHT+IEeEisqcQCdXNiVjcOQ+BHrMtM1QdZ/7Za8z2Evnw/ptJzlad0MSeVia4oonsqJp6idxrY6sw==
X-Received: by 2002:a17:902:e5ca:b0:20c:8839:c515 with SMTP id d9443c01a7336-20ca16c5a89mr173798755ad.56.1728904294697;
        Mon, 14 Oct 2024 04:11:34 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:4907:d52a:1a1a:58d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bc3e6fcsm63858285ad.118.2024.10.14.04.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:11:34 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 8/9] arm64: dts: mediatek: mt8188: Add DP-INTF nodes
Date: Mon, 14 Oct 2024 19:09:30 +0800
Message-ID: <20241014111053.2294519-9-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241014111053.2294519-1-fshao@chromium.org>
References: <20241014111053.2294519-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_041135_225497_C6241641 
X-CRM114-Status: UNSURE (   8.91  )
X-CRM114-Notice: Please train this message.
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add the primary and secondary dp-intf nodes.
These DP-INTF hardware IPs are the sink of the vdosys0 and vdosys1
display pipelines for the internal and external displays, respectively.

Individual board device tree should enable the nodes and connect input
and output ports as needed.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 26 ++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 3345a2adc0fe..6f5727f05255 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -24,6 +24,8 @@ / {
 	#size-cells = <2>;
 
 	aliases {
+		dp-intf0 = &dp_intf0;
+		dp-intf1 = &dp_intf1;
 		ethdr0 = &ethdr0;
 		gce0 = &gce0;
 		gce1 = &gce1;
@@ -2475,6 +2477,18 @@ disp_dsi1: dsi@1c012000 {
 			status = "disabled";
 		};
 
+		dp_intf0: dp-intf@1c015000 {
+			compatible = "mediatek,mt8188-dp-intf";
+			reg = <0 0x1c015000 0 0x1000>;
+			clocks = <&vdosys0 CLK_VDO0_DP_INTF0_DP_INTF>,
+				 <&vdosys0 CLK_VDO0_DP_INTF0>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL1>;
+			clock-names = "pixel", "engine", "pll";
+			interrupts = <GIC_SPI 657 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS0>;
+			status = "disabled";
+		};
+
 		mutex0: mutex@1c016000 {
 			compatible = "mediatek,mt8188-disp-mutex";
 			reg = <0 0x1c016000 0 0x1000>;
@@ -2740,6 +2754,18 @@ merge5: merge@1c110000 {
 			mediatek,merge-fifo-en;
 		};
 
+		dp_intf1: dp-intf@1c113000 {
+			compatible = "mediatek,mt8188-dp-intf";
+			reg = <0 0x1c113000 0 0x1000>;
+			clocks = <&vdosys1 CLK_VDO1_DPINTF>,
+				 <&vdosys1 CLK_VDO1_DP_INTF0_MMCK>,
+				 <&apmixedsys CLK_APMIXED_TVDPLL2>;
+			clock-names = "pixel", "engine", "pll";
+			interrupts = <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH 0>;
+			power-domains = <&spm MT8188_POWER_DOMAIN_VDOSYS1>;
+			status = "disabled";
+		};
+
 		ethdr0: ethdr@1c114000 {
 			compatible = "mediatek,mt8188-disp-ethdr", "mediatek,mt8195-disp-ethdr";
 			reg = <0 0x1c114000 0 0x1000>,
-- 
2.47.0.rc1.288.g06298d1525-goog


