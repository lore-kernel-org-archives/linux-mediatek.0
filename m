Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85026C4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 17:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xcpfNzgF4Pxbm0LNn8/0bg6Ray8UkamWuHdRS27GJF4=; b=Cy4D+lye7ucfbjlOIpjp97HPc0
	4ikFG7a2KixtPXPxh8h/Ar6m1+duGrPMri1HfUHz7m96m4hPxBvHXxJo66KQUqQFAmaU9Og0oLvg6
	0PR2KGZZOC4eB+8Cxv9ESoEsxzd8CWIOUrp2k8P3UNQVEzdOVyi8Q1UhQf0cICghmwXw98yKvYmmO
	KiEyVw49Z5IKxKRK07ugG87IevCvAjx51iZdBAHQX1clHdZXCu6x/hSmXNNU9JghD7sEEgXM9y6r+
	vS0JlD4YLPDymg99He+R+BeyfegcKmT4uBqKNDBJZK2cDwLCPoz5sfAdNOh88tnptn1xBGMdvntpO
	23TsLH4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0PKH-0000000DS8k-3YKb;
	Fri, 26 Apr 2024 17:25:33 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0PHs-0000000DQmV-2dsH
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Apr 2024 17:23:07 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so2958249a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Apr 2024 10:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1714152182; x=1714756982; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xcpfNzgF4Pxbm0LNn8/0bg6Ray8UkamWuHdRS27GJF4=;
        b=1xLv9iEWvK9GpvR4vwNgjJnOHKqHCHHGs3GacBwQRmV4m+IMRuq3jybLELmqehQq/D
         14mgcV9WzMmzISDvk6X3srptgTxMwrEJC1MRdGk31NGh/oBLagw4hPSbzBkg4syBssi+
         WbQs7hkyeb1ijXk9eTYz1/bJ9Af+tJGqrWu0nu/LEF2fP8zd2tm9aqHnWtYoyO9XWhr9
         CBsBZgLhwHUNNHeUyQE5ZW5Za3SX//U5f9ueclvk06HLDazDBF0tHHzb3k8xikzBZ1PF
         zoPEmNWg5L4HJ2JIRWPPPHeA49R0jHI449hOvsSiQljA1wB79nFyTGayrZ5UjTpOEG8h
         emWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714152182; x=1714756982;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xcpfNzgF4Pxbm0LNn8/0bg6Ray8UkamWuHdRS27GJF4=;
        b=JOm2/xeKbcrn/XS8Cb3HO9NefxaK5bYOvDiJfc9Mx9EfvD9V6eytMt7df8ZdxUL5RA
         iASz0OiuYacWNshMivCcqclrN6jZ6EZpPPuGMIIk8XMeWF0/BiND9rbLIzplegNJXBB+
         egwpkXxp0omRwoSC5yFgqCru1zg+TEBo0OOnxsNsqmY4SS3SRhMc3R7gegU/wrfahZNI
         XRYV3R1MCTNaJAIs1Imr0vENChiHe8kMZ5Nqbzd9cVA89TJp+gWh3lUwuhniYjogFZgZ
         k2azy7rzbq6kIavvTEvzezlq0H54CUSVbBwPnSrmWPDO8iS77fdmU/is8ZZ7kkl2jYTI
         GtfA==
X-Forwarded-Encrypted: i=1; AJvYcCXd98SMvRqjPOaLRIh4RPUQ9qQeO8zmj4Drlb5e4FSI79en8P+f9ybFyrfdK6N96H7P6HjLxYyyvy6HpRXcksbVKqlmAGLMFivAC46LGh6l7Sb7
X-Gm-Message-State: AOJu0YyLOdneHlVskP5FG/ZnXc5oa+RbyYTqZ7SwRkSRh/KhsRBH/24f
	U860gfsnakb8B6jtrGvH0IB1/NQGO5IGu+KsKssVZJL7MDwqRO0ysL2GXJgFsRI=
X-Google-Smtp-Source: AGHT+IGmV772pWcBFFswx8n1IxjhIJ0x0YA21t+MT9LToWGyNEPcTNukKiSKMrBp3S1NfSOajrN0ng==
X-Received: by 2002:a17:906:a891:b0:a52:6159:5064 with SMTP id ha17-20020a170906a89100b00a5261595064mr3051872ejb.52.1714152181727;
        Fri, 26 Apr 2024 10:23:01 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id ot15-20020a170906cccf00b00a5239720044sm10763363ejb.8.2024.04.26.10.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 10:23:01 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 26 Apr 2024 19:22:43 +0200
Subject: [PATCH v4 14/16] arm64: defconfig: enable mt8365 sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v4-14-082b22186d4c@baylibre.com>
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
In-Reply-To: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=rklTeGdgjcr8HpkwnLXFeP3xtFTG5m2BfNOFT4tOLv8=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmK+LaCp9ZVTItyYTqXVHXkRe07IHi+GgD/LNAxSnV
 VoN96EmJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZivi2gAKCRArRkmdfjHURXNkD/
 9u5HUKfktWXA52P/DVWjf9SNrUwcHyS+3vetaBi7qI27CfzXCbQDJnpz3/PL3n0C79B6A+sX1jkGKM
 60cKtdXeibqQo+DbAVJnZhxN7ijZz+xCslh96h8NwTXPDIJzXg/GrP0LOT8j6YzTyDD2akcTG8Nq5k
 ynO+FcnNN3kk1Trt+Fqq/nlY6IS9FqMiYj68Ch3zQzv5galw8rzUGmwK1ytAk1mf+GffJeauLZjIWz
 PnS7NB2gzhbf/4NlURVM6EKl0qLWeQfHhQY07nstES4z1CfygEoGrTpb0+9Z0D0d3gqk9FPNyKF3rt
 IXF6DiuXwJY/P7yVqHSU0po05JBpT+ghWfZcdRe7a/NqzqAWPsgY1Y+Ug6UGVpef5v23LEttxXBzfe
 WlFRJz6TQT5O93zSsmp/p/Ccds+tq9smGidiQ6DFPjo1v9YtGcm8MmdmyXQjozN1UiElk5LYl/kSiy
 IOe88WsQ0dTYG/BVomOdUsrpMZrOsZ2DYhYHdDsE2bziUj/cngmXdlb9vJ9nPZclz5mecfo5AlsdBQ
 ZeAMfQKMVO1NY1Ad5qR78yXmyzKTtkr0Qnw9m0flAeyf79Zcv1OP7/SngMLkOvUQcORd5Jaa4hDDVo
 wl1VU0X6TjlmCfEzejZsMNIHMrgmGvnc5dkIqrenbp/4WcHgE5xdWjOQCDWQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_102304_789845_04B6FDB6 
X-CRM114-Status: GOOD (  10.19  )
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
index 998b71d5789e..faf39d837674 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -948,6 +948,8 @@ CONFIG_SND_SOC_MT8192=m
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


