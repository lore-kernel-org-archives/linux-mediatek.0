Return-Path: <SRS0=vfNJ=ZS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F535C432C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 06:39:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CF9A32071E
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2019 06:39:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HFhYrXmJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mmAOqSWh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CF9A32071E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22d7XJJ+PJRyv8yHVafHASCzVLl9j3U5NG3OxSuY4Gk=; b=HFhYrXmJt4/uH9
	g0OIP4DbY6lXG9pSJCRZkht2Ba39e6gSHbG7pAQAH0krb5/0u+cVqiRSmQfepBjoej8XBDJW7/n/3
	rs0Uhiywhw+uHkm3L2gaSXdgH//hFypW+33mgFgbgwzY9o8X1f5YLs6K1oAoQabVtAQ2Gt6Rd8XCc
	2Br1WZG85BX0/6tuE48vdjQDnkJEF+DITkPgExayFjLUIlnL+wLdquTnzWj9XWhl1LuLPoc1mXh4/
	Y/hj2O/YKfdmwOh2Fo+fx0bjkc2/mOvzIC0zo4JPRNjXh7SrKFyDw3KPQTSU8DItcTHXABfkAJ68a
	zTCSNdGTCsMDTGXH9pog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZUVv-0002Zc-0U; Tue, 26 Nov 2019 06:39:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZUVf-0002O5-Aj; Tue, 26 Nov 2019 06:39:40 +0000
X-UUID: a3ee69e753d34c4cb983f646b7e6c9ab-20191125
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ff27DYoCkJgamZyY4a90dDsJBb/RppXLWXoUrTKLkjM=; 
 b=mmAOqSWh1XXtrPbCzvcj5efveNNIqFP7B4bJaBo9BmkEwK5kQ1oCs4/u8diUXzQ6nqMER+oFCqChzXcWzY90eb17GTRrf/pKdLhBydom3mL1W/CMpjUQqyaa+jEbh8ADHAlwT+8/jitAaNA9nTLit+gv2LspLnsxKgBzyC3vzkk=;
X-UUID: a3ee69e753d34c4cb983f646b7e6c9ab-20191125
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 396903196; Mon, 25 Nov 2019 22:39:33 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 25 Nov 2019 22:30:07 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 26 Nov 2019 14:29:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 26 Nov 2019 14:29:15 +0800
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: David Airlie <airlied@linux.ie>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH 2/7] drm/mediatek: put "event" in critical section
Date: Tue, 26 Nov 2019 14:29:27 +0800
Message-ID: <20191126062932.19773-3-bibby.hsieh@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20191126062932.19773-1-bibby.hsieh@mediatek.com>
References: <20191126062932.19773-1-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_223939_378981_E3D5E3A0 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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
Cc: drinkcat@chromium.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org, tfiga@chromium.org,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The state->base.event variable would be access by thread context
in mtk_drm_crtc_atomic_begin() or by interrupt context in
mtk_drm_crtc_finish_page_flip(), so each part should be a critical
section. Fix it.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")

Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 68b92adc96bb..e38506d7a4e8 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -486,12 +486,15 @@ static void mtk_drm_crtc_atomic_begin(struct drm_crtc *crtc,
 	if (mtk_crtc->event && state->base.event)
 		DRM_ERROR("new event while there is still a pending event\n");
 
+	spin_lock_irq(&crtc->dev->event_lock);
 	if (state->base.event) {
 		state->base.event->pipe = drm_crtc_index(crtc);
 		WARN_ON(drm_crtc_vblank_get(crtc) != 0);
+		WARN_ON(mtk_crtc->event);
 		mtk_crtc->event = state->base.event;
 		state->base.event = NULL;
 	}
+	spin_unlock_irq(&crtc->dev->event_lock);
 }
 
 static void mtk_drm_crtc_atomic_flush(struct drm_crtc *crtc,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
