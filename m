Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20ED8C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGhN4tMDnWFook0es8LuAXt5ZA9TrdmyBXYcCQvtS3Y=; b=symclQlBacIpR2hP16ItCBxjub
	n/AUhaU0LwlFCTx5cBq0zDd4VTLuQBl+yT60n9zz4/1NmI+oWiINibnxvB8Ynw7/vXlC0DzHdpo/p
	8e4qcZqo+s2JN5KuFFMeCva9HtpB2hJm1z9C8ryNHouDAtspuTMavfacLWbvqWwMDEc9JGSOmBo6H
	WDr+YOqZAcCk05PL+1lZ+NBL8naPeKD4eYjEuyUtxlajcdjwMA1azCwTGvBk8dwsr0kYO6nEbI008
	XkabgMRBx8muOvLfQnXBYQokLm5hp0OYwuKnUzh7eJgm8o0quvH7uGK6p7BNz/CrjbitYDe+1rIZ/
	+HIT4rdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSbc-00000002Zlv-1nDS;
	Thu, 18 Apr 2024 14:19:16 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxSa0-00000002YkH-2Gw1
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 14:17:49 +0000
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-34a3e0b31e6so70819f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 07:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449854; x=1714054654; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGhN4tMDnWFook0es8LuAXt5ZA9TrdmyBXYcCQvtS3Y=;
        b=gqokIbCXsV7xad0gTVhNzxFHznHUgYP7DYPDiDvz+5VDV/+zlHYTh9mPCffDGiPBL/
         tFvqxg7qTOS87kNDW7NHeOPgwNSRJ/40G9Feoxha4+lbBXw/RU8DULuvZUmU9pz8vZj4
         EbAwZ5HL5Lf0CNQ/iY+d6vVbRVE8e34dd1/22CwaRBWMHECtL5OmauZ712GmpxpunhKd
         SOFEnu4NabS2zWaJ3G2UL7wKevAc3wnddFXNa+ofsbBEEgs1BnpJNF+wdIfOtj0OHsAL
         aZN3JZUulaBcUTTUaAnUd2UYnRJN2mRSuAoAxg6iTp50rZkpzFc0ANm6KXoooFPNso7J
         Eizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713449854; x=1714054654;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nGhN4tMDnWFook0es8LuAXt5ZA9TrdmyBXYcCQvtS3Y=;
        b=qcT38nFgXTMRK2M9Ryi6AZ/iHr+RY9HoP8Q8TV0Tc2D21vC6+4pbDwf4d0i38ZBlCN
         PHQ1smNBmYpsVh33Vl/tkHI4djJRN1GyobT0SqbssFMIASfCe6yGfk9ldBaRfCb3644x
         TIUIN9KGZv7rTNTbrUWNdoBPUcNfCD7zUhoV76ILqOHlrmrNLM1ilZAbfHei8Y5mZuwV
         r/7SfHuBFO+QlQgSzP/BgxkOPNq43k4wrt2AIjQDIsVU+QNa1W/efY+cV9gLxEL6xa7O
         XiTgjwZMbuqX2VXJYW3LESZ2FEGFUhXbY+aoMq64VXs9iE99b0ZwOQlvlaeu4j/ybJ2Q
         n4vw==
X-Forwarded-Encrypted: i=1; AJvYcCXB5lNQUTZGiYKEtX2I3nevGYivhBWK+QkIAoLZf3oXmkLJb3DlSNbI92cvfkNXWTUsxg7JMHJxRrPS1n028wkeDbxBm8++L0hwlFuHvQAyejB9
X-Gm-Message-State: AOJu0YxXYEP+EUwdDYYxH+/chjbFSKpdiSmc3Z+4QllMA0yhMMl05+gi
	Psf3h+Q6Hm1CYfVQGeRj81qVmfiaODJEeZ6ZMVnviFaXuHxe8PltrW6bWb7eI3A=
