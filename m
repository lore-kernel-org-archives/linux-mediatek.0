Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89F9C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 10:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q6TAMt++7cMkW1BStD+wsT/sNxqsrNSnDjvkmfey6Z4=; b=NhyAdj1wz0LnLjCpZ8TnOzcLKJ
	k1nFVGNRRGsRImL0foB4pA2kbcQfs6zaZ2PaVMtM9me6r1VCrjtQbmjh1L9iVvpxSBciZoOMIme7q
	WGdf0OKxaFsCs0ZYAf/sGkKuJ8HtILrn/LyDM82R04y8JzekY20LsHkgJKhIMpJL4nmu/puMDJ3kC
	8Fb3mett8pmesHe4/v7Q68XDl9XrZ3HI36kiMBIAPdCueikFUoKbepLWnTMaNUeZhI97iIdduJsys
	hNIcEbXoYuL+s9ReNS30kccBi6DpM+boCGdOxSYPdS05CBduw6OQwsbrUC59g6LLrjkRFcfKszbF9
	HS/I17cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk056-00434C-1Q;
	Wed, 05 Apr 2023 10:09:32 +0000
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk053-00432g-2C
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 10:09:31 +0000
Received: by mail-ed1-x542.google.com with SMTP id h8so139755284ede.8
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 03:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680689366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6TAMt++7cMkW1BStD+wsT/sNxqsrNSnDjvkmfey6Z4=;
        b=bEGMctTnM7DiSqO57EaQMKf5vh4yr7cDNlX1EY3Kv4Rwgb9KaAY/hM5KFna8Hffwva
         8kMd9qGJL5flWJTqF31LQyEVjPsCKAiquJoMgzOQ1f2+2DQypuHgKCa4qCyMLfLDRClF
         0trquQ6mQGzS7739tEkPSxc3CqbxgbtFlnkFzsLAf6Gd4Cy/G4yaBCvnDgVEvw5sJjhZ
         G9KyyQhHKgagyaifa8Ty4aCO2up0+O7oKj1QXklUhP4xzgRpIecqZlTI90Yz/BLdHKvd
         MEJYxlQvF1fUS+DWpsIcDefyffjc1rqgkbomvjmJ9+v8svYomd7No4uuZx+Wahbjns7U
         P5ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680689366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q6TAMt++7cMkW1BStD+wsT/sNxqsrNSnDjvkmfey6Z4=;
        b=d9xZPVrQv6UGhng5qOF8Vx5No3wcXW/B4A/Tn7cQo1pGVY9YCZekOqYJ1a7DGVWRD7
         r9OkxAQI7oypyW/IKFiMA5B57px4GOPZXhEeyaptvBttibbCElLRL3ei2Aghqt/r5uCk
         rjvBGSUfoc8VF2ZGkRcRXnZ05mBhD230ZjhnvWxT5b9Yb+jGG/N3tmQLIqN6eFxrgJ19
         zlU6ZQXQ+++przMP8Lt46EpivyYyBHpdcA62LeYV9RTgvmteaXXwLB+wC9zUuxkw2ogQ
         /fEqA6uvMj1U5a8IhWXp3lLlhzyuVxscekGFDUlmWfiMHZwPRhv5Tj3Pg1hW3W8uolru
         c9Gg==
X-Gm-Message-State: AAQBX9foNt0dHbhz0SCB3r7N89zcFJ15qC21TV/orbSjkzxoX8qLVohS
	X5OKAd5KIDiIeAS7hWshXwyLqA==
X-Google-Smtp-Source: AKy350bYmVv6IV6JXDqPc1avMQOvjnTmwfb8v7QF7sgI2XiiWDSjCfdP1dWYjIQjxHFNmhoK053P8Q==
X-Received: by 2002:a17:906:22d3:b0:878:72f7:bd87 with SMTP id q19-20020a17090622d300b0087872f7bd87mr1948024eja.6.1680689365926;
        Wed, 05 Apr 2023 03:09:25 -0700 (PDT)
Received: from t480-bl003.. (2a02-8440-c20e-c930-8ace-7c3c-c02b-cb9a.rev.sfr.net. [2a02:8440:c20e:c930:8ace:7c3c:c02b:cb9a])
        by smtp.gmail.com with ESMTPSA id u13-20020a1709063b8d00b0093e261cc8bcsm7195962ejf.58.2023.04.05.03.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 03:09:25 -0700 (PDT)
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
	wenst@chromium.org,
	khilman@baylibre.com,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH] arm64: dts: mediatek: mt8195: Add AP domain thermal zones
Date: Wed,  5 Apr 2023 12:09:07 +0200
Message-Id: <20230405100907.53740-1-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_030929_722233_B9B1E57D 
X-CRM114-Status: UNSURE (   8.88  )
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

Add AP Domain thermal zones for the mt8195 and
specify the targeted temperature thresholds.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>

---
This patch squashes and replaces

[PATCH 3/4] arm64: dts: mediatek: mt8195: Add AP domain thermal zones
https://lore.kernel.org/all/20230307154524.118541-4-bchihi@baylibre.com/

and

[PATCH 4/4] arm64: dts: mediatek: mt8195: Add AP domain temperature thresholds
https://lore.kernel.org/all/20230307154524.118541-5-bchihi@baylibre.com/

of the series

[PATCH 0/4] Add LVTS's AP thermal domain support for mt8195
https://lore.kernel.org/all/20230307154524.118541-1-bchihi@baylibre.com/
---
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 180 +++++++++++++++++++++++
 1 file changed, 180 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 972c5b86ddae..75da456c512b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2909,5 +2909,185 @@ map0 {
 				};
 			};
 		};
+
+		vpu0-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8195_AP_VPU0>;
+
+			trips {
+				vpu0_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				vpu0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		vpu1-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8195_AP_VPU1>;
+
+			trips {
+				vpu1_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				vpu1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu0-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8195_AP_GPU0>;
+
+			trips {
+				gpu0_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		gpu1-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8195_AP_GPU1>;
+
+			trips {
+				gpu1_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				gpu1_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		vdec-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8195_AP_VDEC>;
+
+			trips {
+				vdec_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				vdec_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		img-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8195_AP_IMG>;
+
+			trips {
+				img_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				img_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		infra-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8195_AP_INFRA>;
+
+			trips {
+				infra_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				infra_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cam0-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8195_AP_CAM0>;
+
+			trips {
+				cam0_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
+				cam0_crit: trip-crit {
+					temperature = <100000>;
+					hysteresis = <2000>;
+					type = "critical";
+				};
+			};
+		};
+
+		cam1-thermal {
+			polling-delay = <1000>;
+			polling-delay-passive = <250>;
+			thermal-sensors = <&lvts_ap MT8195_AP_CAM1>;
+
+			trips {
+				cam1_alert: trip-alert {
+					temperature = <85000>;
+					hysteresis = <2000>;
+					type = "passive";
+				};
+
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


