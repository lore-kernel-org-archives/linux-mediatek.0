Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DA4C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 14:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bDWI7WdWN/xqchY8MpbLI2Q/P6BoSTpm5HQ84jq3qfg=; b=YJYCfiyl/r7RibNHyqyJvWb1k6
	MfGVDTQBPOUE1vJiy+8xpPDNHIsvrge2eBofbqIAqmuQvl80ODaWBhD0r3gJwhurX0j9/XyGEj8tA
	oDr58qpvFCyo6iLQyGtmQF4y5TjMleY46zMb0CBtjfW8hS7UvVsLiLC3ZdeWHu/em662a5c9Q577Z
	hSpDoa+x7id5BoZPhmNRVZi1Ctz9kNsyhsp2/HF45qHdeDXWIvp1lbWtfeDRxmuX7Yn5Wxqx6S+Fw
	RTiKDvwBURMm490VnziIlVViXH1cEM/IXHlLQv4SV1STS3GYVLUnvcWkeqWJGFgDWoOmRn9JmPpPC
	7DSf7cnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebbb-00000000zyf-1VjA;
	Mon, 26 Feb 2024 14:05:19 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebZ3-00000000yoI-3ux0
	for linux-mediatek@bombadil.infradead.org;
	Mon, 26 Feb 2024 14:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=bDWI7WdWN/xqchY8MpbLI2Q/P6BoSTpm5HQ84jq3qfg=; b=chxwA7TXKF5GcsagtFRUnvflyC
	CBA0fuOoeD4B3wNvxKq+J0iOaPd0UiOFppjmPTYRuo7xeH68YlUWCcbJDcHO77OpARyHhkp/SBMT1
	xXArfKOYRmWw8dvhoL3b7YaX9WpyolbuKUUcyM7YxzpMxqxtFngyVqwemqrDIkwLVHef/XT3QKOAG
	IY2Fuy5mp53//qEUazxXn4FKG61dJinb6d3Ga45cYziA1wMOsiFPc0ACvHezEErFc0r1KaVb5rIfr
	qww3Nt4iTefWwTGGpkvyZ1+x6TeN+/TNCBk8tF0fXxdfcJb6Qpfxq+YJe3UK8ciwH54+gCQMkjnfg
	GocY1o0w==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rebYr-0000000HKJy-0hBf
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 14:02:40 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-412a588c8b4so5417285e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 06:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1708956148; x=1709560948; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bDWI7WdWN/xqchY8MpbLI2Q/P6BoSTpm5HQ84jq3qfg=;
        b=kA6d4aRwEwWyBisCwtxs753lCXbPtG3LLVuFT7wJIkcOLDV8J6lJw19Tu44D7HfX8y
         E0I0SN9Y42XIxVZDS07+oyaOhv6cRDoIkqJuvvN8Lwy/rAnw9hrq2UcqJF8pvMkn+zsU
         7eGaLrb39srL0walzgvnOg8mqoyhPl81OP7Ag6TuknkHWU1TnQ0cCSp0XwSNDZNoNKzj
         oxeNfS96WmWOeT6hVYS50Z2f/r08sBDuSF5mJSm4U/1qjvuXSPhcJBBSiKXewRNAxPAE
         Gmyky4CTAD+YiRcvDZBI2vDULpB4Oj4Gj7haDfHH52gioKNv6isK8c29YV2EMuuX6cpq
         CCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708956148; x=1709560948;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bDWI7WdWN/xqchY8MpbLI2Q/P6BoSTpm5HQ84jq3qfg=;
        b=fTzd1u3frYRYYC67IoV5M4YXFRtL84VcW2IjpXyszfzdiVlLrLd/1Nf/CPIvjY5rhC
         ITBAvPIHbUzqop171S51WY/oe6SWS3gTPtaErENLdo6d06pbV8iXe9patIuZ+O5uP4N0
         yewoyVvq85WrRq4anZGbLcssirVFtftc7exu9HrA3njUz5a5QWfw8bhzLtajMXSFczID
         lTPtEqv+ncs5td4lnV7+huvUKMlykBn4cGz0BtNaayC/AGPg8MMYT9bjN3mIYqzgrEsG
         /8pNfyx6KMZzpvZPQjEquGlyggH7DWmdf1ZCoq3dQzWUU3eY8D85oCkdDvJFiZV6wBtk
         ryzw==
