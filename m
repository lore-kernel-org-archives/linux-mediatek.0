Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4703DC3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jul 2024 08:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o3hcYxMeOpJUPShQAKZliypuo4Fp52ebkVQaCDGi5V0=; b=gz5Y/Y+Os/DJB6SLE9zH+xqr+7
	kzQG+G/ZM725GVosTH1GWv7MYxHj7076C7VzJRiYNe/2CkEVd+iGbNFnihwVqbjHsR8wUrCfBYKXS
	6FlPAmzhtJSgs/VgVt84cH+bP2lDt705Nd0imOdFEnZAy8lhO6mYTDf4+6atJIikG75m1DsBbrLhd
	Av8S1xeg/jHwzYKBP7JNXIFG2letnsUm6l7E4y3iBvaZxldPwW3WjNWpbryhiWvJyprqTQTSn+qai
	nai4ARgQPr05eeN05uoiQboGi+ohcMrOweyHYT/KRMdbAS+Qi6+ciaUpHcz+nsPmPxR50DkHdvILG
	6YgXwFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzqS-0000000D6Bn-4Bn5;
	Wed, 17 Jul 2024 08:17:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTzq4-0000000D62c-0zah;
	Wed, 17 Jul 2024 08:16:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0A945CE167D;
	Wed, 17 Jul 2024 08:16:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 001DCC32782;
	Wed, 17 Jul 2024 08:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721204195;
	bh=yDsns82MnrYt7Bo2jMAKgQSAdRDY5L1H5Za0sQwomiY=;
	h=From:To:Cc:Subject:Date:From;
	b=WGSDfhVd0dV6i7w7WrS//yQjRaArSufiLqlAdUVg+/f0v9+RhLvbW88zM18JO8Bgn
	 Qw3MEv/pJOYKceKnqDsv+DBUr8RYuxyYd0bS/AOR3J/A6FL6sdm3mWVuZXoHQpS6Bm
	 tjPNWa886JccisSmGZLTCY6TvjEKKkAoVTshofe+nHpe9u9eam35x7sgNEbKjIJ50a
	 q416Bvf+atIZ++d2lYTxAarRk+wtw3rFd40U7c3hNQcL+2rPmoWbAEe0nh+h6QrJSs
	 hJfbB7cxVnPXXGbBrlz2OUDibylY9DPtH5GYCT9Gys7tj4aA2NHOrXq+ukA+j++fnC
	 PCgfpVSV9XPcQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	lorenzo.bianconi83@gmail.com
Subject: [PATCH net] net: airoha: fix error branch in airoha_dev_xmit and airoha_set_gdm_ports
Date: Wed, 17 Jul 2024 10:15:46 +0200
Message-ID: <b628871bc8ae4861b5e2ab4db90aaf373cbb7cee.1721203880.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240717_011640_473331_9F8D306A 
X-CRM114-Status: UNSURE (   8.69  )
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

Fix error case management in airoha_dev_xmit routine since we need to
DMA unmap pending buffers starting from q->head.
Moreover fix a typo in error case branch in airoha_set_gdm_ports
routine.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 7967a92803c2..cc1a69522f61 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -977,7 +977,7 @@ static int airoha_set_gdm_ports(struct airoha_eth *eth, bool enable)
 	return 0;
 
 error:
-	for (i--; i >= 0; i++)
+	for (i--; i >= 0; i--)
 		airoha_set_gdm_port(eth, port_list[i], false);
 
 	return err;
@@ -2431,9 +2431,11 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *skb,
 	return NETDEV_TX_OK;
 
 error_unmap:
-	for (i--; i >= 0; i++)
-		dma_unmap_single(dev->dev.parent, q->entry[i].dma_addr,
-				 q->entry[i].dma_len, DMA_TO_DEVICE);
+	for (i--; i >= 0; i--) {
+		index = (q->head + i) % q->ndesc;
+		dma_unmap_single(dev->dev.parent, q->entry[index].dma_addr,
+				 q->entry[index].dma_len, DMA_TO_DEVICE);
+	}
 
 	spin_unlock_bh(&q->lock);
 error:
-- 
2.45.2


