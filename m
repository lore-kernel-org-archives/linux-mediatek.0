Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DD1EC433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:32:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEB9E613F2
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEB9E613F2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vAinbMZZ3UXUWvxSA7JO44P+fVJ1OHKn2kUMLCerUkA=; b=IK1nilqMJjTHGx00jsh9hCwL0
	L8I/S+SIIs68es+r8CRsQO1OA5h3FwdI7AmV546SnZH4u6e0R28vRRqJJU1ulegW3wN4sABSBp8k4
	pRhX909sRYGvm3TJy/d2Qg7dwhXCxMuiDv3omglDmhAEPuHsLKVw8y4+E8jegQ/PeOegEagG+DDli
	0WHaCFIy5RpYSTbY6GwG9aCZZy0tQHAasC+2QqgToB79Y2RQ9hNJ37HkFW4O9OvNo2kCibb9GuksP
	brbxF48MauUPwUJLFgU2XSZV89flLe/mu6Wgj07H25jC2STgh70hhebNe3m720/uO/G7fxgo+dSKV
	nt+lQpgGA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoQC-000hww-98; Fri, 23 Apr 2021 05:32:08 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoHJ-000fZN-CS; Fri, 23 Apr 2021 05:25:23 +0000
Received: by mail-pj1-x1032.google.com with SMTP id
 f2-20020a17090a4a82b02900c67bf8dc69so586773pjh.1; 
 Thu, 22 Apr 2021 22:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DV+kp1wpYcIFwJoJv9jeN6J03GSNSld+/Vb3IzRQLm0=;
 b=kGdqEK0YKXp9kFu3y7zjOBoYMHU5Ol8fp0zyDUkeJywlD5sRdudkYnSwLhfTLQMesg
 f2eNxWiHjMmZnLl4dtNbjrEmuIeoC4icA2Ao+ZxS9uvDSPiEl5vl2U2EXfeNaiJSS8Iz
 oR1wSsMucTUT+WIHKdKYamWygZMA6AzIPBqXNYOyskgT6Wecxs4+9rD6r6dHZDakFKSk
 L4zm5UDgCEOicAklt9AbQYH6M6Y1jrFRgu1mh1Rzeid5AIsMKXCxT5x3+2wUK/SSZ69C
 gElPReTCe2URmu5lepQRz+bOpUKGarsGeZJGHQvIZmIulnon8ZNFR6kbYzlzAJl71zvs
 2jMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DV+kp1wpYcIFwJoJv9jeN6J03GSNSld+/Vb3IzRQLm0=;
 b=KzL37OpmhNnQDs0qvOyPCMD5mWH8BbfTonS1Yp6uuPZD4OvQYKZCVfXXAppSZW4CGT
 L0qcTu32oz7rPZ72ZUAhLzmMYjXLZklcdNju7xy/50O2QVBLJuvXRfdoyNHM85C68mUv
 g2QtRLGhYUA1P70CpHFmvKzxjz5CBeBGiVgFJ7LkowX9NHNZZX7lhtHn2THb/bPseeDj
 YRkagkA+r2BDk2/reRUkGC0QFjLnhZqJ6BB7bElgV888yrDn+D9wMl2C9Cd2FyP9zXFm
 fpejQJXnmZ++1a/vbs6ZuByItnZTwYmQa1/TGjhGkZwGXPwPZp2WUVhVEyH9ka0AsT2J
 HJsQ==
X-Gm-Message-State: AOAM532W0jJpUDttvi8TsCEU6rFzKirO33lTTA3sH4e3v8yCelLFBmxK
 5ANDyqkEIVaUsGqnyJDmZoM=
X-Google-Smtp-Source: ABdhPJwKi6H4kjc+Ur+ZaInetv6Q+x9mWcW2c/9xBF8znlsl3EvesadpGacIpglSKsHSuNgFUeehyA==
X-Received: by 2002:a17:90b:2305:: with SMTP id
 mt5mr2562953pjb.198.1619155284334; 
 Thu, 22 Apr 2021 22:21:24 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id y24sm6238825pjp.26.2021.04.22.22.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:21:23 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 07/15] net: ethernet: mtk_eth_soc: use larger
 burst size for QDMA TX
Date: Thu, 22 Apr 2021 22:21:00 -0700
Message-Id: <20210423052108.423853-8-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
References: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062306_981427_BB8DE9C6 
X-CRM114-Status: GOOD (  12.06  )
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
index e6f832dde9a6..645360cfdfe9 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2193,7 +2193,7 @@ static int mtk_start_dma(struct mtk_eth *eth)
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_QDMA)) {
 		mtk_w32(eth,
 			MTK_TX_WB_DDONE | MTK_TX_DMA_EN |
-			MTK_DMA_SIZE_16DWORDS | MTK_NDP_CO_PRO |
+			MTK_TX_BT_32DWORDS | MTK_NDP_CO_PRO |
 			MTK_RX_DMA_EN | MTK_RX_2B_OFFSET |
 			MTK_RX_BT_32DWORDS,
 			MTK_QDMA_GLO_CFG);
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 875e67b41561..83883d86b881 100644
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
