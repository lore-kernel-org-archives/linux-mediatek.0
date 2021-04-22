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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3650C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:12:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5194C613FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5194C613FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o/xZGoCH/ZMtsmpvGD4lZKM5q4WxGGFK+Y6sV8F+bTA=; b=ntV2W4NxBGu3M282gmMGGVvvA
	trBZNL7JrelfQYT+pGuRezZ4sOQXpR5ilFYNt9mgM7OuoX7yV/ZIxC7aXDolyqW13zPKrBSzqYMdQ
	CaEkauluW6IXE48+YCqXcQVA18ohTyxHiSx+1HBEMFmoMeNpily5leyvxEc2AmnqxsSW89ue1yHu7
	eYcpyOOvps6SUUFk1AA/58cCjIGzcI2XWT0M63bGgJAx1d8opGOMj1Ptk0Desx1ecFs2XJ/p5eRmj
	OZkg6MAYPBg4coH8by27SUKhQ4ysjPJuR1BL3zN+eB+KmAt6gEsFr0iKDpYV0EW2AFPKiIAgbOD1J
	EkO8rhUNQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQhH-00Fm5Z-Oq; Thu, 22 Apr 2021 04:12:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQew-00FlR1-Vm; Thu, 22 Apr 2021 04:09:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=afUBNnLCnALHd7nnFx3FLIxkkAO2cCALl7BKYrqLlkY=; b=2t+3D6vkI5xI54aTmS28+GpfNd
 rD5b15m8eFLyWTeWtbcWPp2f7kQq1pZHBTZOTCxUz2iXvHO+WsM+F7WMOzuhaCitV+16sfgim7jAg
 l4gewzYVa/6qTe0JKtoV+W9mqK91lHOo3VcIIKJmiu9DBad5fvyXJIbCMAQIVXXenhkbwLiDPrJSY
 14U8mp3rS03hFfO4PsEIl3aVJk+xBA0MX4LsjzrV+ZPSq2xDnjHCJe0KNmeqq+m/UaQ9ifCeaadE7
 m0AAD/ea1cb62miaHlZagflPxg2YrOK21J4tIkV1ICaujK2sP5441s68XqAW5qU+oHHyavQenbUhP
 h6tPJnSA==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQeu-00DLeh-IK; Thu, 22 Apr 2021 04:09:45 +0000
Received: by mail-pl1-x630.google.com with SMTP id t22so22517709ply.1;
 Wed, 21 Apr 2021 21:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=afUBNnLCnALHd7nnFx3FLIxkkAO2cCALl7BKYrqLlkY=;
 b=NYPusNMiIJkw5Pdj0XLU0ZWAtBJ0PRpny5fTeVCaCzLnmSQcEDHAq7Vi7RNZjCpNTQ
 I5AampDypMlwhKH63+UIQ9Rqo0b/ucLYFYhkqmpcZsvN0/tElVkYsN0c4svAcDAHxaZH
 4y8FzJ9y1M2kNkuLvnfpGPkgqxcOJ2VAIjBdBcHb7mwcpCShQdGbUKnHrJtWkteMN4IT
 w0NS/kGQzmcUKU0MKLeAUh/x0Bih+w1G8WEM+2c3MmDaYDJKoJvqrQ0XUsWFC6iBdpKw
 TcVeoTYNjvy5iMlkQjl2/duH/+wQRLDvC3YQMzrCLRGU004SfgDZs4LUh6xvY9khhGJY
 89PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=afUBNnLCnALHd7nnFx3FLIxkkAO2cCALl7BKYrqLlkY=;
 b=iWcn8Cjstza4nZo12PJu1xjYhr6KGDwN6wDT21bCxQPqV7FE95yrGnWn0XXYw7CR+q
 jkMmSKr7QcicmHx+NTw2qrweeTcJH7xQUYe8o0WK655cZRwyu8In9R0rz9+RN+YZw66C
 e702joXEfIpESlrguL9uOTbN5YpRtHLHdyrngsz/1TPFtcBfwpkpqgZkA4DbygrWb3H9
 T+UgcaDzWMEXpglmnNrbVcZVLroYnQa86q7FgoZK/wPHMwQxicb/JjFbr/Hqk4NhHnu3
 6CuzQXHYgiLJDPslFBw1M6j5pl+Xuv76DAeE4/sLOSC4zO7O5LwYa/Osjgqmb7YMAsGi
 +yeA==
X-Gm-Message-State: AOAM532fsfzbX5Lmk9IEah/QKT8CHt4DaPWuuGrm+kGPodGap9Q5MFAv
 ZaZchLHVWskRbvZDE7nOcyA=
X-Google-Smtp-Source: ABdhPJyT3tO2UDDnQGbg/SV0FqbB8c0SOkNZA3M1yGxzusU3coNCVsdmTqvxDM6990gfNcEuqYSXXg==
X-Received: by 2002:a17:902:e34b:b029:ec:9a57:9cba with SMTP id
 p11-20020a170902e34bb02900ec9a579cbamr1505555plc.56.1619064583871; 
 Wed, 21 Apr 2021 21:09:43 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id i17sm635354pfd.84.2021.04.21.21.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 21:09:43 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 08/14] net: ethernet: mtk_eth_soc: increase DMA ring
 sizes
Date: Wed, 21 Apr 2021 21:09:08 -0700
Message-Id: <20210422040914.47788-9-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_210944_624945_31923726 
X-CRM114-Status: GOOD (  11.72  )
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

256 descriptors is not enough for multi-gigabit traffic under load on
MT7622. Bump it to 512 to improve performance.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 039c39d750e0..4999f8123180 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -22,7 +22,7 @@
 #define MTK_MAX_RX_LENGTH	1536
 #define MTK_MAX_RX_LENGTH_2K	2048
 #define MTK_TX_DMA_BUF_LEN	0x3fff
-#define MTK_DMA_SIZE		256
+#define MTK_DMA_SIZE		512
 #define MTK_NAPI_WEIGHT		64
 #define MTK_MAC_COUNT		2
 #define MTK_RX_ETH_HLEN		(ETH_HLEN + ETH_FCS_LEN)
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
