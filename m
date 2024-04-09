Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB00CD129A
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Apr 2024 13:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFrY1D6xCh71cm7XNWVZx8QqBmaav+xzWA830Kc6M7k=; b=Yun7e1QEKKfkAuw3Ityu5yi1RM
	Ral7gxIEGjvICQG05C8xmeA3krivSEvk3+5Ez9yq/6g3AA2yrW3TmiUUOAdzVC/hIPNRNZm7iNlv+
	dhHiILONcf+AHJvvGFqWmPpjbUEDFGGLyUzJH/tMpITaRVrwNq6BrX/scFV45edCbZjK5nY8qfdcn
	kS5kfTnDaobegDxS6vxfv4aUrLY8/QTKq7hkwORBw7IMbWHQua15KFzGf6hNw74Vv+gHl3HMYsaXz
	5anq0j83S601H20bXvD8Lk+uoMvU62Vzaae60ZuVEgX291dBXnA+tJkjycaVUtGqXQAzI3R28QcBN
	zbGoXxAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBmN-00000002DsE-1MLV;
	Tue, 09 Apr 2024 13:44:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBkO-00000002CWR-44pt
	for linux-mediatek@bombadil.infradead.org;
	Tue, 09 Apr 2024 13:42:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=VFrY1D6xCh71cm7XNWVZx8QqBmaav+xzWA830Kc6M7k=; b=mVbiHsIFV/bQHroYhu3NGDsJhk
	/4s7tuFBYeVQSnREF0NZUsOHcAnyYJ2XybcgUwQKjZfYtE+uuvuLsTOFEZ61TFa7pSf34xT1zXRjd
	OGAPIqHqC+AtONPNcJ4m2k71WoUNhAfC9XdRRII5keF5JtbYGIMONDIaNtTlFpJfor2l1vLYc+nGo
	TZebdb28yZ8Oi0FJUOcBkAJWwLx9GgTX7IdoO4Xz3CcZxEsCsY2+8+eArT9gWUo7cK83lvL6B80A2
	eomksbB/MAaedBSakgGW+PpQGU75d08XMxgsQPv8iZnxYLQMKnK73syV/CLDz1Hw5bfrdp5c9E3xb
	6ZRAlwEQ==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruBkI-00000007dDa-1RIy
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Apr 2024 13:42:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-343b7c015a8so3493460f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Apr 2024 06:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1712670156; x=1713274956; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VFrY1D6xCh71cm7XNWVZx8QqBmaav+xzWA830Kc6M7k=;
        b=Q2kjCApstUBtcvBORjE1vquZoNmI73w8UKljlCtz/OHTiNLOS5XCOyIOFq8nEENcBV
         T7IbpGqwrl9XhypKTqx64wHVPE7bVb18DjLhXWsXFt3vIZ+dqTB53pLkJ3JlzosiYCc6
         yj8UVrBS01kFiCMpoMwonJeX3Nls+DzzEWaeETcSJ3O3xgHWpmKUPiEaQU97Iqaxa2mG
         lCy6l9thGLjcygD/nwmjL/ZVHhav4QLhaCavBiXVQ99f2jueYk4wuidt0AyTfyJrdydO
         ZlgdoU4J9ql1mnlMKEW/za73Afoll9IEFFrXhngZLgWw4M/iXGoWojfLPdM87Z0i2meY
         UzYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712670156; x=1713274956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFrY1D6xCh71cm7XNWVZx8QqBmaav+xzWA830Kc6M7k=;
        b=e0niMDmpJOlJ0UIG0cmwvyZNET5vvL4ZrxWxNbOaMrGSYACx+21UmiYTbI1Zyw9Mf8
         Vgsg8I82oMu5IMsebk3fVUxOaR+FQ7UaG1KGkagM8HvHt78IFwQQJg1XzHNZmq5mzoss
         5qUrPbx727isd8Sr/xhOBhbMt4XU+J1kPIaMPhyj97rSdQF1c+32kMSEAbKrOImNygCd
         E5lbWvPGv4lkKTvQaI1Vj/e7c92eAAMyjYRyIQbP+1BgABHoHLjM3qjXOMg3ktOdV5ti
         6Id1Wl4wPXlERuyS4wBBoso3q62yrYpuQAVdfCMdsKsymF0uOgrksfUKlpQfTOHmNcrb
         IdVw==
