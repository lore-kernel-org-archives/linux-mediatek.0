Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1902C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:12:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B95861002
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B95861002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YSbFnJ9oq8gzk7uEbc0X41+2s50NRkOwRKBaornaHjc=; b=RhPeMp0+DQMwUD0mly5LcmSBD
	Q+uj85UeaWGZNpkT+aVhNRhg5940flYaLLxAqixIfoTks9N0F8PrIphNyOkADosBFt+yHvjUH7Bne
	k6A2FTyjr2XW9yxUusJqgUbPbOoKCZUHK4ivPR8N5Eh5cHyNepK6EwWCBNdtG5J5aTxEhcf0jVFE6
	nkTyYsAUUbo1wBfHm3kiN35daxcV2oGlSYjOs+ztwtoWR61BBYsg/DR6dZrX/CYjf8CrC5cVyz6mb
	OOrDHPk4jxe+FXpWTfQK8B02LGVc7L31papbRt1V8YNb7tMdDC0uglGVqtWNkbqv4f5MNo5fUHJDx
	t7+q0q43w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQh4-00FlyG-Nd; Thu, 22 Apr 2021 04:11:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQew-00FlQa-1Q; Thu, 22 Apr 2021 04:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=XaeFpP4NyPNpT7feooMHSBOAhXY5/vqZy8Ostkjc59Q=; b=Mpxn8kTdhIlYFutmbD5qmia7ac
 uL7N4JC8A59tFZZqOmn0cVjuaI6LIPVdD9Bn3uqcAg5lypsAWUU0tPSmy0++WV1IxBtN1GJH+jmfs
 +x9pEePaIEJHpH6BTll09Zv3+E0nRXlwq4+fQ+kP7qKUs8xCoTMmR7CpDphIusW23pALhICoHxJ8u
 6pTMFgProVpqgz6PcV7n2up3uxcDrYOTjlLd+8l55BTVbEyIXPTg154yCLb6xl1fY3cwjWhcduXJG
 yOszd2w8vtHZMhvG+r1kjuVLa3ebScEI4D6YFyNNzmKJGBjZeGPxjxvhVdbhWtZI+ms2sp1kdUtnh
 f/yPk5eg==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQet-00DLeK-Eb; Thu, 22 Apr 2021 04:09:44 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 m6-20020a17090a8586b02901507e1acf0fso239898pjn.3; 
 Wed, 21 Apr 2021 21:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XaeFpP4NyPNpT7feooMHSBOAhXY5/vqZy8Ostkjc59Q=;
 b=hfi2TcPIsk6W4BIHeinsfsPsQP897tqjtp+z6BngIvDmr5Mr1Iz70jkxspEeoXNQKC
 kgOh8ndlSIRk4O9LWEBeyMysynYTqy9EzGYsvI49aRynODdJ/GILzsgReEDmWfWUnfP7
 mf69N56PkshimlU0N4S97VOauuR1V4HXmKY1Vtncmw7tyEDCVOrXLU0uulLdC341Hr/z
 6NdyCozWKQijnbBFXU74ubUr0p1NxwSB8DpE3QrMx4NlYpN9XO4YZKqCvpK5QbrDEfcU
 OO3fbWobjgX6ZlY9NWBU0r6npAfp9Yha9qcakETlybuYTWaL4VHOYcOXH6XF0G9LpldN
 /A2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XaeFpP4NyPNpT7feooMHSBOAhXY5/vqZy8Ostkjc59Q=;
 b=RhNM23rAJxyQ3Pb+wAWD7g2T/YHUakEfBxq+uthLdhm18nDY4DNoTa8RQj6hU1rorJ
 QC++rdqcJrZs9ep0BDqw+1UpIb4yFvJT+TBvbssJkav7FSpqxb270hna/+LRoud51odg
 Rl+eO7yMd6WNUIBOMm3cEotMczRE/hDuKKezn15NSKwiAPLFLg1Zk+mAdAyYafPzp56C
 Lbn7hnUcGuSOTudjdfefdieaazObj1a4G3kkPGuqkVuskg/kXqXDP73wZub8Sd7/nMaU
 FBeHBDTLlaep+N0GETXxCiObhxxP4KRLJwkBeChA/yGcLjsK5biv+s7J7h2oPTlUEunD
 usZQ==
X-Gm-Message-State: AOAM532DMfwAVDHY91OrcsYQ8O0gnUBu/8rPtwAflJJWfCMTphhI8MME
 AFPlDRVZiRbhQgu+S6AVMyo=
X-Google-Smtp-Source: ABdhPJwQQeHlhMyirN59DawShgsPiF1tWB8tRGdQUATxeztZ1cCHj1TO/tCxi6vHsEAz2NwgKMU0iQ==
X-Received: by 2002:a17:903:4106:b029:e9:244f:9aca with SMTP id
 r6-20020a1709034106b02900e9244f9acamr1644202pld.58.1619064583049; 
 Wed, 21 Apr 2021 21:09:43 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id i17sm635354pfd.84.2021.04.21.21.09.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 21:09:42 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 07/14] net: ethernet: mtk_eth_soc: use larger burst
 size for QDMA TX
Date: Wed, 21 Apr 2021 21:09:07 -0700
Message-Id: <20210422040914.47788-8-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_210943_509451_FE68A95A 
X-CRM114-Status: GOOD (  12.49  )
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

Improves tx performance

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 223131645a37..5a67bbe9bd90 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2191,7 +2191,7 @@ static int mtk_start_dma(struct mtk_eth *eth)
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
 		mtk_w32(eth,
 			MTK_TX_WB_DDONE | MTK_TX_DMA_EN |
-			MTK_DMA_SIZE_16DWORDS | MTK_NDP_CO_PRO |
+			MTK_TX_BT_32DWORDS | MTK_NDP_CO_PRO |
 			MTK_RX_DMA_EN | MTK_RX_2B_OFFSET |
 			MTK_RX_BT_32DWORDS,
 			MTK_QDMA_GLO_CFG);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 989342a7ae4a..039c39d750e0 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -203,7 +203,7 @@
 #define MTK_RX_BT_32DWORDS	(3 << 11)
 #define MTK_NDP_CO_PRO		BIT(10)
 #define MTK_TX_WB_DDONE		BIT(6)
-#define MTK_DMA_SIZE_16DWORDS	(2 << 4)
+#define MTK_TX_BT_32DWORDS	(3 << 4)
 #define MTK_RX_DMA_BUSY		BIT(3)
 #define MTK_TX_DMA_BUSY		BIT(1)
 #define MTK_RX_DMA_EN		BIT(2)
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
