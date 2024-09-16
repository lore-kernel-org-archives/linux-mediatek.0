Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CB5C3ABA2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 16:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0oGX2cVcDg8n9bBokDIe5AJiMWrG4qmBl/bUEKpKSwQ=; b=pVlAufQRom+S0eVHoMvQUtqiYf
	wFyaiXhmj9ZHxOTdSp4OikUcHmySKvc6i3ofbegxnZNTBwI/rlxIaMnnxq7FqT63prSwRPkq6npbE
	doqmSNe2LUowImx99ibM1zBpc3Fl6YGuqWL/PB+Y4/EKbv9qR9TO2Gsnj4j5kIpHfTuvyrV+oDzrk
	FUwsWapsepukUfGPndN4SeISXW6Sa2VoZAS7Po7Jz8Ol4nte+A9+tsHW8EkyOHVWKSF2Ld3Dm5TNf
	23YaRkFNS4SPzE5AQU/yMcIAwldfvv8ZpZFMg3YmlrCnYncujxRC33HNDt46L8laAejYIdK6p6vJS
	q5YKVSag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqEcB-00000004STK-0rOM;
	Mon, 16 Sep 2024 16:30:15 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqEc8-00000004SSm-2VRH;
	Mon, 16 Sep 2024 16:30:13 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53567b4c3f4so4508501e87.2;
        Mon, 16 Sep 2024 09:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726504210; x=1727109010; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0oGX2cVcDg8n9bBokDIe5AJiMWrG4qmBl/bUEKpKSwQ=;
        b=QCkLuuKtXJmr+0XS36vKtebraSYq35C3TRBT0p9adtzi1O8JHduYbYF96671XXuVgX
         BAkHF/Og/QFfJDB1Njo8B3wHs+upAfujWi9EHRT2Mk23IJuzyFjT9cHbvPNwfE0frfnY
         CvJgqYcdVP4OJojp5jNM/1a1vx45LucdzcnLlmA87um79VFxohzYmxo40YLZivlIs3+J
         C6ODux3hLnE6YBdeRD/Pigdunr0VwUgUlMScHq+MP0pGu3pb6JlQv9t9Gk0pLOmjqQAF
         iDKJaJkmRp4WQiRh7sUC9QRkjTsZbb86YPnQSQwn64Uh9zICAkPJlCoHNIclxeIVIiJw
         uHSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726504210; x=1727109010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0oGX2cVcDg8n9bBokDIe5AJiMWrG4qmBl/bUEKpKSwQ=;
        b=BQqOw3hxgGSMVhevGUMatcMrRF51fPA4RToOBuz94wDQgaL9OYg7AqyCeORnnjk1EA
         /1KPBKtCi0pibO1yCnPVGM37mKpLjY8dHRaQ2s3gxs4OIcntfSxUeIOepW4s/j2pzDap
         988S/f17gOOPxXywvfnMHwJfF9ji242G7GdXCSEmFo2vh++ie1ox50CNk6WJ9Ps/xlDt
         WIkZ4ZruIs7SBML6s9w55bffeYaa0K+d/jE1VuNgRRi4ZCd1eQGRRaD4TN4XANwU9z2i
         Qwmg0v4ax9Rv4aYWedlCYuARnAzvLFZad3XoXEyaLCAcvMS6FaoLKiErGoc+Kw4vnYCb
         O9iw==
X-Forwarded-Encrypted: i=1; AJvYcCVqB5mgCkmz2F4+jkvxo9PnCz7CWP+wf+OZCzFxixQXG+sZKsWIo64mp7vAeLLNWvRYY3mXaNlH7GAuSnxkC547@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx+W1XNaPCwb4RJ3g5HO2r/5RAbfrE0pwTno/27PeKZohpdjrR
	1CJ8lT5axqKMp4RrpJwoAo8sd0AUoYht5XPQu5H9vXrQS0dcwvOtrH8T/9Cz
X-Google-Smtp-Source: AGHT+IHtcJ1YcDrAz2kQKqR5WKY41KEmQUmaGuv89pTxIR7GbvzwLNEv+6RonALiz+sDYt30CX/Rog==
X-Received: by 2002:a05:6512:15a1:b0:52e:999b:7c01 with SMTP id 2adb3069b0e04-53678feb0c0mr7958701e87.48.1726504209925;
        Mon, 16 Sep 2024 09:30:09 -0700 (PDT)
Received: from ALPER-PC.koi-vector.ts.net ([178.233.24.52])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5368709656bsm930130e87.171.2024.09.16.09.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 09:30:09 -0700 (PDT)
From: Alper Nebi Yasak <alpernebiyasak@gmail.com>
To: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: Pi-Hsun Shih <pihsun@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Pin-yen Lin <treapking@chromium.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>
Subject: [PATCH] arm64: dts: mediatek: mt8183-kukui: Disable DPI display interface
Date: Mon, 16 Sep 2024 19:29:32 +0300
Message-ID: <20240916162956.267340-1-alpernebiyasak@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_093012_660004_5A1CFAAC 
X-CRM114-Status: GOOD (  12.17  )
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

Commit 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183") adds
a device-tree node for the DPI display interface that feeds the external
display pipeline, to enable HDMI support on the Pumpkin board.

However, the external display is not fully described on Chrome devices,
blocked by further work on DP / USB-C muxing graph bindings. This
incomplete description currently breaks internal display at least on the
Cozmo board. The same issue was found and fixed on MT8186 devices with
commit 3079fb09ddac ("arm64: dts: mediatek: mt8186-corsola: Disable DPI
display interface"), but the MT8183 change wasn't merged until then.

Disable the external display interface for the Kukui device family until
the necessary work is done, like in the MT8186 Corsola case.

Fixes: 009d855a26fd ("arm64: dts: mt8183: add dpi node to mt8183")
Link: https://lore.kernel.org/linux-mediatek/20240821042836.2631815-1-wenst@chromium.org/
Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>
---

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 22924f61ec9e..07ae3c8e897b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -290,6 +290,11 @@ dsi_out: endpoint {
 	};
 };
 
+&dpi0 {
+	/* TODO Re-enable after DP to Type-C port muxing can be described */
+	status = "disabled";
+};
+
 &gic {
 	mediatek,broken-save-restore-fw;
 };

base-commit: 7083504315d64199a329de322fce989e1e10f4f7
-- 
2.45.2


