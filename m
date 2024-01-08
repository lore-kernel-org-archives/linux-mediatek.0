Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6783CC3DA6E
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jan 2024 08:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PajgPkTBW3iluxw6UIGchSAnGs+6/xnB8PBfDDEr3ic=; b=wwtknWQDoAsJYved7n38k3zDHi
	crhSsvFkfaOkttRWKiMawzT6zvOwtuDap+cmiZf3GhqXfeNTjqHM2JLi7L8rxez0IAxvzVemicDrW
	saSkJr85DtvV8UfnwbOdw9irKVxYMrqlqUWq57OkwR1Xmhod3WDGe0JqXHHW8+q/HLiINx3Zc4umo
	RzMdbV0rtEKM1KLCIYquer1DbtC0xJ/4KMIjnTgyc5c50MNCgIV7xgxpYiqReOJZJ2PBEc59zZ8Sg
	p3PaQ8LnlldIW5WdQAsYNPOJ4altNc7jHpyW2bIlqz+/i779slbqRpSXVaXQhA8CKHVRW7fniX/76
	BU6v0/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMkqN-004H0U-2t;
	Mon, 08 Jan 2024 08:18:47 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMkqK-004Gxn-2M
	for linux-mediatek@lists.infradead.org;
	Mon, 08 Jan 2024 08:18:46 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1d3ed1ca402so13349595ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 08 Jan 2024 00:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1704701923; x=1705306723; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PajgPkTBW3iluxw6UIGchSAnGs+6/xnB8PBfDDEr3ic=;
        b=n9r5sqx+he/2LV6myxwdUryjPFCb1vwZ4Rq3WayaEDFXKjYeT7rRtvgtOr5FQOvqro
         Nt7XVUvow8JJOvRtyDVVvLP8Dsw8Ns/0XWPOZbTX1DWpCqqHNngTameGO2qpfbNmN7h/
         78Ae1QHXYBQLb2AIHMnjOEdLevzHxUxFYay64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704701923; x=1705306723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PajgPkTBW3iluxw6UIGchSAnGs+6/xnB8PBfDDEr3ic=;
        b=X2mqhpuEALvD8rvAJeDwoEuDFg2vu/11xlvjcsIv1JGHa05LaGbxY7yh7cjSIIV8xY
         9eankZ4XCY7BOulfkCj0geaKiLJf5t1ZbD0eGPsmpvdbcBhAxk8cfUrOPfgzmUIiYIgs
         3gAY6SlHgzT5aXeX70Pgj7Xmqf6zu4WbLfAqbqSxzTV2nmb7XU84tnJXZYS1benY3ySN
         9iH9J3XLv1POUS4hJ2YTHkn40jWEmd79r2Jz697RCXnoZOFH9oYlogHOBn4zYDgeWG/p
         CzbuZMJhtSdL6oeZ05CxFmM5deFBYlO2f2DZOn0BvWK0lbH29aVcW2Sydf/yZCj9YJSP
         EhYg==
X-Gm-Message-State: AOJu0Yx4DXPQEgcka78N3pZLs4G73B93kOs3B5xWUKIbeSO5vyk3vLgm
	PQwvsP5GonBDfnBsoSvdVgD7CAkYRY22
X-Google-Smtp-Source: AGHT+IHWcp3e1C1pCxpD9ZE1ctDnpB0lvwh36vHDQttf1iujltl/YpMCv6WgVen6qzG0XRhu94epxQ==
X-Received: by 2002:a17:902:dac5:b0:1d0:6ffe:9f5 with SMTP id q5-20020a170902dac500b001d06ffe09f5mr4245569plx.83.1704701923020;
        Mon, 08 Jan 2024 00:18:43 -0800 (PST)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:6859:f8da:3370:7a74])
        by smtp.gmail.com with ESMTPSA id jj4-20020a170903048400b001d078445059sm5672513plb.143.2024.01.08.00.18.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jan 2024 00:18:42 -0800 (PST)
From: Pin-yen Lin <treapking@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Pin-yen Lin <treapking@chromium.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/2] clk: mediatek: mt8183: Enable need_runtime_pm on mt8183-mfgcfg
Date: Mon,  8 Jan 2024 16:18:16 +0800
Message-ID: <20240108081834.408403-2-treapking@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20240108081834.408403-1-treapking@chromium.org>
References: <20240108081834.408403-1-treapking@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_001844_766283_ADA96AC8 
X-CRM114-Status: GOOD (  10.50  )
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

(no changes since v1)

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


