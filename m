Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CAD9C77B72
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Apr 2023 12:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9wZohT/rXRJ7RxEfPJSlKRsC6xJ8iy8PXX3oqB2TB2A=; b=h58r8xiIeOMB7QKAWYCkXMsi7M
	DgUEV+cBUSy84YERLTQICqj9Fn5RD/tzmsqT3R1WYmFS+iOD3rs18AJx/FDjtem/3wGFVDiBAgYZm
	uxE/ppmn+kGl7ikecHohR6h6p4vHCQB11Q4a4gcsGA771T/PmiC4gcqhwD4T2JITjLUXrRxEFNzzu
	XKt+ddgrYgAPF3sh1VkUXFBjt7lHa+2ZGyXTtxmMkWi4YVx86yAnFbw+KvPqWBQ/Q0up/neN6XYmc
	Wv8yS/jn1N1SM3r5AMeeYOYOe5qB3Hz5LqD+eGW4wj58Mg/5dgNddW86CSA6xPg077jRMnNaUUWzr
	BsG9kozQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poO9S-00GAVB-1J;
	Mon, 17 Apr 2023 12:40:10 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poO9Q-00GATw-1z
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Apr 2023 12:40:09 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d15so8256619pll.12
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Apr 2023 05:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681735205; x=1684327205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9wZohT/rXRJ7RxEfPJSlKRsC6xJ8iy8PXX3oqB2TB2A=;
        b=L5kG2yNcDDrg4gc3IALK+Yb2SB9Q4uN8X3KQqJhb41hm0SKz2nxeH/xReR+dIyPsWd
         mHdkLsagwuVp+SqIAqUQfvU4w5Rwnc5l5r1JBnfrI0OGf01GCi3zz7YUwah4nUtfDYeZ
         rHBDB3tgAKpSyZc87VWKGyTaUoF+O3orNj0pI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681735205; x=1684327205;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wZohT/rXRJ7RxEfPJSlKRsC6xJ8iy8PXX3oqB2TB2A=;
        b=jZgq08eq0ahTPuEjWapWSd5LGHMyhaY+6iw8sgx2RKjohqItuD4ZkxC+Z6oqmj/nSn
         Zl1BDui9Q+OWLp0q+INxFd1AJPdK04kZWFYoiRrpfDrL1L/RsSekWNR90cF21CtK9tD+
         B2oViW8w8FLYQiXEn+l2Hzb0o+bMqoWs3s0zJUagpyogNqydQt5QD6kkcerBp7sPz8gp
         GfmuY3VhGTkQ8R3FJO6U/5koskGdmEqpRmeoCpoRUdBZGY2ZOKQui01QpTc7mW9QRO4v
         KexaZv7pKGwoTtm2eIrNIY9k6P/NWvddewb8tCdnvziQEwuTONA8+/PzvSFyckZbk1u7
         qJBA==
X-Gm-Message-State: AAQBX9f7ENCMur389snUpdaMDLktRMRalYndKppCJLTCZPZvPxNz7rkW
	Vb1WE2smBW8jISNHWK6HvuTAJw==
X-Google-Smtp-Source: AKy350amnx4vQZWZh+xVgxnz5F9g1Ghxm0KeskyBP72RnpTiQW5hibRE3/bNwwAs389ftS5nG+HdUw==
X-Received: by 2002:a17:902:e811:b0:1a5:898:37aa with SMTP id u17-20020a170902e81100b001a5089837aamr15105552plg.15.1681735205392;
        Mon, 17 Apr 2023 05:40:05 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:c8e2:dd4:3c45:24e2])
        by smtp.gmail.com with ESMTPSA id p11-20020a1709026b8b00b001a6467cfbeasm7595361plk.53.2023.04.17.05.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 05:40:04 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Doug Anderson <dianders@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH] arm64: dts: mt8173: Power on panel regulator on boot
Date: Mon, 17 Apr 2023 20:39:56 +0800
Message-ID: <20230417123956.926266-1-treapking@chromium.org>
X-Mailer: git-send-email 2.40.0.634.g4ca3ef3211-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_054008_654454_51BF014E 
X-CRM114-Status: UNSURE (   9.98  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add "regulator-boot-on" to "panel_fixed_3v3" to save time on powering
the regulator during boot.  Also add "off-on-delay-us" to the node to
make sure the regulator never violates the panel timing requirements.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index d77f6af19065..03d1ab2ca820 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -96,6 +96,8 @@ panel_fixed_3v3: regulator1 {
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		enable-active-high;
+		regulator-boot-on;
+		off-on-delay-us = <500000>;
 		gpio = <&pio 41 GPIO_ACTIVE_HIGH>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&panel_fixed_pins>;
-- 
2.40.0.634.g4ca3ef3211-goog