X-Forwarded-Encrypted: i=1; AJvYcCX0kakbXmfKbXb5R/qM3n7+sy7gZdLsjLa1iJOy2LuypjjwtoKHUGTOiqfVZOCgDO/EFrcM7LDVzagP0x1Fll6U5uOBv+ZSghXG1GQzo6rxSTI/
X-Gm-Message-State: AOJu0YxN7QwWX9x02dV0S7M6dhxmVpdZUD0IGpJLRGDdtN3jh89Ti+I4
	o92AGjnMLFyZLEye2D2rr7Ee0V4TJFChaenE4r3d91rrF7/Y/oxWEYWzOefUnJg=
X-Google-Smtp-Source: AGHT+IHWP/qkYWdxWpHEOS8rjToyu4G798DZv6YBQMjIkLWJWPFpz5/qUpxUbGtrV03PZ5K0SplPJA==
X-Received: by 2002:a05:600c:5489:b0:412:a1c4:66d5 with SMTP id iv9-20020a05600c548900b00412a1c466d5mr2993620wmb.6.1708956147845;
        Mon, 26 Feb 2024 06:02:27 -0800 (PST)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id d33-20020a05600c4c2100b004129f87a2c6sm2838475wmp.1.2024.02.26.06.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 06:02:27 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 26 Feb 2024 15:01:53 +0100
Subject: [PATCH 15/18] arm64: defconfig: enable mt8365 sound
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-audio-i350-v1-15-4fa1cea1667f@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
In-Reply-To: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
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
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=777; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=35n2GsRcpTZr3lOxOrHagpbcqAgi2905jIabSC1TVuI=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBl3JndJ19aagvtDXuZQ0/9DdusYhsa8CdGoAfiK+Wc
 Gt6z2s6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZdyZ3QAKCRArRkmdfjHURTqHD/
 934l6M/jGn2yIyXJ+H7MJY3XE3WHJZZH2XV18t06deIoLU2VYNVI9icYiXE3kWlTsugcaBrHFVdLfw
 LXDiTpZeqxap6v7hy3e5BcB+1kBBm0b242bXkAN/yLqPLoa8J+eGpLA0DZ0GuiNZTC0B3qCQi7TPNp
 ZJP2h+BTawbIPutN1ZogugnUa7s7abKX25cXLAfRn+3rFhcDy9hTi4cgLA5b6Y2ozG1nuvVvRsFO27
 9c0fgNdWilfdZbn5EWoPRVFtscYocxq1w1lqCTprO7YNT+I+4c4+8GvaVuuDgaQP33qROKicyT3IsI
 AyAC9o4NYiaUjIX19hIvq0pEopkv22VPMXOShzFztdCon+CTTW56zvJw58DBl8ajyBG/ZEL4i9IwMX
 e2fHAQXvwuMpNj6HVRiWWh1wqstY/tcck7h5HSGoMVnhSBqAKQANmmwyavlPir/cfla8c3Yfr68Eg2
 MpiJbP3Pw/IACIwg/vJ1fH/IB9zbSek9i6bti0FE52dIluxg7MsCM5/ThLq7AA3ac5Lk5U9ay2q80f
 HtfYo59N2TqCcD/MAMTArwQP4w8uyTj+N9U9bSfZ3cmHRAFnYp2Aqt8380CM1TBNqYTo5k3/uu1OqP
 IRbvhiPyZA/odmosICzKALd0F0QjU81jby46zspKro4iZcoEuCxQ6rXSu7ug==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_140229_256284_798F0C6B 
X-CRM114-Status: UNSURE (   9.80  )
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

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e6cf3e5d63c3..83aaefb1c866 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -929,6 +929,8 @@ CONFIG_SND_SOC_MT8192=m
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


