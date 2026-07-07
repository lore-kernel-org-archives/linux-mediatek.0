Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A168C44500
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2026 07:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kKjhuNgKv0qFJ22JEcdhdHesMNDXvsHgco0Wjw4pG2I=; b=2g+blCg31Ll2cIuiaB7ut0/QlN
	iFUSeTJQhZjlHl86DRjG6scKStHVDhE5UXahvVRpxsCQpQE2CG/yhKrbpBWoDww3wSOSjbHBllM+7
	Sf8aYrgt9FPnAEdlOu4qzrJT03ryn83lApceb1zdwChbkrXAdQqxA2wiMxNyPgcStEbY/xXExTSGM
	2xRGE6GciyVUXJXLcrCGsRAO3xOiQwNW3PrD5Pw9wPAYPdjHTLWGoeOEVF45FcLU7kcpluh3Vv1qs
	ZbryDCOxM3atE8Jm6HQ9RA/m7j1tO6vrjJg3beD5u3wCBKiGywal9vWTTJ4PAbMTFPs5+nfc2M54l
	rjF1GlQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0YX-0000000EMMe-1MJt;
	Tue, 07 Jul 2026 07:49:25 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0YU-0000000EMK9-3ewH
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Jul 2026 07:49:24 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-381ed661712so3511370a91.2
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2026 00:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783410562; x=1784015362; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKjhuNgKv0qFJ22JEcdhdHesMNDXvsHgco0Wjw4pG2I=;
        b=LH+7pPx6eHz0oRIdYwrmdCX5WvQPVcN8pUvBUXvViy2HxooPfcO2ZGQKjKJutERE1F
         o3QJxTZBNb5jPe86NPNajAj1hRT0M9tsYqUFeHxEqZCIhi/YzzLjSrfMJYe9qcCFZusf
         gxGng7RaUIojgRgyqfjhBl5ZaDH7gDIUCCoxonPJr9oagDEytYhPA69oS+YsV3q2AHos
         Zo2RkktEO/In7Ai5HV3Ulq7hYDwkUDDt0Vsj7zwVPogfVe2KJ7OzlkANMx3OYGEMYvlJ
         dVWN97Ati7rXlv1aG0w2/490rUtChjOk9/AncoX4rGx3xFuTJTk74Lp0A1H3+GGmgdJz
         qePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783410562; x=1784015362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kKjhuNgKv0qFJ22JEcdhdHesMNDXvsHgco0Wjw4pG2I=;
        b=aIWKq/QG5n6rZhzrl7dyP5dZX+VmYrZXbatAs6JHg2zjeXC5w1CkJlpAvaISmM5ClK
         f4OZFYn1J7nCi0aiYTScJl9rivXwgrMZ6BL/e/61UpBAQTqBjmSQ5PFTBkUKg2d9vkuU
         KL6GVCxOUsITinKiltOWsvm1kOgldNOIgRNwcZHXf1x0DW6L2JeZJSZFzN4IWDkLv61s
         Scxs8zH6V0cTOfOv+BnMdeeLkWsKe40Ps8vXka1npIFmoaW77ca6CB3prsr1woBPYnaX
         HWMB8W7MmuK9MHGDMSsJNktXAZHvVYCNoZUFwktycXnjRUCndKU3egK5mtQTUA3IlPkG
         0FJg==
X-Forwarded-Encrypted: i=1; AHgh+RpAA8lExuMiSlNec2+/pP1OxtbDZUIi92YSrSUvhuTpzv8AS4vE3TnI6ZDhd/zjBJIkLjD9us0lbejYuwibVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyKAv8fuxMibAzdvQcq2D8AOiXkxSdZ8AUr704jtu3BWM/PID8o
	ds8RXR0+qmoKSAyiEVsR5CqhWAfEPmybK3H7DTxZa7bIg80ttmkPL4nP
