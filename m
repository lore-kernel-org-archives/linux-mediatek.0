Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C49C77B7A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 18:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NxiLnH0M50rO/qW7JX7iQtyXgKtx4AkJoJmCH1LebW4=; b=BQqdIhtQhMGCS0TcQMd6Q4M4bA
	GTlqa4+ZfBz7kurQcU95G8cprCBSMViQJV6YWQGwCXAdOq5FC4TJv/58Em9ANG7hGsARV5NHRBReE
	U1PRHK/kQ70sIyml5bRwSY6NjYWClKjt0vOLQwcw/VAqX5BXP9HumYQj1YSkbi8IBaXSOEiZvRz5y
	rEU1ZrDHuDzjCjY//ge3vHATUkGPw8g3CXqTzrG87ytsF+Ljh96AAoQZ2ey8XIX4aZFwytmTAGubB
	mIeyOeSinXA947Sq1tNEpRbeAgrvJEDEreMFTfaZkGFW2MuYasGV64n+lO6yDV4V+R6gnds5HjaHr
	Wj6wCqYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3hAI-00BLqZ-28;
	Mon, 29 May 2023 18:00:18 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3g0b-00BAPk-1k
	for linux-mediatek@lists.infradead.org;
	Mon, 29 May 2023 16:46:15 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5148ebc4b89so4691808a12.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 May 2023 09:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685378771; x=1687970771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxiLnH0M50rO/qW7JX7iQtyXgKtx4AkJoJmCH1LebW4=;
        b=PibI7ffA9bBX6+x+JjrVc/w2AtIj2KQz9bHSi7VttnfkI2ZPnN5if7C07dvBLWSW2d
         weRes3Hd1QPpQcvo3POp/tvrkp2oIEdReemvYsYG9FbVbg3mldjfY3IMDDhToLEWzyAL
         yTxOybUXSpRIbqPJ5nuXrpHQHzXv/z1yDltXM9OHI/BxWELLgVTcXvUvGSSB8WnO44dB
         AOl62/fqCQkXB57zIEgAMOlXnNN4CC2SjZIKaLuiCleZqTQESdLi1DSWxGpfz8uW7qkY
         2pcQIk2OIeXZS6kstrpadwun7XKLtMaAXFewu8LlghyYhPzzI3TPkUjZVsRSuu5EB1pT
         xqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685378771; x=1687970771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxiLnH0M50rO/qW7JX7iQtyXgKtx4AkJoJmCH1LebW4=;
        b=Vf0ORXOCbVATDoviktR4JwJb8jeUGeydreKDF1B/BX4UoMrElk/wFVezMyRsr8D8v4
         Gz7pnjbstdtiFN6L4YfDY5dGnvg8sW5xSqJQWZ2J3LiGLkMAdAVIIwbX7RG+lXLdzfpT
         wCh6WMsqXA4Ing5bCWLskqTkEr0DyhWonaNZSoWsZedj4Sr5Z7/cFXeScoRJ3I3k8okm
         ZGzkBSNVSwAXdSEUMrbroBcRQHkop5DaeAWlcgm5KXo5uaWTd6JzxS2kY+rBj1ndAInW
         i6FBULeq+V6Tt+HUqQ4gG2JIUIW9f8AOVJ0m+OGuMBXmLWokiMbz5u9NTIzw0FwtVH1z
         9BXA==
X-Gm-Message-State: AC+VfDynYPRmirNAjK2DLMdKLKTmgJEZxno9wkJblzxWxgPQq+GI2ryT
	u1LUp014UzPcFwwExVzbq2Y+pg==
X-Google-Smtp-Source: ACHHUZ5gNCbXtMLfCqjRJ0nH0WPEiGrvsb5IpPrrSsXe98TatjsMehNONAcxpuek1O7918b3E4G+Kg==
X-Received: by 2002:aa7:c317:0:b0:514:a0a7:7e7f with SMTP id l23-20020aa7c317000000b00514a0a77e7fmr223165edq.2.1685378771160;
        Mon, 29 May 2023 09:46:11 -0700 (PDT)
Received: from ph18.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id f4-20020aa7d844000000b0050d89daaa70sm3248578eds.2.2023.05.29.09.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 09:46:10 -0700 (PDT)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
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
Date: Mon, 29 May 2023 18:46:01 +0200
Message-ID: <20230529164605.3552619-2-bero@baylibre.com>
X-Mailer: git-send-email 2.41.0.rc2
In-Reply-To: <20230529164605.3552619-1-bero@baylibre.com>
References: <20230529164605.3552619-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_094613_580855_02348E93 
X-CRM114-Status: UNSURE (   8.05  )
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


