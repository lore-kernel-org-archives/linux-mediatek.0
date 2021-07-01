Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F139C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 06:55:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1935B61468
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 06:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1935B61468
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6ZzFXmR7WWs4SoRl9oVyYxNO0Tu7CqfffocMTLA9+9Q=; b=iVOhDbiaUiJ/jC
	7/cK9adjjo1IKqkk9RCstIRHsH9HSYM7Feab6ln8RjilxAqglMFGCTf2c/zD4qNOPrTHWBDkjd31H
	H8w/7ZkEINsf/RbzP6pdMA8Cs3OAwx1+x5WCCdxnfBSipM3MF6bs+OlL97rAbkaNvodqMVRX4zkNO
	5L/OzxUYGukrrDY6DykFUiUpv5jSRXVfrIuXd6fOzFjfkBlJWXWsBnhD8F2Mn70IrLrHFJfH4ff2Z
	z+/NDkpRw5mcF2lZwpnd1iI7bEoBqCUZQN+XaM6be4VMTh3dKvMuN5kYAzoRpMa4g92tULN0gj8H+
	+dbs1yvyjTXUSCsZNbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyqbC-00GIsL-H8; Thu, 01 Jul 2021 06:54:58 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyqb0-00GIr0-K9
 for linux-mediatek@lists.infradead.org; Thu, 01 Jul 2021 06:54:47 +0000
Received: by mail-pf1-x42c.google.com with SMTP id 21so5077895pfp.3
 for <linux-mediatek@lists.infradead.org>; Wed, 30 Jun 2021 23:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BaGoqmFP1tt0EpZeEpkj9x84y98y9BYCdG4DKqTdqyc=;
 b=jytw1fUdgseF6tkwK4vPEO6tMMLx7zUiWZECq+PuslI4xmtAklxm6BQi0CekZ+tkIT
 aqXLdrI5VN/Nc5msg6XIAk1fVxzUfAR+cKBijD9YUtszoyZNJz5//dHazXD96UAh9TOT
 CjyS7QVqbISwamkqJs9oz5XJJYFycLwO1/P+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BaGoqmFP1tt0EpZeEpkj9x84y98y9BYCdG4DKqTdqyc=;
 b=Wf9uNgmCiOA9palZzknWyAipf+pIWTLp3Cws6ieks7YAblbljvBz8g0KT+TXfjSdrm
 eYfygV4oAQ1AjtKMOWXYIJ2wpLBCoUZ9egHBu8gjdkrhy9OYUJRyRe9KElKo0dOu6PJr
 YlhIy215m+47fAWJ/M8seITgPZQ95XT3Wt49Mo9XxkfDK4T2YwXCUmrQNRJMZWN6nXxG
 MIgJz0nFBZB9KSSSWzCxv7gfYLGPFdx/QIDkNF5KsYl6I8qxBj1BPhDqyHkATAz2UCbi
 9d3IOzY79uxUTmmEbt9lBjcb+lyQV+jNdfTQe+pXQjjMXLmtbXJr6/eJ9tRaqvdpZ8hD
 wMVQ==
X-Gm-Message-State: AOAM533hjrnctuxKr/9KCagjwLSypmstO0YthX45nNec9GazjQKFQS8c
 JrBYxs1itkoGcLHKvfCUKI5Cow==
X-Google-Smtp-Source: ABdhPJzxV7zCV9lAR3c0Jc9juDg8NFET/Z+3XOOmtNN2U0pMXdlVQZ61Yd8/oRnIU39J8a/TT842Sg==
X-Received: by 2002:a05:6a00:2145:b029:30b:127:e0a3 with SMTP id
 o5-20020a056a002145b029030b0127e0a3mr25141688pfk.34.1625122484840; 
 Wed, 30 Jun 2021 23:54:44 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a18a:185:21d0:d5d6])
 by smtp.gmail.com with ESMTPSA id l7sm24770126pgb.19.2021.06.30.23.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 23:54:44 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 zhiyong.tao@mediatek.com
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: mediatek: Fix fallback behavior for bias_set_combo
Date: Thu,  1 Jul 2021 14:54:39 +0800
Message-Id: <20210701065439.2527790-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_235446_687746_80ED464D 
X-CRM114-Status: GOOD (  11.58  )
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

Some pin doesn't support PUPD register, if it fails and fallbacks with
bias_set_combo case, it will call mtk_pinconf_bias_set_pupd_r1_r0() to
modify the PUPD pin again.

Since the general bias set are either PU/PD or PULLSEL/PULLEN, try
bias_set or bias_set_rev1 for this fallback case.

Fixes: 81bd1579b43e ("pinctrl: mediatek: Fix fallback call path")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 5b3b048725cc8..0cdff487836fa 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -926,9 +926,12 @@ int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
 			if (err)
 				return err;
 		} else if (hw->soc->bias_set_combo) {
-			err = hw->soc->bias_set_combo(hw, desc, pullup, arg);
-			if (err)
-				return err;
+			err = mtk_pinconf_bias_set_rev1(hw, desc, pullup);
+			if (err) {
+				err = mtk_pinconf_bias_set(hw, desc, pullup);
+				if (err)
+					return err;
+			}
 		} else {
 			return -ENOTSUPP;
 		}
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