X-Gm-Gg: AfdE7cnw+Cg6uCDZdEfPs/lm7dUnEHQ5Cnz85MYPQ+uTMtEl7J3bWy1TqYIuJj6p9wA
	kZuEqwbsy1bXdleizaIMgd3ssTiNQpqJ2p90f3YZgP/FnadD4f9fZcJog67B9ZXCfDnlEuRPmeg
	5gc4YI62p3Tb1JhKEZix0T7Zf6Z+IG6ao7EpebJ+6T7LCFyIdEyiBZdV7nvqDCJJ/VBwd2pOkrP
	h+sqmbHXsCuTVeMwhrGMrXytI1rDabmChC4NzXnaWG72D6zLkuDPruvUBacL45F0Sfur8hj+kPx
	B9Mm2/9cmX750tMGVBkeg3AlGtlCrStjuipIb9Hdnh4RWaVGRgVESgmbTEqvjR5ABHCfrTQhrL9
	ZW9LT+KWCeBNYUDAZYDRQJbzBKdFnavIGDqMeoZY73UGe7JpBSo4mhYxxYVFS+89nmv/JEZvPeT
	1zVG+2RPUkyOyOnwxI3BxN2piv3nwyDzM1Wf2X8wvrH7y7
X-Received: by 2002:a17:90b:3d88:b0:37f:fdc8:71b4 with SMTP id 98e67ed59e1d1-38755573768mr4083401a91.2.1783410562030;
        Tue, 07 Jul 2026 00:49:22 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-387d20a361asm626710a91.15.2026.07.07.00.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 00:49:21 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>
Cc: linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	stable@vger.kernel.org,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH v2 2/6] clk: mediatek: mt6795: fix memory leak on module removal
Date: Tue,  7 Jul 2026 16:48:31 +0900
Message-ID: <20260707074839.240676-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707074839.240676-1-akkun11.open@gmail.com>
References: <20260707074839.240676-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_004922_915376_FD5ADCD2 
X-CRM114-Status: GOOD (  11.66  )
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

clk-mt6795-apmixedsys.c, clk-mt6795-infracfg.c and clk-mt6795-pericfg.c
do not call platform_set_drvdata() during their driver probe callback,
but their remove callback calls platform_get_drvdata().
This results in platform_get_drvdata() returning NULL, which leads to
calling kfree(NULL) in mtk_free_clk_data(NULL).
This leaves clk_data unreleased, causing a memory leak.

Fix this by calling platform_set_drvdata() during probe.

Fixes: 0d363282bb0c ("clk: mediatek: Add MediaTek Helio X10 MT6795 clock drivers")
Cc: stable@vger.kernel.org
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6795-apmixedsys.c | 2 ++
 drivers/clk/mediatek/clk-mt6795-infracfg.c   | 2 ++
 drivers/clk/mediatek/clk-mt6795-pericfg.c    | 2 ++
 3 files changed, 6 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
index 123d5d7fea85..239a3f5e1760 100644
--- a/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
+++ b/drivers/clk/mediatek/clk-mt6795-apmixedsys.c
@@ -175,6 +175,8 @@ static int clk_mt6795_apmixed_probe(struct platform_device *pdev)
 	dev_dbg(dev, "Performing initial setup for MD1\n");
 	clk_mt6795_apmixed_setup_md1(base);
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_ref2usb:
diff --git a/drivers/clk/mediatek/clk-mt6795-infracfg.c b/drivers/clk/mediatek/clk-mt6795-infracfg.c
index e4559569f5b0..914bb069aa85 100644
--- a/drivers/clk/mediatek/clk-mt6795-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-infracfg.c
@@ -116,6 +116,8 @@ static int clk_mt6795_infracfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_cpumuxes;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_cpumuxes:
diff --git a/drivers/clk/mediatek/clk-mt6795-pericfg.c b/drivers/clk/mediatek/clk-mt6795-pericfg.c
index d48240eb2a67..27d0ef7d7b2f 100644
--- a/drivers/clk/mediatek/clk-mt6795-pericfg.c
+++ b/drivers/clk/mediatek/clk-mt6795-pericfg.c
@@ -125,6 +125,8 @@ static int clk_mt6795_pericfg_probe(struct platform_device *pdev)
 	if (ret)
 		goto unregister_composites;
 
+	platform_set_drvdata(pdev, clk_data);
+
 	return 0;
 
 unregister_composites:
-- 
2.54.0


