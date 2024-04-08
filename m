Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FC7C67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MmqygqPIi2pmOIAveCkmELtI1ENdExQ5dYj28gsYUKI=; b=gQ/wlCd0EcThb4Mra1j+k3ploV
	bGUGo415vBytmNDP6fC+JFf98WCAC51ArCAd63GfYe/pF95Xg4KNniSPYBfLZ1vSXVSwa57a4Rmoy
	2QYDu7sGp8SfwWt40SqWFlzfZVENx9GaWpGxOIPdTtVivaLFb5f2bmDhW0oSHphtBC/jwWYLmWfvp
	vjOpfQrkRXJqaulUETjtcaUrRTixXumLwCKz0gbVrahwvlQJ8GMrNZeGL4/iEDg8+QBLIdeAmQX4n
	hnVhbFw4L7FnAa3kVaTm1S20o0kF84RkvmZGTuRs9Gp36R7RjjbMoiJxCcHlsW6p6eb5UGL1k707O
	1+XqkFDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtlo8-0000000FBeg-1Qzz;
	Mon, 08 Apr 2024 10:00:56 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtlo4-0000000FBcW-1AS9;
	Mon, 08 Apr 2024 10:00:53 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so4969982a12.0;
        Mon, 08 Apr 2024 03:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712570447; x=1713175247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MmqygqPIi2pmOIAveCkmELtI1ENdExQ5dYj28gsYUKI=;
        b=mRQg+4ke9KUVA0QA8Tw+31/TJCKtKxklpAQLSBolmLAQfFbZrodLE6KGrxBD9GxM6n
         VOIiFI3zPODARq8j225ZIvMoCfv7lDdgcUbIuXzUowSyG2GXYyUvD+6j0bgmb53B6pir
         oYz/q1Gf4Uldtky/pVNR2WK/epYsqpK1ANZfN/I3/H1q9n4u/Xvq6+1omlyVnRX5m31K
         BRdr0I+E5JiayRi5eVN5FYxN5LiH/lWPwlJkNitEpytkyp6hKuTUrEqQATgkj2GeqJcX
         u1aRMSu6Jh5zjHFs0Qen8x4Sk2DJY3HzSDfxWDuit2/OUEl30PZ7n8dJqmFUZVT0IE9o
         XOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712570447; x=1713175247;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MmqygqPIi2pmOIAveCkmELtI1ENdExQ5dYj28gsYUKI=;
        b=rbsJ3llGKPnjD36q1l7khIHHq8NvmYTicccv7Xf0hrZDHByIkdEfaX4PeEowBEYoKw
         8xDAmDpVgnKx2DHDPv7Ew84lY48vL8pwr/IhpphBIeC2y19LrSgj61vFVqVAUxceTgV3
         Iu26eIllYdDehFMRTPTziYzzKP8N6D6g35pb9sdP03EL0BQv9t8j0vHgV5ybXaHorPGz
         MsqicKs+7hFhd3PhXYxHEK3c9utWZt83+aQIiMLwxZ6qF1mnStCewTjdLQzCCNdcGcD+
         eQVVckoFPXVeCXRVjEWkbfVoFw+nrAr3NMPmInP5jLhzshkyQqMAL8THGPY/u09fu38Z
         LegA==
X-Forwarded-Encrypted: i=1; AJvYcCWDB4EQjcG8FihchJh9Q8t6KhqVO7BV86tJOjMEC2Pd2NqykpcvqKIp/vtWT8fXPH+chwz1i3jkMH6nX9rRElol0YbVhCm2psBIVlKJWX5k+eY6EgM9R4lqbF51Nh2QqkXudvxxOqZ0/6Css+oAyuFOC+czlwRASIg=
X-Gm-Message-State: AOJu0YzwiYQQkct+HXJGsxwD9Fpu/2H1WFsK6qLKBFmodO5jLLXStZ74
	jJJfXtgP87ViSDevI4HlE6r/NS9dvrNasClmJqXdaS48H2saBHFW
X-Google-Smtp-Source: AGHT+IE6e3zft5dEHLDKboDSRcCws1sIWye2Ny0tIb1ztMu8FS3I9a8HiSg+0wY1xi3qFJMrqR34cw==
X-Received: by 2002:a50:d784:0:b0:56b:9f35:65f9 with SMTP id w4-20020a50d784000000b0056b9f3565f9mr6978903edi.0.1712570447269;
        Mon, 08 Apr 2024 03:00:47 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id bf20-20020a0564021a5400b0056dd3626035sm3855590edb.91.2024.04.08.03.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Apr 2024 03:00:46 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] arm64: dts: mediatek: mt7622: fix "emmc" pinctrl mux
Date: Mon,  8 Apr 2024 12:00:40 +0200
Message-Id: <20240408100040.25997-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_030052_362674_E5F039AB 
X-CRM114-Status: GOOD (  12.05  )
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

From: Rafał Miłecki <rafal@milecki.pl>

Value "emmc_rst" is a group name and should be part of the "groups"
property.

This fixes:
arch/arm64/boot/dts/mediatek/mt7622-rfb1.dtb: pinctrl@10211000: emmc-pins-default:mux:function: ['emmc', 'emmc_rst'] is too long
        from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dtb: pinctrl@10211000: emmc-pins-default:mux:function: ['emmc', 'emmc_rst'] is too long
        from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#

Fixes: 3725ba3f5574 ("arm64: dts: mt7622: add pinctrl related device nodes")
Fixes: 0b6286dd96c0 ("arm64: dts: mt7622: add bananapi BPI-R64 board")
Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts | 4 ++--
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts             | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
index 224bb289660c..2791de5b28f6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts
@@ -329,8 +329,8 @@ asm_sel {
 	/* eMMC is shared pin with parallel NAND */
 	emmc_pins_default: emmc-pins-default {
 		mux {
-			function = "emmc", "emmc_rst";
-			groups = "emmc";
+			function = "emmc";
+			groups = "emmc", "emmc_rst";
 		};
 
 		/* "NDL0","NDL1","NDL2","NDL3","NDL4","NDL5","NDL6","NDL7",
diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 41629769bdc8..8c3e2e2578bc 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -268,8 +268,8 @@ &pio {
 	/* eMMC is shared pin with parallel NAND */
 	emmc_pins_default: emmc-pins-default {
 		mux {
-			function = "emmc", "emmc_rst";
-			groups = "emmc";
+			function = "emmc";
+			groups = "emmc", "emmc_rst";
 		};
 
 		/* "NDL0","NDL1","NDL2","NDL3","NDL4","NDL5","NDL6","NDL7",
-- 
2.35.3


