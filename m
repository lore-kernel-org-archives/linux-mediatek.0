Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E009CE8347
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 14:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jp9HBVqhY6dvREuID819AYIzD472pXkGDZsYYpNo37s=; b=NMlh4qYsFZ8fsu1cBIo/mGqK8F
	3MAn2DAKR1io/0X4M18AdcvlH2C9kVh1hVxa4IDhMaw8QYicBAZrDNKER1UURz1Ch0DpV3EdPtBkf
	Lbq6AlHNCqJNy1V8xUUcSmxlPuFQagrlzDH5gV9OlNlzBNpx5kMFLOn5F6eC0LHLeMe5mMsHFhgP+
	igwW53CWDOPBnuJYrbk7vxJdcto/lbkciM1VoPUTeWBJ7rrQ9py3g9afHObqqLFgT7PMd/yZZWhh7
	iuC2HDj0k2Sr5msq8QqrC/YPJu0kzcqQohM7dgD1y3o06DUPtaKYPKCXYit/QhW2VoYvHcSsJBIbV
	GGvqT5fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svHBO-0000000HTpn-10Zo;
	Mon, 30 Sep 2024 14:15:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFbY-0000000H4Gs-41Rb;
	Mon, 30 Sep 2024 12:34:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 480CA5C4673;
	Mon, 30 Sep 2024 12:34:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC11FC4CEC7;
	Mon, 30 Sep 2024 12:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727699660;
	bh=Z/4YAYam6JnULP3t1IK5jI6tEWcPLOHTYHfr4Vko5D8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GyfpVD7ieTL/0P/lAUCh6H8l6dIZfCYFefix1Vw/fkB2v0GkvRdaVpYMY4MZA6/EM
	 7zf9P8nTL9cqZfdea7b2zecl9v2q3x/WykpCJYyJYwkSn2C4ZTKlG5QiPBjIN9bBA/
	 3YJrGFvfI5PV+LH9egc0Lhsk4jwiBnRma+jUAVff/kUz9+nkq9BFMXvxNedAup2pGE
	 TYpquaOyALB6lgtTrP4PGgZc4aySyz+UWcLtZnRgM+OkmDCiKGfBnqXzyWgdMHU3RP
	 gxB2gRgXH19loPhp3QvRPBKMyixV5XraWQR/LpOACGNJbMRhb/K+lb24XOcaimHYzZ
	 XaKmVpCJmGPiw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 30 Sep 2024 14:33:48 +0200
Subject: [PATCH net-next 1/2] net: airoha: read default PSE reserved pages
 value before updating
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-airoha-eth-pse-fix-v1-1-f41f2f35abb9@kernel.org>
References: <20240930-airoha-eth-pse-fix-v1-0-f41f2f35abb9@kernel.org>
In-Reply-To: <20240930-airoha-eth-pse-fix-v1-0-f41f2f35abb9@kernel.org>
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
X-CRM114-CacheID: sfid-20240930_053421_170453_DFB4B372 
X-CRM114-Status: GOOD (  10.15  )
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

commit 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
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


