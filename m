Return-Path: <SRS0=9yZI=PC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 967E3C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 12:05:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 688E6610CB
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Oct 2021 12:05:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 688E6610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASSDaYgQVn/Ax9BltNh7EFlbEX6nYKTNhasKyJe39ng=; b=U+5wgyasoEzYI2
	yKWkj8sKgcg+LkD7DQqIvYm+lCdyxZ2kFqa2l6tRtCkJPFdqYLssCAXkA8zx1GsZkNqQDEzBmlH5w
	IZGGniHEIIfedpMHGvd9wZfk19XCRNvQuN6d2APIvMfO/qx8o0KJfvsnUpINb9e4AzlWXz2yo+VH0
	kfvQFYnPArBPh+juS1yEg6SBus31GwqC5PH3SXKOfElLf5FN5NVVNdisHzgfCT2QvInr5vV1bwWCS
	eOtHsmzgvq2c4FqCnG6z3WfUwEbfPAsK4ljzb75hbLmOF3/3s5F6JbtnncV9RFIWCEBDT7X7QkXeV
	apIXPQlufATRtNHwuc5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mazTe-002zvn-Lx; Thu, 14 Oct 2021 12:04:50 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mazTK-002znN-WE
 for linux-mediatek@lists.infradead.org; Thu, 14 Oct 2021 12:04:32 +0000
Received: by mail-pg1-x52e.google.com with SMTP id d23so5318963pgh.8
 for <linux-mediatek@lists.infradead.org>; Thu, 14 Oct 2021 05:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZS8MhlD7ABmZlkxmQInm9HCla87BICXfSMIw1C1cU54=;
 b=UiaX0lPC+3OXbtfGld9LG1rzAYWJgODKizS41kyTYqH21c+wg6SrSiMTc4xrMfmYc+
 U9U/FMqL5iI5+rILj//TJliaWtB9bJWrem2Avxh2Jvbe1MzHdyiBfJWoYjN2Cxn9dBr7
 5DVSmJjCclkRo1Yrve7gf8CMh6YHZwcIjpEWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZS8MhlD7ABmZlkxmQInm9HCla87BICXfSMIw1C1cU54=;
 b=YOhaj0uqdawM0/CEx4hzfQjprv3kxd5+WgV6rTgL/0P1cLvW7IsAWkWE3/h2H0lfwK
 OumbBUFcsR/inCq3UJZQn3vi9QpFrr2IbxkhNUkyuA9NH/YERqpcBPRXqmxTuyAsESfz
 oPugt8GlV5VTfoFB59WcMfLq0oqQumqEoibz/bZw9fITqP/lRuC/YupM4gAMxV3RA4Rb
 PnCgjalE86sHXxsAuLZtf/RYvbwDSV0b6o3SwxO8TmbxQ8TnhKaYS+cXvlmH8EjVEL6s
 JrFaIRXqIb17LKi0KZYoRTjnU6T9F1lamHi4UkMdZwjphcrhDk/TCJlrvlI7zHCcx041
 TY6w==
X-Gm-Message-State: AOAM5318gqd3Dx7mVRiADE1r/XT48oPxIXlCruxr4bttWTO4FenPJk3T
 BdXGx4dsQmJtR9Bdc8BxHobVGw==
X-Google-Smtp-Source: ABdhPJzdRj4HVkNLgkG/WEqH2RrZtn2ign69xKx2wyK3OiBy2swev3QG5m5927mSi42rQmeqd8Jhug==
X-Received: by 2002:aa7:824b:0:b0:44c:22ad:2763 with SMTP id
 e11-20020aa7824b000000b0044c22ad2763mr4913447pfn.63.1634213068837; 
 Thu, 14 Oct 2021 05:04:28 -0700 (PDT)
Received: from fshao-glinux.tpe.corp.google.com
 ([2401:fa00:1:10:64c0:3f2d:5152:a6f1])
 by smtp.gmail.com with ESMTPSA id b11sm2300275pge.57.2021.10.14.05.04.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 05:04:28 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: Jassi Brar <jaswinder.singh@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Tzung-Bi Shih <tzungbi@google.com>, Fei Shao <fshao@chromium.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] mailbox: mtk-cmdq: Validate alias_id on probe
Date: Thu, 14 Oct 2021 20:03:51 +0800
Message-Id: <20211014120352.1506321-2-fshao@chromium.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
In-Reply-To: <20211014120352.1506321-1-fshao@chromium.org>
References: <20211014120352.1506321-1-fshao@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_050431_091435_238C187D 
X-CRM114-Status: GOOD (  12.67  )
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

of_alias_get_id() may return -ENODEV which leads to illegal access to
the cmdq->clocks array.
Adding a check over alias_id to prevent the unexpected behavior.

Fixes: 85dfdbfc13ea ("mailbox: cmdq: add multi-gce clocks support for
mt8195")
Signed-off-by: Fei Shao <fshao@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
---

Changes in v2:
- Add Reviewed-by tag

 drivers/mailbox/mtk-cmdq-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 64175a893312..f3e52dddd422 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -573,7 +573,7 @@ static int cmdq_probe(struct platform_device *pdev)
 			char clk_id[8];
 
 			alias_id = of_alias_get_id(node, clk_name);
-			if (alias_id < cmdq->gce_num) {
+			if (alias_id >= 0 && alias_id < cmdq->gce_num) {
 				snprintf(clk_id, sizeof(clk_id), "%s%d", clk_name, alias_id);
 				cmdq->clocks[alias_id].id = clk_id;
 				cmdq->clocks[alias_id].clk = of_clk_get(node, 0);
-- 
2.33.0.882.g93a45727a2-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
