Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05379C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 12:14:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3CB564E9E
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 12:14:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3CB564E9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3UX8ghT29vR71+lvtMUq/Z+/trJdVPOZK2AdVZNprs=; b=Od8b/GzSMNy356St56Lul8zw2g
	hH8v39RGDgkrNOR7R4cOUl4WIoe/AOJJi2mjdWAmSiId+AC4Kn3C0aProE/jNri81FRuyV0st18Cu
	cdC/4ks6TWvn/Ngha9sGinxBs9rzIK7fx0Px2QVWGQwfTHEWfkgsuokVNRljH9rhfLej6gkGUiUfH
	4Ck8LU2fuz1Qkhddk9c0dv9pkgv4ToTV2syqsFl38jRDSfPV1bTNhxjWWXyS4FiLXLN/18bxGlJAl
	B+il3LXGkj2Mhyf2LoWCBS3NBNlvkQREbrgvlDgssD31Dm4kSIGbzVwLUcLXdcZbfkFgEf1+sqV+A
	u8NWJAXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Y6D-00017v-4X; Mon, 01 Feb 2021 12:14:33 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Y62-00012a-69; Mon, 01 Feb 2021 12:14:23 +0000
Received: by mail-wr1-x432.google.com with SMTP id 7so16347924wrz.0;
 Mon, 01 Feb 2021 04:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Z39meYOIrJcvImu0d9+1ppKubLWmfZB/Damj7pz9ugQ=;
 b=mhJAPRDLeJG+CgRohjkj6GBCavV1RE6bdoiAB6gS9zPxzQG7EPMD2p2IBAjxPjn0Ra
 1w0y7tZcbqnf/WaqO0KETh63P8UV5MRDh6d7h9x7115MeFgpO2zf89z+8AcFYI5mHT7u
 K12vZ6HDnCGG7NsHA5/J+cVZzNI+z5T1Dt0HpSIqkcpeqYZK2mWh2BcA6dh2rhElR1Y+
 YkDegngOsnRoas0Ia81UWu7w/203bEU17qnS/3ATkjiJ++TUgtu++hXS0XAmpDVjs49R
 UwsGXV+TlNkFF1Ze5uZHcXcXMvd3KNVFc9j6INJQdQXkDnrvR/zD9G8kMks7TRHzSBsI
 DMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z39meYOIrJcvImu0d9+1ppKubLWmfZB/Damj7pz9ugQ=;
 b=sNdpgr+xvCh7lIS4Fv3NJJYDJRtSlQ8jKcSKMl3T2mvwl+hkyFaBdocBbCyWn7g9L9
 paQdc1RUg+JxNADkGFf8r3m/qkY7KpppLsBcAXS/OPrRxLQZTqBwoouoPElRRhmZkbtK
 cfA+ps0DqQo0nYVeN/L99OjrZd9imjX9AYedshHwQmYpDZgXCmYUdmtPyw5nhqRxxZqd
 MuuCZ0MHQyj2PrT36/au/cD4Kt2HVfMi0J/r7SSNfZAavweBujk1w1rjwsdLC5EBdk79
 UZOsZFDKYoW2wk9jIUFnEFjVQO0Cx7pumv2ka4D2zyreNTpj0iGZVzx4Z+9lHQnWEXB6
 Pl7w==
X-Gm-Message-State: AOAM532VwVB+jTwIeS6Ai4vZPmsM5NOufdPzNnSzHtUeGzTu09tH9Wxo
 3/gh5ja4cTSKqK304WR128go4Uh7bA+58dQf
X-Google-Smtp-Source: ABdhPJyTShgh28D3j3BlprnPfBjmaF3wX8z7N3nvExat8Z2nhpnh2vnac+tmdL/eDznwmI78wXtcVw==
X-Received: by 2002:a5d:4d0b:: with SMTP id z11mr18001392wrt.388.1612181660522; 
 Mon, 01 Feb 2021 04:14:20 -0800 (PST)
Received: from localhost.localdomain
 (cpc141888-watf13-2-0-cust663.15-2.cable.virginm.net. [86.14.42.152])
 by smtp.googlemail.com with ESMTPSA id j13sm20698332wmi.24.2021.02.01.04.14.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 04:14:20 -0800 (PST)
From: Bilal Wasim <bilalwasim676@gmail.com>
X-Google-Original-From: Bilal Wasim <Bilal.Wasim@imgtec.com>
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, matthias.bgg@gmail.com,
 enric.balletbo@collabora.com, hsinyi@chromium.org, weiyi.lu@mediatek.com
Subject: [PATCH v2 3/3] arm64: dts: mediatek: mt8173: Add domain supply for
 mfg_async
Date: Mon,  1 Feb 2021 17:14:16 +0500
Message-Id: <20210201121416.1488439-4-Bilal.Wasim@imgtec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210201121416.1488439-1-Bilal.Wasim@imgtec.com>
References: <20210201121416.1488439-1-Bilal.Wasim@imgtec.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_071422_278133_0A7F42A2 
X-CRM114-Status: GOOD (  13.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

da9211 regulator needs to be enabled before enabling the mfg_async power
domain. Otherwise the subdomain is not enabled and causes failure in
imgtec gpu driver boot.

Add the "domain-supply" property to the "mfg_async" node in DT.

Signed-off-by: Bilal Wasim <Bilal.Wasim@imgtec.com>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts  | 4 ++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi     | 2 +-
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index 21452c51a20a..a8efff2071bf 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -157,6 +157,10 @@ hdmi_connector_in: endpoint {
 	};
 };
 
+&mfg_async {
+	domain-supply = <&da9211_vgpu_reg>;
+};
+
 &cec {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
index 6dffada2e66b..c8eece8f5beb 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8173-evb.dts
@@ -62,6 +62,10 @@ usb_p0_vbus: regulator@1 {
 	};
 };
 
+&mfg_async {
+	domain-supply = <&da9211_vgpu_reg>;
+};
+
 &cec {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 7fa870e4386a..31d23099df90 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -504,7 +504,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
 					reg = <MT8173_POWER_DOMAIN_USB>;
 					#power-domain-cells = <0>;
 				};
-				power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
+				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
 					clocks = <&clk26m>;
 					clock-names = "mfg";
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
