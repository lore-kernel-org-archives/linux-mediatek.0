Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AD4C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 11:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FMr/SeZTbMYALgirWmrWdgG4b18PGZymXOVepdWSGjk=; b=t+PRCLw00A+6nM
	5nUhN6Av94w6dBnlbI9ODlbN6zpAYTnQ5ZHbSaRJDIwLdRrnwCg06/+G0LAojbWzwYwdLZooRElgi
	YMsU/PwQPek88BV731kDWGR3Ccne70LVGc3pV3F7YbFmMjTTrYjqQI843abXo1xMEpGV2Ypo/Leiz
	QXyANNFnKBB0pv7RsX8+p2fr+CcylrVhE4NGqprxW5zbk3xUiPslKryRb6akyEhK+49Teh0PfgMxZ
	FxPzmlGkA8fMd0IBo3V4MmRJmijxZY81IzWGk0dKq4Cs5bE/dzrvzr3LVIh2HH+y8CSxtXJyqGnph
	3T4TxEqGcr8x0vsyQX3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7FFZ-00G0Qs-KD; Tue, 11 Jan 2022 11:23:37 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7FEu-00G0AN-NI
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 11:22:58 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 d10-20020a17090a498a00b001b33bc40d01so1725929pjh.1
 for <linux-mediatek@lists.infradead.org>; Tue, 11 Jan 2022 03:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=46vNWfCGa2Jehdt6uZRwpjv1YuVkkZW0i1eDoXg3Zec=;
 b=esN1ZqLdbAEajmfzapP7lVnID9P/08CQO2LHxbTx/fXJK2zW7AWZ0c4ExQDVXI+MpD
 IQdW1TQW6LYYuf6XIiavBx+9srFkNSiWGEx1h5dU088pogGNcDq4dmpG1wlE+EsVrfZu
 xAcGnSViss/JWwSg4ZNjfYNd0Rntk2rgGZBSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=46vNWfCGa2Jehdt6uZRwpjv1YuVkkZW0i1eDoXg3Zec=;
 b=XKs/Y80pdXycSVh4v75v056d3wq1RIdt+2fB//caMMNDhoJAuvGblF4TtVqVugWnAP
 7VgPwa4MYlANx9i87KF3J96HP5DkDEa8bSjx9GSIzLzQbw29KERYvlkurTMyWT5D220R
 TK6O79l49ilkVVgPCnKy8NzzcJeIslsctMsN3Gwnn0c1uD0rhc47CCqIkg3gtBbHoR3u
 K3k2aL3ToUjHhjsFSJXWnnuIKneI6kHK7h01AB8mMMmAmr5pWERs6px/QcGlPgfOsx+7
 GELN0WaXsvmpExLeY+wYozewK1Sh8QkW8vmlaW78ElVbIvhPvLYY6JI+EiFaa7SCIUAH
 wBvQ==
X-Gm-Message-State: AOAM533fL+nAwXZJEn01E3RV86b3FF0LE9YXjAJVWA6uCfhqaOL1Te5J
 ZerdLDUOjaQWnzYtmfAftEvB4w==
X-Google-Smtp-Source: ABdhPJwGHRyF5VOXfXoWha8dpfJ67L3LRTTCjIs8gZdPc2xLLP6Qjr3mcaU9/n+Caiu6e8jM6+wH2Q==
X-Received: by 2002:a63:2cd5:: with SMTP id s204mr3583363pgs.121.1641900173986; 
 Tue, 11 Jan 2022 03:22:53 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:e7ee:1824:8575:bc5c])
 by smtp.gmail.com with ESMTPSA id f9sm2053845pjh.18.2022.01.11.03.22.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 03:22:53 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
Subject: [PATCH 2/7] pinctrl: mediatek: paris: Fix PIN_CONFIG_BIAS_DISABLE
 readback
Date: Tue, 11 Jan 2022 19:22:39 +0800
Message-Id: <20220111112244.1483783-3-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220111112244.1483783-1-wenst@chromium.org>
References: <20220111112244.1483783-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_032256_804654_17D9523D 
X-CRM114-Status: GOOD (  13.38  )
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

When reading back pin bias settings, if the pin is not in a
bias-disabled state, the function should return -EINVAL.

Fix this in the mediatek-paris pinctrl library so that the read back
state is not littered with bogus a "input bias disabled" combined with
"pull up" or "pull down" states.

Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index f9f9110f2107..1ca598ea7ba7 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -97,8 +97,8 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 			if (err)
 				goto out;
 			if (param == PIN_CONFIG_BIAS_DISABLE) {
-				if (ret == MTK_PUPD_SET_R1R0_00)
-					ret = MTK_DISABLE;
+				if (ret != MTK_PUPD_SET_R1R0_00)
+					err = -EINVAL;
 			} else if (param == PIN_CONFIG_BIAS_PULL_UP) {
 				/* When desire to get pull-up value, return
 				 *  error if current setting is pull-down
-- 
2.34.1.575.g55b058a8bb-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
