Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069FAC44520
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 15:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ns/s8X4FLGsUS48lb8y5zK7Xq5THvoJSYI6z68H4XAE=; b=lM49NStah45kCO2cBW4xkrq518
	zOuKhf0haVpBVZtCCdUYuGYPSOUaaed6UGMrJyCq01qaIjXzm46XpflKJpqW5T31D9z0JnkdCJhi+
	EB3VhdToi1REEb4avvkViTul8qZM3DqU4m1BlFddUfnYU9oiBdqYeBgkGnIvWQyYlqGDoJmEaWZcE
	vbuXnSZvb0u+mpYxMVYTMIDJuMuugH8qyoGAJWkOqzUlKaVQiddIUdZ1Ds0FC+B+8sAaKS6/xT+TO
	JtOIVowUHvNA0DVI77qCwDCrpnTdvQkWasfQeYJyaPc5wAXovNF6p0LIzHHdS+bE0V6OgId01UjG3
	tPAT1Knw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHG-00000002ZbL-47Ty;
	Fri, 17 Jul 2026 15:15:02 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHE-00000002ZZ0-3k3X
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 15:15:02 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-699fbcd23ccso11288233a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301299; x=1784906099; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ns/s8X4FLGsUS48lb8y5zK7Xq5THvoJSYI6z68H4XAE=;
        b=bMgQAsSRqpuVIzwkhtMA9TG+poNrQe7J3jqpeCgVKy96ImAiRj1x5tkQPrmjSb/Vi6
         DH4CtbUWMMXPIrQZD4WF8XJz5vvTJXLS78Rq6GQZZA5yjHB5hZIcYioQ8W5IEg0Y4Cbp
         SkDR9QymwfwCF6XeJsVUxL7YbMZ6AGDn218fwZliZ46Eq9krc8IgfhmnFGvhlOiaIKu2
         ADFPpl5sQiHlBWySydUEAiVYpc2vm2DIbSW6AveKwUYdeUoEwwogxTRU6/YTvEpACz+0
         rjr4esu7gcd93brNvs8Xd/EMI3eIXgf2ahLmU2SijnFrTH5+YGHMxZ7SUTZ16Okkxhr1
         1ccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301299; x=1784906099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ns/s8X4FLGsUS48lb8y5zK7Xq5THvoJSYI6z68H4XAE=;
        b=Ye/ir0itajyeuvVeiHvZPVVdHZw6ESaJO4BNho8t6IJBTTlbIKri50Kc33rWVQLfvC
         TT2fn3gT3pH17gTYDqIn+dx8ov+AUh8hMUB+XI31LUV6Dg6AlBfuKpstsKRn76bGWizh
         jl1uaTOwx5L6LGYAw+0CHHYg56Ukzi2rjoi1OGHnF/v4DJSPAkBC/BKbaJMJOUhsEzXz
         kchbfTDik7FD1v2XpAwBEwKpG/fPn59yEbV+uyyfqDbvIF8uJBFMI8MHc2/LZm8OxojW
         lSQ43JMRa2PmiVpQJ2b07eTo9T/cNWrjOmptKQt3qpxhlXL4LoKMfeKRuT0xt0QYPOZf
         cEUA==
X-Gm-Message-State: AOJu0YyR1yTQ2KH8/wn7cVntzETUv0vxYTZGOVhC+Pit9/v5Et/c1AiG
	Rz8vGN0dH1M/+ztUvvmELjkU2t5F5ahbaRURkn6NS7FX5bPPw85PWFY6GccilSdm
X-Gm-Gg: AfdE7cmaYWCg3Wa/NjcL6bgPT8Xjx3T3of5nPVncl+bCa0KpwNfQh41J2Y0CE4tOOVl
	4xVhEcdHAlxGl0wl1qqHwwAX/dqDGAQZ76TCYkogihlWb8IdrmE4/2d1uRqLdGgb3du8TjA3Rit
	Fo2+deqyv8FmwIbu3RhNiteVk6CZyocJJ4ab9g8fpoy4qFzlqPi/iyco94qpLibXdQW/7j8KmmO
	RqwqoM7FulU8UnxiWNMiFEkG0lPdPjyLE+yIeNed1NPHi/G92b5ftjLJfffpi0q/Bc3xIAPZu/+
	7hEZTgvvxwUaJ6EgKYSB09kZDrqg5x17E/3x8padENNoLv3Ra00Fm0zo0XDsH1ozm5I7ZD8pXfj
	i0S85WEvb++eZIaYMn3GtjH0Kyyqc9Ema8Ps+oeNKTV5KYneSRgKsGjLy8mCDN+/8kn8I44degQ
	==
X-Received: by 2002:a17:907:987:b0:c12:979c:5a5e with SMTP id a640c23a62f3a-c16b434bccbmr156573466b.0.1784301298720;
        Fri, 17 Jul 2026 08:14:58 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:14:58 -0700 (PDT)
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
Subject: [PATCH 1/7] dt-bindings: reset: Add MT6589 toprgu reset IDs
Date: Fri, 17 Jul 2026 17:11:08 +0200
Message-ID: <20260717151134.678839-2-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_081500_954683_917A9BDC 
X-CRM114-Status: GOOD (  10.96  )
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

Add reset constants for the 12 MT6589 toprgu resets.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 .../reset/mediatek,mt6589-resets.h            | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/reset/mediatek,mt6589-resets.h

diff --git a/include/dt-bindings/reset/mediatek,mt6589-resets.h b/include/dt-bindings/reset/mediatek,mt6589-resets.h
new file mode 100644
index 000000000000..ee08c39df513
--- /dev/null
+++ b/include/dt-bindings/reset/mediatek,mt6589-resets.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Author: Luca Leonardo Scorcia <l.scorcia@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT6589
+#define _DT_BINDINGS_RESET_CONTROLLER_MT6589
+
+/* TOPRGU resets */
+#define MT6589_TOPRGU_INFRA_SW_RST		0
+#define MT6589_TOPRGU_MM_SW_RST			1
+#define MT6589_TOPRGU_MFG_SW_RST		2
+#define MT6589_TOPRGU_VENC_SW_RST		3
+#define MT6589_TOPRGU_VDEC_SW_RST		4
+#define MT6589_TOPRGU_IMG_SW_RST		5
+#define MT6589_TOPRGU_DDRPHY_SW_RST		6
+#define MT6589_TOPRGU_MD_SW_RST			7
+#define MT6589_TOPRGU_INFRA_AO_SW_RST		8
+#define MT6589_TOPRGU_MD_LITE_SW_RST		9
+#define MT6589_TOPRGU_APMIXED_SW_RST		10
+#define MT6589_TOPRGU_PWRAP_SPI_CTL_RST		11
+#define MT6589_TOPRGU_SW_RST_NUM		12
+
+#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT6589 */
-- 
2.43.0


