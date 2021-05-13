Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202B2C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 19:32:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B385961185
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 19:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B385961185
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xi2weRtZKKnpYuUj7IePb43PVQqg+k25zHuDWP3LazE=; b=LZAXAMJKGJCixOu6PW+QW2JkL
	okxxqMNUb4mLUh2vs9IH+FG6DE0nX7EXs5dgZ2VNm9n2lfioZxBHCkO1uZHNU7W63xN8A362Rcs7r
	oBcKhyzg17TTj41kX6T3tbXatpwyC+3HBXFh/DdN5Y8/lDxIezqBesEH5lc6SNpEbSaRlpHzFXBim
	9SiiJnnFLQhkM/1LnDU7B+t9v9rcEgIFMH9rw0MZKR9uFy9segGW7ua2iBG5JX221KIERX/YHxjSR
	oKo4M1821s5V+N7yyS5Wj6cKlO481H5cp+ZZFvm9bP7MJSfDRyJuir1gt9CK9OschmyBn5zDZW/rx
	/2lttk6ng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhH3f-006H1D-Es; Thu, 13 May 2021 19:31:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhGzH-006GVh-4C
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 19:27:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Hz2oyLCaodXd740ljA7xd9Idy1mmKCo0jqV0VyN8IUY=; b=dohBC+DlhmegBqYOuRHjw3ztXp
 K62yiqq3NPd14EsAcP9CQXQU8LGETJ4aP+y2t81MDLehvmfPgp2YaxY2hUPd3uyb4JpbDUJww8D2n
 B3s5/QyoPiiE/9211hTF72zPSPRx6EXr75+/ZDGntFjuis0JKbGNgtTaIqqnY90X3OLQ/fw8EoIhi
 N8B1cUGMWTvsyyLu8ocbsJCMnrBzbJ5GQDWhsTlFryDC4B781j3pXIlDPoBkNxfspVOApRXMBZCV0
 yT5n3fd04XyjK+WQlIm4C0f8QvSJx5XxXTbrGND6fy1ZgTRAvfTtWUK3I18IRmDmhd45vTL17T4/m
 6ShBZ0Aw==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhGzE-00BTYs-7y
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 19:27:09 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 n17-20020a7bc5d10000b0290169edfadac9so347222wmk.1
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 12:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Hz2oyLCaodXd740ljA7xd9Idy1mmKCo0jqV0VyN8IUY=;
 b=sZXPaAsyf4ffDKyjs8O74Zge/X6jI76n+7YbKvJU+8109bI8MJgtyqcVubGJ1uWW3E
 yDI9/5+ruZ4+gDkA88wjjw7c7yGdcOc5GeYdkAgSZE/HDGkj6E54ITAKOUGug7YWoeGE
 2hPNROBUj4fBoXzzlqCyO0VisN7iG4jbaHqw0FyrMUMX2IRNx9ztDhzXBMP+JLfD8ZlD
 +J/1MFdbJ1AZEiyMFKQhzoXwkDk/uzYp0cQv1BIz/zE3RbspfofQ8QqrzLHd5CH5i6Jb
 5X1We59Js9IgROMufEwo3ZfD24fE47qy+g0tKH0ENk02rjwb0aKMBHniaUD5g41LYQC1
 zIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Hz2oyLCaodXd740ljA7xd9Idy1mmKCo0jqV0VyN8IUY=;
 b=Igy6FqjGZAYGg3xglC44eClXC8Jd4s/rTvzrktk9DW+JVgxx+1tejFo8xdE7R/xqWP
 5oHGZrJxvw9HzhsMEz200JgqHanUSP58/dQW6lNDIlOb8y494LqCQ5vd774fYYRtpdh/
 olrrhVjcF6TpH9aCLsggIwK9prJ8rQNYEwKVKOFIheUvp4chdsRgNvSNGbAn+KPrXzSr
 CPKcidKAjKwhmQCyn1G4tsGQZafNYNXXcfFyuGmvmEDUViTisPXq6sIUgTi9owZqzaYm
 +Nn3ExqeaRvOAj2+Ln7js5ghCa1TThfB88Las4a6/suODQRgtqi1ZOtg0bofS1Wh9Ec3
 xczg==
X-Gm-Message-State: AOAM532vU9Z6ret9aEqtdHCxvFF34ohXOw507Aj4LPr0J0t0GKgvMw6V
 uhl8fGfrVwGbl4jB0VQ2+TNT3JOJz30O4w==
X-Google-Smtp-Source: ABdhPJyzpUQgQL+VR9Dht+XY5fDnyA8jmiEPMMbUTAkreqWtyug65TxodZHPUV0tmb60GFcF2HSkQg==
X-Received: by 2002:a1c:b342:: with SMTP id c63mr46096700wmf.162.1620934026480; 
 Thu, 13 May 2021 12:27:06 -0700 (PDT)
Received: from localhost.localdomain
 (2a02-8440-6341-d842-3074-96af-9642-0002.rev.sfr.net.
 [2a02:8440:6341:d842:3074:96af:9642:2])
 by smtp.gmail.com with ESMTPSA id h9sm3053621wmb.35.2021.05.13.12.27.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 12:27:06 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
To: 
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] dmaengine: mediatek: use GFP_NOWAIT instead of
 GFP_ATOMIC in prep_dma
Date: Thu, 13 May 2021 21:26:42 +0200
Message-Id: <20210513192642.29446-4-granquet@baylibre.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513192642.29446-1-granquet@baylibre.com>
References: <20210513192642.29446-1-granquet@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_122708_289490_0341447A 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

As recommended by the doc in:
Documentation/drivers-api/dmaengine/provider.rst

Use GFP_NOWAIT to not deplete the emergency pool.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index a09ab2dd3b46..375e7e647df6 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -349,7 +349,7 @@ static struct dma_async_tx_descriptor *mtk_uart_apdma_prep_slave_sg
 		return NULL;
 
 	/* Now allocate and setup the descriptor */
-	d = kzalloc(sizeof(*d), GFP_ATOMIC);
+	d = kzalloc(sizeof(*d), GFP_NOWAIT);
 	if (!d)
 		return NULL;
 
-- 
2.26.3


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
