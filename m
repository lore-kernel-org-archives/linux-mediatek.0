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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4DBC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:29:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC47F611BE
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:29:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC47F611BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=VSQdzP0Vc9PVfqVxqwv52BxSaTZJd05aL1kEXpbVmqo=; b=bsn5d/3D2qD99nu8Li42LcSe+
	tibFZr9dZ1VUpaxCBvvN/z4ytO7NOxheBEBrQj5Vj6uUIsH1K5amFglszdaIc2hIuLsVRO/r0p3rG
	HDMS10xjmHzthyeoI+RuUboXJA9jONL5Na1847VnKEYIdDxhkqRsQ33bZRbON7RnlNq3wonmjZ5QS
	yQJZTCjRSfGl2wS94lkEaFNS8ioTgnrCfy1mEmpnqMXS8jYHPh6xShG3ZOMx5iA3gE09ZO0eUQOF4
	alOSrMgK5eXApSx/c3c++M9KKr9/EA37ye+luD6Lv2/8Oz1ijaNj2ViLvWjk6dPn4qGLzGLDLdYNh
	YVTdzj14Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoNF-000gid-Fy; Fri, 23 Apr 2021 05:29:10 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoGp-000fXP-GG; Fri, 23 Apr 2021 05:23:05 +0000
Received: by mail-pj1-x1033.google.com with SMTP id cu16so20506756pjb.4;
 Thu, 22 Apr 2021 22:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IhMuV7pk/e6sV7VUIyv8mgUtfEot/XwuLzvlzQOD9tE=;
 b=lmLheeEPGFQgitLGJY+wsWubJP+ggaguhY3vmRN+E82W0DBWsuLaZKiNy3fmbngytR
 Pp3iI++8Zg3h+6LP2O7TM9U1qa+026qhc6tLnH/B76oY9dZ02r9FCb2Zdi0VkY/mINPV
 XiFhil4oCVGQtkdjqIz79VZbID0LOje6s0D9WYcyR9Ht4ZbEVZV4O3RIqqiksMenfRRJ
 Q45783Y63qzCXFiC9RwC0E3mZOUAl9ivHiYjzA71FySr0PGEnJzkTLaWbDsR8VReLrcy
 wQjwpYjSr3/N0cfiOuDlQfvt/CsgreHvG4Uaii1WWbKNVVIV34jKa7BJVuztyA23YTAy
 MYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IhMuV7pk/e6sV7VUIyv8mgUtfEot/XwuLzvlzQOD9tE=;
 b=gRh9NVgmQhxbROUYWZLfd/ReyPdqmjRlCw4SFHNtz8wkcTYLFFe4dW8+q1fOQnIFKd
 aZt5oawTJqC3cmn2uJSaRiDBVhUxdlh2VrigBcj+RGYoiQ+vzqyuoOEZeSIsQUNj4wgx
 dXoOgK4+TFowlpBfpXmkSTDXEkjzgrUNoN1En8p3AqwwsdZA30F4icRv/nwv0thdYZK1
 a05j0n5c8QlPImK7s57Jqio58823PGAJcq+S1yNN0/w2wVbDN/bynFgsrC5e44xmLu7x
 Aacm9GpNEPqFTTO+v1M+C9kuPUBDMHBoPoCsTNgSjvcexHFZWWNk3hIBD8Ne/uFlnab7
 /Yow==
X-Gm-Message-State: AOAM5311Ujql9YpaURSw1pCKEB6wpw6x+Z3IUKolor2p/bmgKfnPhzrM
 RG4+6ooK4EHuNUpAQMnW1cI=
X-Google-Smtp-Source: ABdhPJxlQhY9hZBU8DSNJ2pRRuIJvNc1Qgl1KnYHabKy5rGCRe0QNGaaH6fat8apwejStrcwnpD5Iw==
X-Received: by 2002:a17:90a:1190:: with SMTP id
 e16mr2497504pja.110.1619155278782; 
 Thu, 22 Apr 2021 22:21:18 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id y24sm6238825pjp.26.2021.04.22.22.21.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:21:18 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 02/15] net: ethernet: mtk_eth_soc: unmap RX data
 before calling build_skb
Date: Thu, 22 Apr 2021 22:20:55 -0700
Message-Id: <20210423052108.423853-3-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
References: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062258_675401_4FCEE027 
X-CRM114-Status: GOOD (  11.22  )
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
