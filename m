Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF9CC07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 10:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHvW2mH0yZiCOpVix1KpaCgJFkZzSxad+cGKtiAaGB8=; b=EVRHSdAbZE8cnPNhBXALY82WIs
	jGek1NLsyE4ChfEvRvoEQ1tTN1D0cydw+NFYYbg89UFINjcD8vX2S/FNP5gqLYaWRlIAgohU0Jvga
	dSHNTWn2qCa4y/NaLtJ05r596W5evlUibvlS5XYnfgklFW+1sAMJxWfsPRy9Kf4lmW8eu49JoL/S/
	aBgzxphFXKD4UHZ8FKWcuX9evq6JmZ8raP8sOXU9dIS8NGbbwaDBL+iH/YKkh7gZXQvjLSNYhl9WW
	l9vZ0fkoV4ai/n0Hi6O/UurutVGe5qjC5rc5Rp4BGiof3oBMteNfqKeke86q6tLLB71uTj3FfUe/G
	QqfQyP7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclJs-0046Nv-Ds; Mon, 26 Sep 2022 10:26:36 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclJ6-0046D3-Dx
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 10:25:50 +0000
Received: by mail-pj1-x1030.google.com with SMTP id g1-20020a17090a708100b00203c1c66ae3so6296157pjk.2
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 03:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=dHvW2mH0yZiCOpVix1KpaCgJFkZzSxad+cGKtiAaGB8=;
        b=RR2mK+4EOLZeN2sV7vuva88OhXlVdJgc07lHJrrM/3kAtVbhudmeUXxGhqeApoNlF3
         dn1ig/9OK1FDFXgKmAshSICrlPAiCcoXHD+oeNZ/af2UFeNqS77kewikCdl7O0oJmW3+
         0usfVX0ObdYmWEtqJBTSXlJGh787/7Jyd+LNY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dHvW2mH0yZiCOpVix1KpaCgJFkZzSxad+cGKtiAaGB8=;
        b=Iz3Zzkv47Kk8asY4zVuJTlUlvAPwE173Z0ySESSF4QvDwEwOA2k1FzYAKDMjz+8+qu
         HofI2qV78i+ZVU5FPMOpnd7sbFnx3ASETqVYbbcr2X705Oj3QqDO2LmVfOhfM4KCHeod
         PZMgZ4JCkY1DHhEprr/Mnz09lZ4dLvxHsewGlErnu16HgWoN9mlEmcWWLtN3duIswMzU
         6uJnHidCv7i99DWt9+d1/3m7cJE9IUiwe6wheJ0vZJ+mKshjxlzyY9Jg+eil6desKSEj
         UgMkwV+36+PIRxDUW+m45/ahriRLiLDjwjrdG2ZqsF3h8xfc/IAyAh+7r5Fnu90Qj0uQ
         N5wA==
X-Gm-Message-State: ACrzQf248cGNqAZNB8uCOPlGl6Go436k93h9Ws53BbAEGCCdmvfKYp5K
	vcvVLM6Z00Ehta1jQ4XEvHvnQQ==
X-Google-Smtp-Source: AMsMyM6GO+xZ/4H55pKgg7oGLLiGoq5xAuQEHhVv4iONQ8d2QBXxbflaWwxcIu+dHBA+3JhyfTC7lA==
X-Received: by 2002:a17:90a:f28b:b0:203:627c:7ba1 with SMTP id fs11-20020a17090af28b00b00203627c7ba1mr35851443pjb.191.1664187946492;
        Mon, 26 Sep 2022 03:25:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1340:7319:2f7a:3be9])
        by smtp.gmail.com with ESMTPSA id y23-20020aa79af7000000b00536aa488062sm11750236pfp.163.2022.09.26.03.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:25:45 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Miles Chen <miles.chen@mediatek.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/6] clk: mediatek: mt8192: Do not re-register top_early_divs in probe function
Date: Mon, 26 Sep 2022 18:25:20 +0800
Message-Id: <20220926102523.2367530-4-wenst@chromium.org>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
In-Reply-To: <20220926102523.2367530-1-wenst@chromium.org>
References: <20220926102523.2367530-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_032548_533715_7C5B3CE0 
X-CRM114-Status: GOOD (  10.53  )
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

top_early_divs are registered in the CLK_OF_DECLARE_DRIVER() half of the
topckgen clk driver. Don't try to register it again in the actual probe
function. This gets rid of the "Trying to register duplicate clock ..."
warning.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mt8192.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8192.c b/drivers/clk/mediatek/clk-mt8192.c
index ebbd2798d9a3..e39012583675 100644
--- a/drivers/clk/mediatek/clk-mt8192.c
+++ b/drivers/clk/mediatek/clk-mt8192.c
@@ -1235,7 +1235,6 @@ static int clk_mt8192_top_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	mtk_clk_register_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), top_clk_data);
-	mtk_clk_register_factors(top_early_divs, ARRAY_SIZE(top_early_divs), top_clk_data);
 	mtk_clk_register_factors(top_divs, ARRAY_SIZE(top_divs), top_clk_data);
 	mtk_clk_register_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), node, &mt8192_clk_lock,
 			       top_clk_data);
-- 
2.37.3.998.g577e59143f-goog


