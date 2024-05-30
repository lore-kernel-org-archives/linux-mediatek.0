Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333E4C25B74
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 08:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SmWglR2Ij5/TGj5MHHzWjORF1jpZWpClgT/eZSAiwmw=; b=dmLE7k6TS4GlUZOYZARH4VpwOZ
	0NmlVfTAAGoism2rdmf03cIvx06mMGeltqnL7Q8GViILzk2bhfJnoLx9kJnBvXYkwCAJ/RmiVoLOE
	yDUQJiD3wHElxcE0KKhqXG5KiKsvYH0S9Jev9Aa6AR5idHu6qIwU8Nu66n8Wlqt1TPmGmyPlqjs+O
	Ztjp+GnzxXqVxOR+dLBSgFPRKKP1btMPZI5akRwcThaqCwPXjVEHt+1g2l/mA8SAaFP5KB8BFyaP1
	nWVqKxqgOSEkRNNl1R9KAVv5K5DNckprVepGe4plXGm2QlA6ezX2CcI72qqvvkQlIzRL/HyWd0jkR
	sEABFapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbGz-00000006eKw-2wvF;
	Thu, 30 May 2024 08:36:33 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbG6-00000006dr9-1S41
	for linux-mediatek@lists.infradead.org;
	Thu, 30 May 2024 08:35:42 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1f3469382f2so5122305ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 30 May 2024 01:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717058138; x=1717662938; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SmWglR2Ij5/TGj5MHHzWjORF1jpZWpClgT/eZSAiwmw=;
        b=dgdwlRSzc4MJP7IiOfmFXyojkNb1LtjAzuc+Yo13RsIwfCUVhJMdDVZ20N+TkFPd35
         NRi/D9BpvQXmQQZirhMfjhz9HqRxQnAhec3p5NE67QihfFXbN7fNltcpqFyIuhwomj3a
         t7CigDGZVFE+1A1T29VQdY8RXlZF9EktmC12Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717058138; x=1717662938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SmWglR2Ij5/TGj5MHHzWjORF1jpZWpClgT/eZSAiwmw=;
        b=SPNfHBddzej06t3WKFugjMpAVHmc744PPIPJshgkdYBloYO7ELMcyhmGZ1OBzhdZjq
         Q+BsEBlIZ9isPTR8dhtStxJVH1ABxwMbjsD5sx12i/PSyluw2Ga0tfVGW5xqzW53I8/K
         pnfLBEV9DT/+Qp22LYQKWEJ0o/1G/SZg8lxlXL3GzMphHo4kG2w1UNjWpTSzHtHRDEQ+
         q6FlFBRybtO1ROoSJSMsf7mIEO1Fc61arA/M+A+SxwWNVpTpgo6of9QPSiEiTFwXHfm8
         SrKAUEu9p+jdfl4NpOMG2yUtlj2KP7uh6UMsa3w+D/9iwVzLW6875QTBRUnBQx0NMxqz
         0ciw==
X-Forwarded-Encrypted: i=1; AJvYcCVPaE8k29nCdvaVmf9eNolJl8N+weG178lk9yHP7UNkYfTuwIFzSuSo2htX/mV2w4Dca/Zywixaozr70+YEtpYSovNXo4u4VhIQTKYHtIxQ+umy
X-Gm-Message-State: AOJu0YxB4SH6rXRKL2Ee7rhDDdiTND1LI4ADfe2LJACNJ8zdkBEvebap
	Wy9+66rk9i4BXZfnjLCoaUKah1hnRYVRVyj/d8OumO93sXY1E8WMVz++O2XrHA==
X-Google-Smtp-Source: AGHT+IFpzoyjS8oEHpsPco6/0czovfTG+BgxZDwOvkJUGlKruUTXsaiUOVp8Alhb12YxLjpScrPXfA==
X-Received: by 2002:a17:902:74c8:b0:1f4:7f18:6d7c with SMTP id d9443c01a7336-1f61a4db927mr16665575ad.61.1717058137709;
        Thu, 30 May 2024 01:35:37 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 01:35:37 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] arm64: dts: mediatek: mt8173: Fix MFG_ASYNC power domain clock
Date: Thu, 30 May 2024 16:35:04 +0800
Message-ID: <20240530083513.4135052-6-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530083513.4135052-1-wenst@chromium.org>
References: <20240530083513.4135052-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_013538_677265_4B2E6EDA 
X-CRM114-Status: GOOD (  14.90  )
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
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 3458be7f7f61..136b28f80cc2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -497,7 +497,7 @@ power-domain@MT8173_POWER_DOMAIN_USB {
 				};
 				mfg_async: power-domain@MT8173_POWER_DOMAIN_MFG_ASYNC {
 					reg = <MT8173_POWER_DOMAIN_MFG_ASYNC>;
-					clocks = <&clk26m>;
+					clocks = <&topckgen CLK_TOP_AXI_MFG_IN_SEL>;
 					clock-names = "mfg";
 					#address-cells = <1>;
 					#size-cells = <0>;
-- 
2.45.1.288.g0e0cd299f1-goog


