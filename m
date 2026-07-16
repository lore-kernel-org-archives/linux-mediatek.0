Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D28C44515
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbVIpIkuseKM9YQeH51Wa+r2dL8obTD2M1N0wW92ZT0=; b=k01fPO5XH0dF7MwErPfY/OtpzQ
	noKA+YCUrfRbqIpfFqISPyXmA4R8shXR4hVfz7gr1+C/lQ9lnKzkhEiaz5epkaXYSpTzZpdAxnu1m
	OxOKvpK4IjEb/KhaHp1ZOCn0EzBFT4F1bl44vZzebnrub1cUfE9ZEdqqP0aCheowMASuG6vv/40A9
	qh8Sfq4WaDIPN74+XKthvBY8rYGaPXxQXU/xVCEETVOyRnYaG1hXas7fFPAJ7IRIA5h/bwsGaMYx9
	xm/v7AhfhpfGQ8PKIi6b2k5tiTzdUCZujV2dDaRGUP7rX7x/dZKGT4H2SAFzPTa16E+vHWE79uzaZ
	iJZ8YOOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoe-000000008BI-2nxG;
	Thu, 16 Jul 2026 16:20:04 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoV-0000000081y-2HR3
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 16:19:56 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-84864086bfeso7281805b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 09:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218795; x=1784823595; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DbVIpIkuseKM9YQeH51Wa+r2dL8obTD2M1N0wW92ZT0=;
        b=g51SQfuOAWtj1L+/YpdGerBCdEdyaklV8dG+5ToGPsstpTtXjDE4Ndu73O6PNQ/gXS
         0YKL8OZzwkEwrzow9LyfrmBC8AubFGlRqsnG/IEYaIIQEsQVMzaoEwAuqjRjAb96GlnN
         0Chsroh9BBNzZCaPrw/dQflQ7v7thtkFq7aH+f9AFHbKcSCbQJeju4Y2U0/UogEI43o3
         umP54McToig4LyOhx3+NfBL6TIIE2lba35zYa9DNcAYoinMffO2X53uDncd+8eG35rHc
         pNqPntb/CyE24/jEKJwvj0yOXUZRw5zrm20mFeTBa9nBZUgDi41x+Hn159l/7jBo1jNs
         94mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218795; x=1784823595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DbVIpIkuseKM9YQeH51Wa+r2dL8obTD2M1N0wW92ZT0=;
        b=smMtOLEwMgvyoJS3Mya5VsppI7gOo6Q5sB5vcyjneNss9mUa9X8LFf6uzqQPU7Tkwx
         noWJcw1V0O0Kok5h1yYM/Ge2c/hrBP7evXL8TLlHNqHtISJv+PJcYwgqUO++6f3EuSzd
         RwuTO2N5HFztRNgJyNxRCiyToIeALXSDXmc4bIADMY5gDhcxQN55XmMxXQDCVls76sAZ
         rqYXos11q6Mo3noEeYLPY9n2X8EHMckkTy5nHCjIuGTapIXzjJDyf6BAjSDkonWlmiYZ
         RJYSSf910B1kPzs9nj7XsVSlkIXUqyOywlQTRsdclrOy1eGet6k0lITl23IAmWJkUY/x
         dhyw==
X-Forwarded-Encrypted: i=1; AHgh+RpicjRS+IjSajksYrabzdfNmAfFXdT0grme5XiiIJJ47Nrr0zc2B0cB1XbaGdykmsdDDtL0dwgdiPVmU8YPwg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFo/YlSryPVqOjyH7wrLqObFbSpbzf0NPO7Y6+/78+ZVhp3j0t
	pnEMnewsm+M1myScJZ4IAT6LIh3J5hkWBoyB4TLsmnQBy118STEehjbx
X-Gm-Gg: AfdE7ck1cQ5zrT0KPzjcpGqd59PrdJ0uZ4H/0e22PArquxHivGgFSSqHd6n4Ru25vpl
	KYkmbbYg79m3AUOu4zOtDQE2csYK1uo/iPnCJJMQm0HYXy2LSQRoEPvRgY8tSyY5UR9iYBmsEMW
	dHQ/J91eIv6FCEM41KS8LCHF/9+7Qt/ZfXQwdoeZyYIlJJyKy9ag7XF4asTP3CpzxshkkLNg0qd
	V75fLm2xz2QayIxr85bBPb3RSsZ2QTB3fe5dDcwIfzOVgK7V2MbJHRPrsmerGC6pXWgFX4P6RG4
	UVDXhONaH90M3BSKuBy5XvJinqYV37X4yYBvYhM8VQefLnQScYDDUIRDqfhL9lp3ZLCsnMBHMCm
	smnbbcWR7VMFF0fCv4KDErmIOTK5Am+jarm7gSGskEA3FvZqhcL1O46If2/7JV771hetecngmUH
	ixFOBePTfzNkQMYadAn///9BdLyXLfo5HBNQ==
X-Received: by 2002:a05:6a00:22c8:b0:848:2f84:733 with SMTP id d2e1a72fcca58-84a559dd085mr10999832b3a.70.1784218794877;
        Thu, 16 Jul 2026 09:19:54 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:54 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 4/7] dt-bindings: watchdog: mediatek,mtk-wdt: remove mt6589 fallback items
Date: Fri, 17 Jul 2026 01:19:20 +0900
Message-ID: <20260716161923.266315-5-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_091955_589506_CCDCDEF9 
X-CRM114-Status: UNSURE (   6.98  )
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

All DTS have been converted to standalone compatibles.
Remove the items block that allowed the "mediatek,mt6589-wdt" fallback,
keeping only the flat enum.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 .../bindings/watchdog/mediatek,mtk-wdt.yaml       | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index f4eaa5f7c5bc..2411c02f1cb0 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -42,21 +42,6 @@ properties:
           - mediatek,mt8195-wdt
           - mediatek,mt8365-wdt
           - mediatek,mt8516-wdt
-      - items:
-          - enum:
-              - mediatek,mt2701-wdt
-              - mediatek,mt6572-wdt
-              - mediatek,mt6582-wdt
-              - mediatek,mt6797-wdt
-              - mediatek,mt7622-wdt
-              - mediatek,mt7623-wdt
-              - mediatek,mt7629-wdt
-              - mediatek,mt8173-wdt
-              - mediatek,mt8188-wdt
-              - mediatek,mt8189-wdt
-              - mediatek,mt8365-wdt
-              - mediatek,mt8516-wdt
-          - const: mediatek,mt6589-wdt
 
   reg:
     maxItems: 1
-- 
2.54.0


