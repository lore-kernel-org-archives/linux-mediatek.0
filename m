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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45916C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:31:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB791610A1
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:31:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB791610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TiRzYmj4dQKL7ioVEUu8iY6zqvMuA2QIyW0DDqZ1cmA=; b=btpfJ5N43sll5HCuhpPlWRyPe
	YKDk8Z959XCKWGABdnwxBoJxXgU2kAfk8euvOwaATmchbkJK+3Jxc7Hwbe/M5uUFPwB90Ad7tbNZ8
	O4MbQ+1RbDdcVwxKHFo48tv/IbTHkOsMLxNft0kea/HKpcBLPjdjsCls2PJfhx7lZQxe0O9Y9WFUD
	iuQsDgcvg0LIagBa9ZO5chhqA+xYnTsRNRKtfNSQEx1pedR8UdR9BFI9Yedts4NLSMxYjEuvY3c5Z
	WrnbphhaKaWI2AjBnOPuCPwhoM2ZzG/jyvI5RpN9FCKLo0Gov5VIJHdBHmvzdMjw8JTrlDx1cPJGZ
	fmLcicnGA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoPS-000hZ1-N9; Fri, 23 Apr 2021 05:31:23 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoHi-000fbM-BE; Fri, 23 Apr 2021 05:23:44 +0000
Received: by mail-pj1-x102f.google.com with SMTP id s14so17666380pjl.5;
 Thu, 22 Apr 2021 22:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M+UkxRcksnApyVs6XRntELHRkRUhOfWnYDnO1ZqRoWc=;
 b=YqR5wBCEG4LdcLo0lZg6cH+tcklWyskvWaWbqu3+m41OjiOI0vJfgBt8WaINceHnHp
 FyU+z+yV8z6xoqI++d8hQxrn2BQRnF0Y/1jqkBP9miOh28YC9KpipS3bkSPuce6xDvYg
 /Lyf+fM6U9AE0wjboQyGDvrSAgRqgL8PfTA3DCD/JPO3wLZwurni51LBzh3/SFygeGPB
 2Y8/q/NVfGeScdqCN7s+CpIYqaYw+/RP3YawQueSHLhJt+j//ecPbtNd4+27FX6tTvHg
 bBqiKmamHW3XgihuVB4P0t4EqDgrOkMjoMS0Ayb+Of0uKKHYIYb5lYJDhurCt1TBjlx3
 aTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+UkxRcksnApyVs6XRntELHRkRUhOfWnYDnO1ZqRoWc=;
 b=iwtCsDOrcO5J/Tp2Mm2RR9Wp5nLwyMUYZZxFPBrs5p+dG23WKm7ZiVU6WhRWvHj7l0
 tE1QrBgmGqyB3mJNozViJ0J+BkyEwLOgNE3DmpFnsjyBB6BaanTiDTdgd1OmYdzJup1Y
 woFgoN9thTQqZx8I3tBzBywFwTVHocUyucGE9TNJ+CEbWS4eeKm00rtI8Da92kYcouO/
 1hmrDi7uRyAik37Yf6jY0fVmrSahLXP+lnjQLi04QBzOzfyJFgOpD7fKNEFz/Ef4hRBZ
 qbG5wjJiP2v6swu9fd5+5mvG4Bwr2hjKqLxnXSrbm3qTGaZXXnb4pJehs59MjuxDJ3R4
 7Ljg==
X-Gm-Message-State: AOAM532MvPh6eAAiu1XdnVbeBYSKbgWD5JCNzNnATnvtF3oTI+hATUmj
 HglPv/f9b1R4xedwWx8qv2Q=
X-Google-Smtp-Source: ABdhPJwQ6kWQAIGJ3oAZPqiZa98jRvYL+nHMV0pr0QOfpb87dPhNaXXKFCC4UGF13r43UlsVmHXS3Q==
X-Received: by 2002:a17:902:dac9:b029:eb:732:d914 with SMTP id
 q9-20020a170902dac9b02900eb0732d914mr2058741plx.85.1619155277945; 
 Thu, 22 Apr 2021 22:21:17 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id y24sm6238825pjp.26.2021.04.22.22.21.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:21:17 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 01/15] net: ethernet: mtk_eth_soc: fix RX VLAN
 offload
Date: Thu, 22 Apr 2021 22:20:54 -0700
Message-Id: <20210423052108.423853-2-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
References: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062343_215668_7541B340 
X-CRM114-Status: GOOD (  13.10  )
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
