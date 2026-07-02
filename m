Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC6DC43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 08:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g5kQpHF1ScJKcmqA356iXRPEORmUpwJQqKtBuIMk5xw=; b=0ijRfT6PTKNLB/jxT8OlfhDd3k
	OWVvlnVrsnqd5WTht+274/GIoer2OKI5rzo3PE4hWNvHiwhARtisrHoQ2Po5/jRjXrbHRajAKbrF2
	6/FzeHAi8udAwKZ/NhAcvgTjVf0oMDgIRH4iLNOPBAvAC6/RSvcUgyCI4mxhXt8DiBx43Q0OIcsGb
	PogQSVcd+Nmm0jcqNq2SDye6ypgKKO8rrthrg/CKgNwcwGfsG7f3IT2X9NVgg1tOcL8kvYX6DsZmt
	eOeH9LEt47psDk0tmOTdgV5oZ+BBMFCHrt5LTeo8VPsi4j1hj58Ey8Euvvxk2WdHkZKV8NJjkZq7d
	1lx132Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCvx-00000003tdB-0UNp;
	Thu, 02 Jul 2026 08:38:09 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCvt-00000003tbk-3ek0
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jul 2026 08:38:08 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8424b00710aso1227783b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Jul 2026 01:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1782981485; x=1783586285; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5kQpHF1ScJKcmqA356iXRPEORmUpwJQqKtBuIMk5xw=;
        b=ee3nH2n7dmtMWbIMMUdVpfXpSS23r8lp/KSh711m/3AaQDpkioBshilkZcGGIw5Et2
         fSUMJ08PzivBAeTCimEfj4N3cTBs1o3/zvWjlWgGY5KH3gGACnFs64tGjZSBydtxJjAu
         QFVFkN6vycxZzmSD88chJPNfxby8Lv8E6RWdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782981485; x=1783586285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5kQpHF1ScJKcmqA356iXRPEORmUpwJQqKtBuIMk5xw=;
        b=Fp8cCH9vYxfE4GQujLZPFk2cpMNNea+T1/yzUn+/gbxwQllfH98FykfPcLIVCgOS5w
         +Jgcbr5AFVoffnzGNH9N+KfxjlJ8UsChtasqRDlU3OUxA/UlrZcNxzW2HIBjKAgwZgCR
         WWDDqTfc4GJ+X1k7LBlPGDc9/QVxrStXyfjvxJfRqwKAzAcI4cBvwM563RUNTxnuHIqq
         VAxtajdz+2yY5ixGNPNltuLxAZu8N6pW5LjnYCMy7GhK6wM+iujVOYHMaMapz7IkbIok
         aTiNazE50RzcgBrvWMVLymLZx2PYWPNNNTwkONlmyji1wqgVElKQW4V1RUfgEYj2/2jq
         0YEg==
X-Forwarded-Encrypted: i=1; AHgh+Rou+oCMFzwcfx+4zb8XrgJd8mw7rAQwj+7hRtM+BvFsGMS1sA4S2wAAVqeUJiPt0yvLRaqEjRD4bgOkCZEO0w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+2qdlXq9wLatkYUhVV7rIlbyZ4JCNKTjxd+wiYyxx1P8rc4jk
	dIWbxMG2JQqc4Jx/u5+RjiLOs4IiuQye9AjEmUG/tsdqWpAXvo73w1fuqNTjuMnk1g==
X-Gm-Gg: AfdE7cmfxHWiaZhZQY6+nMfFCAfWWLirlkT2lsPQCIt282gLT8Wfzmfrai7TIzW5QMg
	T7kVahHp8YYnb0Ey1YjC41SCeGMonkVsI1LlOJ0Lm7Wh3OiOgTU0CQaLQpWzdFdDgeJ8yyzs50j
	/CokwJ0TDHfUucCRrFqJx/lYf1OOG49HcS5iY5tgP1D0j7J3qcfwnDqtHizo5QcbhVYF17AJX80
	IcPOd1jq13ybeQ55ICz9Ua4IO0pQtbDCp9wCK32217sbTFUq4ao0dnQL22scQAfyPCsB3W9k1f0
	T2For9L8MYF53MStD8miQFZG2wPpxMLL4IErDc/jtkUNfHBjYlQdP7nX3Cjv4WTqD40gxE6LuAb
	6Ncd+97HY5ig11OZBcvzK7Lc231fk6+vbMHzovb1SJpXyiuXWONlK1A3dSbGfOUZRpUmmlYaavJ
	PrH6fxqyag0xfnWKorwfIxMPNlam/rNzk9vF0ScZS3flXZYM78kYb7ddc7Sd84aoHwLU5XOA==
X-Received: by 2002:a05:6a00:9298:b0:845:cd11:37e8 with SMTP id d2e1a72fcca58-847c5034e00mr4105619b3a.24.1782981484770;
        Thu, 02 Jul 2026 01:38:04 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7869:7870:7da3:7288])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb6dc1afsm1045521b3a.6.2026.07.02.01.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:38:04 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8188-geralt: Add supply for SPI NOR flash
Date: Thu,  2 Jul 2026 16:37:58 +0800
Message-ID: <20260702083800.578581-1-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_013805_908622_895916B2 
X-CRM114-Status: GOOD (  10.24  )
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

The SPI NOR flash is powered the "always on" 1.8V LDO regulated power
rail.

Add the supply for the SPI NOR flash.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
index 4cb23595d17b..f382f90c48f5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
@@ -645,6 +645,7 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <52000000>;
+		vcc-supply = <&pp1800_ldo_z1>;
 	};
 };
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog


