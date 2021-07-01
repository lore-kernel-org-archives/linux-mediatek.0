Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF094C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 08:10:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95DEC61601
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 08:10:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95DEC61601
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cgcljhS2XyfTBYthhVaGkDOemcR4UH1Af8ERWKV9WEE=; b=k+RhhCuwS4ZNmF
	oTYtlUmavnkZsgKf+A5snbOn0V5mTqEY+5qxEEyUi/edK9atC+7cp3L8eq4D+d9RbtlYxt9k2vFtD
	rzvK+zGsRMwzKh3pTFAChEfi8BBXkxvaM3lkGMtbd3LGbZBb6k2R2hRxVX8qJCN1kmxw1GiS+bDgs
	CQP9ArxHfGcesa+td9BRElHo20fJI+NRmoZJxZih1DmMH3alJPvpkjGWu1qAv5Nd44FkxXr9PwkoH
	YFXIJWcWmB8cU4GD30hNJjD9jIW3zB18oL0vdxyc8xD6VuSgIyNBGxN2YhOwdifZJIywQ7W5bCG5F
	JiDZyB1rzRTt7aZm70Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyrm4-00GToc-1t; Thu, 01 Jul 2021 08:10:16 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyrlr-00GTlq-RY
 for linux-mediatek@lists.infradead.org; Thu, 01 Jul 2021 08:10:05 +0000
Received: by mail-pl1-x62e.google.com with SMTP id z4so3210376plg.8
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Jul 2021 01:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=05/l1i0MzcF43S74GFX7zHVjcwxLfLdqVO0nUEpbDV0=;
 b=S3MMnrqXhNiKGF5J0TPCRduqD0uIK0JAXHkIojST/KHNV2Hl4cWZkVYFqQ++/p2DTp
 R+oe9Lpwcdeg1hwXaxadt+3kbOnJQqdp8+Nx1mAyLdK8qlWpa3ybpx3nugkStTe6zAR7
 wvbQmXdnS7/BdsqFi5Q1v36Xf77l+GnZQ2WIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=05/l1i0MzcF43S74GFX7zHVjcwxLfLdqVO0nUEpbDV0=;
 b=GQQOEHbq4ScFhTIw1uiv9AyfNV8/0uav4B3DYndBoaWvEVCGyaTM+3YD1AKEz7Z0n/
 hu4vckqOVMFSrlmSEpdraBDD/vAri9ORyRlULNvZ63NHLtFiqcoSisyBdnCtoMNuQ3An
 2qiQKwJ4btmxcAEUR6A66IXIXaEC7xHd4R5SHNmbvV+V/QJO/nZnuX8ovErNLf0/2NFL
 rqZY5zMj+Mz7wkvaVnKLwhg53Q7KEGHyp2uKBWMJB+S5z9QHJnaTDgHm2MehwdIeUEQk
 vQ/tk91j5rQJ4J4PhojHX6Hd6yajicOJicR6sqJx9SUZsciEQQcaWHJMr0xm4miyeE2z
 AToA==
X-Gm-Message-State: AOAM533+0t8LZVb9OMXhpq0MuoR+QF1u+Si13a3jLmtDSQWjNUGtGTbF
 MYSYgDZpqscC82vmT6261bLDPQ==
X-Google-Smtp-Source: ABdhPJyG0Ea3T12jyxm6vZmzBQnlz+cN3qJCWhrgNZuvdGCJTnAoQTyEUsEeYDaU6hrJms60UflVNw==
X-Received: by 2002:a17:90a:17e7:: with SMTP id
 q94mr42915950pja.117.1625127001737; 
 Thu, 01 Jul 2021 01:10:01 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a18a:185:21d0:d5d6])
 by smtp.gmail.com with ESMTPSA id h8sm6846396pjs.45.2021.07.01.01.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 01:10:01 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 zhiyong.tao@mediatek.com
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] pinctrl: mediatek: Fix fallback behavior for bias_set_combo
Date: Thu,  1 Jul 2021 16:09:55 +0800
Message-Id: <20210701080955.2660294-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_011003_953000_186F16B8 
X-CRM114-Status: GOOD (  11.98  )
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
bias_set or bias_set_rev1 for the other fallback case. If the pin
doesn't support neither PU/PD nor PULLSEL/PULLEN, it will return
-ENOTSUPP.

Fixes: 81bd1579b43e ("pinctrl: mediatek: Fix fallback call path")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v2: fix v1 comments
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 7815426e7aeaa..10002b8497fea 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -926,12 +926,10 @@ int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
 			err = hw->soc->bias_set(hw, desc, pullup);
 			if (err)
 				return err;
-		} else if (hw->soc->bias_set_combo) {
-			err = hw->soc->bias_set_combo(hw, desc, pullup, arg);
-			if (err)
-				return err;
 		} else {
-			return -ENOTSUPP;
+			err = mtk_pinconf_bias_set_rev1(hw, desc, pullup);
+			if (err)
+				err = mtk_pinconf_bias_set(hw, desc, pullup);
 		}
 	}
 
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
