Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34975C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HYpsnh1vDQDK5Me8T4xYA+IOULveGEdxtEJ7uE2WkCs=; b=TgXNiphOQtQ2v/
	ShvmROBmPNLJiw0wlV0pytew4Pi9BnKP1vwBH7DNUSVvA1iQ0p7HAQjABcdqPl24lRu78Og4Kq9tR
	jrcH43sPBo5MyS01P5tjJksbn1hpXUgcUddgut1Z883vW3c8WFADlukvNf+wby/42QE5w7WYVnVle
	uuZAYRd6WkvJ1ffCijLz/wNeutEpLSJjce/8W68IYMfLwLyTPC1lgTckcncjrWZO07Z7nEPLMqING
	u2qcKcDnIZyjEIroO3RdEf/0hH9BvcKtUSBtjtBLq25Mcz6kAUHmxUQ69YAB4G55hwtFvAqJMq/Pb
	SET1JI7jR0HEXnIj1pbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7FFy-00G0gO-AL; Tue, 11 Jan 2022 11:24:02 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7FEx-00G0Cj-Py
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 11:23:01 +0000
Received: by mail-pl1-x636.google.com with SMTP id z3so16664965plg.8
 for <linux-mediatek@lists.infradead.org>; Tue, 11 Jan 2022 03:22:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9+ilDo9mJ+cpPuGCqkGmDZyvh/0Rruh2V0ekaWY5ySY=;
 b=XkXs2sVlbZdBPoaVV9J3sUozK4gTSDSKFBpUFuCVPECXindDuuQ1V+69UJz2wI+lx9
 G6MHB4muSD4ctmT/HkVVxQo3zMvDGWsavRPYgTq7KpqN0X1y2YprO5D9lkL926BJZm/v
 bMjRRBKqfMAEvtXOqXCHy2Na2MY9YUo4VQ9qc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9+ilDo9mJ+cpPuGCqkGmDZyvh/0Rruh2V0ekaWY5ySY=;
 b=48y1ycTWRrRqc8AX1GSulzR2Rn4GQmsjM12ud2WZvXbL/0ktXaz5eyZ3IA5ValmuPR
 Rqs8Kl/Bc69CzqxjTrlqBoTfnieiV4SwDzK2FOFAqN0B3/gk7dABTVrVElny8kHqAnRV
 RN1qsRipJ6CRiY6JTKd3O+IuYyCWvZ6Vi2C6/gVCjVY3ti0FLfQ8U+fwrY7ERXYo59PC
 EoqQeq3EsyI+p1tnlGSp1ib5ER+uAu6BZjecW6qWIcPOx62m5lrBR+vk/tGf5vUav07f
 dx74RDrGXHhz38b8lur8djHARmn/hyFEBkSkRxqVWygKEtKmWBnH5bj0C4PVNQpqpyZ4
 5V7A==
X-Gm-Message-State: AOAM530J+We6DUlCwv33nWmo3VXwR6CrdrlTFSY2tlf4tR1YePS2gHim
 2Q8o6FXeRlzBQ2GyNcwQvXnWjQ==
X-Google-Smtp-Source: ABdhPJwJRu06xQL6ByRV/9lgZHfl9RI+kH9RbPfqsP9o1NoMgEXTitj6cL5swsO/MkT7xBO0RdfRUg==
X-Received: by 2002:a17:90a:9f95:: with SMTP id
 o21mr2601030pjp.44.1641900178730; 
 Tue, 11 Jan 2022 03:22:58 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:e7ee:1824:8575:bc5c])
 by smtp.gmail.com with ESMTPSA id f9sm2053845pjh.18.2022.01.11.03.22.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 03:22:58 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
Subject: [PATCH 4/7] pinctrl: mediatek: paris: Fix pingroup pin config state
 readback
Date: Tue, 11 Jan 2022 19:22:41 +0800
Message-Id: <20220111112244.1483783-5-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220111112244.1483783-1-wenst@chromium.org>
References: <20220111112244.1483783-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_032259_873850_A88FEEAA 
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

mtk_pconf_group_get(), used to read back pingroup pin config state,
simply returns a set of configs saved from a previous invocation of
mtk_pconf_group_set(). This is an unfiltered, unvalidated set passed
in from the pinconf core, which does not match the current hardware
state.

Since the driver library is designed to have a pin per group, pass
through mtk_pconf_group_get() to mtk_pinconf_get(), to read back
the current pin config state of the only pin in the group.

Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index d720624d8cd2..d259f075c62d 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -736,10 +736,10 @@ static int mtk_pconf_group_get(struct pinctrl_dev *pctldev, unsigned group,
 			       unsigned long *config)
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
+	struct mtk_pinctrl_group *grp = &hw->groups[group];
 
-	*config = hw->groups[group].config;
-
-	return 0;
+	 /* One pin per group only */
+	return mtk_pinconf_get(pctldev, grp->pin, config);
 }
 
 static int mtk_pconf_group_set(struct pinctrl_dev *pctldev, unsigned group,
-- 
2.34.1.575.g55b058a8bb-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
