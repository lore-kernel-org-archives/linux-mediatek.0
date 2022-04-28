Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D83C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Apr 2022 22:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CWch6G38UIw6+XK8B6uefg2Ka9YpIl54qAvsgmE7dbE=; b=2DbQExqmYvB9wl
	ILL2rKRT7lXLRWts2r1gZ4LaIrYPVrnjHPgdMadC8bAFqmJFI8dY9VErY8j4ag8nt3yNjvjLJVKZ5
	jBdSr51SiG6dGnrVH9tl38hFPf2s+orf/c+9B0x8MlSpIbWTI+m3+T8730vGJwaiI5gDMNPELRqdE
	FkARIS+ppKyRUG54LkUHxhBLN5yX5fyO2ynKEhPzVMQUL/zzf10ju5JeFFdGwFaZ/DBdIl7ZU2Rmi
	ozv17maA7+gPj2VdZgOWA6n5z0NZQFZt7NvJL7NknMzvDV6TnMJbFILj3LBLx09enmx8BvhGXvn9C
	/GTUtNxEfa4Bax3cmoKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkD5b-008uY8-Ph; Thu, 28 Apr 2022 22:58:23 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkD5P-008uUW-Px; Thu, 28 Apr 2022 22:58:13 +0000
Received: by mail-ed1-x533.google.com with SMTP id p18so7146795edr.7;
 Thu, 28 Apr 2022 15:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R5/7OCxhqk5o9giaTDUQztGpi5IgQbeepSeYSbhWdII=;
 b=BZQqEcfqgYTQ01yTJ3p6tPu0vaoYxHxTZYXAPCQDyng2F9JErAwf+wBYyeCYL3jbyn
 fu7P7HVw2JjagdSunf6J7t0o3nqtfHGPh/ZLJHzYdg1s5shotJ5wMbZpAHCMdC4+K+BV
 uL4JNuQnZmCRBiUFM+rtrpfaTepwEclOBBGoL9iE+tm/pWzx/WIR5WB9W8CutqsrDxF5
 8r5IwxNz3GLYfDgZMejyxQ0BjUIeQeCMTqhf73P19V3Bgg4MUbJ2q163D/OWSpHCbJdH
 OfKEAdrVw4U7Rx0/SOnvPBxeiyCVH2uAkdPiFk+O3ZvsaiODty7uqGGjbN4chYEWRdp+
 7WBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R5/7OCxhqk5o9giaTDUQztGpi5IgQbeepSeYSbhWdII=;
 b=mvuzYrIKVAnpUgnlEa+S84XOruFt2VxxK25dib+Az/UPt4CzDO0h1u3SckfcmsFT4h
 lUKka66CkdkHCJWC5JqKwSD0lbgtu2KWEsvtCWVDS+S6XKuAu99o2kvNyHC+/xW07dKL
 zB7WAkyG53lrX0KH7fZ46uzHoRKWATW/idDhXBA49B+vaPqHKroSOn5JBKsu/hDwsQdf
 zWA5tmOJweFjVZYe0ChD8OUDYOv+6RYlGqVvsQ5quMKJDBoC7KC8YMqvHc3K6DbQbnvZ
 vJyXlcHgHSpadLRgg6wIY+ZyJyZsGqVyRD1TmcByRxSrUTGc3VSQeXUcUPv+3JFk9Esu
 PqoA==
X-Gm-Message-State: AOAM530veLoWc1JsDUuaRxe8Wi4N5UaD7cH5c9nhGlW7j5aj9gwvCDya
 /uqAd6FaNeLuB5hEWmAEXXugS+7njg==
X-Google-Smtp-Source: ABdhPJyLbUuBj/1YYm+3qmglf7zy9b/YbbcMub3/HL40okdVxkr6/TVxIZulAoEV9PjbfrGkO2N3Bw==
X-Received: by 2002:a05:6402:2920:b0:425:d7c7:41f with SMTP id
 ee32-20020a056402292000b00425d7c7041fmr29248373edb.370.1651186687432; 
 Thu, 28 Apr 2022 15:58:07 -0700 (PDT)
Received: from crystalwell.adg.lan (a109-49-0-175.cpe.netcabo.pt.
 [109.49.0.175]) by smtp.gmail.com with ESMTPSA id
 a25-20020a056402169900b0042617ba63c8sm2219102edv.82.2022.04.28.15.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Apr 2022 15:58:06 -0700 (PDT)
From: Rui Salvaterra <rsalvaterra@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: matthias.bgg@gmail.com, ryder.lee@mediatek.com, daniel@makrotopia.org,
 Rui Salvaterra <rsalvaterra@gmail.com>
Subject: [PATCH] arm64: dts: mt7622: specify the L2 cache topology
Date: Thu, 28 Apr 2022 23:57:55 +0100
Message-Id: <20220428225755.785153-1-rsalvaterra@gmail.com>
X-Mailer: git-send-email 2.36.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220428_155811_895571_B63D2806 
X-CRM114-Status: GOOD (  10.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On an MT7622 system, the kernel complains of not being able to detect the cache
hierarchy of CPU 0. Specify the shared L2 cache node in the device tree, in
order to fix this.

Signed-off-by: Rui Salvaterra <rsalvaterra@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 6f8cb3ad1e84..3d6eaf6dd078 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -80,6 +80,7 @@ cpu0: cpu@0 {
 			enable-method = "psci";
 			clock-frequency = <1300000000>;
 			cci-control-port = <&cci_control2>;
+			next-level-cache = <&L2>;
 		};
 
 		cpu1: cpu@1 {
@@ -94,6 +95,12 @@ cpu1: cpu@1 {
 			enable-method = "psci";
 			clock-frequency = <1300000000>;
 			cci-control-port = <&cci_control2>;
+			next-level-cache = <&L2>;
+		};
+
+		L2: l2-cache {
+			compatible = "cache";
+			cache-level = <2>;
 		};
 	};
 
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
