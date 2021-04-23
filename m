Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803F6C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:28:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF67C611BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF67C611BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0di1lBBNGhzlfwfgKmSCI4fKap6YVDptjstReQGOgbg=; b=Qvp8urCeJfpdFVhSgUdbtn3oDp
	zIefYbXaOVZlUPzD4ksSQzSyahDFou26tgnLRssH8Wm9h4KMfQw5C7SFYaod1qnEL0N3xuN4DpcPb
	BScQsNv+ytF+b5fj0SqkxPcZq5Cs0r7kkCDvGZyYBtMhgh2Yph9ttIsC/gC4VJtf4ELDQA8GxI7Q4
	ReqwP3xUuQ3KnHy+THHyt7xWnIYzzMjgAud1+NKBQcjHO/Wvr46ku/TQz161pquV8dztIQKPeTv/3
	oC9aX0XyM6mo17gUwRrOJTyit34tsnlshfnZfWNqJ0bGjB+lmQ2VaOpPCpAoyjfQrPt/1ySm71Pn6
	pjlNuQlw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoMQ-000gNz-A8; Fri, 23 Apr 2021 05:28:14 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoGp-000fXV-M9; Fri, 23 Apr 2021 05:23:03 +0000
Received: by mail-pl1-x632.google.com with SMTP id g16so7814943plq.3;
 Thu, 22 Apr 2021 22:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MieVHBeftBWgRkSvI3T/dSTqRh2CCLfDKWUB6Ipjrsw=;
 b=IWpkNMmz1YRQVdQSOWklrN/tXKJ1wpQbTrwgcxxKAPf1u16qOGtO3U7c+p7BojGrkQ
 DZsy+EVCb4UDoGBvC6yxUtdL4hk0yB/K/eKI0KpeSaNaSxC49bmZg0XAR27QL1pbKgMY
 GW1v2ELOwEXRUmxr5DyUYq7hw6/f307l+Zs7072gaOtk3wOXXnz7FvC8Yf3itrkXx5G2
 Z6YUIifWcPlT3+ztReqDiO4zv13FykAaPkIosbpvHVWsOojDl0TKHb9nWa1uXs8NUNij
 Agcm11yhZk6qu+424GmqohPhWt1moS7OxWbGMEb8KTh+7l9OddJlY1/qq4tWZg81OpOP
 XZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=MieVHBeftBWgRkSvI3T/dSTqRh2CCLfDKWUB6Ipjrsw=;
 b=T3R+RjrEbVfqQ/Ees4+/RZTvx+DKOCkGNZpsEfWwC95Dxhgl7pVCQA2aFJ7MmJClcl
 8jtMtzmil7vgbHGgq6U8a/n6klkAr+h2FCOYNkFG3NgqsRbROwAxEgv9cSdAelTSjomX
 G2OMPWJEESfhxzJaUdtaJU9He8rZD8zQw5auD0d74gOvJtlGfn+FAnWLkXESs2MCfqhb
 vhHhERH9pTh2TvDTSg0BpaIfndnxtNok9uQFQ2hf/uptXckWVC8rkog7kq/t2BmXdzAm
 GEKbI0eJU/ldeUAGuXdXqBLeEm+1JMCYsm3Vx0QbOmXUTbJsrH7OPqSu+nMNlvW9btTG
 b4UA==
X-Gm-Message-State: AOAM5309ALghmkcdNQniDjSWQ0Lfk9PTR46JhWHchHpRGb2pEVxlDnXw
 BUKBL6ZUVfNJJi0jyzMh388=
X-Google-Smtp-Source: ABdhPJwa3spCgV3cEcDEi0fTP6+lYrXOYeaSNyrzY5MLC9mY2ytrThcyR2496gqtePPNhXwXRz9RBA==
X-Received: by 2002:a17:90a:d3c6:: with SMTP id
 d6mr2429812pjw.25.1619155276923; 
 Thu, 22 Apr 2021 22:21:16 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id y24sm6238825pjp.26.2021.04.22.22.21.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:21:16 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 00/15] mtk_eth_soc: fixes and performance
 improvements
Date: Thu, 22 Apr 2021 22:20:53 -0700
Message-Id: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062258_554869_76FA229C 
X-CRM114-Status: UNSURE (   9.59  )
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

Most of these changes come from OpenWrt where they have been present and
tested for months.

First three patches are bug fixes. The rest are performance
improvements. The last patch is a cleanup to use the iopoll.h macro for
busy-waiting instead of a custom loop.

v2:
 - Reverse christmas tree in "use iopoll.h macro for DMA init"
 - Use cond_resched() instead of iopoll.h macro in "reduce MDIO bus
   access latency"
 - Use napi_complete_done and rework NAPI callbacks in a new patch

Felix Fietkau (12):
  net: ethernet: mtk_eth_soc: fix RX VLAN offload
  net: ethernet: mtk_eth_soc: unmap RX data before calling build_skb
  net: ethernet: mtk_eth_soc: use napi_consume_skb
  net: ethernet: mtk_eth_soc: reduce MDIO bus access latency
  net: ethernet: mtk_eth_soc: remove unnecessary TX queue stops
  net: ethernet: mtk_eth_soc: use larger burst size for QDMA TX
  net: ethernet: mtk_eth_soc: increase DMA ring sizes
  net: ethernet: mtk_eth_soc: implement dynamic interrupt moderation
  net: ethernet: mtk_eth_soc: cache HW pointer of last freed TX
    descriptor
  net: ethernet: mtk_eth_soc: only read the full RX descriptor if DMA is
    done
  net: ethernet: mtk_eth_soc: reduce unnecessary interrupts
  net: ethernet: mtk_eth_soc: set PPE flow hash as skb hash if present

Ilya Lipnitskiy (3):
  net: ethernet: mtk_eth_soc: fix build_skb cleanup
  net: ethernet: mtk_eth_soc: rework NAPI callbacks
  net: ethernet: mtk_eth_soc: use iopoll.h macro for DMA init

 drivers/net/ethernet/mediatek/Kconfig       |   1 +
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 262 +++++++++++++-------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  50 +++-
 3 files changed, 213 insertions(+), 100 deletions(-)

-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
