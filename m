Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5813EC77B75
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 May 2023 21:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xuCzk6DqyZ2fCjPccft51jSbkGYvG1zx5q2m3ZeEIiA=; b=FpNC2LtNGu2FusMjn2zkCMqgR/
	r+Z5mY2Lj4Q5ALMgp6j+9Yt/AlydGEG3767k5yJaUG+jD7gHnEy67jQqUC2rfzUI7ik+vW6is+1as
	pqD1WaV0AKbFuflT5aO/iim2JgLIiJ3aoFBDqPFux5KQxhWArijROc1rBG1rOPVcJoSkauj00M/Aj
	eVtL4E09yQ7EdDIH5E+98B6DDIv9k17fxolLfaejwq7sthsHTjjvfiXlkmXLZgoxTAtfgYH8Podqb
	56q6b46ofq2Z4PFiV3asgyYIDAesiGmcvn7l9t8jLqes+F1wLHE0zGKtx01T850iYXR9VW6tam1AP
	BWEgPm9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvm7x-00GitB-1u;
	Sun, 07 May 2023 21:41:09 +0000
Received: from s2.dolansoft.org ([212.51.146.245] helo=mx.dolansoft.org)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvm7u-00Girc-1W;
	Sun, 07 May 2023 21:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=brun.one;
	s=s1; h=MIME-Version:Message-Id:Date:Subject:Cc:To:From:In-Reply-To:
	References:From:To:Subject:Date:Message-ID:Reply-To;
	bh=xuCzk6DqyZ2fCjPccft51jSbkGYvG1zx5q2m3ZeEIiA=; b=EMpeMXaoM3PTi/AWcqlqN4Vo+1
	GtwN/vl+G7Xo45snqlEQUsMovgZKPeNAJtrXwgKZqnya3SNbtvq61PkWDCJEthVoC6h0xJWXpvh/Z
	UyCWAS/GxSDxaBNLoKZ2ZU/xh5jvwbJJQqMzPNznAqucDdLNvlQglAFK1rekGp93vKS+8808PUoxw
	POvUq0936evFcMk+JzCQJurx7o8XHEt9PqKjQo6p0ks7S8bg1XKw5Nashdxq1Kn4+zPcxtp4eJgoH
	gj9kllXFbxcEiRqmD30K6kXtYYlrSx+inhW42RWx0wo4raAyvR8WkWXVliN5fgmnD7YXUF/B27b9o
	mZldzv0Q==;
Received: from [212.51.153.89] (helo=blacklava.cluster.local)
	by mx.dolansoft.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lorenz@dolansoft.org>)
	id 1pvm7U-000fES-32;
	Sun, 07 May 2023 21:40:40 +0000
From: Lorenz Brun <lorenz@brun.one>
To: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] net: ethernet: mtk_eth_soc: log clock enable errors
Date: Sun,  7 May 2023 23:40:35 +0200
Message-Id: <20230507214035.3266438-1-lorenz@brun.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230507_144106_509009_4CCFFED9 
X-CRM114-Status: UNSURE (   9.56  )
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

Currently errors in clk_prepare_enable are silently swallowed.
Add a log stating which clock failed to be enabled and what the error
code was.

Signed-off-by: Lorenz Brun <lorenz@brun.one>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index e14050e17862..ca66a573cfcb 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3445,8 +3445,10 @@ static int mtk_clk_enable(struct mtk_eth *eth)
 
 	for (clk = 0; clk < MTK_CLK_MAX ; clk++) {
 		ret = clk_prepare_enable(eth->clks[clk]);
-		if (ret)
+		if (ret) {
+			dev_err(eth->dev, "enabling clock %s failed with error %d\n", mtk_clks_source_name[clk], ret);
 			goto err_disable_clks;
+		}
 	}
 
 	return 0;
-- 
2.39.2


