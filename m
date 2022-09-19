Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23E10ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 18:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ewVwlqmSZNgETsEvZqoFNhQps11G0ZAn5b60e+kwmE=; b=kMFBsBrjxgiGRBDLwBVm6fL4iB
	sEtuwbiREMiIREB7rXjyTS9KCgvs7MJzsEvVp72scwranRqvXCpoSFwnMs3gZDQ2Tq9Gc+CffZ50X
	1yda5w6r9M3WWTMlmZVWyCG8g/o8xqyk0mtmhqIYvlRxdqMsqEc+yLpzXKlkIJh1DzG0A1BurLZdi
	bt9/tUX7MlLMcJak9347S+HsaRMKTkon4QKnJ8zaSrhkIHsG+4/XTpWQYm3h0TgWp5zMEYhCFzDcK
	I8P7tB7hJ9+rN63V4CVhH4Fczd02BPcD56LvrNmfn1k2pf5LXnnm5/3+omzZ8QQ2v3uyh3XBw7QWQ
	dbQw7gcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaL7z-00DWzZ-LM; Mon, 19 Sep 2022 18:04:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaL7H-00DW7g-A5
	for linux-mediatek@bombadil.infradead.org; Mon, 19 Sep 2022 18:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=7ewVwlqmSZNgETsEvZqoFNhQps11G0ZAn5b60e+kwmE=; b=l6wXCDfczd5NGyRE8Hed6VlpUL
	OfT65VPBCnCF6ur+J2MNdsUkN4qF86X/zyvLJJvLoZG5OctVcFRbWz7Fv3MrHjT/jWf95hB24ZmG1
	K9UlnDEIuvjZwdXcdyYlsujPC4uePEtcMIj4fiKzoZcqY+TDdi30RrSG1mqIPT/Vu+eFd9bzCjsae
	90/iVdwnzwkeg9G8iN8Xvo1rn7765MH1bThXFHQB8nNxV/o3vHIcl1r9Kdo1aEZzXYnpQ8tWRPj1X
	/haQQ4ljHwsbA5m7A65lY9EEKkNvmbVkGgXXb97zrjWcu1Yj6jjwWqIaGQCtGI1sDxdoE9thNFXOZ
	qhZaRK4w==;
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaK7p-00E8H5-O6
	for linux-mediatek@lists.infradead.org; Mon, 19 Sep 2022 17:00:08 +0000
Received: by mail-ej1-x62c.google.com with SMTP id l14so105326eja.7
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Sep 2022 10:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date;
        bh=7ewVwlqmSZNgETsEvZqoFNhQps11G0ZAn5b60e+kwmE=;
        b=ltJHkE9qpYoLEDSN5DAx3cZgruYpelRbpwQcuaGdFUMLM3WJOSSnmHPjq0mpUqr1/z
         gQmz4aIu1+C2XCgAurWgLJcYErvdR4pZCHRjigSIHMdLj1hHPhb1eZ0uKCN3yalxK9qu
         GQSLKUQSOH+ZG7+yYGBOCRSOxQjRklDOiAYlzLZkIXtvsZWEgeOzyAm7yN5N0KoblI5a
         Chf8ShDsXCqZKzCoTAj9MlcgaigL68bvRigo9a2jipo46Rdg4R3ClF/1eroZSV1j3O6z
         CgcSBUC0Z9qbQQR/6dtC3LdupnvTBwtPW3JXZNgAEGC0PifQtmrhh69LHGp9uY59knMO
         qdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7ewVwlqmSZNgETsEvZqoFNhQps11G0ZAn5b60e+kwmE=;
        b=rDlHRhl9UIUPLSYr9fnBs8XM3QU1yjv+faA7A/8AvlmftBfdhk9oRhxQrZfJSpU6Gr
         tnEJPOoiJgAMvomLWY1pRHvbhlTMEM4/cj6nGiBC/qDIn+7JtyCODuOpbOo+hSySNBBQ
         A3jBUFeTa//Tj24dfClbYAOohSTwVyOasuh7TJMb/7CY60IDc2zN7EGrIU0AvtamMSnO
         Zo0JUzmpsy7ZFtRD1z4zZAxypI5/77fOmEiItOVOMet4fY2gGYUb2jnEkDjTLnvPEqci
         osWb99EWXJnsVUcWowVB1RciZz1K/+Buu/PNrXexUXPg7p7tAENxLoQVj1f5fiTQHSjQ
         /tDQ==
X-Gm-Message-State: ACrzQf1JIJvjcDP0SZ/pB9YKev7K1OqoTKzv9Ebv53SUzxQ/2r7rHnbq
	HODS3IKZSC3iceSKF4CQuDYduQ==
X-Google-Smtp-Source: AMsMyM67IRRVMY+Suw0izTU3sRzUSrYIHC8PsOPjPY/v4kIJUR1V+xpsamXrdF60dn5nXvO6vgqnpA==
X-Received: by 2002:a17:907:72d5:b0:77d:5d01:4f4f with SMTP id du21-20020a17090772d500b0077d5d014f4fmr13945767ejc.285.1663606804603;
        Mon, 19 Sep 2022 10:00:04 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6340-f287-3074-96af-9642-0003.rev.sfr.net. [2a02:8440:6340:f287:3074:96af:9642:3])
        by smtp.gmail.com with ESMTPSA id cf16-20020a0564020b9000b0044fc3c0930csm20424246edb.16.2022.09.19.10.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 10:00:04 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 19 Sep 2022 18:56:08 +0200
Subject: [PATCH v1 10/17] drm/mediatek: hdmi: add frame_colorimetry flag
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v1-10-4844816c9808@baylibre.com>
References: <20220919-v1-0-4844816c9808@baylibre.com>
In-Reply-To: <20220919-v1-0-4844816c9808@baylibre.com>
To: Vinod Koul <vkoul@kernel.org>, Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, Pablo Sun <pablo.sun@mediatek.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, Guillaume Ranquet <granquet@baylibre.com>,
 devicetree@vger.kernel.org
X-Mailer: b4 0.10.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_180006_350847_8B77601B 
X-CRM114-Status: UNSURE (   9.80  )
X-CRM114-Notice: Please train this message.
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

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index 30407603d693..9fe086e2cd7c 100644
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
index 62a14435be69..75a9b62dccee 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -33,6 +33,7 @@ struct mtk_hdmi_conf {
 	bool cea_modes_only;
 	bool has_cec;
 	bool has_connector;
+	bool has_frame_colorimetry;
 	unsigned long max_mode_clock;
 	const struct drm_bridge_funcs *bridge_funcs;
 	void (*mtk_hdmi_output_init)(struct mtk_hdmi *hdmi);

-- 
b4 0.10.0-dev

