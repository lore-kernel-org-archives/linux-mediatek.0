Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B2EC3064D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uw74zf66DQORFJn85kqFB7s36On7KUi5ywYxV+PBn+Q=; b=Xln2lVWJaS5KIgcrZ+BrpUybKA
	dnO4eg/wlKvNRU+kiHD8yS3z2+xukIqyIhSNH7Xd7kB6fgOQYnVqqobS8jjWAsOYYrgmIW2194Swv
	3TPOIAil8c33KaodTJXfVoxBpiJK+7oaMSasImwQs5y8eo27/WmAf30CAVM5B3dcxtR+6IdW+vwKz
	cjL7zReigdpysQEqZn459K4SR5sHz8vCtzIzQ0mJY6Lynyh/ibtgo15gUPMgg3F3qcuGiJBXxMqHq
	NDOOXSK/xnLVZZSENqjzacrKko1eiW5YLSPcAouRv8sNDRinv1RDo5KtqQzWfemms6ybzMH6/dzRv
	QjUOshFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmnf-0000000HZPF-3Ce4;
	Mon, 24 Jun 2024 16:44:15 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLmnY-0000000HZKU-0hSu;
	Mon, 24 Jun 2024 16:44:09 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4218180a122so34877045e9.1;
        Mon, 24 Jun 2024 09:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719247446; x=1719852246; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uw74zf66DQORFJn85kqFB7s36On7KUi5ywYxV+PBn+Q=;
        b=E+RzWzMNXvg08HL4QTjwEhj4vKkDTx/sEyRzN6UZF7vAeA+fcMsCwOLMC8JmVLHDT5
         pl6PPsTzvpOXntaZKVxyG6G43wb+ijrnI+IlN6Qfj2quzThHujxRFIPIoujwsYKG3ygH
         k9zH8qn+XIZBN8ewTrgnD8/UJ4L0EdDM4XzpcBSm3I9n038wLs7+qxSrH+5Hut8us3g9
         fUhfKHcjJcShRe+ibmdwDOJORwRtHWRC5JP5tiWM8NdHF9y4ztkJLve3Z+MQ16P9+LOf
         MK9STY72bPphfXg2sB/7Ja6YiwQPnofd6c/YjT+Mc1hcXSHXQIqn0S2i2yDLLRkZC2bY
         eKVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719247446; x=1719852246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uw74zf66DQORFJn85kqFB7s36On7KUi5ywYxV+PBn+Q=;
        b=EvJLfWJBjO4tzu2P3hOTN7xI8W5jp8LYgAQc04Ln1WNBJg3agJaUmoFBbdObijGS9H
         gZ6nKKklQ7SpqVD0WOB1z6pGFkD4u30Z62fBai15VWtoVhYOgMuT3Qd6F94mZA4o5NcN
         MYaWGKLssk5ZdxtXTZ9MGqv3/xg7SkRSOx6tsZjYKMsFbaEt/1InFjajEMHDZDlBmPGl
         hrq2C0dvKjM+ZFCZTBN4NTLCsWP2Sbiw98Hi0Zysg0FoXMEBnkXZ/ZVOBgZS8+B47TP+
         O8nsuRkdvPmE6hn3NmfwdBldrJ83Pfkl9EpxgKvBpvMHzPIUly8p264rioL+blyKk/jc
         immA==
X-Forwarded-Encrypted: i=1; AJvYcCV/xr17LdyGYaczAAjqPhTlSQg2T2yB0DSuU+kCiyoj/DHV4dmrbZ+UaC3O0CP3tLdWl/UUUZL0zUBVULw2SoQKrBdnawZuAZ2SFWSOoDbZCK3jBhKwVD+DoLN/mbAEghX//Mg1nQ9DKyB2Wkoibuhtk7H4IWBntMU=
X-Gm-Message-State: AOJu0YwNIKMd+AdIScYjf/z6xFz/qPFfZZEKYb6vElxdSRXuII0xfLLw
	igD+6qjvyiKoppP0RgBZQs1AGZEbZJuccI5N8vtF+qKTFy1y0lvt
X-Google-Smtp-Source: AGHT+IFJgazm2qcBXOO1WWxGq23AutwedIYScGjsNMAPrLSl9grCFKoRB3d22V6hGWsVj6fq6F18nQ==
X-Received: by 2002:a05:600c:6ca:b0:424:8dc4:ee43 with SMTP id 5b1f17b1804b1-4248dc4ef8cmr40224005e9.6.1719247446267;
        Mon, 24 Jun 2024 09:44:06 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at. [84.115.213.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42484fc0aecsm126090365e9.12.2024.06.24.09.44.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 09:44:05 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 24 Jun 2024 18:43:47 +0200
Subject: [PATCH 2/3] drm/mediatek: ovl_adaptor: add missing of_node_put()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-mtk_disp_ovl_adaptor_scoped-v1-2-9fa1e074d881@gmail.com>
References: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
In-Reply-To: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719247441; l=1042;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Y2BB2weXpa+LoCNHgaMdua1IE8aKDXJvx8s/YfYa6MI=;
 b=RAqXlU9Qx0xyXFz5ElRIdZf5wbyhqD1m5J/GrWFrXfBbUzgeeyRE+ciEsRkz6rmFpz1gue41A
 vrubTA59EmVC63CZJ8zl+7GhwXzFo2s4l6d2Ty9wnfS3yvCWNVBinoH
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_094408_271548_CE6CD5D9 
X-CRM114-Status: GOOD (  11.07  )
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

Error paths that exit for_each_child_of_node() need to call
of_node_put() to decerement the child refcount and avoid memory leaks.

Add the missing of_node_put().

Cc: stable@vger.kernel.org
Fixes: 453c3364632a ("drm/mediatek: Add ovl_adaptor support for MT8195")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 1418992311c4..3faf26a55e77 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -522,8 +522,10 @@ static int ovl_adaptor_comp_init(struct device *dev, struct component_match **ma
 		}
 
 		comp_pdev = of_find_device_by_node(node);
-		if (!comp_pdev)
+		if (!comp_pdev) {
+			of_node_put(node);
 			return -EPROBE_DEFER;
+		}
 
 		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
 

-- 
2.40.1


