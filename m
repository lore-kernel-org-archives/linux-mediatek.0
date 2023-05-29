Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38780C7EE2F
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 15:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxiLnH0M50rO/qW7JX7iQtyXgKtx4AkJoJmCH1LebW4=; b=oz5lWw7OFIPfqNtNAEM0lLyiQF
	zp/zB/qi5HJ5SoOHSg7S1ngAL1/csL1mXcwV6xX2gxmHXuPmsGWY42/RUbDjsoxx1kAzYkLkG+pFB
	/5SewthY5YuY/K6w7QEUR9i4tt7FesFUVrocikFrF2JhZFt6aDUKpaPNJtT4igrxI5NfLzTYHaoCv
	A1cXpr0UdtwH0wxka+3HfH48jNnYL9QlUEG6BTIZNQDH37VPr28Zy4pXiFdX+WHf/IILF2FXG82WC
	sok7Kr4PiSmP59OTOc/3O29Jpx253rJenAVMDAXQ6IEb1WBhwP/0em1asclmoVnqYrjVB8pHNFGPu
	AZ7Vgs1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3euP-00Awyj-0s;
	Mon, 29 May 2023 15:35:45 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3euL-00Awuf-2e
	for linux-mediatek@lists.infradead.org;
	Mon, 29 May 2023 15:35:43 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f6ffc2b314so8737175e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 May 2023 08:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685374536; x=1687966536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxiLnH0M50rO/qW7JX7iQtyXgKtx4AkJoJmCH1LebW4=;
        b=L//I9S2COgnPuAqwzY7rwCqIEzLr5UHMuung9l2NZeScGr95y8DGnRo7M71Q/tqPWw
         SvJr/sEATWPr2CHBmeJBhJ2BfcjsfLxyGY1+uL+7Y4SFFBzM24GJx6VYHGhFaZD2b5jk
         hIFSHlRrdkkIW6UHyhfFd8N9PmLksxfsIuivGrqCSBPNWFjFh6CBsfzxITI36oKqBSxH
         lnn1P+cV8vu1e+h6hIGzrDnloX0bA3dQ18MBFpbS9Do/eDP79363UCIVnqeXfY1dojuh
         b4MOVW0XdNbQ56C1lX2iO3fT4QkkgcxZ7dHtoGzNiOcVdyK64i06Li+WYzO8nRAPAB3h
         RvUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685374536; x=1687966536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxiLnH0M50rO/qW7JX7iQtyXgKtx4AkJoJmCH1LebW4=;
        b=g891Y3VyRcSX1J0nhilPPCV4NUt1jRRVFQ2+OzrBDeLrQnWgRW3ko01+SQxDLfyikr
         rW0mf5iHH9aKqiG+N5JOP5WSx3fvWBxs8Ic8vFspf/PAEfRR3jmkX4LQz7EOhvrcyd9C
         Oc6DklB/gZTk/hqLkMlOktrYGPWAcUTkcm9uiAjTv9Nko4lHjKstXBZK+mWGOcCZZQ/W
         SNv8uog1rn42uey0mnVdwHsiOMYhkojaWMk+siNaQTgiC4IwGnJvq03TAV82lZF3KaGp
         HBna9GtMvcnoY95zh8Rno2BGYat3r9d0Xq+XtYR1IjQhFV4+4Z4IY/1i18sANnoDpFnr
         bOLA==
X-Gm-Message-State: AC+VfDz10nBCjbHegsZSOLhCcQM1VtnlmGXMiW2Tx3Yt6UWkG18n+J1c
	zVKy6U+fgTHvfTKQHs1yfImqMw==
X-Google-Smtp-Source: ACHHUZ7qZHxmF3+e+rNlw5j8VzdMDxKnKmfpbQTz65hzsyWKZLCH+2IuKfhVLZ3R2YbGPj0C8SGvvw==
X-Received: by 2002:adf:e544:0:b0:30a:8e6a:3d77 with SMTP id z4-20020adfe544000000b0030a8e6a3d77mr7670288wrm.1.1685374535793;
        Mon, 29 May 2023 08:35:35 -0700 (PDT)
Received: from ph18.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j27-20020a5d453b000000b003095a329e90sm269781wra.97.2023.05.29.08.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 08:35:35 -0700 (PDT)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzystof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pangutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	wenst@chromium.org,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com,
	nfraprado@collabora.com,
	abailon@baylibre.com,
	amergnat@baylibre.com,
	khilman@baylibre.com
Subject: [PATCH v3 1/5] dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for mt8192
Date: Mon, 29 May 2023 17:35:28 +0200
Message-ID: <20230529153532.3541327-2-bero@baylibre.com>
X-Mailer: git-send-email 2.41.0.rc2
In-Reply-To: <20230529153532.3541327-1-bero@baylibre.com>
References: <20230529153532.3541327-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_083541_859525_F0505665 
X-CRM114-Status: UNSURE (   8.26  )
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
2.41.0.rc2


