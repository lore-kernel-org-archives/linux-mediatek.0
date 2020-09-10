Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82D2DC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:43:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF1E7206D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 08:43:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j4wCsfL6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OYY2o8e4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF1E7206D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ut14fRq77Zpwrqttod5RuegwAaotzy8dn16m18shXSQ=; b=j4wCsfL6F4wb3+kHzX510fKD3
	SG2ihdhgJkcBOTb+xG+8UrHqtDFCouVx8lLHEPoDZBxpObXRy8ZKFVR73Zx47AmeEY/DFygG4J9Wu
	YxKNUZRZtDGLLLbZ/BCyXuF4eV4QKfCyPzXzZqhSUorEDLwssCq43QMChJk/Nwfyk+1NY/Dj0AKiz
	zmw7sgG1xOZXUIImItXMRpZxqNLE2VEhiQ0ndPYqZyMkNQzhFyMchc38XgcZVUgo2zJV9lod1fkL1
	d9nRQgJReAAVKnB9DWcm2j0INPSMzrO2hVojsDG6zHYHA6jdQc8eKA88s4rDUiAFwUMKIrU+7CVKy
	BSGaus0iA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGIAu-0000Np-AK; Thu, 10 Sep 2020 08:43:24 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGIAm-0000Kt-Nk
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 08:43:18 +0000
Received: by mail-pg1-x542.google.com with SMTP id w186so3866809pgb.8
 for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2020 01:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=at8Lpvb6ZG+uuZ2zkY59uCTG2IZirlY/86zTFsOHQQ0=;
 b=OYY2o8e4CsppjSNiU2YO845RlYgH0tMoejqblRDnxLZA6lRQMhtxjsu5YaPOVhDeej
 evNxHdOKwtC7K6+cZlbGxQkM+P8ecy1CD3+rieQvYMOftEZm/q0C0azussAbkNBRGzZB
 kuOdC0yJUsq5GcBAjNodBB/2jyLOcpjtxXX+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=at8Lpvb6ZG+uuZ2zkY59uCTG2IZirlY/86zTFsOHQQ0=;
 b=b1LCAO+eq2OX0YC/TAQZrUfNvotfyCarIKf16XMuOy4PcUBHAh26kY1EWbq3m/7F/d
 I+S3BwRxHXiOEBFn/4zRrJ8Owp9kXlm1A0BK3f61hjTYrYzI85CvzaCXnHQMUID+LbQ6
 MnjulfxFxt1y/dnk+8Xkop1Lc4M6OUBk0Ft09jUVnikfWR8Gb8J5vEN/YHSD+qhq+LPE
 UtpHa9/dQfL3Pj1EQvzdU/kkqLcW7+Mkf0k2sBAyWmxygatqB/fIEFx20MeE3n6va52K
 pHUEFiTubGqBr7LfDMaZOPIqnGJgESzzN0MngwjHo5MdHQdJaPs/aNuncYq0uIcjB/rj
 yAtQ==
X-Gm-Message-State: AOAM533OcuRJhFGCBow6zN/u65d3UxVPOZS8fggBu1YxG8K5WV7uCOs+
 CbV/ifyJM/7XSVkQIi0a+sUGTHqA0U0R8H7a
X-Google-Smtp-Source: ABdhPJy4i66YtpnY+rXnse34jMAcOef11wf8p8b69pJSqZSLJMzUeBVe0lcNCyOzSjqX1DdmFTLv3g==
X-Received: by 2002:a05:6a00:1507:b029:13e:d13d:a13c with SMTP id
 q7-20020a056a001507b029013ed13da13cmr4433394pfu.36.1599727394748; 
 Thu, 10 Sep 2020 01:43:14 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id x29sm4357645pga.23.2020.09.10.01.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:43:14 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/2] arm64: dts: mt8183: Set uart to mmio32 iotype
Date: Thu, 10 Sep 2020 16:43:04 +0800
Message-Id: <20200910084304.3429494-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
In-Reply-To: <20200910084304.3429494-1-hsinyi@chromium.org>
References: <20200910084304.3429494-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_044316_849255_D3791E3E 
X-CRM114-Status: GOOD (  11.03  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Set uart iotype to mmio32 to make earlycon work with stdout-path.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 102105871db25..0bda97f912789 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -374,6 +374,8 @@ uart0: serial@11002000 {
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART0>;
 			clock-names = "baud", "bus";
+			reg-io-width = <4>;
+			reg-shift = <2>;
 			status = "disabled";
 		};
 
@@ -384,6 +386,8 @@ uart1: serial@11003000 {
 			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART1>;
 			clock-names = "baud", "bus";
+			reg-io-width = <4>;
+			reg-shift = <2>;
 			status = "disabled";
 		};
 
@@ -394,6 +398,8 @@ uart2: serial@11004000 {
 			interrupts = <GIC_SPI 93 IRQ_TYPE_LEVEL_LOW>;
 			clocks = <&clk26m>, <&infracfg CLK_INFRA_UART2>;
 			clock-names = "baud", "bus";
+			reg-io-width = <4>;
+			reg-shift = <2>;
 			status = "disabled";
 		};
 
-- 
2.28.0.526.ge36021eeef-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
