Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0594C3DA59
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 06:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+u7W92havYZUIlpwYblhqqwSvlNhEzQdYNsq1VBwl0=; b=tu7BwEyhI7kDhqC4iqVtNneQtX
	DmJUowDyb94s/Vhv0oa6PtyfExT4t5yq9Rme6mwZOxksdixRTc2u6IJKr9cm/GZkOKZsU0Wg6AbBc
	be3wJ5LCt6zlPx3QWJiT388hOve3MSOCS8Xlqac8SGdK3kz3aaeZtO6967ui4eiazTORvi2jlqtRy
	EwMFD4qSySijzKi+brKz18Z80V5vuuyV8kBLu9allXnIWColdjSlYZVSR3ilWCBUE4008G3k+91Fk
	ruwQm96uV/JAWIINpYSLCbVdSzw5qUWSXiRr1tuDxkveCHzf1DNsOPUpSb9i1tB6c/IyX6PEHG9JI
	vqZbC8vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVn0a-00000008cN2-20IF;
	Mon, 22 Jul 2024 06:58:56 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVmvy-00000008aP3-222z
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jul 2024 06:54:15 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-58ef19aa69dso2647093a12.3
        for <linux-mediatek@lists.infradead.org>; Sun, 21 Jul 2024 23:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1721631249; x=1722236049; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+u7W92havYZUIlpwYblhqqwSvlNhEzQdYNsq1VBwl0=;
        b=L5mn4m2bo9JqcIoPdFGPuA7S/Xz5i8wOgdlo10zdoeXM+jpt4qRL59WmiHOOxTKLWW
         ep8QLKYLVnlUbz+m98Ye8J+NmdC2bmITDBadSiVcSPCo2FLJd+EadyXPe1f0vxpspPIl
         vVaViV+MLjMlHKq6ODfiBTmE/cd9/GRiJMeq79hFaL2NPCBKgsu2305GsLHkqrFpMYtt
         rr2Y44ZejFmsndaRvJmwxxsWpUXtGf5oFeiqH4KedZp9uMrMw2m2uhw4e/NGBB+A41xo
         ssoYSu6OvYKF+rynPkvESder08ZE81qYRDmTlTq/Ng9sVqdLbtIHWuLZcXJ4AXokdnji
         xbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721631249; x=1722236049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f+u7W92havYZUIlpwYblhqqwSvlNhEzQdYNsq1VBwl0=;
        b=Um8gW9sdoS4M1H5zcQIYoCSbxJPLHQP1EFdm9JtlXVJ504gi0CiX6LURYBlzymVWvY
         KQHtRa9R73mOOLbTEgJJO+d+9emifkHICMCJGxKCQBbUh6ZYlhiEVcHZ+EzAhKtHFfzv
         QgG2i+oVJlDgEWGH2WtsS1bNpIbcLZgqQ6wrBF75c7TfPW3OhM/Dm2om5tmoQGKsqdZF
         EBrUAf2Sqpo/6SvhcA0jjn1gGYrrArY3WInBNm6shi83mOGmtAQUvgOs78eeXuh/py8b
         t/sOd6bMkusmdK5pqQg7XGo5JVhwZCL82gctYlJsN43s55gTlE8cmoGI7Ha6TCiafPu4
         2ahg==
X-Forwarded-Encrypted: i=1; AJvYcCX6Qm/pRvwFTg7+qv1GZLIxDdT3Kypfe00CfJJSeaebfZPoqIv1HP/ZCFheUfoUqtthQSrlivcYMJtzoSk3im9AECT3ImSHFCQIJC5+tuTzLlLw
X-Gm-Message-State: AOJu0Ywvp1oYB3OEPaSLyPUsDjOR7p7krydIrnNas7dYA9wCjcSsN92t
	VlqS0liFjuHujj5sgQWKHng+LofJZXU5AluGe6LUA/g+c8o91O4R3MsRQcTxyzY=
X-Google-Smtp-Source: AGHT+IFujFs1sGJ63tkG3t7eMu1L5vDcioENHIjwLFIzn8k7Yeds1uPgGTvzxdZX7AvLMdrnfahf2Q==
X-Received: by 2002:a05:6402:11cb:b0:5a1:225b:4233 with SMTP id 4fb4d7f45d1cf-5a47ab11d7cmr4605872a12.23.1721631249220;
        Sun, 21 Jul 2024 23:54:09 -0700 (PDT)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5a69c1f56a0sm1982126a12.64.2024.07.21.23.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 23:54:08 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 22 Jul 2024 08:53:43 +0200
Subject: [PATCH v7 14/16] arm64: defconfig: enable mt8365 sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v7-14-6518d953a141@baylibre.com>
References: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
In-Reply-To: <20240226-audio-i350-v7-0-6518d953a141@baylibre.com>
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
 h=from:subject:message-id; bh=Bna7lGeZ34+vVkeOzBYfhldONP25svJS8tOELxKnAgI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmngHxfVG6iGXjQ3z31grSqs43cXnJ8FDoaVpwi344
 ojLOAjiJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZp4B8QAKCRArRkmdfjHURb7yD/
 wLghhgERwAWzgSENdpf8qwjr9EiINrnkjpHshQg2NvDsSIy1UW/NMQy6Myi//74u8oHK5pJO+TaH4c
 Ed2SXiuRRDhe7S3zuA21M76Jr4Iv4f0UuDj80IzZJBTGlRYOLfNqTVHae/d1gh9im520TqF7TP0aXZ
 wukLxf3ne058bpAR6fEbjyur714glk8JJCjTruN7K8RctI2aPazvPLGS66ANsZ/dF2zR1dGCUiGRaQ
 XXLxBDpMtK9fZvAbk+QP2oH182xD1cZGK5KlwqbjNk3yf5YOBANZgXeJyrANpV1Dyym69dHJfaxzzy
 czFDKbl35fJqiehFpoPmTZN8O+S5A3a9WIJf8KAleXeralPjD0/EkyVg8HPr0U2PxlY/TYQX2ikeHw
 M1pXop4pqlmZTXGBcAiJW+CzmVmDASqyVkg/eBvs7503s/NxC0qWBbVgYu64nTmAeafjD4R8PKGV4R
 GohN9mo7c6ZUDz4uI6LkA6qr8IcaGawsEPiuPdnXzUWYPS0NRQYmZzogAoXz4af0U4fVf5u1ECsxPc
 r1ERZ8jJ7bkO+Wsrx0+sRsdf0RDr8IdCOqQ+Y1QJfiirrIwq4ue8xqTl+Usbw3+gN6erRmvhftYUng
 /DTVMBN6rV4SgL6SEwU7MLGsshxHkqWfqNooLzCys81e6/o112VdofNKAnew==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_235410_676243_C844D519 
X-CRM114-Status: GOOD (  10.27  )
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
index a6c9688fee0e..f16ac6a0fd46 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -949,6 +949,8 @@ CONFIG_SND_SOC_MT8192=m
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


