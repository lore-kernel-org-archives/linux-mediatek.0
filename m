Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46833C7618A
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Mar 2023 16:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptxCsmVjrntvkMTFq+i5en2e55/pEHP4mX1gyjLRg2A=; b=jYEhOIjOY5kHJb/nYtnN1yb7bW
	i3kmKlwKiqFpbKvn427ADUKA/l3SLhC3c7421q5NNy0wcsxhTmQL+A7JkgyrbBq9acbveC+ncgdyh
	HMS/LjexROmaqbD+ECNoLyCYZJEQE5bjvK2z38EEM/yAkVsNlji8W0VSFO12hZ9fPRIvbHMeCYd7s
	UxtzpUMLTQIaSmAA+8SqmLACg862FuuKVvRCBBWJ+G+kxTLs3tHtS8zeph42WpZL/q8UaAtdWiO4y
	olj5Khl8Ugd9xwRILTP6TyAJpHdIuv/8+krwGzubZPCS/6jcwLCcyPIZQDC8d1qe6blC9oWkjQ6Lk
	BAJwYitQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peIqZ-009tvb-07;
	Mon, 20 Mar 2023 16:58:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peIqV-009tuq-30
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Mar 2023 16:58:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2DE6461701;
	Mon, 20 Mar 2023 16:58:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E42A8C4339B;
	Mon, 20 Mar 2023 16:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679331534;
	bh=kJn6Wm7582WE4Dn1E73Md1ECuMNXKy9TdKSqsainkW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KtHvmQ6BOF/qk4D1a2TydF+HQ6P3Zx4O3Bft4B6NUcv59eYTACyJOM3ErzLfRpQm7
	 GfpqEiYdBKarLgWuJexJ442cqH0yaqLC3aDPJMs7OVq+fYz1zfPTgCb6TseJB6S9F/
	 UEbpHx3pPmkdwqzaVQARI3kDz95MG5DHB5OiLi2dmhnUWhENAdWHOVThNom8u206oE
	 uD6mXTqQ2GWt5oc8euVJFlvl0nVfg+4Y6gXn+sRu8HxZVvtdvQDFcCsWgybEgSsu1B
	 TNsZHrzN7+lXXAxT4J5/aHPgBsnRjdk1BdbO4/kMpQKVieoXPPTSiOia+lzXrl0yJX
	 dF3RXt3QbXPrQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	lorenzo.bianconi@redhat.com,
	daniel@makrotopia.org,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH net-next 01/10] net: ethernet: mtk_wed: rename mtk_wed_get_memory_region in mtk_wed_get_reserved_memory_region
Date: Mon, 20 Mar 2023 17:57:55 +0100
Message-Id: <9e6defc0bb80dcdf9d8256f81882e58eea250665.1679330630.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1679330630.git.lorenzo@kernel.org>
References: <cover.1679330630.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_095856_010477_A3F8B6C1 
X-CRM114-Status: GOOD (  11.10  )
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

This is a preliminary patch to move wed ilm/dlm and cpuboot properties in
dedicated dts nodes.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/mtk_wed_mcu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
index 6bad0d262f28..6624f6d6abdd 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_mcu.c
@@ -215,8 +215,8 @@ int mtk_wed_mcu_msg_update(struct mtk_wed_device *dev, int id, void *data,
 }
 
 static int
-mtk_wed_get_memory_region(struct mtk_wed_wo *wo,
-			  struct mtk_wed_wo_memory_region *region)
+mtk_wed_get_reserved_memory_region(struct mtk_wed_wo *wo,
+				   struct mtk_wed_wo_memory_region *region)
 {
 	struct reserved_mem *rmem;
 	struct device_node *np;
@@ -311,13 +311,13 @@ mtk_wed_mcu_load_firmware(struct mtk_wed_wo *wo)
 
 	/* load firmware region metadata */
 	for (i = 0; i < ARRAY_SIZE(mem_region); i++) {
-		ret = mtk_wed_get_memory_region(wo, &mem_region[i]);
+		ret = mtk_wed_get_reserved_memory_region(wo, &mem_region[i]);
 		if (ret)
 			return ret;
 	}
 
 	wo->boot.name = "wo-boot";
-	ret = mtk_wed_get_memory_region(wo, &wo->boot);
+	ret = mtk_wed_get_reserved_memory_region(wo, &wo->boot);
 	if (ret)
 		return ret;
 
-- 
2.39.2


