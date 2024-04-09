Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9A0CD129D
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 13:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZUgXZ3l9DX2S4a80uAdGLWMlbvZfcEw87Whhx0PSEo=; b=mp5/97mrm44lhY0mh6BbSTc+lU
	TjJdDCju9b7QhLikpE9psKvGlPourk7plgaxUoOt8H3tWULTbD2os5rMg4qC5pJzQK//yDbb/vCJk
	wt9452MYpSIiTSo/U9nPz/07AXKweFF0w7jZsaH1I6pHCjn4yDPd66rgikWHLfOyVZr9MKKt7PC3u
	0NXcKNX3K8tf0WeGgJ+AvqEV5UKqZXUm7rZDenErf1XeJGPPMdZrPhyxcaGF4DjcZ/VvZoCHt4nSh
	Eh2q16PJnBxR0QHIbPTUDT1AT2F+J3OP6n4UsbWRNnidsO1bLNV/Kbntmi96W7de0NkJ8dvxfbCfU
	zwA+vW5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBmP-00000002DuE-47mA;
	Tue, 09 Apr 2024 13:44:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBkP-00000002CWZ-0vaG
	for linux-mediatek@bombadil.infradead.org;
	Tue, 09 Apr 2024 13:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=mZUgXZ3l9DX2S4a80uAdGLWMlbvZfcEw87Whhx0PSEo=; b=LjA7LCjXG90tpiQRg3A8N6lBeh
	meXg2EGgUJ6izytQOCP4olYCPOTRFF34qn47+cgxMQ1CBBLuO6xuFCL4vjRFBfVPjJJl6ie2kQa+O
	h6LuKT+vmgWvTkPSNqPM0W1HJC0Wo4nYzMn7A8ki7vZCwXKMKlbHmIh8KIQd4NgfIK4blhyjWC0KW
	N8lAKLy3z9mamzLNV5yq0WhyCNFHeSuigI2qsyPzVuq5uZ5p77I/blArIuFc1sCAPVvHpxIrbtGlt
	RBiBK9LKBq9M2FJ+aodeWUoav8nVB3PfDJaIgyRDco15pNvrzI/rRXml/znznRtUSobA896fRZ7Tu
	W1K1FizA==;
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBkI-00000007dDW-1REY
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 13:42:47 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-343cfe8cae1so3485406f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670157; x=1713274957; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mZUgXZ3l9DX2S4a80uAdGLWMlbvZfcEw87Whhx0PSEo=;
        b=dnJTrGyV7OcztCVKjE916AyfjnHbFhjeqQgS9aN3e3kAR0z9s5LtXMCbhOw3vgG5eA
         fMgbcJmrMeI6H+3BOBMl7jthNDEdqXa5AXRn3e+EL8YSz0t25FSMQPSPpVMhC47KUNAs
         TvEaI0hKrmQoakOHpOEst20D6hM6Sa6AaAZzpZRkrPisnbGRTvCN3bqACAJ+uEvCH0LI
         +jRy2rkTplOja1vZ1jiZa4u1+Z89fzQvjyumfg6gdK1FnFV4lWP8amZN+RlYSuTD6apk
         piIdfV+VMYmaoUdw91fz9zo7TK7KrV/5JW00aWyamG6RUk5A1+nm4qd/DuGqc1u5UDA0
         FgIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670157; x=1713274957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZUgXZ3l9DX2S4a80uAdGLWMlbvZfcEw87Whhx0PSEo=;
        b=N8oF6ESdaGlArCgB/88bLiVLXIqewijSDmHICD1Q5d1GhEdRDQHgvC6v/2KBs9pQXX
         t6MX/82wGIx52dJ7uMYxwJbeTTjtByb+ZzpF1P0SnbkIHahfHNTEG5k5orx5byBqY6b2
         Vc0iCqaKl5ALJmaXc4kXsbKjnnwQirHNcejuhoZ9fPWlOEP7XNRzZdhUzAnXiV63ZQ15
         MwmJV0vIPXwCfDgzIUGyVQn1UM3lNViFAF0HTnl88eMkjAa+zSuHvuSQDgdV4E31Mi6N
         KUIl0KAyuZ6KEKuE9DluGmr9zSwrAKaVq3M01aDN0oA1yjf+sku9klWnmwiveQCH45Ru
         K1Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWA6EJ/EWlAPB9hq5RfxlUQSH3jeA1nsWujMqX1GmQ4wctrzmyKsRgYa10SbavWtTWvDsTkil/lP+NjjyBaP9VvXiIdGhbed4eQwU09buteatP5
