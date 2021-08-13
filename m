Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE7DBC432BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 12:20:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B210610A4
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 12:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8B210610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+WuRamCi7iMF+vyJabMqZ2hk6kcdbKhB+T4HFQ1mQzU=; b=XWbWRSKZITsmMP
	VmFEbSBGz/QxjlbR9Ib88bUgYq3ExZRkKQuB2yUb66ufZj4MTv0uEcmtziLE4tZg0aCw6gb1hA83h
	JbN36ztLBNoANNTctd/Hv3IiR1VzdIWVRP3RkB9hmscEEDlJiG++FwVrNon5xUBzHt9P+1WeUk8Kq
	RJTN2jPkWxgrVTzChfrhnUSkLcBubEK/xxTVjkohfa1AAlV4E4UaJX8tVhWLGr72O0iTUZzws9saK
	faNpgUmUxs1IBM20tBUETskfevYovFWp8gB1+EG2cr2Kpzd7o+TuFb1a6+pQyLvxWtk3ZpOz6G2r2
	psXMnPB2CM+7CQyEKotA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEWAj-00CbE0-U4; Fri, 13 Aug 2021 12:20:25 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEWAW-00CbAr-Kk
 for linux-mediatek@lists.infradead.org; Fri, 13 Aug 2021 12:20:16 +0000
Received: by mail-pj1-x1029.google.com with SMTP id bo18so15087219pjb.0
 for <linux-mediatek@lists.infradead.org>; Fri, 13 Aug 2021 05:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9Di47GUy6tetqqQE22JBysnHPPz3MzJuD8k18pWiqxo=;
 b=aqsbn03KP4nyTGMiqRYZsE+icZTZ1YfCVwlkcBGl4ZBLP9hjo94E5M48vWIzHY4QhO
 7bQ+rHvk9dVAYn2DFQ50HKyyh/EYOUqJEq6XTHkdKZWhgEzhia1/msroAGGIFLo3yAa5
 4vu0R4szjmjcYrDXV9zGzYiSqyX+p3MF3N0Fg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9Di47GUy6tetqqQE22JBysnHPPz3MzJuD8k18pWiqxo=;
 b=Y4zjRSLmRSToLclK/FiaxPsM5u2JMcd4mzBQA6Jr4R4OYcFeDQ5/48lyp6+I7lJ3sf
 PGKKTZKPCL7XFzOsCQZmnxD2i7lZ6nspuYvkJx0LyttmZbJZ5JuOX1lU3c6muu9D2yCV
 30eMkmmMk+2IGcihvAb8EiPHNMJNtsH8GrkVBJHEotCSS9iBjHEWKvDXqwHNFxkyR14T
 /Lm0JiKtezgSdrOAULbl96gZBug5JFYR7i3/947P9J+xOAmhVBFNqP/X19Zf4O2mcsZB
 guEH9GbwAN+rGNEFbJxyI0AtAB2MdaeKQFZJ7FnBCtX0blIPWwtG8FtdI4yGksJVEPqe
 y3uQ==
X-Gm-Message-State: AOAM530gWU9fTIn9W5g0zSI1p62L408yTTnaQiS17Nh1EHpfwrPd2TZo
 HH9wNDIn7BNTB1gxskOgYU6PMw==
X-Google-Smtp-Source: ABdhPJxFW7YDSIy36xHldQt5PEerBOuZ1Ngvzs2SlQfdRfcIKg3KKXQSl0n5gHTIuEevJmFFIwkJlA==
X-Received: by 2002:a17:90a:5982:: with SMTP id
 l2mr2425365pji.18.1628857212238; 
 Fri, 13 Aug 2021 05:20:12 -0700 (PDT)
Received: from kansho.tok.corp.google.com
 ([2401:fa00:8f:203:5293:be68:a318:ba36])
 by smtp.gmail.com with ESMTPSA id v15sm2181680pff.105.2021.08.13.05.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 05:20:12 -0700 (PDT)
From: Kansho Nishida <kansho@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jiaxin Yu <jiaxin.yu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Eddie Huang <eddie.huang@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, LKML <linux-kernel@vger.kernel.org>,
 Kansho Nishida <kansho@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH 1/1] dt-bindings: mediatek: update audio binding documentation
Date: Fri, 13 Aug 2021 21:19:57 +0900
Message-Id: <20210813211947.1.Iaddd8d9fd3ce70ac40663afb9d6fa5b76ef0c38a@changeid>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
In-Reply-To: <20210813121957.3089816-1-kansho@chromium.org>
References: <20210813121957.3089816-1-kansho@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_052012_725347_757557E8 
X-CRM114-Status: GOOD (  11.64  )
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

This patch updates audio binding documentation.
And change audio node names in dts files in the same manner.

Signed-off-by: Kansho Nishida <kansho@chromium.org>
---

 .../devicetree/bindings/arm/mediatek/mediatek,audsys.txt      | 4 ++--
 arch/arm64/boot/dts/mediatek/mt7622.dtsi                      | 4 ++--
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                      | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
index 699776be1dd3..409a425cbdd3 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,audsys.txt
@@ -28,12 +28,12 @@ For common binding part and usage, refer to
 
 Example:
 
-	audsys: clock-controller@11220000 {
+	audsys: audio-controller@11220000 {
 		compatible = "mediatek,mt7622-audsys", "syscon";
 		reg = <0 0x11220000 0 0x2000>;
 		#clock-cells = <1>;
 
-		afe: audio-controller {
+		afe: mt7622-audio {
 			...
 		};
 	};
diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 890a942ec608..a54c9cc2063d 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -590,12 +590,12 @@ uart4: serial@11019000 {
 		status = "disabled";
 	};
 
-	audsys: clock-controller@11220000 {
+	audsys: audio-controller@11220000 {
 		compatible = "mediatek,mt7622-audsys", "syscon";
 		reg = <0 0x11220000 0 0x2000>;
 		#clock-cells = <1>;
 
-		afe: audio-controller {
+		afe: mt7622-audio {
 			compatible = "mediatek,mt7622-audio";
 			interrupts =  <GIC_SPI 144 IRQ_TYPE_LEVEL_LOW>,
 				      <GIC_SPI 145 IRQ_TYPE_LEVEL_LOW>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 9ea4c5001b1e..189e3545226e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1119,7 +1119,7 @@ audiosys: audio-controller@11220000 {
 			compatible = "mediatek,mt8183-audiosys", "syscon";
 			reg = <0 0x11220000 0 0x1000>;
 			#clock-cells = <1>;
-			afe: mt8183-afe-pcm {
+			afe: mt8183-audio {
 				compatible = "mediatek,mt8183-audio";
 				interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
 				resets = <&watchdog MT8183_TOPRGU_AUDIO_SW_RST>;
-- 
2.33.0.rc1.237.g0d66db33f3-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
