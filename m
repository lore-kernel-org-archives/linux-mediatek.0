Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC28C46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Dec 2023 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UqybA8kGXGwS0p6VfCaZS7VsH26LSz7rBgi0KXqcQ7I=; b=GyI8adxqarVn8D+eUK4sFTZy0/
	aT1fnfUsOWU1xDrDfvwf+opmbGCuEs+T+DOGC3b9WLGsg5uVTRMD9sNh9MnH2dQeT4tqlR21UJLIJ
	pjiFwhH4viyjmR7I8wLRcCh1LGDGNMussWLhonTYsj7mYFzO403UU9i27WbFMVrpY0JrnhKjNsTnQ
	kDQjl1p0gFNJPYfgk8e+DTtQYoRMfCAHx1BGYScXa8BXW1k5LyUztmia4U4e2PJIFdFX79zPemyxP
	1crzeBBs4kH8wuu8u0AaWqrPkaxRL7qrDWmsCjLIqrgWMijtSgfV9Anjzzr8V8Dg4nicvItThk6qQ
	CKW8JLNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIPqm-00EGHa-2m;
	Wed, 27 Dec 2023 09:05:16 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIPqc-00EGCC-2S
	for linux-mediatek@lists.infradead.org;
	Wed, 27 Dec 2023 09:05:08 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5cdfed46372so2432651a12.3
        for <linux-mediatek@lists.infradead.org>; Wed, 27 Dec 2023 01:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703667905; x=1704272705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqybA8kGXGwS0p6VfCaZS7VsH26LSz7rBgi0KXqcQ7I=;
        b=nhTwADSERxNtONieOjsODqsLIwkqJjd1r/VuC5co9i3NZa9yC6fa4qvG7N/irTkE3q
         JrVk7JnyCAIg3yN1r1IFBpXccggU6/5OJ94XFolkGIeuSJDYnm9Y4wtnaK7EFtUsGjOt
         qbDHeRg1pxsHUoEKCRbgMWDbEe1TuT2F7CXg4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703667905; x=1704272705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UqybA8kGXGwS0p6VfCaZS7VsH26LSz7rBgi0KXqcQ7I=;
        b=NVyoiH2cUGtEzeDhxTBhq5tz3f1WLZvwXgR1Ug9CDsZuGzObHaPjZdEnOpF0tsG7E6
         Orr92eQbdcCRj3+D0byGc+MdCTbzDkxDVbszuBYwku/RIKNBZrziWBQc0FO2VPL1cDaQ
         K3Z+BV5QEdWixkeKBQuVV5lFvoTWCcKY7qeq/0t4Ul1JIXtMD6BGo+pnAJ2s7whaDkC1
         kJYLMOfH1KOmJBRLjGwwYDrnbxCdmDrJUV3YjcGUea08mj4W0h2L6TefztPok1Z1QvZX
         AJwfCrmQk7eSOdVo+90MirHKjYQocitUfBWG6u6BkFoByCjQ62uGOV4OknBFlFThlGxw
         gGmg==
X-Gm-Message-State: AOJu0Yy4P8iGi0FsSvuVPMKYyQn5HUJZ7noIKNtK6ZrVr4UljzFtPRlw
	9vYr5AmVkw+hXuSiQcr81AfEyEtb6+XS
X-Google-Smtp-Source: AGHT+IHzLN+1pxxIuXsPLSje0l/zdsr5/VBgqdxz5v1VViJZw0E1DLI5tn6YlpQiPS6VAvJrCPbvFw==
X-Received: by 2002:a05:6a20:938d:b0:196:2c8b:9f21 with SMTP id x13-20020a056a20938d00b001962c8b9f21mr200388pzh.112.1703667905699;
        Wed, 27 Dec 2023 01:05:05 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:18d2:7869:e8b9:f4e4])
        by smtp.gmail.com with ESMTPSA id v22-20020a056a00149600b006d9b65d1a8esm5347701pfu.28.2023.12.27.01.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 01:05:05 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Pin-yen Lin <treapking@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] clk: mediatek: mt8183: Enable need_runtime_pm on mt8183-mfgcfg
Date: Wed, 27 Dec 2023 17:04:43 +0800
Message-ID: <20231227090448.2216295-2-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231227090448.2216295-1-treapking@chromium.org>
References: <20231227090448.2216295-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_010506_847594_EB44F788 
X-CRM114-Status: UNSURE (   9.84  )
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

mt8183-mfgcfg has a mutual dependency with genpd during the probing
stage, so enable need_runtim_pm to prevent a deadlock in the following
call stack:

CPU0:  genpd_lock --> clk_prepare_lock
genpd_power_off_work_fn()
 genpd_lock()
 generic_pm_domain::power_off()
    clk_unprepare()
      clk_prepare_lock()

CPU1: clk_prepare_lock --> genpd_lock
clk_register()
  __clk_core_init()
    clk_prepare_lock()
    clk_pm_runtime_get()
      genpd_lock()

Do a runtime PM get at the probe function to make sure clk_register()
won't acquire the genpd lock.

Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 drivers/clk/mediatek/clk-mt8183-mfgcfg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
index ba504e19d420..62d876e150e1 100644
--- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
+++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
@@ -29,6 +29,7 @@ static const struct mtk_gate mfg_clks[] = {
 static const struct mtk_clk_desc mfg_desc = {
 	.clks = mfg_clks,
 	.num_clks = ARRAY_SIZE(mfg_clks),
+	.need_runtime_pm = true,
 };
 
 static const struct of_device_id of_match_clk_mt8183_mfg[] = {
-- 
2.43.0.472.g3155946c3a-goog


