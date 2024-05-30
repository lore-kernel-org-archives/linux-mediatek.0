Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53A8C25B78
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 May 2024 08:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IHkwqtBAKIh1FT18Wf08tYxtDsD9mBo3yYE6cpTa5lo=; b=olzEs7MGGBuIA/LprAXA1mY2kc
	oJwxfgg1W1emKLMQCOFC0XtPhPtVpZPBcs0aWGWHXuaCJ7G5WgaLIT04zNiTpizlZzHRwA5FnOLOw
	J8lgtQlOVdFW2fnQsUTTh0bULSL+WVot9Yfk7/vxVoJ2FKV91EmoTh5xPUUgGXI8I/GN5qLQLItWq
	jRGy7rxknMv/J954RhNxDY53mLfwfvQg1UjImBVz9rlVQKD1Isngna/2BVRE+Gu/B4E+D0boBajuz
	gYZCdJFrIYayBC6JWLHzKiX7FoNc5mE1101BKUKmKHPxqMBEQie4qAGmGUHd7sctsOPndzQI7AoCZ
	2T0ErNmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbGp-00000006eGU-1NVz;
	Thu, 30 May 2024 08:36:25 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCbG2-00000006dpN-3ow6
	for linux-mediatek@lists.infradead.org;
	Thu, 30 May 2024 08:35:38 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1f44b4404dfso5772005ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 30 May 2024 01:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717058134; x=1717662934; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IHkwqtBAKIh1FT18Wf08tYxtDsD9mBo3yYE6cpTa5lo=;
        b=iQuZwjqwzlrIQ3nG04EOIWVW6DcuVe6gTx9q/LX+o2eE8Fo0jUwnhDPC03KsO5P9cy
         1e3WxjnYhd7gdm7fXG4NnZbw5uo1Zu5vmcmz2jwZZ3zv4fWh6u4m+zO+eHTZa5q7Bigk
         JR/Ug2eQpnT1/B0Q10ZWYF2ftHl5WG3Tfv1Zs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717058134; x=1717662934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IHkwqtBAKIh1FT18Wf08tYxtDsD9mBo3yYE6cpTa5lo=;
        b=Vm494CWrgd/ibbY0y5fXuD4l35G/DUf3THujnbZ7E34TQMTjbHaL8h3zk64qL2Uvak
         NC4JkkkntyMQmGcP/Fuy2+SCnWlS2xbDC2mbEqTxQKnk5AyUHGxJK0RZ8KBerLQfMRS9
         ay+anMDb1YJx3Em/mlNJtqx+jDclrt7dKRzwfKTBCLbSfQ1OLa01YTxmkIlmFMRt7dVY
         egRyW2Ym/3yb0HQZ0T+jk/1k36enWyIgxgziGuOnIyZOn6YVe1FCETB/hsq7Y2EC8Ujq
         kqqvlLJe75E970DKm2JdIOuH332DquiWbxMwVjSCI87X7IIPorgxRPxRqPexuUPUgrZq
         83dw==
X-Forwarded-Encrypted: i=1; AJvYcCVxr7Rhss6fFnk1HKkJwno0kSY1LfT9uW5jMcF1wrs+vX2BwwIitgEQyRv9idDnIycaZuPQAVBwuNnFDR85xIPYXxkG5/jTkCWktmdIBLqFFWd1
X-Gm-Message-State: AOJu0YxYHCQvzGpLnNw6nBlsQeTyAwNhWZj2XTrczjemFIF4Br8J7QEp
	G20eyjM29r8lkuuTOUjRmNp5oIzwACAQLv5EqOQYJ4udN+WowshXs2j7p1EsBg==
X-Google-Smtp-Source: AGHT+IGaMXKlAuHj3tKDXFrEymwDvO07A1BRFroXZlN02EvX5mN7HsOfQHvylgHcYJoSPTNjRI9s+A==
X-Received: by 2002:a17:903:2095:b0:1f4:768b:445e with SMTP id d9443c01a7336-1f619605ee4mr11933665ad.24.1717058134222;
        Thu, 30 May 2024 01:35:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:65f0:63a9:90bb:50b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f617390fe7sm10950635ad.146.2024.05.30.01.35.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 01:35:33 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Frank Binns <frank.binns@imgtec.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] drm/imagination: Add compatible string entry for Series6XT
Date: Thu, 30 May 2024 16:35:03 +0800
Message-ID: <20240530083513.4135052-5-wenst@chromium.org>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
In-Reply-To: <20240530083513.4135052-1-wenst@chromium.org>
References: <20240530083513.4135052-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_013535_009585_0C8531BF 
X-CRM114-Status: GOOD (  10.44  )
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

The MediaTek MT8173 comes with a PowerVR Rogue GX6250, which is part
of the Series6XT, another variation of the Rogue family of GPUs.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/imagination/pvr_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 5c3b2d58d766..3d1a933c8303 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1475,6 +1475,7 @@ pvr_remove(struct platform_device *plat_dev)
 
 static const struct of_device_id dt_match[] = {
 	{ .compatible = "img,img-axe", .data = NULL },
+	{ .compatible = "img,powervr-6xt", .data = NULL },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.45.1.288.g0e0cd299f1-goog


