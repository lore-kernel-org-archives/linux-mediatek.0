Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1F7FC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 16:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6zHUtmTd6RGvQvohicUDo1+C3cWxOXttYxoZ7C1AyNM=; b=tLBVJoZSkoPoINGyUM1rN5s+F/
	AsE7G+DtZKRQy4BXvO5gQ1qVL5GiTZbhmNMu8jZLYYwDKWVnVPxsfIx71d8NHKXywgNKHW088VFcs
	wXA78IGX15V3swxt9Ye2Zh1Td96ULIIpI9BugwhAWX6qc8F9LhgYAF/7bb6jdooVTYWWSGBaeZ29E
	ONdNHaw4Aicqb6mS2tIYTvBwZB8sILP9VdIn3eYQMiRdaflxkG8oT7ga+JwvTiJEPPk7Wk1wrLthH
	e7ryQbhadSs6uhhaX3VYuQc0HP6LwG7OZK6aNq4xctYaLUAxKTBnekcK04kXSIl07NYHl4L816gQb
	/knLPeMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojNAZ-00FGrY-4L; Fri, 14 Oct 2022 16:04:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojN9t-00FGKd-JT
	for linux-mediatek@bombadil.infradead.org; Fri, 14 Oct 2022 16:03:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6zHUtmTd6RGvQvohicUDo1+C3cWxOXttYxoZ7C1AyNM=; b=TrdRmbxnQLO779OfuMxANxgADW
	RPOxIpLsI2ssDDuUFVvav3ezJ2ZebchhtYK0vkUWVyOFJUduYM5wGosGYyiGWcaAcLlF4OP/EFybT
	E6a31jFURcqvXQaEhDlVQiQE26qlSRBSJ5ktqx6hDAZ02gmqzxx2cQYpbnCY3PwSE4bGLrBIPiOz+
	4JHK+eaE40cjscV+ctC0cwYoUZoTv2KBEks0k1Q7kaN/YXse9NG7mqY3dsXJFGZZCmLaq3XVZs5ZR
	YgNZstVXBNsBIviGDWenOoKsLprXrphTvZVWONgrhPT8jtaweLaD/x1shsj5sEa0AKLkC0nDMpQ47
	k0lLE+NQ==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojMTw-003RGb-1v
	for linux-mediatek@lists.infradead.org; Fri, 14 Oct 2022 15:20:19 +0000
Received: by mail-wr1-x42c.google.com with SMTP id w18so8068498wro.7
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Oct 2022 08:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6zHUtmTd6RGvQvohicUDo1+C3cWxOXttYxoZ7C1AyNM=;
        b=b1ekvbAxiRGUZad41w9dy58ZZBL0J8ridOkkwRdF18gInQzcQ3UDujQEakqXlF7ORS
         kcqz5/5ajESm3pS8aRZXGPJ7r/VMwfiZQ8dSyW7iL727J6Ge8Zb5zOsJu6F6XqJvRSXA
         9thV1Ae5r5MEcTc3kOLj1e26+YRURClTkzAuy03EpHVg806UPWDQUsLEB5gOKx6bA4C+
         HehDnD/Hv+7jWQtMyLxtgysj+FMG0fLbKP2hJJmojpgAJa7cpcV6LQyj1thMDMunUHAx
         RvY2edcIevRGvsBtTEy5CiaKVd470hlKHXlyIbzKn2BcHMEqLkV9SFEmcn3EGr4EQ/pI
         ARWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6zHUtmTd6RGvQvohicUDo1+C3cWxOXttYxoZ7C1AyNM=;
        b=IGc0hUzJMC2kcgcwfVQGrLiAWJYeGjqixs4jiWbmfkMWfe20GGloOWKQP4IuT5yxr7
         fGwYlM5jNykCFOR/F2NI7LRbAqm3Zcq9FS5lTmAGo4Ivdt5OU13GhbjlQzV4zU33S4iF
         j9pHErJPEU677uMXlQPX6lt+tdBUbTAjGKhdgPLpULVnQAHXsMrGtKtocFxAb66h0kpP
         c+1EzEOJxqxmh5QO6fWhiczrkZ/AirJTvCNtjhjb9I8YmyUglzgUqrge7SEzapibeS6p
         o+5z3wy78srwfIlWhWf91Uks+aF1bJYbfVtjtUL8/rK2BcH1uWxWX5F9S8oiBL1XFWLW
         349w==
X-Gm-Message-State: ACrzQf3jsg+zxBG+A70HrxHEfr3nlyBGmbFALXDvY/PmMRRvPLYPsZyu
	DIgzMLZMe+bvbRG590RA3alw/A==
X-Google-Smtp-Source: AMsMyM7PbqOJITOEtR5crgQ7E+88vK2lTNmV2WjxeoIYFVcAV8RbJTKDwqrf38QeKptXyFvuVE1wUQ==
X-Received: by 2002:adf:f14b:0:b0:22e:f162:f728 with SMTP id y11-20020adff14b000000b0022ef162f728mr3529705wro.681.1665760812812;
        Fri, 14 Oct 2022 08:20:12 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6241-7429-3074-96af-9642-0004.rev.sfr.net. [2a02:8440:6241:7429:3074:96af:9642:4])
        by smtp.gmail.com with ESMTPSA id z11-20020a05600c0a0b00b003c6bd91caa5sm2818223wmp.17.2022.10.14.08.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:20:12 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 14 Oct 2022 17:15:59 +0200
Subject: [PATCH v2 06/12] drm/mediatek: hdmi: add frame_colorimetry flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v2-6-8419dcf4f09d@baylibre.com>
References: <20220919-v2-0-8419dcf4f09d@baylibre.com>
In-Reply-To: <20220919-v2-0-8419dcf4f09d@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jitao shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Guillaume Ranquet <granquet@baylibre.com>, stuart.lee@mediatek.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, mac.shen@mediatek.com, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_162016_257075_6571D375 
X-CRM114-Status: GOOD (  11.09  )
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

Add a flag to indicate support for frame colorimetry.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 11 +++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h |  1 +
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 3635ca66817b..933c51b5f6d7 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -120,6 +120,17 @@ int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi, u8 *buffer, size_t bufsz
 		return err;
 	}
 
+	if (hdmi->conf->has_frame_colorimetry) {
+		frame.colorimetry = hdmi->colorimtery;
+		if (frame.colorimetry == HDMI_COLORIMETRY_EXTENDED)
+			frame.extended_colorimetry = hdmi->extended_colorimetry;
+
+		/* quantiation range:limited or full */
+		if (frame.colorspace == HDMI_COLORSPACE_RGB)
+			frame.quantization_range = hdmi->quantization_range;
+		else
+			frame.ycc_quantization_range = hdmi->ycc_quantization_range;
+	}
 	err = hdmi_avi_infoframe_pack(&frame, buffer, bufsz);
 
 	if (err < 0) {
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index 921bde150e11..2e8e5feec377 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -32,6 +32,7 @@ struct mtk_hdmi_conf {
 	bool tz_disabled;
 	bool cea_modes_only;
 	bool has_cec;
+	bool has_frame_colorimetry;
 	unsigned long max_mode_clock;
 	const struct drm_bridge_funcs *bridge_funcs;
 	void (*mtk_hdmi_output_init)(struct mtk_hdmi *hdmi);

-- 
b4 0.11.0-dev

