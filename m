Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B1AC43458
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2026 12:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L6V4gGpbEy0fZNQjjmmHmHR8RvVrPmpP6jHF02hQyRM=; b=MgcimxJoh88Kseu+zRlMQ3g5Hv
	e6QXO3dF0VgTp3W1Dgu3+9R12308ryib8gHRvYEg8+qI2f3dy0LlkeajOExTMcCm3fy9OCAGg/zqz
	bQxbBzn817QrcGdT7Bau/aBzoO1q2hVMAu5wJtMmxTuw9UokALG2B5jHpqCqi41maC8dde1dK9Z7T
	5VgjJNov439ORNlbscwAM984X7eYQPJ49iETnf9ebPKg+F90g59R9aL+YXTQot35tuJWo0Fal2cKf
	z3dksudHulfYov6ZMBFV78cUPj/ByRR6HxZkz+srmICd7NnUsWX1323z5SoQc73LbvssPvLMKS4hX
	/nttwL2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weB1R-0000000EXiH-2Y88;
	Mon, 29 Jun 2026 12:23:33 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weB1P-0000000EXhO-0jpe
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jun 2026 12:23:32 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2c9e89fded0so9704515ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 05:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782735810; x=1783340610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=L6V4gGpbEy0fZNQjjmmHmHR8RvVrPmpP6jHF02hQyRM=;
        b=ZcLcuYZHrmrhw7YIABFGFDLegOOfPCFwsk70XxPaRAfkzx4YYsncdO79lrMNr7ImdT
         Yhv72EW2xbDW8psQQWPkiu4505gHP+D/KOeZBsgLDRn8l0yD5c8gKX3EVdK9kxfDnYfb
         EQ0VBokx8ppXSuES8LV4P/wbavMqptBZy843nUSXxOYktD+uIySkdco8QDY1uD92nOIw
         gjyKE8a8YzIuOZP/dU2rcnlTmf2tW6P4mBqo15bhuvHOj+DNE3a9P49KJf8vJghEhC1S
         +KG22mSE9b+xnS+pU+OFo2TGqLxRRu86YTiGkZj2ZuqZu6gvygQdffm/O5YButJ2UQY7
         cjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782735810; x=1783340610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L6V4gGpbEy0fZNQjjmmHmHR8RvVrPmpP6jHF02hQyRM=;
        b=LWUVY3e6KBye1YUuyknm6JBOL0Y+XHSQ6Bc3k1Y8fFF/rRTcB+gBJ+vZxCpxftC+BW
         BEqPJW8RuK/8npIlYLcFDxAQqoGJ1/iP6nbDsWMVV1O2pgtqaRvN/sNIHpe3aQSRwtuE
         CxvR/7NImMGCP9oVyVY4JKX0eaBClWTOQJ3IuoEqrVzrXj44C+87DPi4tYvmJmg5XKRm
         f5Dd9icTqQtu3W0JAGGde4CjobaDdARqxCQroUhQ8pWc+8k63R7fy7rAksrZiUEFI36c
         rIO5rvI44k+9p5JMWvrh4rci7412TclWPVoCfrteqxUB3EqWjfn+ghNjsagSZ276zCaB
         NMTQ==
X-Forwarded-Encrypted: i=1; AHgh+Roc0K60jDyDnIpI4lTf2LIxlpszXb3kI75PtDSLmWzwQYdjs8HaJZHjO+2PILEXh1saA6ZplwJoVeZtWdVK7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6c8z5j00d2foMuB3jSM3eooh0Di6aaydyhIANUckbw3BNo0vS
	GDvrjsgQisYK7pQHlsx+yZDyKX+tbUR/b5Qws4LHrEZQ5L3lbRHtFoGm
X-Gm-Gg: AfdE7cnR3uV6ij46svyvywDbrBoQbC16Ry4j3dEYA51MwEkbfGGRXoXSU6tzhxjW6JZ
	aGLFP/6Ryub1wH+3ckrRIKVPvQlDGramfflRDTAW5D5fXGcg2fD5J5Aq1Qw+/wGvrlg5s9m1exC
	r2Ft9En1MnySWCA4HAdbzUWK2HeMgIF41a8M15drRNE3bjsDNS3rcj1wvQRFUq2YHdlBOJqcdbs
	hG47DDVT6tg8EQL+lolv4tp2nS9eqR5GP915VLY0bHhr9K1qrzdEFSUsf7zAhzeD+n/I5LK6JId
	QL0o30jjlRQACSCQ2+XLdycKMb+OdTOVWQOIBO1TLNnlNPPS25NuMSUcjMKVG7DjiKMF8QS81PM
	WFlzBBxZhOOIPSRH4SugDYD+Q4Z7ukwu9fVlGcMNe+EeWyHfZTiaKDjB5sP9Nu93kmTxVzqpbFZ
	nmfxgQV4x76lQXR9Mqn9kviMfdnZwXZ0e83dnvS9twkVjt
X-Received: by 2002:a17:902:ecd1:b0:2c9:fa31:850c with SMTP id d9443c01a7336-2c9fa318680mr27451165ad.39.1782735809679;
        Mon, 29 Jun 2026 05:23:29 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c89d9bdde7sm57104195ad.75.2026.06.29.05.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:23:29 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH] arm: dts: mediatek: mt6589: Fix timer interrupt trigger type
Date: Mon, 29 Jun 2026 21:22:46 +0900
Message-ID: <20260629122246.148696-1-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_052331_206933_C7F2BDCB 
X-CRM114-Status: GOOD (  10.86  )
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

MT6589 uses IRQ_TYPE_LEVEL_LOW for arch timer, but I sent a patch using
IRQ_TYPE_LEVEL_HIGH.
The timer worked correctly regardless of whether IRQ_TYPE_LEVEL_LOW or
IRQ_TYPE_LEVEL_HIGH was used in the Device Tree, therefore, there is no
actual impact. However, this is not a correct description of the hardware
so correct it.

Fixes: 2a5d54507c68 ("arm: dts: mediatek: mt6589: Add Arm Generic Timer node")
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index 46dea445742b..df3b7bfeac33 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -45,10 +45,10 @@ cpu@3 {
 	timer {
 		compatible = "arm,armv7-timer";
 		interrupt-parent = <&gic>;
-		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
-			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
-			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
-			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
 		clock-frequency = <13000000>;
 		arm,cpu-registers-not-fw-configured;
 	};
-- 
2.54.0


