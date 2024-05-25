Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A08A0C25B78
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 May 2024 23:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tl2QN13jl/RXNBMTp3Wzf+yLZtDlERtwTZOrjciV6eA=; b=4slE7D9SW2YTcwTk4fsKQw9Ego
	CqYMtmYFqQ2iumYAB4UEebQ1nWPnDrbnz300QcUKJZubDEPuEA2HFJgHK4eTBedeHhbMp0h0rCv7k
	Cls9JOODTlU44Jp8dADNll1yxNE5qg2o6wwmIEC21ASzSkQtKw2hSXS7KwiYY1MoCRNMKSwozyZ45
	ZVuAUHvyshyg9FSXPVb0/9ewe5jvZIAjjdBeACoY8Q9zuiqd5/gRyDBzsvUImxBDUAOG4doSPzFqX
	x6xLktRafCAmJC7uusjJzQK6bMq1igcjUWONXImB4uxQF/fKBNPCX0EtDez7m4CJfHkXx8XqcBU+5
	T02fSeug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB0ph-0000000BsOO-0Qcp;
	Sat, 25 May 2024 23:29:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sB0pY-0000000BsI8-0sf7;
	Sat, 25 May 2024 23:29:42 +0000
X-UUID: a51d45ee1aee11efbf6c7d4f5c147266-20240525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Tl2QN13jl/RXNBMTp3Wzf+yLZtDlERtwTZOrjciV6eA=;
	b=M99oINRFyM9yICI92W0c3g6n6V1A4krihoJGlUgqEXeDep49dmgcE9n1oZdSF7slV+67OTq1Hzo5SoG2w3Y8tFGb+61GrInuRwDdVXQOg9FuaBddUB9hAd57M9EmgnceCRUxyVaPA20y/cAiL3zBCES2kUbGvg8pyLPIdOl9oNg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:6bbbb658-cd0b-414a-8919-3544e7f8bebc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:82c5f88,CLOUDID:3205d087-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: a51d45ee1aee11efbf6c7d4f5c147266-20240525
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1492876396; Sat, 25 May 2024 16:29:34 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sun, 26 May 2024 07:29:31 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sun, 26 May 2024 07:29:31 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Maxime Ripard <mripard@kernel.org>
CC: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>, "Jason-ch
 Chen" <jason-ch.chen@mediatek.com>, "Jason-JH . Lin"
	<jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jeffrey Kardatzke
	<jkardatzke@google.com>
Subject: [PATCH v6 7/7] drm/mediatek: Add cmdq_insert_backup_cookie before secure pkt finalize
Date: Sun, 26 May 2024 07:29:28 +0800
Message-ID: <20240525232928.5524-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
References: <20240525232928.5524-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--11.595200-8.000000
X-TMASE-MatchedRID: XAa2d/45j8Tob/hVdrvnXjPDkSOzeDWW+eBf9ovw8I27eXIF2U7rKy+8
	OxujShyxE/UmhJjBrzZC3mgca9yt8kttpN+KVVd9syNb+yeIRArvJY9pBzgg1P+RKQghHjkeBgH
	mCxujQvyjmrD+IUq29hI7tf+6KnxtiBoFctaOhN8jRwcsjqWGAgrefVId6fzVCqIJhrrDy2/jZY
	67L74Lw7o3/co+ykK6UFTYnego7LJccQ8eam5EfRRFJJyf5BJe3QfwsVk0UbtuRXh7bFKB7gRuY
	qpRzYwt5tYzjYMxVNFdPwsV1FdNCbaRD1c+EJMdvuvB6gAgryg=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--11.595200-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 9AEA3DB8CB88483491FE005922C30F1CE0AE72AEC367029CE1464088C652F4422000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240525_162940_365413_97DF2CD6 
X-CRM114-Status: GOOD (  12.14  )
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

Add cmdq_insert_backup_cookie to append some commands before EOC:
1. Get GCE HW thread execute count from the GCE HW register.
2. Add 1 to the execute count and then store into a shared memory.
3. Set a software event siganl as secure irq to GCE HW.

Since the value of execute count + 1 is stored in a shared memory,
CMDQ driver in the normal world can use it to handle task done in irq
handler and CMDQ driver in the secure world will use it to schedule
the task slot for each secure thread.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 59f6263ae806..0df9bf695f65 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -178,6 +178,7 @@ void mtk_crtc_disable_secure_state(struct drm_crtc *crtc)
 
 	cmdq_sec_pkt_set_data(&mtk_crtc->sec_cmdq_handle, sec_scn);
 
+	cmdq_sec_insert_backup_cookie(&mtk_crtc->sec_cmdq_handle);
 	cmdq_pkt_finalize(&mtk_crtc->sec_cmdq_handle);
 	dma_sync_single_for_device(mtk_crtc->sec_cmdq_client.chan->mbox->dev,
 				   mtk_crtc->sec_cmdq_handle.pa_base,
@@ -795,6 +796,8 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
 		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
+		if (cmdq_handle->sec_data)
+			cmdq_sec_insert_backup_cookie(cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
 		dma_sync_single_for_device(cmdq_client.chan->mbox->dev,
 					   cmdq_handle->pa_base,
-- 
2.18.0


