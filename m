Return-Path: <SRS0=fEyP=GA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B2D2C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 09:04:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BBCFA20781
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Dec 2020 09:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBCFA20781
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z5zKDVgziZ8n2vTsAvUiBk/LS2KB1+OBP8x/KqXK70c=; b=ryliEYnIjlCITiR0DrIpiYWEmP
	uBIkkjgaLSXub7zlzG2aTTSBc5Fk5b6tUXCel+PRp87+P+9mRw2zHWxzVPlWlP17ygUAABXxnqSWa
	Xu5NgdwVXfQTY0qm2Vfv7XhWNAvpLn2HfMD9p1EeprRXZjLSrqtTb0o17AS+TQXHLuEIdBA9NQz4z
	1eOiFfsIhWyhgaiOAfbCuvsFmLwryleEl+jIkuDncqFO5PIvzEteHMjz4G9aIjXpCg/NwjLfIfdN1
	nJ1Z9FxstdieFAzO0Ls/bW5DbbP84GvmPnXVPXd9G0vfH6HY7ENAeLd1jM+PdHn6JcUqAee2QTbVB
	fU6huLpw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktoSC-0005kG-Gs; Mon, 28 Dec 2020 09:04:36 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktoSA-0005jX-JV
 for linux-mediatek@lists.infradead.org; Mon, 28 Dec 2020 09:04:35 +0000
Received: by mail-pf1-x429.google.com with SMTP id m6so5967430pfm.6
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Dec 2020 01:04:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X4pAM+KZPcorEeEY52d8nlRr19UO6jcGAcFxkVXndac=;
 b=Q0q/Ga+Nxl+3FRZgGiLxoEgOGgwiSNoS3EbH3cbyl+E0gQ7GJLAkpv/ZNUp2DuRnZh
 c7JaTDTi6Jcrtdo5bby8PAXpJsATseq5v3CWrgtaVJNHH8vi4G/xtXPWxXhyjRWONizp
 6rFkdMqbF9G8k+I0VvApIg/HinLERWVH9zkTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X4pAM+KZPcorEeEY52d8nlRr19UO6jcGAcFxkVXndac=;
 b=fWMdVyquuvNRtUD3a+ZJv5mn8VFpueotvUHdmRV6L2EUlYOTntOQiIIYMiNnDXo7Rf
 8RmF9XHhTULZ3m8xRiXym/LNjJIDdPrTCjN3MY+6ojpTNjP5T6GzZeJZB0UmUGHsPLgL
 KxnoKRDLe0x/nvRAjSBRe13nRWeTn+spJHeOwrzfIiPKNLBNE3MoYQGvO8B2celLFKaX
 0wwbzSeYcUkhzLzcTdGeYPWWXIExWuUQX9UMVdKpylJAQ3n9c2Xh+vd8JFz62+qPWFFE
 XCpeDa3vfCJwk5/zeZ+9BybEkbuygFMUMZ9r8QAa2MXeESVX9azD8Z/M5jaqS3rLbbkJ
 9Znw==
X-Gm-Message-State: AOAM531/jmPgAe8q+qNzQJZSW/FFEOyYejx7gx4JLioaoes1yKZ0/Z7Y
 XVLiy5019I2r+E3Jtap8qb/x4Q==
X-Google-Smtp-Source: ABdhPJxt6FqRzO1S7YUjyHUwrV8TLbMVa6hCRDhCOqzEtTJ899Q8c45+FCd78FI7imT744QJSdl6hQ==
X-Received: by 2002:a63:e049:: with SMTP id n9mr42750637pgj.339.1609146270214; 
 Mon, 28 Dec 2020 01:04:30 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id h10sm31496329pfn.213.2020.12.28.01.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Dec 2020 01:04:29 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: Fix fallback call path
Date: Mon, 28 Dec 2020 17:04:25 +0800
Message-Id: <20201228090425.2130569-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_040435_012030_85A1A585 
X-CRM114-Status: GOOD (  10.93  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>,
 linux-kernel@vger.kernel.org, Light Hsieh <light.hsieh@mediatek.com>,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some SoCs, eg. mt8183, are using a pinconfig operation bias_set_combo.
The fallback path in mtk_pinconf_adv_pull_set() should also try this
operation.

Fixes: cafe19db7751 ("pinctrl: mediatek: Backward compatible to previous Mediatek's bias-pull usage")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 7aeb552d16ce9..72f17f26acd80 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -920,6 +920,10 @@ int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
 			err = hw->soc->bias_set(hw, desc, pullup);
 			if (err)
 				return err;
+		} else if (hw->soc->bias_set_combo) {
+			err = hw->soc->bias_set_combo(hw, desc, pullup, arg);
+			if (err)
+				return err;
 		} else {
 			return -ENOTSUPP;
 		}
-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
