Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEEAC2BC81
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 14:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=; b=mYZbhZTCVnA3k68dsMi3jc8CtC
	e+WV2l/uDsQ3QfW9M3kEk+souUvSTeoH8uNqVj2L1oIPJOWlhmtkwysnG8gYRZTIjhltRiYmz2X1q
	qoYNDRtaTsZiXypY0cDrof7WdL0+wcQbwYyvpOFEXZLD5Bb4jsuJrPzMf8L8irT3Y5texLLPdefCT
	fHZYEAlmyRc32qgRTPN6L6m1elzbBkrbUvUTz0wUSGAq33UvLQ8FdRMOmRsB14ZQNLwENx2HZNYEG
	MjZShC/T9uoNAeAZHdrZqlBuQZ19/xcy64q3OrCxfe4xg3E9eqeC2iPX5dou61p7yL6RbCeDZ36pn
	fBeTiCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwcp-00000001eYA-3f9P;
	Wed, 19 Jun 2024 14:49:27 +0000
Received: from mail-lj1-f175.google.com ([209.85.208.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwah-00000001dF0-2KNm
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Jun 2024 14:47:21 +0000
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ec17eb4493so83558521fa.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Jun 2024 07:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718808429; x=1719413229; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
        b=zdcW75OwCUtChykPVGElUcfP2WjwULRg4/3nMXoY2DHMo1d99x3fTk1JfHoDZTWq0V
         hoLqegMxogMn+ekgNLHADD6+gaPx9Thfy4TlS5RZZjQm7A3ujxLTCms6hhVgErI+5zt6
         jQTfTEF6dSD4Qv9eu9vt/Kuw6k4OwZGLryD8u9xxYwATjlgK9xqxxs+KqGEuESJ9iRWn
         SnlyekBY0U3IjFQ3Or+Rg/+udFyv0+k9FPWuZLRYhFzCrPuwtdek1k91uBXhVQ9sLsj1
         YkDAoamZGE+00xZZjXk6uA+IL7LQMEEs2QPVhiUZsU9FOq4zkdqlIHcz8GA9/D0vthix
         hc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718808429; x=1719413229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
        b=Q+hqJOPgjFuoOhzxv84DXLGkFu/qUcJrDOHIGuKPf+JcNPUgRNbypOEEgR4nqQr/VY
         sV49CbGgCwBPKUZgK7PuEgHLLgcUw8ss8UO68Z4i3Yl9ppyEokk1FGPJs6PVPj2j0tYJ
         EFpKBYLg/4WZJs92r1U23Fibywk+/VOItJuYgU4AI9fZzb1d6c5EdI97l8L3NJYQnuiA
         vDVZq5RIWww03F6YfVNFQ+BRdoTIR7zMM1Yu8354FCjPbrXGtSHkPo1GkZRQGfZNPCCS
         KbWQmD6gysq+ownlvdMbWuGCY7UfkatZFoakdNciDNDkg7SeNcXDrdwL/3ZMjfAF4W5G
         Fcow==
X-Forwarded-Encrypted: i=1; AJvYcCVa02fS/Pmh7je6IRtk3el9Ji/IsG/d8DsxXERHCD4UIdgIV8OgH9C42+G2sCEHvq2Vwavt7qSMr3eCxGDbg/ecqjTtaeDW4oSNRZzQjBEOhVRn
X-Gm-Message-State: AOJu0Yycia+j5NXEawnIHqsqGkzlhs3c+xmlxGvADzh/si+cpVmyB0Ak
	nlyuLmmss3lLkiJaGE2RgafQbgNhd+TUNyi7+wgTm0lFlH/k2UjJQl0pmSxzC5g=
X-Google-Smtp-Source: AGHT+IHZjLCp6uoXlXfqQ0RKu5pWr8gxWPkxcPzzjLNo0AhaIUbrnCYVVlqUcTfIBz485mlGmWKOGQ==
X-Received: by 2002:a2e:2e0c:0:b0:2ea:e2d2:6231 with SMTP id 38308e7fff4ca-2ec3cfe9213mr23132561fa.33.1718808429743;
        Wed, 19 Jun 2024 07:47:09 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6f56da32c3sm679787566b.13.2024.06.19.07.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 07:47:09 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 19 Jun 2024 16:46:50 +0200
Subject: [PATCH v6 14/16] arm64: defconfig: enable mt8365 sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v6-14-f754ec1a7634@baylibre.com>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
In-Reply-To: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
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
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=cO45G3J6A2HCrNyifwgmbquTtW1hXtTIuXDjiQ9kiyk=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmcu9Rr31FcrlNuhRLXo8LEdu75PcCTBqW0u596FYF
 k5UOpl+JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZnLvUQAKCRArRkmdfjHURSe5EA
 DBeGdSSHpPMzGpeI7wNiG5y2VIzwe/IbVqGnCja84KdFBZP60REsnzx06exUV1LY0J0aEVp+sMhom1
 YR0dWD9pSUFYaJ1MieeF+nhaXBAnabOgoVj0YbdL+QP9oLoGBXPYGkxHH5OQE7ARC88nziL+5IjPpg
 F1eCcUCVDfNzlUqAzVZW0mKPDwsqepJWsZc4IwPyPn+AMdNwCcGi95SWV3ZloRUZMsPNCPo62v3dEj
 TluHhrArRuR0DM4rHGp/+FVGYnzvwzYYmTDkAtEKAtUVTXrTUbnmAgTm8iBONqSjmNxyigDMZqOW/G
 xhWA2aObi+dPX5iBDnzzhvSg94lJhQqs4qkE0D/6i4eDZsxw1AjWtpg7w1TXANsbwIon8nZwf2I5eo
 KaqTTsXIyO3eM3s/m5RIscP0UxdM9uV3c0OVe+FhN9QmpUzKs1f9Ncsx10WXBM4f0XNlPfH4V4Czab
 GhH9t9ehABinDvKvUULzLJM7o3OQ1VStF2S1FRkM7piYcYNhscWQsgwyE/0UbNC7YTIEw50G8IX9Wj
 Achaw7Dp8flH8t/Q0+auOQOjQPszi7eCZtAK8CxXrX2ur5u+7O4O8jUAyfITPt/sIogKMEGF94EW71
 cPBz2Spj7AJZW4378p6XZDWDoziFyqixN6TaLC1d/20pIrKQl6S+zpxGRGgQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_074716_339350_EF52FDAD 
X-CRM114-Status: GOOD (  10.56  )
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

Enable the MediaTek MT8365-EVK sound support.

The audio feature is handled by the MT8365 SoC and
the MT6357 PMIC codec audio.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 57a9abe78ee4..24b4d1a4992f 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -950,6 +950,8 @@ CONFIG_SND_SOC_MT8192=m
 CONFIG_SND_SOC_MT8192_MT6359_RT1015_RT5682=m
 CONFIG_SND_SOC_MT8195=m
 CONFIG_SND_SOC_MT8195_MT6359=m
+CONFIG_SND_SOC_MT8365=m
+CONFIG_SND_SOC_MT8365_MT6357=m
 CONFIG_SND_MESON_AXG_SOUND_CARD=m
 CONFIG_SND_MESON_GX_SOUND_CARD=m
 CONFIG_SND_SOC_QCOM=m

-- 
2.25.1


