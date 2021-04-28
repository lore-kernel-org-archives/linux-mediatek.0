Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54765C43470
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 17:05:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4A1C6143C
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 17:04:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4A1C6143C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/bTGpQDjoE6twSUHm+qNXqx5PIRVx4vG7B18bmSp/Xc=; b=aNvpSZCCo8IPeFDHxAEjCqYGf
	NLzuHzSynZAzQWUj9K4OejCzeDWZ+81RIEh0huK12oryVA9vma/I6k0L+uzLJy5W5aQd/n42Nvexd
	EX5STRkTp2Ow4KpxGF1Xu/igHuqO2Vb2pfmQpPfNC8hwXjFoVafxxDMe6NcWNzPn6m+XcntjuAiNs
	dyr3VOMKDkEu7VCU76KhPTlOGHG0hg9zk1RdB3VJTcqlXsVDUPYvmcIqyxo3o+bdklDq9HkoDZKVY
	DdbyC3wSdDSdAWW4miAQdvInUFRDL8Ur7asWgwNuL/NkR2houIDmDZIirv2xe/+9EKzNRANCu0w62
	aaxN46VXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbncC-003x5R-4O; Wed, 28 Apr 2021 17:04:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnbx-003x3P-TX
 for linux-mediatek@desiato.infradead.org; Wed, 28 Apr 2021 17:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Q5arbhYfGXT82qjQUTN0xccKMerRCIU7+UPVnm07W9Y=; b=WkWjAh/hgxuJJM+evPSVfVjWnK
 ex//ASz/mQZhEipa79cVH61Pn2afE1ZrUPch2jDcrwulgJVuycaR+FEPOY0pUrG62wMlw2Q71Ko7+
 x/u8e+9DwCPISOpj90F8RjI+PIjdVpTnMi1voYYQY2y8/YCXu4LhumJ5+gOQVypNKW4Ouw20YRVOe
 cGQ4HtxnGWgD9OjC4pUocRpGleh1zsOdV/d5+ccgZgwZoUNe8NhtVuwRElZdXgmWQmXu+hpBrJDia
 neSSBBwvq77fnPoClqXHPP3006wIfV2kiZMJMx4tQ2XO9GeK0VaMMOOG1aT4Ig+kmY2ntW046W5FW
 AuV79FRg==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnbu-0002st-Tn
 for linux-mediatek@lists.infradead.org; Wed, 28 Apr 2021 17:04:28 +0000
Received: by mail-pf1-x42b.google.com with SMTP id h11so4530440pfn.0
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 10:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q5arbhYfGXT82qjQUTN0xccKMerRCIU7+UPVnm07W9Y=;
 b=Oh1pOQY3nDNpYWg6CBPvoxbwz9Lp5/mgbvExVmkdIhmJlVZGash3DmwrmBb4CIKHon
 qhIf723E2NT3KLDzilpKerGauzvnOHbY+s/nFoAFNFIGUDyS721zHl0d0K2csd5vwIJO
 eIVQuYBad9ZmHQ0iSC96gsmAMu/m1PJWWkJCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5arbhYfGXT82qjQUTN0xccKMerRCIU7+UPVnm07W9Y=;
 b=bX6WrS/kPD9CSWu4gQ9iTUo64XeloOES8rzExPZqZBIu4rPW2Sl/gsAtrC98Bpf9n1
 EabJQYNpPEjkzF2e9wKHXhlebX/72+coS5uLgiWiUoXVs06OWimZutG0D8nUaawORhv2
 wrKhZ/kR5oXS9VIZ0eEkojCbP9lJBqCG/1Gcu8VoADTE2GqdIC8nNAECqy7hsXwMEGDD
 D4UI8mR8xZUr6RP6zC7rh5qfHoi15HVxK6EezHLw6l2HqtUwMwaAxASkX58TtCIjpaxb
 rqTswiIrR7+wLlmXsvOxWL7EIcu5PRKqgTDvpThdNSLa1Y20oSydgz2qqyQ9zNlke6RG
 Zm4A==
X-Gm-Message-State: AOAM533xbQ0fviON4TagTL6ep7rq7jwLA16yMc3lN9DNkiJOEZgMm7N2
 /ZaJtTsXjx3VUZC3D3GpBsKx9w==
X-Google-Smtp-Source: ABdhPJxErM53epytFNpIJdI3/a9zdSqFrICBlsEBiJkNLoECwWzSEjPVpUQPi64CmaQN2g4Kj9Mq2A==
X-Received: by 2002:a63:1921:: with SMTP id z33mr28455929pgl.211.1619629464253; 
 Wed, 28 Apr 2021 10:04:24 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1faf:c32e:8742:d913])
 by smtp.gmail.com with ESMTPSA id c8sm244351pfp.160.2021.04.28.10.04.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:04:23 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v5 2/4] drm/mediatek: init panel orientation property
Date: Thu, 29 Apr 2021 01:04:14 +0800
Message-Id: <20210428170416.1027484-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210428170416.1027484-1-hsinyi@chromium.org>
References: <20210428170416.1027484-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_100426_981119_31351E7B 
X-CRM114-Status: GOOD (  11.75  )
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

Init panel orientation property after connector is initialized. Let the
panel driver decides the orientation value later.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ae403c67cbd9..9da1fd649131 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -964,6 +964,13 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+
+	ret = drm_connector_init_panel_orientation_property(dsi->connector);
+	if (ret) {
+		DRM_ERROR("Unable to init panel orientation\n");
+		goto err_cleanup_encoder;
+	}
+
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
