Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F0BD0E6EA
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Nov 2025 13:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5qoiP6TwSt3WsRHm0Qt9S7E0jYs8oQ+YtHQFRGroW9I=; b=hrAULrtAP9gfi0Fk5XPuXxjKuq
	EB16Wyiwaqnihq6NhTPOXF4eo4kvcVeF2EAc3rAe+m/TFLmJf26TRNIPnA12DS5nj5Va8euObTiu0
	w+6B1mimT0Hp9+705URmCQpvpJhSyoeZyEx8VkwbNeHiFZnv8GYAR1XrQ1ixbt4Fvl6FEbMRIxY4O
	zLuXRm6WdcbKrTjjs27C1aBb0KCCe/raEFE8q0R+Atj9uBoSanMDFnrgb1dYFooSflZGjO4mq6WFz
	LeFatNZWCBo9YbafL3wT7PMIR8iLzeTWxbI7DhSrpbvHO5wZN4YvpRDgbu9a69e0x99hAUIPYqGE6
	Ov6wqmQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtTL-0000000DNTX-06Ve;
	Tue, 25 Nov 2025 13:52:47 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNtTI-0000000DNSO-3Fzu
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Nov 2025 13:52:45 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-47118259fd8so48665625e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Nov 2025 05:52:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764078762; x=1764683562; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5qoiP6TwSt3WsRHm0Qt9S7E0jYs8oQ+YtHQFRGroW9I=;
        b=CbGk0s1gTWGT7c+8Bl+TTLGzmimz/PfkkZ5bVZxY/w7fCeuEqkeIidPNjTG8u2ck7H
         ter5MYQHcjJNGF0AkFsA8mAxKtW7Mhr5GRkmz11+rbx+sjCGuIW6FxT2c6EVS+PoV+xt
         zb+zwepR7akvL8XpIkz8hJ+3zrIJT36jl1p688rBiDVdYYNOVf7wXsBt1JP+iij3cdrV
         JemvWldubA46PE1wM3tmGbO+Ss6MO796qDpPAmf36dSrgODzgZxSrwYaGk3GmMUd5SWK
         /rjxxJlZDhLlFi6NgI2qu//V2M891gVIsXsiYftBoK5rfINb1aNuZzRiypMM98Ee2U2P
         Ui/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764078762; x=1764683562;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5qoiP6TwSt3WsRHm0Qt9S7E0jYs8oQ+YtHQFRGroW9I=;
        b=hIhkzsh7qh1vsnKkidYSuzltUgBaaE202X2Ra+C5K81hvzLym2J6UAGxhmruCHJq1O
         n2pUrYPYcjY1p22M4ryr6xV51kKfwPHJSi1HZi2e+IDvBhykrQ7rZ8OD3Xy9MbpUbPGW
         lZMkMR/e9vHOeGSPo3e9Bp2HCBPfeng0ZfX91/8XmVSKjVpyJoQ+DsAe//Zh0pbxhLGG
         Lha96+yew/AQMfWTQpiCtrhFoathzl0vatqwBqPsX5CrgUv/E4cLdOWPFPnh8j1EKnrS
         PbD7rlRCckb1rIMoTHHDxx14Pn8j2b3wpOUp9VH7G63Sh5F/9Z3eBrQL3OIUyA3Dtvib
         AgDw==
X-Forwarded-Encrypted: i=1; AJvYcCXeKHWqGfYn8e32BSyCNytOxTxi9kz5woFmZc8g8r/G8m8FgxyJ06myoDcGvhSK9aA5zLAtGfH58tCgMR6+Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8XXCSsL0UKTFQK03oD7XtauvxYUgUEOo9zQ+ckE4bWAYLGCPZ
	gIzXAFlHCaHzlJ+ODtEPJTd+C5IMPPzpCy0aQvdqIrzBU5J/xQcwVo3ZTKGpDczQTEs=
X-Gm-Gg: ASbGncu+zDDqRSeZ7FA+x8RzpBA4tnWZR3JwpvNrClteD2t7L5GItGav3wPjpH86hyg
	v0XrXdM4QFRdRGrye6XgVhjDobhst0cmcqOd0Yl3n3IoeRVmKu2B7yxrw1CWYNcKTqSXbAuCm98
	ALu5/HwIjUK/yXM+Y1Adsn9SyqarymvORSVvpmS3GVEGNKKoFLbDkIOzy6qO8ZVAFwCoSTuCCPa
	XE0i9Ici67mSnBYxtjRvLRJr2ya9nrmZ2F4EQU03uOo7uV4MIiLfzvNkhqZg1Sieh+rwH8hbV5L
	4E/2z7DVP8PdOl9ie2sW2++KfHERQGkasm/NcSrKNHrcrYWntRt9gq2tcUEKsvxJ/hWUVfHWNUH
	znZOI0jHvtCU7wTEvVpUYAjV9eHilXfc6aZTu7llqeZYqcpm8s+LfOOiwuIKk48qx3Q2qPr+niF
	JfmU9lIdWIATHz0qXX
X-Google-Smtp-Source: AGHT+IExMFPzaEj2t7R/V1HwC9wLFLjVdHnT+Jc3arjZhnTf+cI6vhU+qt5I6EYqSjZLnH2q9pLpiw==
X-Received: by 2002:a05:600c:3545:b0:477:7ab8:aba with SMTP id 5b1f17b1804b1-47904ac3ca4mr24955445e9.1.1764078762464;
        Tue, 25 Nov 2025 05:52:42 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477bf1f365fsm254495315e9.8.2025.11.25.05.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:52:41 -0800 (PST)
Date: Tue, 25 Nov 2025 16:52:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	CK Hu <ck.hu@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/mediatek: Fix platform_get_irq() error checking
Message-ID: <aSW0p5sqnJVJsqDO@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_055244_843171_A4F13FDD 
X-CRM114-Status: GOOD (  13.18  )
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

The platform_get_irq() function returns negative error codes on failure
and positive non-zero IRQ numbers on success.  It never returns NULL. Fix
the error checking to look for negatives, and change "hdmi->irq" from
unsigned int to just int.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
index e78eb0876f16..bd7f8c56ec9c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -303,7 +303,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device
 		return dev_err_probe(dev, ret, "Failed to get clocks\n");
 
 	hdmi->irq = platform_get_irq(pdev, 0);
-	if (!hdmi->irq)
+	if (hdmi->irq < 0)
 		return hdmi->irq;
 
 	hdmi->regs = device_node_to_regmap(dev->of_node);
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
index de5e064585f8..7a644bbf5843 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -168,7 +168,7 @@ struct mtk_hdmi {
 	bool audio_enable;
 	bool powered;
 	bool enabled;
-	unsigned int irq;
+	int irq;
 	enum hdmi_hpd_state hpd;
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
-- 
2.51.0


