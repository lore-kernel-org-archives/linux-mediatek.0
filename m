Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70D3C6FD1B
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 16:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TK38rfMZIYSCE09aA82gNal1pzr6tS/kIcgasbLVBmk=; b=Pjg7tzabrXz8jrFp5iNglnopZE
	fmFg0fBhSfFaA5/bu9ei1qTlUqaj+5JMZEf1pVOlzJZPPbOKVRa0WRQs4Gm7ML1wxLDMte2514x8+
	pLTTUaBD6MrMtv5CZP8+ILJB2vytJgJLShE3yMYp+C77IoVRpovs+/sfzt4cUEaaXnyH0bX4Zkt5P
	xrCuk0ZlPvGJzJPipiD3ygvsPLbnPtw8zTA8FRfXDn4yiXRyftyWzbtioX4vhksn8mvPr1NHWx37B
	30i3BzzqyiLw6LP4+08E2ApfFesu6YzNj9X7fUUkT/WgsEiH3leTevi8OMZ4UZVD7RbaUZu8iYMO5
	+iNadEZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZaSS-001ddP-0A; Tue, 07 Mar 2023 16:46:36 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZZVM-001IR5-Au
	for linux-mediatek@lists.infradead.org; Tue, 07 Mar 2023 15:45:38 +0000
Received: by mail-wr1-x42c.google.com with SMTP id f11so12572133wrv.8
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Mar 2023 07:45:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678203930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TK38rfMZIYSCE09aA82gNal1pzr6tS/kIcgasbLVBmk=;
        b=3rRyCvaUzbr48hyBZ2CFsD0pYrm9ofuBZ9w+ixhFmH+Wi43j+31NC/s814q6QNIxTy
         HhHe5i0C48LNdFjlVsmS6Qi3HTGBBAOkw+atIdb+RrvET+vqUuPqOuy10ch/rbOBIJqq
         Gu8Q074hLUlXgXMc+9Jru5M/pXPg8DI4UHy0rYtxZIqMsTvRGHf2NF4iBLKfIxa6TeD9
         Ytg6qE0d5W3AVCzQpeXahs23kDYVx7eDGgdSX5WI3HzCk4EFU8VUyhiqoAa0q2VbZF/C
         DVRY4k2cCL6PX/NelxjSBxLwWI6/M0ycf6DfFO850jb8z4Kef6mdyadtYQeW4oe/5Nes
         I+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678203930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TK38rfMZIYSCE09aA82gNal1pzr6tS/kIcgasbLVBmk=;
        b=BJw0Wom13hoAejPeavq0J/rac/4HT9Ot5ELR3KuwM7l9ssaNA85Uyl5xcxwi5T7p7D
         wGRUnpMW1GEVVEsQW+h1R1gHhxVRWI3sSJ5dqWCYEZvYTKaBT9oIWtPWDq7M3VOm8tgz
         ASpWv+CqjKcx34mwKRfVbts659odSVgWGkal8k4Rm+Q6hhlgHtlgF0YT3wKwT1O7JShR
         H/p48jeVpRNvK8nrIrHhGp0h2qRdzacsW6RfTeCuRup9YEAlLKADL9u6yly1t0JSIUlI
         NHqAQEfkqwisq7IPQzHX6mMQb27dQTrcK2AhvFh62TMvnA63qLjGJXInsadUWBfiowli
         ty5w==
X-Gm-Message-State: AO0yUKVbdagamFc9lB7iLrCYB4gTTaDzcwmCCtMFYSxoCX7diJzzqBx7
	HgiQx0H24DHlJSb7iKOolXo1SA==
X-Google-Smtp-Source: AK7set+Guq1ajs13XQHeh554Uq/SiB1NQLIWJev32JcaTps3DMHgTcd/r/3pFPm5VF8vMQ7O2omnWw==
X-Received: by 2002:a5d:4005:0:b0:2c9:5179:41a5 with SMTP id n5-20020a5d4005000000b002c9517941a5mr9632960wrp.8.1678203929903;
        Tue, 07 Mar 2023 07:45:29 -0800 (PST)
Received: from localhost.localdomain (laubervilliers-657-1-248-155.w90-24.abo.wanadoo.fr. [90.24.137.155])
        by smtp.gmail.com with ESMTPSA id f2-20020a5d50c2000000b002c704271b05sm12697905wrt.66.2023.03.07.07.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 07:45:29 -0800 (PST)
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
Subject: [PATCH 3/4] arm64: dts: mediatek: mt8195: Add AP domain thermal zones
Date: Tue,  7 Mar 2023 16:45:23 +0100
Message-Id: <20230307154524.118541-4-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307154524.118541-1-bchihi@baylibre.com>
References: <20230307154524.118541-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_074532_404485_1696F40C 
X-CRM114-Status: UNSURE (   9.34  )
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

Add AP Domain thermal zones for the mt8195.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 126 +++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 10c8fb0856bc..b066d1eab1dc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2652,5 +2652,131 @@ map0 {
 				};
 			};
 		};
+
+		vpu0-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8195_AP_VPU0>;
+
+			trips {
+				vpu0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		vpu1-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8195_AP_VPU1>;
+
+			trips {
+				vpu1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu0-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8195_AP_GPU0>;
+
+			trips {
+				gpu0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu1-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8195_AP_GPU1>;
+
+			trips {
+				gpu1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		vdec-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8195_AP_VDEC>;
+
+			trips {
+				vdec_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		img-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8195_AP_IMG>;
+
+			trips {
+				img_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		infra-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8195_AP_INFRA>;
+
+			trips {
+				infra_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cam0-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8195_AP_CAM0>;
+
+			trips {
+				cam0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cam1-thermal {
+			polling-delay = <0>;
+			polling-delay-passive = <0>;
+			thermal-sensors = <&lvts_ap MT8195_AP_CAM1>;
+
+			trips {
+				cam1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
 	};
 };
-- 
2.34.1


