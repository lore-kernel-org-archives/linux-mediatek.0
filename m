Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC41FEA82F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2026 07:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TJ34ULO+4B4J6OCPldF/OE/E1yD2HcPakHHg6DI67Ho=; b=pkNsGrKJQ7bxSFYW/CTgm/dynG
	CzjWzbR8AVSRI04A8pLdb8rCfLztG4CFdWPrVYBxBFA2QrOkTSPIp4UpjI5g8iN/722NnNcaKReHO
	wGLYTp+eeVndBUWmMTjcwzWcD7xlZrLBtQg1ZOnSQ+d8+CFJPe2iY3Ig3R4rA28wM7CjSBIpkMX1v
	8ypKxIw2ixWvnjt1omPr99HX/+dw1xBdAGUk/OvtX6yZcYqQfQOO01djvGQin1Btv912j9pi7DayV
	n3DiwpSNuCGIZvpT9ZAKYPrzaddDiaUhF3xjhhb1y18D4EOWRdc8i3j495XVoVnI28UsSSGgBth2g
	9tw17cvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8b-00000002tEo-45hW;
	Wed, 25 Mar 2026 07:58:49 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5J8R-00000002t4v-0L4g
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Mar 2026 07:58:40 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2ad21f437eeso4856535ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Mar 2026 00:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774425518; x=1775030318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJ34ULO+4B4J6OCPldF/OE/E1yD2HcPakHHg6DI67Ho=;
        b=hRD6VddqlfRmEeBG5up0gys0KyL9Lg/cPuKaXaceqjT0afJPQSqdNMo8PAtPDRo0cG
         SgioNxxjnOyHg3lexfsoiu+884Xsi7XLVthHRphdnhYgBbPdaC/9z6hszwz3am+AdOne
         Ob6pV3h61hBvLJku8CdZCI9Qf2YVHTQdmPq7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774425518; x=1775030318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TJ34ULO+4B4J6OCPldF/OE/E1yD2HcPakHHg6DI67Ho=;
        b=eGNF7yWGiFD+EIP70siuNc97aS2z6dlJxR+gRPiSVM9Nn0+iXyYsQ2sanB1IR9S7G9
         AyyO5IHa/sPthkySZtgC1OWYgxMwiqn44mKiPE5LQP14tuF7YhLJNniPvwd6upP8J71U
         Fqukv7hGOgstwCmDK1mLZLIjL5wTpGCboKTqdbGVNq5hKz7ykQ0D/GFUgjJsKAulaI9B
         lkNT+MNizo1IivFo2spic58MMShdZbGOtbpoB5KmBJfUcON/QLNSiddAOiOgx4g9h9Wf
         2kUZ5o873kk7YfaZPTvtgId8gIwulNrwgGe6+x/HrbNV2N6y8/AhPxS0+97A9QCV8kRp
         mkCg==
X-Forwarded-Encrypted: i=1; AJvYcCX9eigTr8zGxvM3a9pdvHsZOgmjXFyxOpsiJietoJGmbRAD6QkECtBiIv+uLodsWfp2no7TAOen5VoPZRUKXA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLJS2C4kon8xklRZvcQlG2r3LnIEgZP4IcuyQAnonx66Blo1GY
	YqzaXwJafGenhfQh1jvGDsT6OhQy/mz+XET9WzxvVgMjAKUkpaoPQP56cqTi6+a0uQ==
X-Gm-Gg: ATEYQzw+mh42PwcaDMOL7dsohyJ+neXrdATn38VguWImO+14H/V1XWbVZHNaJPKBPRO
	yWOi8mYn0bTtMhV73Tjmno/LtEe+7OyBVaKpdv6L1dUs8ALl9HCYydv2U8EQoF4pVFcWLwqL7Pu
	tPP/0Evz88UK9Lm1xHPyT26X2SBbJCmsgE4yFrkVlzH2L7Hszjgj8p+SD9yoXk7Y1p0rSjEFK8B
	YcoS1Wzbf5vYchVHM8pZ6RGlsdumVyK5gm+1Lpuu7gVBJyE5U3PH9pu8j8OZBR2g7IKKl6Jnqyg
	6lJDlJWuA9Y1a1n6YzyU+eLtkNIdFAI+cc1B8oYGBCwvTZKWFZxBHOYLsnQNEwXDtaoshVgrTPX
	8PMTG4yGxLWQBR6duz4NcnaO5VhQgERLFhoI4wHl+Txjk+26bIy0BjR28SRo7o8BGH0tXlH7tSk
	TgW8K6WGouuFtHlyHK+B14S19Yo5SDasa8AgcvvuOWAJr3KFQcLQKSIMk8TlJQteISNwHm3mO9l
	6INVQyKqei6EJ4rrw==
X-Received: by 2002:a17:902:ec8a:b0:2ae:4ef0:168e with SMTP id d9443c01a7336-2b0a4dc9efbmr60505455ad.13.1774425518163;
        Wed, 25 Mar 2026 00:58:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7ff0:bee3:7d45:eab])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08366c3f7sm219682465ad.60.2026.03.25.00.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 00:58:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Icenowy Zheng <icenowy@aosc.io>,
	Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
Date: Wed, 25 Mar 2026 15:19:48 +0800
Message-ID: <20260325071951.544031-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260325071951.544031-1-wenst@chromium.org>
References: <20260325071951.544031-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_005839_128414_D5D8D2C5 
X-CRM114-Status: GOOD (  14.56  )
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

The MFG_ASYNC domain, which is likely associated to the whole MFG block,
currently specifies clk26m as its domain clock. This is bogus, since the
clock is an external crystal with no controls. Also, the MFG block has
a independent CLK_TOP_AXI_MFG_IN_SEL clock, which according to the block
diagram, gates access to the hardware registers. Having this one as the
domain clock makes much more sense. This also fixes access to the MFGTOP
registers.

Change the MFG_ASYNC domain clock to CLK_TOP_AXI_MFG_IN_SEL.

Fixes: 8b6562644df9 ("arm64: dts: mediatek: Add mt8173 power domain controller")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 78c2ccd5be13..556e806b7787 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -505,7 +505,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
 				};
 				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
-					clocks = <&clk26m>;
+					clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>;
 					clock-names = "mfg";
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.53.0.1018.g2bb0e51243-goog


