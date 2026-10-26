Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F35260A383A
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Oct 2026 09:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DPPKc7Cy;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HTHsP4Xd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=pSQKJDB3+LLtVeMkuba7ZQK3kE05mQFoDfOcOqN3lO8=; b=DPPKc7CyeIEs5q
	NLBGGZsSeML2uBX2RKeVLUVH9P/b2k7vnVltmk6Awo6leXEVMaLN07DTZ3wFiv0r4y7LbJaIQbQNa
	7NGzFavrCJ3IwLEe+7BALO7JbIocR3KkB3u8x9j7jfXV/7VCj69n5+vyUH+EIrLoQdRirzEwonJcT
	q6Am0S4ThBGxxQpA093zPhUUBKCqxA01Bx2zTZXfMSmtuRW6oRHRjAB+Wo4v2Pb2U5JJUGk7aJtIn
	Ge4P2kWUzmMQSliCjNm+8FYzB8gdPtWmJPwcB3ZSplv+eIaFbbMJfT+p9ieIEd9njpegsNjyZh4b+
	YkkQWNedHI2SsycuhExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHT7-00000002AFK-0TdS;
	Mon, 26 Oct 2026 09:58:17 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHT1-00000002AAW-3yTu
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Oct 2026 09:58:14 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8a05effaf8dso1822082b3a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Oct 2026 02:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008691; x=1793613491; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pSQKJDB3+LLtVeMkuba7ZQK3kE05mQFoDfOcOqN3lO8=;
        b=HTHsP4Xdm057bpmSHfnaa09BrZYETt5dAU4SBbdaSgN3/x+glK/0xzsTrB5DOOHUjp
         GJKU2cS+AJnF4k8pDApQBlfUKWPVOLEM88SDNtOwwghZxEn4ci/ntS61zVv0/JMJoior
         sXH1socDZT5s8RRBza2kmo/FwuivSx6zvAoy335+yK4tKhl15+wb/tTjToGa4huGqOPC
         BD0lYZIaT82F8lFBt9+hSmwy2l9PtDKK2DKUgCS/dvxfv4azjIAUD8sv6/fG0Ealy2kL
         cBWeaF47CSp0G0cIvqKBhm1LFmwiU684KSYT1sc9jNAhm2g6FTWZISkhuIV7nA7Ogbgj
         gwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008691; x=1793613491;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSQKJDB3+LLtVeMkuba7ZQK3kE05mQFoDfOcOqN3lO8=;
        b=agfHyv9TGDti4lxzrvvWyokv4JE6Wtrd6GNpbNmQkQh0aAev1iLh1wiM450k1LX38o
         VpcWXLCwhP6jbj60DyCJtnb61HzPtdCt/yS2GI5N67tMXGpfPBmTtHeVA2FofiRqIahm
         c+0afq3sZT3PyZaFJjn/zr4crtUtZDRI//4pk5mMR43MW84m2g977+nv7HqX0pROnO4N
         CG92yjBjmMOQupFHCC65l5i2cPpIFBv3ScudPEFfz/2YzM/JAGVNRQf+Ki9y68Ve7fev
         Y4Lj6b7MTkkc22FDoDIT3CSI4zObxfCnESOXlMEF7kSS4JnS6r5YEPnwiPHE9LdbZw3c
         6kug==
X-Forwarded-Encrypted: i=1; AKwUvBwZWakCATeVqDaXIL8R4w+UMDQqfJsb8NiZy5RSWXN9jej2P3T9sOdyTS9VPtSnHWStmziMrWlw9XCkKqotSw==@lists.infradead.org
X-Gm-Message-State: AFq9FYLMRmYivgIoq4GQ1cFvVrrJaZMF3hq9lBBtq7RIr6nnG8DLhxQx
	TSd2qx/HTgXtGQR5L12Sjpw0r1Swc6bCHsY6PnyhtIE3/Ydpf+YOcYjhGdPFJpPO
