Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F025CCD1BB
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Sep 2024 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zuq7wpCDtmY6ucAvqGudnmsSbgARIhHx8T4FopwpdLE=; b=zKEDxAmGqofZbszvlqKu3uZvyO
	4jevAVle3lmYskmE5ta2N66UqbiSxUroyb1Nc+6E9ob512vDtEi3a3CH1ZhjSAVcGgGTt4PoYAadc
	X0fBM0UKIWEPxa/rV0/ZlwgktvJ0Zwr7YCUx+uh8poQaIxiTa6rGi1DfceytFbk6GoD/XFiK5MCWZ
	/ImmDfo1tQZhiwjc3vqHxIYEONA1FSbf/iaGukOkZ59gKDblKGkD2L8ATCijlRrOzm3+GIB85mVfl
	WXNQTWyd/yKzByuUMZEg/ZXbykcKIUY3y5nxTVSrV9VTDqj07w4KWiEgpfvlXk4dxEFXL4DMD8Ews
	ynTKf2yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqvpm-00000008SUJ-2Np4;
	Wed, 18 Sep 2024 14:39:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqvof-00000008SMZ-40Az;
	Wed, 18 Sep 2024 14:38:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADC115C5C0B;
	Wed, 18 Sep 2024 14:37:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90BDBC4CEC2;
	Wed, 18 Sep 2024 14:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726670281;
	bh=xXLfPYls2cCeIdrdeFZxy8Q4TAacIKqRg0i33Imm1gY=;
	h=From:Date:Subject:To:Cc:From;
	b=A47BSIp8YO5Ahf70mXgJElnNxFupJ8zkLIxXLjeSv6KWkimEDgBNORFHe+P/dTiQS
	 /KWOVTezUPZyeG/15lF/CGlLkwk09hIKEyhlFtbgdmydfGaD/sXpdboYCTETMtTEdg
	 l13OwaUSFCJznk/PUY4pSLC7K6pR3DWc4ab9X5Uudq64OROlFBcWLmnNNXghgSnabg
	 ptH7EMhYrOxZVSMVPhfsw7Wb/G5dDewwkgc3fNsRIvrOqkYTDnhVIDv/9MUJZ2tQ1C
	 Zu7q9XS1IABEoCwemUC8+Q1Z3CjlsV1BYfNdfS95GjbK5zqfQwE78j8LVThgts3cDA
	 cHrPgdkEd7KDQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 18 Sep 2024 16:37:30 +0200
Subject: [PATCH net] net: airoha: fix PSE memory configuration in
 airoha_fe_pse_ports_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240918-airoha-eth-pse-fix-v1-1-7b61f26cd2fd@kernel.org>
X-B4-Tracking: v=1; b=H4sIAKnl6mYC/x2MQQqAIBAAvxJ7bkFDpPpKdBDdci8lbkQQ/r2l4
 wzMvCBUmQTm7oVKNwufh4LtO4g5HDshJ2UYzODMZEcMXM8ckK6MRQg3ftA7m0zc/OijAQ1LJdX
 /dFlb+wArfm5TZAAAAA==
To: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 upstream@airoha.com, Sayantan Nandy <sayantan.nandy@airoha.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_073802_120503_DDD0647A 
X-CRM114-Status: GOOD (  10.99  )
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
Moreover, store the initial value for PSE reserved memory in orig_val
before running airoha_fe_set_pse_queue_rsv_pages() in
airoha_fe_set_pse_oq_rsv routine.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Tested-by: Sayantan Nandy <sayantan.nandy@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/mediatek/airoha_eth.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/airoha_eth.c b/drivers/net/ethernet/mediatek/airoha_eth.c
index 930f180688e5..2e01abc70c17 100644
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
@@ -1166,11 +1172,13 @@ static void airoha_fe_pse_ports_init(struct airoha_eth *eth)
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

---
base-commit: 9410645520e9b820069761f3450ef6661418e279
change-id: 20240918-airoha-eth-pse-fix-641d0cf686c0

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


