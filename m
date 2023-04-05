Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E9CC77B6C
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jxn+TRsbL2lgiHIWio+0AzhmetW3gojePjlFvN063GE=; b=y699xb/16Unx8mjPW3cmFSz4/t
	G4oCN7irz71AyoEZsBWxYECycVPcqEY66TFKgk18chLIK36avmbWyjcEC8B+wKadLv/TUXSBiXojJ
	pnsstOa+jy0ZD3MmFY99xkiCygHRhJEIP2zgM+odEqKQuG36uJ50SveOYNI64HVWnEOwms3n606nR
	kp0tmbwekXUA7BDbmMeKRueHQ5VfMzWK4y24+wciBlU77kTh77V7QoMqasdRSnGx6FA9gz+WW5ZTL
	qWt+RNtCgx/uwybIxc3awLS3PTcWMSgv0d+bV1sPwlrz4vL55GMp/+3/xZTK2dKZ6UpubDV8IKk57
	XV2VfbTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyBp-003j93-1b;
	Wed, 05 Apr 2023 08:08:21 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjyBf-003iv5-2Q
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 08:08:15 +0000
Received: by mail-wm1-x329.google.com with SMTP id hg25-20020a05600c539900b003f05a99a841so3517570wmb.3
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680682071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jxn+TRsbL2lgiHIWio+0AzhmetW3gojePjlFvN063GE=;
        b=2v2OkzuuRJUu9wxcmBUvP6r1Ba/rQXyGTl1m7nRsAgncDGjyZFyyPANu4Sa9nSrD2I
         Z93ydPgaLwV7l2g+UkGJuLEOmmGAxYqPnYFSfODuVU93UPuzy1FMj70KZENcVAJQWFZk
         9aQ40WYBL9K5zEzAASv+K+WTicxyh4Fa33+49yzEyte7lCa5M/JHTL877KG2NQ6rzmz+
         u6UzZX4N7bRCGIgE6oO58Rx6atmumxXdOkXYdFSVxgogyL07fuyLm16k8m6sSaP75nbT
         cu4YazLcBEeX5O3yEHgiLmUN/OOtf/cbG5u7MuinZBBnn072Ell3lqCEzbqzOY5aM1wd
         dlsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680682071;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jxn+TRsbL2lgiHIWio+0AzhmetW3gojePjlFvN063GE=;
        b=8OitAu7fT6bvLW7iWfWq68a3QNvmrWHc5AqgaqXlU47Q5rwQprNy/L5z3at/doWxcj
         7LMt3BX7qxXvWSFkScf8N4WJAQl/RhatEYIbv68xwYtYLf6AVqOw4WhLqwDJ7UBXJthX
         HmxQWAqhpTUvIVNfLupMyJI7BgJZ+CHZ7Z08uOjG2ygSMjftND/8ByC4PrArVTGHVmAA
         1LRW08YVsN1hnbKRF3jc4YRdlqTmW98KgSkimh66p9sa1WqcKFxC9K9NRhdChPlsi/QH
         OjD6WCYUg6NrHa5ff89a+zhvWOngWjGTZrtJBqb14HcRULKqzoiKC588weLXcODOITp1
         5CLA==
X-Gm-Message-State: AAQBX9dxcM6Jp4+USOF8n9uhhPA1KNY8EBZPdQSiJE+vt0Rj8+16+XAY
	C85u9J1aTfOED1RDqZwoAmViCg==
X-Google-Smtp-Source: AKy350aYDMtAB7RImq+NzJ4YbsijUmKh0Ml1+EpsWBdmk7p/N5nqTXdoB3dxjZQSC2MXwRfJjGumrQ==
X-Received: by 2002:a7b:c4d5:0:b0:3ed:f5d4:3bff with SMTP id g21-20020a7bc4d5000000b003edf5d43bffmr4357607wmk.38.1680682071679;
        Wed, 05 Apr 2023 01:07:51 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d4-20020a05600c3ac400b003ee8a1bc220sm1378395wms.1.2023.04.05.01.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:07:51 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 05 Apr 2023 10:06:45 +0200
Subject: [PATCH v2 03/10] arm64: dts: mediatek: add mmsys support for
 mt8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230207-iommu-support-v2-3-60d5fa00e4e5@baylibre.com>
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
In-Reply-To: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=IIlOfZtAZXJ+CTRWdZTf7MxepUo9ZjXmi2nPi0PBDfE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkLSxSrgcqG1djcTNTRWOYYHbrXdoDcKGVNBJ0hN1w
 z6uDJSOJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZC0sUgAKCRArRkmdfjHURcs1D/
 9TQt78ycBkdpek0sI0bzfJTzN1K8RDJsz6H5yJheKmAHtsXfZ0Xf8ORFzRdvanX6ghoOqhXt/MrOux
 2ONo8GnccerLEzb3vbB8OTYpmjaLvlZfb2bUy8uzs7b8oYCU0amvDKJwj4J8zT5ovjNk/M91W/OkUm
 kI4dcgGHuPl7G5ErWQILWyGFGnnR41XBrnZzgJ/BALNGc38U4XDLobA1hJiG8zXB9JaCfbUOmHTk/g
 W3ygKXXzVTnOOjuN/tSstD/P8lsdRS/58mcVfR23FYcM/c4YavuLiEMjhHsimgnqofltoitI+8o+/m
 39ALvcIIC1YzkOX1uMx9Kvl8WCV0yoxZDJ8w2XPodTpmm1EMNtvVpJSxwPwnQmVmj/tKMJbH5yRWZC
 7sTSBM48hmNkK7J3cUzgkoiSGVY48jDurXJ1MPWfnAy2TQwN3Is3IwngHbs9OUHYofLxe0qQ+Kxt8B
 5q7AxhAEyxeq1UooNM0TnyJiGhRisx0e0DAHLx/7QYVLJ6xoORG2COtBtcSv4vJNiNjcTYyoiDrq1E
 JtcU5fkr/EkT/sTzIvujXn4MPnA1W8mjNNTa9z2Kqx6OrEfv0iqqaaf4ageee3g1/IqB8F3osz0dWh
 j8gtTbTZu/mWTkbhYNdk79iUc6hlVyLP25PQHyaSSUUHQITRGV/gin3DVlZQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_010811_821055_25F09B6D 
X-CRM114-Status: UNSURE (   8.67  )
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

Multimedia subsystem (MMsys) contains multimedia controller, Multimedia
Data Path v2.0 (MDP 2.0) and Display (DISP). The multimedia controller
includes bus fabric control, Smart Memory Interface (SMI) control,
memory access second-level arbiter, and multimedia configuration. It
plays the key role in handling different handshakings between infra
subsystem, video subsystem, image subsystem and G3D subsystem.

For more detail, ask Mediatek for the MT8365 AIoT application processor
functional specification.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt8365.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
index b5f5c77f7f84..db9ab538c34d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
@@ -592,6 +592,12 @@ u2port1: usb-phy@1000 {
 				#phy-cells = <1>;
 			};
 		};
+
+		mmsys: syscon@14000000 {
+			compatible = "mediatek,mt8365-mmsys", "syscon";
+			reg = <0 0x14000000 0 0x1000>;
+			#clock-cells = <1>;
+		};
 	};
 
 	timer {

-- 
2.25.1


