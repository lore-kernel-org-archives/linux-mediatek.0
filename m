Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C11C43458
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2026 11:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RsxVtJ3F9+zJOkJQ6Hk1HPdO5PzPQX9X5kHg2GQ5Qyw=; b=XRN/EdUD2Np8pAZ8uagcyW3geM
	v8taoHlrLJY5aQMEMFNkC5kgv+472uWoIJzEeI39UVr7EqW4vQqk4cRPmz+BpX88Lqyoh+jdXCkLH
	GymY8ApWrke5gItfN7j8lxqX1YIaF7fvCeqMIwE8qLoqjvjGBG8rhDbSDHHs9lnk4ztwXY61OrtYh
	n+6sYLocqzKv+QEtOzUWU7G08ZQxBteuWzupsJb0hQbry7wtktq8WaT3ZLBG5y+jc+n93gZmD9SRt
	TS64xTEChbWlo7iWR7N2PTPFwRj5fZR+ocUS2062nBoglYjB5e2IJV/PYUoVYbHp96L4FbfDEcm5K
	2oDQwtkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiVmT-00000006ULW-1LLE;
	Sat, 11 Jul 2026 11:22:01 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiVmQ-00000006UKl-1CrG
	for linux-mediatek@lists.infradead.org;
	Sat, 11 Jul 2026 11:21:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ce7d2adef4so22711365ad.3
        for <linux-mediatek@lists.infradead.org>; Sat, 11 Jul 2026 04:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783768917; x=1784373717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RsxVtJ3F9+zJOkJQ6Hk1HPdO5PzPQX9X5kHg2GQ5Qyw=;
        b=JaneEOaZeMSOylWJhLI7Jzul5Bsa9zx3fGILmrVsdr0cukGfSgqYfnKV08HmXMoiHu
         QJcfJzxJV46NWIt25GphcXJR7lPKRZjwHjTs3vptdZMieT3li7DqPbimDJ/2ffrnsKPs
         64fgCmCfHCQMqmkBPjY9zyl/G055ypFoYjFQ2Fet/kcdTvJTgQLp4dTbG4gJmS+9OCFR
         pDw/mCiAR2JLqkulLzmw//i2Wh0n15UAyycOfqFgQyIIAq36KgIZv/GBJetrLP1xEZ4M
         1KundQ+h/TnQbUWourBHde2xSGxmMwsSOEPj2BTQL5Q4TTbDx05I57uKCgJBmMnmuXH9
         yxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783768917; x=1784373717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RsxVtJ3F9+zJOkJQ6Hk1HPdO5PzPQX9X5kHg2GQ5Qyw=;
        b=GejYm+2oGDtLwJb49cOPRoJaQ9PjcIZcnsWbyVDFDRMF7DXldUAyG2kFUnp0+7zW8A
         5fxwVxVbDeVi2cNB8UbDraX5i/9TNfaKScmDF5R2BPR50Wt2gtdIFol48FPZW5YPwY+i
         BbWtLpl+RhB8wJ9X3y0NAhrLq42D4kx8K/GhwfAsQ90civeB6DK30oGJshAXHj0UWOPd
         zDb64pq4MRaUe9V3/TZH9/zW4TWqzeZXAIU+/1Gv2w4XuirF534S0BZeQ2guirrYr+Ym
         EAySzq0tT+Ez640GvnnA2uFWNxu4yc0DEkEwJwNqeyeVuzeS/WZfuVwjQeRoDB/M+4Ro
         2Ovg==
X-Forwarded-Encrypted: i=1; AHgh+RqvLAXHa5UfmYNZym35Owy9Fs1Mtra3vNbk6PqAqy0jqzQHqvWWA6G3YjfKoWFXIeqEibIcx5Ax1IvFDo2Xmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxT+UWWvMLNa+UP2xZLgc3AHF1vMJjqrub7/Bld3BvC2hDeH/3
	R4HMVph1z2SERaeq1LXZsQiNqdM0T66ywf8N1aAGARjGgNzUP9KnUTP4
X-Gm-Gg: AfdE7cmgLIuMbscd+Nx8xQTXK5ChRLQovZLs1MVusK7RBZVqPJpXMDZLlbyvFExxB6x
	VIrOdKN0s+P+Mxn3gjmuGmxDs8qOF7UQUgFdaO6SVBldUz9hgtTFDcS1neExaYAOC4BpzOFHyIE
	80eA8Y7B7nlmXbTaS1hekpaio/DOkJnlSXK85aN73Yg4vC1jOFwu21+kopvB1Bt9ZgTDvrFp+fv
	MWlLPNWSlCied1ID2hzkwKVPPTTrfE/PXnJVpeDOBx6YQiemA10bBjBDYXwCfJtVAQpZiuQasPW
	03CMbCrJvt8UiAY22N5niF+6Ca7yIxc8B3LGh+s/FpO479jx25oMYIcUZGWe5G6hFNiJAOXBkO7
	8d3eFxEsyT1QrBcEKfV/n7oo69OSUtKXigJR7C5gslZM6Hb/cDAagYQneaPTl2JOgTY0c8uTvei
	mUzpRMV/GvqmLAIIXpHBSEymGgarBv1z5t8mZ4DdxqZBcJ03UkqR/jUg==
X-Received: by 2002:a17:903:2f88:b0:2ca:b8fd:1a8f with SMTP id d9443c01a7336-2ce9f044760mr26086835ad.39.1783768916739;
        Sat, 11 Jul 2026 04:21:56 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c21429sm73254255ad.37.2026.07.11.04.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:21:56 -0700 (PDT)
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
Subject: [PATCH net v2] net:ethernet: mtk_wed: setup WDMA_RING_TX(0) for non-DBDC MT7986
Date: Sat, 11 Jul 2026 19:21:28 +0800
Message-ID: <20260711112128.971-1-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260711_042158_381309_61EF37E9 
X-CRM114-Status: GOOD (  11.28  )
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
Changes in v2:
- Address warm reset concern raised by AI review.
- Return value concern is skipped until further comment from reviewers.
- Added a comment to explain this special case.
- Link to v1: https://lore.kernel.org/netdev/20260630144831.1109-1-hujy652@gmail.com/
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 10d9beaae372..3fd704cac02f 100644
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


