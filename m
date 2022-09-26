Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD503C32771
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4AFSEm4LB6qxx3Sb5LYIkYBm4L4/UlSqT6dVKfvuN4=; b=SQu/Rqckw4IaTzupWj8fgnmole
	R+e2Qelklte/ZMaUe+REP5w2XeGKGpzpsVnsnlNJuJzlo0RH9wJp/Le+AX259tH03gP7Z5oqDpl7h
	smrecbiuva1I+Jo4yZ4mnCGYhSClBMvw0zUcjsXkDRuiBxTKL0tbKYdms/1FhuSSOYt5h8JHLmJFn
	4F4xemf7HmJ/5PgkqUKzWH6Mg1UMXQst7UFjTqm6/3druOjcy4CdZImjhUvZDIxT72/1y5msl/bk9
	9nL141uZQNGai6mLb8NQD2gyuFRyElBsAPVeMW/uSjqroP0vgrmf5hBnj5RZsvO9cHoYw0uBAD01e
	KjD5tKnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclJZ-0046MM-Un; Mon, 26 Sep 2022 10:26:17 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oclIy-00468p-Dr
	for linux-mediatek@lists.infradead.org; Mon, 26 Sep 2022 10:25:42 +0000
Received: by mail-pg1-x52d.google.com with SMTP id u69so6166964pgd.2
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Sep 2022 03:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=O4AFSEm4LB6qxx3Sb5LYIkYBm4L4/UlSqT6dVKfvuN4=;
        b=dl+3CNlZui8oNWXXu4YFMr45DptQ+4JyM9MHVGTDmC1u5pYdc22pE31BLQiV32TSaq
         owmiP02AvC0D7MucfFZwmmEIETbCIYl05LVhYMKaK7JfCiKZEsHW6w6A2DFgJGzd3pZy
         yd2+zLzB0qZEQ35B1KaXHncQti9IoyhY4msyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=O4AFSEm4LB6qxx3Sb5LYIkYBm4L4/UlSqT6dVKfvuN4=;
        b=TAnmjmFADMbWl2Gn/cLrnXpVqdRJCvtKfsnFqfAyrmoA6nzlQM9U5wavZB5LVv0yoU
         ZCh6t7q9UKSdw85BxMtnsofVFGuCZn6lvxdmfe3JgHU/fCMhnZ7Det58E4X96jwZt/s0
         wf/SOtZsla6CHylAnxpo2iIHSKLx3r57fOlZj8YfOJHpit6L6v4ycfIixfNCmv1uiMvh
         SZWe5dFxLY2yATqpZxxly87Z0G5XF7ke5Pzv4JQ75AtSx5FKJ/W9oEgASsHTsF4L4mIg
         Ucc6QzWnCJJiJdCUAFc2H2J2/oXiLGIprppNP5JU+eN7IrbxhJL/FiHGNmfy1iYQbXGr
         b7jA==
X-Gm-Message-State: ACrzQf3UwnohCTGsNMDWGDwhJXUYYLh6IKAI+niT3ZCfYYh1+r8iK10b
	iXguY5iWa6e1pkOgA3WJCPpElEjNT5caCA==
X-Google-Smtp-Source: AMsMyM6X/OE4U7u8QXgyKJhL4/M4HGtxHlhFxAAR/N87RBO9psjoUIWS1mEQNDKvb+OHhc91E49WlQ==
X-Received: by 2002:a05:6a00:140a:b0:540:bdb4:aa54 with SMTP id l10-20020a056a00140a00b00540bdb4aa54mr22762892pfu.17.1664187938480;
        Mon, 26 Sep 2022 03:25:38 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:1340:7319:2f7a:3be9])
        by smtp.gmail.com with ESMTPSA id y23-20020aa79af7000000b00536aa488062sm11750236pfp.163.2022.09.26.03.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 03:25:36 -0700 (PDT)
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
Subject: [PATCH 1/6] clk: mediatek: fix unregister function in mtk_clk_register_dividers cleanup
Date: Mon, 26 Sep 2022 18:25:18 +0800
Message-Id: <20220926102523.2367530-2-wenst@chromium.org>
X-Mailer: git-send-email 2.37.3.998.g577e59143f-goog
In-Reply-To: <20220926102523.2367530-1-wenst@chromium.org>
References: <20220926102523.2367530-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_032540_506364_92FEEEB5 
X-CRM114-Status: GOOD (  12.34  )
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

When the cleanup paths for the various clk register APIs in the MediaTek
clk library were added, the one in the dividers type used the wrong type
of unregister function. This would result in incorrect dereferencing of
the clk pointer and freeing of invalid pointers.

Fix this by switching to the correct type of clk unregistration call.

Fixes: 3c3ba2ab0226 ("clk: mediatek: mtk: Implement error handling in register APIs")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/clk/mediatek/clk-mtk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 3a8875b6c37f..174d0645be38 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -393,7 +393,7 @@ int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
 		if (IS_ERR_OR_NULL(clk_data->hws[mcd->id]))
 			continue;
 
-		mtk_clk_unregister_composite(clk_data->hws[mcd->id]);
+		clk_hw_unregister_divider(clk_data->hws[mcd->id]);
 		clk_data->hws[mcd->id] = ERR_PTR(-ENOENT);
 	}
 
-- 
2.37.3.998.g577e59143f-goog


