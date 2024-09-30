Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59F80CE8341
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Sep 2024 13:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Echq6iYdi8xXOiwQNXOIod/aTn7Fh4/OT5C9qG6Rag=; b=ScAphbZ7d90p5RVE5GAlzSO3dd
	/LKemwTjkHY15MhABdATyl4v9U3yVNCFsY8uVD53GSiBMvewoBAW/kPYRsqN9XYdYL04zPAm8SVXc
	QrYIu7Nsh9n5PDmy1uXXRWF4zbi86l5eyemA9pc2kvFbLz3eP6Bdw2vSsMLVQKQx8eYgt3quPXq1k
	S4u0lLCOlRs/A4Wzu5naKdpmmJExBr+SbcAm8Inj2RM4K84BZ2u0R68iSFBBnPVen7aS14Vky1hQk
	M6VXd0bItZJ9EOBVSw59wA1OlnwTz1/cvKpIOfefneC/v48lyuIqBJuajL9cVSWVrNMmKKCX1umHt
	bB6lnevA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svGAc-0000000HDYO-0r6r;
	Mon, 30 Sep 2024 13:10:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svFbb-0000000H4IK-2NYE;
	Mon, 30 Sep 2024 12:34:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 058F35C1191;
	Mon, 30 Sep 2024 12:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41ECDC4CEC7;
	Mon, 30 Sep 2024 12:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727699662;
	bh=qTB9g6Mdenjq1zRKKss5v3af9DwJHerHGR2vXvjGRHs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=FY50tftipJWwI6IGb+PAARkL12B7fochTa2vApQ4msqXoVsKecvwGWQj7sf9jDe15
	 SWZFf7SRc0ySXu4332vsKX9Cu1+jG4J+M8u5m0iCnba/J/ax2jPzsTegKVi2sB/nRd
	 qZDcRtAO1TXh2/TWFkhI71zilIdqJYKwy3Lcwq5Gja/T2PKoHsj28k/qdk+al6OLoh
	 Qw9Gfc+exWLprRRLeegDzqUD1lHJEvvlMeIKV1i9/S1ijiCHKsnixQnk8OX198xEt+
	 FOhfB7uyMRuYR5+SIfW6CqtQBEnbj9jSlE+TcFzz7UHIjTRt6rQwaSaYTlTJIsgFzF
	 rIZWku+q33AkA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Mon, 30 Sep 2024 14:33:49 +0200
Subject: [PATCH net-next 2/2] net: airoha: fix PSE memory configuration in
 airoha_fe_pse_ports_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240930-airoha-eth-pse-fix-v1-2-f41f2f35abb9@kernel.org>
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
X-CRM114-CacheID: sfid-20240930_053423_732162_C0FDC632 
X-CRM114-Status: GOOD (  10.62  )
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

commit 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
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


