Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FD93CD3436
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jHQUJgJrR8DY8rxB52JHUO786dUwTkd935pxJWft/8=; b=ERi6jpHI3ypxUOKVHs7t3b0nim
	MMPXUXeB3zI8oD+uO7yyjIfc1ge/3ANALOCLSsVvSoWQulLOAsn8KXlgGh+9LZ08JCdiGEkvL1oDR
	7obu2Pvcoa4PiqBjcG8m1w4pTj4aS926cbCKONrLkZ1O9hSLrTybOuwmYKnNhLIfp8QeRZMVZ5EtQ
	Wqts1wJAuyfE0wAXDwvhdpmkZ7pxDx2bxpfXgJ7wUhlvr5pbx56UiHultFjlqzVyDKgHnT06c9e2y
	Bo1oCakWu4GGcwdJEvtxSQWT+iR1sJiXK90MokeNc/3150KSJgdaZuFz9sgilS6rEZl/zheXwvpOm
	wIaN3uuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnN-0000000FqkP-0j7g;
	Tue, 05 May 2026 10:14:29 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKCnK-0000000FqhZ-3u4j
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:14:28 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c80167f56cdso970084a12.3
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777976066; x=1778580866; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7jHQUJgJrR8DY8rxB52JHUO786dUwTkd935pxJWft/8=;
        b=VeCRwSHHfnJ7Rx832gzOFaSTaN5X8MYM7hKmNXCkXgEZ5HQGeP5UQmNJ7HSlWIy8iB
         Mt4UZD8hrWPLvG9f6VY9IbyVpdePpjtkH49cWK5+kfb3JU5wOJTb4BeDtgyb0KQG4hpc
         UEaxQ7n2Ty2jtPnsfSpv6IptvnhkfR2O2IZt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976066; x=1778580866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7jHQUJgJrR8DY8rxB52JHUO786dUwTkd935pxJWft/8=;
        b=IgQazSnqQspOrk6prsv5CSjU8C5wZm8RUKnkr6rSIW2h3JX5QcBGf1DScWeWr9T5Z/
         oq2Wl8O1ccTABcyGUjPHUvgpRjQCytKVXpFQECwzPNSgSZ3/GVar7LXTc2LG36JRKSP0
         7wXRkYuWWCXJ/jDECD4JJ8frFP1qxVC5qsig8F3HO8AkkZG0JGk9LUniOCfQBKihn21s
         s9hnyN1sKigvKguxag6pX+vIgNQKjxtjvveVImVq5fEhWyE/h7rCYq1MRoHsqcGHLUsT
         Wch9Ydx4oNIhsYcdb/BEESrxA0PYXg8XRLLFBxKjehx8GqG8cSZ5i2Q5JFFQMAa+Xqmq
         GJKA==
X-Forwarded-Encrypted: i=1; AFNElJ/1NfiV4LIyhKdeWIrmU7Go0zE4okTgKe/O7i6SMhjFHGYv7us8ScUTL66UHxrxsiHQg7h/6LxkfGbxd1SyPw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzGvHLp0qpMRgYAFGI1CRoKLXfwzqnFjDvudAYEhBu0QM1KPDUa
	ZcDArYtJijHgn8NpjwcLZTRI3DmB0tmzF3hj0RgGnPzpZduItTadMg5UIruCSNs7Eg==
X-Gm-Gg: AeBDiesgUl2jB2yeYpm8Sglqf0qfF4MrFlBJA+tY8bpUJP1Hbq3CYv8mPpWpC8tQZVl
	uM9/xbMARln8c/57BTapyyKoyjHIot1BFng7OPqaRkvQxWAdPry4iZkUxSFDyKXbLREizNJs9Rb
	d1qIEKrDQ9RpGtc9ll3ZYAA+GMXoQEenpbb/Xgz7/EOhMTdUlvBZuOWgj0kNhZyPWumcJJAS3Xt
	6VdjdY8V/bUBsT/d2OTGsD2HBtrfNd/f8cTyMYz1+SLUC4tfNyx3xLHT1do7Kl8Ye/rjyvCRg5t
	jibm9Sextf4UC9zRgP7nDV8B2tTx9x3niuh5y3IE3hmeX5KN2qtJmi8MLZl3qQvDxofn223a/MF
	t/RmJOd3rOX9BqyW5cMqThQ358NLjnrCWO5zY0gETdcJJbWKMn1zfyhcgM/XxHVBgcbtJbTTvb+
	kJYK5seBB7PekGX3V68LQdunf7/w20DE+4u52vDWrZdgZS5keDk/o3pfjnMu/QVOo+/9mrtzxrp
	5cOjQS5TtxdzsS/Vd0=
X-Received: by 2002:a05:6a20:918f:b0:3a2:d79c:415d with SMTP id adf61e73a8af0-3a7f1bc3679mr13967471637.30.1777976066051;
        Tue, 05 May 2026 03:14:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8462sm1666121b3a.38.2026.05.05.03.14.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:14:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/16] arm64: dts: mediatek: mt8192-asurada: Add MT6359 PMIC supplies
Date: Tue,  5 May 2026 18:13:53 +0800
Message-ID: <20260505101408.1796563-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
In-Reply-To: <20260505101408.1796563-1-wenst@chromium.org>
References: <20260505101408.1796563-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_031426_971744_63A2798C 
X-CRM114-Status: UNSURE (   9.71  )
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

The MT6359 PMIC has a number of power inputs for its various buck and
LDO regulators. The binding recently gained property definitions for
them.

Add the supplies for the PMIC regulators to the common design dtsi file.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved supplies to top level PMIC node
---
 .../arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 2e53c1bacf38..8054e2d20bf1 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1440,6 +1440,23 @@ pins-miso-on {
 
 &pmic {
 	interrupts-extended = <&pio 214 IRQ_TYPE_LEVEL_HIGH>;
+	vsys-smps-supply = <&pp4200_g>;
+	vsys-vcore-supply = <&pp4200_g>;
+	vsys-vgpu11-supply = <&pp4200_g>;
+	vsys-vgpu12-supply = <&pp4200_g>;
+	vsys-vpa-supply = <&pp4200_g>;
+	vsys-vproc1-supply = <&pp4200_g>;
+	vsys-vproc2-supply = <&pp4200_g>;
+	vsys-vpu-supply = <&pp4200_g>;
+	vsys-vs1-supply = <&pp4200_g>;
+	vsys-vs2-supply = <&pp4200_g>;
+	vsys-vmodem-supply = <&pp4200_g>;
+	vsys-ldo1-supply = <&pp4200_g>;
+	vsys-ldo2-supply = <&pp4200_g>;
+	vs1-ldo1-supply = <&mt6359_vs1_buck_reg>;
+	vs1-ldo2-supply = <&mt6359_vs1_buck_reg>;
+	vs2-ldo1-supply = <&mt6359_vs2_buck_reg>;
+	vs2-ldo2-supply = <&mt6359_vs2_buck_reg>;
 };
 
 &pwm0 {
-- 
2.54.0.545.g6539524ca2-goog


