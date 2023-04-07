Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE4EC77B61
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q2YEfzKUCTu8yGPsbUv9Z5Gi9obI6vl03/UAoPCxGxA=; b=YZ8cGIxSCrDU9nDhb70PSYUp4F
	hxKdp42xWGzHo8/vk9Esic/M0DuxlSAwvDdnLXIAgKGKd2NL9VwXtBcyaPekSvX+C2bp5m8j9gWCa
	v51T7zirSNQ6l1+iMyxohZiFhSMRsDN1pDWH9tAgA9f2bCgq7fsjWCPrYwmTztp3YhLaNIDtqpdzF
	F1FV45828AFvTclY0s9iwCRAhs17Sompl4glyPOzW6yErnziOx2JBLyoKFKl/ecNDj0KQfND/o7WO
	fkKdwrkiU/DMSDvfnfdPkqtNdGs85mYDJcGmHvwP62iClfWo0vRhNnZZTX2cSb1dIbsBUOCuT1cn0
	QydFQi0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkm7P-00AKTT-2d;
	Fri, 07 Apr 2023 13:27:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkm7M-00AKQi-0u;
	Fri, 07 Apr 2023 13:27:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E652760F90;
	Fri,  7 Apr 2023 13:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B91AC4339B;
	Fri,  7 Apr 2023 13:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680874021;
	bh=dKR9JXPNGW1vGc4GpH3hyRN+kbHPQL1J6CUm7tbP1Ws=;
	h=From:Date:Subject:To:Cc:From;
	b=R+YqcmpsZpr0gGA+quyJV2jhBCVgGu+qUdROSIu14X6ExnK/lT3JWL1UNdnU26tn2
	 FLLgx/zmNwfZu0biiH5SNUwNVcVefVJr7inrOUDP2dt+g7ezG3t6da/kfkeQY+odVO
	 3f30jadqimQ4yHjflFtsb8BC/C9OMcFWlRuBbuy280sVbowLkRm6Ad3+3YhH2Imsm/
	 qCDH7w6A+H3UZkFyJvXrW0A7zTw/fDDt6glsnKSE2vc7Cm3DRTgSgK9G10hJ8O//CK
	 oZOtM/O8v1WCXM/ivq4klJx5aJGphofcpkZF2/PH3n/PM7yIPW/Oz1m8ap4/0TT0u2
	 BmIj5gzqB4TEg==
From: Simon Horman <horms@kernel.org>
Date: Fri, 07 Apr 2023 15:26:51 +0200
Subject: [PATCH net-next v2] net: ethernet: mtk_eth_soc: use be32 type to
 store be32 values
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230401-mtk_eth_soc-sparse-v2-1-963becba3cb7@kernel.org>
X-B4-Tracking: v=1; b=H4sIABoaMGQC/32OUQqDMBBEr1L2uymJCtp+9R5FJImrCdqNbFKxi
 Hdv8AD9fDMMb3aIyB4jPC47MK4++kAZiusFrNM0ovB9ZihkUcpKKvFOU4fJdTFYERfNEYWsdGl
 kb+uyGSAPjc6hYU3W5Sl95jmHC+Pgt9P0AsIkCLcEbW6cjynw97ywqrP/Z1uVUKKp8D7Y2jSoz
 XNCJpxvgUdoj+P4AXd7RCDUAAAA
To: Jakub Kicinski <kuba@kernel.org>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Paolo Abeni <pabeni@redhat.com>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, 
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_062704_358935_30796BD8 
X-CRM114-Status: GOOD (  12.90  )
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

n_addr is used to store be32 values,
so a sparse-friendly array of be32 to store these values.

Flagged by sparse:
  .../mtk_ppe_debugfs.c:59:27: warning: incorrect type in assignment (different base types)
  .../mtk_ppe_debugfs.c:59:27:    expected unsigned int
  .../mtk_ppe_debugfs.c:59:27:    got restricted __be32 [usertype]
  .../mtk_ppe_debugfs.c:161:46: warning: cast to restricted __be16

No functional changes intended.
Compile tested only.

Signed-off-by: Simon Horman <horms@kernel.org>
---
Changes in v2:
- Drop change to make use of the cpu_to_be32_array helper.
  It was suggested that a new helper is in order.
  Let's leave that as a follow-up.
- Link to v1: https://lore.kernel.org/r/20230401-mtk_eth_soc-sparse-v1-1-84e9fc7b8eab@kernel.org
---
 drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
index 53cf87e9acbb..316fe2e70fea 100644
--- a/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
+++ b/drivers/net/ethernet/mediatek/mtk_ppe_debugfs.c
@@ -47,7 +47,7 @@ static const char *mtk_foe_pkt_type_str(int type)
 static void
 mtk_print_addr(struct seq_file *m, u32 *addr, bool ipv6)
 {
-	u32 n_addr[4];
+	__be32 n_addr[4];
 	int i;
 
 	if (!ipv6) {


