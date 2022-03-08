Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82E8C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sNRnRRRlAoJ3BLsGslcu7chf+jcjZRG8TTiqYmfeckA=; b=C1BJ0vPuJDZBd1
	o2L/dL47iKKZUHLDmMeJhSWqo+QiYTGATut4Rw6O9PdLmZ1xR+XU/8MC83AOvE7FJjUONZ9YTJptH
	p0s47l836UQeRwl1M69Ci4oEA9cnRQ8su4zJJ9K8vgApDhEj6vaXcuQxS//G1/5Cf7cbEkMjrpOHQ
	R3sHlGzijOXDpkQTq6gxiQxtGGqDl/A0B7tGCAExbfn2oxu9iWF1gb/g/AOsO4O3LNA1u2pBpJLgK
	hDSqvFgkLd6GaNhJPXjZTZ1q1Omf5tEbMzhGOAe0a/lKX9e9EK7rppyN/UahvMvVsj9PBWk0YaF8g
	axBo4RIeluxriOcCxa+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWum-003n5i-Ch; Tue, 08 Mar 2022 10:18:00 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWnB-003k4M-Lp
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 10:10:11 +0000
Received: by mail-pl1-x636.google.com with SMTP id n15so6626585plh.2
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 02:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=noEqkBf5xzBolmnhdQPfwHD82qaYeiB8/RXOxn1DB2I=;
 b=PsIwM301p+zkfVPLNMuBY2fgeZYi4j+IGcIxp8lP2wQofQwsTA/SANTTxjG0S8RTAK
 Zz2rcqgxCgmmwveXGiLhoaqoV9LC4rAO+jCp0lqq4wCXA5PSkdUzbpTufzwn7Ap3iPbQ
 jmIKa5JsZRMgNuNQeXZh1sXnjbhE/kmJF87vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=noEqkBf5xzBolmnhdQPfwHD82qaYeiB8/RXOxn1DB2I=;
 b=SLUg5AGQe6yJE1TkSDkEtuG2J96PTfaAlg20RvUjT3qa0J0tTmcd1WFpg1FCKiSw4/
 ZAoXj1YQJrlXoOHOk0norW54vqP+wKJ5d3gn2s246jFe4mkMPXkTT5IkSbOgtptrULv7
 3r7fIAa3AWPqX/5XmbKAIICqjgh7e5J7hWSmnKxTkBBiQJ6g097IuePnf0NCy6ZZ5Nfl
 yMAxJYJ8sCUZo3v/Xas4Eb2BbO/BNnxYDc4xU7oi5OikWuOjZly/FPVKrcummnAYTPu0
 b2BKgopKfrc2/OEZh9J5HYMX6eCgXzwABO53sIcn8Uh5py20dViWgwA3VeB+iwWn51KK
 nAyA==
X-Gm-Message-State: AOAM532yUlnV9CMzKAQqhfpKwGciP0LCvGs7PRyoegA4bX5MzGwgT6Hq
 geB5p22+w+8evjIWtE+h55kyg1YI1su1yA==
X-Google-Smtp-Source: ABdhPJwMnsLSH0Ugh0kYJjqmbKgwtim8f6qXQsngF85UoO3kJmueeC/GVPnsmGoroD8ZfCxe30PFag==
X-Received: by 2002:a17:903:2350:b0:151:e633:7479 with SMTP id
 c16-20020a170903235000b00151e6337479mr10346038plh.74.1646734208964; 
 Tue, 08 Mar 2022 02:10:08 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:73f8:5e3f:6894:8f44])
 by smtp.gmail.com with ESMTPSA id
 k19-20020a056a00135300b004f734327960sm1707553pfu.106.2022.03.08.02.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 02:10:08 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 02/11] pinctrl: mediatek: paris: Fix PIN_CONFIG_BIAS_*
 readback
Date: Tue,  8 Mar 2022 18:09:47 +0800
Message-Id: <20220308100956.2750295-3-wenst@chromium.org>
X-Mailer: git-send-email 2.35.1.616.g0bdcbb4464-goog
In-Reply-To: <20220308100956.2750295-1-wenst@chromium.org>
References: <20220308100956.2750295-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_021009_849950_60F19A8E 
X-CRM114-Status: GOOD (  13.69  )
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

When reading back pin bias settings, if the pin is not in the
corresponding bias state, the function should return -EINVAL.

Fix this in the mediatek-paris pinctrl library so that the read back
state is not littered with bogus a "input bias disabled" combined with
"pull up" or "pull down" states.

Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index f9f9110f2107..7037560ecda9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -96,20 +96,16 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 			err = hw->soc->bias_get_combo(hw, desc, &pullup, &ret);
 			if (err)
 				goto out;
+			if (ret == MTK_PUPD_SET_R1R0_00)
+				ret = MTK_DISABLE;
 			if (param == PIN_CONFIG_BIAS_DISABLE) {
-				if (ret == MTK_PUPD_SET_R1R0_00)
-					ret = MTK_DISABLE;
+				if (ret != MTK_DISABLE)
+					err = -EINVAL;
 			} else if (param == PIN_CONFIG_BIAS_PULL_UP) {
-				/* When desire to get pull-up value, return
-				 *  error if current setting is pull-down
-				 */
-				if (!pullup)
+				if (!pullup || ret == MTK_DISABLE)
 					err = -EINVAL;
 			} else if (param == PIN_CONFIG_BIAS_PULL_DOWN) {
-				/* When desire to get pull-down value, return
-				 *  error if current setting is pull-up
-				 */
-				if (pullup)
+				if (pullup || ret == MTK_DISABLE)
 					err = -EINVAL;
 			}
 		} else {
-- 
2.35.1.616.g0bdcbb4464-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
