Return-Path: <SRS0=tGyr=OO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA38C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:46:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F2FC61050
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Sep 2021 09:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9F2FC61050
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=nxp.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFMW0Kys62143/Ueo/22WNZgLGfkfIn6lwtYDE27U+A=; b=VtQAgJI1kVe9OX
	2aKI0Bfr5tJrcZximK/EXnFUIocjXYW0kkCJCYwLGLyIeZU+NfwSiVgDqt/S7CUEzMtWTfdg94SdU
	Xj15msYhjhVOk2cD6ejHSvlRe95zGJgc/rVAWjnXdH0lLCiD9RuXQAJV+dd8qe9fKC8mBVCjrVImn
	ou/xHFEtP3tfiUuo8j5aus1hz9jSNKEZB7gpHXBnlnbiBv21ciuGRiUIPIIRXT68pA7xEX/KqbyVK
	skmuU58LwFO6sS0zhYCq/rL+QkSTBlMP4gAVDVf1KW96WYiq6JYpavtPhUdnM7sLfKtAU09XhFqij
	tt8uVT0ONYElbYOgUyvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mThmp-00DxPo-2B; Fri, 24 Sep 2021 09:46:31 +0000
Received: from inva021.nxp.com ([92.121.34.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mThjV-00DvLE-0A; Fri, 24 Sep 2021 09:43:06 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B22492030C9;
 Fri, 24 Sep 2021 11:43:03 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4D9D12030C5;
 Fri, 24 Sep 2021 11:43:03 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 865B8183AC89; Fri, 24 Sep 2021 17:43:00 +0800 (+08)
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
Subject: [PATCH v5 net-next 9/9] net: dsa: felix: use vcap policer to set flow
 meter for psfp
Date: Fri, 24 Sep 2021 17:52:26 +0800
Message-Id: <20210924095226.38079-10-xiaoliang.yang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210924095226.38079-1-xiaoliang.yang_1@nxp.com>
References: <20210924095226.38079-1-xiaoliang.yang_1@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_024305_337922_1806621C 
X-CRM114-Status: GOOD (  12.01  )
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

This patch add police action to set flow meter table which is defined
in IEEE802.1Qci. Flow metering is two rates two buckets and three color
marker to policing the frames, we only enable one rate one bucket in
this patch.

Flow metering shares a same policer pool with VCAP policers, so the PSFP
policer calls ocelot_vcap_policer_add() and ocelot_vcap_policer_del() to
set flow meter police.

Signed-off-by: Xiaoliang Yang <xiaoliang.yang_1@nxp.com>
---
 drivers/net/dsa/ocelot/felix_vsc9959.c | 32 +++++++++++++++++++++++++-
 1 file changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/ocelot/felix_vsc9959.c b/drivers/net/dsa/ocelot/felix_vsc9959.c
index 25e132afd621..e6c3ccc17fe6 100644
--- a/drivers/net/dsa/ocelot/felix_vsc9959.c
+++ b/drivers/net/dsa/ocelot/felix_vsc9959.c
@@ -1343,6 +1343,7 @@ static int vsc9959_port_setup_tc(struct dsa_switch *ds, int port,
 
 #define VSC9959_PSFP_SFID_MAX			175
 #define VSC9959_PSFP_GATE_ID_MAX		183
+#define VSC9959_PSFP_POLICER_BASE		63
 #define VSC9959_PSFP_POLICER_MAX		383
 #define VSC9959_PSFP_GATE_LIST_NUM		4
 #define VSC9959_PSFP_GATE_CYCLETIME_MIN		5000
@@ -1850,7 +1851,10 @@ static int vsc9959_psfp_filter_add(struct ocelot *ocelot,
 	struct felix_stream stream = {0};
 	struct felix_stream_gate *sgi;
 	struct ocelot_psfp_list *psfp;
+	struct ocelot_policer pol;
 	int ret, i, size;
+	u64 rate, burst;
+	u32 index;
 
 	psfp = &ocelot->psfp;
 
@@ -1869,13 +1873,33 @@ static int vsc9959_psfp_filter_add(struct ocelot *ocelot,
 			ret = vsc9959_psfp_sgi_table_add(ocelot, sgi);
 			if (ret) {
 				kfree(sgi);
-				return ret;
+				goto err;
 			}
 			sfi.sg_valid = 1;
 			sfi.sgid = sgi->index;
 			kfree(sgi);
 			break;
 		case FLOW_ACTION_POLICE:
+			index = a->police.index + VSC9959_PSFP_POLICER_BASE;
+			if (index > VSC9959_PSFP_POLICER_MAX) {
+				ret = -EINVAL;
+				goto err;
+			}
+
+			rate = a->police.rate_bytes_ps;
+			burst = rate * PSCHED_NS2TICKS(a->police.burst);
+			pol = (struct ocelot_policer) {
+				.burst = div_u64(burst, PSCHED_TICKS_PER_SEC),
+				.rate = div_u64(rate, 1000) * 8,
+			};
+			ret = ocelot_vcap_policer_add(ocelot, index, &pol);
+			if (ret)
+				goto err;
+
+			sfi.fm_valid = 1;
+			sfi.fmid = index;
+			sfi.maxsdu = a->police.mtu;
+			break;
 		default:
 			return -EOPNOTSUPP;
 		}
@@ -1912,6 +1936,9 @@ static int vsc9959_psfp_filter_add(struct ocelot *ocelot,
 	if (sfi.sg_valid)
 		vsc9959_psfp_sgi_table_del(ocelot, sfi.sgid);
 
+	if (sfi.fm_valid)
+		ocelot_vcap_policer_del(ocelot, sfi.fmid);
+
 	return ret;
 }
 
@@ -1935,6 +1962,9 @@ static int vsc9959_psfp_filter_del(struct ocelot *ocelot,
 	if (sfi->sg_valid)
 		vsc9959_psfp_sgi_table_del(ocelot, sfi->sgid);
 
+	if (sfi->fm_valid)
+		ocelot_vcap_policer_del(ocelot, sfi->fmid);
+
 	vsc9959_psfp_sfi_table_del(ocelot, stream->sfid);
 
 	stream->sfid_valid = 0;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
