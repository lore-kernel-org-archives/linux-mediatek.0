Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC04C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 10:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PIu1N5rjqhAfAmhMRd1mVzpJtesqpN9BP0Mnbo0ZD2k=; b=dK3Gx1lH5wByWy
	XsbEOxGMl2XPEQUhtinAiEtHrncPAwNKE6jZtExEJt6dzaFzB7iueyyG6Yvj4IlB4sxYWzZYVQKN+
	IzJF48fz0gdF5vELkFC4Z3I8LFkVQ2z5gH1zyFCzv+jrsZ03m8K/ZCKwWQLsShK5hehlPeblR8jLP
	xif+dcS1QQvfeuQJkSWJwMrGk4mIs2G35eYLyiZSrpA0nfWURnEfZ6SEzZSqR5z8AUnC2u6svY7FC
	tv0EMv2lsNhs6Woa1OwCpNkD7DaZJxwDHaGNnlcCqbfspQ7GCFjFScKWKgRt/1tD6b4b8eNyOoDH3
	7hlFSa20Om6FkhLBEuDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNXiS-004Khd-KJ; Fri, 25 Feb 2022 10:20:48 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNXgA-004JZI-SL; Fri, 25 Feb 2022 10:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ukTEVmN3B7Wvv/QbA8NN7LNVV3vx54CmkD3mb6AtZXE=; b=J7YrQhbjgIjxKnqzkEr/XgPKe0
 qGGvk7m6TRiZIEeE9YkWKWcJI0TqELi3hsmo3A4N4H9bYZpMPLX80xkr5uinziQq5DcuuX4v1Il2W
 ocapRqqK1zYmWrPzZhBoGDRdTrblmYrOByqTjDGFApR0Wsz30Q3OTra7UqUz0zwcUGX0=;
Received: from p200300daa7204f00f847964d075b2b3d.dip0.t-ipconnect.de
 ([2003:da:a720:4f00:f847:964d:75b:2b3d] helo=localhost.localdomain)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nNXg2-0007J1-IA; Fri, 25 Feb 2022 11:18:18 +0100
From: Felix Fietkau <nbd@nbd.name>
To: netdev@vger.kernel.org, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] net: ethernet: mtk_eth_soc: support TC_SETUP_BLOCK for
 PPE offload
Date: Fri, 25 Feb 2022 11:18:06 +0100
Message-Id: <20220225101811.72103-8-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220225101811.72103-1-nbd@nbd.name>
References: <20220225101811.72103-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_021827_147181_4A68D610 
X-CRM114-Status: UNSURE (   9.31  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This allows offload entries to be created from user space

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/net/ethernet/mediatek/mtk_ppe_offload.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
index 0113cddcebf4..da3bc93676f8 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_offload.c
@@ -563,10 +563,13 @@ mtk_eth_setup_tc_block(struct net_device *dev, struct flow_block_offload *f)
 int mtk_eth_setup_tc(struct net_device *dev, enum tc_setup_type type,
 		     void *type_data)
 {
-	if (type == TC_SETUP_FT)
+	switch (type) {
+	case TC_SETUP_BLOCK:
+	case TC_SETUP_FT:
 		return mtk_eth_setup_tc_block(dev, type_data);
-
-	return -EOPNOTSUPP;
+	default:
+		return -EOPNOTSUPP;
+	}
 }
 
 int mtk_eth_offload_init(struct mtk_eth *eth)
-- 
2.32.0 (Apple Git-132)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
