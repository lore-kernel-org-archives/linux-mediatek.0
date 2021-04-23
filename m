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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26794C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:32:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D042D613FA
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:32:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D042D613FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oiYXuSIz6Y39MhgpXsbW+Jal5Pnve/1nulMUr87HlNs=; b=pAol4U10Vnj8N2B/qSUC3KPEl
	Y4VqoS9IaySOL4sEGKqn+G3ORC6mOJb0oeZW0ruI1QtWRJjJLVFW+ruhhK0LvN44e1e918ytqL7iZ
	RVpdtY/x82EwF1j4Tdo7+MqIIBWjX51f/6+2gzYF3mHaQVqgRBb38VBe7Kn0tnEgYp75zWFYAOB4V
	n0kQNE2ltMyxobUm5EBYjPmdH4kYi1645F2I9mbbhb3pXgPS5NWOLthjq2dqsLyPYQFqWnuLgGCvT
	xo9oj2YPTjZ8c2JMskRbV0FY3sqb/ChOIp3RzyTeBacDhWeYgRzN8jsEzyk6HbSEWnaIsikNaPYeC
	olpBPx/mw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoQM-000i2b-PQ; Fri, 23 Apr 2021 05:32:18 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoHk-000fbU-Da; Fri, 23 Apr 2021 05:26:03 +0000
Received: by mail-pl1-x62d.google.com with SMTP id s20so8835854plr.13;
 Thu, 22 Apr 2021 22:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HlVoF4WBd28mr16LsVXI69/qoWczDKwnY5ulmKa3JqU=;
 b=PJqw7qbCVerNFMqSHMZJzZ+oDBUc8T1s4RQIMW64itnCYPn5unf5oOv9h5yu4Tv80a
 e1PEbJY4tA4JypLmdonjfmuV92iSNxIZiEfeLwgsjYsBBDq3nG6rWkKTJNIwTZAcCRpX
 /n4i//CxaXnSkPlW4l5365q/tShaCQswbt0Fs0/h4x+dDnGprpxCccXJbISBjtSIqCzS
 S032twqbKbFTD6jmzp4E4db8WyOnFKEIGhKQ+cTmEPH7Bg/pz+E9JrTj2Ca9WhDHFeQp
 Ro1FaVrnmMf71olrDnUNLHHaee+6dRtHpgS8O4aBHVHQpcO906KVNgmRx9ePq4/roMSn
 YwXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HlVoF4WBd28mr16LsVXI69/qoWczDKwnY5ulmKa3JqU=;
 b=JJPMWwhjCuRBnIjqHUMuHAealqJfBBDaFf7wrjZpdEX4XlTWuHBE/Kghmh2jaj/drN
 fBvNgZBzsz/6+7JHT4DwrBTQNpHxSuzLjn/5eGfRvEALp0nvIk6sjjAZbYMH/Z9PAc3t
 PTTAYVfEu00rvLI3iJu3XY33Z+5/7ZRS0XH5JgCyRGHxoX09eL1ThKWdfQNSeabtLOzN
 rXNGLvpD+mVkCHZEJ2502qRMrQ3YW0iMER/mVu+QPqUaAXFC8iSLOzQTcnzVDBE0wugw
 /xDYjDVipBa6WKRiepipSd7hv2Xy13y7/VqA2+bk0hYQtwjf3DsQmT0xe7opwtbe4Wb3
 Whyw==
X-Gm-Message-State: AOAM5314tiIowqC36hEUObSqSxXLtwttPONmaDQnAvC1tFZJYrbMse8j
 hMLsZePrAEqXFSspPGqxfOc=
X-Google-Smtp-Source: ABdhPJxfR910IzfiJ+sHCtn/47cz6QgVT8Cwpw1BicgmMT5qd/MKnS0aDxdWUSWwkQH3YllxqCDcNQ==
X-Received: by 2002:a17:90a:fb87:: with SMTP id
 cp7mr3818203pjb.78.1619155280763; 
 Thu, 22 Apr 2021 22:21:20 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id y24sm6238825pjp.26.2021.04.22.22.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:21:20 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 03/15] net: ethernet: mtk_eth_soc: fix build_skb
 cleanup
Date: Thu, 22 Apr 2021 22:20:56 -0700
Message-Id: <20210423052108.423853-4-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
References: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062403_318146_F7F99906 
X-CRM114-Status: GOOD (  11.77  )
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

In case build_skb fails, call skb_free_frag on the correct pointer. Also
update the DMA structures with the new mapping before exiting, because
the mapping was successful

Suggested-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 540003f3fcb8..07daa5de8bec 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1304,9 +1304,9 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		/* receive data */
 		skb = build_skb(data, ring->frag_size);
 		if (unlikely(!skb)) {
-			skb_free_frag(new_data);
+			skb_free_frag(data);
 			netdev->stats.rx_dropped++;
-			goto release_desc;
+			goto skip_rx;
 		}
 		skb_reserve(skb, NET_SKB_PAD + NET_IP_ALIGN);
 
@@ -1326,6 +1326,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		skb_record_rx_queue(skb, 0);
 		napi_gro_receive(napi, skb);
 
+skip_rx:
 		ring->data[idx] = new_data;
 		rxd->rxd1 = (unsigned int)dma_addr;
 
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
