Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DA8CDB482
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 19:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M4DYHyP5rpJlCrGLu/7YVXYPDawqI0/vUMpje/5y6E4=; b=uDJkvcE4SKqcFHgOkjoOGMv3oJ
	dWhot3xPDd4yD8zU4a0z16hix5Xjjhmp9d08lrQzLWQorWfzcCwIgnwey/YVX3Py3gV3XjZwNyRVy
	FRM8+pqmoI5Pu8frCCSxj0TVOvlLgkNJFR1g1vkm/0e5DTf28O1H/K27uXpTuyjDO85U+N3M34M4I
	4lKDTqEffJs9TG5ijQVMvJWoOk8DWcjy7XC5/0Vijo2finz1n/v7skPPqZIah8eGQWkk4aEMaem2m
	8QrsHSnfQR/kwjD5qZn1d7wvl+gMhqI9Xm0pV3tnhK9X/+IVkjSwxr/mBpjc7MIVqU2UDnb8o5k/X
	Maj5V6Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qspOM-00D2wm-2Q;
	Tue, 17 Oct 2023 19:06:10 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qspO8-00D2l8-04
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Oct 2023 19:05:58 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-53e70b0a218so5701605a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 17 Oct 2023 12:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697569548; x=1698174348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4DYHyP5rpJlCrGLu/7YVXYPDawqI0/vUMpje/5y6E4=;
        b=x4xk4MipriwxY9joTKky9Uex9Wx0iN2rQZAJb7B9zxAJUFskNOyI/mm4Naaof/4DxQ
         QTmBpf1VWAZe9bMS6fP68HSOFLJaNmjPGgl51v/MaCW1M+PN64sl57AA64ugBpb6P/sp
         xAkPp0oefLg6bS0ZH9EFeGuxi5iZtF/0rUheSLARhAqzXqZFts/uFL9CCxhrJphLdkJE
         Sbahnec5PFTN6obCUtAmaTbJUdF9Ig4DC0lDDxf4AfEBSxvlWl1I05IbXtpKG4JKPRWW
         egeojg3oAjd/lc6Klmdf9MTvI5Ugoz56GI5RF7XcFLd6lq42NPi0IfImdQeLzWxSn/Ec
         /cvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697569548; x=1698174348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4DYHyP5rpJlCrGLu/7YVXYPDawqI0/vUMpje/5y6E4=;
        b=Ci81OnHdKGklpZcfIXEH6JPvFx7270bNyxc3NZOdDK+M7WIyhJhqDvxfZwl+4OLOor
         pLG/jb5eTaVjLpqKxSvtlnbaDcQgBSjLudaLsQTKk7oDuH7GxNc8oI5gFV5WimYJBBnS
         hU2eDgp9+BrJe1F0ugyvm+n9ERw+8X4+JDIFT4IsXOYHG2uZWpmusGvgAlxrrQGGuwOb
         0cPn5qxu0bqE+HDbjccPGMfFVtCMZSjDkrcFXwArgW20i9foX/YHElMwYfeoKxHLi1Vr
         35ZOwxqFjgiuxM+z3lugj8EEIb3UPzfTMXTN7nUZwmaw6EbRHQnZrNTBKnCLMeEE4pY9
         suGw==
X-Gm-Message-State: AOJu0YwdcRnIfZl3UifTIKbMJF91ltCSdcR2Lflu0+nTGx/I38XysdV8
	rYR0QIvjgOTChjPMMalOziCrcQ==
X-Google-Smtp-Source: AGHT+IE1d8gzvI8UJeLw/gO6durUM9+szimEzBZasfn/1pv7K2XCfq9TUaKMIAHdmRwjNmbGs2YMjQ==
X-Received: by 2002:a05:6402:5202:b0:53e:f9ef:ca6b with SMTP id s2-20020a056402520200b0053ef9efca6bmr2682060edd.7.1697569547959;
        Tue, 17 Oct 2023 12:05:47 -0700 (PDT)
Received: from ryzen9.fritz.box ([2a01:2a8:8f03:b001:fe65:a70:2777:ab31])
        by smtp.gmail.com with ESMTPSA id bq14-20020a056402214e00b00537963f692esm1637990edb.0.2023.10.17.12.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 12:05:47 -0700 (PDT)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	dunlap@infradead.org,
	e.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	wenst@chromium.org,
	ames.lo@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	abailon@baylibre.com,
	amergnat@baylibre.com,
	khilman@baylibre.com
Subject: [PATCH v5 1/5] dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for mt8192
Date: Tue, 17 Oct 2023 21:05:41 +0200
Message-ID: <20231017190545.157282-2-bero@baylibre.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231017190545.157282-1-bero@baylibre.com>
References: <20231017190545.157282-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_120556_090283_E0619AF8 
X-CRM114-Status: UNSURE (   7.74  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

Add LVTS thermal controller definition for MT8192.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 .../thermal/mediatek,lvts-thermal.h           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
index 8fa5a46675c46..5e9eb62174268 100644
--- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -26,4 +26,23 @@
 #define MT8195_AP_CAM0  15
 #define MT8195_AP_CAM1  16
 
+#define MT8192_MCU_BIG_CPU0     0
+#define MT8192_MCU_BIG_CPU1     1
+#define MT8192_MCU_BIG_CPU2     2
+#define MT8192_MCU_BIG_CPU3     3
+#define MT8192_MCU_LITTLE_CPU0  4
+#define MT8192_MCU_LITTLE_CPU1  5
+#define MT8192_MCU_LITTLE_CPU2  6
+#define MT8192_MCU_LITTLE_CPU3  7
+
+#define MT8192_AP_VPU0  8
+#define MT8192_AP_VPU1  9
+#define MT8192_AP_GPU0  10
+#define MT8192_AP_GPU1  11
+#define MT8192_AP_INFRA 12
+#define MT8192_AP_CAM   13
+#define MT8192_AP_MD0   14
+#define MT8192_AP_MD1   15
+#define MT8192_AP_MD2   16
+
 #endif /* __MEDIATEK_LVTS_DT_H */
-- 
2.42.0


