Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44373CD1288
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Apr 2024 10:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lo4lDmVfE2uO4XA7Sc+H4dQlxZJDmRsnTUJ/N8Cz8P0=; b=1/VVK5jZHUXMtdSf9eKAxOqkB4
	djiZ2+an8hPKXYBmI0BIfVBjfgKi645IiVrkh9aW2MNoo4L4pZVBFwjLO35RsJdzgHJHxHYTq2Chg
	BkkRNfZy7NmNelPsebjxGMLR7yqPLuvnGKzfX+t4OLfs2P5B97+dqzBbMtH4w5hea2pkyb740XWcO
	A38Rn3+OANtSkpNW7Rur9ANp5hYsqdYSJfm85gnM9PLg5fvUjmuHJAr8WxQ+wHupxDvn7Uui+gL8i
	iMCV7RjahOihjbGKjpeVqDxC0LXULDYt9bxPEAx1fUoLY4jx8UfajKvAMszg/13vKZLXaXKChuwCD
	VZftG0Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxqm-0000000FVGL-0NOS;
	Wed, 03 Apr 2024 10:28:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrxqJ-0000000FUsT-1Wl3;
	Wed, 03 Apr 2024 10:27:59 +0000
X-UUID: cb971394f1a411ee96d5dfc950b7243d-20240403
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=lo4lDmVfE2uO4XA7Sc+H4dQlxZJDmRsnTUJ/N8Cz8P0=;
	b=WvZthqpmnWWAJblBn0ICu2oJ1q1MRDnublK33t9jklNcsvm7r1fxXR5z51usuUxZRXD87d74DcpJFQNgeTXSScvVYBjsS9FrkTSoKLQw8cx2EBB0vQOVH7Q6bouH+aBOYiqZ6mW2hJkcA62YSwUm9p9u8NF/yn4/6iT7GcFYKe4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:ae0af181-062b-4424-ab23-5eebbac225d7,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:6f543d0,CLOUDID:b39e2c91-e2c0-40b0-a8fe-7c7e47299109,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cb971394f1a411ee96d5dfc950b7243d-20240403
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1068882249; Wed, 03 Apr 2024 03:27:38 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 3 Apr 2024 18:27:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 3 Apr 2024 18:27:03 +0800
From: Shawn Sung <shawn.sung@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Sumit Semwal
	<sumit.semwal@linaro.org>, =?UTF-8?q?Christian=20K=C3=B6nig?=
	<christian.koenig@amd.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-media@vger.kernel.org>,
	<linaro-mm-sig@lists.linaro.org>, Jason-JH.Lin <jason-jh.lin@mediatek.com>,
	Hsiao Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v5 9/9] drm/mediatek: Add cmdq_insert_backup_cookie before secure pkt finalize
Date: Wed, 3 Apr 2024 18:27:01 +0800
Message-ID: <20240403102701.369-10-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240403102701.369-1-shawn.sung@mediatek.com>
References: <20240403102701.369-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.964300-8.000000
X-TMASE-MatchedRID: DpePiNkRMProb/hVdrvnXjPDkSOzeDWW+eBf9ovw8I27eXIF2U7rKy+8
	OxujShyxE/UmhJjBrzZC3mgca9yt8kttpN+KVVd9syNb+yeIRArvJY9pBzgg1P+RKQghHjkeBgH
	mCxujQvyORmg3vGx7V9sIe/TXUbL1GClvwc20fT5gS3HnT6jvf4iuaoNXJrK/fmHrLgoJIlxLR6
	I6ytdxOLBCNZjB5OVeh+gv6XmqORNRbbZ0jxgFOp4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyMdRT
	5TQAJnA4zjUu/hzMaXvKCvoWLGqrJA2OYWJIR3ArCVg7MtbdbieqD9WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.964300-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: BB83068C8A2923A221CC6DA4A0919189003744023CC932CD209D04F2D18548492000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_032743_925536_8CF93A12 
X-CRM114-Status: GOOD (  13.46  )
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

From: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>

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
 drivers/gpu/drm/mediatek/mtk_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 8a3c204d48d2b..8a70d731f2ee2 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -186,7 +186,7 @@ void mtk_crtc_disable_secure_state(struct drm_crtc *crtc)
 		sec_scn = CMDQ_SEC_SCNR_SUB_DISP_DISABLE;
 
 	cmdq_sec_pkt_set_data(&mtk_crtc->sec_cmdq_handle, sec_engine, sec_engine, sec_scn);
-
+	cmdq_sec_insert_backup_cookie(&mtk_crtc->sec_cmdq_handle);
 	cmdq_pkt_finalize(&mtk_crtc->sec_cmdq_handle);
 	dma_sync_single_for_device(mtk_crtc->sec_cmdq_client.chan->mbox->dev,
 				   mtk_crtc->sec_cmdq_handle.pa_base,
@@ -812,6 +812,8 @@ static void mtk_crtc_update_config(struct mtk_crtc *mtk_crtc, bool needs_vblank)
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


