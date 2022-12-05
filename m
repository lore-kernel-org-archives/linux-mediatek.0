Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DCEC47089
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 13:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hU8awQZE7orgladXdlo0GTxR4zpxwbwcESgIpxJ13kM=; b=P2R/tbhFmtPsmYh1egULNdwqtg
	0gHw8R6TIEyvufdRm0AmIE+IWWGtKULeBth5ddpKAr4wj/e7iRs27YLYD0KHj1I825HKOFOwlCCbg
	12Oi5U+aBbHk1J58DTzrFHHBU7eiSJtbMZTnr+/dtiyzq5cd1/eBpioP6Eoo2abYiqTUJ94sW/xIf
	JNJy1FvRTMthbz7CNbfvHcphNcbnlfeNIl9vlmgBmyp91OBmKxfHzQkRHX/dgx6xXE4Vw8/UsynGJ
	RRgW+yGC2+24P2bNy+Une5IdyoVLG6wTYgw0ZSjNgHogYrKiuO7KIGXnzbcWDT3weVKvnmBB1nQb/
	jFmGzIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2BtH-003gjC-N0; Mon, 05 Dec 2022 13:52:15 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2BtD-003gfQ-Tn
	for linux-mediatek@lists.infradead.org; Mon, 05 Dec 2022 13:52:14 +0000
Received: by mail-wr1-x443.google.com with SMTP id h7so12663732wrs.6
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Dec 2022 05:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hU8awQZE7orgladXdlo0GTxR4zpxwbwcESgIpxJ13kM=;
        b=W3u+C+W4iy5BKYadzGKEwrhnX+WHxjNavB8D/PC0lF1Fg8Pe/ekhb2jrUSCOQBbdxx
         8N2KRN/GPH3DObr5sim0ov12JwqPrWTJ1o3lzijoudRm1w8LQ45gAXxVBQHn5mnT9oTf
         OAE1WebEs4Pv5KCp7lu0pAgvuoaQ6FUeIN/KOIIuR+80p/Exr625rhjENGDee28wLqy1
         Hm3kWYHWdA7ZYksYwPb0aDiA7Q6eQ9wwdFw0jH4N2LruSG//NsoWgDUVA0wMSSstGuhk
         UVywvmbJ6IMMhvdWY7hKXisfrNCOLpkC3SVBPV6u/z26MHkxZHbGqwfmSFB18vTnhgFw
         PCNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hU8awQZE7orgladXdlo0GTxR4zpxwbwcESgIpxJ13kM=;
        b=oTzF4smz8OLygerGrDJ0SGt2PbNU6d8DN7UUFcdvRKbjYivJObdrD3X9EYkzjtVPT2
         447qOnLcW5JJy5ts+9DMPN/1DXh1RlhhavNSf4Fv0AxHWaPCCx0s90qBTWDuZSpIVdVz
         hZgVI6M3itmjGEv0COUrDyoB+8cWnHiqMOsPGU2p3/riUPWrP4JnFKhiTcoVnAPKcFta
         H7iwMFODOdAAcxoROKJ0POmlQTHnPk8WXCS4ASxa8bATRRxKTuEzrqVYU+t9Lzzcr2Zv
         8kxNq0DQXFfb4E3Etxmk147MqcbLY5hONMqWAoNKJ4tBaCRWcqcbGJSrpYdUDz5Lz3oM
         uGLg==
X-Gm-Message-State: ANoB5pmeQYG2iOduVYYqPbZ2Bq8+awqb7/6YYHQ5ZuQyByHGSBfr7BYJ
	R4ptQ4vxBa7IeavJgi5aEOOOUg==
X-Google-Smtp-Source: AA0mqf4zO/xd3fS5xAzDq3lcKBOsM7eSke1rV0b1O0YU+j5ch0a7K+qqm+Ozk8+g6W3Ara2pPKMung==
X-Received: by 2002:adf:ea8f:0:b0:242:5afd:bc5d with SMTP id s15-20020adfea8f000000b002425afdbc5dmr4459827wrm.305.1670248328876;
        Mon, 05 Dec 2022 05:52:08 -0800 (PST)
Received: from predatorhelios.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id a3-20020adffac3000000b0024245e543absm9012700wrs.88.2022.12.05.05.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 05:52:08 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	krzysztof.kozlowski@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com,
	linux-gpio@vger.kernel.org
Subject: [PATCH v4 0/3] Remove the pins-are-numbered DT property
Date: Mon,  5 Dec 2022 14:51:55 +0100
Message-Id: <20221205135158.1842465-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_055211_988791_D460E9E0 
X-CRM114-Status: GOOD (  12.04  )
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

During the review of my MT8365 support patchset
(https://lore.kernel.org/linux-mediatek/20221117210356.3178578-1-bero@baylibre.com/),
the issue of the "pins-are-numbered" DeviceTree property has come up.

This property is unique to Mediatek MT65xx and STM32 pinctrls, and
doesn't seem to serve any purpose (both the Mediatek and STM32 drivers
simply refuse to deal with a device unless pins-are-numbered is set to
true).

There is no other use of this property in the kernel or in other projects
using DeviceTrees (checked u-boot and FreeBSD -- in both of those, the
flag is present in Mediatek and STM devicetrees, but not used anywhere).

There is also no known use in userspace (in fact, a userland application
relying on the property would be broken because it would get true on
any Mediatek or STM chipset and false on all others, even though other
chipsets use numbered pins).

This patchset removes all uses of pins-are-numbered and marks the
property as deprecated.

v4:
  - The generic pinctrl related patches are now in the pinctrl tree
    for v6.2 - remove them and repost the remaining bits of the patch
    set. No other changes.

v3:
  - No functional changes; add recent Reviewed-Bys and Acked-Bys,
    add linux-gpio to Cc

v2:
  - Deprecate the property instead of removing it completely from
    schemas
  - squash some related commits

Bernhard Rosenkränzer (3):
  arm64: dts: mediatek: Remove pins-are-numbered property
  ARM: dts: mediatek: Remove pins-are-numbered property
  ARM: dts: stm32: Remove the pins-are-numbered property

 arch/arm/boot/dts/mt2701.dtsi                | 1 -
 arch/arm/boot/dts/mt7623.dtsi                | 1 -
 arch/arm/boot/dts/mt8135.dtsi                | 1 -
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi       | 1 -
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi       | 1 -
 arch/arm/boot/dts/stm32h743.dtsi             | 1 -
 arch/arm/boot/dts/stm32mp131.dtsi            | 1 -
 arch/arm/boot/dts/stm32mp151.dtsi            | 2 --
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi    | 1 -
 arch/arm64/boot/dts/mediatek/mt8167.dtsi     | 1 -
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 1 -
 arch/arm64/boot/dts/mediatek/mt8173.dtsi     | 1 -
 arch/arm64/boot/dts/mediatek/mt8516.dtsi     | 1 -
 13 files changed, 14 deletions(-)

-- 
2.38.1


