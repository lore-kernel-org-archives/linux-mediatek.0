Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D682AC43219
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 19:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ieiAxhifSMyQ4MxSnOsIKCi9Eh84IdHGfPjBjh2Hno=; b=a8evwzFDLPJM6vVwTwefe1f6Dt
	cWiyiNvtEeS3RVWB57QV66OykblcTJDL31NBEHFt8p9CJPfR3uWiAOiWv/17PsNIrUP8nRLdI5J/Z
	ryMYkN7cklfvHrwyjpMt5Dbc4OzL54z1sRwVVTHfQUHC8xbol9fnT7RP2/kBRhQW7jUodY1fzpEqj
	FNRFmeqdMOc0gF3WX/+RlZKRy7sGYAJRtif8MhrgtDZxq0shtxU0aFltxWLncOpsZnh5hCjg5zsyV
	jdepMjGfGfFm6mjiENqzVaWFskzgvSRy2dAsRHjMW9aDohmps1SJ4TtXD54cO/MRmIvO7P15xUEUW
	332WAaJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7kz-00Haw4-Lp; Mon, 07 Nov 2022 19:26:05 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os7kn-00Hape-E8; Mon, 07 Nov 2022 19:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
	s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=5ieiAxhifSMyQ4MxSnOsIKCi9Eh84IdHGfPjBjh2Hno=; b=fh+rYeK17i703PklQYs1GnZj8Y
	f5vZfagQdzCt9wXjqfxtHNlZIdAM53JDmm+IwWUapnaFa4G6gsdpTOpbgj6ZtC11spai+rqg8ir6l
	jNiDa95qAoAoe/9Ydlgi2YCvzf8hPn5twSqDAP+MxbLGHFG63nzZ9/RTqm8v68cWJXHU=;
Received: from p200300daa72ee1007849d74f78949f6c.dip0.t-ipconnect.de ([2003:da:a72e:e100:7849:d74f:7894:9f6c] helo=Maecks.lan)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
	(Exim 4.94.2)
	(envelope-from <nbd@nbd.name>)
	id 1os7HI-000LCc-Ht; Mon, 07 Nov 2022 19:55:24 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/14] net: ethernet: mtk_eth_soc: drop packets to WDMA if the ring is full
Date: Mon,  7 Nov 2022 19:54:52 +0100
Message-Id: <20221107185452.90711-14-nbd@nbd.name>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107185452.90711-1-nbd@nbd.name>
References: <20221107185452.90711-1-nbd@nbd.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_112553_501505_57B76A56 
X-CRM114-Status: GOOD (  11.11  )
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

Improves handling of DMA ring overflow.
Clarify other WDMA drop related comment.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 5 ++++-
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 50756c8aa871..4bd06ab1a2b5 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3529,9 +3529,12 @@ static int mtk_hw_init(struct mtk_eth *eth)
 	mtk_w32(eth, 0x21021000, MTK_FE_INT_GRP);
 
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_V2)) {
-		/* PSE should not drop port8 and port9 packets */
+		/* PSE should not drop port8 and port9 packets from WDMA Tx */
 		mtk_w32(eth, 0x00000300, PSE_DROP_CFG);
 
+		/* PSE should drop packets to port 8/9 on WDMA Rx ring full */
+		mtk_w32(eth, 0x00000300, PSE_PPE0_DROP);
+
 		/* PSE Free Queue Flow Control  */
 		mtk_w32(eth, 0x01fa01f4, PSE_FQFC_CFG2);
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index bf8c7d11df9f..226022346369 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -124,6 +124,7 @@
 #define PSE_FQFC_CFG1		0x100
 #define PSE_FQFC_CFG2		0x104
 #define PSE_DROP_CFG		0x108
+#define PSE_PPE0_DROP		0x110
 
 /* PSE Input Queue Reservation Register*/
 #define PSE_IQ_REV(x)		(0x140 + (((x) - 1) << 2))
-- 
2.38.1


