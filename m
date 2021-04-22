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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05136C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:10:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6651761424
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6651761424
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TiRzYmj4dQKL7ioVEUu8iY6zqvMuA2QIyW0DDqZ1cmA=; b=d0FHlKYn1Mxfzht3+K5uIKr2y
	MUFRrdWFICHmpBHt57SzFMJ2cMwR1HV+74S0iQRdTIGgX6jrGCiK2BaV0hnI7664+cHvI09L5Cb6C
	UnCmJ6EIrO4upad+gypd/f9h7juZvbdRmqetp1UMoub/S/UKv9YBRbg8b0HVgZxg0Q3mPUR3Sy69Q
	8Z9E3s94BDSOZ5uJSzTj3bGsqA3oXxmUeEApHjFC3khHGvwUx5N0Ho635BjFscQLQVccHzW2q7X9T
	s7qeH+JPyo/+ogOi5bhOA0DNzuDlpHTj34Hh1zBOuSnZOXCvBRD8LDHxAAh90YJai/zSXuJdJ38ve
	N4JNlxitA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQfL-00FlWA-GR; Thu, 22 Apr 2021 04:10:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQer-00FlPz-RS; Thu, 22 Apr 2021 04:09:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=M+UkxRcksnApyVs6XRntELHRkRUhOfWnYDnO1ZqRoWc=; b=Lx/GDwyq9WvFcy+4yN6jp2LLD+
 IA8WMXTrSmCTFJ/fJqz3F0ObMRW8p5HslF17L9/yC8mOU7emhMylEof6yH8Zk2VuA/vo5e7XYQzVS
 kx0pdIXmHmmi2+vLbe/C5VXhRp2pwo6i+EbT1Ffs/fFlm3Sur9m1UVgnOq55CXVgM9u3HLlwovwqJ
 hfBVoPFJUc+qpjIbRDQ1a1cVgVQEZ7lb/xjlVAAE16I0h+LWi/CpFpYmaeugpZMQ0x8+UR3Gp7nbW
 r1fyZfOH7P/0i2q2HAJn3QjVc5rB/ebCOgSXq3GqLy1UYwiwEnJbq/Gnyq2jl0OnVs/YtYDfs1SJX
 rRvmeypg==;
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQep-00DLci-9Y; Thu, 22 Apr 2021 04:09:40 +0000
Received: by mail-pl1-x62c.google.com with SMTP id e2so18529025plh.8;
 Wed, 21 Apr 2021 21:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+UkxRcksnApyVs6XRntELHRkRUhOfWnYDnO1ZqRoWc=;
 b=Krf+iJf9arTXsWfbO65KruQYlFPyL1W/a7QWL02To8JtHLLrm20hPSip5Kw2GYq1hg
 3JDjnW6092g1/mOdXD/KN06D96oRcuH52oVcY57hYBD66+TCVJrR7xfG7phe8ZmD4OEo
 BZ1wV6M9t6HSDZZqJdH2dm99RTbOTKaqDGU9Ro0oeEtmAh+tOV2EdGnEpHw0u+B/EVlH
 f3ZD4Syu54p1lxdzbPr6nLnvpktbP7H6quaEgdtYftzfwitW+x5WwHFBUMQM6RfQ4ZRb
 ouh4k1jXB7rDkA0uo7zRPHS+iPSLvlcucPcW5e0rK6rzK62duM4YriwkoBYfEF25oBiJ
 GvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+UkxRcksnApyVs6XRntELHRkRUhOfWnYDnO1ZqRoWc=;
 b=Zvc7q8xGyWBaV3NFAMYRsCMptPtqehk5EPz+RD4WZKfl1w5XOVgk9CxaoIZsIg2BqU
 OgXyoWiuVNZtzbpuvHr0j7aVCScX5kIK/jE/6fsQ7cdgE41uPtIVEV3QW1IqH9nQlthM
 Mf/irk6FV8hXb+vnScUnOrOlxiE1A9Eg0GGh0oBJp7pTWS/c4Y+EL8e4sq6XoYVfNK0y
 W2bLVMMs2/oA2EVmnSdW8iGvvsnaQe2xUAw3b/AGo2K0PHOSrogA+dw1AHC6HMwoSi1W
 P/nt4IMPkn3IG3W7aowiNYElroIOk8frNHJCSXnVsQEPt7V7+AOIS46fGIJGDfW+H2HQ
 1y+A==
X-Gm-Message-State: AOAM532uPwsHfazLPo80rqeLUh3f9xMAM0S9nA/vR4tfSAJkkyDGUeY9
 9I99cGAzzztxaO3sT4noBog=
X-Google-Smtp-Source: ABdhPJyTYQJ83qyCIAcrBlJUUq7yf3pUtZkYMy14r3Ds24vk5PH8rQcWHhpel40s381fjFRfb8hXbw==
X-Received: by 2002:a17:902:109:b029:ec:9f64:c53d with SMTP id
 9-20020a1709020109b02900ec9f64c53dmr1408533plb.83.1619064578591; 
 Wed, 21 Apr 2021 21:09:38 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id i17sm635354pfd.84.2021.04.21.21.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 21:09:38 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 01/14] net: ethernet: mtk_eth_soc: fix RX VLAN offload
Date: Wed, 21 Apr 2021 21:09:01 -0700
Message-Id: <20210422040914.47788-2-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_210939_353208_7376D802 
X-CRM114-Status: GOOD (  13.46  )
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

The VLAN ID in the rx descriptor is only valid if the RX_DMA_VTAG bit is
set. Fixes frames wrongly marked with VLAN tags.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
[Ilya: fix commit message]
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 6b00c12c6c43..b2175ec451ab 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1319,7 +1319,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		skb->protocol = eth_type_trans(skb, netdev);
 
 		if (netdev->features & NETIF_F_HW_VLAN_CTAG_RX &&
-		    RX_DMA_VID(trxd.rxd3))
+		    (trxd.rxd2 & RX_DMA_VTAG))
 			__vlan_hwaccel_put_tag(skb, htons(ETH_P_8021Q),
 					       RX_DMA_VID(trxd.rxd3));
 		skb_record_rx_queue(skb, 0);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 1a6750c08bb9..875e67b41561 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -301,6 +301,7 @@
 #define RX_DMA_LSO		BIT(30)
 #define RX_DMA_PLEN0(_x)	(((_x) & 0x3fff) << 16)
 #define RX_DMA_GET_PLEN0(_x)	(((_x) >> 16) & 0x3fff)
+#define RX_DMA_VTAG		BIT(15)
 
 /* QDMA descriptor rxd3 */
 #define RX_DMA_VID(_x)		((_x) & 0xfff)
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
