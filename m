Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7381BC4451B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 15:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=; b=fWZq9Iyk1P4v3zlQfpnc6aa3nR
	C4bd28+U+ZRqKNBHQ/WJHOWAg68wMvk/FGNCCFAb6kxcjaKXjUQH2Ir7XOphE3uGyBDi7pL7bkfJh
	WFfa1J8o0qpNXMase53F90meO1h+nHo+1Z8aB4KrlAWcFabNIYotin/KIo2MyonCfzTFLFWQPWzcw
	H2a0YQNolau8ZUo4/h6rgMmNOIop5c33BIcHhN5e3uK1xMv/5meHj2rmDYgdwgVBw6tqld+Gi9HKB
	OsVXovHS/LvBsPCbezBTkQSo5cVLsg82BmcNIcbIInBAZwusVYOffbYUnBHg1uVAxUPNLtwePco0i
	4SOhyeNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHf-00000002ZzT-1YfX;
	Fri, 17 Jul 2026 15:15:27 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHT-00000002ZlD-2Svi
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 15:15:16 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-698aa7ba3e6so5192206a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 08:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301314; x=1784906114; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=;
        b=rvBXYDpSGiD//jh548Y0Vcvy75VYhqMV3KrlzMjy63tTqHiDGJYh0dadXKlGpfyw3j
         gTJCXaa1/ggjD+4XCaEq06jbrD0p6VZ7my9Kt73a0JvF4Qn+TfkNznKZnmbpsvOtRjpd
         4aOv6nnfqoS3B294WVAi/tcACbOJpWYDvI4FlYpoTKKlkb3TgDDmvRZz6rCGTwPGBm/5
         CkT7YCFnGuk2+20o1SJjX5/yqv7U/c7DhQDswhzeGt0VHmf2gWZR5B1ToJGmyHSOHzMQ
         CN4+O7S8wEALfBkTM+3GzPIVekeCskedlbD29Hm/BxNo+RE/QD0PHpt9iy6+KfjOhFld
         8jrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301314; x=1784906114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0PhIH7OMtSrBrW8tfsrhy4p4sqtuf0aJ5TBc9tXNybE=;
        b=T3Q4Rl8XFvucjDlwNXZM163xrhdsW99NDr/+WiUc4AmjjM5LeKTQe3mXZL6s7yNW0V
         4dnO0eeSpMle/yymTzxdOuj6rh/1JIcP1zlB05O4DD9L2GhT9ccAfNrGCHWaNW298JjN
         tWfZdOCjzsEQCeLVH0vJib66Tyifbx7eNgmILDTVTHt6FpaD7MgcehpUQAMHm0o6GK9M
         m41QOoMX6jIlxnle2zST5RHkfNX0nRBdjZ84Iaj7fbuhVyKcsv2bd2kjplXNsprRMtKT
         fbJfF89oN8lyiVBf/hqOldonedDtXLU4lfmroQh3d9DICV+O45Zs4+n/BYMkH2tLuLjj
         aF2Q==
X-Gm-Message-State: AOJu0YxgGuY21iycvg7JOq1QuOyhntgNNuQiqJqnLPaXgpTxfB/+Np83
	REbPKOziH2LQWK3sU+TnFvwzgOU6DU1QFNT5Gy49immZBFkglMLyv6aXMxMj064t
X-Gm-Gg: AfdE7cn9wdo8+5c99kZjEGYGYYcosNx2rb6Sd5gZg5klmTvvzRrWPL2BTzrth/VkwUb
	Er15DGwITeghcsPrUUWfTIbSwJzcpNvv6lNBSzJYIFK6xa9+DPLKJawcSPw9ZKefihc8yn5CKwt
	KJWGVcxgh8lfxNtPr5it9tBwVcB7gUvzBcDHRhTPidSbxDHiC00/onQTE5WZUDyNTtFyz5HHfEJ
	00NUg6e2Q1qmsoLUPiwU2yWke88pupjewIWF5Xo92pvnK3K2yQjbyq4B+fQIQPmtFw16atm6q0W
	AnpS/ZL+VEDBzqG6XKbsrS+6ipQ86JD24dkIq/LShtjLOpFdKxrk8nmgGGVP7X1VxFVHuSPufOC
	uThzKiHCGQqWq1CdelU+Av3jdOmIp82wGXlL/waDL/WNVDeQK0cfayYyj2myjmx+Bs5ZjmmzHag
	==
X-Received: by 2002:a05:6402:42c4:b0:69a:50f9:6048 with SMTP id 4fb4d7f45d1cf-69e652ee9eamr1278651a12.28.1784301313577;
        Fri, 17 Jul 2026 08:15:13 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:15:13 -0700 (PDT)
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
Subject: [PATCH 6/7] arm64: dts: mt8167: Properly describe the SoC watchdog
Date: Fri, 17 Jul 2026 17:11:13 +0200
Message-ID: <20260717151134.678839-7-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_081515_626850_A3055FD0 
X-CRM114-Status: UNSURE (   9.66  )
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

Currently mt8167 inherits its watchdog from the included mt8516 dtsi,
which in turn falls back on mt6589-wdt. However according to the data
sheet mt8167 has 15 sw resets instead of 12, and the reset bits are
different from mt6589.

Use the dedicated mediatek,mt8167-wdt compatible for the watchdog driver,
as it correctly describes the SoC resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 27cf32d7ae35..4ebf305c10fe 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -95,6 +95,13 @@ power-domain@MT8167_POWER_DOMAIN_CONN {
 			};
 		};
 
+		watchdog: watchdog@10007000 {
+			compatible = "mediatek,mt8167-wdt";
+			reg = <0 0x10007000 0 0x1000>;
+			interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_LOW>;
+			#reset-cells = <1>;
+		};
+
 		pio: pinctrl@1000b000 {
 			compatible = "mediatek,mt8167-pinctrl";
 			reg = <0 0x1000b000 0 0x1000>;
-- 
2.43.0


