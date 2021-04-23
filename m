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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBDBC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:32:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EC09613E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 05:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3EC09613E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kYchn6S5/D4t0b2rIdocqO6UG2OfvEtFBbU6JZDxuLg=; b=bQQ5E/7r+486dDxC5TSjFgqIw
	OlaceyNJ9OubiiatO9YW7PIAjjo+8Mb3zm0Ozca9wotijP5ajgRC9XlknOrBiDKiprk7VRjRfuxUl
	BRHzVsiVlyxwIjELezJL+QXXekURFI4S1AoZiFoPf/thiUBuALrD83tsGO+Xg8LjSVWtTlrPhtc8r
	NO6J9wSPQtbIoiI+cVvSf0IXHJlLXH2UwhJkCI7u0n2Mby6aPWhF0ejF85J06AHYDMMJBoCH+yb/r
	tqVE2xyGZHbe2kZB+IoTx/YbQoR4ASTkrKDO5Hwj7FDw1qiGY1rK73MfQbMMELeEG9tZkVJvimnLD
	kKQ8Igvvw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZoQQ-000i5h-Al; Fri, 23 Apr 2021 05:32:22 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZoHp-000fbb-5g; Fri, 23 Apr 2021 05:26:03 +0000
Received: by mail-pl1-x631.google.com with SMTP id u15so16121259plf.10;
 Thu, 22 Apr 2021 22:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZjOoYVT7YenRNOA8qc+XyIjvt2WMHLDSuOV16uduX+U=;
 b=U3CLhQ7h0Dxhy+BHEyMa6zfMvJ1QXxRb+OUfRqHbNtc1NYbaDgTwPylzJd10DHemPK
 tgWtd/XNQy2NjW+hjsqDm0i1SQ2Xxp18zBvNSjOCJT+gVK1/N3e9xqszGy2w/QvEDCPV
 jbI7uyGCWysHHK1M6rVrHmh9QaOjHYrQhkRG28spyUgikNXbwXwGtTrm7G1DVa/1Tm3t
 v/LFb26rxLKf+u3Oe7aQcGUrtF5Wo6iJgxezNiAHiVPaIw52CGvzAsHrmqhbkZ1nj9Vg
 GP7J6xfG0yl8mPgav+RxuFbSCAXXbsgrPA7K/DvT1E0Y2DYpVEtj6oi2e3wPIIYUSfsi
 P8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZjOoYVT7YenRNOA8qc+XyIjvt2WMHLDSuOV16uduX+U=;
 b=oNWA3lCQfKee0Lwfqs1TFPDrzwLOsMe1hEW71JjBAPli5KkgbLDYGNoRBuckmitmWa
 /Xwzn9Nj65hbvowgvz8XITix5HLlzbbQHvJQPfQHXcHZlwVxAhbgJbC4IRwExWkegifj
 aAeDxBRFQCd97LLRb5TvdZYgMRBBqw/pqjzVV9KjWLkGyw+HOrRMfSYIUTmGlZfxcShF
 KDaaglBOb59qsNzFQ+3VDSKPEtiGlxMgJLs3tl5CBVSiNUSgVP2hIvl8BVE29S5jiIEE
 sUDNJbjLrk5GbaF7BWihujKHQ422zJV/vERVZbsx9GViKcHhZIH9P3RQL72APurJM2Ui
 UmYw==
X-Gm-Message-State: AOAM532OFkDVE5x06xUGRbp1N1MhJnV4ZrXCim0APKe+n5VON//gXP1a
 v4ptJ5ZiIaUXSQyrgJbMmwc=
X-Google-Smtp-Source: ABdhPJwpbeLxgmvWdgaaDoj1/CFLwGXveStOfAhuLSfGsDI2iAwOKlTiAC7TMO1Pm1GYVNkff3cfVw==
X-Received: by 2002:a17:902:4c:b029:ec:a39a:41ad with SMTP id
 70-20020a170902004cb02900eca39a41admr2348006pla.52.1619155287923; 
 Thu, 22 Apr 2021 22:21:27 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id y24sm6238825pjp.26.2021.04.22.22.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 22:21:27 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next v2 11/15] net: ethernet: mtk_eth_soc: only read the
 full RX descriptor if DMA is done
Date: Thu, 22 Apr 2021 22:21:04 -0700
Message-Id: <20210423052108.423853-12-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
References: <20210423052108.423853-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_062403_322098_B58BC855 
X-CRM114-Status: GOOD (  13.08  )
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

Uncached memory access is expensive, and there is no need to access all
descriptor words if we can't process them anyway

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 6d23118b7a6c..4735942ed283 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -777,13 +777,18 @@ static inline int mtk_max_buf_size(int frag_size)
 	return buf_size;
 }
 
-static inline void mtk_rx_get_desc(struct mtk_rx_dma *rxd,
+static inline bool mtk_rx_get_desc(struct mtk_rx_dma *rxd,
 				   struct mtk_rx_dma *dma_rxd)
 {
-	rxd->rxd1 = READ_ONCE(dma_rxd->rxd1);
 	rxd->rxd2 = READ_ONCE(dma_rxd->rxd2);
+	if (!(rxd->rxd2 & RX_DMA_DONE))
+		return false;
+
+	rxd->rxd1 = READ_ONCE(dma_rxd->rxd1);
 	rxd->rxd3 = READ_ONCE(dma_rxd->rxd3);
 	rxd->rxd4 = READ_ONCE(dma_rxd->rxd4);
+
+	return true;
 }
 
 /* the qdma core needs scratch memory to be setup */
@@ -1255,8 +1260,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
 		rxd = &ring->dma[idx];
 		data = ring->data[idx];
 
-		mtk_rx_get_desc(&trxd, rxd);
-		if (!(trxd.rxd2 & RX_DMA_DONE))
+		if (!mtk_rx_get_desc(&trxd, rxd))
 			break;
 
 		/* find out which mac the packet come from. values start at 1 */
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
