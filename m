Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D61AC25B79
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 May 2024 08:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=; b=FMUtz5LkhqCsvSjdtiaxS7TFx/
	6G/j8oVB8WMbQbGmW2EnAdACP9oVqObEfBCROtT/8XAL/OmAAW03GPLILQBt5vq8kPC+WNrlYOVis
	ifIqj30yDdVpo4NIoZ6MrqP1m9TFHFkhQIJDbmjzVwL6Sxq4G+jiLAnbEKmXzBAvmZP8YRcI7DrXO
	K5qEjB8uuUUiuIHwHpU/5pLoUG0xYO7g0NqllFdWZGbG/jVnJCI4VpG/D0qPvD8amqpCWbxXYfaRB
	BeknAao9f0BYuheTFy4w7mCcNVBxKJu8gNQPf3Iq31RPgthHBOFSC9p3sXiN2YVL444ehPD9Lrtfv
	xLll7SBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA454-00000005YdY-0c2n;
	Thu, 23 May 2024 08:45:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA42l-00000005XK3-4521
	for linux-mediatek@bombadil.infradead.org;
	Thu, 23 May 2024 08:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=; b=M8ofEDfFB6QYmPyAa2L4bbhCal
	2mV+mfM+IZ59y2ltjLkqRzxIef85m5h6FwUYAwC9cnTbdNcRc8onvhWz3YsNgnfEWXceglttRTiUY
	3nSSCSimAVjDxziIfZcbz2dmV6WlWbmRSOCqX5C/bj/feAl0RPmnrLyenzB2PIAMYaSnPXIwvSgc/
	8I016sC8zhrxGCmkWB0874vbaOSBYoRQ8GuTbNGbUV7GVqD0JWj93ye5wYxswJ7S7Qqdb04SmuzJz
	/16BtFXUsgAr5iY+giqDFXCiIQVNI1zLdcUnAt7OOfYNo8lt+u7GL/2hYZezwBeLtgy+vLefYRb2F
	eIkbZLhQ==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA42a-00000009D8t-1gmn
	for linux-mediatek@lists.infradead.org;
	Thu, 23 May 2024 08:43:19 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41fd5dc04f0so11031815e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 May 2024 01:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716453783; x=1717058583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
        b=pE5lAMd3jSIorGgKsly3hi0Sju3uAiukWNzqj/90QWJqDvqdA2d54lZJG+sMIATPF0
         s7DDCAEHI8ckWi6L/0P25bQCcLVj65iv/jzmDlmnlDbsZXjUAhs0ZuigHxu4QKsIQ6gs
         R3HHpQS7/s5qJ4DwVEXFNW2MFbRZnzCeLUH4wiXPEB2/Z3wcp0hhLkXbEKUtu68xJQ1O
         Z+pingzsWU5LtVFGWtBYP0SgboxbSJKmMunnRCI1At1jEJ0Q06BRZeKTCj1AttJ9x9iU
         X29ucU5HX6grQnCLjQy9c2uU0r804MX8CKgmhn4gda/pe4tLxYNA1P/Zht4PZVv3vSb6
         afsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716453783; x=1717058583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOYHy0wGdKj7gYao1Bs3zuE6VV+046rxXLiuWBbG9as=;
        b=LEvGwg5H3TgrbE0XP9XHMu+3CTsXEkL+AwN64Ej8LQ9IC08uTM3Wq47h5EKt4qT6gm
         h85iCt+Ov5Tk9xn0LKnS0kOHGPvfVHhdOCxssyXwFVjB3fFJN+mnsQC+pD/Z7Z6vIoyP
         pTRMzCtreHMCY0RwTbIpUnfHdMyd5xhN/AywP8yo7QJpy86UvuZ5bfKa1MkhyLEUlLbn
         wb+YaoY/rDPTPuEPS08Kx1fhUp7EG5bTUsiRb36HSM8WaRCGo8ECnwknHcafoF2ZWGUF
         wSoiibTEq9ABglWJDDO8OyLYjBMV1WBD/F781oiQtpCZ+Geao4STyXCHI+tJZLH3RXUT
         xRIA==
X-Forwarded-Encrypted: i=1; AJvYcCW3r4JT2i/9gH9Wwe/MMiGPULHHw/Q1E8G//xW4rqyevvvyScM8gK1JiTS8hhzKYXUnoPSdiIurYhK/RKbzX2PDQnQvOxuPZ3rT+7yba8zPuicE
X-Gm-Message-State: AOJu0Yw3+j3QgrEpgI1GBIXtg+k14hwdfG+V0YhygV5OZB3OUNQpR5rB
	yKml0+Rxhk+DADIjJgbQXch1ibaXo0AUyjtrzfHUszHSGMjDGdUWfXYMVAccKIE=
X-Google-Smtp-Source: AGHT+IE5dWWG0c+IBofIOp8cWtoF1B7/E7D/A21kRQoggWPdd9XsJ9tvAA/f0S1hFeauicqTR49bNQ==
X-Received: by 2002:a05:600c:584c:b0:419:f241:633b with SMTP id 5b1f17b1804b1-420fd2d9c58mr41521705e9.8.1716453783652;
        Thu, 23 May 2024 01:43:03 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42100f3e03asm18556645e9.17.2024.05.23.01.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 01:43:03 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 10:42:43 +0200
Subject: [PATCH v5 14/16] arm64: defconfig: enable mt8365 sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v5-14-e7e2569df481@baylibre.com>
References: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
In-Reply-To: <20240226-audio-i350-v5-0-e7e2569df481@baylibre.com>
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
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTwGAeMm2VFcZN9GkMdr0FJVSFotJGXjeMK3NF9UB
 xvqSGZeJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk8BgAAKCRArRkmdfjHURe4IEA
 CkXwc+T+JuKpcUw+OsWLG9DvOuFqqn/iOv1GslfVfBGE6DL4pz/yxJgiZXsX+cikVBDluG3JA+JmBb
 wpcA31/8vLfnF1WWPrYxDVCdpYTZ/c42oSzdIfplNHVfMo2G0X9d2/twDo8s+ysw0bc+Cyv3oV46nP
 o1RSldWqsfuTeiGc2LLcB/tPXMbELn+CUPZwftVZ3aIali3oPFBxsJb2FIOVvjHgrdy7z44Id2f3jU
 nXXZaRQdF92D9xc6I0hPa/v0Taw4WOCtXa6A/+6oOZoj9szE05YQa9lBGzE4n7rkYMxgEutEiWiSty
 HWFiHboRiHtG0UCIPVxhjeLvybUbm/ekx5vYQkfx3UhlZmA8wIM5nchGLWQCzKeKFCjMVviNfyBMlw
 peAtkMaty1KguTMN8JotgxErvRmAC6ilS0NAzc39MNWnGt3ZbbNBXjAzdKAeu3u5VcmffTT44bNuKc
 ZUOdpJr1OntOq63IDoeMxYQwgn2lvCZiYq2PC4RIMQ2qS8Xp+wfcjyilDpPq+SdLuRZ35MvxmQKQdn
 0+9QLEIR2/qMhoOyAmu91+kdY77bY5mOK95Bd/oepQr4fT0QfzijsRIbS6auBKOd3IgGerun/vMZ/B
 H/8vhcqTw8OD912Wj5hbU6fMbjD047QOdf8pBEMVvGXnC5irCDI9m84q6ugw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_094316_416303_1F5C2F21 
X-CRM114-Status: GOOD (  10.13  )
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


