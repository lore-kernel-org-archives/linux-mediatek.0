Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E219D15D98
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lVisE+PE807hpO8CSAN7tilp7Z5USiSARLUB5mQ6sGE=; b=cFcIkYJfV2l5x/VDDioZcsxmuC
	TlTznJyM3SMvgZREULE4HEH6SRsJ2ZtsGShlC3jF2qcnEECtwZie8iiN1lJqqPh9WUU7o5x8orxJq
	S8LbJgMUXB1p1Hi7zXQWYabQWtzA0lFLu2m7oRW5Pz6lLiJvEb0BnGsTJbteNm3HLwHNJjXTXbvjB
	u+UCxVEuKir9XpR8tNxDQDpFJY2RFfunChMci3Jw+P9muhQazL6uweeLrOwHK1keHieROEeUV0Rno
	XOgWUr2qKjWhlpQTxNhZiKFYPRugzY5b/SD9pNXQG0Jq4rDfr+bP3RNAoimggvMktoX8xhSvQOx0/
	DvNFpKfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tLc-00000007bst-3hmc;
	Mon, 21 Oct 2024 14:25:28 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2t2d-00000007YOO-0Y0i
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 14:05:52 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7cd8803fe0aso2981226a12.0
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Oct 2024 07:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729519550; x=1730124350; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lVisE+PE807hpO8CSAN7tilp7Z5USiSARLUB5mQ6sGE=;
        b=g4tKVJLSoIUwICvLBcosiw3Jh6hg0/w1ahYplQmdNQGC9pEXcNiCH0vYLrNXI7fAig
         4m4tPvR2ZAPQ2ovYkH7ORMHWxfvknFfkPQhVZDC+DIXHAEJ7Jm0ZeN+GCrZ4Ydc877W9
         1LLQ8CDI6xxA8Gdir3rVI1dQmEpMSQA9WnpXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729519550; x=1730124350;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lVisE+PE807hpO8CSAN7tilp7Z5USiSARLUB5mQ6sGE=;
        b=QMV2NuPBco6oO9VuR+r57cuQXVtv74or8Y5fWGY9dqkI5wnALYhi2FRtgnr7fE8IUV
         2E1PobPIQ4cj+WcfI/iII+ew32qE9vRs/qYyaSoQtppI6oSfn6LMJ33io2YHhPDJV5o4
         JMIjNbtg+NUDP3QkE0mmC9cgCRmilzZcB1jNpuuhfCNm6tRz5UMa9UI8gIztKS+tQEm+
         dBGr/NjYvdzrub1g0ARhIbOv0cPzhCD08t4OdBQo2x7U7oRAKS38DXUulahWQRyB6M1r
         uN6+IGJJTSBYRZmzh4I15Veko77EjfJNx5+P5RZszk0bPDggY0KnCxUM1AV73hhj2pW4
         cxSA==
X-Forwarded-Encrypted: i=1; AJvYcCXSCFss7M889cJ11mLGJyIoGjwGDnCUEH4TPQr1msLewk+WstSUEohqmXuQNhjRpg/s0JsQWpV5Y4y+jmV/eg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfgHWBavGN8c0iTL7ej0QPlQVdJfP75v0i3bsmp8WlD/LisJan
	jTt1w/SyPFVCW80ggy7pbGM6ZZnHYWREzCLTNwBqkPvpmGmmmFc288BfDwy2PQ==
X-Google-Smtp-Source: AGHT+IFKl8bzamnuWMLgNJkuqVRi9dnOVZzxVFFalqgJLx3tvd/wT7dAvKU2gZg1sxaZIisSRMrfSg==
X-Received: by 2002:a05:6a21:350d:b0:1d9:ea5:19da with SMTP id adf61e73a8af0-1d96b6b6ed5mr25344637.17.1729519549873;
        Mon, 21 Oct 2024 07:05:49 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:ecc1:dced:8a05:e4d8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab57e36sm3133318a12.43.2024.10.21.07.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 07:05:49 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8186-corsola: Fix GPU supply coupling max-spread
Date: Mon, 21 Oct 2024 22:05:36 +0800
Message-ID: <20241021140537.3049232-1-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_070551_219176_A59C0F56 
X-CRM114-Status: GOOD (  13.29  )
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

The GPU SRAM supply is supposed to be always at least 0.1V higher than
the GPU supply. However when the DT was upstreamed, the spread was
incorrectly set to 0.01V.

Fixes: 8855d01fb81f ("arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Noticed this while trying to align the downstream Mali driver to the
upstream device tree and binding.

 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index cf288fe7a238..db2aca079349 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -1352,7 +1352,7 @@ mt6366_vgpu_reg: vgpu {
 				regulator-allowed-modes = <MT6397_BUCK_MODE_AUTO
 							   MT6397_BUCK_MODE_FORCE_PWM>;
 				regulator-coupled-with = <&mt6366_vsram_gpu_reg>;
-				regulator-coupled-max-spread = <10000>;
+				regulator-coupled-max-spread = <100000>;
 			};
 
 			mt6366_vproc11_reg: vproc11 {
@@ -1561,7 +1561,7 @@ mt6366_vsram_gpu_reg: vsram-gpu {
 				regulator-ramp-delay = <6250>;
 				regulator-enable-ramp-delay = <240>;
 				regulator-coupled-with = <&mt6366_vgpu_reg>;
-				regulator-coupled-max-spread = <10000>;
+				regulator-coupled-max-spread = <100000>;
 			};
 
 			mt6366_vsram_others_reg: vsram-others {
-- 
2.47.0.rc1.288.g06298d1525-goog


