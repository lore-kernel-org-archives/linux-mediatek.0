Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A83C61DD6
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2026 15:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=521A9KUhtW0cKM/KRBSLU9rkYQy9/A8z8nlm+NiGrho=; b=wjE3PGMv1moGq19JdxRk0F+aWe
	VvAtM83M9Ah1lFXrKYAUaUQHsqmwtzXj3GAlexJITvO/5PhyWRRd12ILz1uwGsLj1+DZX5FkQNQFZ
	4yDQsiTzX3OXktqAsvT3yxQizPOwKNfpEc7tCXdkLnDkhHXmD2lDZZSNxM2b1D1q7fSoPQvAK9ykH
	uIANm4lC5e03VldVJaL2FF9IGsy8VEqP1a07Di0udKPo0Vq2+Rnr+1mjlcJ503vQcTjZXl9DkNaCR
	chkBVlup1Wr3BMONu0sZTOS4f0f6Dce9Uv+A4TVtTSpmwqDIHxHOCuSVkEMKrnuZ7VCG5HRYeJ6pF
	D3vQGFOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Kqk-000000073co-31fD;
	Sat, 29 Aug 2026 15:20:06 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Kqh-000000073bi-0jra
	for linux-mediatek@lists.infradead.org;
	Sat, 29 Aug 2026 15:20:05 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso18142705e9.0
        for <linux-mediatek@lists.infradead.org>; Sat, 29 Aug 2026 08:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788016800; x=1788621600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=521A9KUhtW0cKM/KRBSLU9rkYQy9/A8z8nlm+NiGrho=;
        b=JqjXw0Pisau1t8jZ0b9Tn6/DRIAu5iPEwkWw6Y8Qh+mUSpOl92RzVU9l8qWLnOWb4Z
         Vzgo39gRXWXPpHfGOaXq26rV9NI4Nj2vuHpg6zmyM4jdzuJkUW82HGsaozSaL75UxrwD
         325AuVPMfiv4QZTkzSP/z1BXe3mmPlcjfMvEJiIzxo0y//coUNul5Jn2rF+l8dOXABm3
         CPnBWUeQLllQER0PUGkpukADh62Ekc6pSY9Md6EIBNHI3gZfPP/IMZBHPub+4cBDE8z0
         SuOesrYQbj9RGI9bYeWkwdopHe5ESLIvNagHzHygfhLkAQCbE430OeIugAkyvkAjsVRU
         UNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788016800; x=1788621600;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=521A9KUhtW0cKM/KRBSLU9rkYQy9/A8z8nlm+NiGrho=;
        b=RBVIxE3F5bm7AIuR7QTaqMUJkwWD2gm9/sA58POpqAsFzquc6/mapUQm4xtQVxaziu
         U2Z1aDhooxi34fIWAmxu43Ui17hdmduKEOSTsKtEtD7Cywv4Nj/F6FKxMQLQjMp4ZCTe
         NhA1/qVXOWMN4eSQpH6ogtDmOeYlPtBUsj7DN8LFo3MavPg7xrJhHvfsAjbp9JUF/1NO
         RlRt5rdi/e+e5flhwIqBz23K9uFWKl9T3V3NFYNDZmZpwQzB03NUgUrL7O4IsV6e8sae
         HfHkFswTeKCyCKUoXZti3grf0bagciSLvPYodmtE7Lmi8blc7QmZtuqgwi1O2MHdZH6x
         BFbA==
X-Forwarded-Encrypted: i=1; AHgh+RrZ/PUznM/l5032FSNJTG43NTtVcIuJvJizsn0grODEedw+AkMTV3A7g0tRDiNQ3YjkiyvYOfx5I0VrPUTfyg==@lists.infradead.org
X-Gm-Message-State: AFuF++kqBQifjL7UHBlaeVWRFm5+HUpFsFvpzTLtYAeEv/FLiW6iqObJ
	MkNfNQOo3VKZDWJhbV4532UMoROFhC2uBuyZdUH6hvpgarGvfbkUvA4=
X-Gm-Gg: AR+sD13kblHTgXBSiyT7cYapQ7bfJX1xx3gD1G8m4jfXPQbnFr6a9iPn4vKsu/wZAUM
	cczEL0kp8Bk8VOkdWVchO+EAtUBS+PTYUmgpVwYD1EXNt4r/8wFXcwPu3mx8LIOxvwlyhcMI/Qh
	TNm9aW0EuG7/8zc9mkLqg0dGTQIdFxBqjCjo1mysPW53TmTgE06o3/J3Evdfw3Gzh6aISYeLEyL
	VklYMBu929UCFwerh0ouXk7fPSCOcEI9nlYhsxedNN77cq7XzVpJLKoww+1zc58kpNgPkIn8y66
	ik5Q2ZFHT2lI6CHm/UWKe47tob6NNZrQwIoYqCBakXMZgbyGCzZYDtcAw+SqLociM/7u5qyDJmo
	Q+rIZ3FDmCVt2PCuvak3cxaiQGGUBPDyUmov8g7LLrbtiJSRGMsGqlUmVyK53prau6CH9njOqnG
	3exATTAGgTry4XUMnNJ+4pLXHdtjLri0mt6xxFiLWeE2KamrMReTIsxacOT6ZTazx12x385bBcc
	Er1K+tTcDiBv3q0gqdRpEspq27wRw+87Kqpsobv
X-Received: by 2002:a05:600c:3546:b0:499:dbc0:370d with SMTP id 5b1f17b1804b1-49b91c1dad9mr216188385e9.2.1788016799980;
        Sat, 29 Aug 2026 08:19:59 -0700 (PDT)
Received: from localhost.localdomain ([193.160.247.68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ccea6b814sm38959855e9.0.2026.08.29.08.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 08:19:59 -0700 (PDT)
From: Andrea Pesaresi <andreapesaresi82@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sam Shih <sam.shih@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mediatek: mt7986: correct timer frequency
Date: Sat, 29 Aug 2026 17:19:55 +0200
Message-ID: <20260829151955.3661893-1-andreapesaresi82@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_082003_836709_F32293D9 
X-CRM114-Status: GOOD (  10.67  )
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

The MT7986 architected timer runs at 12,986,200 Hz rather than 13 MHz.
Firmware reports 13 MHz through CNTFRQ_EL0, causing the system clock to
run slow by about 1062 ppm. This exceeds the kernel's 500 ppm NTP
correction limit and leaves clock discipline saturated.

The corrected rate comes from MediaTek's downstream OpenWrt feed, where
it is applied to both MT7986A and MT7986B. Since upstream mt7986b.dtsi
includes mt7986a.dtsi, add it once to the common timer node so the
architected timer driver uses the actual counter rate.

Fixes: 50137c150f5f ("arm64: dts: mediatek: add basic mt7986 support")
Cc: stable@vger.kernel.org
Link: https://github.com/mediatek/mtk-openwrt-feeds/commit/6a4c41c41410cd5042ad10c39da6593ba036283c
Link: https://github.com/openwrt/openwrt/issues/24789
Signed-off-by: Andrea Pesaresi <andreapesaresi82@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 9ebc19610..318639a7c 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -657,6 +657,7 @@ cpu_trip_active_low: active-low {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupt-parent = <&gic>;
+		clock-frequency = <12986200>;
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
 			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,

base-commit: cf72cbb39da84b6f02f90c07f33b102fc10b16f0
-- 
2.43.0


