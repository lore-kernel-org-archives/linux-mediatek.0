Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839BFC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 04:56:23 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0801161408
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 04:56:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0801161408
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/bTGpQDjoE6twSUHm+qNXqx5PIRVx4vG7B18bmSp/Xc=; b=OeAphIDbghQtFTqFH4XLMlqi5
	XXbf0PMNdbA9/qV9bsmd0mRxWrfTJCv1dV7qJ5a5SNqRsgzOd+G4efCNa6A2EloIRXVVDFtKMBclx
	CUEBHiYEwGOnuQaSgB3FTLoblStfl2H/pcauDo1mvMPLPAqAVw1x1zlFic7ALjsYpAb1go59VxxQ7
	JN6I5g5EZ+dux2OyLOixWDL7ZDaJCmT9HuKqMx/5jzM+iId3AVRydpgcZmNEq1UDhG5FAQ+DTdce2
	kdWlSPCvdIFo+Ju9+kwn6eREWfDO8E0rACoYupyH9FsCnrbKYCuet9Q2ExbsT8LOcU6SqAu7EPgbA
	LY7sln0sA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbcF5-002nGG-Em; Wed, 28 Apr 2021 04:56:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbcEh-002nCX-R9
 for linux-mediatek@desiato.infradead.org; Wed, 28 Apr 2021 04:55:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Q5arbhYfGXT82qjQUTN0xccKMerRCIU7+UPVnm07W9Y=; b=PZKgtO/ZJNMulddFlmB7VIsgGF
 5zoMQT86jEVJZVHFy5vS0sjO52gAAbDn42JOfHiJOv2446y8AEtx2H727abS0wq3Ms9qLKzMQedk+
 rNCfeH6fIqVxJFMQOMNnIz4gVIlof4ZEw+2RViLMtzTuMpE5CwthkzGWjSkW+0r3d4tTktfLoPrQU
 4NJLMS+bX6Cuq8HjNmn0H9V/B550llbu9g0xGvyqbV/KFwl6PRPTPQSdEKOth6vZzSedOujS3KhHD
 d3gBCwjRlUPWeTRdzNT9pV46HsuxI3Yffsgbrlk+ibnMTqOk/vUSNPYjsgoSa9oZDw4BdYlYV5S3f
 kEjWWiDA==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbcEf-00HB8u-CS
 for linux-mediatek@lists.infradead.org; Wed, 28 Apr 2021 04:55:42 +0000
Received: by mail-pf1-x433.google.com with SMTP id c17so8275665pfn.6
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Apr 2021 21:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q5arbhYfGXT82qjQUTN0xccKMerRCIU7+UPVnm07W9Y=;
 b=VTFFF9OFqyw2YMLqAax+N1JMxY/fNr/W5AB4MeQ5uAC48RGc0An02b+Se479ddBizx
 XD/X1KjCcrsMtSQlNf2LW5waQiFV1rfGU+052WMVU0QQcBCnRqMhDXmhEWMSBSbhd1iI
 2p/YqB6CSg/fIreO6cajKo9N3kjiKV7dDgsHk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q5arbhYfGXT82qjQUTN0xccKMerRCIU7+UPVnm07W9Y=;
 b=oiwweJFb9ZnyWaO+DqlY3erCdX4ogIMx9plMMN4WN4q115JGDerxKUH1uPuy6PX5bE
 a8aJ583FkdtS3YWUb3a617RF89+d2XBqZI4cKdK+/hoQrafYegK0sIrkDou7zUxQ+86s
 9AiEFbXPJl+Gnlx3UyhWuK+hoFXTOf28VDhvZV1mnYwe4lP7IMlC/24Z47tyzZrlCoEi
 0sLmPwRW3KT6vRr5UJ1c5vHMGAdzo29OgslEs/l7y0ca4BsaYhApMBFyY7//h7e6H6AB
 oy3fDk41CMefJ//1eQqgUIIx3kNm8yzRyaChIdZzyKbi3AztIdXZfcFwTKnIHu3P6hzX
 aJfg==
X-Gm-Message-State: AOAM530db8OLplhuvADKqacR3Esg0U4RIlVOfUQzt9AY6ODnqbR/6v6w
 nTqBmzlceerwytDuNZN2dLM5aA==
X-Google-Smtp-Source: ABdhPJzGs2DXC6vNxlFEZ8RvRfGO4uOiE+lprziJ7+wryJ2YehvrOUkYJqxr2cPuDE5cVXFo3KiZsw==
X-Received: by 2002:a63:942:: with SMTP id 63mr25683673pgj.67.1619585740596;
 Tue, 27 Apr 2021 21:55:40 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:8076:36e5:2db0:967])
 by smtp.gmail.com with ESMTPSA id x13sm1193170pgf.13.2021.04.27.21.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 21:55:40 -0700 (PDT)
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
Subject: [PATCH v4 2/3] drm/mediatek: init panel orientation property
Date: Wed, 28 Apr 2021 12:55:32 +0800
Message-Id: <20210428045533.564724-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210428045533.564724-1-hsinyi@chromium.org>
References: <20210428045533.564724-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_215541_443644_9829BE7D 
X-CRM114-Status: GOOD (  11.91  )
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
