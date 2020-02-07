Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576B7C352A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 09:02:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D09521741
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 09:02:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OuDvC1jZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V11ZRlSV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1D09521741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=baD10S/AAao22SiWDk9aMqLUyJ5mB1UKiQhdg6KjLYQ=; b=OuDvC1jZCwqATY
	jTM7lAXTJstWRL8NlpwNHaCj+jIWUZWBeH0gUzC6lPr3f9tdZ1GeVsn1029GFyn6d85GARjHGVP1o
	pgWWhSVJZct7fQrtK9qIeBSct2iHCTPBFsFqW1YiWRqYGRPtjbzS3VV4V4i9nhypJAlEUFFnV8R0U
	i3ERnmjiz5u5Qah3LFQK97dHwhq/PF8MJncvwPMrj4Nr79S14/EJoiNIuVYa+i+h59o8TdUB/6DO0
	NC36+NkcnKVGSgPoJyTxQc5lWwwYP4GWvkABfemyng95M5PzsyU9WWh6uOXunWFHrNGAhEwLhX0XR
	iQWXYqUobfb+DiEG7oBA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izzXF-0005eB-0c; Fri, 07 Feb 2020 09:02:49 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izzXC-0005dD-7H
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 09:02:47 +0000
Received: by mail-pf1-x430.google.com with SMTP id q8so938327pfh.7
 for <linux-mediatek@lists.infradead.org>; Fri, 07 Feb 2020 01:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=op1HXNhATyHRgyyhvfgTZxFzh1I8MPtGuBHJSPNyYOk=;
 b=V11ZRlSVoy8l/X+8crvCfDhWVEeNs7U6MYjmhE5PH3dH/QgD5ZXbfebDNDY+TVuxS2
 EF3b24coOyyCvvlqkO2mz17Pdt1JPDmLGRFZyjnK4KtDkGILDVe4ZEvAT+LAPlLhWDkf
 nB7KDKdqJTaxNX4qtPaYyp522JBRelU6OJr8U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=op1HXNhATyHRgyyhvfgTZxFzh1I8MPtGuBHJSPNyYOk=;
 b=JJBjJO8Yr600J1y3w8RobMPd28ndbpSpwYE3HTGwAUgH4xNivEVwYKTiHvBHfrYpZ0
 D/U3Fsb3+nfcluipKoWKgLfnvdnSdtipzq6spRq5bgYNXECA7CrLx6/0sFmZ7tOz9X9e
 9bKljwJHSLZTV40zJrz6PCkjxdLVmp/dMkG01mVvFBzL0Aq7Lbp4BPVsXeg0zru7PPli
 4QnAigp2NRymgHQPW265+0arRKLXD5v8n/161aaf9bGVTMwspplR1oiICdDyHbJS63yR
 4dQloN2Nxuh89pmJF7rrrpyz2UIabdbq1GczruGKNQP6szTrbmiF8zWRg0HGO0g+dGDD
 lnGw==
X-Gm-Message-State: APjAAAXsgtQvNIAoVhAA0ubsDX7PpoJP3uurSkjh+tlLpJik6SJ2bSCV
 k46LqfxwKoRQKSbM1PAO5NwKzA==
X-Google-Smtp-Source: APXvYqxN/ldFiwGp0nM9WRPRSNpu6gFYZl5ZXHD3UiPJnYNWxmaakrmXDFCuyvReK7SQz/hZZl3wKg==
X-Received: by 2002:a62:1a97:: with SMTP id a145mr9181514pfa.244.1581066165016; 
 Fri, 07 Feb 2020 01:02:45 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id w6sm2309463pfq.99.2020.02.07.01.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 01:02:44 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/5] Add mt8173 elm and hana board
Date: Fri,  7 Feb 2020 17:02:23 +0800
Message-Id: <20200207090227.250720-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_010246_284675_73D06C27 
X-CRM114-Status: GOOD (  10.56  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds devicetree and binding document for Acer Chromebook R13 (elm)
and Lenovo Chromebook (hana), which are using mt8173 as SoC.

Changes in v6:
- fix several unit name warnings in mt8173.dtsi and mt8173-elm.dtsi

Changes in v5:
- add gpio-line-names for gpio controller

Changes in v4:
- fix dtbs_check errors on cros-ec-keyboard
- add comments for second source touchscreen and trackpad

Changes in v3:
- address comments in v2, major changes include:
  * move uart aliases from mt8173-elm.dtsi to mt8173.dtsi
  * remove brightness-levels in backlight
  * add interrupt for da9211
  * move pinmux for sdio_fixed_3v3 from mmc3_pins_default
  * remove some non upstream property
  * checked on schematic, cd-gpio in mmc1 should be GPIO_ACTIVE_LOW

Changes in v2:
- fix mediatek.yaml
- fixup some nodes and remove unused nodes in dts


Hsin-Yi Wang (5):
  dt-bindings: arm64: dts: mediatek: Add mt8173 elm and hana
  arm64: dts: mt8173: add uart aliases
  arm64: dts: mt8173: fix unit name warnings
  arm64: dts: mediatek: add mt8173 elm and hana board
  media: mtk-mdp: Use correct aliases name

 .../devicetree/bindings/arm/mediatek.yaml     |   22 +
 arch/arm64/boot/dts/mediatek/Makefile         |    3 +
 .../dts/mediatek/mt8173-elm-hana-rev7.dts     |   27 +
 .../boot/dts/mediatek/mt8173-elm-hana.dts     |   14 +
 .../boot/dts/mediatek/mt8173-elm-hana.dtsi    |   70 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dts   |   14 +
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 1166 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   43 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |    8 +-
 9 files changed, 1343 insertions(+), 24 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana-rev7.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi

-- 
2.25.0.225.g125e21ebc7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
