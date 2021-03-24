Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34FDBC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 07:09:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C30E2619F6
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 07:09:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C30E2619F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1hp/DAG+wLW+C2tJmOPeDF9/fHFwUdv9f11d/WP8GY0=; b=J7NSGxTUU5gHngwTzcCIwPKdAH
	hEgQgfrJVZhtECN+KBsZAI9k6y4oZapmrlSHHfJEiBHhgMXKeSiv02eD3xnFkpYAua8E+ozB+o2XY
	Xb7wF8ikiv4N0Xq9i+k6faojuU6saY0+cLcwyQ9ZmlhERxXtboND6E4AQ4dnUhcYl4bO/nqSGLepr
	uK88uKgOjXoAQKAarlg+lu0x/IeuCqI99YItKs/Nb30KzQ80HO2BFwRanzxAtrc6vrD4ZBDQz+6/d
	f8XIeep13t0LRs2uOpxNsX0LNEQvEJ0+rq5PGsJErsF7FlwmoAh+w7S9xfXpccE8h9x4HRZLMs6oh
	1mSahUZw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOxdT-00GS1C-5e; Wed, 24 Mar 2021 07:08:59 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOxdJ-00GRzU-TU
 for linux-mediatek@lists.infradead.org; Wed, 24 Mar 2021 07:08:53 +0000
Received: by mail-pg1-x52a.google.com with SMTP id e33so14027534pgm.13
 for <linux-mediatek@lists.infradead.org>; Wed, 24 Mar 2021 00:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/RRd13xSmzzPdeil2PYUhQm6+cyptrl5URL+s03EZsI=;
 b=QAlvvh5jK4gEHwYp56McvWt/j2reVUksBe/t038i9Nj2NpKhSptr9UYnHfJlpEG+0C
 UwhTCSKgC7iznOpXn6CbSdFmENIzBHhUQBG+azqFBg2RL2lZ7B8/1/2Bz5NU/Jcd0rQi
 1a9rgyMnNWcZd/Rxtf3SY8EtBjHSmHbaEYUSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/RRd13xSmzzPdeil2PYUhQm6+cyptrl5URL+s03EZsI=;
 b=rmQ5i5GGqrmmUTltRyxm3/il20qaKpsuDfYEpDNl73PKqU0VV6lqt6oNbQS1cIuOhY
 rvRehRNTm68QNgI2lOlv6mxAEWSGy7N+UsoPFa/SZ1dG336UMpcRzy3S4oMMiZ04Jf4x
 yTaGvIDvyK9ttJVXF5yzsSX+dcq5maNjMi4aw/freTZHHr13i09R86tHJSHQm6roLFTr
 4gJqSxA3n5v19T2jmxUPFQpaMu5qL7Kc4K+plQgz+o5Cg/R5Wl0WlKrf34bR2UnFBkcV
 x/ScMKEEXNOpuTqr5hI9mcfQTE3r49X8ziueeqMT2uHXMl+uj4FCLB3TlppKzTBVv9Nk
 AXqg==
X-Gm-Message-State: AOAM533/L1/93f1UHMF+allScqxHOA/atBDyPXvd2wuNQ9zkAD3JZU4x
 ZjhGcTURHjJr6vGTI2ZAwZzQUQ==
X-Google-Smtp-Source: ABdhPJwI0x2w6Tp2BHTsGd/z+j1YMe41PeKg3PJTel2Z+1wKA5TzhFhhV2Req+NqwYyObpioIBwOtw==
X-Received: by 2002:a62:2a83:0:b029:21a:d3a4:80f2 with SMTP id
 q125-20020a622a830000b029021ad3a480f2mr1665580pfq.47.1616569727657; 
 Wed, 24 Mar 2021 00:08:47 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:c8d1:279a:cb3a:39cd])
 by smtp.gmail.com with ESMTPSA id t18sm1408077pgg.33.2021.03.24.00.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 00:08:47 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: dts: mt8183: Add gce client reg for display
 subcomponents
Date: Wed, 24 Mar 2021 15:08:42 +0800
Message-Id: <20210324070842.1037233-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_070850_062112_F4765D2B 
X-CRM114-Status: UNSURE (   8.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mediatek,gce-client-reg for mmsys, ccorr, aal, gamma, dither.

Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
v1->v2:
Add for mmsys.
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 80519a145f13..16f4b1fc0fb9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -983,6 +983,9 @@ mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8183-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
+				 <&gce 1 CMDQ_THR_PRIO_HIGHEST>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
 		};
 
 		ovl0: ovl@14008000 {
@@ -1058,6 +1061,7 @@ ccorr0: ccorr@1400f000 {
 			interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_CCORR0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
 		};
 
 		aal0: aal@14010000 {
@@ -1067,6 +1071,7 @@ aal0: aal@14010000 {
 			interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_AAL0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
 		};
 
 		gamma0: gamma@14011000 {
@@ -1075,6 +1080,7 @@ gamma0: gamma@14011000 {
 			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_GAMMA0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
 		};
 
 		dither0: dither@14012000 {
@@ -1083,6 +1089,7 @@ dither0: dither@14012000 {
 			interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 			clocks = <&mmsys CLK_MM_DISP_DITHER0>;
+			mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
 		};
 
 		dsi0: dsi@14014000 {
-- 
2.31.0.291.g576ba9dcdaf-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
