Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8421CC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 07:51:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B7896142A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 07:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4B7896142A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pyxTDuNjz7/5N8iGz51qTU4KEQwzAzTQ2I9hv7KA0aU=; b=HkfPPOASWnqvIW
	EvOZ8G50G9cWDQchr+8pcai6qydk4r/Fn0oL7hXuJRvmrFYe2dKgZxSyLdQ1m5rPTJ+xlFFzvSrWZ
	ifkEs4+6QZ2Bb/FnQeNkdTv1ntREoJcp450NRJG0PU5pLuedTA0v8L+lZUlo+VW3dfimpkf8JR2tY
	/53RDWr2VGzNdXjh4Q+4Gdx1t7e6UDvaW1kJpNA+w9autYbryX52WrVqyiUKqiBBxGjBC5U4QlO7F
	QuH69IiN63EC3zF0bmWLdKIQcvjxT19iVQiPH/KEmfgNWNZI0tKRBB5YSN21KuqstOziiqppgaxcT
	Z/jerOzIFMEVz+K/8HSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVqqb-00DEbR-E1; Thu, 30 Sep 2021 07:51:17 +0000
Received: from inva021.nxp.com ([92.121.34.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVqpf-00DEDm-6r; Thu, 30 Sep 2021 07:50:20 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id E8E7A2017C0;
 Thu, 30 Sep 2021 09:50:17 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B02532017D6;
 Thu, 30 Sep 2021 09:50:17 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 04A03183AC89; Thu, 30 Sep 2021 15:50:14 +0800 (+08)
From: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
To: davem@davemloft.net, linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Cc: allan.nielsen@microchip.com, joergen.andreasen@microchip.com,
 UNGLinuxDriver@microchip.com, vinicius.gomes@intel.com,
 michael.chan@broadcom.com, vishal@chelsio.com, saeedm@mellanox.com,
 jiri@mellanox.com, idosch@mellanox.com, alexandre.belloni@bootlin.com,
 kuba@kernel.org, xiaoliang.yang_1@nxp.com, po.liu@nxp.com,
 vladimir.oltean@nxp.com, leoyang.li@nxp.com, f.fainelli@gmail.com,
 andrew@lunn.ch, vivien.didelot@gmail.com, claudiu.manoil@nxp.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 matthias.bgg@gmail.com, horatiu.vultur@microchip.com
Subject: [PATCH v6 net-next 3/8] net: mscc: ocelot: set vcap IS2 chain to goto
 PSFP chain
Date: Thu, 30 Sep 2021 15:59:43 +0800
Message-Id: <20210930075948.36981-4-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930075948.36981-1-xiaoliang.yang_1@nxp.com>
References: <20210930075948.36981-1-xiaoliang.yang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_005019_550916_45C0DEDC 
X-CRM114-Status: GOOD (  11.57  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Some chips in the ocelot series such as VSC9959 support Per-Stream
Filtering and Policing(PSFP), which is processing after VCAP blocks.
We set this block on chain 30000 and set vcap IS2 chain to goto PSFP
chain if hardware support.

Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
Reviewed-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/mscc/ocelot_flower.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mscc/ocelot_flower.c b/drivers/net/ethernet/mscc/ocelot_flower.c
index 8b843d3c9189..ce812194e44c 100644
--- a/drivers/net/ethernet/mscc/ocelot_flower.c
+++ b/drivers/net/ethernet/mscc/ocelot_flower.c
@@ -20,6 +20,9 @@
 	(1 * VCAP_BLOCK + (lookup) * VCAP_LOOKUP)
 #define VCAP_IS2_CHAIN(lookup, pag)	\
 	(2 * VCAP_BLOCK + (lookup) * VCAP_LOOKUP + (pag))
+/* PSFP chain and block ID */
+#define PSFP_BLOCK_ID			OCELOT_NUM_VCAP_BLOCKS
+#define OCELOT_PSFP_CHAIN		(3 * VCAP_BLOCK)
 
 static int ocelot_chain_to_block(int chain, bool ingress)
 {
@@ -46,6 +49,9 @@ static int ocelot_chain_to_block(int chain, bool ingress)
 			if (chain == VCAP_IS2_CHAIN(lookup, pag))
 				return VCAP_IS2;
 
+	if (chain == OCELOT_PSFP_CHAIN)
+		return PSFP_BLOCK_ID;
+
 	return -EOPNOTSUPP;
 }
 
@@ -84,7 +90,8 @@ static bool ocelot_is_goto_target_valid(int goto_target, int chain,
 			goto_target == VCAP_IS1_CHAIN(1) ||
 			goto_target == VCAP_IS1_CHAIN(2) ||
 			goto_target == VCAP_IS2_CHAIN(0, 0) ||
-			goto_target == VCAP_IS2_CHAIN(1, 0));
+			goto_target == VCAP_IS2_CHAIN(1, 0) ||
+			goto_target == OCELOT_PSFP_CHAIN);
 
 	if (chain == VCAP_IS1_CHAIN(0))
 		return (goto_target == VCAP_IS1_CHAIN(1));
@@ -111,7 +118,11 @@ static bool ocelot_is_goto_target_valid(int goto_target, int chain,
 		if (chain == VCAP_IS2_CHAIN(0, pag))
 			return (goto_target == VCAP_IS2_CHAIN(1, pag));
 
-	/* VCAP IS2 lookup 1 cannot jump anywhere */
+	/* VCAP IS2 lookup 1 can goto to PSFP block if hardware support */
+	for (pag = 0; pag < VCAP_IS2_NUM_PAG; pag++)
+		if (chain == VCAP_IS2_CHAIN(1, pag))
+			return (goto_target == OCELOT_PSFP_CHAIN);
+
 	return false;
 }
 
@@ -353,7 +364,7 @@ static int ocelot_flower_parse_action(struct ocelot *ocelot, int port,
 
 	if (filter->goto_target == -1) {
 		if ((filter->block_id == VCAP_IS2 && filter->lookup == 1) ||
-		    chain == 0) {
+		    chain == 0 || filter->block_id == PSFP_BLOCK_ID) {
 			allow_missing_goto_target = true;
 		} else {
 			NL_SET_ERR_MSG_MOD(extack, "Missing GOTO action");
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
