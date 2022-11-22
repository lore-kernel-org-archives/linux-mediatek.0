Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE00FC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 01:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NXlietmMDnMDDCbd3vt3QmKB/26LHM3Ufg/KK8xRGJ8=; b=17EQup2QbyQRP1AMxNJgrbk/kU
	u4GhaCgpVx12XGTXnGAYc/m7xq8B7qGSmMNYU9eMWJcl9wKnedcjMkmNS1w5mqZje4J5L1Vas4l0m
	33nk72j6Y4nAHITImI3n+Sd2Ub0G5QLg2SHDBNO4lgsqU9cBBBHnJ0qZXm0Q8VYXZYTWd+OwgE1Xv
	qrgLVEvZycRVBaBXBidDPomFLl8fU+Ww9Tl+HuanK07iJ0tKSuusCaF9iJrkKvmRfcsr9ihc6Sx4P
	7A0zYDXO2LCQou+8i9lCxHibomgA6I7C+tYMWW8Kku9hDJy+jmJApX+jMTkq3TYaM/3KrMjxQ9l9V
	IW70kU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHmn-001ngi-5r; Tue, 22 Nov 2022 01:09:17 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxHlx-001nJj-Fa
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 01:08:31 +0000
Received: by mail-ed1-x52c.google.com with SMTP id f7so18614231edc.6
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 17:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NXlietmMDnMDDCbd3vt3QmKB/26LHM3Ufg/KK8xRGJ8=;
        b=m0TewJWW7KhTdSXchwcIkyxlc1EkvKyFWq5uJQv+yKMBp+IF5UtjELWqTQSb6qyCew
         kJHBq5X2f6gtjHpqsgh3S4R+eSNqeSybw4Z++QF6NViBx9aQNs9n6HbaVslpThBjx+8Y
         z85ErMR41r9qSXqg2hznA9QNL6CaZ4N3UymM3Ml9fqxpmgFNJHzKuK3g51mbb04B14oL
         6Cc1EOYi14h1Qu7wmDAPRkY4+Ot8gdVQMu+ubmNtFivjU97hBzmtHhCtlwuUdI9UF9ee
         kueWGK/JDg0GEw9aVPF4x3B+j2tCzomWngtlys7Z8cxOYlblZulqOdR0txPc88AqW6W2
         nhPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NXlietmMDnMDDCbd3vt3QmKB/26LHM3Ufg/KK8xRGJ8=;
        b=ybqbndITMzuUdaHrBKzm+IiTD1kw8/64LqzIvvYMp+4DUw/x9cbqZ2FogFQfdABg7M
         Osa40M3o55xKaJ4b6HXyef9ArCIcxVsEayxq4sLdsJheSRoMNn28kEc1JiZc6RGBrN7e
         7izvYQKiEB36O2afL0mK8D+vHH9qa2E0WH9zTFnph9eeaVLy4/Ynirch9+H66M+bidPt
         xXCQ+Q5uk8y94rkbAVU4Zqt0hkavMkQtAVXmABmVYvTP+zvBCYDOqBr/Vrh/Yc4LSeKy
         RWPXcCMNqvUYFwuMPfkA8M7l0CvIqtQ/Jz65iT5BbaXSi1T7GDyBo7vTSzBX4n5nzO3R
         ucAw==
X-Gm-Message-State: ANoB5pnDuYAYiW00ZKtFVfj9QA5WIznPQp7l3+lX8EXiXT0m+j9+FkQ3
	ycz7BM3wH3rBZHS9ENd9xNogSQ==
X-Google-Smtp-Source: AA0mqf6YHtIfMeR6UPTvsarDA6CMoaDvypsfuFvEc487eJW3bla0HrQAC73iEkA2LGGrx+B9tWkmow==
X-Received: by 2002:aa7:cc14:0:b0:468:58d4:a10e with SMTP id q20-20020aa7cc14000000b0046858d4a10emr19202803edt.222.1669079287797;
        Mon, 21 Nov 2022 17:08:07 -0800 (PST)
Received: from c64.fritz.box ([2a01:2a8:8108:8301:7643:bec8:f62b:b074])
        by smtp.gmail.com with ESMTPSA id f13-20020a1709064dcd00b007030c97ae62sm5514683ejw.191.2022.11.21.17.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 17:08:07 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	krzysztof.kozlowski@linaro.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	khilman@baylibre.com
Subject: [PATCH v2 0/7] Remove the pins-are-numbered DT property
Date: Tue, 22 Nov 2022 02:07:46 +0100
Message-Id: <20221122010753.3126828-1-bero@baylibre.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_170825_674308_B9BFADEB 
X-CRM114-Status: GOOD (  10.23  )
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

v2:
  - Deprecate the property instead of removing it completely from
    schemas
  - squash some related commits

 Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml | 5 ++---
 Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml        | 7 +++----
 arch/arm/boot/dts/mt2701.dtsi                                          | 1 -
 arch/arm/boot/dts/mt7623.dtsi                                          | 1 -
 arch/arm/boot/dts/mt8135.dtsi                                          | 1 -
 arch/arm/boot/dts/stm32f4-pinctrl.dtsi                                 | 1 -
 arch/arm/boot/dts/stm32f7-pinctrl.dtsi                                 | 1 -
 arch/arm/boot/dts/stm32h743.dtsi                                       | 1 -
 arch/arm/boot/dts/stm32mp131.dtsi                                      | 1 -
 arch/arm/boot/dts/stm32mp151.dtsi                                      | 2 --
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi                              | 1 -
 arch/arm64/boot/dts/mediatek/mt8167.dtsi                               | 1 -
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi                           | 1 -
 arch/arm64/boot/dts/mediatek/mt8173.dtsi                               | 1 -
 arch/arm64/boot/dts/mediatek/mt8516.dtsi                               | 1 -
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c                          | 6 ------
 drivers/pinctrl/stm32/pinctrl-stm32.c                                  | 5 -----
 17 files changed, 5 insertions(+), 32 deletions(-)




