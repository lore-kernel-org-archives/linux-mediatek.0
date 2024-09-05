Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C836DCD4F5B
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 09:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJk7f2N+HA1Y6YzjwIRAJ/Lk0gofxkpiCV/2fVty4rY=; b=Ml7sa77b7DiROI5NrIrI8uCpwv
	LGKV6QEFHyEjiKPde3mPo9LXfnODu0ImIWAsy8wD+mbE5SZzYjz43y+8fmed+YeX5oOfImbir/czP
	lYkuwWPdkD6I3+TO8gVqDpG/IHI1lIWiMrMMEo61LY6AjSPGQTysZqFkNrL3541L7s+tNsFt7Wmh8
	aldc3be1mxHLJdi4zT5zb/De32DErmvbA9+pfNGAa1cFMRHZQrm6Z7Xrru27zjd1hFTaqA8esxwoK
	+F7xkrUe9wLkas6wSjG4TvhSn5n5sBt0p1upRviBmSGihwWPNshLllEysVvTntL7SUWwoVABFdYww
	NlHvG4iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8VA-00000007hNW-1iFW;
	Thu, 05 Sep 2024 09:10:04 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sm8So-00000007gim-00nI
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 09:07:40 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52f01b8738dso321441e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Sep 2024 02:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725527256; x=1726132056; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJk7f2N+HA1Y6YzjwIRAJ/Lk0gofxkpiCV/2fVty4rY=;
        b=YbJenbHZzOqdxLGp1zDi7twZdv3IdU10CCHDg63G6sBwbNsvfvW9euu2zvSr1HK65M
         hPx89/E0brxzmo9JKR5DN+1+HpQGYJTlqzFAWJcOjjPs2ld+UCOXURCJFIfk5W9rDZP2
         DOPKd88w/UnSnyO2QynVHGxKyuTjFeIETxhvTZKpw4dpIyVCXIauO33wZmK85JhWVq3R
         BMmuN6XAbd2k5PCR3KS9jm5CAuooBCC1p5u2OPEUd4tREypgLr42GFoxmOmxshZC9gAy
         7VumIT6MUYqn1lf/wqrs5e3/W+koHmsub3OH57t/5MCv+OQaytbKveOTdH7YGKr0/nbK
         LDlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725527256; x=1726132056;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJk7f2N+HA1Y6YzjwIRAJ/Lk0gofxkpiCV/2fVty4rY=;
        b=skdg8hpvslXbA8+Iny5FaUTj0uEcWQMHE5ZZRJ4bUgs7GJN+uTgZTNUEcjp92CuUWe
         kkAyVuOrhYoZ3ie974XdEO5j/1TX40ijdKqQx15ss/5YZNFkQPVcvAa3oBGDrg5AyBkt
         kU5W7Xe10mykbD4jfL+Ert8IXBZEo3huqW5yNzDD5wE/knBOqSLIjof1hIwMIdtNMY2+
         3/IZ476FeAuw+PSVsxnFl9I/LQW2WT7aRvCVJNjWnHwLGRqi30I+DVF6Q4NKrm1GCX4m
         EycIi6VIEq/Y5u/jWxI3Y4lQSFsUFzv3EHwPvHvsws7hO/GectQH2tTbytJL5302oFjh
         syBg==
X-Forwarded-Encrypted: i=1; AJvYcCVWgruar6dV/vuwtjgFScPBtfbAJkJhbnKt24UI8KP3orOxpOL+VQBZiYfdkdPmdHvhMO5egHfwjurl7ptggg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwksFqX9RZ1dMW9m2mUZRplgcDviDSnoM098VRkVEd7wkNugeBQ
	ZfuntNCCL/hfc8flvGGqxKTeKOptlj3R5+u2HhT00iUPJRNdPo7oQkGgOi1lHHY=
X-Google-Smtp-Source: AGHT+IFs8+VMCCS+jvh6TTSKud0Ey/SyfqlH/srAGZesQOhIuMZ5vqWUCBd0aestqPfkgml3SydqPA==
X-Received: by 2002:a05:6512:3ba4:b0:536:54df:bffc with SMTP id 2adb3069b0e04-53654dfc0bfmr209480e87.42.1725527255868;
        Thu, 05 Sep 2024 02:07:35 -0700 (PDT)
Received: from [127.0.1.1] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.googlemail.com with ESMTPSA id 2adb3069b0e04-535406e5549sm2554188e87.0.2024.09.05.02.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 02:07:34 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 05 Sep 2024 11:07:00 +0200
Subject: [PATCH v8 3/5] arm64: defconfig: enable mt8365 sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v8-3-e80a57d026ce@baylibre.com>
References: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
In-Reply-To: <20240226-audio-i350-v8-0-e80a57d026ce@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=HPABLM/OnGZ5eICgnPMApPSABlUQgJEpPt3kZFnmNiE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBm2XTOMW5lIAoANVUKUNDjH+dxaohjK3Cg1k73auR7
 KtwDIkeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZtl0zgAKCRArRkmdfjHURYzmD/
 9kuyyW6NXuGmylKkT8Lrr4g3YkhzIPfFVZCQsY4nytNGeCmkXCbrkeO2hPOSlf5C3lDOxMnSyztQK+
 0oLE+S2mI7YzhByUJhn/ymca/pPjCymqbCU1GXashLEjhAj00dnGMT4TisoKoSYvSN6DjuMnSao9Wf
 RX+69s1kLd8Z0MAE/fRQ/sPO76DiMIC4HSB94TXQo4gT3yffokHSL7foENi6RLFQKift+ChqquEShU
 NArgj4QJUxnPcYVTUzjTJ2Nj1BJKuXJ8hZodMpPzh79/xNAMl5a5sJ0pdqKphHEocUA+gj3D2TQ6cC
 QPHJmp5KWWNKpFxxnmTa1/obNNO5/JnZdaIe52+HhJHFWAh/HmYnNsgpXYjYKCf9eJq4fQLSOR+uTE
 U3ukEGHz2s4elO+D9DhagDnEGOhkuCB8cBO/R4q9ddsPKk22GVQ5vI4CjoA3oBWqzm4XL70ObdW2pk
 m76P2sh4/MJGXyJgYLHXx+QAAW2yXYbPXtdxsAyVX5THSIKoCYDVBlaV0IgB2su3tu/93btyEYPp+F
 7oHcBHI+AJ5zchHbjKeY7rsgjcP9QETbJCPRNBFGq8wJFi7e2FtgeN/qISxLVafBNv3zt91H2GAFzT
 ooZbNfHZoP3g1tUrIXVLzJZypq1oIlOMuPgZvtWGQcJbkAQf6uSfF9niW9IQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_020738_114842_BDD40CB8 
X-CRM114-Status: UNSURE (   9.85  )
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

Enable the MediaTek MT8365-EVK sound support.

The audio feature is handled by the MT8365 SoC and
the MT6357 PMIC codec audio.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7d32fca64996..111ca3abd651 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -960,6 +960,8 @@ CONFIG_SND_SOC_MT8192=m
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


