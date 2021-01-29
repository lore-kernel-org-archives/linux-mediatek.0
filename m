Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 565C0C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 10:12:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F151564E6A
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 10:12:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F151564E6A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Xggi/OfgCkb7WRg7x4BkRHpRFbvYLKZcwOJFFVYBixc=; b=i7DoR/9pk4zmOnzW8qM0+G42U
	eeQJvd7C3KR6grhVv6RnMTH1//VyuEoeCSiG3YtFTVU+RX9pb1TttZr9UoGztjXshArXdPKWjiagw
	GHHlUbi/jIuI+GqpOkjqCFv2st8ohfOBRVfL3OdBIKZyS3X5lTI8O2iUX1s/s5S3l1WezUtHiK7cz
	/ypYuCQW8O5Z98SckxrB722zvHtstDOiaFJNZtK2e9oTrJgJuSBqls/xEuUVTRQn8nUgpQxyzCVXF
	Yk0B7Uc9unXcTLA94PSQeJIRDwVmmYfvm0h2KhkWsqG9qegHl1Wnf04f7OgwapyCC1xw8teRSa9lq
	Xfk0lXlrQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Qlg-0000o2-GU; Fri, 29 Jan 2021 10:12:44 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5QlL-0000a4-9O
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 10:12:26 +0000
Received: by mail-pl1-x633.google.com with SMTP id u11so4966489plg.13
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Jan 2021 02:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G2FIe0ouBQm/SH+HzRBEb2Y+09MFumg8Mm7fe2VHv4A=;
 b=k/Ws0hiOPxmvtuXVwlpy1CUKdxAkM1NNTC8WquLSAHAX8NK5pf2Q6H7FaSi1sSo4qH
 J3I6x+CbjQF1aP1ls7lAFbjVPP+uyHUKkISznElekWXQM9ombdAiv0aKXLWtXyfgRmRO
 82EdJ7OTN7Eoaj9OccT6Sr4UbWCMZpE90AXfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G2FIe0ouBQm/SH+HzRBEb2Y+09MFumg8Mm7fe2VHv4A=;
 b=OCS6Q8PkiuTixvo16MbHGSRFvfoIiEjPayQ309gBpuhpOKjiTOZRpAFxx+Ozjr4Sf2
 7/Vga+tOsHD28OP0ndUBhlGSljC9A6Ax8dfbZeevMHk+37Pmh+UtfFB4MLn4S2x1jVw+
 f0pWJgA+XlRlQVXUWllezewMnWBtHcKQkjLTGwiQEY2KlPaM7+Qt2VmF09Tz8ajlvUMB
 xEZtPIBZB3R3zZe8pHtFjylYdps/FjwiVHAihmhDMmaP0XiHxru+PgUbox9OBsKiu2VU
 FgLOA3hK/x1yLNY6HNFRJ9DWeW6J1v6EsRPJdoQyvsiYXyTeKZejPpU2Z7XG4yxnP5ls
 6JaQ==
X-Gm-Message-State: AOAM5302FDansmCRJjqOkcwa/apFpGkqGRvNQMeEvyjFscJqkFyEdmQu
 /M/7Z9TClFqEBcMtqqV8ZgWZiA==
X-Google-Smtp-Source: ABdhPJzMih60lOrCKfb59xA2JYN/7KN4CxoR5+cL4ru9TK43wztDYEYVCJ+hg5nBFNxS5xTklT6vwA==
X-Received: by 2002:a17:90a:a083:: with SMTP id
 r3mr3982230pjp.55.1611915141236; 
 Fri, 29 Jan 2021 02:12:21 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id a2sm7532533pjm.51.2021.01.29.02.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 02:12:20 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 3/3] arm64: dts: mediatek: mt8183: Add domain supply for mfg
Date: Fri, 29 Jan 2021 18:12:08 +0800
Message-Id: <20210129101208.2625249-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129101208.2625249-1-hsinyi@chromium.org>
References: <20210129101208.2625249-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_051223_400488_094356B9 
X-CRM114-Status: GOOD (  11.49  )
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
Cc: devicetree@vger.kernel.org, Weiyi Lu <weiyi.lu@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add domain supply node.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi       | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index bf2ad1294dd30..ebd53755d538a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -709,6 +709,10 @@ cros_ec {
 	};
 };
 
+&mfg {
+	domain-supply = <&mt6358_vgpu_reg>;
+};
+
 &soc_data {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 5b782a4769e7e..bda283fa92452 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -360,7 +360,7 @@ power-domain@MT8183_POWER_DOMAIN_MFG_ASYNC {
 					#size-cells = <0>;
 					#power-domain-cells = <1>;
 
-					power-domain@MT8183_POWER_DOMAIN_MFG {
+					mfg: power-domain@MT8183_POWER_DOMAIN_MFG {
 						reg = <MT8183_POWER_DOMAIN_MFG>;
 						#address-cells = <1>;
 						#size-cells = <0>;
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
