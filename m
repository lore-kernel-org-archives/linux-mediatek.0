Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D64C87FCC
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Jul 2025 03:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uAOmwIwYzwciplDzmt6zrIJF+cEGxWhyBufqMjWe7v0=; b=O94e9dEqQUctxAFk/9x215F6kk
	5at0HOer6GhVzwTuzRcyz7hippXQxqW9qJNRoiAe/7x4uhuKq+UwFtg6+cv3+rDK7OTSaFPje5ImF
	T2kXPvPBFMBvKMq2mtuIveCFOkn9m25F3/QeXATTkdEVmOWBql4ME2+xQ5orDdHgVwmgTscMv2gWm
	k8MSQxDSFzKnG9kGOajCOUdideqqGq53nNuqEMLNNBMyqzfb2W5DlaycnB3gAlC43qhEMCBkFbQiS
	jkm7iMyzJp26UeA8c8QLtg2FTVIdonmNxOtAJv07ioq0rkmVpq375LUb5LF3XFk/Ujlt+zurjWXDk
	mHgPw7vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugE8v-0000000DVe8-3VWx;
	Mon, 28 Jul 2025 03:03:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugDwt-0000000DUME-44RC;
	Mon, 28 Jul 2025 02:50:49 +0000
X-UUID: a5b868746b5d11f09eb0dd999d3936bf-20250727
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=uAOmwIwYzwciplDzmt6zrIJF+cEGxWhyBufqMjWe7v0=;
	b=df450UYfKEQEklV7KytuIyOzGnFJhQBBZkbDHZpbTb9coxH2n/JQOOJCfh4bJEGeSRMpfGDVKFBd4LVja5WoSSARhRneHzFGGBAwfA5nFkZO68dKsTmtveDAUZfwb0mKykC1uUwlevLFuebpwPCjBfuW+NdrgrQOU1an1sci9sU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:876a9f81-fd38-4a8a-8d9a-f061e6448da2,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:ed93d708-aadc-4681-92d7-012627504691,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|15|50,EDM:-3,IP
	:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,
	LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: a5b868746b5d11f09eb0dd999d3936bf-20250727
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 284369845; Sun, 27 Jul 2025 19:50:40 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 28 Jul 2025 10:50:35 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 28 Jul 2025 10:50:35 +0800
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, David Airlie <airlied@gmail.com>
Subject: [RESEND PATCH] drm/mediatek: Add error handling for old state CRTC in atomic_disable
Date: Mon, 28 Jul 2025 10:48:50 +0800
Message-ID: <20250728025036.24953-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250727_195048_016422_91217556 
X-CRM114-Status: GOOD (  12.12  )
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
Cc: Xiandong Wang <xiandong.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Jason-JH Lin <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, Zhenxing Qin <zhenxing.qin@mediatek.com>, linux-kernel@vger.kernel.org, Yongqiang Niu <yongqiang.niu@mediatek.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, Paul-PL Chen <paul-pl.chen@mediatek.com>, Xavier Chang <xavier.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Sirius Wang <sirius.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Jarried Lin <jarried.lin@mediatek.com>, Chen-yu Tsai <wenst@chromium.org>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce error handling to address an issue where, after a hotplug
event, the cursor continues to update. This situation can lead to a
kernel panic due to accessing the NULL `old_state->crtc`.

E,g.
Unable to handle kernel NULL pointer dereference at virtual address
Call trace:
 mtk_crtc_plane_disable+0x24/0x140
 mtk_plane_atomic_update+0x8c/0xa8
 drm_atomic_helper_commit_planes+0x114/0x2c8
 drm_atomic_helper_commit_tail_rpm+0x4c/0x158
 commit_tail+0xa0/0x168
 drm_atomic_helper_commit+0x110/0x120
 drm_atomic_commit+0x8c/0xe0
 drm_atomic_helper_update_plane+0xd4/0x128
 __setplane_atomic+0xcc/0x110
 drm_mode_cursor_common+0x250/0x440
 drm_mode_cursor_ioctl+0x44/0x70
 drm_ioctl+0x264/0x5d8
 __arm64_sys_ioctl+0xd8/0x510
 invoke_syscall+0x6c/0xe0
 do_el0_svc+0x68/0xe8
 el0_svc+0x34/0x60
 el0t_64_sync_handler+0x1c/0xf8
 el0t_64_sync+0x180/0x188

Adding NULL pointer checks to ensure stability by preventing operations
on an invalid CRTC state.

Fixes: d208261e9f7c ("drm/mediatek: Add wait_event_timeout when disabling plane")
Signed-off-by: Jason-JH Lin <jason-jh.lin@mediatek.com>
---
RESEND change:
- Update author and Signed-off-by name.
---
 drivers/gpu/drm/mediatek/mtk_plane.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_plane.c b/drivers/gpu/drm/mediatek/mtk_plane.c
index cbc4f37da8ba..02349bd44001 100644
--- a/drivers/gpu/drm/mediatek/mtk_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_plane.c
@@ -292,7 +292,8 @@ static void mtk_plane_atomic_disable(struct drm_plane *plane,
 	wmb(); /* Make sure the above parameter is set before update */
 	mtk_plane_state->pending.dirty = true;
 
-	mtk_crtc_plane_disable(old_state->crtc, plane);
+	if (old_state && old_state->crtc)
+		mtk_crtc_plane_disable(old_state->crtc, plane);
 }
 
 static void mtk_plane_atomic_update(struct drm_plane *plane,
-- 
2.43.0


