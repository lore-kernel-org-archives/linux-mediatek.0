Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C98C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 11:05:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78AB164E96
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 11:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78AB164E96
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EQygrxefHX7K9SE5nlDiATCmUTPdGv8WeGlMFzhS2Eg=; b=zw6AM6KZI0JqTgXoQDOGynern4
	VRiHKFYn+aix6bgZKfYDi7AG9CgMy4hFePb9GBE2B2sZOXHCMQZbB1jQ6MNa9amzkkgJA5rzPOFms
	MY7Dw0LXzwZ9er1DxKoU8BhH4EfJJENs+u3DDajpIqG5w0i1M2DvsqGtaqTb7Zt/YpbiLZaaLveAi
	uaHngBhZBrHuf6NWZ9Ra32TtGe4KsTpKrwPjL1rd7Ob2GMRzS3dfYYewg5AwYqHMNGaN7DD6/i6NQ
	0gfdINMLdgHqCi+yeW0mP575d4jhB45l6o/JhUGc9Zg/1rzPOiAVlfB1h1u/M6AOtELarSvKsMHwf
	O5SNNM/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6X0s-0006BT-6J; Mon, 01 Feb 2021 11:04:58 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6X0o-0006Ae-ST
 for linux-mediatek@lists.infradead.org; Mon, 01 Feb 2021 11:04:55 +0000
Received: by mail-pf1-x435.google.com with SMTP id t29so11327910pfg.11
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Feb 2021 03:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b0TEYyZ6Jpm1D9Hrf4Uirq5wkSl8rc4Igbimt+j818M=;
 b=Q8vAROO3LiDQh2TyKpVQclnSdULEDybL7T1GUumLWZKu/e3kssUpjvftmatn8c86nV
 /lT3PQx2ktWIMnigAuQKW3sYlbZSwjyf6UwEHtjqBBLsyh2vYwWqoUHsJ+o5c1ZLfhLh
 YcC9aNTeRnIDbbeSL/YuA53nOe9IYNcF25SGw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b0TEYyZ6Jpm1D9Hrf4Uirq5wkSl8rc4Igbimt+j818M=;
 b=oe0jub/vaqmgRYRD8Dvjmq9DAFnMyVkWHpCmujacqYcMz9xylXTrbWgQWUb/mNSiht
 JNI9DW2uQS5NkIGrBGwW3//gZ15C/bdwAy0HfhankgFfzlQFnI8E7Vl645VcaFF51AkH
 JT+nCf60Y9TkZh4lvToqqabTsiVSCq5zU38tqYhKlwvUnC9BOHH5ylhqNhHA+oD7LBCB
 VcgVO/MafJxXYTOZspqQR3vcz3t9sa8oeBEUul1yulwz08krAYeqjJNl4GXWEOLMoM6+
 txguXfxir/10K4Oj55N+aidZuzIIGeI5JxP2Aba/TAS0CWmSFD5+beJj7mZbi4dP9+wy
 9lNA==
X-Gm-Message-State: AOAM530EtlvbtFjLgxYry7btx16LYPKOpttogHqJJfOP7gABOR0q0FKp
 BfEh49cUqF72gHxyw8OodW/QGA==
X-Google-Smtp-Source: ABdhPJw9Te6d20sslYeqPQX+ekmR/N9YluTXGvvWRjDjCRO5dsDJOKwTHO2iICQGBysLzgpFTvmQIg==
X-Received: by 2002:a63:f95b:: with SMTP id q27mr16897164pgk.82.1612177492234; 
 Mon, 01 Feb 2021 03:04:52 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0cd:1b84:6d56:68e1])
 by smtp.gmail.com with ESMTPSA id i6sm18041057pgc.58.2021.02.01.03.04.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 03:04:51 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] arm64: dts: mediatek: Add gce client reg for display
 subcomponents
Date: Mon,  1 Feb 2021 19:04:47 +0800
Message-Id: <20210201110447.383473-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_060454_987254_6FEC7A7E 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mediatek,gce-client-reg for ccorr, aal, gamma, dither.

Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index b3b8afec5ab9a..0ed37dd9d80b4 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1058,6 +1058,7 @@ ccorr0: ccorr@1400f000 {
 			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
 		};
 
 		aal0: aal@14010000 {
@@ -1067,6 +1068,7 @@ aal0: aal@14010000 {
 			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_AAL0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
 		};
 
 		gamma0: gamma@14011000 {
@@ -1075,6 +1077,7 @@ gamma0: gamma@14011000 {
 			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
 		};
 
 		dither0: dither@14012000 {
@@ -1083,6 +1086,7 @@ dither0: dither@14012000 {
 			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
 		};
 
 		dsi0: dsi@14014000 {
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
