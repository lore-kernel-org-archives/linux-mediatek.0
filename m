Return-Path: <SRS0=dAcd=5W=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81FEC2BA18
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 05:12:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8F5E2074F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Apr 2020 05:12:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A5d4tQ9b";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dcDygH+3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8F5E2074F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C0IwKCBSvr9beeSD8S/yvoomNxAucDLNOLxT38n0YWs=; b=A5d4tQ9btmqqRv
	uu20ugltNAFSdH0/33ohZUO0vlfrypD23tQFa4cYRoAm+ojSC9KMLHwiVJ0GQcECEoL56pkcBx4rU
	mJuBJ/MpD4ohItFfN/TSA97ARwkAHoLPoy81yruV3nkuKWp03uVKC952uZsiVY8aI+XhEJYeuXIDo
	ltzSObuwpnoXkQ7lSLn+KIMeGsDThisBcnEERBoqYoSu/jDN5fF6ElgFjjxlrEIY91O/aWgzrsQdI
	ieDMZyGlHublS2t/4nXrbufygHnQpA4Zy0LbR9jvydPzmEjBA/oQzEy9zYl4S2gsFKfi01nYMZFHu
	T4OvK/QZ1zFWxPJCHDeA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLK3N-0003fG-C3; Mon, 06 Apr 2020 05:12:09 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLK3J-0003do-VQ
 for linux-mediatek@lists.infradead.org; Mon, 06 Apr 2020 05:12:07 +0000
Received: by mail-pl1-x644.google.com with SMTP id s23so5433333plq.13
 for <linux-mediatek@lists.infradead.org>; Sun, 05 Apr 2020 22:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E6G7y8QFHpxPoNxMI7C/eKVE0aY7FMH8n0m08py+N9o=;
 b=dcDygH+3H7RfJ8k3R9ugCj5Hu0PXxS2To/zA0WK7GU/A/MQo9xuqp2ojj5PJIpWcUa
 wtz5YOxKZA3vTWb7f4arNcS8lhf6CjzI2pDNTSmxr+VZFdX15TsG3B2NoSixDhezYpxo
 eWnEEkkOmHM9HB/RD/iD01J7tktIBu4CBba5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E6G7y8QFHpxPoNxMI7C/eKVE0aY7FMH8n0m08py+N9o=;
 b=gVu0uvFQ0TsD8eIfDLOpzO4eIHcI2OSblZmetBQbPGlRDSTJA7zEnr5JJWxOEAQMs8
 KkIgCEbvRYT0PdRRmG1I88fftYIrqijL4ptep5CeN8SJ7sZZio97yHT7PpDbA96auJHK
 jfY5lTIlC1ueyLdXY8Tvu+swLayRFSRxUbbAUBxPcojmQnvc3S4Br5KyJ0P6wNuFfIdH
 aMmi+cJIX/sWXGrzol7WPrO8Iw+Xp2q2DDuq08bjbeLlhx6OFXPYerT0hvn19CWjx7a2
 uZuqAHk8GmSQ6dGWcOhi54EIPKAEkCU3RZXIoQM0o1uW1nzMliCTddNt0OU8tMtfPeSi
 IcjQ==
X-Gm-Message-State: AGi0PubNP+uwOLl3+Diourjreq1mGK3ttEOKJhkKnShyBudi5d3eDDkU
 CXfeiLI81Yfzgwk3j6MsNKcBpQ==
X-Google-Smtp-Source: APiQypIIXfPCYmCJ6Az4vd/oeMZuklz0Lp206sJXppbut8+ldlWVk5HoXoCqx3VSKUh3QlHRXs0OSQ==
X-Received: by 2002:a17:902:9f8e:: with SMTP id
 g14mr18309768plq.289.1586149920348; 
 Sun, 05 Apr 2020 22:12:00 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id r63sm10727776pfr.42.2020.04.05.22.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Apr 2020 22:11:59 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm: mediatek: fix device passed to cmdq
Date: Mon,  6 Apr 2020 13:11:32 +0800
Message-Id: <20200406051131.225748-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200405_221206_038940_A5C49489 
X-CRM114-Status: GOOD (  10.06  )
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 CK Hu <ck.hu@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

drm device is now probed from mmsys. We need to use mmsys device to get gce
nodes. Fix following errors:

[    0.740068] mediatek-drm mediatek-drm.1.auto: error -2 can't parse gce-client-reg property (0)
[    0.748721] mediatek-drm mediatek-drm.1.auto: error -2 can't parse gce-client-reg property (0)
...
[    2.659645] mediatek-drm mediatek-drm.1.auto: failed to request channel
[    2.666270] mediatek-drm mediatek-drm.1.auto: failed to request channel

Fixes: 1d367541aded ("soc / drm: mediatek: Fix mediatek-drm device probing")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 6 ++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c  | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 615a54e60fe2..8621f0289399 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -822,14 +822,16 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 
 #if IS_REACHABLE(CONFIG_MTK_CMDQ)
 	mtk_crtc->cmdq_client =
-			cmdq_mbox_create(dev, drm_crtc_index(&mtk_crtc->base),
+			cmdq_mbox_create(mtk_crtc->mmsys_dev,
+					 drm_crtc_index(&mtk_crtc->base),
 					 2000);
 	if (IS_ERR(mtk_crtc->cmdq_client)) {
 		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
 			drm_crtc_index(&mtk_crtc->base));
 		mtk_crtc->cmdq_client = NULL;
 	}
-	ret = of_property_read_u32_index(dev->of_node, "mediatek,gce-events",
+	ret = of_property_read_u32_index(mtk_crtc->mmsys_dev->of_node,
+					 "mediatek,gce-events",
 					 drm_crtc_index(&mtk_crtc->base),
 					 &mtk_crtc->cmdq_event);
 	if (ret)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index e2bb0d19ef99..dc78e86bccc0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -517,7 +517,8 @@ static int mtk_drm_probe(struct platform_device *pdev)
 				goto err_node;
 			}
 
-			ret = mtk_ddp_comp_init(dev, node, comp, comp_id, NULL);
+			ret = mtk_ddp_comp_init(dev->parent, node, comp,
+						comp_id, NULL);
 			if (ret) {
 				of_node_put(node);
 				goto err_node;
-- 
2.26.0.292.g33ef6b2f38-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
