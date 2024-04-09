Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B88C67861
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 10:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFrY1D6xCh71cm7XNWVZx8QqBmaav+xzWA830Kc6M7k=; b=pTmd+xql+D+4hiWl4AqfTyw9JB
	7XT3k/sSeE1ZpN+n3YRde6Y9TWJ2pvbZ7R0QL9mgcbDgYZaa36bBK748wkGeW8qdH4egisk+h+FNk
	+Rs7RdNk2pvTzTpLEIHSCThkBp+D8FRNX1YssZsqv6auoCFTsgP2bpFgc5aiDZ7FDYDU0OtMG7iwG
	YzygTARGI9d3XT6pptChZX0olShL/kcHCjE1hUSXBQKZ/6DIpuhra62O/wrixNWhK/HA/THjlaK2N
	0i1GsngB4yXACTcC70DexkDTlM3OVPK2bSRwEaf5ch0G2ZTWFXVK4t31+znZ0oBJ8IsTsJ1bsjOU9
	VveS7cHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8W3-00000001Oln-2VQH;
	Tue, 09 Apr 2024 10:15:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8UV-00000001Nkq-2Cdf
	for linux-mediatek@bombadil.infradead.org;
	Tue, 09 Apr 2024 10:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VFrY1D6xCh71cm7XNWVZx8QqBmaav+xzWA830Kc6M7k=; b=V8tyHK2XIUS7A3V0zVnl/pELRE
	vN9DBFnwANg5eVmDqxLEVTP9Zb4x44f/1Kqhs9uMe6s/ZEPV4ozE7u6PqlFmzoUyUsENl7wiGYEXP
	vwevc4zyZNm4eddzIZzgMA/md7Xxj6fKwx8fNVqtcWkNdsQRqUzgXloSS0Dyz8rNEZ+I/rgCH/9d2
	Mrd4lijt++7i9Xg4H1eHF21V6y4gftsigKD8h213gCFK2yf7amRgYoALEZOKZv7kvulTedWpZrVWi
	GoFbca87zAsGjw6abXmadncK6AYZNi8XA9gcvbPXcpE3o2vrqoS5bDYy1y0XdnKAZx19A6JAzc4uV
	8J+RPAdA==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ru8UP-00000007YEt-2xdg
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 10:14:08 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-415515178ceso35238865e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 03:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712657644; x=1713262444; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFrY1D6xCh71cm7XNWVZx8QqBmaav+xzWA830Kc6M7k=;
        b=aEfbcSw28l2mQ1fnpHH9MaTb+wykSfxOwVHQQkoCbfsCuMme81hHZmBSYN+f2jc7Qx
         U+LWsw5wAydzF9sYGxivgCcexyHHkWwmtYJ7a3NjCA/ZW2H0K6C5Lf/zFb+s9xd95ytf
         snSWWdRay5itEM9+REXazlE+XQ7tguF14zn93XgKTBU10IluwWwyOj7rGB4EvCYauUZj
         0eymRp0o5SW8H1zsW5Bc58jcjieem9jn8bln+ewSCJ5Ti0tQ5s1RFmoLqNSQ04SaJ0Je
         SWAv1Gg4SdOOGkdpv3qvFLlt9yEvnzz16Hi2mtyWklM/ZU4IK/WIDRwsMCj5skoDbUGw
         mQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712657644; x=1713262444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFrY1D6xCh71cm7XNWVZx8QqBmaav+xzWA830Kc6M7k=;
        b=HWAnbMThyzBNH9fxQKE5+ZxX+LwQWJAtZKMUyvpjiVA8RdAu2jN6p6cpdnlB5z7YNo
         F821lTTdsk/esph26Pt4tKkj4hNh5/Gjetxb+WOLm5nuUKAOjJo0NWTUI5UAbWczMzcp
         LUfBA8LXCPoQ5ASIa9iCYR7qzKEyILMIbScKSJ53JE5tXBI+7S6TGWsvSqQQIH1Neex1
         o+Keueeo8kSw4Tjh4BXROFc1hSnI+h6TWQtY4xg5sRXIJNA9zWNW9sRQOOSONd8ZzJ+U
         wvXQOq487FmeXjaTgrdh0CepoBgKNs35i5XQ39M+f4F/OJtf18/UNzhRdKZcNKdLTFWZ
         KZvA==
