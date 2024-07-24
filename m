Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981D9C3DA61
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jul 2024 08:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oHZ4tckbMHgCkPRX0CWgUyznqrPY7OlancEa6H16LW0=; b=rCd8GyLGZzctXKH962a3yn1UEn
	N4qZYBHcZjf3DRbn540yCDUxPWqeGjE6K3U+557RSqPKZu2aiXQDz5YMhGrsJtrkwQTV9KW3ttbo8
	JQMtUoQxbMHtyB5BUoSPDvP3SX7bZBGh1htosGxU4UXOYpizmpJbeXjm7mdOu6HUAcGDthpPOjiwH
	Nzv3g3uw0SPCdAULN83rMf62mEtP/axhzDjKV25P8kygFZUehP54OG2V8JLp5dMjoDU1+Xg09V3s7
	Bd9xOIHnY21G0E1t+OHFtZlrruE1IdK5lj85FGoLkjAO8BOjjCDvRGrZFsa2oiwVz6b2dnusuzxJ8
	KpdTw2fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWX0i-0000000EiSm-1gKB;
	Wed, 24 Jul 2024 08:06:08 +0000
Received: from mail-lf1-f46.google.com ([209.85.167.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWX0J-0000000EiMN-2Tcs;
	Wed, 24 Jul 2024 08:05:45 +0000
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ed741fe46so7479359e87.0;
        Wed, 24 Jul 2024 01:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721808341; x=1722413141;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oHZ4tckbMHgCkPRX0CWgUyznqrPY7OlancEa6H16LW0=;
        b=T3vrSWVuj5dTbq5OEbYCo5WdZH6ieIkn4olfQN5ROcjQYBPVd0nw1RYp4euoSCz96d
         RZn8mzmIJo6zBcbIeq/5mRRnoV/7eXgxYFhvtirJpPD0X/vg+EU8Mu2e6Tx+X4vZLGI2
         2LyaITrvP0XvRh3CfmeTqL79KEhryYdn7jBaqje9/1PIca5GRDPi3Xo2Cne2epd97QPW
         3/3hBugOwrjO0vv4PDDjmmAcYA9f9J9bHzd1IW5AFC3jRWkxVsM0rAzzBCa0vc20C3Q7
         O8G3mapasIdYKBXCGPwtdeNAJRRuPLKOmiZCkCFILxGvE/XBMp7YmS21jyHrR8fWfnfk
         M3QQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIKvE7PiQsKCv91bwm24WLNDhZ4ocqV1j2U0SOSeVk1I0H5ttK3zQbGUP4Y2VnSPVJj1ZzUv2hnf4pJ1wJJ3UVBmdnMPQfZN6tarShQRFN4QAKG4PoMG+8adr4M74rRs4pOEvnX+I5FqZWEhRmNiptJx2R3Wbsrw8=
X-Gm-Message-State: AOJu0Yz96Famgtm1aqgmnZMkiJvMQB72dU9xls7zLzaD74ZWnLQkZ/n1
	KpVRx8DWgZdhl1WFngJ/DHJ3LEY8QA7bS3ePrmQvXLqItdej/xH5
X-Google-Smtp-Source: AGHT+IGn3jI1OhP6bn56ZLvRBV1Y4cvAt/WWYK4Jk24kCcT86h9PesTBRJOe7jtfVpyw2W4M0I++iA==
X-Received: by 2002:ac2:4e05:0:b0:52e:f463:977d with SMTP id 2adb3069b0e04-52efb79830emr7950836e87.20.1721808340979;
        Wed, 24 Jul 2024 01:05:40 -0700 (PDT)
Received: from localhost (fwdproxy-lla-004.fbsv.net. [2a03:2880:30ff:4::face:b00c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7ab04b31ddsm46320966b.60.2024.07.24.01.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 01:05:40 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: leit@meta.com,
	Dan Carpenter <dan.carpenter@linaro.org>,
	netdev@vger.kernel.org (open list:MEDIATEK ETHERNET DRIVER),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH net] net: mediatek: Fix potential NULL pointer dereference in dummy net_device handling
Date: Wed, 24 Jul 2024 01:05:23 -0700
Message-ID: <20240724080524.2734499-1-leitao@debian.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240724_010543_652522_E0C291E7 
X-CRM114-Status: GOOD (  10.58  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Move the freeing of the dummy net_device from mtk_free_dev() to
mtk_remove().

Previously, if alloc_netdev_dummy() failed in mtk_probe(),
eth->dummy_dev would be NULL. The error path would then call
mtk_free_dev(), which in turn called free_netdev() assuming dummy_dev
was allocated (but it was not), potentially causing a NULL pointer
dereference.

By moving free_netdev() to mtk_remove(), we ensure it's only called when
mtk_probe() has succeeded and dummy_dev is fully allocated. This
addresses a potential NULL pointer dereference detected by Smatch[1].

Fixes: b209bd6d0bff ("net: mediatek: mtk_eth_sock: allocate dummy net_device dynamically")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/all/4160f4e0-cbef-4a22-8b5d-42c4d399e1f7@stanley.mountain/ [1]
Suggested-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 0cc2dd85652f..16ca427cf4c3 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4223,8 +4223,6 @@ static int mtk_free_dev(struct mtk_eth *eth)
 		metadata_dst_free(eth->dsa_meta[i]);
 	}
 
-	free_netdev(eth->dummy_dev);
-
 	return 0;
 }
 
@@ -5090,6 +5088,7 @@ static void mtk_remove(struct platform_device *pdev)
 	netif_napi_del(&eth->tx_napi);
 	netif_napi_del(&eth->rx_napi);
 	mtk_cleanup(eth);
+	free_netdev(eth->dummy_dev);
 	mtk_mdio_cleanup(eth);
 }
 
-- 
2.43.0


