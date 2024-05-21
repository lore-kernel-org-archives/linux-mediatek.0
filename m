Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D126C25B74
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 15:16:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zgoKFoQ+1ZxeBSFvhA/0PLTmzF3XLdEhqXLatkcXB1c=; b=Aeg5QG5mScGo9y
	jDZi8FHOXfTMFxz+FbA2egmp6aZq7oaz/hcmG48KKeq0iHq3XNCeKSSESv3laT3o/gqd65aalST0Y
	C2A3ehb1wvKrCZs8HAL9msPy616i5eJudYL4hI1L7q2ntdDMja0v1iSx3dY5u4jF6vdR07VWNzkzr
	zL/RJsBTRIWO1hB3TCc9Aqry384HzTfliZ5O/WupcHNy17p1/kHGcaVnzGmAq2PBzYCQoxjYUiAnm
	JURy+VAqDxqrvcNnQNROl2KYqCyBzRjP2gnQkq9eRBQQlmYaKTRUAVNkIXurzQCz0iYlJVpVdBlAp
	t28hjMC3jLUFUhvQ4lMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9RDm-00000000JaO-2NXt;
	Tue, 21 May 2024 15:16:10 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9Q7n-000000006An-3CQs
	for linux-mediatek@lists.infradead.org;
	Tue, 21 May 2024 14:05:58 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-41fd5dc04f0so23494635e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 21 May 2024 07:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716300348; x=1716905148; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zgoKFoQ+1ZxeBSFvhA/0PLTmzF3XLdEhqXLatkcXB1c=;
        b=TXc8kA2nsj8FUj8V+Z2Nh9h1mp++jObti3SgpgElXv8YGsDZlfNvTrFUVosqnmVODp
         bk42IjhAS6e5TInHY1NmpId/SNqrfA/5KCN0xZwCSEQ+xqJvGhckhQ+IKDgkWeJCrAfA
         FiIrZ5yUoXkhFBhgWFCKqJUvwx1CCMxf1/ZfYaFw4w2Jtf7unSfe9U9DYFdLpC/0oEts
         IeGBK6lHWIz6tDGUTiovuNTTMM/UnjVVL49q6x3B7lKyF+oTyFrEKwAXrugoGIZCHsL1
         jaYaRpvG/jkUccgue6v94MxF+eeR1LtnuFPi9Yt9IFk79b13oYrq01c4LZCf8kLtnwus
         nJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716300348; x=1716905148;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgoKFoQ+1ZxeBSFvhA/0PLTmzF3XLdEhqXLatkcXB1c=;
        b=K88GLGymXTEMOp0pHmv+BiU6mZZmyAffyL/lz7X2cHEHKf7/g0bQy0+Z0blRTvLWiJ
         EhyQkVPWuH1qPlI8i9AIvTyI3SWY5fUGk26b895p43aTJvp5IkWwAxLXU7nHpsfzzIV7
         C9Qhf+mWpXYVaTqqW8i9j/YDoKZjawVXXB2ZeIcmgb28SPJ7hjYjlt3/ENAYRW3YUFSF
         VoLvPeVCvwkla/M5Cpsyv5XdaWiM/TsS/AwkZd7t7zEmaSshW0IBVpLUOi5ySc6ozyG4
         cBepL6y59H9/TjBNfc8Bt+Qm8+DwbBk2+mtKXVKI1+fXFRgKbGDgRvVDupoCr2sfP2kS
         K4DA==
X-Forwarded-Encrypted: i=1; AJvYcCUXdTxYPBOv7HfYACHTXUiMqnS910D8veLDmVpMdV5FlYOiHn8Al+uISTJIFiNLK9nTRrcC+zTCRrjT6wKRZVhSd80VcZSA5U8PEi2lDWBYt8or
X-Gm-Message-State: AOJu0YxnNJV1/joFlcdaEZ8aPA5lzM/WLTGE+NtjOqJD4fdsw41Sa1O+
	fgpGFgdRufZzyyIkCOQQ4ANUxZ9b1BHbD+46Zg14TAV+EOhVWPllEhKdKsZw3xk=
