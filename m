Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FD7C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 10:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yonr7qQtvjQYtePMQ/WJaRA2+Em0Umj7wMQtM7byCLY=; b=NqMLO7rwUMF522
	1RuQ/hbDAA/uGvE1yDZe32AgiGUUDtWlY0eAagVKpWzywkU/BxVF6hqFjGar62CZVzsGa15ltW5/t
	cz5ajP52bLoxUODfDaBymNL5vw+KKnqDhpwn8V/6IgDtmOocWEUQ1DNw7KGi/iUix47LhtjkwAKe5
	HBi7lkRRJotBNIXkggyIPglZ5wm99v5CbV1OrrbRXfGkFbE8r9AitN8kVZUoXGU9uhQQDp2UkT6rL
	GSjmvlkEuvBmsvwc4NSH7+okrKyVoHO5L0BgPmRYunnJRkmcl4JRPa1YiseZNQqGXlxy3pTBYqIwu
	Ur6xpmxfUM0U/s2UK6Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRWgP-003hFg-TY; Tue, 08 Mar 2022 10:03:09 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRWTC-003cHR-Ij
 for linux-mediatek@lists.infradead.org; Tue, 08 Mar 2022 09:49:33 +0000
Received: by mail-wm1-x336.google.com with SMTP id
 7-20020a05600c228700b00385fd860f49so1119185wmf.0
 for <linux-mediatek@lists.infradead.org>; Tue, 08 Mar 2022 01:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4AMWeZkxp95RTDe+wPDPpAGms0iHGajzkgE4/KUX8bI=;
 b=H8aMYJdR1rsOnt5DsE/e5rdF/g5CVV/ImrAKuw+9/cPZfWZFiO38RKfkOvUCOzHRn8
 XqHP7+POHekXwKNA2LJVFDHwX+y+rUUhqpN+UDJJiOP9kpvWRKUzcDrjA7dZDZ6ZFcuG
 lR77zCxBUR8/BaJhSXHGHagB54eapbQhSvnO7oaIsLzsZIo+g5XDnNZ/tR3IA39RQ3Ue
 1mX0ri0O8X/Doruf5c5kTxOKzZiu3HcYBDifhFyTMf4rpLsMed0VvxDc2+rIjKVUehDs
 /FB/JGFsa5DbFlN2zWnoxDd/1EIYwRbp1nGtO5+Xrc0XJn6TmBBRWsZIqqDuKUB9YT8l
 SkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4AMWeZkxp95RTDe+wPDPpAGms0iHGajzkgE4/KUX8bI=;
 b=5ENcTF+YmI4mv3Bb/HjgIN5Wu2qQVuoBR4t2O1xZUznkWtIJkfKnJVUNgo62T4kfkn
 kgz9aTfCF9mmeHLjNelCYzAN0zzCk0OTrrfi1GE3pKBEidFnsax0aO1sJkOX8Quf5E9/
 ygRUW13xX9UCer5whtvjSTF/MbPW5OjAYUA2I737WxUInLuqr3xq3MfNXs4aelL9ZPBi
 233Dy9SCgOQqiFRvSz6SyEIb/qMvGgTOC8LpL1sVTKkNGhIB8xhIkEVjFjVaG/U1TY9t
 e8Gnl7moqkfsoHeeq9E47haHkPNTCsYvlDrxCSSDPvrAFC0oVTDGTisSjdjnBgU9Zbn6
 pEOQ==
X-Gm-Message-State: AOAM530OtjPCVuM+iX7toakNi5ATnzgBK5k+/aBbe4WsZZZXXcOr2udC
 Pg/yyYzcterU76qEwwazCXg/BQ==
X-Google-Smtp-Source: ABdhPJygU94zXAM1Uu54IBoLXA1LSudb52qrcnlJ03Lk9v6Rot2IWk4fYtPCBHBO4UAJEig/w3RXCg==
X-Received: by 2002:a1c:f616:0:b0:37d:1e1c:f90a with SMTP id
 w22-20020a1cf616000000b0037d1e1cf90amr2688313wmc.148.1646732967642; 
 Tue, 08 Mar 2022 01:49:27 -0800 (PST)
Received: from xps-9300.baylibre
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id
 b1-20020a5d40c1000000b001f1dd6ea504sm8014205wrq.59.2022.03.08.01.49.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Mar 2022 01:49:27 -0800 (PST)
From: Alexandre Bailon <abailon@baylibre.com>
To: chaotian.jing@mediatek.com, ulf.hansson@linaro.org, matthias.bgg@gmail.com
Cc: linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH] mmc: mtk-msdc: change a log level
Date: Tue,  8 Mar 2022 10:49:24 +0100
Message-Id: <20220308094924.2868042-1-abailon@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_014930_651186_77F21117 
X-CRM114-Status: GOOD (  10.02  )
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

We write data to RPMB, we get many time the following log:
mtk-msdc 11230000.mmc: phase: [map:ffffffff] [maxlen:32] [final:10]

dev_info is used to print that log but it seems that log is only
useful for debbuging. Use dev_dbg instead of dev_info.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 drivers/mmc/host/mtk-sd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index d5a9c269d492..05c8b4de46f3 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1914,8 +1914,8 @@ static struct msdc_delay_phase get_best_delay(struct msdc_host *host, u32 delay)
 		final_phase = (start_final + len_final / 3) % PAD_DELAY_MAX;
 	else
 		final_phase = (start_final + len_final / 2) % PAD_DELAY_MAX;
-	dev_info(host->dev, "phase: [map:%x] [maxlen:%d] [final:%d]\n",
-		 delay, len_final, final_phase);
+	dev_dbg(host->dev, "phase: [map:%x] [maxlen:%d] [final:%d]\n",
+		delay, len_final, final_phase);
 
 	delay_phase.maxlen = len_final;
 	delay_phase.start = start_final;
-- 
2.34.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
