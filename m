Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 798E3C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nk4VEc7GrlonIpYIKhVQ5D+oJ75rejlCYM8CDWNoEgk=; b=BSH/hGEswGONmnXDevM8yBs49r
	jGnRsTzSE0aSiwuQEJkiDrqPAegA8QMuF3UnztCq0HxItxX+3QxCsvz6elUPfduW6qLLf4qirMyK8
	df4NP0oDagE+S4Tun1OydjCFdZCWYNqZ2X5ezrjG5kOiWVQhwdZiKrJD0BIAcg0iK8qJmVdmBQvtB
	Bh2wUyv8ecJcg7PGYcMe/J4LgDueZL699zXOIrOw2RzFr6IQIUxfhh3nwdy1XWYDmrRjQOg35aENx
	GezB8kw62mm2BDthW3gwuLokbm/+uarWtChZlYPEDztfBxJsFvaJRSEpEcwb5n7P1wxZxKtomWIr3
	HrbezaCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw81-007abF-0L;
	Mon, 23 Oct 2023 14:42:01 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw7E-007Zwi-1k
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:41:14 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-7b652e785dbso1281874241.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072071; x=1698676871; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nk4VEc7GrlonIpYIKhVQ5D+oJ75rejlCYM8CDWNoEgk=;
        b=ECvFNPv8iXB88SKDQznYiPTNNxYjCYA6sh1NzcGxycRa6kr46UODm9wxtFlCap75s2
         LF4B0RClmMqx5xBOdRWekw4WNJEIvX59Fc223W0fww/hVGwOYcvqI6vv1udXkWK39B80
         jZcafEflkguZUxTBdOKOQ4d5mDIH7lLDlB8mE7wvpmiRLjxRX45hHM8LBwsrpcf9oMm+
         w5JVR4sdT0tMt/7z5xJrRXVlNQ9Z8dLKjlp/XBfnNmZYObui5QYYh9sxyU+K1HjZSkMZ
         wuza9yHtrMuEMjFQAcgXwBaaseeyxiSiCWaxr34qE2DlLF7RWSeMUd8E5RsKc5mojbMl
         YLng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072071; x=1698676871;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nk4VEc7GrlonIpYIKhVQ5D+oJ75rejlCYM8CDWNoEgk=;
        b=ei8Oj0K0oF4fJUrUnPkgwxNCz1rbjXvNP50RCbfx3ggNiIAeu5+NkEOxfm3B+IH+bh
         VHyN4wWYNJPqh6Kt4Rf2I+CEVqhmUPpI+bDuPyK2nBHb2tF7MoTevxIyxNuFwPs3hRkV
         eWCQXD3vl+sPVzPcXxTTcn0an57S2ah5wmtjlFBOiB+L1Q5n3NhoFUUVPmN7E9uPBEmu
         MNqcDvYtLrSHH+MQ1/ZCgLsOzbhAGXeECtBDwagi74I+26nBBAMluslKMh8QbbKd5UUp
         7Qo5nUWztEW7ImbS6e1LgS0uAMnSNn8qO30wbOGp+XgpOEO6xod/4ed3kbVhA9GBsrep
         mqLQ==
X-Gm-Message-State: AOJu0YwaLomd5lZ/ZqZwbHao+kuYs72PXP++LQ6y09IcORXjJ3LLTpgK
	J2zdpDI2yUN3+0w8C9WYA7zwIA==
X-Google-Smtp-Source: AGHT+IGi20COa+cJp6G1XuUW8JjgOjJlZZG7i7oYmIj96ssiOC/4MvZePvje3VpCkVCDHPeEy9cLcA==
X-Received: by 2002:a67:c085:0:b0:457:cd8b:57b6 with SMTP id x5-20020a67c085000000b00457cd8b57b6mr8547423vsi.31.1698072071111;
        Mon, 23 Oct 2023 07:41:11 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.41.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:41:10 -0700 (PDT)
From: amergnat@baylibre.com
Date: Mon, 23 Oct 2023 16:40:15 +0200
Subject: [PATCH 15/18] drm/mediatek: add MT8365 SoC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-15-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2718; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=ZnkaVO4f0o9RizPBgJV2PC+/Ox7JmjKaiFkOq/2YPew=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPvl7J+ly89uTeJkwL0erLnyNQp9pX/flwDfIL
 raGDyHeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURRWTEA
 Cm6umD5gVmCR7xOl83GRyS+2etvws/qE9QDQtrdSXVazCbRh5I4OqeGTz5Wc/fqy9CeQ5923/lkKam
 Xw/JEizkC4ZVPJZOAe+6s82urCvz70SxQBFupbIl4RPXYIrx49T8ElS6+rr1pHMHn94YucqXY+a32f
 GMDycbKDPS3BcT1to+1F3fia0IpdzlYAS0QTnhxESja3h7ZPuMhNLE0pf8F+IZwrGeLCGifEroUqHE
 yz2eBBwDEsuhpRhwtrfZQONp//kfSqOG+SxxegQMja67q6Af6r+wCgaWtGXF8DD3rXfjHy310goD/Q
 3kjqLOk2eDKyCdTJLwq9ha1vr2raaT+Saj6ji5h36b7pQyKGusNTU3U4K/m2ICV0PMqY4bz1vTAvtn
 BraK0gFCfeYHz1JplSTOiKjJJOybGT6rhaTHEorLi8lFFtxqntfVvvFHap2mbH5OqE1etzR/51+opn
 mbUeGPQ/WKlStmhdMfmW3BHGD4aHc25cz8gis2NPw/Gri3XVURa3m0PKzoxy5sG+uFs8QTEuyk3+5P
 4lQvoNrLw/og2NCO2k5EZbGj4BL0KSNV3be5TNYyB+1MY1EwBtmRnqPFAZcy9tMJIyGnueWGJzR1bx
 /8uq/HHOr9EgLyx4kqNAfpC4e+UIsbhOPJiI/k8F23WM3cftiBOKY3nOBjcw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074112_597926_4145EFA2 
X-CRM114-Status: GOOD (  10.83  )
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
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 93552d76b6e7..682ab464186f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -227,6 +227,22 @@ static const unsigned int mt8195_mtk_ddp_ext[] = {
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
@@ -311,6 +327,14 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
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
@@ -336,6 +360,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8195_vdosys0_driver_data},
 	{ .compatible = "mediatek,mt8195-vdosys1",
 	  .data = &mt8195_vdosys1_driver_data},
+	{ .compatible = "mediatek,mt8365-mmsys",
+	  .data = &mt8365_mmsys_driver_data},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, mtk_drm_of_ids);
@@ -703,6 +729,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8195-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8365-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
 	{ .compatible = "mediatek,mt2701-disp-ovl",
@@ -765,6 +793,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DSI },
 	{ .compatible = "mediatek,mt8186-dsi",
 	  .data = (void *)MTK_DSI },
+	{ .compatible = "mediatek,mt8365-dpi",
+	  .data = (void *)MTK_DPI },
 	{ }
 };
 

-- 
2.25.1


