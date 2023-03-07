Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C226AC6FD1A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 16:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=McbTfENxEdZqEgXKH7PG/5bhwWFaGotxBfbxO1NPp48=; b=OWR6BfHeKdB6T/0voKlGEgRX8P
	tRorOU4egmL5megZ93jxnOcFEOm8p7wOh1WDOJ1znVZONNIInlXJmmsXnjppLDHmv8CGmv9ZUXn95
	83agTsKgjS8dnXPUqtIsn6mUAUT6ZITh4Jj0i5sMDsaSgi0aPF41KvvoSZq88N55uEeROfX4G7y4d
	wQBMgVyUi9oDpxGjNX2ZFO09aPO72JSV0y+eBqac2/yOSnlcXt2fxUqGLnN1pmEHSSvCtxH7bEMh6
	++xV/dMUvr7QQSPVyA+uHNmW+oWe9xQiSviqXUegd3Mk35WpvN3wiq1iktBQbZDVrKTYB7bBjwegx
	KfIV52eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZaHC-001Ypv-Oc; Tue, 07 Mar 2023 16:34:58 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZaGZ-001YY8-PP
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 16:34:28 +0000
Received: by mail-wm1-x335.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso7573352wmp.4
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 08:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678206856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=McbTfENxEdZqEgXKH7PG/5bhwWFaGotxBfbxO1NPp48=;
        b=CJBz8WiNOmy4gjUADtEpDsBjuJUou+AtKRwUTLpoCDEHs3cI8vLGnmQRVurKXNvh2W
         MuIBICoZJEF4co+iHP8IbBNI7+qq7HJOcPtJ+vw1b2nzJkT8uIoz7DkwWQ2zjyn434mK
         9p5vbeRtkFRSAoLMAObkctsE4y93KuLjbxePxHYLUgoscI6O+JEQPyEk9O44gDD0XQfn
         aMxMK8Loje+t2Sh2N/XlW+I1DbIeE27F8xpstSTdrsF0gVKx6KH3arlLKUfSYO60igNX
         Hwmj6H/0+1N2flv56QXqcJ140LrAr95GrU0Np4wv3BhgKrj3UIwDVXzDXnmmXpcT+oi/
         A7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678206856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McbTfENxEdZqEgXKH7PG/5bhwWFaGotxBfbxO1NPp48=;
        b=T5dPYdOFmNtS0K2P0XtcvNlcleG5IbHP5Je2mapF8oBmD7SyFv0s5jBALWtvcW5r66
         oWQK1bmS6egWuzCUNl3fagFFvqXa8K5tnH8/7XNz0tXHzCYw6BRFw2PUjWqK14rRs67k
         VFCKHqMA8hd51Uy+BsUHQt/X7o6HCJL+4aFPRuqj9xomADlAk2CtPiCv/FgC6YpMk7xW
         bxw8a965NapgA6XvAVzLnW/213TYcqChnuU6rWMzUO9teNuGRSHeMvfQhqhR/FIAxW34
         KacSalWI1jpVabtyqsU/nES0IkaaV1y1wtbot+MQRNbnvVw3n7TmH1YuGRK/ZVDUbDSF
         2w/A==
X-Gm-Message-State: AO0yUKW7fpK2gdVk9/PdWi5pQfxuv85QNKg03dCexKwxxQ54L56pBUb3
	wPmfv1tSmw8sS79tQxRlRmXczQ==
X-Google-Smtp-Source: AK7set8lgDaqUcBxQXAMw48pkJy8Px2UaNxydb31XT7KHAaWhBULcQb54e5gfZXZrkIR79Jma98IuA==
X-Received: by 2002:a05:600c:1d0e:b0:3eb:fc6:79cf with SMTP id l14-20020a05600c1d0e00b003eb0fc679cfmr14061185wms.6.1678206855945;
        Tue, 07 Mar 2023 08:34:15 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id t1-20020a5d49c1000000b002c563b124basm12778117wrs.103.2023.03.07.08.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 08:34:15 -0800 (PST)
From: bchihi@baylibre.com
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
	khilman@baylibre.com,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH 1/4] dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for mt8192
Date: Tue,  7 Mar 2023 17:34:10 +0100
Message-Id: <20230307163413.143334-2-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307163413.143334-1-bchihi@baylibre.com>
References: <20230307163413.143334-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_083419_942317_BEF98E0A 
X-CRM114-Status: UNSURE (   8.02  )
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
---
 .../thermal/mediatek,lvts-thermal.h           | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
index 8fa5a46675c4..5e9eb6217426 100644
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
2.34.1


