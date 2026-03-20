Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3670109318E
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRK5xBK6BAOpYcXqRcl+8YIfK5RsduYG9moVn3vQfqU=; b=UbXD0OxH2ORz7/zFZBipm6TW5+
	0xL/h9Ez6sHqEZXLVsrmQH3XYIGSKNtCgAwx2TwLMxNjDLQHjX2BC/Bgv1IMKKd4VrcNGuERNqmWd
	jCU79Sa7RuNHaxW9VYsAMhhO/xU16FuOYHavni7ScCsvajW7PlnpqIon1oz73j87n9P2YJC33DOPA
	QENoACaFkKfm8xRm01f1uYnF5jVpFDebeC1Tpg2D9Si7oT6TQSBh7TBfIL5nkWOi30mRSo5rJVucQ
	GcKZAanQTa15YQmkRoA7YZIyvXZh8MFclnvrTPpOQzxBc/WSXK20bP9hqDHJvRmcdqBG2GWpXrW2E
	p5HqQixg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VTM-0000000COMW-1EbO;
	Fri, 20 Mar 2026 08:44:48 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSz-0000000CNwJ-3ho8
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:28 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2b061b6cf36so2743875ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:44:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996265; x=1774601065; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRK5xBK6BAOpYcXqRcl+8YIfK5RsduYG9moVn3vQfqU=;
        b=Lx4MxIRVBpSjKJLmbaHT+puHIhOKSI0I6Qg9vL0fDdapXpzMc9s2rlkKB75dQVUpl9
         AvwtNQEN2PC2zADuUWQZJcsBpZQXNK/e9zPooRjLKp75j/KdsTENH0GgAvXsDNwohOWE
         8sv5rWNFYZgPEPcpnF/8Bj/X0U67wGKXymOsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996265; x=1774601065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRK5xBK6BAOpYcXqRcl+8YIfK5RsduYG9moVn3vQfqU=;
        b=L5uzHjctjJsFoKWV3hViCku1pV73UMF0u1AGcFfzcPBrYZFGnZOtBOgRpGJS+RJQ+3
         UpoyXSQlIhrvfE4cARr43nOxAr0UbNXjC7WMmmuUva0QjJgM5AnmxuRK6lSWE6oBQlMD
         JZM7EZJMee+o8hNkcadSPVsAbu5JiI45YgNAk8c+s1aFc9XDoxFyz71MCvtA0fkcEUwW
         NGNvL1QkoSp0lIkZxiSxgu85exPn+0AsBdyIV3LxwBygE4PeoBU5egWzy1SNss0gOD2i
         zSk4Dpdvpo9Xk854JBJbqjC/vEEwS1RpT5/5l172CqociTPl5Ark/Z0CAqO7emN0gNnK
         zH2g==
X-Forwarded-Encrypted: i=1; AJvYcCUAhMb90HLj5AyNgcgOl/D4pX3Ijf/qnPPXmNFo1zeSwjOCcYlpSTVogZefrba1cGgZcSxw/WK2pyE+PIL0MQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPeDgQiq73oWpc+WFjm4tPxA4wLtnFF5X6Gxa1uk5JJ24ojXlI
	X8VORMCZ+a4xWN3wd8fox7CNIPnwqBBvbT2T7VjnvryxTXi4QtjLmIiryfwukIJohw==
X-Gm-Gg: ATEYQzzTWuSBxU+9oC1QOf9bOnBboeUzH+qU3L596eh7mkTJJN1m9LA9sNbsxohFQzI
	Kw9MytZxMdUHHBq2MM1ToGjncy03i7N/+kCLJo6ywK3X+Y6up3589MJMuZ1vHOyPh6VNfDWrDRU
	rjdoQe+24QZKzcljXG10LvfxQaV11LusXkb6gSDrjbx2YoHfC2RkVdWrhtIp++EpFHUZWY2BgkB
	tfKijRTSppABrYeXDKwUo3kdlr45afHA3OB+AWCHtFzLvOYzrEAJVj48Xqe51CgXqjznfY9ObeK
	dlIs5LOKvxJSjbZdsJ9z/wzE0RYFa9o304SqaxgNWvRXGwrWDDBqzD1u19tU3SwOd6IDPyfAqzU
	HaOeuMG2LHaMlcLizded/CXW9D6syg+qXPoKj7UGMan5T77CoLC0PYx8y0nJPSIhaw1qtxFplLz
	sOzcIOSs2pyr3RdCYrZ4Cv9Eile+siUodI6aUjXJqeaza+L7KXnwFnREbYnWcoK+KxQZs2CRyna
	HptogMz
X-Received: by 2002:a17:903:f8e:b0:2b0:67fa:dbfb with SMTP id d9443c01a7336-2b0827dc4a1mr19058875ad.47.1773996264637;
        Fri, 20 Mar 2026 01:44:24 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:44:24 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/13] arm64: dts: mediatek: mt8195-cherry: Fix VBUS regulator description
Date: Fri, 20 Mar 2026 16:43:43 +0800
Message-ID: <20260320084351.2461060-12-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
In-Reply-To: <20260320084351.2461060-1-wenst@chromium.org>
References: <20260320084351.2461060-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014426_009180_CAF7C7DA 
X-CRM114-Status: GOOD (  10.57  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The VBUS regulator is a current-limiting switch. It does not have
voltage regulation capabilities. The description is also missing a power
input.

Drop the voltage constraints, and add a supply input.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index ca747531629d..19a24380044d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -212,10 +212,9 @@ tboard_thermistor2: thermal-sensor-t2 {
 	usb_vbus: regulator-5v0-usb-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "usb-vbus";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
 		enable-active-high;
 		regulator-always-on;
+		vin-supply = <&pp5000_s5>;
 	};
 
 	reserved_memory: reserved-memory {
-- 
2.53.0.959.g497ff81fa9-goog


