Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CECCC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 02:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EK/+jQykCuZBDkhzoaestMgPyE4I6OoFVeDKWD79pHw=; b=coSKU/uTmlu0Jb
	/pqOb1wenJAidEWYLVQ6yT/7VJSMPnpnuuJeAB/RBg41+jNVGWpy3UG1+5ExYzg80A5uFCaMd5hsu
	GQT/TrEgGRT9Hqim7EbMtO9XwXF/ck2YuJbl63jmGd6TUt4FePCZPCvsw7Yi/VW+EJlBXL5996lND
	nLqLF6Ulg1nXotRU+hSnu3qh9Gwd8fcmHHIo16a/690vI1H1gZJ/5qeERO11DpGjQCfE0sGxVb+6s
	HZ1HA5zhPx3xWQ+zLrb41kETugkI0B3+Xe/9kPz6soh6eQjgz17bFmsIP6Lh1mhAdz5gP3lCvKVks
	9qJqgOiiveYk1qstps9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrs00-00A3JU-PN; Fri, 20 May 2022 02:04:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrrzX-00A35I-IO; Fri, 20 May 2022 02:03:48 +0000
X-UUID: 315cc95635664af28c67e631a9cd4ffb-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:c352754a-ff8e-4451-9010-f91466a1b872, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:9585dee2-edbf-4bd4-8a34-dfc5f7bb086d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 315cc95635664af28c67e631a9cd4ffb-20220519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1711480380; Thu, 19 May 2022 19:03:36 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 19:00:19 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 May 2022 10:00:17 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 20 May 2022 10:00:17 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <rex-bc.chen@mediatek.com>, <jitao.shi@mediatek.com>, "# 5 . 10 . x :
 b255d51e3967 : sched : Modify dsi funcs to atomic operations"
 <stable@vger.kernel.org>, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: [PATCH v7,
 3/4] drm/mediatek: keep dsi as LP00 before dcs cmds transfer
Date: Fri, 20 May 2022 10:00:06 +0800
Message-ID: <1653012007-11854-4-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1653012007-11854-1-git-send-email-xinlei.lee@mediatek.com>
References: <1653012007-11854-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_190347_640603_C43B8E4F 
X-CRM114-Status: GOOD (  10.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Jitao Shi <jitao.shi@mediatek.com>

To comply with the panel sequence, hold the mipi signal to LP00 before the dcs cmds transmission,
and pull the mipi signal high from LP00 to LP11 until the start of the dcs cmds transmission.
The normal panel timing is :
(1) pp1800 DC pull up
(2) avdd & avee AC pull high
(3) lcm_reset pull high -> pull low -> pull high
(4) Pull MIPI signal high (LP11) -> initial code -> send video data(HS mode)
The power-off sequence is reversed.
If dsi is not in cmd mode, then dsi will pull the mipi signal high in the mtk_output_dsi_enable function.
The delay in lane_ready func is the reaction time of dsi_rx after pulling up the mipi signal.

Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge API")

Cc: <stable@vger.kernel.org> # 5.10.x: b255d51e3967: sched: Modify dsi funcs to atomic operations
Cc: <stable@vger.kernel.org> # 5.10.x: 72c69c977502: sched: Separate poweron/poweroff from enable/disable and define new funcs
Cc: <stable@vger.kernel.org> # 5.10.x
Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index d9a6b928dba8..25e84d9426bf 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -203,6 +203,7 @@ struct mtk_dsi {
 	struct mtk_phy_timing phy_timing;
 	int refcount;
 	bool enabled;
+	bool lanes_ready;
 	u32 irq_data;
 	wait_queue_head_t irq_wait_queue;
 	const struct mtk_dsi_driver_data *driver_data;
@@ -661,18 +662,11 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_reset_engine(dsi);
 	mtk_dsi_phy_timconfig(dsi);
 
-	mtk_dsi_rxtx_control(dsi);
-	usleep_range(30, 100);
-	mtk_dsi_reset_dphy(dsi);
 	mtk_dsi_ps_control_vact(dsi);
 	mtk_dsi_set_vm_cmd(dsi);
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
 
-	mtk_dsi_clk_ulp_mode_leave(dsi);
-	mtk_dsi_lane0_ulp_mode_leave(dsi);
-	mtk_dsi_clk_hs_mode(dsi, 0);
-
 	return 0;
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);
@@ -701,6 +695,23 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
 	clk_disable_unprepare(dsi->digital_clk);
 
 	phy_power_off(dsi->phy);
+
+	dsi->lanes_ready = false;
+}
+
+static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
+{
+	if (!dsi->lanes_ready) {
+		dsi->lanes_ready = true;
+		mtk_dsi_rxtx_control(dsi);
+		usleep_range(30, 100);
+		mtk_dsi_reset_dphy(dsi);
+		mtk_dsi_clk_ulp_mode_leave(dsi);
+		mtk_dsi_lane0_ulp_mode_leave(dsi);
+		mtk_dsi_clk_hs_mode(dsi, 0);
+		msleep(20);
+		/* The reaction time after pulling up the mipi signal for dsi_rx */
+	}
 }
 
 static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
@@ -708,6 +719,7 @@ static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
 	if (dsi->enabled)
 		return;
 
+	mtk_dsi_lane_ready(dsi);
 	mtk_dsi_set_mode(dsi);
 	mtk_dsi_clk_hs_mode(dsi, 1);
 
@@ -1017,6 +1029,8 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	if (MTK_DSI_HOST_IS_READ(msg->type))
 		irq_flag |= LPRX_RD_RDY_INT_FLAG;
 
+	mtk_dsi_lane_ready(dsi);
+
 	ret = mtk_dsi_host_send_cmd(dsi, msg, irq_flag);
 	if (ret)
 		goto restore_dsi_mode;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
