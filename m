Return-Path: <SRS0=rLIJ=OU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE736C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 07:52:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F8AF61452
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Sep 2021 07:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F8AF61452
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=44oLL6blWPgGDqudVTLX1ElqMr7A/M0zCQ5PpJiQx88=; b=kcV7TDYiKMzI56
	3Y/a+E15m2TB7xXoCkJEP5Cdd+OzRJv41wBzB17Xrz1oqBan91ZOqwY2laNRCv8+gYjvVHZ92h9OA
	JKAAioct73sUUMxU0BoROGyBhn/aLrPFO0aNdzpKWkZ+LrZ00/E+TcHPERniIJnZbxGA5F2eYRtc5
	GPC+m9uEkob0aw17ik0jidHVGSwCi0Z+XoSuiWl1GEBWRUhVhUT+uPL5hWJNoNPRbVRorz0CgHMa6
	qzk27XUl63H4IX36K8OA9rwiVqdComwKUvdecx33qiLgrLf72eNap3O7WCi9Z8WxpK3sFe2TmmBlv
	qpwjMx8SwFE10d/xTvBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVqrj-00DFMb-65; Thu, 30 Sep 2021 07:52:27 +0000
Received: from inva021.nxp.com ([92.121.34.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVqpm-00DEGL-Fr; Thu, 30 Sep 2021 07:50:28 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 362E8200408;
 Thu, 30 Sep 2021 09:50:25 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 90C47200254;
 Thu, 30 Sep 2021 09:50:24 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 D9493183AD27; Thu, 30 Sep 2021 15:50:21 +0800 (+08)
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
Subject: [PATCH v6 net-next 6/8] net: dsa: felix: add stream gate settings for
 psfp
Date: Thu, 30 Sep 2021 15:59:46 +0800
Message-Id: <20210930075948.36981-7-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210930075948.36981-1-xiaoliang.yang_1@nxp.com>
References: <20210930075948.36981-1-xiaoliang.yang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_005026_882295_74A9346B 
X-CRM114-Status: GOOD (  19.52  )
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

This patch adds stream gate settings for PSFP. Use SGI table to store
stream gate entries. Disable the gate entry when it is not used by any
stream.

Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
---
 drivers/net/dsa/ocelot/felix_vsc9959.c | 217 ++++++++++++++++++++++++-
 1 file changed, 213 insertions(+), 4 deletions(-)

diff --git a/drivers/net/dsa/ocelot/felix_vsc9959.c b/drivers/net/dsa/ocelot/felix_vsc9959.c
index 9e691b22bcfa..cbfced355010 100644
--- a/drivers/net/dsa/ocelot/felix_vsc9959.c
+++ b/drivers/net/dsa/ocelot/felix_vsc9959.c
@@ -8,6 +8,7 @@
 #include <soc/mscc/ocelot_ana.h>
 #include <soc/mscc/ocelot_ptp.h>
 #include <soc/mscc/ocelot_sys.h>
+#include <net/tc_act/tc_gate.h>
 #include <soc/mscc/ocelot.h>
 #include <linux/dsa/ocelot.h>
 #include <linux/pcs-lynx.h>
@@ -1341,6 +1342,8 @@ static int vsc9959_port_setup_tc(struct dsa_switch *ds, int port,
 #define VSC9959_PSFP_SFID_MAX			175
 #define VSC9959_PSFP_GATE_ID_MAX		183
 #define VSC9959_PSFP_POLICER_MAX		383
+#define VSC9959_PSFP_GATE_LIST_NUM		4
+#define VSC9959_PSFP_GATE_CYCLETIME_MIN		5000
 
 struct felix_stream {
 	struct list_head list;
@@ -1376,6 +1379,24 @@ struct felix_stream_filter_counters {
 	u32 red;
 };
 
+struct felix_stream_gate {
+	u32 index;
+	u8 enable;
+	u8 ipv_valid;
+	u8 init_ipv;
+	u64 basetime;
+	u64 cycletime;
+	u64 cycletime_ext;
+	u32 num_entries;
+	struct action_gate_entry entries[0];
+};
+
+struct felix_stream_gate_entry {
+	struct list_head list;
+	refcount_t refcount;
+	u32 index;
+};
+
 static int vsc9959_stream_identify(struct flow_cls_offload *f,
 				   struct felix_stream *stream)
 {
@@ -1618,6 +1639,18 @@ static int vsc9959_psfp_sfi_table_add(struct ocelot *ocelot,
 	return 0;
 }
 
+static struct felix_stream_filter *
+vsc9959_psfp_sfi_table_get(struct list_head *sfi_list, u32 index)
+{
+	struct felix_stream_filter *tmp;
+
+	list_for_each_entry(tmp, sfi_list, list)
+		if (tmp->index == index)
+			return tmp;
+
+	return NULL;
+}
+
 static void vsc9959_psfp_sfi_table_del(struct ocelot *ocelot, u32 index)
 {
 	struct felix_stream_filter *tmp, *n;
@@ -1639,6 +1672,152 @@ static void vsc9959_psfp_sfi_table_del(struct ocelot *ocelot, u32 index)
 		}
 }
 
+static void vsc9959_psfp_parse_gate(const struct flow_action_entry *entry,
+				    struct felix_stream_gate *sgi)
+{
+	sgi->index = entry->gate.index;
+	sgi->ipv_valid = (entry->gate.prio < 0) ? 0 : 1;
+	sgi->init_ipv = (sgi->ipv_valid) ? entry->gate.prio : 0;
+	sgi->basetime = entry->gate.basetime;
+	sgi->cycletime = entry->gate.cycletime;
+	sgi->num_entries = entry->gate.num_entries;
+	sgi->enable = 1;
+
+	memcpy(sgi->entries, entry->gate.entries,
+	       entry->gate.num_entries * sizeof(struct action_gate_entry));
+}
+
+static u32 vsc9959_sgi_cfg_status(struct ocelot *ocelot)
+{
+	return ocelot_read(ocelot, ANA_SG_ACCESS_CTRL);
+}
+
+static int vsc9959_psfp_sgi_set(struct ocelot *ocelot,
+				struct felix_stream_gate *sgi)
+{
+	struct action_gate_entry *e;
+	struct timespec64 base_ts;
+	u32 interval_sum = 0;
+	u32 val;
+	int i;
+
+	if (sgi->index > VSC9959_PSFP_GATE_ID_MAX)
+		return -EINVAL;
+
+	ocelot_write(ocelot, ANA_SG_ACCESS_CTRL_SGID(sgi->index),
+		     ANA_SG_ACCESS_CTRL);
+
+	if (!sgi->enable) {
+		ocelot_rmw(ocelot, ANA_SG_CONFIG_REG_3_INIT_GATE_STATE,
+			   ANA_SG_CONFIG_REG_3_INIT_GATE_STATE |
+			   ANA_SG_CONFIG_REG_3_GATE_ENABLE,
+			   ANA_SG_CONFIG_REG_3);
+
+		return 0;
+	}
+
+	if (sgi->cycletime < VSC9959_PSFP_GATE_CYCLETIME_MIN ||
+	    sgi->cycletime > NSEC_PER_SEC)
+		return -EINVAL;
+
+	if (sgi->num_entries > VSC9959_PSFP_GATE_LIST_NUM)
+		return -EINVAL;
+
+	vsc9959_new_base_time(ocelot, sgi->basetime, sgi->cycletime, &base_ts);
+	ocelot_write(ocelot, base_ts.tv_nsec, ANA_SG_CONFIG_REG_1);
+	val = lower_32_bits(base_ts.tv_sec);
+	ocelot_write(ocelot, val, ANA_SG_CONFIG_REG_2);
+
+	val = upper_32_bits(base_ts.tv_sec);
+	ocelot_write(ocelot,
+		     (sgi->ipv_valid ? ANA_SG_CONFIG_REG_3_IPV_VALID : 0) |
+		     ANA_SG_CONFIG_REG_3_INIT_IPV(sgi->init_ipv) |
+		     ANA_SG_CONFIG_REG_3_GATE_ENABLE |
+		     ANA_SG_CONFIG_REG_3_LIST_LENGTH(sgi->num_entries) |
+		     ANA_SG_CONFIG_REG_3_INIT_GATE_STATE |
+		     ANA_SG_CONFIG_REG_3_BASE_TIME_SEC_MSB(val),
+		     ANA_SG_CONFIG_REG_3);
+
+	ocelot_write(ocelot, sgi->cycletime, ANA_SG_CONFIG_REG_4);
+
+	e = sgi->entries;
+	for (i = 0; i < sgi->num_entries; i++) {
+		u32 ips = (e[i].ipv < 0) ? 0 : (e[i].ipv + 8);
+
+		ocelot_write_rix(ocelot, ANA_SG_GCL_GS_CONFIG_IPS(ips) |
+				 (e[i].gate_state ?
+				  ANA_SG_GCL_GS_CONFIG_GATE_STATE : 0),
+				 ANA_SG_GCL_GS_CONFIG, i);
+
+		interval_sum += e[i].interval;
+		ocelot_write_rix(ocelot, interval_sum, ANA_SG_GCL_TI_CONFIG, i);
+	}
+
+	ocelot_rmw(ocelot, ANA_SG_ACCESS_CTRL_CONFIG_CHANGE,
+		   ANA_SG_ACCESS_CTRL_CONFIG_CHANGE,
+		   ANA_SG_ACCESS_CTRL);
+
+	return readx_poll_timeout(vsc9959_sgi_cfg_status, ocelot, val,
+				  (!(ANA_SG_ACCESS_CTRL_CONFIG_CHANGE & val)),
+				  10, 100000);
+}
+
+static int vsc9959_psfp_sgi_table_add(struct ocelot *ocelot,
+				      struct felix_stream_gate *sgi)
+{
+	struct felix_stream_gate_entry *tmp;
+	struct ocelot_psfp_list *psfp;
+	int ret;
+
+	psfp = &ocelot->psfp;
+
+	list_for_each_entry(tmp, &psfp->sgi_list, list)
+		if (tmp->index == sgi->index) {
+			refcount_inc(&tmp->refcount);
+			return 0;
+		}
+
+	tmp = kzalloc(sizeof(*tmp), GFP_KERNEL);
+	if (!tmp)
+		return -ENOMEM;
+
+	ret = vsc9959_psfp_sgi_set(ocelot, sgi);
+	if (ret) {
+		kfree(tmp);
+		return ret;
+	}
+
+	tmp->index = sgi->index;
+	refcount_set(&tmp->refcount, 1);
+	list_add_tail(&tmp->list, &psfp->sgi_list);
+
+	return 0;
+}
+
+static void vsc9959_psfp_sgi_table_del(struct ocelot *ocelot,
+				       u32 index)
+{
+	struct felix_stream_gate_entry *tmp, *n;
+	struct felix_stream_gate sgi = {0};
+	struct ocelot_psfp_list *psfp;
+	u8 z;
+
+	psfp = &ocelot->psfp;
+
+	list_for_each_entry_safe(tmp, n, &psfp->sgi_list, list)
+		if (tmp->index == index) {
+			z = refcount_dec_and_test(&tmp->refcount);
+			if (z) {
+				sgi.index = index;
+				sgi.enable = 0;
+				vsc9959_psfp_sgi_set(ocelot, &sgi);
+				list_del(&tmp->list);
+				kfree(tmp);
+			}
+			break;
+		}
+}
+
 static void vsc9959_psfp_counters_get(struct ocelot *ocelot, u32 index,
 				      struct felix_stream_filter_counters *counters)
 {
@@ -1666,8 +1845,9 @@ static int vsc9959_psfp_filter_add(struct ocelot *ocelot,
 	const struct flow_action_entry *a;
 	struct felix_stream *stream_entry;
 	struct felix_stream stream = {0};
+	struct felix_stream_gate *sgi;
 	struct ocelot_psfp_list *psfp;
-	int ret, i;
+	int ret, i, size;
 
 	psfp = &ocelot->psfp;
 
@@ -1680,6 +1860,18 @@ static int vsc9959_psfp_filter_add(struct ocelot *ocelot,
 	flow_action_for_each(i, a, &f->rule->action) {
 		switch (a->id) {
 		case FLOW_ACTION_GATE:
+			size = struct_size(sgi, entries, a->gate.num_entries);
+			sgi = kzalloc(size, GFP_KERNEL);
+			vsc9959_psfp_parse_gate(a, sgi);
+			ret = vsc9959_psfp_sgi_table_add(ocelot, sgi);
+			if (ret) {
+				kfree(sgi);
+				return ret;
+			}
+			sfi.sg_valid = 1;
+			sfi.sgid = sgi->index;
+			kfree(sgi);
+			break;
 		case FLOW_ACTION_POLICE:
 		default:
 			return -EOPNOTSUPP;
@@ -1690,7 +1882,8 @@ static int vsc9959_psfp_filter_add(struct ocelot *ocelot,
 	stream_entry = vsc9959_stream_table_lookup(&psfp->stream_list, &stream);
 	if (stream_entry) {
 		NL_SET_ERR_MSG_MOD(extack, "This stream is already added");
-		return -EEXIST;
+		ret = -EEXIST;
+		goto err;
 	}
 
 	sfi.prio_valid = (stream.prio < 0 ? 0 : 1);
@@ -1699,14 +1892,22 @@ static int vsc9959_psfp_filter_add(struct ocelot *ocelot,
 
 	ret = vsc9959_psfp_sfi_table_add(ocelot, &sfi);
 	if (ret)
-		return ret;
+		goto err;
 
 	stream.sfid = sfi.index;
 	stream.sfid_valid = 1;
 	ret = vsc9959_stream_table_add(ocelot, &psfp->stream_list,
 				       &stream, extack);
-	if (ret)
+	if (ret) {
 		vsc9959_psfp_sfi_table_del(ocelot, stream.sfid);
+		goto err;
+	}
+
+	return 0;
+
+err:
+	if (sfi.sg_valid)
+		vsc9959_psfp_sgi_table_del(ocelot, sfi.sgid);
 
 	return ret;
 }
@@ -1714,6 +1915,7 @@ static int vsc9959_psfp_filter_add(struct ocelot *ocelot,
 static int vsc9959_psfp_filter_del(struct ocelot *ocelot,
 				   struct flow_cls_offload *f)
 {
+	static struct felix_stream_filter *sfi;
 	struct ocelot_psfp_list *psfp;
 	struct felix_stream *stream;
 
@@ -1723,6 +1925,13 @@ static int vsc9959_psfp_filter_del(struct ocelot *ocelot,
 	if (!stream)
 		return -ENOMEM;
 
+	sfi = vsc9959_psfp_sfi_table_get(&psfp->sfi_list, stream->sfid);
+	if (!sfi)
+		return -ENOMEM;
+
+	if (sfi->sg_valid)
+		vsc9959_psfp_sgi_table_del(ocelot, sfi->sgid);
+
 	vsc9959_psfp_sfi_table_del(ocelot, stream->sfid);
 
 	stream->sfid_valid = 0;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
