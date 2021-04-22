Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4425CC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 11:10:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D8166144A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 11:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D8166144A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TKw++CeJuwy5ZL432OwFIOGFcxavbkbDtzfQJVYAa4w=; b=WrCuFHB97yb2o3f04lXmCijX0K
	a0rTfla510m6GJwgs2w5HPQWBowJjBMIYCfwBSPp3a2VcqU7Q/PUSs/C/Pb5xktHI5cFdeNK3uusX
	+c+j03avA5totuQOvFTrvPvHAmKqKhWT7+JrjXE1QfMPv0isyhJdqqRZYFZHJdQGKOn6PdQBQCxn2
	PMUlyUGzra3Rs4nX4dfPcRh/SXhZ/bHLW2f0MnJwjPzTADc2LL1KjwyLQSjsIyvHJU0MQ1kqkDTjz
	yC3RhuUzodQY/E9Slqqi08ImhubaogdxYgCxTLvGEWN/Tswx62eRRFEO84bbyY5l2kK/3IN6vBDsd
	mRZACsBQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZXE3-00GYwj-96; Thu, 22 Apr 2021 11:10:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZXDr-00GYvY-5z
 for linux-mediatek@desiato.infradead.org; Thu, 22 Apr 2021 11:10:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=f/chTt+osIkWJLziQJ8wWSuoRfhyDdiRVm7MrtKaXiw=; b=1QIpqo0uz9YbcGXaDRp8JTn30t
 1coFEmhOpyyVvkgwH/XL3uabEGsLUs6dT8Gm5eQIqKk+oiJDuDp2fkpkIrAXw/XkAb5Hck73qPyQ2
 Ga46jiykmVWy4750536VLgRX+fwzcaMlpCdAwiXrzwK/ft92X9LW1Zh600u4izLMIdEj2jsphqnFn
 ghN1br0k6YHaMFYOYmQz7/grN+XbunMwDTaDEk0A9MmC0VBTGjjI8CMsZlWiKvizxpJpjFTFdG9x9
 qPmOUG2ivmBT98PwAjM6HrADLvUSAc7k7pQmLLn3tinE+vSY3cDVBHojNis1BooCf11nnLPQmU6+3
 0SwNtqwg==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZXDo-00DbWG-Cc
 for linux-mediatek@lists.infradead.org; Thu, 22 Apr 2021 11:10:14 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 j14-20020a17090a694eb0290152d92c205dso768821pjm.0
 for <linux-mediatek@lists.infradead.org>; Thu, 22 Apr 2021 04:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f/chTt+osIkWJLziQJ8wWSuoRfhyDdiRVm7MrtKaXiw=;
 b=mKEimyLVIPVuavwkFK4Vb3mGCyutLIp6e9a8JjPK/FFPW99UQ93YReQbFuVbbvYOKh
 ZqI1JiF6j/DGu+RKyl66iB+Fud+quoPHmOyvwLmRyq1B30khiYq/jT2O/0S91hsUOBWe
 Y5/aJGO+b2YzcZVXEb61OVpKVm1fKq6EnN3qA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=f/chTt+osIkWJLziQJ8wWSuoRfhyDdiRVm7MrtKaXiw=;
 b=D7NWB3521QlA2IJthNWFT6jv55evPTyL7ZuK2eNlt6Kaa4RdRQ0pNUOPODl1wrsu0S
 v/GGOV58PN7szAUZqYQnVUhwTDon5aZa5gXk7KqOAdESUiV8S8zSi7deHSptPTzaBjEn
 XZx4Uer1xIS0XAt8o9n/bWuJ2T7uRAsd2MZ0nWvsK8ZUxisciaLBms+cbJu32x63oBN9
 ZyT+fEEFAUGajSjmAOiNAuywxm89823+V2f3bBXirYYFeiNpXK9kwMJDB0+JVumIUwk/
 FE24KFIgv4ox7dCVHyhUubLll7Yhcm3IOieCyU7uK/z7ewIc2asOEZ1ivbUNNu22UGgT
 FpLA==
X-Gm-Message-State: AOAM533ze+qzUccgPYRYHmlBtRUV/V3DrlRLTKUyc3NJBjWUmmWMTglW
 HUPqcpKeHITBJKTXFrBuTyG6Ow==
