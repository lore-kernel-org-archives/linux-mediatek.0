Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1CE3CD343B
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 21:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJBvhYuyv/JdwansPLGJPjqYXoVeTZUEnpdVBNEj1Pw=; b=vowUFwkSm1xYBvS1r2vopFLZBS
	HxXIG+2VGrlJi5plk/UaGGDOQeC/lm2k/m7d8qWDi5FA7AQOR2m6NnpvKBVDNUFcIiNhvgcloZ34b
	05qLJRj4fc9gnOPtE2gUNO+8rYGk5HRJIcHd4JYq0SU9LgtxamRtf2Ph8O8zcvEg6S2D/NzBLn1L2
	7MJ/SFFeOZhjhQhvIC3wG8qu+sSNp3gahLV4L7Nr9uaRt+0+MjLdIZ9t7F7ZGnPHBzDr9+PchE85f
	3FDFNzet6mHfLGLJSMyPVanbFFTNeDPi3Zc12uDbWd9GC4OSQ8Q7W21U8y6pVnTsX3+lerWq4AkTX
	UODOH1Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNbC-0000000HZSe-3vg8;
	Tue, 05 May 2026 21:46:38 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNb9-0000000HZNx-1sYp
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 21:46:36 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso55234965e9.2
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 14:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778017593; x=1778622393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IJBvhYuyv/JdwansPLGJPjqYXoVeTZUEnpdVBNEj1Pw=;
        b=VW3LpwDBCQ/m8JMcOLhIPj5pBodt+Fnp9dDMI3hg+ykCbMwW/WTb2y/5hviHHle80v
         jm8JQk4L917kvZYYHFWqUs+g0+TPrmHlhCVSuPP+AjeU3zp/b7SHQMqISRS00XWRU3Mi
         DWT/rwGxLST+RhMfczZg3wqf95kGS42Mljk99a/gP68CUTsrjqPWiXZ/Nf9aRkKHCJ0v
         O5hGqNbgOHQ+IjDpnEUKSUDJQ3MjpElVB59U/5ZNSQoikaV9CX2l76N5r/ij+JTgabl3
         cVkp/cYVlXMuuvhJoWyyXDa0RX0x4lK+SnAVYE9iCc81pxZjcZM0AzeRpjjLz9q7q1Om
         znKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778017593; x=1778622393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IJBvhYuyv/JdwansPLGJPjqYXoVeTZUEnpdVBNEj1Pw=;
        b=l2mGfNQKmplaHi5UPM6+v9kO+arAc9uI8WkOD/HyxM8st92vRzAFJStRk4Vcv8hjTz
         ErHPDEVMo1ajZBG/8ZcUruqWLkPvyG0kF/32pIw1hbYf/DEtopUzB2gZVZ8QM+oMVTnF
         WcHxq8m8cUfxyZZdUzzOpRzdteACdUibm8w4QtZs9Y/wGIwf33iiYwQ1Z+TmRQ9ygBD3
         FeiVZ/bcW2qfYTxU6N2NBOTxrtnbtEMDpWqRK54M1mV5+Cpm4HibH+y+gz+RLqWvSGqa
         PlpDsONOIBTDADlzLdIOQCITxS5cfEaYWcT2bBVI/7NmFLEDmh3eNJwCGM2B9z753wuv
         81xg==
X-Gm-Message-State: AOJu0YyW6U96/DpdjqdCMcLI/eIxii1tInlvasW/OA6phcFjmZN05fhF
	nXpfmlT2bJ5TtsjpMXtGaBzYhxJVsoOfcrMgKxWnvssyWtPmk+7Oj3T8z2i2u77p
X-Gm-Gg: AeBDietleLMIHoVUuo4pOIr4ECVHK74Rj6U52R4/74NOnm1xL6zF3db1ZDQGtT1QHL9
	12usmF77s8HxMTeuoHdlwiazpGU2JNNAJu5eJHPPlF0wtbN10F3OHRwALX9xwqXGdr+6ce3Uiga
	nzghR3KX4itIZUcrYuj+iisC3j/QHUXhueMALaRb+Di0nzsOgzDuXKEY4ADh3GWXhNpJvKUq4jC
	skHFG4LdmAyknzNU5WbSrkqoktMh8/PaV075QDhw7shiwPAYOEkNYO7/DA0nRGjdFos9w6lLsUX
	7jE/pF1fgHNt1BZ3KcbUdeVroqbnP7qS23aQX8RNSoZow/30O0ULKoaj4uh9+6MXDKDqlLgscIE
	5Xlbx1TA0YYzu2M5zsSU36YNtpy3xnCf60kMDk28OCJr2A+pXLK2o1pNVl3OTsvnJDzKs8cOqFX
	AMw/7wUf6nvDkgrtRWIjpTZH2ElnC3ag==
X-Received: by 2002:a05:600c:45c6:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-48e521e6090mr12630715e9.14.1778017593036;
        Tue, 05 May 2026 14:46:33 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a824f9f0dsm411556165e9.15.2026.05.05.14.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:46:32 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/2] drm/mediatek: dsi: Add compatible for mt8167-dsi
Date: Tue,  5 May 2026 22:45:00 +0100
Message-ID: <20260505214541.333657-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505214541.333657-1-l.scorcia@gmail.com>
References: <20260505214541.333657-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_144635_485731_61649852 
X-CRM114-Status: GOOD (  12.79  )
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

The mt8167 DSI controller is fully compatible with the one found in
mt2701. Unfortunately the device tree has a dedicated compatible for
mt8167 since 2022 and it cannot be changed with a fallback nor removed at
this point. The only way to get the device to work is to add the
compatible to the driver.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5aa71fcdcfab..167e33fef025 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1305,6 +1305,7 @@ static const struct mtk_dsi_driver_data mt8188_dsi_driver_data = {
 
 static const struct of_device_id mtk_dsi_of_match[] = {
 	{ .compatible = "mediatek,mt2701-dsi", .data = &mt2701_dsi_driver_data },
+	{ .compatible = "mediatek,mt8167-dsi", .data = &mt2701_dsi_driver_data },
 	{ .compatible = "mediatek,mt8173-dsi", .data = &mt8173_dsi_driver_data },
 	{ .compatible = "mediatek,mt8183-dsi", .data = &mt8183_dsi_driver_data },
 	{ .compatible = "mediatek,mt8186-dsi", .data = &mt8186_dsi_driver_data },
-- 
2.43.0


