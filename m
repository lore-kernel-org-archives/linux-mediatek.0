Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E0ACE7D08
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 10:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V2DK1Xj2VIVapnosTJA3pGTPNBfkSUWzCPmtzl1TBbE=; b=jrrTes5xeQPJ90uqPzTVgrcW35
	jKxfoNZgOBHfTu2VmwWBWZi17algpnMYCNnz+t0YO88fMSJ9O4G2iwKc+82fT9iKqliIXrM5C4pCo
	QWZWhSKRY0HdIFrzYFFQPHpUZA1xhZBJHJhsDv8DC3g54fHfAB9ySg05y70m21Mg7xjIxgNiBzaWS
	uS8WplPBHqWq0SNa+FPwRwkPbs3hzB7SL2EGynHqVvMRJtY5L6sTbUqTPJKTWPTh0LzwgT3rLtRfD
	OESqS6s2lswLlagCzREuW8cutYmfsrHHLamCq0b9On8O0ZC79JnCOtRvCXAYVzvTgcr8iD4in3/V7
	ow3c0QKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svZtr-00000002Jk2-1dRg;
	Tue, 01 Oct 2024 10:14:35 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svZqJ-00000002JIQ-3xXE;
	Tue, 01 Oct 2024 10:10:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4253A43459;
	Tue,  1 Oct 2024 10:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C617C4CEC6;
	Tue,  1 Oct 2024 10:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727777454;
	bh=Qijv8E/hOs+a3AnRI/m40p7E3/8S4ymdY4/ldhCHa44=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MUmujJXMG2Y7ZAaZZ2sMqHCVvZoOPKwYrxxUzF+3SjslGf3ytWz9QPP+f3LDxBgSs
	 j7DDD8yzSoLA+MJBEbHsC7kGIeHeYUAePMTln493NdWOU5W7rtQRLGlEBu6u+fJ5X7
	 plLkD82of0RwHi6hlJOlc7KWSWFGOCaNnOqOHNfj5c9BbdGOBlhMhH93BdjUM72+4o
	 HXe6HGOBuD0i/ztzmNe7gnKJFQ1Q8VDhEIQnetlJntcouUfCWwVTLZiTMoTOtTUNni
	 WVvIe+o9I5MBsL5TapYUL5OKEHxsyx8Pi3svswLu1opB48Ly0OF63ceRKIWvIoXz2I
	 QXPqP70JRt9QQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Tue, 01 Oct 2024 12:10:25 +0200
Subject: [PATCH net-next v2 2/2] net: airoha: fix PSE memory configuration
 in airoha_fe_pse_ports_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-airoha-eth-pse-fix-v2-2-9a56cdffd074@kernel.org>
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
X-CRM114-CacheID: sfid-20241001_031056_128822_4F4F8C79 
X-CRM114-Status: GOOD (  10.73  )
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

Align PSE memory configuration to vendor SDK. In particular, increase
initial value of PSE reserved memory in airoha_fe_pse_ports_init()
routine by the value used for the second Packet Processor Engine (PPE2)
and do not overwrite the default value.

Introduced by commit 23020f049327 ("net: airoha: Introduce ethernet support
for EN7581 SoC")

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 480540526bdb..2e01abc70c17 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -1172,11 +1172,13 @@ static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
 		[FE_PSE_PORT_GDM4] = 2,
 		[FE_PSE_PORT_CDM5] = 2,
 	};
+	u32 all_rsv;
 	int q;
 
+	all_rsv = airoha_fe_get_pse_all_rsv(eth);
 	/* hw misses PPE2 oq rsv */
-	airoha_fe_set(eth, REG_FE_PSE_BUF_SET,
-		      PSE_RSV_PAGES * pse_port_num_queues[FE_PSE_PORT_PPE2]);
+	all_rsv += PSE_RSV_PAGES * pse_port_num_queues[FE_PSE_PORT_PPE2];
+	airoha_fe_set(eth, REG_FE_PSE_BUF_SET, all_rsv);
 
 	/* CMD1 */
 	for (q = 0; q < pse_port_num_queues[FE_PSE_PORT_CDM1]; q++)

-- 
2.46.2


