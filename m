Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5001DC43327
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 14:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FTJrhxBEl3twqdJgMl/PY4mPnQS4A0KwvpKQuTDw05U=; b=iwiKw4nwR9wu+XmiPTqYh/OPUR
	vUBrm4YENtHeb2foy7Li346+yoJEK4SGkyWfs8rFzsMfBL3l+u8pfuibon1tMzxlXByyyl1fr2Lfs
	kfgW8PDHLLg7fCAvIBOEhDqtPH1LbdM08NV9nxCWRHXG5c7enCsofGwOO3buMKc5M2J2HTthlAhfR
	Jftn4XS2haCtniV+Td5uDm2FNyeHh/NgVtHn1HbRkyYFdLbLJwrAXjP0jxH0N2c0TdxsvV4N0v9ja
	Co60s20NJt8HzbwQqw7os7IayKzcmKsY4fG94x7scw1dA/CzkEEw7E5dZJ3VItO3W17aClTdLk21t
	VMBFvlKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZlQ-0000000HImP-0GTs;
	Tue, 30 Jun 2026 14:48:40 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZlN-0000000HIlq-3VgH
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 14:48:38 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-847917c3678so315376b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 07:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782830916; x=1783435716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FTJrhxBEl3twqdJgMl/PY4mPnQS4A0KwvpKQuTDw05U=;
        b=kf08SinUsgJuQbIu6vytAZZWR7ljzA7JU42SktUIOcs3Gf07dyrpO1BOv0d2iM2GoZ
         EVcdmLZP+F2AaC2dTY9yQTXJy1LDBZT8kNyN53nfiZLa1VgJnwpXc8oYgaqI0Ws00sG+
         C1QMuZqKVIabKqzxW5elF2DZdG5lN/a+gF1sNMdJdy1Fypev6IDCVeD8krkBKNoMm9C4
         2Epe6xfy2rXYKjk/eN8gK2Fs0WS8YvCpUqMvaJDrWXmVPFeroKUuhIwSXJBoW6dpOORB
         djeqAFDlGmpIJ2xCAMOvGfo5Yz44RUiK1PTz6AXa2TdQ2BeL9mK5hwJihC7vuafb9Wue
         d2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782830916; x=1783435716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTJrhxBEl3twqdJgMl/PY4mPnQS4A0KwvpKQuTDw05U=;
        b=lA5nvvSOUz1/2AHYG7glUKeH3KKgN/5hNVcdQt28Y0NIGpskYHc1Q+eogI7Gt2Np5r
         dYlXxp+gf9cjC9tmWwu0Ql4wKdzTwYychZLWXNs1uR/ow1/v328lyPr0LjrGDh/dqyxI
         wbOK8qkJvqtJGCXJEz0ez9CRsRwkv1ZNE1aEVY6M6ZwKLbQ5PAgXfnKXvFeCWsXxFmHy
         ONdfcNWC7h4+cKEY7FHCNDaTUctWeqi02yXDnQw5qZICEMokUQyGvdNvMtQlT0RI80ie
         cUnamIDpeZ/G/Wyvt26GkzjyURhlyb3/s0v0rRUXvUlP4YYysFmfmcSriqNxSAaaG/tv
         FK5g==
X-Forwarded-Encrypted: i=1; AHgh+RpAbVfdll+aC7EqW1D14Vy4ZM/aGisYhhuQmk2kQzxnD/EO+pWT1kh/IVL3zfhTiTbTSi1PYjoDTVKtDg4z3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqSgL/51NlceCvCHHSFDk65qOgGHv3ZLbMhVYlEqqC28TtKKrV
	8EWtGtaUE+El/BpLaMqXrzeXDKqmUq+qpABP6GcHTTUm/X4Ggc7rXdLr
X-Gm-Gg: AfdE7ckZ91s/RpJgEDMrjtxr1u7r0rPXIvoONyfHudfXyRrs6ZVftCZCnzaMTpCtZIv
	YkEnm28KxWbFGNg7SPUh4t+XnlGbGPVZT2B1aUiHndC5d2gZVrZZhkqKEO+RqfXpojoFDdXzkN9
	9vk665vsjl14yURuiZWZ/+lur7gjBL+IJlB5IoWa1zE7dTPd1ziAuhXhDJ4NTeyyb+dUoDVsUTj
	iV4dpVS7XlNxfe0SwRebyW5ocwdwM1v9cYg9SCYdzTkL22ICLAj/iywlaOkykTr86QjtE4UH6HA
	y43Aa/h4R3MkzuP7+H38LLFOnX/mgl2oTeUYXgk7c59dhMiGex48oDCdd3QPlNTF60agyIskor7
	Hcn1iqm23Em0R7ijYwb4IYDNlsffYpGs5br/AXcQF0Vxji/4ONpQEeWcFdlsfXi/JbK8GGkHoYQ
	w1Z21ZjiLT9vg5vX6iXkDApBcmg9C/AY25ILd8ncE7gzS5zzPuQOHfVg==
X-Received: by 2002:a05:6a00:85a3:b0:842:dd4:d9e2 with SMTP id d2e1a72fcca58-847a7ed202dmr1411685b3a.0.1782830916332;
        Tue, 30 Jun 2026 07:48:36 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03a6fcasm2220480b3a.58.2026.06.30.07.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:48:35 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: lorenzo@kernel.org
Cc: nbd@nbd.name,
	netdev@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>
Subject: [PATCH net] net:ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
Date: Tue, 30 Jun 2026 22:48:31 +0800
Message-ID: <20260630144831.1109-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_074837_878884_4EEE7C72 
X-CRM114-Status: UNSURE (   9.82  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

WDMA_RING_TX(0) is required to set MTK_WED_WDMA_RING_TX for WED RX
but on a non-DBDC MT7986 it is never setup because idx is 1.

Setting MTK_WED_WDMA_RING_TX with WDMA_RING_TX(1) is not feasible because
WED still tries to send through WDMA_RING_TX(0). This is verified with
register dump.

Fix this by calling mtk_wed_wdma_tx_ring_setup if WDMA_RING_TX(0) is not
setup and guard it with mtk_wed_is_v2.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 10d9beaae372..2420557f6c96 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -2334,6 +2334,10 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
 		if (!dev->rx_wdma[i].desc)
 			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
 
+	if (mtk_wed_is_v2(dev->hw))
+		if (!dev->tx_wdma[0].desc)
+			mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, false);
+
 	if (dev->wlan.hw_rro) {
 		for (i = 0; i < MTK_WED_RX_PAGE_QUEUES; i++) {
 			u32 addr = MTK_WED_RRO_MSDU_PG_CTRL0(i) +
-- 
2.47.3


