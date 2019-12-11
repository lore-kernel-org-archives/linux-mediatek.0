Return-Path: <SRS0=jhbW=2B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4669C43603
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 15:51:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 690B62073B
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2019 15:51:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gz0cOxhO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="m2NiP0Cn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 690B62073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/0lWKJLWz4J921ElmeSfTx+qYlhZDB9qeagckHwWG7k=; b=gz0cOxhOPR95ms
	XPou0u6JM4ghuNa16ij7bgJ17LecpbiytI2fPIwobUOWiimTDL//KSeinKvzeYl+TYt877rZpngVq
	EqQ0w0fg00TzIfLl0UYrUSXVtfQ/JvZxV1u+MbHGk8zys7B2t+PTvBBAVFYNXbnrss2CUkypUYYWz
	fZJs4jUVgkJiOz3yiKCHXY7C9ofGRJDoM5hdqYT38H8hVlPZEATwGU/uCA8fGzggLLkN9M6/y5Uzd
	Z3/OFAVKmU6g+znNiQJmypHVofw/da3TanQQjKMjoQ8Dha+AGfIx3N2e7pTDMyR6VF3PR0v7ITYHL
	uHg76C9osNUvWMZOE5lA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1if4HF-0000vr-Tz; Wed, 11 Dec 2019 15:51:50 +0000
Received: from mail-yw1-xc4a.google.com ([2607:f8b0:4864:20::c4a])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1if4Em-00050n-9i
 for linux-mediatek@lists.infradead.org; Wed, 11 Dec 2019 15:49:18 +0000
Received: by mail-yw1-xc4a.google.com with SMTP id q124so8745638ywb.16
 for <linux-mediatek@lists.infradead.org>; Wed, 11 Dec 2019 07:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=+84MmMAoxZMowKg1LejiSRn+LGavX3XL0RXX6IMOW+w=;
 b=m2NiP0CnGnotNR/yMx/w5OIeIfCUnZkQxMGnHlJQgBxOA/FXbl7y2EYygJSnUU7MrL
 kJ3L4rLG6BKMC6Kw7F601lW847yaNWWQzxCbN9s1MYJ/eu1LeC5BesWLk3yZ3tt2FePN
 92VLc8xSfXsMFhJ4ItMCqBRqc7K/K40iD+AjeKs7eASl25E05/A0xRwMtATFIE75BGE0
 P6839NDZrpb/tdJSU3vkmmUS+e7YjYoAGICMyToI9z5hc49ilIEE5SPTUDNcmV8niTEb
 HhHa8oIT6pJcepbPvKt2SuJctQ0v2091Cw9qWrvd7TEfd5roezf2Rd0FvxgpGZFv/pLU
 wWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=+84MmMAoxZMowKg1LejiSRn+LGavX3XL0RXX6IMOW+w=;
 b=ThdY5TPQNArjro2qd9enQBc4+XmjTcRMbgIlCCzeJOb7be5pKQ/Y0NQc8LxS03NwAr
 tN4MEp3AEqVBhznTC7uhu7L9iZ+6BQXUox3SNb/1zPccE9neBe9ZtYYbSGpyGLknZrR6
 0Sj06le3GKm6l6bTRI0S8rPO1mPhafRUPY1t/HePXp7YcZgwvxjMHiiwU2HtFp+jjNnC
 0+By3VpqiwAW7dFMwejXhN1EtSArV8gz51wt0Kgh4tUjsPkaE6trsmkEORi+xR0891ot
 41ZKDvPhWwrPvAOpXCyPRuvk2syANActg9sAVACljJlkzL/xs24+/ol2QP9gbg9u3EbJ
 3cwg==
X-Gm-Message-State: APjAAAX3Oh0rbXGkkVoN9NBeAmpKW9pdXU58Bn3z8lwIaWzp1SaaH7uq
 d2r8AfnPVZtaMKy2TNfjIpIz0rKOu6WO6vVf
X-Google-Smtp-Source: APXvYqzgag2uEK1TrKN/WHaL/XtHsyuWNO7uPzN29U6f0LWDaOKfxY1Ep76cMLNac+NAL6BSwAjUWiYDY6LG4QTQ
X-Received: by 2002:a0d:d247:: with SMTP id u68mr297158ywd.1.1576079353136;
 Wed, 11 Dec 2019 07:49:13 -0800 (PST)
Date: Wed, 11 Dec 2019 10:49:00 -0500
Message-Id: <20191211154901.176256-1-markyacoub@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.525.g8f36a354ae-goog
Subject: [PATCH 1/2] Return from mtk_ovl_layer_config after mtk_ovl_layer_off
From: Mark Yacoub <markyacoub@google.com>
To: CK Hu <ck.hu@mediatek.com>, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_074916_390555_C4CA2658 
X-CRM114-Status: GOOD (  10.48  )
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
Cc: Daniele Castagna <dcastagna@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

drm/mediatek: return if plane pending state is disabled.

If the plane pending state is disabled, call mtk_ovl_layer_off then
return.
This guarantees that that the state is valid for all operations when the
pending state is enabled.

Suggested-by: Sean Paul <seanpaul@chromium.org>
To: CK Hu <ck.hu@mediatek.com>
To: dri-devel@lists.freedesktop.org
Cc: Daniele Castagna <dcastagna@chromium.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 4a55bb6e2213..526b595eeff9 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -260,8 +260,10 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 	unsigned int src_size = (pending->height << 16) | pending->width;
 	unsigned int con;
 
-	if (!pending->enable)
+	if (!pending->enable) {
 		mtk_ovl_layer_off(comp, idx);
+		return;
+	}
 
 	con = ovl_fmt_convert(ovl, fmt);
 	if (idx != 0)
@@ -283,8 +285,7 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
 	writel_relaxed(offset, comp->regs + DISP_REG_OVL_OFFSET(idx));
 	writel_relaxed(addr, comp->regs + DISP_REG_OVL_ADDR(ovl, idx));
 
-	if (pending->enable)
-		mtk_ovl_layer_on(comp, idx);
+	mtk_ovl_layer_on(comp, idx);
 }
 
 static void mtk_ovl_bgclr_in_on(struct mtk_ddp_comp *comp)
-- 
2.24.0.525.g8f36a354ae-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
