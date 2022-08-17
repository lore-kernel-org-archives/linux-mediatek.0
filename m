Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63224C32772
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 08:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XFhFdGS4gab18LiNO0E9EIMJdc3E4TwobGsMEPo69aw=; b=YQMhz/Iwfygrd7TDyXQZUDobUt
	L7k+tUJ6wVfm062euLXL+TY9g/TPi9spXifPTMBEkCde+wMZVkIQUTuyM8wIk2Dz37aox09IesaJY
	jzoKCiYJy+S/rHi+ECiBlHch8/tRU5e8sZiJkESxsV1My8rXER3FujuQJpdhSJ6uGYp5MpkDph6k4
	VdiJocR7JF29EueROZv3YS3D5fJpN3pExOcWNXmsfl4f43vkE4kbui2w7Qq6mTzEhZKGrTqv0wVHg
	2RDi7Q2d3UkXIcxH7/0Lq8AieL8UsLeUfp+ZUsHEOGv7UbN7fUoRI9oPp30PY/WG3a+r1hsK+h9jA
	nobIoisg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOE9y-00Ef2N-58; Wed, 17 Aug 2022 08:12:18 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOE6f-00EZgg-Dk
	for linux-mediatek@lists.infradead.org; Wed, 17 Aug 2022 08:08:55 +0000
Received: by mail-wr1-x429.google.com with SMTP id bs25so15322623wrb.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Aug 2022 01:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=XFhFdGS4gab18LiNO0E9EIMJdc3E4TwobGsMEPo69aw=;
        b=6SH+adSirsQoZZ7hs2noCxi688TUpUJhcU0j79bRwxs/rHH8544iWt2GNS+4gkg1Kt
         c+MnCThDyXByjMNz0sV7zovfXokhtb0HR/SiCUCAGgZHY0OS2dOtmQz/bAHKDxmS8GJk
         vP0AxBjik0XVs6MwvhVZfc/BIJ3GZgclGg5oneyMi5gs/wKyEWhyRkUi27jZtM43z5h9
         0XHhLuJDzHRsazjbBd6fWRBVaxIiBV4K5FfofPp0Ny+k0SgGARP21sXNORwQXC94c9eB
         NId4tZ6/v6t8A5eX7JGmiiZ8PasGUvXyQ3V0NUGQq6KPtV6WQg49X6tJ7PSlv+yxb6An
         wBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=XFhFdGS4gab18LiNO0E9EIMJdc3E4TwobGsMEPo69aw=;
        b=fJvBw49KFS2+PqKNG/0fnywI5F2QrXWfr+k1UwLBROZh2w/Q0BYIDUIsgj7J438tKA
         jlIvjxrvVrr5rlHByxi9pp/yBnQkyxFALm7KW6ivk9t0dq+wbD1MZPnqYhKrW8pPdByG
         vgs8uP2q62hJ14NkoqzLePyuMKsysejLxRzbSd/tG0NZJWvpqKxycSMQ1wrwpz+2pKta
         vBMKJjk3lN4S4aSCeMqQE+b001zwLqSmoYKsHZtZsj1fKjxezegOFds1oR/oH0XHIgAN
         piEmBm7xqAn7K3jR04XClkxOcM26rgNz9yvdUSomi86jKvfHwqWmQaFeIrVzQZ8WCCoi
         PkLw==
X-Gm-Message-State: ACgBeo0K2Ig5Wj1qko5va7AURlrzVv7s5IsU/O5IZgNBU43ILdEb/RNX
	kK9BwBkUdxRtwgcI2QbVz6xLIQ==
X-Google-Smtp-Source: AA6agR51Zl6xt+vxQT7gT7KACFEBbbFyESTGV94CTa/rv4g0vzVgLg37XjUImbsILtMPON9atLrVTQ==
X-Received: by 2002:a5d:6f05:0:b0:223:8bfc:dd0f with SMTP id ay5-20020a5d6f05000000b002238bfcdd0fmr13349400wrb.547.1660723730931;
        Wed, 17 Aug 2022 01:08:50 -0700 (PDT)
Received: from Balsam-ThinkPad-T480.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c19cf00b003a54d610e5fsm1391992wmq.26.2022.08.17.01.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Aug 2022 01:08:50 -0700 (PDT)
From: bchihi@baylibre.com
To: rafael@kernel.org,
	rui.zhang@intel.com,
	daniel.lezcano@linaro.org,
	amitk@kernel.org
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	khilman@baylibre.com,
	mka@chromium.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	matthias.bgg@gmail.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	james.lo@mediatek.com,
	fan.chen@mediatek.com,
	louis.yu@mediatek.com,
	rex-bc.chen@mediatek.com,
	abailon@baylibre.com
Subject: [PATCH v9,5/7] arm64: dts: mt8195: Add efuse node to mt8195
Date: Wed, 17 Aug 2022 10:07:55 +0200
Message-Id: <20220817080757.352021-6-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220817080757.352021-1-bchihi@baylibre.com>
References: <20220817080757.352021-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_010853_525370_A618628C 
X-CRM114-Status: UNSURE (   8.33  )
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

From: Alexandre Bailon <abailon@baylibre.com>

Add efuse node.
This will be required by the thermal driver to get the calibration data.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
Co-developed-by: Balsam CHIHI <bchihi@baylibre.com>
Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 066c14989708..95967a0196d8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -733,6 +733,18 @@ u2_intr_p3: usb2-intr-p3@189,2 {
 				reg = <0x189 0x2>;
 				bits = <7 5>;
 			};
+
+			lvts_efuse_data1: lvts1-calib@1bc {
+				reg = <0x1bc 0x14>;
+			};
+
+			lvts_efuse_data2: lvts2-calib@1d0 {
+				reg = <0x1d0 0x38>;
+			};
+
+			svs_calibration: calib@580 {
+				reg = <0x580 0x64>;
+			};
 		};
 
 		u3phy2: t-phy@11c40000 {
-- 
2.34.1


