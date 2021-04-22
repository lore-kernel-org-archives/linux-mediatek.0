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
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6BCC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:13:48 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BBBB6142B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:13:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BBBB6142B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0irFNsrzslLwk0yj/7O5mXeyi40ERaWfpD0sN2X7M1w=; b=HInETXYeej3N7JwWl1ZAT1qsI
	5QT2BQ3PXoYiA+SrAsQciZmR6lrVCCOgbf5r7LOjIMuarUdy9I5xMNeZDdYOyov93i4ogaDNWoX+M
	0u7MbizPPZmrMhofonbYhn2X8PBN0t7DlubHn08RCpP5+q8H3waQAogy+by9OOH0ZjhwqKU5LbGRT
	kvhlw3zaUuRTJVrahFCQMx7hi14WmAkLrhmZJaNTPhV14CjwOmJ15RlhrEzdga/aE7S6LLHOqmmJs
	H+pa7nmujmsp4zTT1/24NInZQaoKd4HqejzhmztHEgVh2xRTLBJS1JmZgOUk1THK0/LApcS3iv7vq
	GdpQJQV7Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQid-00Fmja-7O; Thu, 22 Apr 2021 04:13:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQf0-00FlSa-5x; Thu, 22 Apr 2021 04:09:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=4KIdtN06FgF/t+etJxyiKFbFDdfz1IAmwoqjnTRUY1Q=; b=WCVgObQS9zC2cY85b6Dlp0gdOd
 9c3Lvn9chbk6QBqqPI8vDHND7ctlZM/VZ3Q+EmZ5fqS3qRo8QoyWfhO8w++A1SnovsP767qTXoQkG
 WtQCoL4KWKNhy/5l30UfvU5LyvAUorvfyeNp86P3ereZuAaeWIthbROnntPbKErOht0qV6pCFPBBF
 u0soRcjKotslhU186fXdyWrIEdjovRXaTSRGwotOamcIrW/VvkAjHqAsDMVUC4VE798bdAZEuoH0t
 ut1OtzC2JygFN6LDyO6ZDZKs+LAqNpqYvcjcg19aonZtNX0U0coTidtMx05kqM8RjEqiZ1b1HmD5/
 WbrxNp0A==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQex-00DLfh-OV; Thu, 22 Apr 2021 04:09:49 +0000
Received: by mail-pg1-x534.google.com with SMTP id d10so31903612pgf.12;
 Wed, 21 Apr 2021 21:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4KIdtN06FgF/t+etJxyiKFbFDdfz1IAmwoqjnTRUY1Q=;
 b=ekE6yKJ21GS2BTKeAlc+gBcCC1y9VzR7QBm1Rwve24KFcJ+0jNVnyEwmOwJl0lc/ho
 HyceoJIh+MUMTQjmMu4LScm0ubkQ0jjL01eKuoW4G65UuUYJ1l8W/0POGR2Deva/KspM
 G3jSY2RBu6FnW+ZPTIBOWgWnL7o7oHdYT5xTeTDJfQXG0rvU9U+Idr4pObH7IGrVtfe8
 7Dv9p0Z0i2BNeI382eLt+dvGT49vhsadMXHj7k4uzcHgaLigpt65RnT7/x/sucLZaoRD
 hlWse+uINeiHf2fiDhFmH0kqG+jmLHxbt57wz1a+kX923t/lX3ZHkr106Egkia+d9Wrj
 Du0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4KIdtN06FgF/t+etJxyiKFbFDdfz1IAmwoqjnTRUY1Q=;
 b=ltHMlbVLC8bXPZqHxMjPTOj9Aihf2ZNC+2S1aLgIA9MBQ7mxj+iGj8ISfaAYcC113K
 gKUuvSzsu0ujOtsw3JKtFWD2BB3fc2cJHSDDMko4rFjEFihaafzE9hYIICZVQUbDszqd
 u8QFqQvHTs7YV5eLn2eN/SqM01rIvWmAw7nSG+YuW7Tk9cb/8Ty1jW8TyGsHjts44M+v
 HjItXH3k74Lb+NbaYIn+BRhvzPCOA6VpYdNcEPYxYQjLsa6cb/btj9t2tY54+Ys5rSwT
 DEp6tuuJa4DbebWRXQWwO6JLmufYeFacgmh2YhmnoYE1U/FQkRWec6NHtcpAV3+i1aUj
 3EUw==
X-Gm-Message-State: AOAM531Mc37dasI96lRcszqurpEyM3BVt8Rehh4ucV5rZqzb2hQnjnat
 rzAo2OsOr6OliS3c1Mh4u4g=
X-Google-Smtp-Source: ABdhPJxj4FOHEJL6eLG9j3s9bhz2cI5WstGPCENCBwwWnpKmfpEhlE8pRtJ7/rs9B268HliKtl5R2w==
X-Received: by 2002:a63:4f21:: with SMTP id d33mr1525579pgb.434.1619064587028; 
 Wed, 21 Apr 2021 21:09:47 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id i17sm635354pfd.84.2021.04.21.21.09.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 21:09:46 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 11/14] net: ethernet: mtk_eth_soc: only read the full
 RX descriptor if DMA is done
Date: Wed, 21 Apr 2021 21:09:11 -0700
Message-Id: <20210422040914.47788-12-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_210947_817090_FB4341BC 
X-CRM114-Status: GOOD (  13.72  )
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

Uncached memory access is expensive, and there is no need to access all
descriptor words if we can't process them anyway

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 01ad10c76d53..5a531bb83348 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -775,13 +775,18 @@ static inline int mtk_max_buf_size(int frag_size)
 	return buf_size;
 }
 
-static inline void mtk_rx_get_desc(struct mtk_rx_dma *rxd,
+static inline bool mtk_rx_get_desc(struct mtk_rx_dma *rxd,
 				   struct mtk_rx_dma *dma_rxd)
 {
-	rxd->rxd1 = READ_ONCE(dma_rxd->rxd1);
 	rxd->rxd2 = READ_ONCE(dma_rxd->rxd2);
+	if (!(rxd->rxd2 & RX_DMA_DONE))
+		return false;
+
+	rxd->rxd1 = READ_ONCE(dma_rxd->rxd1);
 	rxd->rxd3 = READ_ONCE(dma_rxd->rxd3);
 	rxd->rxd4 = READ_ONCE(dma_rxd->rxd4);
+
+	return true;
 }
 
 /* the qdma core needs scratch memory to be setup */
@@ -1253,8 +1258,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		rxd = &ring->dma[idx];
 		data = ring->data[idx];
 
-		mtk_rx_get_desc(&trxd, rxd);
-		if (!(trxd.rxd2 & RX_DMA_DONE))
+		if (!mtk_rx_get_desc(&trxd, rxd))
 			break;
 
 		/* find out which mac the packet come from. values start at 1 */
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
