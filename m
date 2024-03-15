Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5951BC54E58
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 11:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEdbatcTx+BMxUcwyJodaDR0wXY8zMTqnjTsuA4PhA8=; b=0Ufo/Se7OeYexPmeHzacRdQLGp
	5lDBpfXoyJb5qNhMDqIjygTPB0RFeebtsX+C9EVpOSCEOoDYRor7gEj3ajRfYTUPSkQQzKvhXAJDt
	pU2IF8vU3ORUBSjoAus4/vR1bD0egTWf630LJNyzuDlAzcAmr50GXZauSIz0/egaaotXdn7KalcPe
	wlwqqJLvYeujHCtHms7l/PMegS8uWosQuxB3Dci0F9S6kuQSg1x/549p+e2vi9xo4SAnHB4iUMCRn
	mJw2nmKMorg7AsTcgTukFaPdAqGhtB308/ScJPwKd0M2dJafu0r1JKWlAZUnPxsaQhfpZq1EQgjJu
	DCBs7fpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5YH-0000000HaS0-00mR;
	Fri, 15 Mar 2024 11:16:41 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl5Y7-0000000HaM0-34cx
	for linux-mediatek@lists.infradead.org;
	Fri, 15 Mar 2024 11:16:33 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e6b3dc3564so1840894b3a.2
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Mar 2024 04:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710501391; x=1711106191; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NEdbatcTx+BMxUcwyJodaDR0wXY8zMTqnjTsuA4PhA8=;
        b=oKq72gHnw/4jOu5reL74rmx6xTW5h795hPJpNRGYX2uGvuOl15X1ha/vBrp/Hc/dDd
         xktfYCzaCE7e9djh2kJe9sb7ac5eSR4X42/YUfEIblHVD1suDrE9ee9n42FdAMVD0Y2d
         Ef5CFtaHN54BsHELjZTx1Hf/A8ZpbvtygUsBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710501391; x=1711106191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEdbatcTx+BMxUcwyJodaDR0wXY8zMTqnjTsuA4PhA8=;
        b=JBXRxVH85LecTHYlnbe/j9lixtXYG7duCzZnZvnW3UFYVGc8WBjYIELr1+Miyns4+/
         m0F7UQWvYltQCk1zzywNSnURI7nadqX31e05E0zfnitHoR4o2gTrMpZ8eOfGNITsm9Cz
         KIBCYZd7NB8YkdFhv5BUJgqBxNH+0+fy07Lkc70E8mkeSMN9UcLM0w7jlutPrmKLKmAK
         p3lVEDsE8fOkZawkQzrk68M4TQuPLtvV26spFUf+8JsW+hhLG8EcpGbLv9R8R8XZQEh4
         +QkADAEEyFa+feTc5yiFwQ7/vriJahKH84lxmSX2WWKznPKSGrhSNJ6SoW6zf/GU2/QG
         ZkSw==
X-Forwarded-Encrypted: i=1; AJvYcCWllcDh41RqARU8g7VApwvgnn4zeS1E7HVeA0ru0etL3fo+kpLqU2NRT1lbfZqVGb3PdAKfLfvY4tgX2IqtGsjeTD8wZh+Lz9T5kOdB0vAlKa1o
X-Gm-Message-State: AOJu0Yy8KbLkp82RkbHxsuDzP44/totTqPgMncqFgOnoARMxOlUKiUR2
	LkTpFRHrinV8snzZZ2gQhgDaBEJKZA07A5CHXqj5KvNlGXpyenXZcJlZ5eabLQ==
X-Google-Smtp-Source: AGHT+IHuQe/cYmMUFny33NXapxQXc5X930DvksjS95oNx3L58qkOtWxPwKplUrudaUT4vxUuMbsZMw==
X-Received: by 2002:a05:6a20:8f24:b0:1a3:502d:bea with SMTP id b36-20020a056a208f2400b001a3502d0beamr975715pzk.14.1710501391194;
        Fri, 15 Mar 2024 04:16:31 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:2f9c:c00a:bf1f:e53c])
        by smtp.gmail.com with ESMTPSA id c11-20020a62e80b000000b006e6aee6807dsm3122683pfi.22.2024.03.15.04.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 04:16:31 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v2 2/4] arm64: dts: mediatek: mt8195-cherry: Update min voltage constraint for MT6315
Date: Fri, 15 Mar 2024 19:16:03 +0800
Message-ID: <20240315111621.2263159-3-treapking@chromium.org>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
In-Reply-To: <20240315111621.2263159-1-treapking@chromium.org>
References: <20240315111621.2263159-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_041631_869771_874FCB11 
X-CRM114-Status: GOOD (  11.76  )
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

Update the minimum voltage from 300000 uV to 400000 uV so it matches
the MT6315 datasheet.

Also update the minimum voltage for Vgpu regulator from 625000 uV to
400000 uV because the requested voltage could be lower than the minimum
voltage on the GPU OPP table when the MTK Smart Voltage Scaling (SVS)
driver is enabled.

Fixes: 260c04d425eb ("arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v2:
- New in v2

 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index f94c07f8b933..c0223f84b45b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -1214,7 +1214,7 @@ regulators {
 			mt6315_6_vbuck1: vbuck1 {
 				regulator-compatible = "vbuck1";
 				regulator-name = "Vbcpu";
-				regulator-min-microvolt = <300000>;
+				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
 				regulator-ramp-delay = <6250>;
@@ -1232,7 +1232,7 @@ regulators {
 			mt6315_7_vbuck1: vbuck1 {
 				regulator-compatible = "vbuck1";
 				regulator-name = "Vgpu";
-				regulator-min-microvolt = <625000>;
+				regulator-min-microvolt = <400000>;
 				regulator-max-microvolt = <1193750>;
 				regulator-enable-ramp-delay = <256>;
 				regulator-ramp-delay = <6250>;
-- 
2.44.0.291.gc1ea87d7ee-goog


