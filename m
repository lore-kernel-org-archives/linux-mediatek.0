Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FBBE7717F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2024 09:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kGRD0hSRVjDln2H041utB2MSY4gQ8R47O9Y5WYRUCMw=; b=Esm4Lj/6Zln+tnvaFmDbzcAXY2
	sm46PgPK2QqDte7Kdd2zqds7n1mHRhRVTOlFUNa4T4dJnMMRD07h/I6ftYIUe5+RjyQCjAK1yPodZ
	yLNzwpyiEkIwE3i5g3OquEzB62ttVOENgSlESRDqdNgcXQgaGJCec74evwoCzyUm2NmhjSJ/LqpJL
	Gr5afwH0J6+QVl1i6lQqMjqaIRNpdN+Pl0NAvEsyomKnss9ai4SNcx5CS9YWmDObCK055DkGnUzM8
	TDQSjgxsNJIX+swmLfLeLlbPEwQO+kKoLmP5LBmv0I0ldKe4ihtD8A3AbsB1MHD8DFyVFQsDddhLD
	ah1t57YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwWc-0000000As3F-3opx;
	Tue, 10 Dec 2024 09:27:26 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKwVY-0000000Arq3-2rm6
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Dec 2024 09:26:22 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7fbbe0fb0b8so3752038a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 01:26:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733822779; x=1734427579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kGRD0hSRVjDln2H041utB2MSY4gQ8R47O9Y5WYRUCMw=;
        b=Obt0EcBIlWBpdYQhKMF3eUBiDSYF+8bcBqZf3/ZEgE6xOgwhjBej5HG9GCiUxMtYTm
         +3ADUMUNetzlxL/tquAK7slG7YYrm8+dy9Xl0iXlMEkaCFaiYuaM3AWfWwe3V83c1JVh
         j1FdBM29UM9uQyiJZ3GRvWjguiur8MmkpNhOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733822779; x=1734427579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kGRD0hSRVjDln2H041utB2MSY4gQ8R47O9Y5WYRUCMw=;
        b=h1ctmIb0Bhj4TIdnrr7hRYPREBovDZa1B7guP9uOHOMlwYKJxZ59ztprv7+2wfRtAH
         V6ocVUN1hNuLYONJS4dHbZxlGVkrERNM9pWrbrjnwKGf4Fdk8M+/vnU7vvv5YkD43oJw
         DHbKgIvul73s9m5bllZUcVnEIRBBc1sKwJjNWchqrzC+IyQnaJO4qVQjl1meqr2eg0dD
         jrZgjnUAuIv60rGHcyayV5Ex8iYxA6Lbh24DpkOame0ZTPiAzdyEbqxSNFpqkJbUTiaF
         pwnZCSwLQOhEvsjrRaeVYzbqPjf1SN1ktOAXNkAmHn1MmPcHVrB4ZxrGV0hTB0tG0Vc2
         qM1A==
X-Forwarded-Encrypted: i=1; AJvYcCX55rlLl0GI8Pb62SRURHlEHBnzqAw9ZHgJGvvQUj4v5FAcnILEdvb006ipDpBDY8EU3H9LudGYXCyszr2PeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxLQuv9YBFyagvq9NsVW274pgrOUodjKQWJa6NdqxX7y+aMbO3l
	+EyhWHS6US7U1AGadJEz+GqEwTRTJUrKkC87iVHiVBz5qnMcJHv4uBa6LME3Xg==
X-Gm-Gg: ASbGncvMGcIGTK/EC16ub2vtd3tt7PVeh7X3V5hRuET2zru79y5cawX5r6tTaBsNcnD
	y+JojrpprXqoRR8iFnYnYxNjHzAqL/bN6MAWpIyK9gJ/d1FVb9ZRaWnrR9mYrBJxmvesba2r86u
	yNoSgtv0G49JLS/0Ki1TWZvYQRDL4FTQaaafA07cy9tdCzV+Ie/3qf56x2uGSHp68FCCAIW6oGc
	/5+K3XgaHWR50qVWmzgF/lRHJiGltMT61/+UP6RhD35/0q5ZGB3dJWhF5sDhpA8/ENp9VHp
X-Google-Smtp-Source: AGHT+IFppVkXUZtU5Ti/lKVHNrZcFZH/mEntPtAhtpRBAEfq5xqQx4M1XdryOoDpDNSLeE8I2hMSbw==
X-Received: by 2002:a17:902:ce88:b0:215:a97a:c6bb with SMTP id d9443c01a7336-21669fca850mr59408385ad.12.1733822779591;
        Tue, 10 Dec 2024 01:26:19 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:89ce:2db9:f7d5:156d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21632c4fc62sm49006905ad.194.2024.12.10.01.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 01:26:19 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: mediatek: mt8173-elm: Fix MT6397 PMIC sub-node names
Date: Tue, 10 Dec 2024 17:26:12 +0800
Message-ID: <20241210092614.3951748-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_012620_738711_7445263F 
X-CRM114-Status: GOOD (  10.45  )
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

The MT6397 PMIC bindings specify exact names for its sub-nodes. The
names used in the current dts don't match, causing a validation error.

Fix up the names. Also drop the label for the regulators node, since
any reference should be against the individual regulator sub-nodes.

Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana board")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index b91072f4723f..b5d4b5baf478 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -931,7 +931,7 @@ pmic: pmic {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
-		clock: mt6397clock {
+		clock: clocks {
 			compatible = "mediatek,mt6397-clk";
 			#clock-cells = <1>;
 		};
@@ -942,7 +942,7 @@ pio6397: pinctrl {
 			#gpio-cells = <2>;
 		};
 
-		regulator: mt6397regulator {
+		regulators {
 			compatible = "mediatek,mt6397-regulator";
 
 			mt6397_vpca15_reg: buck_vpca15 {
@@ -1108,7 +1108,7 @@ mt6397_vibr_reg: ldo_vibr {
 			};
 		};
 
-		rtc: mt6397rtc {
+		rtc: rtc {
 			compatible = "mediatek,mt6397-rtc";
 		};
 	};
-- 
2.47.0.338.g60cca15819-goog


