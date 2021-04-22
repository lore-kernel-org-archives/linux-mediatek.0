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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFB7C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:11:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B978F613FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:11:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B978F613FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VSQdzP0Vc9PVfqVxqwv52BxSaTZJd05aL1kEXpbVmqo=; b=Qc9uDpGUNB0lQOEWtlJPRFbYK
	3MuIasepYjrnlMTOle3A5LXmdS4euD024GqNz6RHt2R3ADlgZwAugKRDG4vMROrdobp6zPFUQ9xX4
	Tf9WvSEt3NvDcx5e3QM41yyC7guBOJgjwB/iTB2fzs0L6R1EJRcJ8rIedj6gKSoLkc7TvA4HDK2ZI
	9p0Mb3LlpBDZk7y3TBsD0KFEfAgz1WbJLlZOhIVIdpqjyFoMfjfJigJCS7dECP+YdWU1VVORno6SQ
	8DcyiAPWKTPuYcyxdCtLNETfVsCdhuBDRAvoE2TjD+Sj1W5DCN48d0E5zhw1YlecT2ahxxkVO8eFO
	POspRTniQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQfw-00Flc3-2V; Thu, 22 Apr 2021 04:10:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQes-00FlQ4-E4; Thu, 22 Apr 2021 04:09:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=IhMuV7pk/e6sV7VUIyv8mgUtfEot/XwuLzvlzQOD9tE=; b=d9xULUlFdSarIJ+aEJv5MTcmja
 y133R3lMg+z2qPp7o0SfQSki2iQnwdIBYrqADsqCLQY7DbR64D2bolc8sPWqw55ZbOQGTMhchIEoe
 3Z8hkGdrc+fWR90lgU+pj8bVFexooFwy7vmWM/TAKdycLWiYH7jxu2S3DEBiUWKGDLHt2gaJnPq6H
 LzUwAvKPK4HdEZXnH9HHwud1AKUHdiE1RUnDgidqvhVa+98lupTgjbm1XH0+61EqzriOZo+EZjL5k
 ToawY5CTloIcmTm6oDNH5EDFhk53yimDmV5SMwGgIlMg5Wg61+K2Nz8enPg36PjMW1beCKBZSsTYU
 JFrkEm4Q==;
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQeq-00DLcw-1O; Thu, 22 Apr 2021 04:09:41 +0000
Received: by mail-pj1-x102d.google.com with SMTP id nk8so7434447pjb.3;
 Wed, 21 Apr 2021 21:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IhMuV7pk/e6sV7VUIyv8mgUtfEot/XwuLzvlzQOD9tE=;
 b=Qk50RbXnIUW3ik6C9BPq9pGE/g7IPmSF/zub/U4v6eFD9JYzpDwkpMh2dWa4LYF0Lz
 54kiRiI1+SrUhtd1xZEMQIF/luZ56IJBvynQzQgOFLegROKwyJWKS040JzeiMUEzbDq4
 hEGRAI3JbZclg1+zCKkPbE9gdEKnOg91hFQmkTDhHA09FRWQwq1lGwvV4yorElKuwCsY
 bq+foLDZHdCbyB8+XvO5L/qh0q2rbIUy0DgHc+V08aIdUkQSBZ0QRktS3BatdlhT7Q23
 l8Ih/fNd+vWMy2OweWy31wcVjSlqLxpR6vcmHFznz5eouZnqPHeRFi7uMYP56ZduOVm0
 JOvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhMuV7pk/e6sV7VUIyv8mgUtfEot/XwuLzvlzQOD9tE=;
 b=C0nZNtL906qwy1FZzbalStOcEdvbCjJTgBYO4Ol4ZB69rkzUzGergI3+Ecr83TtoC0
 bt+k9rOhgeiSNwSTQZa/PSi8yBR1bCmSALCLXGE3QU5Fy7MK0DgmnEwhVM906nR0Blv1
 0zWOt/iTU4f8TZx4nfWZVJ2QhXO1wow46MsEPV7CiXRu5LqB2+3CHnOcurTkpwALEx0f
 Xrzrf0C2MMH8QedA8wU0zAFLvVIYUQqWAF6FVIDyy9Vka971ZQUV6u0kOz0KpjTYnOpG
 6a8t+247pFoTr5iy498igKpF7YXIEYuLCnm8Vy7c5sjLYGpReZ93mctflw0JAYJnB0Oe
 lpSw==
X-Gm-Message-State: AOAM533aazlAmWk0vT9lsxKTQckiIBDUPyadbgdKP1y0ayoigcb+vWvI
 cRK2mywZBPeWiiJk7ZdkEMU=
X-Google-Smtp-Source: ABdhPJzg3V/PbtiIRa3CF472CaR81Ax8xdtPWol7R5JM+E25Dw25nASa8kWgFBbWcDd0jFjpUa+sLg==
X-Received: by 2002:a17:902:8693:b029:eb:53f:1336 with SMTP id
 g19-20020a1709028693b02900eb053f1336mr1466781plo.52.1619064579325; 
 Wed, 21 Apr 2021 21:09:39 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id i17sm635354pfd.84.2021.04.21.21.09.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 21:09:39 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 02/14] net: ethernet: mtk_eth_soc: unmap RX data
 before calling build_skb
Date: Wed, 21 Apr 2021 21:09:02 -0700
Message-Id: <20210422040914.47788-3-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_210940_104923_2EAEC78B 
X-CRM114-Status: GOOD (  11.57  )
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

Since build_skb accesses the data area (for initializing shinfo), dma unmap
needs to happen before that call

Signed-off-by: Felix Fietkau <nbd@nbd.name>
[Ilya: split build_skb cleanup fix into a separate commit]
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index b2175ec451ab..540003f3fcb8 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -1298,6 +1298,9 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 			goto release_desc;
 		}
 
+		dma_unmap_single(eth->dev, trxd.rxd1,
+				 ring->buf_size, DMA_FROM_DEVICE);
+
 		/* receive data */
 		skb = build_skb(data, ring->frag_size);
 		if (unlikely(!skb)) {
@@ -1307,8 +1310,6 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		}
 		skb_reserve(skb, NET_SKB_PAD + NET_IP_ALIGN);
 
-		dma_unmap_single(eth->dev, trxd.rxd1,
-				 ring->buf_size, DMA_FROM_DEVICE);
 		pktlen = RX_DMA_GET_PLEN0(trxd.rxd2);
 		skb->dev = netdev;
 		skb_put(skb, pktlen);
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
