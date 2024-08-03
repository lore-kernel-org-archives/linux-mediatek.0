Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC37C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Aug 2024 15:56:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LnYdS52KsBb0LmVYK2nF9//LJjoNNxmrJILlohDqsjI=; b=yZobswmCgkbcLGjTQeDdYRz3rh
	4IdcvFSj1ajiahvyF50RHWGOCfDP0cA7aMcSH5GuPGi1Kl9CvhdVP2lonHVwP4ODo59tJvLXUID7T
	gCi0oNmDzApKKffXxj36X7Vu3xUo+gDOfBbP7S2w0Ksh7HqrWHXyQOSvCiDnmM+CvW/Wdj2NioKrj
	OO4fInQSdAjy7aZ8JnPaQTVdjqAQWQRvXrF2cPcQqst0Sya15Y5ZVewX7N5k16jBJEtFiRB0X1em8
	VHfT1yXlwmXw7vUfCsQ+ClIMF9Q5JX2Vg/RDoKbTtJSkW3cwqz6HUE/c3ogt1DKtVQQN4GNnMnnMq
	GHJyUKbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saH7I-0000000Bg5W-0YXw;
	Sat, 03 Aug 2024 15:56:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1saH6l-0000000Bg1T-2Y5E;
	Sat, 03 Aug 2024 15:55:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A3E362B76;
	Sat,  3 Aug 2024 15:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 181EDC4AF0A;
	Sat,  3 Aug 2024 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722700549;
	bh=u3EQ9Hj7ZpnXiYJks0rhhPCwobubc2eRs6Hz77ELYH4=;
	h=From:To:Cc:Subject:Date:From;
	b=OegF3oDwUVP7XT3NxlL4UZEkAs0U5hh1f3SZ8NmenH38ekuzrkAycs+uq0TPHc6nT
	 P8pUo/E4xdWyH3lMV7gnKCsBL4iwjlcObPE8+nOHFZTQIGGny7A8175MQYSxRb2lNW
	 bJ0hOifz2wRJ45FqUhxK+b4692iUxTQ54qKIOOm82W6mDCudxtrk0hTx6Ig9N7p9a9
	 OIrehwUx1vk8386PKpfR0pneV5HLDkoCHTeQpOoPiIGbFLHMCslWIFDKR4cYxoo8qU
	 ZyN5yIozgn0dJf7GnO/tc5snrIhsU7Ir4xl71AQIngiaY/cXyN0dznXjYFERd95Goq
	 /Yj7p67ijxXEA==
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
	lorenzo.bianconi83@gmai.com
Subject: [PATCH net-next] net: airoha: honor reset return value in airoha_hw_init()
Date: Sat,  3 Aug 2024 17:50:50 +0200
Message-ID: <f49dc04a87653e0155f4fab3e3eb584785c8ad6a.1722699555.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240803_085551_728961_29B13682 
X-CRM114-Status: UNSURE (   9.53  )
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

Take into account return value from reset_control_bulk_assert and
reset_control_bulk_deassert routines in airoha_hw_init().

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index db4267225fa4..1fb46db0c1e9 100644
--- a/drivers/net/ethernet/mediatek/airoha_eth.c
+++ b/drivers/net/ethernet/mediatek/airoha_eth.c
@@ -2071,13 +2071,21 @@ static int airoha_hw_init(struct platform_device *pdev,
 	int err, i;
 
 	/* disable xsi */
-	reset_control_bulk_assert(ARRAY_SIZE(eth->xsi_rsts), eth->xsi_rsts);
+	err = reset_control_bulk_assert(ARRAY_SIZE(eth->xsi_rsts),
+					eth->xsi_rsts);
+	if (err)
+		return err;
+
+	err = reset_control_bulk_assert(ARRAY_SIZE(eth->rsts), eth->rsts);
+	if (err)
+		return err;
 
-	reset_control_bulk_assert(ARRAY_SIZE(eth->rsts), eth->rsts);
-	msleep(20);
-	reset_control_bulk_deassert(ARRAY_SIZE(eth->rsts), eth->rsts);
 	msleep(20);
+	err = reset_control_bulk_deassert(ARRAY_SIZE(eth->rsts), eth->rsts);
+	if (err)
+		return err;
 
+	msleep(20);
 	err = airoha_fe_init(eth);
 	if (err)
 		return err;
-- 
2.45.2


