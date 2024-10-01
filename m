Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84803CE7D05
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 10:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYfhfOrbM17GazEIxeD8LTusgxc+tMn4ZjgVtqHsuhY=; b=FBqbOck6/4s0cssPO8n3YP3kTQ
	s9MvFfcRxlkgS+AceIOY6tWGVCGoaCeDWSbJFUewqH3katTD+ApkmEd9BicCjhd4IMAJmHyH6KEzU
	iPA5bdkFTFsXRfczbjZT3Py55emi5LGwqbizrQ9WKvilJdS7JB2kH2Xp67m96tPoKeS4GhFUEH5Ia
	x/R5669lgPfUO/BxtPfS2lervX3Fg152EMRDTuMR/ZZ+7WR7EZasocXJ6svXnRwiTEzCyc2lxxZJv
	rOHyht6ArHbjH+fqLSeY9SRzpLBQfcTEDwaCtaSsw0XoGhiW9q2rAEilV4lvwzDmJqaTfahS81IbY
	QOsXMznQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZsg-00000002JaH-1xi0;
	Tue, 01 Oct 2024 10:13:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svZqH-00000002JHN-1Ofq;
	Tue, 01 Oct 2024 10:10:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A5DA5C02DF;
	Tue,  1 Oct 2024 10:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8769C4CECE;
	Tue,  1 Oct 2024 10:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727777452;
	bh=W6wULZcZ5C4DDBfQh8g6Wi4ct5rID7NuhckJWgjalGk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AznayJHDDdX1qWlWQeaEjiOEiy26RjISy5rQNjJ6JbaI9GcFH+mJJ83M8kEKlWn87
	 +vMit4ZrjublxSwLhUSWlCDoGHB0d2dJ5CdxZiwzOlhzR8AcVGKw3rOlOSmQeTss72
	 j+vuQ4I8U/zqpVGo5ed8PPMwqZKx76HtE5NP815Pc05xjJ2u9Nqq/YBWgFrFh0OxkQ
	 KXhQ5UwI7CEv6JxgVMGtduTvL/3n5JoQDxP0eJsl3OgeCcZqvy+42GG6Q9ayZIovmL
	 9BvISfrMtBUhkSQ53wAENuBMkg0UiQFp1yYTTPfkgGqEyLQTAaAFljjlmOyegTRhr1
	 AjUy7Lz0O1+0g==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 01 Oct 2024 12:10:24 +0200
Subject: [PATCH net-next v2 1/2] net: airoha: read default PSE reserved
 pages value before updating
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-airoha-eth-pse-fix-v2-1-9a56cdffd074@kernel.org>
References: <20241001-airoha-eth-pse-fix-v2-0-9a56cdffd074@kernel.org>
In-Reply-To: <20241001-airoha-eth-pse-fix-v2-0-9a56cdffd074@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>, 
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Simon Horman <horms@kernel.org>, upstream@airoha.com
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_031053_481108_99DE6A61 
X-CRM114-Status: GOOD (  10.16  )
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

Store the default value for the number of PSE reserved pages in orig_val
at the beginning of airoha_fe_set_pse_oq_rsv routine, before updating it
with airoha_fe_set_pse_queue_rsv_pages().
Introduce airoha_fe_get_pse_all_rsv utility routine.

Introduced by commit 23020f049327 ("net: airoha: Introduce ethernet support
for EN7581 SoC")

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 930f180688e5..480540526bdb 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -1116,17 +1116,23 @@ static void airoha_fe_set_pse_queue_rsv_pages(struct airoha_eth *eth,
 		      PSE_CFG_WR_EN_MASK | PSE_CFG_OQRSV_SEL_MASK);
 }
 
+static u32 airoha_fe_get_pse_all_rsv(struct airoha_eth *eth)
+{
+	u32 val = airoha_fe_rr(eth, REG_FE_PSE_BUF_SET);
+
+	return FIELD_GET(PSE_ALLRSV_MASK, val);
+}
+
 static int airoha_fe_set_pse_oq_rsv(struct airoha_eth *eth,
 				    u32 port, u32 queue, u32 val)
 {
-	u32 orig_val, tmp, all_rsv, fq_limit;
+	u32 orig_val = airoha_fe_get_pse_queue_rsv_pages(eth, port, queue);
+	u32 tmp, all_rsv, fq_limit;
 
 	airoha_fe_set_pse_queue_rsv_pages(eth, port, queue, val);
 
 	/* modify all rsv */
-	orig_val = airoha_fe_get_pse_queue_rsv_pages(eth, port, queue);
-	tmp = airoha_fe_rr(eth, REG_FE_PSE_BUF_SET);
-	all_rsv = FIELD_GET(PSE_ALLRSV_MASK, tmp);
+	all_rsv = airoha_fe_get_pse_all_rsv(eth);
 	all_rsv += (val - orig_val);
 	airoha_fe_rmw(eth, REG_FE_PSE_BUF_SET, PSE_ALLRSV_MASK,
 		      FIELD_PREP(PSE_ALLRSV_MASK, all_rsv));

-- 
2.46.2