X-Google-Smtp-Source: AGHT+IF6b8Hyds+Df+n8d6GSZC2InYLslqfLyS56mvk1H/o/i0jSb1a/hK0ROLJ6MHV5vWZ7T6O6RA==
X-Received: by 2002:a05:6000:bc7:b0:343:d06e:51cc with SMTP id dm7-20020a0560000bc700b00343d06e51ccmr1672638wrb.66.1713449852974;
        Thu, 18 Apr 2024 07:17:32 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 07:17:32 -0700 (PDT)
From: amergnat@baylibre.com
Date: Thu, 18 Apr 2024 16:17:02 +0200
Subject: [PATCH v3 14/17] drm/mediatek: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-14-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2801; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=r/rf6DH3u4/RIc/AgVSnOwA+TJLknIEXoBhT9allVNg=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStjypxHC1AF4L3x0vY6H1KMKdkKlh+jAMEpcQ+v
 Z2my7l6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYwAKCRArRkmdfjHURauoEA
 CNdHASvLccHSGQBaHJPhaHKidU6MEYpyOyYukACG9Xl+CwO9iEmJaksqelQGe6Ma4DNNKYtKkfq5rP
 EiITw18CFONG9zkfEjO66VywxOu6sqVlLDDINpjOFSwPYfLuMLARTlcuDucts21j5aJTNLkAMGMUpd
 dy0gI53b6IryirzeYxRt4oMF1hscMI3ndCJoVWOr0Z9vlsyAmwPJHpsUSrlfCyABkhy3qAntmg7U7I
 Wo70cMcWQdW29iapeE1i2aQ9TGlhXnQnwTl0o8C6T/TrnvRCvNYEymzCwTVk4S6uIcIqklr+Yd9mBF
 bHAG0f+VCz8hWMjchFasbVlJQUfvHQlEwAVYCHl0Ons5U/hd4knfKY8ygtCzGoIwHKcMR6NcUu4sEA
 EO53KI+/V4rdp21R+IouIAS/+0h/3vP3CSw9Hsf4XbUJfbC7wdEJDgfQ8JINXJCDyTJx97yaED/Ekm
 RbY6i6UPy6XJVtO1YfLK+SfoVuGnVAvLXUCn7EeefvcX1M0Z/FSs1peMpBnOv3pTlnv7dmR03KrA77
 N7Q+bq8PRbbKgIb+SUzq6kIsFDDqSvzrqQ88Jc/O2/LNaLTIjqFYRup6Z2hY2+tITUHXmet/yppM9G
 ZnVOp4B8GPlaYGX7no69f5+YFPt/zLsiDH9ry0t20It8KZJz0RbfWffcMJjQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_071736_678280_057BB8FE 
X-CRM114-Status: GOOD (  10.99  )
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

From: Fabien Parent <fparent@baylibre.com>

Add DRM support for MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 74832c213092..427b601309c4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -230,6 +230,22 @@ static const unsigned int mt8195_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DP_INTF1,
 };
 
+static const unsigned int mt8365_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_DITHER0,
+	DDP_COMPONENT_DSI0,
+};
+
+static const unsigned int mt8365_mtk_ddp_ext[] = {
+	DDP_COMPONENT_RDMA1,
+	DDP_COMPONENT_DPI0,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -317,6 +333,14 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.mmsys_dev_num = 2,
 };
 
+static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
+	.main_path = mt8365_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8365_mtk_ddp_main),
+	.ext_path = mt8365_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt8365_mtk_ddp_ext),
+	.mmsys_dev_num = 1,
+};
+
 static const struct of_device_id mtk_drm_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-mmsys",
 	  .data = &mt2701_mmsys_driver_data},
@@ -344,6 +368,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8195_vdosys0_driver_data},
 	{ .compatible = "mediatek,mt8195-vdosys1",
 	  .data = &mt8195_vdosys1_driver_data},
+	{ .compatible = "mediatek,mt8365-mmsys",
+	  .data = &mt8365_mmsys_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
@@ -729,6 +755,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -793,6 +821,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8188-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8365-dpi",
+	  .data = (void *)MTK_DPI },
 	{ }
 };
 

-- 
2.25.1


