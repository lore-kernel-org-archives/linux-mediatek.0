Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92011C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 04:50:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1891861040
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 04:50:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1891861040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7ywa2MXem2Tsi6vtY7zdhycnOi6fxzKMDbyYmV2Q7So=; b=Ui0ZJdy+ceD4SEs/saHsFAUxr
	kg3MDnJDFy+JOJXJOoOCPeHRYjKE2HVFtvZbvpUESU+CkD3Mu2S92OnqJZGv9UI4ON4WKw7IMvGa8
	O6+6plQdL21jWLXAkA3yQ4mSRphNZaNCQnsaH/LpS305O0HBUE82ZvIlOONQOsfXeuWyvlinyymzs
	7KF4qhyZOiDecKJFvwtu58GipJLluIdm7FDmHSa7wJnS5l07Lw7NcClqWZ8c4VWEPM96npUKdVPHv
	iHCCmTpYhW09UWI5cZN/w9tFZC829MQi09sfB2vD1qiWH7oH647hEGRMHanVGcXJCPhQYMStE+w3Q
	VQ3Yg1Yww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbFgB-000h4p-Bn; Tue, 27 Apr 2021 04:50:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbFfd-000gz2-1c
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 04:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=xF3OHVoJNfqjglnjvTxLJPf73tywjjNrGA26Syn00bg=; b=rj3PxGB04q0ATS0oedpcmsSFGF
 LqXoUKVYzWkgEqNzwkCPb5zfKkEanEvWgPjKYKZg5OBrNRlGF5FYCicFbxKymcIw8G1db5ZExVTf6
 WRyWM51r3/BN0N6AD+1/GxFpyz0Lfl/RnImgIHbyC3ts2tzITjRPYDhBq3mJj90OBMfAVD7wkPEDS
 0S9ft/muKcKjcxLKMn9xVHWWnfcKoqCptaynNTdACy26rY5rxG8/cpzR+jUdSfRaK/sZLbzo0Rqet
 +ddZp5uHz3lB02OpdxoK6uGczLU21ZUeM2MfVJoLwyI7Bes9Edo5f624p1ZjLvKLMyFDHB1XHeaxj
 iCBtg5Kw==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbFfY-00GR5P-An
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 04:49:59 +0000
Received: by mail-pf1-x42b.google.com with SMTP id c3so21746042pfo.3
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Apr 2021 21:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xF3OHVoJNfqjglnjvTxLJPf73tywjjNrGA26Syn00bg=;
 b=aQkvabnsOYdSCbCI2Ahu8FMyIfugOfrAzX9FIMQJY9p2Czzu7GnXrtexTRQGyfcOXA
 zDUfD3J608v/yBPJ2tYvQStQjwqcURK8qXNGNtV4GnpwVVbXvHFDGHX/0e46PhgnQLJf
 wBihdkVOueiHhJkVMUT6VOim5Rl9dRrc7EZgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xF3OHVoJNfqjglnjvTxLJPf73tywjjNrGA26Syn00bg=;
 b=Ap0/J70NHuorSuaXzMC7UPdnh5nNck7L+Jlaj/eZXFI+0JSsxWjNtVqaivnlOtknf1
 GPy5MVV2ySNblEYyf6ZzEMWc/Q81oEV8fqz7SIzfhNMlU7T7bBKAeFZNLZFYuj2n0yhl
 WHuvkL2VOaE5BoevF8qOWhEDsQt90Zc+spUl/IvHZhf59p7I4r0YUfETPINLWLxv3HMS
 s/cksWrdA4fC1ivyn/Bc2P6XmgwLyatHJ85YwDxOJfw4Eo6HEwJZ8wdGtpjT/D5HW478
 q2pb3d+jDBxzOM3UXCqUEGOlz+vTHNJ6WvPgwMuzz3m55GzOv2x3WVRXW6Ysi/Pz/wic
 jsDQ==
X-Gm-Message-State: AOAM531c9sLHgkc2uE+d7gN2R/EHL8cwCzW2GwfuFtzXb37w2Rh6uLKq
 +azoXDruimAuHBeoWGwvEKscCA==
X-Google-Smtp-Source: ABdhPJwPPm4u4tg6YSG/bq6wlqozKqdTA0jRIW6pE9ln5m9hymH+OexWOCKpW5EL+vxYFzyZxE6Yrw==
X-Received: by 2002:a62:bd13:0:b029:25c:5ec4:c2f3 with SMTP id
 a19-20020a62bd130000b029025c5ec4c2f3mr20817479pff.35.1619498995453; 
 Mon, 26 Apr 2021 21:49:55 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3984:c4f5:8612:6b3e])
 by smtp.gmail.com with ESMTPSA id c125sm1151517pfa.74.2021.04.26.21.49.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 21:49:55 -0700 (PDT)
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
Subject: [PATCH v3 2/3] drm/mediatek: init panel orientation property
Date: Tue, 27 Apr 2021 12:49:47 +0800
Message-Id: <20210427044948.12596-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427044948.12596-1-hsinyi@chromium.org>
References: <20210427044948.12596-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_214956_388501_1DCFB198 
X-CRM114-Status: GOOD (  11.12  )
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
 drivers/gpu/drm/mediatek/mtk_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ae403c67cbd9..0bd27872f2a4 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -964,6 +964,7 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
 		ret = PTR_ERR(dsi->connector);
 		goto err_cleanup_encoder;
 	}
+	drm_connector_init_panel_orientation_property(dsi->connector);
 	drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
 
 	return 0;
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
