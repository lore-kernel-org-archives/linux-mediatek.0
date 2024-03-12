Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C762C54E58
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Mar 2024 11:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=32L7EdHAuQ4WnOqivRSfbIvHEBBAYz+hzKyLr7KyYy4=; b=4ClEjMUOSzzki2vrMk+npoTD4a
	1ZxzJHU04PFO4URMVcbtBJnFm3+yTZcLbMnVcdtQw0xTyeZZObluc/Y3W20SLl25lMQ0xveaYbfoI
	2C2TpWWtRvw+qe1bXzpr0WQePv9LApVFp7VhEeoYoItIT2Pz3llIZw/1sM4cCJNXfyJo4n8GcW83p
	uMNwacdcvBUdJQBZFPBVVkuWpWFxSszKkVhxeMEmrN9AQAs9/TCI5/r+ZlS7DGQPwRitdJ/xIgTJz
	mVHw7mKukyzViVnEzm6ajkfmivOPfqZZp2CrLc3D93n9vDUuEj1FPDgFjL784uOb2QkqJJKQ74AvO
	hQaRZSXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk0gn-00000005aV1-1TVb;
	Tue, 12 Mar 2024 11:53:01 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk0gi-00000005aTa-4Axd
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Mar 2024 11:52:58 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1dd611d5645so32398065ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Mar 2024 04:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710244376; x=1710849176; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=32L7EdHAuQ4WnOqivRSfbIvHEBBAYz+hzKyLr7KyYy4=;
        b=KkBeyKuoV7I6cRsMn1UdOxYZAtzqs8/qSBYavSocTgQZeVp3szgMYESL1L8pWhU36Q
         TgptGFrdZcPoSIElCIfnASFxugn50z68er9gwOmJrwziLbRlSpxX+HCWO1Gn8f9H/WxM
         dgll4+c0ySLq2lHbaXK7X1LCfGgu9TKZKZGig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710244376; x=1710849176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=32L7EdHAuQ4WnOqivRSfbIvHEBBAYz+hzKyLr7KyYy4=;
        b=GRsoR36RQRMdnFcifqKdcKBUjZcSo+Q0R17n/mR9q8BA6WUnzlEeZFp2n3SEoxrGc3
         CRekk/bVHZf50OfEx2vBW87AE8jcry9RcQ/ee4D8NZ9Sp/FJHhOl6oYjfbhUtx21GbRs
         AfKLie1kHSe3PKFBNkbN0LBF7t2ibYGlrZc4iYpPuYv7H4sM+EPTiFcCu0gCbn8tCOmH
         40FqmLDaEltWahrb2+TByCOLKGrqfgkJhG5qvmcCL0h2HQ9O5C7OyppeBoe3saLyw4AQ
         yUiUFR+cSmFm41cgYBZOU0pXo33/ltnGpO/0I43Kw2XmwHTKdpGyJ2hY/ARacVDUBGCH
         71xQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT8zQQIokqnW+Ez8e5fQxBt0iuTGEARiVdKGa4BPkp4+uTMhagN9pQ7IavkLoyLt4aiRI1lozUdZqn4naTi/RiS9bzBarjJLfGc+fohuvxxZEV
X-Gm-Message-State: AOJu0Yy8Pbte9OXkods6iaJowZQE3ioaR/Mq+oI1FG48jExDo/xhVXdE
	/FqrSSXyBzDO4SPQ5oUYR7MZ/83IT59/H2/77GDiJbEygk7tRdZjZEietnUJgQ==
X-Google-Smtp-Source: AGHT+IFHW7gNc8FGsMt9K1fDNHiUJ5TT/QPfRrLz4t4aGJMOagv8xqOkZuJYIn0TiohOgI7RjlfCgg==
X-Received: by 2002:a17:902:d2d2:b0:1dd:c227:4175 with SMTP id n18-20020a170902d2d200b001ddc2274175mr813268plc.8.1710244375852;
        Tue, 12 Mar 2024 04:52:55 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:bae3:7b5f:7434:812e])
        by smtp.gmail.com with ESMTPSA id b15-20020a170903228f00b001dd1bdee6d9sm6500179plh.31.2024.03.12.04.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 04:52:55 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Bosi Zhang <u201911157@hust.edu.cn>,
	Nicolas Boichat <drinkcat@chromium.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v4] clk: mediatek: Do a runtime PM get on controllers during probe
Date: Tue, 12 Mar 2024 19:51:55 +0800
Message-ID: <20240312115249.3341654-1-treapking@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_045257_089882_A6DAD893 
X-CRM114-Status: GOOD (  14.62  )
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
stage, which leads to a deadlock in the following call stack:

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
won't acquire the genpd lock. Instead of only modifying mt8183-mfgcfg,
do this on all mediatek clock controller probings because we don't
believe this would cause any regression.

Verified on MT8183 and MT8192 Chromebooks.

Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---
v3: https://lore.kernel.org/all/20240108081834.408403-1-treapking@chromium.org/

Changes in v4:
- Remove the need_runtime_pm flag and apply this to all mtk controllers

Changes in v3:
- Update the commit message and the comments before runtime PM call

Changes in v2:
- Fix the order of error handling
- Update the commit message and add a comment before the runtime PM call

 drivers/clk/mediatek/clk-mtk.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 2e55368dc4d8..bd37ab4d1a9b 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -13,6 +13,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
 #include "clk-mtk.h"
@@ -494,6 +495,16 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			return IS_ERR(base) ? PTR_ERR(base) : -ENOMEM;
 	}
 
+
+	devm_pm_runtime_enable(&pdev->dev);
+	/*
+	 * Do a pm_runtime_resume_and_get() to workaround a possible
+	 * deadlock between clk_register() and the genpd framework.
+	 */
+	r = pm_runtime_resume_and_get(&pdev->dev);
+	if (r)
+		return r;
+
 	/* Calculate how many clk_hw_onecell_data entries to allocate */
 	num_clks = mcd->num_clks + mcd->num_composite_clks;
 	num_clks += mcd->num_fixed_clks + mcd->num_factor_clks;
@@ -574,6 +585,8 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 			goto unregister_clks;
 	}
 
+	pm_runtime_put(&pdev->dev);
+
 	return r;
 
 unregister_clks:
@@ -604,6 +617,8 @@ static int __mtk_clk_simple_probe(struct platform_device *pdev,
 free_base:
 	if (mcd->shared_io && base)
 		iounmap(base);
+
+	pm_runtime_put(&pdev->dev);
 	return r;
 }
 
-- 
2.44.0.278.ge034bb2e1d-goog


