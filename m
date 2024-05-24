Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F68C25B74
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 May 2024 09:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoPKo6y3Rls3bork3EHcuNoN18jSBiGl7Uk9FD1A50s=; b=JJxCg6g+ZWV0BlP+SRCy5eJG/L
	DAtOc152qsj2Wv66ZrMYS0oQ8Jc+YilImQxjxMwcTNUm+w8GrXlVUp20yePiy8+BFke74R5xD5xAR
	6VHDp7IvY5Wud4gax3D6AbxG64QpbaxC1pMiwuucSkWafpLa3KFT8JAdeWdKU9pgoBp+xaa6t1Myw
	Um/CzpXkdlai69dlAVHnVci38Dx6Ga7GIXzyFfGupJPLtZ49+PZWjAkuAOsIxzCxx8QkSIjH9xQxv
	y+OW+9eYFA37RLiW8f2otapATo3PFQzMfIfZvDnRgYBioP+jathwTAQwmJs7fQssyiBoB+KCvOx6v
	zAZ64crQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAQrD-00000008Szn-3yYW;
	Fri, 24 May 2024 09:04:59 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAQr0-00000008Srg-2yhF
	for linux-mediatek@lists.infradead.org;
	Fri, 24 May 2024 09:04:50 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-420160f8f52so29576755e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 May 2024 02:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716541483; x=1717146283; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uoPKo6y3Rls3bork3EHcuNoN18jSBiGl7Uk9FD1A50s=;
        b=vHjS3n0yU5srt+D5e6BhgVWeyCma9oOv3aC1H1K8fBuLXmZDAgYBUNAqJf5UMGDd7p
         /cQlVBZwz7VAz70VZ0wpWUXNU+H/PZCB1TRboOwprqnY0Htpm0ON353TPXtGfLi61H0r
         KwS4Xd5iTPzUmSVssfxq9mDtP/1bBlwD0N9T8ZEGGo4xp4FbrB57uF6TkONcLqiRmLx3
         TXPcCx9zMnqcvH+p/kwNHmCTdow1ujKMEzWC0s6mfnxE5j2kESbjpHgoEFUXkXjd0139
         p5PVjTmj2W73EvuN4AmfpsttTyHPAIbsPmxEcH2Xr10U/dV11zoHrJDUaWBLglbIUhAY
         aqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716541483; x=1717146283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoPKo6y3Rls3bork3EHcuNoN18jSBiGl7Uk9FD1A50s=;
        b=KEbPbJwggvzHoRsd2enWtSrzw6Apihjt4yZAhV1BySdDVLMmEyDy+My7oOJ1ng6PiH
         TZuUOx4DI10rn5GxCEEyo2A1KBZIeRs5pSOdPVC55NXm3x8kzinxEExLIk8nv7F6TON9
         XGNuDLJzUz51saCPSvd1YXD+4D9rw5dNIbjL/v2is3dPnpid/AkW+CXgHdw4bbPYxVCR
         p7EVyc0+xrB1ovJ8QL9jFixm72QxwuzpdVWP9+vh1Bho9Zb0myC/Gb0AH8uiGaUedZXh
         +qP6yETHur1UzEusWA1EpZ/Vx8rQco71JKGhuPO56YkHN0WZItaM7Oo14TRXj1h/fiNP
         MS3A==
X-Forwarded-Encrypted: i=1; AJvYcCXzmI/ERWLgAXgTLukBc+TEE13wLT3tJA+rpIxfbux595+HcSwHehuopzLASyhTds7ESiZm4HkVhnWa0HcfQ2gOFy5orOIgWTveCJwKOF1u4l0e
X-Gm-Message-State: AOJu0YzN2akgqKGbKVIhgrAYvzkjN27mkabHiILT2QOFAlP7vucw/j8m
	MlWE3BgD8nUDMYQ/toa1UcBnNtYb3MqOt8ErLPjij920XQAdoBlLo/7H6sE9xRI=
X-Google-Smtp-Source: AGHT+IFpU4ERnNt7x7BjtA0EsmfIwtbjyLKpSwh5Xl1z3zoJKYR1+rNeB+IK22SAp4HcKpeCq9BkpA==
X-Received: by 2002:a05:600c:534f:b0:41b:b013:a2d8 with SMTP id 5b1f17b1804b1-421089f4daamr13145865e9.10.1716541483183;
        Fri, 24 May 2024 02:04:43 -0700 (PDT)
Received: from [127.0.1.1] ([84.102.31.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100f163a8sm47273045e9.13.2024.05.24.02.04.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 May 2024 02:04:42 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Date: Fri, 24 May 2024 11:04:34 +0200
Subject: [PATCH v5 1/6] dt-bindings: thermal: mediatek: Rename thermal zone
 definitions for MT8186 and MT8188
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240524-mtk-thermal-mt818x-dtsi-v5-1-56f8579820e7@baylibre.com>
References: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
In-Reply-To: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716541478; l=1161;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=dLqKCSSB83A5CpMYvy5y1AWx1dYh/sN+oOI5PnPOVSY=;
 b=UqNxuRjXPeTBHKlV/cedr5aBagTA3pLWnK/IbBAMO8LzIZYjxQP/cJw4HIrV2uIKRW8rZ0j0v
 gMjy5x16ppYCza2SKj8b9pCxHHd+9ZyJAaki0Noua2Oe4BxfAEWcQJu
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_020446_756658_66B95C2E 
X-CRM114-Status: UNSURE (   8.93  )
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

Use thermal zone names that make more sense.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
 include/dt-bindings/thermal/mediatek,lvts-thermal.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
index bf95309d2525..ddc7302a510a 100644
--- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
+++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
@@ -24,7 +24,7 @@
 #define MT8186_BIG_CPU1	5
 #define MT8186_NNA		6
 #define MT8186_ADSP		7
-#define MT8186_MFG		8
+#define MT8186_GPU		8
 
 #define MT8188_MCU_LITTLE_CPU0	0
 #define MT8188_MCU_LITTLE_CPU1	1
@@ -34,11 +34,11 @@
 #define MT8188_MCU_BIG_CPU1	5
 
 #define MT8188_AP_APU		0
-#define MT8188_AP_GPU1		1
-#define MT8188_AP_GPU2		2
-#define MT8188_AP_SOC1		3
-#define MT8188_AP_SOC2		4
-#define MT8188_AP_SOC3		5
+#define MT8188_AP_GPU0		1
+#define MT8188_AP_GPU1		2
+#define MT8188_AP_ADSP		3
+#define MT8188_AP_VDO		4
+#define MT8188_AP_INFRA		5
 #define MT8188_AP_CAM1		6
 #define MT8188_AP_CAM2		7
 

-- 
2.37.3


