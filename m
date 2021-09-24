Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500E1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:44:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A8B76105A
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:44:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1A8B76105A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W5FzSPXu95lql7VBkNBraoSs4fMOjRCG2JBi4qw7xl8=; b=LgfVaPtWB84AqD
	Cf7MAhhIag1VBVvO8jsjhYqKkxITS4d0WElzhuxRVoV8LXYoWxVu3cOD1sM6/eSOm9qLbwKu5H8iw
	EgPGaoFfsVMm/R7FF4/gAPRLt23iwIcG9vfxhTXGdKbPe+qMinVzuQjzTdV2E5suxsnNLmiellrxd
	rusBBuP4pr1hm6mjPVSv5LWsinAylRS/E/p+0RqKgfxOVwTfh+dlVaNf4qF0WhScC5kLk3aT9O7p8
	8K5LPo9ObrG4w5xPslombf7dsyQXIFInynAyhklJ5UqMMGD4p3EE8YptFTUmDfSsK+qGvX+LYMRoc
	HRAA4fEVqZugYRyKnzeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mThkq-00Dw7O-BY; Fri, 24 Sep 2021 09:44:28 +0000
Received: from inva021.nxp.com ([92.121.34.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mThjJ-00DvHv-NM; Fri, 24 Sep 2021 09:42:55 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 776CA2030BE;
 Fri, 24 Sep 2021 11:42:52 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D3E88204154;
 Fri, 24 Sep 2021 11:42:51 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 3E801183AC8B; Fri, 24 Sep 2021 17:42:48 +0800 (+08)
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
Subject: [PATCH v5 net-next 5/9] net: mscc: ocelot: add gate and police action
 offload to PSFP
Date: Fri, 24 Sep 2021 17:52:22 +0800
Message-Id: <20210924095226.38079-6-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210924095226.38079-1-xiaoliang.yang_1@nxp.com>
References: <20210924095226.38079-1-xiaoliang.yang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_024254_064502_32F6C15F 
X-CRM114-Status: GOOD (  16.82  )
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

PSFP support gate and police action. This patch add the gate and police
action to flower parse action, check chain ID to determine which block
to offload. Adding psfp callback functions to add, delete and update gate
and police in PSFP table if hardware supports it.

Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
---
 drivers/net/ethernet/mscc/ocelot.c        |  3 ++
 drivers/net/ethernet/mscc/ocelot_flower.c | 52 ++++++++++++++++++++++-
 include/soc/mscc/ocelot.h                 |  5 +++
 include/soc/mscc/ocelot_vcap.h            |  1 +
 4 files changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mscc/ocelot.c b/drivers/net/ethernet/mscc/ocelot.c
index dc65247b91be..fb318e3b72d0 100644
--- a/drivers/net/ethernet/mscc/ocelot.c
+++ b/drivers/net/ethernet/mscc/ocelot.c
@@ -2179,6 +2179,9 @@ int ocelot_init(struct ocelot *ocelot)
 	ocelot_vcap_init(ocelot);
 	ocelot_cpu_port_init(ocelot);
 
+	if (ocelot->ops->psfp_init)
+		ocelot->ops->psfp_init(ocelot);
+
 	for (port = 0; port < ocelot->num_phys_ports; port++) {
 		/* Clear all counters (5 groups) */
 		ocelot_write(ocelot, SYS_STAT_CFG_STAT_VIEW(port) |
diff --git a/drivers/net/ethernet/mscc/ocelot_flower.c b/drivers/net/ethernet/mscc/ocelot_flower.c
index ce812194e44c..daeaee99933d 100644
--- a/drivers/net/ethernet/mscc/ocelot_flower.c
+++ b/drivers/net/ethernet/mscc/ocelot_flower.c
@@ -220,10 +220,14 @@ static int ocelot_flower_parse_action(struct ocelot *ocelot, int port,
 			filter->type = OCELOT_VCAP_FILTER_OFFLOAD;
 			break;
 		case FLOW_ACTION_POLICE:
+			if (filter->block_id == PSFP_BLOCK_ID) {
+				filter->type = OCELOT_PSFP_FILTER_OFFLOAD;
+				break;
+			}
 			if (filter->block_id != VCAP_IS2 ||
 			    filter->lookup != 0) {
 				NL_SET_ERR_MSG_MOD(extack,
-						   "Police action can only be offloaded to VCAP IS2 lookup 0");
+						   "Police action can only be offloaded to VCAP IS2 lookup 0 or PSFP");
 				return -EOPNOTSUPP;
 			}
 			if (filter->goto_target != -1) {
@@ -356,6 +360,14 @@ static int ocelot_flower_parse_action(struct ocelot *ocelot, int port,
 			filter->action.pcp_a_val = a->vlan.prio;
 			filter->type = OCELOT_VCAP_FILTER_OFFLOAD;
 			break;
+		case FLOW_ACTION_GATE:
+			if (filter->block_id != PSFP_BLOCK_ID) {
+				NL_SET_ERR_MSG_MOD(extack,
+						   "Gate action can only be offloaded to PSFP chain");
+				return -EOPNOTSUPP;
+			}
+			filter->type = OCELOT_PSFP_FILTER_OFFLOAD;
+			break;
 		default:
 			NL_SET_ERR_MSG_MOD(extack, "Cannot offload action");
 			return -EOPNOTSUPP;
@@ -646,6 +658,10 @@ static int ocelot_flower_parse(struct ocelot *ocelot, int port, bool ingress,
 	if (ret)
 		return ret;
 
+	/* PSFP filter need to parse key by stream identification function. */
+	if (filter->type == OCELOT_PSFP_FILTER_OFFLOAD)
+		return 0;
+
 	return ocelot_flower_parse_key(ocelot, port, ingress, f, filter);
 }
 
@@ -718,6 +734,15 @@ int ocelot_cls_flower_replace(struct ocelot *ocelot, int port,
 	if (filter->type == OCELOT_VCAP_FILTER_DUMMY)
 		return ocelot_vcap_dummy_filter_add(ocelot, filter);
 
+	if (filter->type == OCELOT_PSFP_FILTER_OFFLOAD) {
+		kfree(filter);
+		if (ocelot->ops->psfp_filter_add)
+			return ocelot->ops->psfp_filter_add(ocelot, f);
+
+		NL_SET_ERR_MSG_MOD(extack, "PSFP chain is not supported in HW");
+		return -EOPNOTSUPP;
+	}
+
 	return ocelot_vcap_filter_add(ocelot, filter, f->common.extack);
 }
 EXPORT_SYMBOL_GPL(ocelot_cls_flower_replace);
@@ -733,6 +758,13 @@ int ocelot_cls_flower_destroy(struct ocelot *ocelot, int port,
 	if (block_id < 0)
 		return 0;
 
+	if (block_id == PSFP_BLOCK_ID) {
+		if (ocelot->ops->psfp_filter_del)
+			return ocelot->ops->psfp_filter_del(ocelot, f);
+
+		return -EOPNOTSUPP;
+	}
+
 	block = &ocelot->block[block_id];
 
 	filter = ocelot_vcap_block_find_filter_by_id(block, f->cookie, true);
@@ -751,12 +783,25 @@ int ocelot_cls_flower_stats(struct ocelot *ocelot, int port,
 {
 	struct ocelot_vcap_filter *filter;
 	struct ocelot_vcap_block *block;
+	struct flow_stats stats;
 	int block_id, ret;
 
 	block_id = ocelot_chain_to_block(f->common.chain_index, ingress);
 	if (block_id < 0)
 		return 0;
 
+	if (block_id == PSFP_BLOCK_ID) {
+		if (ocelot->ops->psfp_stats_get) {
+			ret = ocelot->ops->psfp_stats_get(ocelot, f, &stats);
+			if (ret)
+				return ret;
+
+			goto stats_update;
+		}
+
+		return -EOPNOTSUPP;
+	}
+
 	block = &ocelot->block[block_id];
 
 	filter = ocelot_vcap_block_find_filter_by_id(block, f->cookie, true);
@@ -767,7 +812,10 @@ int ocelot_cls_flower_stats(struct ocelot *ocelot, int port,
 	if (ret)
 		return ret;
 
-	flow_stats_update(&f->stats, 0x0, filter->stats.pkts, 0, 0x0,
+	stats.pkts = filter->stats.pkts;
+
+stats_update:
+	flow_stats_update(&f->stats, 0x0, stats.pkts, 0, 0x0,
 			  FLOW_ACTION_HW_STATS_IMMEDIATE);
 	return 0;
 }
diff --git a/include/soc/mscc/ocelot.h b/include/soc/mscc/ocelot.h
index 455293652257..edf28d80870d 100644
--- a/include/soc/mscc/ocelot.h
+++ b/include/soc/mscc/ocelot.h
@@ -564,6 +564,11 @@ struct ocelot_ops {
 	u16 (*wm_enc)(u16 value);
 	u16 (*wm_dec)(u16 value);
 	void (*wm_stat)(u32 val, u32 *inuse, u32 *maxuse);
+	void (*psfp_init)(struct ocelot *ocelot);
+	int (*psfp_filter_add)(struct ocelot *ocelot, struct flow_cls_offload *f);
+	int (*psfp_filter_del)(struct ocelot *ocelot, struct flow_cls_offload *f);
+	int (*psfp_stats_get)(struct ocelot *ocelot, struct flow_cls_offload *f,
+			      struct flow_stats *stats);
 };
 
 struct ocelot_vcap_block {
diff --git a/include/soc/mscc/ocelot_vcap.h b/include/soc/mscc/ocelot_vcap.h
index 25fd525aaf92..24b495ce140c 100644
--- a/include/soc/mscc/ocelot_vcap.h
+++ b/include/soc/mscc/ocelot_vcap.h
@@ -646,6 +646,7 @@ enum ocelot_vcap_filter_type {
 	OCELOT_VCAP_FILTER_DUMMY,
 	OCELOT_VCAP_FILTER_PAG,
 	OCELOT_VCAP_FILTER_OFFLOAD,
+	OCELOT_PSFP_FILTER_OFFLOAD,
 };
 
 struct ocelot_vcap_id {
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
