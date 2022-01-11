Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB99C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 11:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LE4fJHxQ53m5oQ5LZXKEdnvpRB9SvCWNeWEkmGc0ml0=; b=Pq1qcef6gKh5VQ
	oM8vCMPlYXWjknu99uKiHB+u4vOwrmMAZSQ04r4g4miz36bGCc6lUmuNG/9xpUrEv9PjNm7i1zN2q
	8w1yJvToukIkrVJUeIdLH0Eg7lHxdNznOWYBLUMkX4mxSXaJzuCKwZcfpFtmFx+K7ee4ltBRGA+Cs
	vJktXQAHMH6KJ/U7/ah9hEa6G4o1t2Hkz76m56AR1FXu8lpAFqx3nKshi3M7ZTrMEk0KrLcaNwVpO
	dUXvTPe4+eZjL+oNjfGNgPMtoECEG3o/kuGIerDxRXjdNn1JtX5KOCIqfpTnOBzkprWJ9yUSkeLGf
	yo/HSj2yT9DjLsGd2Jqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7FFc-00G0SJ-B1; Tue, 11 Jan 2022 11:23:40 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7FEu-00G0BR-O3
 for linux-mediatek@lists.infradead.org; Tue, 11 Jan 2022 11:22:59 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 l16-20020a17090a409000b001b2e9628c9cso5235201pjg.4
 for <linux-mediatek@lists.infradead.org>; Tue, 11 Jan 2022 03:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YKaz4u+jHXBZ/hE7lcVwwzVS+M4mWSZteuvchYRq/nI=;
 b=gGo3fMPxrCjwBdkX5n77T17fwS1TD0PV3va335HdH7rjAjuCJ0jAPYlRuotwXbwx62
 FR1Vw93XtwPIQGZzMkdQW3ZdXNdqz7TvjYROqPnDGb36AvEUnrzIgJVC7utxf6LpIJca
 Kthdo7em4vemrrx6zllmjUlfChywO4GB3GN2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YKaz4u+jHXBZ/hE7lcVwwzVS+M4mWSZteuvchYRq/nI=;
 b=RZCXhKT73HJRorKgcC0JwXqqcJgMjQBwNRp0ThStg7l2vgEm1qGMVOb1cBPXt0ILQ5
 48MkI29TDCRof9LInenj2s3DZ1VETrpPYYTnMbT/UHkcC57KNd7y+/gCwPvwQSiBKSF3
 VpKcGOIHLbmvImvxPlg2hX6NrbN2U/+iZMqB7ilO4w4LQyRqFUHJZ81FFhrgD5jpoczi
 0wx6E2/MDkx/vsPIw+bWJoXycVrjWHpNt6dtWvoCAytRWsMcHugUF6wRaHnEakgLK8Qj
 IxPH8gLhsGD2gJEcJmr28BEkmNDy87dAqpBU+hjOg+Wg3W6WoihkWG4ykJZtQaM9TkGW
 X5rA==
X-Gm-Message-State: AOAM532bZJ5UYW3sRdQjo+bHb2CAF4GU+1KA0k5yItjDmz97z3H7BFYD
 45SGNuzRzdudmlrMiFy3IDTN6Q==
X-Google-Smtp-Source: ABdhPJz5glPbeZkuNFNbmk+GbZakSX+Fxp59hDSbXI0GT47ku5rb9OI1mykAOShWopjv/FxhhGTH+g==
X-Received: by 2002:a63:725a:: with SMTP id c26mr3569100pgn.611.1641900176245; 
 Tue, 11 Jan 2022 03:22:56 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com
 ([2401:fa00:1:10:e7ee:1824:8575:bc5c])
 by smtp.gmail.com with ESMTPSA id f9sm2053845pjh.18.2022.01.11.03.22.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jan 2022 03:22:55 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>,
 Guodong Liu <guodong.liu@mediatek.com>
Subject: [PATCH 3/7] pinctrl: mediatek: paris: Fix "argument" argument type
 for mtk_pinconf_get()
Date: Tue, 11 Jan 2022 19:22:40 +0800
Message-Id: <20220111112244.1483783-4-wenst@chromium.org>
X-Mailer: git-send-email 2.34.1.575.g55b058a8bb-goog
In-Reply-To: <20220111112244.1483783-1-wenst@chromium.org>
References: <20220111112244.1483783-1-wenst@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_032256_797489_78B46FF3 
X-CRM114-Status: GOOD (  11.41  )
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

For mtk_pinconf_get(), the "argument" argument is typically returned by
pinconf_to_config_argument(), which holds the value for a given pinconf
parameter. It certainly should not have the type of "enum pin_config_param",
which describes the type of the pinconf parameter itself.

Change the type to u32, which matches the return type of
pinconf_to_config_argument().

Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implements the vendor dt-bindings")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 1ca598ea7ba7..d720624d8cd2 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -188,8 +188,7 @@ static int mtk_pinconf_get(struct pinctrl_dev *pctldev,
 }
 
 static int mtk_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
-			   enum pin_config_param param,
-			   enum pin_config_param arg)
+			   enum pin_config_param param, u32 arg)
 {
 	struct mtk_pinctrl *hw = pinctrl_dev_get_drvdata(pctldev);
 	const struct mtk_pin_desc *desc;
-- 
2.34.1.575.g55b058a8bb-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
