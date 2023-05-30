Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A3BC7EE2F
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 May 2023 19:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xMbc7ZMxh3N33Yc+ipgSHRqfEAA1Um0qlVG11Tvtq50=; b=nVSFe1nDDAc82Ufhpq+Gma1OnM
	kOCftEzSWK+t/1UWx6o4o6PlJxXMy5Z4HB8xcmXadRI7Q91HnZdIsVB1irjuTe0xSAH+Pkbozdf2k
	baDP65Seft0tPTXrM2Wi0mfwSY4deuYCmmZHrPwRfQlSB98giWhZIc7IC71B7Rg0w1XJmIZDhoLxT
	9f8/C7T39rIYdDdNaiuJE/cPihhM/TE/m8LRpQ9gMlAeYxvudjVgU9x4cGUjfeL/euy8jv6R8SGq8
	ufLpkJ/sa2cVM3wPXs+ORpQp3m1UbpKl10+oYbQ7trhdMzkNWxeNY8g1L7WvLrDfWmzIKecrWkX6r
	fsuWL6yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q45No-00F1ZJ-2P;
	Tue, 30 May 2023 19:51:52 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q45Nc-00F1PU-0D
	for linux-mediatek@lists.infradead.org;
	Tue, 30 May 2023 19:51:42 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-30aef0b8837so1844232f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 30 May 2023 12:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685476296; x=1688068296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xMbc7ZMxh3N33Yc+ipgSHRqfEAA1Um0qlVG11Tvtq50=;
        b=SQBjpmxhV4in/9DZqzAkeEBpua4/dKoQjL/6zGi7N6k7Qnv+gudpP6eiebLLyKWWtv
         xcYOgCaDTg9Ad6kH84wmmIvD3sSwJON2ESqPBayJ+uk49FpaAoc+m3ak7XPNUzCl/Fa/
         DPelZdwKMFeb9F8UrqQtyJyG2E5fpEElIzdROCJL2NMRSj7EDuZL8vxmaBcmn8YCdFA3
         cj80QMxxkZ6GnJ4vhksdj/6L86a/wybg48m/BNYVSNkulCNi3aVORvgK1+ftAYJytKTb
         hZWrAGW3J1UYmQzUEK+V4+e3lqyGKQ0CFdEkiX8wthmR+6XZUucxm4Q2YkX1iTpha4VD
         rQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685476296; x=1688068296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xMbc7ZMxh3N33Yc+ipgSHRqfEAA1Um0qlVG11Tvtq50=;
        b=LrDjiU2leOqXVOGVb5NnWi9DAQ9yqlzYKXdR8ZwXXKAu2wcBe7RCdejdLvMIbqYghf
         s/vVNpp/SnDRyAAD79aFKbFcmvzsS+L5sDMEdnLA2b0FGphf3Tlp1ghnRjX9YOV8+lf1
         ZPX5ik9zmpTaXTnv3kQGl2FfOqml7yQBl4oNZtWRpWBi/nSYEVJ21K/Kx+xsJFDx5jrC
         sX8J/DjYb7H5dfZ5+SH1hosCFjO9tcvHf7B6sW/E/8bWITNlPnOSPDYdy6cV6OE8wSRC
         9yWgHEfynUtTrTMKbGh2b/eVZU9lbbvBmLEqomrLh56kKksh35gIlc0j7SshI3hkbvCt
         OFmg==
X-Gm-Message-State: AC+VfDyIz8/ejXVHX6SBbiHSY7CaXDID/pdaPifoFbddle06pyZ5y6Yz
	1bgxImaLjAvW5IADKrqCDio6ug==
X-Google-Smtp-Source: ACHHUZ7riltF1w2kMK9/FEao5kDHEzupgwhRZfvGHIzNT/weB2JE4bnLo/0VpcWlOnNPmEC32Zpg7Q==
X-Received: by 2002:a5d:4d51:0:b0:306:2c39:5d52 with SMTP id a17-20020a5d4d51000000b003062c395d52mr2033984wru.57.1685476296347;
        Tue, 30 May 2023 12:51:36 -0700 (PDT)
Received: from ph18.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id n11-20020adfe34b000000b003078cd719ffsm4271545wrj.95.2023.05.30.12.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 12:51:35 -0700 (PDT)
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
Subject: [PATCH v4 1/5] dt-bindings: thermal: mediatek: Add LVTS thermal controller definition for mt8192
Date: Tue, 30 May 2023 21:51:28 +0200
Message-ID: <20230530195132.2286163-2-bero@baylibre.com>
X-Mailer: git-send-email 2.41.0.rc2
In-Reply-To: <20230530195132.2286163-1-bero@baylibre.com>
References: <20230530195132.2286163-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_125140_105123_854799C2 
X-CRM114-Status: UNSURE (   8.22  )
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


