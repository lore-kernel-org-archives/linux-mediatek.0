Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5C93CCFA00
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Nov 2025 09:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RvumGGVXdjMGN0PV547acUofErF3QcH48kAnJ9t7mfc=; b=VEsLkpSDRt4bk9DY8JeNf7L4sh
	PkKR07H3oxQPlu8IdI92nMFXKjAj4rsy47VJtdK6iUgTTOfuii+OcrIyu3G/sk21ygEv8FUuLa+rc
	avgq1f1BXUyv/KOyK9JlnDNHml0z1at+W2P2lFH+cWGA/ian3VjAHyIC2kjYnH+Mp59a3K4H79qXx
	WMuDPDqzeIuNkVYnRRrBwbWLMHoKf8ZUDcghFDzCbQZXAOWid9NCjGO0haexN0jIf8h4ByVmuJ37X
	BgQgRI5Nv7zku9TR/FgrgEXEbLa6oZDBSHBrg0rleacd6ojDBttPznBUdiLHKZR4FuoYx5wAGjo+O
	2RIx+CbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCuI-0000000BUPB-2BpT;
	Tue, 04 Nov 2025 09:00:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGCuH-0000000BUOs-0h9s
	for linux-mediatek@bombadil.infradead.org;
	Tue, 04 Nov 2025 09:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RvumGGVXdjMGN0PV547acUofErF3QcH48kAnJ9t7mfc=; b=F6XXB77WzlzFL/xxrPFeGRw3xG
	3DP6tguMGwMVeOL7sTdudhRGVoms14ioopU44Gdjl3Yuy/mezFEwOCDheW5b3jrzObSdX3Naotpjh
	NUK3BnX0jRy5Z+A3MkgKR0Bn+XFbeBAtvjg6eG7+3qfZ0RVzbQdTzdEHzgwZiGll8KB3xEUaBH24J
	2F6UAq+1PRmwMe3mw/LxLJ5OdJGD+U95K5AIWZ+1rMlrRV7+4kUH0VIMxwz7jseK5Ol55fLc6yJuy
	zmaGveIfqPLEBpOKfr6TVrpHhMC/Z7IhKeLJRYvL7VBttb1YpmBfhCbz9yiFpWquXK/J3HjEjExGh
	524Nl8xg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGC2V-0000000HDSN-41cY
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Nov 2025 08:05:18 +0000
X-UUID: a785c0a0b95c11f0a52f393f94899d25-20251104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=RvumGGVXdjMGN0PV547acUofErF3QcH48kAnJ9t7mfc=;
	b=IPFE+RtvIwm3V/4CJ/9CljXOv8+9wWUv2/gyxh+6E7JC+8h+c5s6DEU/Z87cxDc0mKNwJWbcaurGI2q65s0TY35wZ4SIjuu4wwvWhvf2vI/vlvQu3BLTOZJ1vOQiUI5SPw0EDU4zYscA2uXxBGWCh/A0JitgLoSNFczC0VBoBQQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.6,REQID:c11f7001-2894-4a12-928a-79cae7715519,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:a9d874c,CLOUDID:f554e47c-f9d7-466d-a1f7-15b5fcad2ce6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|888|898,TC:-5,Content:
	0|15|50,EDM:-3,IP:nil,URL:99|1,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a785c0a0b95c11f0a52f393f94899d25-20251104
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <liankun.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2019475669; Tue, 04 Nov 2025 02:00:04 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 4 Nov 2025 17:00:00 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1748.26 via Frontend Transport; Tue, 4 Nov 2025 17:00:00 +0800
From: Liankun Yang <liankun.yang@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>,
	<simona@ffwll.ch>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <mac.shen@mediatek.com>,
	<peng.liu@mediatek.com>, <liankun.yang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 1/2] drm/mediatek: Adjust bandwidth limit for DP
Date: Tue, 4 Nov 2025 16:55:11 +0800
Message-ID: <20251104085957.1175-2-liankun.yang@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20251104085957.1175-1-liankun.yang@mediatek.com>
References: <20251104085957.1175-1-liankun.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_080516_330008_28A42C61 
X-CRM114-Status: GOOD (  15.65  )
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

By adjusting the order of link training and relocating it to HPD,
link training can identify the usability of each lane in the current link.

It also supports handling signal instability and weakness due to
environmental issues, enabling the acquisition of a stable bandwidth
for the current link. Subsequently, DP work can proceed based on
the actual maximum bandwidth.

It should training in the hpd event thread.
Check the mode with lane count and link rate of training.

If we're eDP and capabilities were already parsed we can skip
reading again because eDP panels aren't hotpluggable hence the
caps and training information won't ever change in a boot life

Therefore, bridge typec judgment is required for edp training in
atomic_enable function.

The `mtk_dp_aux_panel_poweron` function fails to align.
Within the `mtk_dp_hpd_event_thread`, if DP is disconnected,
the `mtk_dp_aux_panel_poweron` function will write from `aux` to `DPRX`,
causing a failure and thus preventing symmetry.

Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
---
Change in V7:
- Separate the edp part:
https://patchwork.kernel.org/project/linux-mediatek/patch/20250822120506.15486-1-liankun.yang@mediatek.com/

Change in V6:
- Fixed power on in atomic enable.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20250630080824.7107-1-liankun.yang@mediatek.com/

Change in V5:
- Fixed the issue that the 4th version of the patch caused DP to have no screen.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20250625095446.31726-1-liankun.yang@mediatek.com/

Change in V4:
- Tested the internal eDP display on MT8195 Tomato and it is fine.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20250318140236.13650-2-liankun.yang@mediatek.com/

Change in V3:
- Remove 'mtk_dp->enabled = false" in atomic disable.
- Remove 'mtk_dp->enabled = true" in atomic enable.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20241025083036.8829-4-liankun.yang@mediatek.com/

Change in V2:
- Adjust DP training timing.
- Adjust parse capabilities timing.
- Add power on/off for connect/disconnect.
Per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek/patch/20240315015233.2023-1-liankun.yang@mediatek.com/
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index bef6eeb30d3e..0ba2c208811c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1976,6 +1976,7 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 	struct mtk_dp *mtk_dp = dev;
 	unsigned long flags;
 	u32 status;
+	int ret;
 
 	if (mtk_dp->need_debounce && mtk_dp->train_info.cable_plugged_in)
 		msleep(100);
@@ -1994,9 +1995,28 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 			memset(&mtk_dp->info.audio_cur_cfg, 0,
 			       sizeof(mtk_dp->info.audio_cur_cfg));
 
+			mtk_dp->enabled = false;
+			/* power off aux */
+			mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
+					   DP_PWR_STATE_BANDGAP_TPLL,
+					   DP_PWR_STATE_MASK);
+
 			mtk_dp->need_debounce = false;
 			mod_timer(&mtk_dp->debounce_timer,
 				  jiffies + msecs_to_jiffies(100) - 1);
+		} else {
+			mtk_dp_aux_panel_poweron(mtk_dp, true);
+
+			ret = mtk_dp_parse_capabilities(mtk_dp);
+			if (ret)
+				drm_err(mtk_dp->drm_dev, "Can't parse capabilities\n");
+
+			/* Training */
+			ret = mtk_dp_training(mtk_dp);
+			if (ret)
+				drm_err(mtk_dp->drm_dev, "Training failed, %d\n", ret);
+
+			mtk_dp->enabled = true;
 		}
 	}
 
-- 
2.45.2