X-Google-Smtp-Source: ABdhPJzKmYE6lUmhguTsDYgVEbYMCSAPKAPA5tLk2yNfUIXlQfSHEfR7PN9tItvv7RCFRP5pYJ5+Kw==
X-Received: by 2002:a17:90b:17c9:: with SMTP id
 me9mr16537781pjb.233.1619089810552; 
 Thu, 22 Apr 2021 04:10:10 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:daa5:b736:ed85:e08d])
 by smtp.gmail.com with ESMTPSA id 1sm2004045pjx.46.2021.04.22.04.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 04:10:10 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, CK Hu <ck.hu@mediatek.com>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mediatek: clear pending flag when cmdq packet is done.
Date: Thu, 22 Apr 2021 19:10:04 +0800
Message-Id: <20210422111004.1338867-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_041012_471159_1FA5E8AF 
X-CRM114-Status: GOOD (  15.33  )
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

From: CK Hu <ck.hu@mediatek.com>

In cmdq mode, packet may be flushed before it is executed, so
the pending flag should be cleared after cmdq packet is done.

Signed-off-by: CK Hu <ck.hu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 56 +++++++++++++++++++++---
 include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
 2 files changed, 51 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 40df2c823187..051bf0eb00d3 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -224,6 +224,45 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 static void ddp_cmdq_cb(struct cmdq_cb_data data)
 {
+	struct cmdq_pkt *pkt = (struct cmdq_pkt *)data.data;
+	struct mtk_drm_crtc *mtk_crtc = (struct mtk_drm_crtc *)pkt->crtc;
+	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
+	unsigned int i;
+
+	if (data.sta == CMDQ_CB_ERROR)
+		goto destroy_pkt;
+
+	if (state->pending_config) {
+		state->pending_config = false;
+	}
+
+	if (mtk_crtc->pending_planes) {
+		for (i = 0; i < mtk_crtc->layer_nr; i++) {
+			struct drm_plane *plane = &mtk_crtc->planes[i];
+			struct mtk_plane_state *plane_state;
+
+			plane_state = to_mtk_plane_state(plane->state);
+
+			if (plane_state->pending.config)
+				plane_state->pending.config = false;
+		}
+		mtk_crtc->pending_planes = false;
+	}
+
+	if (mtk_crtc->pending_async_planes) {
+		for (i = 0; i < mtk_crtc->layer_nr; i++) {
+			struct drm_plane *plane = &mtk_crtc->planes[i];
+			struct mtk_plane_state *plane_state;
+
+			plane_state = to_mtk_plane_state(plane->state);
+
+			if (plane_state->pending.async_config)
+				plane_state->pending.async_config = false;
+		}
+		mtk_crtc->pending_async_planes = false;
+	}
+
+destroy_pkt:
 	cmdq_pkt_destroy(data.data);
 }
 #endif
@@ -377,8 +416,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				    state->pending_height,
 				    state->pending_vrefresh, 0,
 				    cmdq_handle);
-
-		state->pending_config = false;
+		if (!cmdq_handle)
+			state->pending_config = false;
 	}
 
 	if (mtk_crtc->pending_planes) {
@@ -398,9 +437,11 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				mtk_ddp_comp_layer_config(comp, local_layer,
 							  plane_state,
 							  cmdq_handle);
-			plane_state->pending.config = false;
+			if (!cmdq_handle)
+				plane_state->pending.config = false;
 		}
-		mtk_crtc->pending_planes = false;
+		if (!cmdq_handle)
+			mtk_crtc->pending_planes = false;
 	}
 
 	if (mtk_crtc->pending_async_planes) {
@@ -420,9 +461,11 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
 				mtk_ddp_comp_layer_config(comp, local_layer,
 							  plane_state,
 							  cmdq_handle);
-			plane_state->pending.async_config = false;
+			if (!cmdq_handle)
+				plane_state->pending.async_config = false;
 		}
-		mtk_crtc->pending_async_planes = false;
+		if (!cmdq_handle)
+			mtk_crtc->pending_async_planes = false;
 	}
 }
 
@@ -475,6 +518,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
 		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
 		mtk_crtc_ddp_config(crtc, cmdq_handle);
 		cmdq_pkt_finalize(cmdq_handle);
+		cmdq_handle->crtc = mtk_crtc;
 		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
 	}
 #endif
diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
index d5a983d65f05..c06b14ec03e5 100644
--- a/include/linux/mailbox/mtk-cmdq-mailbox.h
+++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
@@ -90,6 +90,7 @@ struct cmdq_pkt {
 	struct cmdq_task_cb	cb;
 	struct cmdq_task_cb	async_cb;
 	void			*cl;
+	void			*crtc;
 };
 
 u8 cmdq_get_shift_pa(struct mbox_chan *chan);
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
