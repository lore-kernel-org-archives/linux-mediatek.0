Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E956C2BB3F
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Nov 2023 17:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=; b=2hLXIkbIfbGEdFn5KqMQONtiIV
	sdSNMvg4jxY6owe0ohnTKo2UxcF5PfdIvmrh9UYGixfozmelihcArWR44xrqkBUfTcQrvTX8qTVa9
	I2LcjmjxbwZMvvizxUyuxDcxY56iPjfYnnhB6Q0TxHu/py2wF+fCqI2mDaFuJm9ZWG+otZtTKAOe9
	8iJ2XJyQGXKyLiGr7XIycTT48oNICpnwYaFVP5PuFbIZx0Iu1wzTScTPkQ6EwHMvGWW0JU5N9WCEE
	N141peadWE73dQtRRCi3MClFMYCNPf5245IszojE7dNRTh/C2DIE9ZTEEqs/NVndo/Rvkn4v+lrwo
	j36z3V1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4PLA-008v1S-1Z;
	Sat, 18 Nov 2023 17:42:44 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4PL6-008uy0-2u;
	Sat, 18 Nov 2023 17:42:42 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-40853c639abso4729115e9.0;
        Sat, 18 Nov 2023 09:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700329358; x=1700934158; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
        b=G2U11yC8Fr+2ceR4Y+UiNkwirYbCjTOb1cgw9PHbF5fvhaZ6WRAVVq7RplvQe+Lg/o
         nq4VlIrNPmzu8czVvwAsvSUvCnqKuoDNH0sKmvQzXNyBgqyitTnoO2GfwRfvURyhMSGz
         ww3L/D83DkG5qs4OZdy9TanNVtswOKUj4pAdloKlVA9/u2/EAfpoV/85EzXAemjL+6ny
         fvxZCsvkXwl5fntTUKlZ6b9BQUJpvmUlDHB5vCt2DXdEoR9hV6GRNJgHerr+wSIJEH+L
         66otLpIDBD0R6Il+c3LQ/iFuHIUrhiwLE9usQjlSD2SYm8VI1f//aa/C8IqgMECccps4
         I2YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700329358; x=1700934158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihe5CWoYwzVYQa0PIBn4FXCZubjqfqZzL14QGGmAy2E=;
        b=pkmA9xPaSd4g1jXU9FmTgKr9DvMyH8R5Sxae9+oNGMn9fIhOF9/08zsdm+adVJLW86
         AaYqZS1gnS+oFjvGb6cXwDoKseKVCI3c5sEX6xI8QLHSK+ooYW1HlhSXn3wLtKmg32wY
         ESebhjzbTZRIp/zqAUytc/5SL5F5gwOXyzV4ZKnon2AYAjiI17fguKDTVvir77+SiJ6I
         cX5EXE929P1y76mlzriNcda4EAz44NShf7mH6fkwNGRejpf3Ahpm5Jqv5vpVXXpuNo5V
         jE9KZlBLYVngGoar3ILUoMIPwVmQ0OFy1e7ox2IvCQWgio5y6HFTlze4ZrGxCEmJAlRA
         vlXg==
X-Gm-Message-State: AOJu0Yx+Rj6O2v4dqXN79M2BoL8TVpgrFMlkxY1nH7uH4aRCB4giX1xR
	X/drosNwdvZyL6ZVof0THKQ=
X-Google-Smtp-Source: AGHT+IE8c5V85RdvcwMzWAbBlQPGXZHeMjHZ0eSrzhGIJjdv16HbHYiNDOuMRSlBwb03Yc7GkrviVQ==
X-Received: by 2002:a05:600c:22da:b0:409:136:469f with SMTP id 26-20020a05600c22da00b004090136469fmr2103392wmg.38.1700329357997;
        Sat, 18 Nov 2023 09:42:37 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id y10-20020a05600c340a00b004068de50c64sm6964211wmp.46.2023.11.18.09.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 09:42:37 -0800 (PST)
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
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 12/20] drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c: remove I2C_CLASS_DDC support
Date: Sat, 18 Nov 2023 18:42:12 +0100
Message-ID: <20231118174221.851-13-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118174221.851-1-hkallweit1@gmail.com>
References: <20231118174221.851-1-hkallweit1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231118_094240_952661_4CD68BEC 
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


