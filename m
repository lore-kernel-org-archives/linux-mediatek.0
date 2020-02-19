Return-Path: <SRS0=zz1H=4H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EFBFC34047
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2020 14:14:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D46206ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Feb 2020 14:14:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fxVpHB6K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="vSIEsdEx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10D46206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=M8roCVWmQ8yCzz/HDeVaqUQArWvCaA+isDtT5n/UHMY=; b=fxV
	pHB6KCEX9HGOSvhdeGfoXQhwNRix4/RTFpqgbsAy3TTSjgYjvBl6LYjejjK4FUHIb1+dQ5hyllhDU
	dGQUrzY6cGBxM/oSVozw66aVTNZES6hJXnA6PQTRnK6F0hD6AMz3DmE9991Vypczf/LxRTnM+q+iE
	zQ2HgUZ9kDD6jt/MtljP8beDUu3lpAoV40ESZSmQjbPMWx+FrHtjVWxWEt7N7r1XQeCszbDUkphB6
	9y9+7I+vRGUCzhp50gJOrqNgyvSs2O919SJRzN1kturpPY6gFPImXXPXuODa5Gp8an9utaZhtIgbI
	NtZ8uGaJjYwD670CwWkSzpKOcqVKQyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4Q6s-0007z6-AR; Wed, 19 Feb 2020 14:13:54 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4Q6e-0007pV-Ji
 for linux-mediatek@lists.infradead.org; Wed, 19 Feb 2020 14:13:44 +0000
Received: by mail-wr1-x441.google.com with SMTP id z7so663580wrl.13
 for <linux-mediatek@lists.infradead.org>; Wed, 19 Feb 2020 06:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=k+5x80NuD9V+Qnk21e0mDSFOMaIC5Iytof66uYIbXss=;
 b=vSIEsdExWZ2FbdPu0MU7VTcU7IF3oIQ32l2NuuFLX8Pl5KvjA2twy0JNbXU9P3gDHq
 pOIyRNd5icecIFJ6CN41j4lbT0HN7PdIOQQfHknbRaNqaij9+c0i4d0iJg+IQGvonXEU
 /9FRusWgtIxolCOpZiznjI7l95lFAo6SYHdMTkHOSWXGeE5QQ4xXAyjQIBJ7H28zG08w
 aF36mTgygaz9dlKMUJ1bBVY4y30cpm+aMCHoCls0t+A8d56qFO9jks3oTHVBldvNsVj2
 Eafka6pMIzGAL5iq4nWphoxSq1ILpTyXY8Snp3fTPCd08FppMLnwh55Ef5rUYg9R1hKi
 SLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=k+5x80NuD9V+Qnk21e0mDSFOMaIC5Iytof66uYIbXss=;
 b=e8F85nURUpJC9vIjj0gpTl/3HRK6nhnVBj88/OZwAj+IpphiWoqLbmQ4as4uDg4Ldg
 GXGIhRXGswj1qnL0hD8BXl5vU+7Cls0np4/1h6RuEl3Q+ktdgUGvqT2quNdP2ItdvGy6
 4TIgpbzJONnpSL4XpVLvrIepSDtErDg28giG+ZbLpw9M8MdcLkUTE4kKgEKSiSoEZqrl
 dXUlFlhGTr2yGSVkP1in9rS6OKmAfD7ePXWHy66oVWB20dH2Qzo5BBTqA/K0mFLNCPpQ
 jQSDjrqG6Ri60mIRU9/Hp0oZ0m+wACrZW30O/A4vAwoCYsO49Kb7QC6S3awQJc08I+u6
 xf9g==
X-Gm-Message-State: APjAAAUUp5iV4D9URTxIiRQ0AUYb/f6ziMtQwY3ir96dGCwArNxPEpib
 VsOGbgpRY5uw8B5GpefVKDn7Nw==
X-Google-Smtp-Source: APXvYqzMstRSs0CuhMEXF+cVCctS5nCVYxs4zXGgDEYIyjt2Wlt/zX0aqBTexiTEeZ2jMvRmxr7YRg==
X-Received: by 2002:adf:f406:: with SMTP id g6mr36762230wro.189.1582121618880; 
 Wed, 19 Feb 2020 06:13:38 -0800 (PST)
Received: from robin.baylibre.local
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id g25sm7999695wmh.3.2020.02.19.06.13.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 06:13:38 -0800 (PST)
From: Phong LE <ple@baylibre.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] drm/mediatek: component type MTK_DISP_OVL_2L is not correctly
 handled
Date: Wed, 19 Feb 2020 15:13:24 +0100
Message-Id: <20200219141324.29299-1-ple@baylibre.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_061342_171848_900FA075 
X-CRM114-Status: UNSURE (   9.00  )
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
Cc: Phong LE <ple@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The larb device remains NULL if the type is MTK_DISP_OVL_2L.
A kernel panic is raised when a crtc uses mtk_smi_larb_get or
mtk_smi_larb_put.

Signed-off-by: Phong LE <ple@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 1f5a112bb034..57c88de9a329 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -471,6 +471,7 @@ int mtk_ddp_comp_init(struct device *dev, struct device_node *node,
 	/* Only DMA capable components need the LARB property */
 	comp->larb_dev = NULL;
 	if (type != MTK_DISP_OVL &&
+	    type != MTK_DISP_OVL_2L &&
 	    type != MTK_DISP_RDMA &&
 	    type != MTK_DISP_WDMA)
 		return 0;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
