Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2F7C531F9
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jul 2026 17:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8CxrX6ndLjkzVoOvx8ReLw2F27C6sP51HDWvrcv3raA=; b=1Jugx1hRG915c0naVaWs0uKDI+
	TKS2zMJPWWP1skxC+Af8B96S51PCQRHZs50L84AzbuS6AqeaIyClS7j6LaAKQzXeUPZxR3qutHdqY
	ybX++K2RElq8O/ZIgwcu9chvgIUFDxLc12kuquSbUGUve1GavQijb7h+l0KWjN/znmVcDIbL4k1PP
	GpCQIUuyb68xWwwuKZroZqonwR/cmbGHEIvhWlneuhT01eKg0J15wO8Qr8TyGLJA3BvSbMM1GzuBE
	/iY54PBGsiqivlhPgcwXQuZuCvNTVKW5iL1ZoxVOg3wpAmEQmc9wv15zGFRSj/VwFcKS5jcxNXi9g
	DbpO3X0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJaM-0000000Gw6S-0Hl8;
	Fri, 24 Jul 2026 17:21:22 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJaE-0000000Gw35-3PBa
	for linux-mediatek@lists.infradead.org;
	Fri, 24 Jul 2026 17:21:17 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-38e3efab7e0so555566a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jul 2026 10:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784913674; x=1785518474; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8CxrX6ndLjkzVoOvx8ReLw2F27C6sP51HDWvrcv3raA=;
        b=ZdxhmTpw8VkSqOfdN4ml1IEL1xAXoKFaGX4QpfdfVYkQ7n5xrlQ9QXZMF1jw0KWypR
         En6ZMpJcjsrWTjZG5o/2hvnrSF2vAOhTQq4Jdo98QkcTjOLFh4QoabJQvI7/HiXsa36Z
         KFCfzMEyaqtekLlflPsob6CZi03D6i3Nm8RK45uR6GuqdMgM6KhcscBoY9byJhb6Q3Wv
         u41O6UkArjzuM+TcXpNxErMGupNtKlpfiWFumk/WXkBaorMBFzCSauuP5PMgJEwXj1H2
         wE/3O2ktzXu21afqtKsdqXZ82luBdSNMluoZtwVLJiBEZHIIH1m7uwLY8AIdqimpkTur
         BVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784913674; x=1785518474;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8CxrX6ndLjkzVoOvx8ReLw2F27C6sP51HDWvrcv3raA=;
        b=rsXzNSSonnxVWMIYoThsLiW90ebEQ9bOdiILMgkPJNiZ61v39NTlgZ7nEKIj0I0JZg
         8W14VYOFWU+K/DDPstJ9bTiXBc/jztoXyI2Y3NLgpv+gxUU+VkujvLmat0XSnSSL/hNd
         bCBblB3+4Xuhw9y9spo/ljkKmtjFDJgpioU6Xos8pFeNtgxmCGzaHlqLGNG9EZN7IKXO
         WYBBEb31ezN8OzpFAUUcshPcgDfuVQdYd3C9CCNlttfGGQZkgv0g5AyGPixZAOgT8JhA
         7V7OuTM1jPBa8z82FQjjKScpaGEN133omigMtfEYGFVKYmI+ByGxFvMMrYXJib6JUwVg
         kI/Q==
X-Forwarded-Encrypted: i=1; AHgh+RoSZ/6zocYYt8OqQz2I7qHvfWV2nztY1G3oveJu951KIystFbA8yyUuKqV6l7jPbUlzCjRwiyMP8SAr1fMkrw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxr6QYczNjYFgYC01N8MsIQJl9M2fpTuKztx2uz9KUAU6LqRn10
	m/9OcPnr4Ceu3ex3ef1JdBNF2JvLcfkka+EgKISYsOdh1htA/r7wrX/lmX7Xq/FN
X-Gm-Gg: AR+sD13DhavBJR57yWnzWlSlBYjs7ASmhXv7l3KUX1w37/g8HoXDA2sCKp77xkR+y3R
	oR9dlftkT96cuqclWyfiTZaB/uHsEpfe2XhBX6QjA4qhxIO33kGYcLysW5id4vaasGe5dVY6VH5
	vsmoaTfMl54Zx8yVN4VJlC8idS2/hJLC6NA65ycMqUcbQksVpl1kpBeDKYy45el2xbzOjzYCuQU
	jo0n2NkXCVbxP8NYTT8Tc790iF73qERXsjwjiw+crEnnAN2XwL/Lwun38N989k94h3VffwqTvl2
	Wqh2oetc/Bv8TofhogXM2Wkf9dbrulLnL1uloYPxyIo/62vueylCJl6wcmBdDZkeZnCYoo9il9S
	gsNAP62KMMoHpH05smPWY5lrK8y+LNw2ket//8imiE+rwfHqQlA/ESqs2Z4tIzAwb15HykZx5Mv
	vNvk8bmlmtd39rnjjwDNwQdNTirolQFAKJwl3DwCVKQBU=
X-Received: by 2002:a17:90b:55c7:b0:38e:c232:9d2c with SMTP id 98e67ed59e1d1-38f1f9406damr954371a91.2.1784913673756;
        Fri, 24 Jul 2026 10:21:13 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f041d5f78sm1789907a91.17.2026.07.24.10.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:21:13 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH net v3 2/2] net:ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
Date: Sat, 25 Jul 2026 01:20:40 +0800
Message-ID: <20260724172040.1653-2-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260724172040.1653-1-hujy652@gmail.com>
References: <20260724172040.1653-1-hujy652@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_102114_858519_768B6669 
X-CRM114-Status: GOOD (  12.27  )
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

WDMA_RING_TX(0) is required to set MTK_WED_WDMA_RING_TX for WED RX
but on a non-DBDC MT7986 it is never setup because idx is 1.

Setting MTK_WED_WDMA_RING_TX with WDMA_RING_TX(1) is not feasible because
WED still tries to send through WDMA_RING_TX(0). This is verified with
register dump.

Fix this by calling mtk_wed_wdma_tx_ring_setup if wed is v2 and
rx_ring[0] is not allocated and reset tx_wdma[0] if it's already
allocated.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes in v3:
- no change
- Link to v2: https://lore.kernel.org/r/20260711112128.971-1-hujy652@gmail.com
Changes in v2:
- Address warm reset concern raised by AI review.
- Return value concern is skipped until further comment from reviewers.
- Added a comment to explain this special case.
- Link to v1: https://lore.kernel.org/r/20260630144831.1109-1-hujy652@gmail.com
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 7d2775a97fa0..b48abad995d7 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -2334,6 +2334,13 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
 		if (!dev->rx_wdma[i].desc)
 			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
 
+	/*
+	 * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] during setup
+	 * but tx_wdma[0] is also needed for WED to function.
+	 */
+	if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
+		mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc);
+
 	if (dev->wlan.hw_rro) {
 		for (i = 0; i < MTK_WED_RX_PAGE_QUEUES; i++) {
 			u32 addr = MTK_WED_RRO_MSDU_PG_CTRL0(i) +
-- 
2.47.3


