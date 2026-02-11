Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B89ECD6D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Feb 2026 19:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0r+DLc8EhI/TicDqMaNt1y4zbafcSJbDHtWIpZZyro=; b=YwQ/Fy3vZoHhNxVWzi/UDgluWy
	WgIDjVKCANBzrJEYiCUO8DbnloaZdAvQxbNaPIpEFQEIC74fFg60PvnPQssRrTIN8kSHC4c2MWbXh
	rk1xK9kqFaudmf9yaUdShczSWyLjaw6heJeWju6W7n45rKF3iAoUWRIIfnNyXnG9TOXrOiMwuinu6
	p5vc0ty4irB6LPRxPgorD/WM16koW7pORGqYBrAxCdyxTBMCS/wKKTDFfXX30DbmKOYA8CeOKCOmE
	VBZLI7loodozto3Yc35AAi9vqRuq7epG5u4P+Fy0OTz71+HGsF2S7bOiSuebbSOYfXpczD/i7jQXQ
	pzVGMyxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFY0-00000000xhx-0hVQ;
	Wed, 11 Feb 2026 19:06:48 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqFXo-00000000xYp-2Xg4
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Feb 2026 19:06:46 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4359108fd24so4652967f8f.2
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Feb 2026 11:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770836794; x=1771441594; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0r+DLc8EhI/TicDqMaNt1y4zbafcSJbDHtWIpZZyro=;
        b=ejTcR0YA2YOXItHtfGkwaz16vxGYQ4eSHUMneqALUR56uccRrzHOU90LcsmULim1aw
         uQk5K17CkTAZk2cfxHdlSVIgp1t4ENDgCheBPuZ4u2GGQ1Kl3PMFb4/Z6tuFdhWBX2Ec
         Hg1+hOdrGfkKc/pG69BRLQOWmZGfoXKEIRa9yBA9UOZ8ukyQWAbMSuop17+tYX16445q
         qUD5Jfmo9CIgxlzCb3fEr9D1jHG+/dRtAUU2F6c9LcvY3fOEaKP4R7T1moatX2JbeMsz
         aZ4gooFk0sJIQxIc8xG7BjjM46gxbBUNob/yEHYvd6fUrN12wZyR6qtuVFAdaHyo1mAt
         5W+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770836794; x=1771441594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P0r+DLc8EhI/TicDqMaNt1y4zbafcSJbDHtWIpZZyro=;
        b=FzRSxlPMwUR/xwU7tRllWYZOmT45N5vdZhe6CiX6Th7H0G0L6L5s/Zc+pQZ5GInjgw
         QW7jt5HfUqXO0Im47snOcm+pI7PacJbcMHyKV/cWbQDfRUkC5IVqcN59r9fgC8JQfsDW
         ys8S0kVXtAZu1ghVoU09HV6cp2BcIZAX1EurqtZXLekXBB6FJkh2RwK4zX3upoQgwaKn
         bHsHswL83dI57rH64wHqhaBDz08/eVqos8u/uDk8Q2FuBQ9WGT8eCqNkmW39eHEHci9H
         ePd+5RNfdqHJVm2bEj1LQb/jfON+4gB2AwC8VgUXCN11q5J4Wfe27D/hPiuNUDNhmc9G
         SqzQ==
X-Gm-Message-State: AOJu0Yx3vaYTfxvfbM35uX2Y1ZGBFAGbzVgVZbROaJKEigWWY13lWm+d
	7VuoiPQxO4YsEjgvWSjBwPcqcboFcHsFqzrOBZ8iC9gkTNhPSlynugI9Y8Qz3eva
X-Gm-Gg: AZuq6aJqC/9E4ZFm/G8fbQrRIGK2Anf6NVsrJJ8/uxwWIrGSTTNY+L3Pc4jIQAnxI7I
	9MKSKcki2CGCbaiTzOZ1gc6Zl/K5NvvOrK9kcSMJNy2ekQn31EUugTjmtxPD6s2+WNtho0xrLz9
	WTH2CAYHBq0tBmA1pddWzPDqm8VYabqSNbocYJ2JQ7kUHGlpcQpUCSOtaqYhIpat6gm6cm1l1qg
	qBbB/G0vsnAYrXc7besKi92r3nec5yBxaJk05TbS4yVdNNZdZ3U+Ai7Td7QPzwwvVKZuEzxAOgT
	cBUCN7W/9rEWoFgwEdzHzfpg15EtE6g3CZimMc8E+zIVEcq7ATZ2p73n3FEk1hdBLDpgrk0usB0
	BozndUQj1g969vwCexV4JffrTlItxhVdD1aDDjgBISxge8i1fN4LPXVicD92hsgg534oA0PGGn3
	Fmx4mguBLopeyqTmtFNB4=
X-Received: by 2002:a05:6000:1acb:b0:437:6fcc:f648 with SMTP id ffacd0b85a97d-4378ac891f6mr930249f8f.53.1770836794238;
        Wed, 11 Feb 2026 11:06:34 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4378e122df9sm211223f8f.15.2026.02.11.11.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 11:06:33 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 6/7] arm64: dts: mt8167: Add the mmsys reset bit to reset dsi
Date: Wed, 11 Feb 2026 19:03:27 +0000
Message-ID: <72dcec7fe8bfd8ee7e8ef58708690268f3c07d42.1770836190.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1770836189.git.l.scorcia@gmail.com>
References: <cover.1770836189.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_110640_186906_676E8934 
X-CRM114-Status: GOOD (  10.68  )
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

DSI hardware reset is needed to prevent different settings between
the bootloader and the kernel.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index caf51f203dd3..ee2792d53b2c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -8,6 +8,7 @@
 #include <dt-bindings/clock/mt8167-clk.h>
 #include <dt-bindings/memory/mt8167-larb-port.h>
 #include <dt-bindings/power/mt8167-power.h>
+#include <dt-bindings/reset/mt8167-resets.h>
 
 #include "mt8167-pinfunc.h"
 
@@ -189,6 +190,7 @@ dsi: dsi@14012000 {
 				 <&mmsys CLK_MM_DSI_DIGITAL>,
 				 <&mipi_tx>;
 			clock-names = "engine", "digital", "hs";
+			resets = <&mmsys MT8167_MMSYS_SW0_RST_B_DISP_DSI0>;
 			phys = <&mipi_tx>;
 			phy-names = "dphy";
 			status = "disabled";
@@ -295,6 +297,7 @@ mmsys: syscon@14000000 {
 			compatible = "mediatek,mt8167-mmsys", "syscon";
 			reg = <0 0x14000000 0 0x1000>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 
 		smi_common: smi@14017000 {
-- 
2.43.0


