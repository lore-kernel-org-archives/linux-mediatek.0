Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D214EC5AC7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2026 08:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRPg2fF5zW2ebng5FORfud2q4xXOQdkBJ5AC1S3iOZQ=; b=KysOdl8zH+J8GEQdXR3ndZM8XQ
	QzZ5TcBYTF+b7LHE6n6sBreanKw/Cuo7IvVqtppmnHI+88vXCws7Hd4UCE68kP/1mN6a5irYyaCE4
	nJFufth5yrbp2Sp27l6urWHW9MxoUSnjPG9GnNeUCC01KzpDk96x4/x2o5ESzUJxEsz2ivok1kMFv
	Z5GdleZh9vcu6WrHEd7qHEjTLfJMO+vZ3Up8WLyuNsCcxqUdMNSi4ueuM3imbyo4bi+CqFyo/iHeG
	YXg5X0XL5dhzbUKESCW+ZW6jQRAf8Lfb1zYd83aVEdHxixhZ41ahNreXa8NH9WRiGNgxrOKervT4p
	KuXamukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFlX-00000007OaQ-2nV8;
	Fri, 07 Aug 2026 08:17:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsFlW-00000007OZf-1uKJ
	for linux-mediatek@bombadil.infradead.org;
	Fri, 07 Aug 2026 08:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pRPg2fF5zW2ebng5FORfud2q4xXOQdkBJ5AC1S3iOZQ=; b=nDZ00x18veN73QxWCszYJKiuoa
	SX4vbv97remPUo3k2ws6oG3DKQzBhHHHw0ihscL+3TAeqbqrf3qNSQIKL7tDqJ/M2pJ0kzwt8dc+I
	RpW6NhsJDI6EXn6rsflHxdW//L1erlzutMuR9smzRj61bcQ6icBqwdCuDx5k87+w1nBPj0dxIUfYk
	49sMPu2SGJsvFJ89t++aAro61XOZEJsqo9JPTs2exohPChhYzLd9JTqx88wGuUocTrOzsjAkEdWsR
	PawjFPzB8zWwqYfSbN7fuQILEIHjVI48ts1a+Lw8Cz/UoY3ZHohkdVNr3/X6YQztsVSb1MpF3F1z8
	kDKzhuiQ==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wsFlT-0000000CBbg-2Jte
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Aug 2026 08:17:17 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-382ef647e20so3362753a91.1
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Aug 2026 01:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786090633; x=1786695433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRPg2fF5zW2ebng5FORfud2q4xXOQdkBJ5AC1S3iOZQ=;
        b=f2KXllZM72b6UqfZTvx/UEoKbbmbcqXyCm7YENe2CQH6CIUEV1SCbBJOHS0XBYK4Zr
         8MVnrrU7g9vtJZGxvKaCjzyg/Zl0zRldYXFnnLl8GG0DivJiP90jk1xNV4aA3+2epZbP
         wbhx3K3cIkC1k53pGXDDMYWCTEVYf0Qw4wO70lWlcJLae4LpcUrwlyxAks2if+cklKeZ
         KImMN2XKuJplC1+JXt/b7GCA/quxDnMDxK/Rxn9R7abgtpsdVA1ULy92AiGnTsYe/2WZ
         h1apQwxoR5uIzjXzlKnOMKjhtzxBgSx4SkHOF+PVFaLtrdT3m+Uyx1Z2VjTnqC+bx+Xg
         m6Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786090633; x=1786695433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRPg2fF5zW2ebng5FORfud2q4xXOQdkBJ5AC1S3iOZQ=;
        b=IsIV42dQfHg1z8O6iYNIPVR55sux3nicbgzRahM4bdjpXKUpfp231b7+OIuYkTwXMn
         y7tJDcck5NDjPrZ7IeasKt7gELRzevcXyar5rOQ6cmvmcxw0GqQAfg6l2Jn/DGhxp3XW
         sy7RhpvTDMu9bXo97X1xAyVpu6c4TBufuLWaYnT17A7kyKm73b8mjliovkRPNGi0jqTW
         jx1WQfvfVUbVyxH4dMZYAchdsanPfKLCNl85EJ3qqK5WATqUa26g8MTwx/uNfX1ZWeW+
         YAgtg5xii7qBeL47dhDlzjpOL6uJA/UQc62T2PkBTPbqO+uI5OM0kRqwlueExPByQtRy
         6T8g==
X-Forwarded-Encrypted: i=1; AHgh+RqSzPxvxBYQOaXhErRCrJRjupxBR8DZ6skBYNq7kZqJlqgm9ecVv3qauFd7y3jIrN2r1Jy/YJCG3ZQPPoyjCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKyKNGZYc3Qt0qqb08Ivd7q7MU8xL3uSZVoIGFofyNxRR8tiba
	I2eQMtPXoeBTrKklvge/HBH5qydpqyhy2MFz6BF2CMQ4zbCvuiGbIX6o
X-Gm-Gg: AR+sD134Cb6crLzYO2XiWzWXYG10jdi7PIsXeJ2R/wYsx69ELiBGiFzeuJr6MdVl6kS
	pPTBosoKOtO9ltu2mHVPmqigonntAeeCZXXfVeAwK54K7XaeXsc2CZ/jgceGc0YWu+uXFCjNvEB
	30EC9wnFrtU3rV9oHKWoGe0P+6TMOVjNGnI05c5RoZUYPS5WI45rb1/nBTuzh1u63YNNpz2H/0L
	oaLVYeJD+oL1vfqhAsH5SwwoHSvHG3fH3NY57+ebtvWflr3ylATf29cvk8Nz/QTU1DrfMYF0nz1
	Mnye5ed2Y7zXjmrON0GKVovni1cDPZY3hvVWN6Hg3WBQY/rZ617RyCjxlmbvq5saBN/C3n87G63
	W5AR0Ib85UmjfzdRGYCqXKV3kAbe9HWNuAnIGcy4gqdzi4eJ4auOSBhkGwRGtpVbbpPNha1GzWW
	s7thpM+oOvT/+8NXTogM3tUOlg3i17HZvFlhVvZefDqvZWau4GKNclfBF35/uXYXU9MC3SkEkBM
	mAgvE3UyozI75uUBGaEoUpO6AOLGSgV3yohko4sJ2ZI2MfVVcoJzWtIgdngLNy4siFaIZ4tT6WI
	SowR
X-Received: by 2002:a17:90b:274d:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-3903c534d46mr24091471a91.4.1786090633235;
        Fri, 07 Aug 2026 01:17:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085de8ddcsm3913377a91.6.2026.08.07.01.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:17:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 2/4] watchdog: mediatek: Propagate errors from optional IRQ lookup
Date: Fri,  7 Aug 2026 15:16:50 +0700
Message-ID: <20260807081652.38692-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807081652.38692-1-phucduc.bui@gmail.com>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_091715_744441_973E24E0 
X-CRM114-Status: GOOD (  12.40  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Instead of only checking for -EPROBE_DEFER, propagate all error codes
returned by platform_get_irq_optional() other than -ENXIO, so that
failures are properly reported to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 91d110646e16..d9c30e4c80e3 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -422,8 +422,8 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 		mtk_wdt->wdt_dev.info = &mtk_wdt_pt_info;
 		mtk_wdt->wdt_dev.pretimeout = WDT_MAX_TIMEOUT / 2;
 	} else {
-		if (irq == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
+		if (irq != -ENXIO)
+			return irq;
 
 		mtk_wdt->wdt_dev.info = &mtk_wdt_info;
 	}
-- 
2.43.0


