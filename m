Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690CECCD185
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Oct 2025 07:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QqWnosEKo5mr7/hjsttpdvGR96akxzRUwh9oO2qurjo=; b=hMp5O4n6JGNpWr46wdLi5aYOwH
	Mzy4PkgxKW4XGs1+ni1EcbK1Q0ejgi3Znn16/oSEaUuGg8YpYFiMLeiilW3tNRszBmsOJmyYMkUxg
	64cWSBi01UrcyTzcQGDcj9g8UzuJtj68kMIOS4JIY4ZUh8U599ogBigMXnEgMtOH8tMbyDkqdUGNS
	zF3RoZcDOoyNJYE0inTI31/xQ8C9WW+9Mfww2oOk6bHXEINqjmcj4qaSGXp3XPfjfj8OfoZT+EJhv
	iprg2lBiOfJifHM3MWn4xsOfd+7IpRFmOhNjO8Yfynkm7HYaB14kLcwNkNXv+bmnpqSojoGw5YG/Y
	qBBqqk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjs-00000000gmd-2FuC;
	Wed, 15 Oct 2025 07:16:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vjn-00000000geR-1GcV;
	Wed, 15 Oct 2025 07:15:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 91B2561278;
	Wed, 15 Oct 2025 07:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B576FC19421;
	Wed, 15 Oct 2025 07:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760512554;
	bh=bKE7kdrqnJbbJfhzHxYqcS9M66MuknY1pg74M0+0sCY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mFE7Kl2D0NQj0qgDsB7syakZrJ8rt9VKOLwf8nKJEDuMPb53dtPGxEtotDIDehr0g
	 Q8jPzRNExXHH0lzMmCbHIA7UfV+3yrn7ad3Vyjd7PdZ3Vx3B9H5V3WBu5qPmgT4BML
	 RmFU9AYbZP1GIXQ33yJqY4PEaoQFJNK1d9UKwvtkQpkApHKfwb9FgEXYsKjytoN4Qw
	 GV24V1eseoCBQlp1MHYCH4/TI+QVBEJOMLNQlemjbtK+GmA3/TAtbh1wioZjI9mBzx
	 pn/KmGtoiPb9YQ98RkwPAZMLx+ZJwX3E4UPryGKwrXIEEGBr1sIyRBbOOyzxEsvcWC
	 uxwSK7paluemQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 15 Oct 2025 09:15:09 +0200
Subject: [PATCH net-next 09/12] net: airoha: ppe: Flush PPE SRAM table
 during PPE setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-an7583-eth-support-v1-9-064855f05923@kernel.org>
References: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
In-Reply-To: <20251015-an7583-eth-support-v1-0-064855f05923@kernel.org>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
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

Rely on airoha_ppe_foe_commit_sram_entry routine to flush SRAM PPE table
entries. This patch allow moving PPE SRAM flush during PPE setup and
avoid dumping uninitialized values via the debugfs if no entries are
offloaded yet.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 0ee2e41489aaa9de9c1e99d242ee0bec11549750..0315aafe2fd596e5f5b27d2a2b3fb198ff2ec19f 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1296,18 +1296,22 @@ static int airoha_ppe_flow_offload_cmd(struct airoha_eth *eth,
 	return -EOPNOTSUPP;
 }
 
-static int airoha_ppe_flush_sram_entries(struct airoha_ppe *ppe,
-					 struct airoha_npu *npu)
+static int airoha_ppe_flush_sram_entries(struct airoha_ppe *ppe)
 {
 	u32 sram_num_entries = airoha_ppe_get_total_sram_num_entries(ppe);
 	struct airoha_foe_entry *hwe = ppe->foe;
-	int i;
+	int i, err = 0;
+
+	for (i = 0; i < sram_num_entries; i++) {
+		int err;
 
-	for (i = 0; i < PPE_SRAM_NUM_ENTRIES; i++)
 		memset(&hwe[i], 0, sizeof(*hwe));
+		err = airoha_ppe_foe_commit_sram_entry(ppe, i);
+		if (err)
+			break;
+	}
 
-	return npu->ops.ppe_flush_sram_entries(npu, ppe->foe_dma,
-					       sram_num_entries);
+	return err;
 }
 
 static struct airoha_npu *airoha_ppe_npu_get(struct airoha_eth *eth)
@@ -1345,10 +1349,6 @@ static int airoha_ppe_offload_setup(struct airoha_eth *eth)
 	}
 
 	airoha_ppe_hw_init(ppe);
-	err = airoha_ppe_flush_sram_entries(ppe, npu);
-	if (err)
-		goto error_npu_put;
-
 	airoha_ppe_foe_flow_stats_reset(ppe, npu);
 
 	rcu_assign_pointer(eth->npu, npu);
@@ -1519,6 +1519,10 @@ int airoha_ppe_init(struct airoha_eth *eth)
 	if (!ppe->foe_check_time)
 		return -ENOMEM;
 
+	err = airoha_ppe_flush_sram_entries(ppe);
+	if (err)
+		return err;
+
 	err = rhashtable_init(&eth->flow_table, &airoha_flow_table_params);
 	if (err)
 		return err;

-- 
2.51.0


