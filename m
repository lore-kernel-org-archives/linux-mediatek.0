Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29E3C61D85
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 09:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ibtPu02kEx2LQ9A0jvCmJB7jA/c3boGIvN0NginjoG8=; b=jNYvq7iifDcqqvscqv7VqdGRXm
	nX73wTZ9Xi/SHqs+XTTDvVZMkFKXULsz2ZX9ZCHMp7ts/dM2nuiQzDqaAXIAQJSzsCM/Jp2/YLJeI
	jeGceFrDaHl5cVbi5Qm+7syer+S9tR8ppd8AKFmJETvQWMzi/sOKz7+i/WonMg8NxbqXTGCYkHzkf
	i1hZxyBLbkxTgyWz8Ee5PzTjzl5A0VS15jKdLt8HWIRUgeb0Cs3ooFf/7moyWO4DqG4ELFiQNbXsA
	qf5RhGsrDteZAjMD6qRm7Az/46H7g1XkXIpz/xp40nsui0j5wWa959cVrBKfvllTMQePOD+bOLXj0
	1ektyCVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r66Cm-004Hc3-2Q;
	Thu, 23 Nov 2023 09:41:04 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r66Ce-004HWv-18;
	Thu, 23 Nov 2023 09:40:57 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a00f67f120aso79448066b.2;
        Thu, 23 Nov 2023 01:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700732455; x=1701337255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ibtPu02kEx2LQ9A0jvCmJB7jA/c3boGIvN0NginjoG8=;
        b=gAjSs8Rc4QRy7g9leAunvVHImUZG3pd7fAX8lKdJcT28xPc/OMCUmamKuymiH66V9j
         EcF8a3RR/RTu8I9t6Jw9A0/Oc5babcxm1mwPCmgbesDf1bagliv1O8DAjjHK/oaxPkVB
         K+zSaaYd1N9657552ayFXAgxoKS3K7T3MbuB3q0upspP99gE8r8cdjgExZdg3yp+IW19
         M7F9cMozekdZV1drjW4xIyjYpZYmyDrTMM17WHgppAA67QLGeRKGkyU/7ITD7amBoSSi
         1P6XKgJvsvvC83YdbEAy2MOd9V1VPUe7d5RcjKzZ3HZoCrQRb1Q7pxgmsGm8XD/QLZU1
         84eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700732455; x=1701337255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ibtPu02kEx2LQ9A0jvCmJB7jA/c3boGIvN0NginjoG8=;
        b=VjLnOv8ZXuyVQbt0m4L110NwBh20JdtAgEWuL1g1OGR0PtkzAq2x7PbnrDpGoU9Dfn
         QkQN8JDm8+/q+3iso8RyLs5d4tGF5Zskp10M5AHvf5Wrca2F8CYal+7zrYaUBPDRPQMU
         JclQvl5VoP4t8mkrfpNNQKktTCZ8Wl0Ax3nglG4KLG3/nYeE6DrU9zw7RvNQi7fLbOqz
         OWHrJ1EpmOzCitKGqmkSWE1i1CP71hu5yHG/9hmSdaptZxIlRdQ6dcPSlIcF0KfjPCfE
         O6wlJihquyyS938TdiUGFwZgwiC4NDmwGyUW9gyTXw/eZvdWgcvkoz0ovh61ji+L1e4k
         itew==
X-Gm-Message-State: AOJu0YwAForOWoyGqAOXQsWDWeT0eXA+2b6U0/PGLN8K8VvMKYXOoMyk
	O5w/W/Aoi9L7cXBywpaHTN5vLL0lAqA=
X-Google-Smtp-Source: AGHT+IEhOkC6xnGbAR37vpV6MkHztMHFrS18pW2+Z/6tkJJXSA5ZZsQMtb3qt5G6Cp1hpv+vQnc4XQ==
X-Received: by 2002:a17:906:51d5:b0:9bf:7ae7:fd6c with SMTP id v21-20020a17090651d500b009bf7ae7fd6cmr3174848ejk.10.1700732455026;
        Thu, 23 Nov 2023 01:40:55 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 01:40:54 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v5 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove I2C_CLASS_DDC support
Date: Thu, 23 Nov 2023 10:40:32 +0100
Message-ID: <20231123094040.592-13-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_014056_388918_C40FA6D1 
X-CRM114-Status: GOOD (  13.11  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
index d675c954b..54e46e440 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c
@@ -297,7 +297,6 @@ static int mtk_hdmi_ddc_probe(struct platform_device *pdev)
 
 	strscpy(ddc->adap.name, "mediatek-hdmi-ddc", sizeof(ddc->adap.name));
 	ddc->adap.owner = THIS_MODULE;
-	ddc->adap.class = I2C_CLASS_DDC;
 	ddc->adap.algo = &mtk_hdmi_ddc_algorithm;
 	ddc->adap.retries = 3;
 	ddc->adap.dev.of_node = dev->of_node;


