Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CFDC46CD2
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Jan 2024 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YF+EKIzep+/YJv3D47pegNUkbzXt45KSoZ5/BcUkQOY=; b=3+/AwBLDKI6BRl4iOr8/+Wsb5d
	QLgMuKIfL/JI9sAZWSJwpeg/Y8D9k9reTAVy0I0YkUNroqI6Oo9EoRqia910kqgH7acox1SCWfPIH
	46zo4g0xABvUaun/iJFdxvhHs1Of9AgRjAbDnj67EFAcHH40qODKvJ70kGCbguET4wJOyK9Za3Zf2
	pMCYP4r6CkO4Z08JNTErHKjpX8WqizcDRBzkQ7oLmUyigK1DKMk4VCueXp0sKWMQlEmOG1lrjIQVi
	AQxoBq/MEXV9JS+w/EDBtgQ+XFUisNASU7eVwBKF30u1SHX4cj01yZC4wVvu83SNwkNb6lOE9Z+Sx
	5I5t2MZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSg1P-004BHE-1b;
	Wed, 24 Jan 2024 16:22:39 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSg1L-004BD9-2q;
	Wed, 24 Jan 2024 16:22:37 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rSg12-0004Wm-0B;
	Wed, 24 Jan 2024 16:22:17 +0000
Date: Wed, 24 Jan 2024 16:22:09 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net] net: ethernet: mtk_eth_soc: set DMA coherent mask to get
 PPE working
Message-ID: <97e90925368b405f0974b9b15f1b7377c4a329ad.1706113251.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
total: 0 errors, 1 warnings, 0 checks, 11 lines checked
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_082235_914978_B3CD93F5 
X-CRM114-Status: GOOD (  11.62  )
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

Set DMA coherent mask to 32-bit which makes PPE offloading engine start
working on BPi-R4 which got 4 GiB of RAM.

Fixes: 2d75891ebc09 ("net: ethernet: mtk_eth_soc: support 36-bit DMA addressing on MT7988")
Suggested-by: Elad Yifee <eladwf@users.github.com>
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index a6e91573f8dae..de123350bd46b 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -4761,7 +4761,10 @@ static int mtk_probe(struct platform_device *pdev)
 	}
 
 	if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA)) {
-		err = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(36));
+		err = dma_set_mask(&pdev->dev, DMA_BIT_MASK(36));
+		if (!err)
+			err = dma_set_coherent_mask(&pdev->dev, DMA_BIT_MASK(32));
+
 		if (err) {
 			dev_err(&pdev->dev, "Wrong DMA config\n");
 			return -EINVAL;
-- 
2.43.0


