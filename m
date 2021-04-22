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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5741C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:15:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A1A461445
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:15:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A1A461445
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=J2XVQUzjyRB5eRf18lZjgc3in4awjJDd3TiLV/5Zy74=; b=JQ+qRuJfn+l62iZS0+qqgU43K
	gUCSV9WmJTGwxsAb+mwPdgRwTjybRuYIPMRJQYJhaNk27X/7S6NLEvvaa5gvwzv2HKgkcL78Rv6t7
	2j5D0rnCUmV0HCSh2k0Aula5lNpt4bDU9uDoSPvSyKr4aV1t93qKlCoAtyJs9aCKD/d8uKIOIoqSB
	a4FJW6bI92rCfrGy9plf9hOs+lZTHXEgKJ7Z8taokxXopik4Eo9iSOMteItyzwyCSrP0LxJXFzIXx
	UdWtT3+uG/a+2uRRNZKbs+28ZM3HUGqDhLqyfglfLcQQlrqsoCKa/pkcgl5ScrknZK5xtlvVbNGDL
	+tNhTSxUA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQkF-00FnKz-2A; Thu, 22 Apr 2021 04:15:15 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQf1-00FlTO-Od; Thu, 22 Apr 2021 04:09:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Z+GoIGK0ASypWzKq72OR9x8SOdqUZq5a0/koCWBmuF4=; b=F/jMIa9+aq0cG79sWyopkKD4Kn
 7MEld62I1gLGfidC7YS65+pJO5bmxbSKXJprOkK8sYlDaM9FkKK2ewFmbEREfdFxUdcmbclgEsrXr
 /0WcanJbmnOFR2SmR3H4g7B7Igk/1igURzMZZ0g84gItFyV90cdA+0zMYyHE3PgLpaEq6mK0gwof0
 ZHffJYeRsJPPueva55mt7lX+9EeQDzSZ8BtcycZRPQ7G7ceIeQDvIsdvvVhfltTgVhtgcLGoRMcMz
 Id+8/7svfZstY5QkGfl48plwBp5iMHdyhvblamW9YjAoaJiMnLHv89gCoxCjagm9H+4zdL2S1b18E
 9PvVnY2w==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQez-00DLgR-AM; Thu, 22 Apr 2021 04:09:50 +0000
Received: by mail-pf1-x432.google.com with SMTP id i190so30768587pfc.12;
 Wed, 21 Apr 2021 21:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z+GoIGK0ASypWzKq72OR9x8SOdqUZq5a0/koCWBmuF4=;
 b=AprUGNkG4iniX7gYV9sc0nkIUpaw4DobJ3++iTN7JS1NrwMyOKGGVaf1e30tNIa2fS
 9Y6nYK+mNrT+XNGmGy7DRF+fGYtEm14LyCfV0Fx9FEO8gBU4ik38GOv1jcJuLGLXaD5F
 iBwjY25Oxbsp2K6ujWm3YM8eXHcTWlk2AuujaGh48a6d3DqDr5fTUpnwUTMpGHo9JZUk
 Ecc2BqqOrxpsAH4/ufHOPDgaeab6jBSNFcEBFh0epEuGDlNV2C6mkO5s871Ebdi9aq4V
 rekaU3kfYEudV5imStEtUGcGERNtIqjWQfL3JfUvfrGz/1x7gJWp2voSN6PItH0wgTEA
 wYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z+GoIGK0ASypWzKq72OR9x8SOdqUZq5a0/koCWBmuF4=;
 b=NDbNbgViLOFRIJPBTbw/svedD7kHjmv/derMQQoYr2rFTTeek9bzOKO4UQ1ads1wyJ
 wJoCTNRVtQJyUemQMW52tBkTnk7gzxQhhp/LiGIISLOJ/EgWOEVoFmIhJj1jICWPsRZI
 TEGBLVFJqdg+MbSDVGNBeHwO/huPsg+QZUUz+O7wrCibZ2fppqj2CD4bb3q4j4gbeWuW
 nn/5032DbbuAB9YB4TBAkPerooSuYSSmxvSwho9w7n77gxWGJ9XNybVpN6XTevPyPPEI
 lyhzjxnyIAODTyC+R3wy+Dd9OjkwqoNeYoYWvuE3Xb1r5/DYT/XuWGEA2uPO0e9Of8Ff
 kgFQ==
X-Gm-Message-State: AOAM531/stGvliWJ5Zi2XLfphNY/9zgmGVGpOu2F8ahHrj3rDqAogZ3K
 CC5+/EWr30SHa8xzIF1qKYs=
X-Google-Smtp-Source: ABdhPJwdXfftitSkQgijuSk3gh09yZ8hWXEU9IIUiEfUBuPEVMliIZMb7ZvHXRb3o8qf6vA4R76wXw==
X-Received: by 2002:a63:4866:: with SMTP id x38mr1518318pgk.135.1619064588652; 
 Wed, 21 Apr 2021 21:09:48 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id i17sm635354pfd.84.2021.04.21.21.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 21:09:48 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 13/14] net: ethernet: mtk_eth_soc: set PPE flow hash
 as skb hash if present
Date: Wed, 21 Apr 2021 21:09:13 -0700
Message-Id: <20210422040914.47788-14-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_210949_379257_A0F8C936 
X-CRM114-Status: GOOD (  11.60  )
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

This improves GRO performance

Signed-off-by: Felix Fietkau <nbd@nbd.name>
[Ilya: Use MTK_RXD4_FOE_ENTRY instead of GENMASK(13, 0)]
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 88a437f478fd..8c863322587e 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -19,6 +19,7 @@
 #include <linux/interrupt.h>
 #include <linux/pinctrl/devinfo.h>
 #include <linux/phylink.h>
+#include <linux/jhash.h>
 #include <net/dsa.h>
 
 #include "mtk_eth_soc.h"
@@ -1248,6 +1249,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		struct net_device *netdev;
 		unsigned int pktlen;
 		dma_addr_t dma_addr;
+		u32 hash;
 		int mac;
 
 		ring = mtk_get_rx_ring(eth);
@@ -1317,6 +1319,12 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		skb->protocol = eth_type_trans(skb, netdev);
 		bytes += pktlen;
 
+		hash = trxd.rxd4 & MTK_RXD4_FOE_ENTRY;
+		if (hash != MTK_RXD4_FOE_ENTRY) {
+			hash = jhash_1word(hash, 0);
+			skb_set_hash(skb, hash, PKT_HASH_TYPE_L4);
+		}
+
 		if (netdev->features & NETIF_F_HW_VLAN_CTAG_RX &&
 		    (trxd.rxd2 & RX_DMA_VTAG))
 			__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q),
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
