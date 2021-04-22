Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32A30C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:14:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8794A61424
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8794A61424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t0+l6swSaeMFJ5SJJgpwwH1fQSSxHr/Wp5CLCEytB40=; b=F38/Y/7DZJx9q+Eq7XT2t9he1
	gE0p4CRTOfq2jC8JKumFvdv5yJp/zbSyOf0WgFtWLKxmAPKna0TDckysa+rpLjIMeAdhfZG2K0Bg9
	i+97r7lsdtJqBlqADyMiLS2Ug5hC6N5uHINOqCeyX9W+/R5+F0mvvXah/ckvVpRxb8HbU6yX2hWlL
	JAFWHWiloYjEhlZQMuRf+L6u49LhL9QkToa84rmJyfAWZZ5r4BQmeB2132hE1OE5veUBWsoSOPhHO
	UIFbJFGhZD0/E0m9H1Dl7ykSHx+bqh3fkNyn8PW8maqBkdIIvyjQ0NgQ7m0coPKGJEXSKpYnIqReW
	Vc26/Z0ug==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQji-00Fn7e-VA; Thu, 22 Apr 2021 04:14:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQf1-00FlT0-2Z; Thu, 22 Apr 2021 04:09:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=9BOejhcXoXhyXTSBmLuvv47XDq5x1HtwxwRsIb2foI0=; b=4N81HZOCiWYxD0cXG2EqozG2CQ
 jFd2kj29/zDzS0Zh8QcQw6w7JRpdwXKdeZrA9keJiOIajzzMf/dGegSsbAiaXgc276Z7Uf63HKDo2
 MbT900CU2tu8/21HKV572SxNGXWfceU2eoE+mxql88FhMpTj4n5TbBjsBhztnCYNVL7HkRzNO75qV
 nYIeVILCjQtq8VigBNXhMyg6OE5m+6ICXfPbeGIQ8mBeTap5IxkYP9NAfY4q3lrpgMxUlqVyi/mNx
 lEZVpiTwKyPzMg6TxXEOJjfQUDfNJQdjU9IVDGHzBO1oMQRZ+K4dtburM22093Hoy6Rr4vJVoRynf
 N/4kHdMw==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQey-00DLg0-L2; Thu, 22 Apr 2021 04:09:49 +0000
Received: by mail-pl1-x633.google.com with SMTP id p16so18887532plf.12;
 Wed, 21 Apr 2021 21:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9BOejhcXoXhyXTSBmLuvv47XDq5x1HtwxwRsIb2foI0=;
 b=kXLXNAS45PBewZl46uLw8yvajpf7UbKUWcXnUL7NxHB1rIq7y4NE3XI+kwO9y5mIlr
 RFcLwrUkVE1FEoXGQ9mEy9cMIlCyCFFXVssKp7SbCTUr+Zwn7ROumRk88XmThh3lNj8E
 zmiYac46vrstHv+nl9kQ0eUJjTYTvTkE28VYEbN/Hx295dvNUAcJgZOINDnWx1CxcvvJ
 SWp845sDxxvOJIJQmKZcd0XUBr/HqiijzZLkKAU3gCuJbguTny1vspGg+up5NkSh2TPy
 IyJIfofltt2JleFHax76OlALlkddx/4UeMcD46q3mtt6v/MHccEkq9y7Uiz3ZjHOoToD
 qVVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9BOejhcXoXhyXTSBmLuvv47XDq5x1HtwxwRsIb2foI0=;
 b=oaO6KXwck7KHGKlec3QoD/cYeT2AK4tiqsr+bgX5WKpvfkcZ7csZVuHqXRovXXu7xE
 tQmiqOyEdWt4gI1QNBDqVXNdS1Ny2f8ULLAdfu7+tWKipNfsTg7R/XGufZHqRxgyuEzc
 RgLJJv54VfAT7aHB4QJeEZ1Xv7CKISYg/IrdOputCI5Jno5CVyZcGUEUNAO7MChph2V0
 BfU21wi00T0VRfu3QcHzsa5YlGnwBauoZmg0KHRVOwot798Z+bq1qiIucQWisW6ZpmLy
 QtDnvZY855cO8t/Go2D0PlWKt54Z3mLRngCBYjZayiD0y9YeZ0sGRx8OwPXe4bCgcI7Z
 ui2w==
X-Gm-Message-State: AOAM531d0uOiwhr33b52Nb5VDu92gaNTZkLJSwkU2qJ3PrbrES1Or2wP
 Zl3aT8e3hh9Ex8DlbKe2uko=
X-Google-Smtp-Source: ABdhPJz2F7ul6sPxW+us4a3mzFh33oXjK5llgy7v+IeTQIwQiGEmxWbOHVBvse0swyjBzk0X5z+UGA==
X-Received: by 2002:a17:902:cec3:b029:eb:5441:9897 with SMTP id
 d3-20020a170902cec3b02900eb54419897mr1387610plg.48.1619064587945; 
 Wed, 21 Apr 2021 21:09:47 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id i17sm635354pfd.84.2021.04.21.21.09.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 21:09:47 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 12/14] net: ethernet: mtk_eth_soc: reduce unnecessary
 interrupts
Date: Wed, 21 Apr 2021 21:09:12 -0700
Message-Id: <20210422040914.47788-13-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_210948_708950_87B6DDF8 
X-CRM114-Status: GOOD (  10.72  )
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

From: Felix Fietkau <nbd@nbd.name>

Avoid rearming interrupt if napi_complete returns false

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 5a531bb83348..88a437f478fd 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1517,8 +1517,8 @@ static int mtk_napi_tx(struct napi_struct *napi, int budget)
 	if (status & MTK_TX_DONE_INT)
 		return budget;
 
-	napi_complete(napi);
-	mtk_tx_irq_enable(eth, MTK_TX_DONE_INT);
+	if (napi_complete(napi))
+		mtk_tx_irq_enable(eth, MTK_TX_DONE_INT);
 
 	return tx_done;
 }
@@ -1551,8 +1551,9 @@ static int mtk_napi_rx(struct napi_struct *napi, int budget)
 		remain_budget -= rx_done;
 		goto poll_again;
 	}
-	napi_complete(napi);
-	mtk_rx_irq_enable(eth, MTK_RX_DONE_INT);
+
+	if (napi_complete(napi))
+		mtk_rx_irq_enable(eth, MTK_RX_DONE_INT);
 
 	return rx_done + budget - remain_budget;
 }
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
