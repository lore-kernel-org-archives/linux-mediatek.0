Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE401D1171C
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Oct 2024 07:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ocz8O19Ri16sCIqDKqqWyBeGwEbvKhFKD3K8dqT+N6c=; b=wsVUGv8lyVEvumUIxYhEc2rlTO
	A+TC8xmUJwvOW2BV9VraSJUWEcEqdfmJeLA1N4W75xULxLegvvumr3gEkn8HIzKCC630m2gaNGXy8
	APWycGUpXXRtf5iDmR7QWzQSbYoXRwEQMNHnbQvLaHhKv/+LsqirYIs/Y09Utk8G8jJG060ohPjJm
	DK+BGRXikL43g0BwhqOyb0B0jU/9q2zGU7vGFuaB1hGs+/wxw5rRc6NNsd3uPWAb+PXvGlOsxI8wP
	xvo4jOHDyUzoKs2xmA4p31szglgHKWoBzBZB9GrovrI6Pqq1Quva0tY8sTXVqEZ4QdMCYFlDD1AaN
	ERmfr1bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FD9-00000002spw-3qdy;
	Fri, 25 Oct 2024 07:58:19 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4FBZ-00000002sYV-3DWd
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Oct 2024 07:56:43 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2e5a0177531so1329479a91.2
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Oct 2024 00:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729843001; x=1730447801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ocz8O19Ri16sCIqDKqqWyBeGwEbvKhFKD3K8dqT+N6c=;
        b=X0yFuEieUeXYQ7rd2MQ43x0rRA68NWy6F1FbGC9nGr2BvKfkB9hTRgzsr4cmsEUj2I
         MWIeAqIRN+RkF8fFsgzfOSnJpsFugz0SchlUYFiVOOcrCRaAjykAkSy5crWC6N2ppkZW
         X2HiFkYt/vEPf8jmjhpleb24bWrWCBwoP+PWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843001; x=1730447801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ocz8O19Ri16sCIqDKqqWyBeGwEbvKhFKD3K8dqT+N6c=;
        b=lJcJCIMBCKXGSE8NUHUQnrzc8qhYFWq6sFUhVr18n0UiKXzusKURUcgGiwoplsJrCE
         371taRW+e4jSemTWN7u1Q/X7xZI/nOJ5IaH9t/9m+MUoAeHKajNOVy/f91xz7fglO6de
         b08KIKqrQBnfxt0xsFVY6VwoqD3+qIoVYD7QzIIGJli1/d9A6dAb5BoEGOQYHJhvhftQ
         z1s/q5cBSq7g9HxstitFB1b0Ntt2xKwSf0LocEMm6E0UnWaMi3SQpDvtzjg2HrN8So5r
         BC1tJBOBk77TJr8sLkX/2mV/lkKMG+M8S9d4fz12eHIlF/LXFniVfwQisX1WIlQzQjZU
         ODZg==
X-Forwarded-Encrypted: i=1; AJvYcCVbWWCsKCO3LqediNJznodHJgqcmEvQlZw7hae/S1OvpfS8OjwEgsoJcRGEqCHGiARToqQ6k+OeWAxFP8YvLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyyM0bRDYtVw6H/gz8PHOkcZvKOIZZmyzynbV9F6qi9SSuFWf+5
	iO1EsBZ4ZvFF+CmPDEbCpwRQlGJm1/WhI5jzfCdFgNh7VvkMo8DL/joAFuMvAw==
X-Google-Smtp-Source: AGHT+IEhpzhZePgnGrlXh89W3IHK0viadpu28ous3jPT9MS8vhveF6ukqC0oYeARpOE5I3mtsl0sYA==
X-Received: by 2002:a17:90b:30f:b0:2e2:e82d:48cf with SMTP id 98e67ed59e1d1-2e77f4a274amr4863299a91.16.1729843000877;
        Fri, 25 Oct 2024 00:56:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d8f:752c:c7f1:3169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e77e4c9c1bsm2797553a91.19.2024.10.25.00.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 00:56:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8183: Disable DSI display output by default
Date: Fri, 25 Oct 2024 15:56:28 +0800
Message-ID: <20241025075630.3917458-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241025075630.3917458-1-wenst@chromium.org>
References: <20241025075630.3917458-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_005641_876285_CB3FEA38 
X-CRM114-Status: GOOD (  12.77  )
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

Most SoC dtsi files have the display output interfaces disabled by
default, and only enabled on boards that utilize them. The MT8183
has it backwards: the display outputs are left enabled by default,
and only disabled at the board level.

Reverse the situation for the DSI output so that it follows the
normal scheme. For ease of backporting the DPI output is handled
in a separate patch.

Fixes: 88ec840270e6 ("arm64: dts: mt8183: Add dsi node")
Fixes: 19b6403f1e2a ("arm64: dts: mt8183: add mt8183 pumpkin board")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 4 ----
 arch/arm64/boot/dts/mediatek/mt8183.dtsi        | 1 +
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index 61a6f66914b8..dbdee604edab 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -522,10 +522,6 @@ &scp {
 	status = "okay";
 };
 
-&dsi0 {
-	status = "disabled";
-};
-
 &dpi0 {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&dpi_func_pins>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 8f31fc9050ec..c7008bb8a81d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1834,6 +1834,7 @@ dsi0: dsi@14014000 {
 			resets = <&mmsys MT8183_MMSYS_SW0_RST_B_DISP_DSI0>;
 			phys = <&mipi_tx0>;
 			phy-names = "dphy";
+			status = "disabled";
 		};
 
 		dpi0: dpi@14015000 {
-- 
2.47.0.163.g1226f6d8fa-goog