X-Gm-Message-State: AOJu0YxB3OOEyoPCCFaBisoJLDrdATNAJITUiC/JVgZVWA9eVQxxAFrF
	jqwYADca6Ejq+KO0G0f5AP6+qwUEp+M3qjr08T/mEANDjo6o/46Zm72/T72jFjQ=
X-Google-Smtp-Source: AGHT+IFGjlvzbCOfjHn4TQ9oMwjpMQVJxWx5NSO8PTuMLqRsu3gSTek8o/Yb9Gs7WCNj9tkhxldYSg==
X-Received: by 2002:a5d:5f46:0:b0:345:b238:5350 with SMTP id cm6-20020a5d5f46000000b00345b2385350mr5028344wrb.5.1712670157486;
        Tue, 09 Apr 2024 06:42:37 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:37 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:14 +0200
Subject: [PATCH v3 16/18] arm64: dts: mediatek: add mt6357 audio codec
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-16-16bb2c974c55@baylibre.com>
References: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
In-Reply-To: <20240226-audio-i350-v3-0-16bb2c974c55@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=927; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=9JiWubCt7cv90b13bkV2NJN74YeswiFHCbXLjZUbZs4=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWsBB+INxE5vCY/j+/NRlA1Wr5ahF8ESuy1jShl
 bI/aFGCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURVwpD/
 9R7oL/mcgCA9hRwOKkrw1uc6s3UD1+x2wFhNB4vjNy8u/4LtZ6Si+Sz0wtbTuuZa81yYKvN5FDCXv6
 5yOO8IMT7TcZEqIuh080vc0ijR9sRDwaY8HjSgssSoqaDM1XMRhBipn+Ng58Jn2cc5uLtCC5ZtKgtx
 x5J7GafmxgaESLPUkh1dx3C8LhefYmZytIUINT0sjddpb1YaioLh9bHNfo1va/OpWMYfe+0guWf8Ui
 p8xVppXIjFa75KiPl1iBdS7RfxKf7PjCuMpAcQ+YMmhXBoEBgtsW9ChZTFqRThZagJu+0ZwveZE3sL
 6yv5PhBoOQRYwa3fo9Uh7L7HqlMFdhZl9f5zAx2afaAZZ4SsiMWH3ujDpINYnc/WUtBs9Rm8H8+CdB
 yizDvl+Pavx1zsHdfWGnbuA6+FooIUbrCl1+4I05iw7CsLuc11gLDwtEHgdGLnxX3k1ENGYlHer8Vi
 PNNS96zmDfhiDZVZMaZ3wUe/u4Pp76ZO5NJyheitbq6V0xjnVaapjXcA/TIvMB+YsyKFJ9SwZooiZT
 8V5GDMXNLep+3NcXD7KWDIuTO0fE3q7u/XnT0xV5LpFvUKJlSJMCoH/uK5l010GZtd18VfuLr//lcR
 U5b/D90TT9SgcqEyTYoLmIiRysTnoW4CcF2+4ZQp/TZGtHpw2+ZPyiSM88Cw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_144242_698499_15A2650D 
X-CRM114-Status: GOOD (  12.91  )
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

Add audio codec support of MT6357 PMIC.
Update the file header.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/boot/dts/mediatek/mt6357.dtsi | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6357.dtsi b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
index 3330a03c2f74..ade410851524 100644
--- a/arch/arm64/boot/dts/mediatek/mt6357.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6357.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 /*
  * Copyright (c) 2020 MediaTek Inc.
- * Copyright (c) 2023 BayLibre Inc.
+ * Copyright (c) 2024 BayLibre Inc.
  */
 
 #include <dt-bindings/input/input.h>
@@ -10,6 +10,9 @@ &pwrap {
 	mt6357_pmic: pmic {
 		compatible = "mediatek,mt6357";
 
+		mt6357_codec: codec {
+		};
+
 		regulators {
 			mt6357_vproc_reg: buck-vproc {
 				regulator-name = "vproc";

-- 
2.25.1