X-Forwarded-Encrypted: i=1; AJvYcCWBHWV2TIKTYnKuTe1Eh30xvBiafuMbt7iXRiKCosnsLO+VKtRk4Sw2jZT7t+tobywDL/UmFuiTnSeh1H4cX/3/Xkv6xEFc/cCw4vEqLuvTLTFe
X-Gm-Message-State: AOJu0Yw4RNa0b7ouLD1xBYQEE/+2vCgC3tqmHNltkRFmucnqSJBNPt2N
	EUGzMj33xL+LerKa7wSBwz5vwYUMTEHKlhddtAVMaGepWZQRPYRuoLTUm8A2Uw0=
X-Google-Smtp-Source: AGHT+IHj2KGRa8/FHqb3X3d1flud0m14cnSJPVGjumh3UATf9uWX2V64Sp05U15umnBOnk/RK7GA+g==
X-Received: by 2002:a5d:428f:0:b0:343:c35d:1403 with SMTP id k15-20020a5d428f000000b00343c35d1403mr8127793wrq.15.1712670156127;
        Tue, 09 Apr 2024 06:42:36 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id j11-20020adff54b000000b003433bf6651dsm10753579wrp.75.2024.04.09.06.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 06:42:35 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 09 Apr 2024 15:42:13 +0200
Subject: [PATCH v3 15/18] arm64: defconfig: enable mt8365 sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v3-15-16bb2c974c55@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=xiXcG5GEfrvSIF0BlBGjwdfWPuvXXb+gIEE1G1bDPqE=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmFUWs3Zqql51wyaQYaVEla9pO166FW8c4GSi1EXZw
 HVQdi/2JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZhVFrAAKCRArRkmdfjHURaRqD/
 9BMo7u8uBfMhLvLsRFqPFrsi1oGghMUEtZsUmvmC1j/VPhAxVlNDWN0SFRvXGuDe0HKWwS3Nuy2rzI
 VTdiTFiqV+ns4FhEejQwAXDcP8bHeD+IRiy0LoLTITiKplgFD1lpSEuOGp8KNAAz6kPYoxYJsQ812h
 An/T2WPsET3il5n3b3/sZydmc7aXyPAfM0UtIkCPD8ENumQ7sMdmj4HN7ntPLPPUO20Pb3oDXhLWr5
 qgUaYp0VRGjHiEVlFgDDehdElEa99iTY9Q6Euh1VP8+SuL10g8rTJUThQfRDpgMLXjcBWnwnJQg5Fq
 40xK3XxzQ/25AXW5uVPbGALHK1alsyOyHo1k/Oy336TUmF7sl1K9HV23kIGKFFiDB6GvBRCSopFf9C
 oOwsX55g3gNVK8PoShntQwhVNqvuE8TCHWJfbrGdEm9mPg3sUII/kom/OiPii3ZRSMhd60D+U6IJxL
 +HNv4F9oMTQWUMmSqVB+RQ/Z92SkVUrN36O5wvyeuR0EZAD/srdjqggcQwXtX2fHodMBlBvvRWvAa5
 ODlyeQ+TPUtrPxnrog16ZpRngInwRIHa+LW3p6KT9capUp8LKc6rcW60TCYxWo3KIr+d4KnHcNdN/V
 E/KqthEezr+ZpkzPOzSQ0n+QORuRsSBCLMDBjYygTWHtbfWsvDKcOKmb/HGA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_144242_620243_94C8E0A0 
X-CRM114-Status: GOOD (  10.53  )
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


