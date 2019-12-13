Return-Path: <SRS0=P2Dl=2D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB70C43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 07:29:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3016E22527
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 07:29:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DGJxLGEq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="XkjPd02l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3016E22527
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rV5MNfnzc6eePG2vDdMosWFFPiYP6xQAJXsuJlIVyWU=; b=DGJxLGEq3Y7AUb
	ngF100UCfzD+xwfc1cMN2tLU+O1pzK0m2hdwF5I5i54QDcXrJ1cQ1Ar6paq+5EMwI7r2sCHF8X8Wg
	pGJmLhwYQ5n5tuF61ZmEm5/QbFgmUnNpZNpr4+/RLvrF+zO3M9+EM/NE7japBDo10S7ebbl98lRrT
	7geNjdDc4MCC0CW6wv+5rtL4A5QCbPOknvDeIJfk06LWWTziNRa5PSAEuXhBJ7qzJcYGzzQiNOy8h
	AuWXNphV+nXFpgfzPlvEtoCPWPwo9auqcoQtYDQeVAymuE4Tc+pmQYmUFDOMyCALdptpEtlkOtikU
	vZGARu3DWJJB04wyU06w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iffO3-0006jL-UF; Fri, 13 Dec 2019 07:29:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iffNp-0006WD-Uw; Fri, 13 Dec 2019 07:29:07 +0000
X-UUID: 5ce28be006044b41baa60ba68e63d464-20191212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=G9xP57LuRrds9HJm7/htVK7BRBr/hZcnDeiAioMGxyc=; 
 b=XkjPd02lRlExDiY12upV5c93239wv2ny4hmD/bHVY7PUKHKeHw36v2/DnEdbxDlho59X9eyZmBiZUgxl7AIfHwgqY88JNXEptUIN5P37TxQAIVKxMcJ9sRq8RZpcQhoR3ltAHgkwbdmefIbNvuwt+vTjFgJ3Hlrni6qwungtPcs=;
X-UUID: 5ce28be006044b41baa60ba68e63d464-20191212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2081626529; Thu, 12 Dec 2019 23:28:59 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 23:30:01 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 15:28:37 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 13 Dec 2019 15:28:24 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2, 1/2] drm/mediatek: Fix gamma correction issue
Date: Fri, 13 Dec 2019 15:28:51 +0800
Message-ID: <1576222132-31586-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1576222132-31586-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1576222132-31586-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_232905_996345_4F0C68C4 
X-CRM114-Status: GOOD (  10.14  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

if there is no gamma function in the crtc
display path, don't add gamma property
for crtc

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index ca4fc47..9a8e1d4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -734,6 +734,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 	int pipe = priv->num_pipes;
 	int ret;
 	int i;
+	uint gamma_lut_size = 0;
 
 	if (!path)
 		return 0;
@@ -785,6 +786,9 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 		}
 
 		mtk_crtc->ddp_comp[i] = comp;
+
+		if (comp->funcs->gamma_set)
+			gamma_lut_size = MTK_LUT_SIZE;
 	}
 
 	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
@@ -805,8 +809,10 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 				NULL, pipe);
 	if (ret < 0)
 		return ret;
-	drm_mode_crtc_set_gamma_size(&mtk_crtc->base, MTK_LUT_SIZE);
-	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, MTK_LUT_SIZE);
+
+	if (gamma_lut_size)
+		drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_size);
+	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, gamma_lut_size);
 	priv->num_pipes++;
 	mutex_init(&mtk_crtc->hw_lock);
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