X-Forwarded-Encrypted: i=1; AJvYcCW6GZEwFmrgNE8ujj8LneQ7/bAguQ8078IK65nv4ls1Mi41Sp7AMZsmW0SGqrfofn6oMtb+CJV8KmO9bfylakh7vaD2H0aVsyY/lsllvdteIEPz
X-Gm-Message-State: AOJu0Ywh4xjj7+F/nhp+GljqWd7Q8JfLo7L9oG3yhAwfNcwpLRgKw2yY
	Yalz5p+qA0YkBRDFbT25DC1aZjSFtT7hlZ5geIUWHAAcGocSR2Gimy/J19Uep2jFmjUbH8gABvR
	paaw=
X-Google-Smtp-Source: AGHT+IGto5A0cajSMQfWBoUsnHL/bjGErC62X6jy9DY5wuOhWozfx6Hc90y3B4gZlxuozIjpOi/DbA==
X-Received: by 2002:a05:600c:4ece:b0:416:3383:227a with SMTP id g14-20020a05600c4ece00b004163383227amr7019406wmq.0.1712657643955;
        Tue, 09 Apr 2024 03:14:03 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id r7-20020a05600c458700b00416b035c2d8sm1124149wmo.3.2024.04.09.03.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 03:14:03 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 12:13:36 +0200
Subject: [PATCH v2 15/18] arm64: defconfig: enable mt8365 sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v2-15-3043d483de0d@baylibre.com>
References: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
In-Reply-To: <20240226-audio-i350-v2-0-3043d483de0d@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=xiXcG5GEfrvSIF0BlBGjwdfWPuvXXb+gIEE1G1bDPqE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFRTT9bjW/zxLnXdKojc8YmUYjz4Xj8GvfHQ4mR/K
 qdeBVmiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhUU0wAKCRArRkmdfjHURbaXD/
 9qEhFdaTc6VeTRp830IrIzI59VW84lMyd4klwB3ysqotwcoiTfhdtKkSJYESy42RJP+s7XlsyHaKNC
 6DMcV517X8o9HasZ+qeqXuU/S6AQorT2SMu2LhRAYpW2ZHAlbx8uNmgq8zdKA0NxsrhB70obL5tMsc
 4i2B5m4mJ8Gx/uUFolJO/0aUN+GWHvEdc5uHNzZx3dUOEfq5TIuwO6GpeT9S68NX/by2O6HJ1SLE3A
 x4P+CY7bcB0z8MFq3So3eImUegjRZRdcHf/nY/kgqzQKuggSgr6u43fimgPtztuak9XxElmFZX+vRW
 plK0XS1uoWpEa0qQakXjOaQX+Lj/rbkkz6+V6vw2bRRsUKkvSjPMk52/+5oWwhzi4uZ1OQ7d4MfxFn
 bPzZnKclzE2DPdlLcVa8ZgkaCNGxg0gxbrCICRvnbq2SBGUafPRNbVvBwapxJr2dh1mWPedzs4dtb+
 g91qwCY+CufuR83GhjAMrC/tLHN6SCtmd14Sa3csER+YUm8ex7Wr3m9ZYCU0vACh3ifBw10Zj26Bjb
 KP3tyqCpSzPxlTRsmqtDLD35rgxdUwzcr2s98VNOrj2bmpaJA+dAgPYV67G3B/fiPVSyDzmgC/Q3GK
 Ixi66Dihvw0FcEd+RIrMbZ77RSNBjdv/OApkKgJtvbfXud9EWNVdxL1E12eQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_111406_089710_47176FE9 
X-CRM114-Status: GOOD (  10.51  )
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

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 2c30d617e180..40e88cdafa3a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -939,6 +939,8 @@ CONFIG_SND_SOC_MT8192=m
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