X-Gm-Gg: AYBFou0mnDdKgdyjfr2VzKtY1AaUAwv7IsEwv4SUD6yXy2ZcSwXaWWtfPdpR8GHsyHJ
	wRgLvx8TG2Wx3eocaP9Q4CRnSBYKbyheDoBm0ExlLe7ng5ezbfvty9iteTfIUvbHYjuoGkG55Bi
	J++/d/2zGlt0VFbSHel5ku3OyQ3zO/nDQ+QuSGkf5XJiEOqWIRnlifdIuQ4Of2hn8gvg7bkCP06
	E5wl2RC6gvuMoqM1R5n7Eei1uYgv2SI/Twu7ad+YDmStwklHj+DtbsYrav3CW6ifhx04xkFFaKB
	jToDCcwi54jhAPJaP2NC2LpvD8ZMc7dTeBTWjkVnVppye0zkPsa/Y+5GtST+AuB892ZBr6mGn/j
	libymNpBPhibehuj7dEPXnav2rg0jjU/wkMryOQWPr/c1atHw8NZnSTioED6+IWdU4alY3/lPA2
	L6dqh9GCHhC+6kqLqebUhL82F4x34LW37r07s3aeSwiq8W+rhWE0UPoEj1M2lMI2qDXluvmTtRE
	pFIsum8bek9j09lEnQ08ZuXHtK6Hkze/kIzJaTVgSYU1MbRyLLfv4rkrFDHgC+pZwMXecDldII2
	SCFEK8LT9g==
X-Received: by 2002:a05:6a00:2316:b0:882:359f:ef17 with SMTP id d2e1a72fcca58-8a36715c0ecmr4862670b3a.12.1793008691320;
        Mon, 26 Oct 2026 02:58:11 -0700 (PDT)
Received: from [127.0.1.1] (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36bf0f4dcsm1095577b3a.44.2026.10.26.02.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:58:10 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
Date: Mon, 26 Oct 2026 17:57:31 +0800
Subject: [PATCH net v6 4/4] net: ethernet: mtk_wed: setup WDMA_RING_TX(0)
 for non-DBDC MT7986
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-wedfix-v6-4-a52f6b15d2fc@gmail.com>
References: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
In-Reply-To: <20261026-wedfix-v6-0-a52f6b15d2fc@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Zhi-Jun You <hujy652@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793008668; l=1813;
 i=hujy652@gmail.com; s=20261026; h=from:subject:message-id;
 bh=l74B/Eke0qZ7NU7MKRfL71FgLu3ayn5XZo3xhiO5oMc=;
 b=o/Ca8KCeJJFPtmTThW5dHp5n7J18WnvI/QN1JZAsQxVBK/CreER8FmV3XQT3u+j99fYVg7Bfg
 Ok3/N85CHVsCAkBLu8ly/0e1F8SMpeO4aAGCIOSH7miuuN2dpmBRLok
X-Developer-Key: i=hujy652@gmail.com; a=ed25519;
 pk=uXjqvnRsKEfHEyUr63sOg4fEJIDs4AmiW/rB1cWarXg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025812_287101_59A98EB3 
X-CRM114-Status: GOOD (  13.69  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

WDMA_RING_TX(0) is required to set MTK_WED_WDMA_RING_TX for WED RX
but on a non-DBDC MT7986 it is never setup because idx is 1.

Setting MTK_WED_WDMA_RING_TX with WDMA_RING_TX(1) is not feasible because
WED still tries to send through WDMA_RING_TX(0). This is verified with
register dump.

Fix this by calling mtk_wed_wdma_tx_ring_setup if wed is v2 and
rx_ring[0] is not allocated and reset tx_wdma[0] if it's already
allocated also add error messages and bail when mtk_wed_start fails.

Fixes: 4c5de09eb0d0 ("net: ethernet: mtk_wed: add configure wed wo support")
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_wed.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 3044a7a8ea03..f40ac5794341 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -2345,7 +2345,20 @@ mtk_wed_start(struct mtk_wed_device *dev, u32 irq_mask)
 
 	for (i = 0; i < ARRAY_SIZE(dev->rx_wdma); i++)
 		if (!dev->rx_wdma[i].desc)
-			mtk_wed_wdma_rx_ring_setup(dev, i, 16, false);
+			if (mtk_wed_wdma_rx_ring_setup(dev, i, 16, false)) {
+				dev_err(dev->hw->dev, "wdma rx ring %d setup failed\n", i);
+				return;
+			}
+
+	/*
+	 * non-DBDC MT7986 allocates only rx_ring[1] and tx_wdma[1] during setup
+	 * but tx_wdma[0] is also needed for WED to function.
+	 */
+	if (mtk_wed_is_v2(dev->hw) && !dev->rx_ring[0].desc)
+		if (mtk_wed_wdma_tx_ring_setup(dev, 0, MTK_WED_WDMA_RING_SIZE, !!dev->tx_wdma[0].desc)) {
+			dev_err(dev->hw->dev, "wdma tx ring 0 setup failed\n");
+			return;
+		}
 
 	if (dev->wlan.hw_rro) {
 		for (i = 0; i < MTK_WED_RX_PAGE_QUEUES; i++) {

-- 
2.55.0


