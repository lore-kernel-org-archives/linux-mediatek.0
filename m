Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48D7C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:31:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B93B613F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:31:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B93B613F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PIXrXkEdALPUU6gnkgSz9KNWIPztE/HrnIw0OPUr++c=; b=lhd2zhBb8fHKih61cTnNP865I
	LCANBg8eW+MUvEm2qUAoAokMW4Ghj4vgmnpW3A2xwYnfPsi/rCssxExP6Yb1eDiVPQpSKA6d3XRm1
	w5PujRgUa+LY7VPFHwKsONNc7irEtK8477ppwk7nfz3W0kgA/dIfsxioRTL16+18Kqt0dKd7jTdyg
	+zHHt3HMVNXDKX4Tn+ZC9iT8emqRdjfF3Hycl/TJBh57KESYhqibeVyGOLU712gAIm9UmlYQNeSEU
	oRrnsmUh0ansoppTAayOttf0RN/7BZN3YAzVguwGKfAZ1D0R/UQCULvYhPIXwTRdqRTs3IMfHFY1w
	EVqVvvMkA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoPY-000hca-37; Fri, 23 Apr 2021 05:31:28 +0000
Received: from mail-pg1-f181.google.com ([209.85.215.181])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoHz-000fdd-9c; Fri, 23 Apr 2021 05:24:07 +0000
Received: by mail-pg1-f181.google.com with SMTP id t22so2974649pgu.0;
 Thu, 22 Apr 2021 22:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1zBsYlQcq61seY0imZReAqd25ZKjbgbucT8yzndF0G8=;
 b=mXObVk0IL/7DFMTpyCRPZqGetBuk3drJ5M/Obl1C6xlK7NDyhWWCkl+KNYiQutboxo
 kW6NaspOYeE4qWwHpjbIUz5ErGST9GY4/eGwtQc2odt1wMZD2IcUhPqD7dBy4NkNPGp6
 tLrU2REcLNeOdDmQFXDupVzyomCI8NOfpFEHRpNz4ig38eg/mrkEcIXxjnR0osGV2q0+
 xDwo2ZK2B8OGp7uC4aJhP7+Udx313yhxFi88+DxnbG/lTvoUAMI1y+IIfQ540dy3P3I3
 h2xF0CqSDfBDDUk1QwMwVSTt5nZm7ixz/P7ca/S9n6Ac0i6+Ji+RlmRQgNyh98fCyjxt
 /fsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1zBsYlQcq61seY0imZReAqd25ZKjbgbucT8yzndF0G8=;
 b=R1JZO8rDbgauKjZUO6/8P6brAuVlf7iy/Of+DWkqoH7ZZAgkF/JdUyuPWtDo5hhfCu
 LXX8RGNoKO2/CZgsw4hrH9B7ZEYETB5JZ+XvqPQMSIZ6PoFUVPfKGWXD6FWAxMKSkFrp
 9/LDjOKtkqm9SdKPCCJ9MjegIYRWrDekeGqX/hUr5Iq9Ut8bKu9HvHRqnssRznBkpsSL
 it/azfoKZK6Pr2P/iL7KUttZKdU8nrZ9sBc5TR6P+wPafIKIDXmVsH3TEMKLKDITIGak
 4s0kpI0yTVHchhanaUPAT3T53hhtHc+2yYfz3oMORFiNPaVO2VvAt1FFjVhVIWwZ0yQw
 HS6Q==
X-Gm-Message-State: AOAM531zrN2t4w4ywb0XRAoN9CjCz52rNYDqsaprEE19jvncW5kjm+un
 wsUUzKDMv5eneq0l0jVfq4o=
X-Google-Smtp-Source: ABdhPJzYTtLTrv/HN8NBYaCqVRueYZcK2ZzzlX8xhlJjUZfD3Gdzp3iB1pwBdX68Cwy/NGXiEfx9FQ==
X-Received: by 2002:a62:1b50:0:b029:257:da1e:837f with SMTP id
 b77-20020a621b500000b0290257da1e837fmr2066529pfb.57.1619155290331; 
 Thu, 22 Apr 2021 22:21:30 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id y24sm6238825pjp.26.2021.04.22.22.21.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:21:29 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 14/15] net: ethernet: mtk_eth_soc: set PPE flow
 hash as skb hash if present
Date: Thu, 22 Apr 2021 22:21:07 -0700
Message-Id: <20210423052108.423853-15-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
References: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062403_319430_84143122 
X-CRM114-Status: GOOD (  11.33  )
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
index 8faf8fb1c83a..37e50a2e7d0e 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -19,6 +19,7 @@
 #include <linux/interrupt.h>
 #include <linux/pinctrl/devinfo.h>
 #include <linux/phylink.h>
+#include <linux/jhash.h>
 #include <net/dsa.h>
 
 #include "mtk_eth_soc.h"
@@ -1250,6 +1251,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		struct net_device *netdev;
 		unsigned int pktlen;
 		dma_addr_t dma_addr;
+		u32 hash;
 		int mac;
 
 		ring = mtk_get_rx_ring(eth);
@@ -1319,6 +1321,12 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
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