X-Google-Smtp-Source: AGHT+IFmqJnb4ObWiPzsVQuZAWrqnThUPe8ztSlw4PvCSGE0QT/f8sLOvVgkTo5aE0vFaVuHcCymvA==
X-Received: by 2002:a05:600c:3592:b0:420:1a0d:f15d with SMTP id 5b1f17b1804b1-4201a0df409mr219365415e9.22.1716300347840;
        Tue, 21 May 2024 07:05:47 -0700 (PDT)
Received: from [127.0.1.1] (abordeaux-651-1-78-161.w90-5.abo.wanadoo.fr. [90.5.97.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42015deac1asm342085945e9.17.2024.05.21.07.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 07:05:47 -0700 (PDT)
From: Julien Panis <jpanis@baylibre.com>
Subject: [PATCH v4 0/4] Mediatek thermal sensor driver support for MT8186
 and MT8188
Date: Tue, 21 May 2024 16:05:34 +0200
Message-Id: <20240521-mtk-thermal-mt818x-dtsi-v4-0-b91ee678411c@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC6qTGYC/x2Myw5AMBAAf0X2bJOqV/kVcSgWG1rSNiIR/65xm
 znMPODJMXlokwccXez5sFGKNIFx1XYh5Ck6SCELUUqBJmwYVnJG75FVpm6cgmekUee1mpuh0gJ
 ifTqa+f7PXf++H1oE/hRpAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Nicolas Pitre <npitre@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Panis <jpanis@baylibre.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1716300346; l=1983;
 i=jpanis@baylibre.com; s=20230526; h=from:subject:message-id;
 bh=JUfb8zY+izCRC4r50MixNaaw78CPvzL7Ajdm+ROpRS8=;
 b=Rv1gAaXrI9T1gUh79Yf80ndSE1qfUTglrDHcSeo8X96oSkWcD33mgOnC648Krl2/j+tLEWccz
 CmXGPBXvimlD6ZQ+ofFFt6ktYgM86f2JCojX6rEzyAeR/IoO0YZIbF0
X-Developer-Key: i=jpanis@baylibre.com; a=ed25519;
 pk=8eSM4/xkiHWz2M1Cw1U3m2/YfPbsUdEJPCWY3Mh9ekQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_070555_878580_38EE32FB 
X-CRM114-Status: GOOD (  10.96  )
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

This is a bunch of patches to support the MT8186 and MT8188 thermal
sensor configurations.

Since the patches of v3 were applied except those related to the SoC
device trees, this series includes only patches for 'mt8186.dtsi' and
'mt8188.dtsi'.

Signed-off-by: Julien Panis <jpanis@baylibre.com>
---
Changes in v4:
- Fix wrong thermal zone names.
- Lower 'polling-delay-passive' values.
- Set 'hysteresis' value to 0 for 'critical' trips.
- Add a 'hot' trip point in between 'passive' and 'critical' trips.
- Link to v3: https://lore.kernel.org/all/20240402032729.2736685-1-nico@fluxnic.net/

Changes in v3:
- use meaningful name for binding index definitions
- reuse LVTS_COEFF_*_MT7988 on MT8186 per reviewer request
- do similarly for MT8188 that now reuses LVTS_COEFF_*_MT8195
- use thermal zone names the svs driver wants
- adjust some DT node names and iospace length
- remove variable .hw_tshut_temp as it is constant across all SOCs
- Link to v2: https://lore.kernel.org/all/20240318212428.3843952-1-nico@fluxnic.net/

Changes in v2:
- renamed CPU cluster thermal zones in DT
- fixed logic to cope with empty controller slots at the beginning
- isolated bindings to their own patches
- added MT8188 default thermal zones
- Link to v1: https://lore.kernel.org/all/20240111223020.3593558-1-nico@fluxnic.net/T/

---
Nicolas Pitre (4):
      arm64: dts: mediatek: mt8186: add lvts definitions
      arm64: dts: mediatek: mt8186: add default thermal zones
      arm64: dts: mediatek: mt8188: add lvts definitions
      arm64: dts: mediatek: mt8188: add default thermal zones

 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 309 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 467 +++++++++++++++++++++++++++++++
 2 files changed, 776 insertions(+)
---
base-commit: 632483ea8004edfadd035de36e1ab2c7c4f53158
change-id: 20240520-mtk-thermal-mt818x-dtsi-eca378f9b6a0

Best regards,
-- 
Julien Panis <jpanis@baylibre.com>


