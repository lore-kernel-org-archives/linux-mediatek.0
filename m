Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FC7FF885A
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 May 2026 03:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bdq1ceputFrd5lb1OAnfe46lFGDJ7zZ8wPiQreEQXNE=; b=qr9fOzKmPt/7sKJfE/pNEED8Gr
	DJLh0T5cHPEyKn5bHYKNBfYokFSdrne5ztbOOsHcwiNJua/dOjpdeksn5CNwVXYzl6LbV9mIAPAm5
	9dc4nN18EnLVn38jmk8g5xQBeq92xTtVLDkm/VvTg+FfEWqHk6XC7sTRVthzcYnLB7NWJGuitGJks
	lXQopMlh3RDB+oLx1myYOoZhYlX4bEiiGHLvC2btTxKxAaXXsDb0LtBSquy1Vnpdd7jXvA3T27zd3
	dJBO2xgzXPst2Cf0aljSY7CMZVdPD5ukcAvLRWhAhiihJWbvvegzRxfkeI+NjYm1DUzI9fHbMR7PY
	NiAZTwIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJjhk-0000000CEAe-2iDu;
	Mon, 04 May 2026 03:10:44 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJjhh-0000000CE9Z-3i48
	for linux-mediatek@lists.infradead.org;
	Mon, 04 May 2026 03:10:43 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-8b81586dff3so13992696d6.1
        for <linux-mediatek@lists.infradead.org>; Sun, 03 May 2026 20:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777864240; x=1778469040; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Bdq1ceputFrd5lb1OAnfe46lFGDJ7zZ8wPiQreEQXNE=;
        b=J+ozIrd7zqdH8f5M58HEbnEdwzfnqNdfzTBdPP4yWdJefdI0n7nykr0MJ60pbSIqnE
         bANHf9hx0P2yuQhgzkaZ+T64ON8D8l1a1ANnxE/iSkLRiROO9wTORcE/3fi1guE+yG9K
         v6COXLIm/4SYnOYjQ4dFKKgmKVm0B4BOJinr50IHS8n/NDsbmC45bpmA6/VsGTkbBJLU
         JU/tUYbYlkGL6vDiTbKXtEFYDeKq+zerdyB4yF6DOaA7IwFbf1d6bT5aF1iPQS/IDTRK
         FXv+eRTv4KDlZOZfaxJAKpFcUTsmq4EzUJ4vQ+9+MajLQfiEwVvXs3hGuo16t9uwdnfR
         LsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777864240; x=1778469040;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bdq1ceputFrd5lb1OAnfe46lFGDJ7zZ8wPiQreEQXNE=;
        b=l3RCB/B5nCO/QM/lGexc39Ob7SEoXm1GYN9MjlIDJ6qRVHKJZXIwJWX225ZakiAZHR
         Q0RHAnvfCsEL4yhRYpU3TXvoVQgjv7BLCMNwep8okiKtDX4PKwv7NKmkdRPK8yMmUEd/
         ZJN+5A6ZhlMt3xVSqsJ+8ErHb1WB7510FsJxaDjpd3auLl77ev6P+VQO+v2pvWHy1Hvo
         Zh2l2mbfbdog7Rk6WUN4Up/UL8FP/ySEmWRz95y+aMCiO7rWDNl2YpVR0ojANFf1/Vds
         k4go4yQ/N4EdUrA0TGzM1wMOdGCBoATNqz2JmvbuVhX3LGDdX6M956F3+R9N9I3qKucU
         AlVw==
X-Forwarded-Encrypted: i=1; AFNElJ8n/gtHt4vk9Ndyp6plqxz2JtoRErZEt1Mi6Tm+U+WjSMmArob74VIgi7aXYYK4n8vZypgvduV4o7eIDZHz+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6w6CPRucBOn4Ak4QA3kXIaZU1ewPdYkSxsiCuTlIpvpMyjKPx
	W5+tzdeLgRSVfcvaGsgDP/7xx6L5pn2RWpwZP1gYo6/OxK3CmRC7NCeu
X-Gm-Gg: AeBDies+/YuzCqS0853nPrGyUuAmzA3z9V4sbIBkU9i59MfxPY03Cm+RNXMwaRbWr8b
	UFwQNA7sym4S+2wJxay+GTu0eP9rSllc4WfMtqdYEousVw1QSkP3vTyV4ZhJt4eD6Co40ApWzS6
	740q1loEj/qJTTJWUKEJxmw034W9McYv/pSr5Nu5Q0AnzuKJXFmrfeOCXf1b19V09xSM26NM0hU
	Bcl48+HVKyjkTozDZbb8Ayhh079Q0+XBhTLuiyu8XS3m/+vxeQ3AdpdtY66MFW8OkzSxypTjdUh
	mmTKCHhLoQ+2sUEjq9ednkF9WoxdKNBVmpiYf2SHvK8Fb1Dqf5zHloU54xAlcOv+BNNu6+OpT3E
	evxH1mN2TVuWppoxEvxBI5tGZBH/vxdaaLkuv0GYmxu3ZtQRiiiTTsxWkUpPXfFU+mfrG46BWkG
	+8YHGQ/Q3vNCl6jmHFVkhKmNMGPyrTLHGmAGZY8+F0/ThYgYh/wIqWYLH2j9zNM/B11BNdoKKOL
	0FOXVzozsjyy+wq3EDLPz98sTxZM/zlfR/0TMMf7S3/w0+1ooaChkmL
X-Received: by 2002:a0c:f10c:0:b0:89c:de0e:263b with SMTP id 6a1803df08f44-8b6694eb760mr112988026d6.42.1777864239741;
        Sun, 03 May 2026 20:10:39 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b538b1d833sm119089176d6.10.2026.05.03.20.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 20:10:38 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH net-next] net: mtk_star_emac: use of_get_ethdev_address
Date: Sun,  3 May 2026 20:10:19 -0700
Message-ID: <20260504031019.607682-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_201041_955318_9A0A4CD0 
X-CRM114-Status: GOOD (  11.67  )
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

The platform_ variant calls arch_get_platform_mac_address which is only
implemented under SPARC.

Switch to the of variant as of functions are used in the surrounding
code and to get EPROBE_DEFER support in order to handle NVMEM MAC
address specifications.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_star_emac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index b83886a41121..774ecc98ebe1 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -1640,7 +1640,9 @@ static int mtk_star_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ret = platform_get_ethdev_address(dev, ndev);
+	ret = of_get_ethdev_address(of_node, ndev);
+	if (ret == -EPROBE_DEFER)
+		return ret;
 	if (ret || !is_valid_ether_addr(ndev->dev_addr))
 		eth_hw_addr_random(ndev);
 
-- 
2.54.0


