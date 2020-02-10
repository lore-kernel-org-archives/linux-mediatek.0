Return-Path: <SRS0=lG5C=36=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31C2C352A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 06:36:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8E1820661
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 06:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cAK5hE08";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bUN6TfTE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8E1820661
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kjmBddlAD4KoTmQ5ofTV26V+/CV1wYDmRg9hiBSdM1I=; b=cAK5hE08OMIp4y
	s8QHbrE4SPg/7ISXDcxTdQxsRaOpjs9EQDpzpxkV7ksUrU8ZA7/6DxjEGLMm/Q/zx3fR3JjVekLRG
	ikq6xrIPkEePynilg2vD+/bnz4F//1c0PdPZLGo9EdjXD38Na6YeF4Wqo+UWnM8OpuwNwaKAv0dO8
	WX6CcFkFXLtIajAdEsbfNUlzjbJ6VizJDHR5yGtQ3ZmkaVEcd2VOetcy1lgT294cJgfrhxYuNza3m
	kfrNNiMYgXU1H5AN/19a/M2Ry7Miy53yIlNbiOuB/tzROXvC1KIkpbNvqYv9MMRPtg67IssDYZOX9
	k0LoD/b0jn9+2H+6tGgw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j12gH-0001B9-Gu; Mon, 10 Feb 2020 06:36:29 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j12gA-00011o-Gh
 for linux-mediatek@lists.infradead.org; Mon, 10 Feb 2020 06:36:23 +0000
Received: by mail-pf1-x42b.google.com with SMTP id 185so3212340pfv.3
 for <linux-mediatek@lists.infradead.org>; Sun, 09 Feb 2020 22:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lo17ppS/z0H1lSs1uTt0PZLLJNNtFvUKsUcqWlfn7Dc=;
 b=bUN6TfTE7usvEbrf47ULqCV7Q1Wmo6/Vzyto8zU5n07Oijvw4PAsNQlaYy5fRB+Own
 LBZXlJr3KquKZ+JciXDyIRgUHtAVe27qImHD4CtpQCOp6qC9h4wib31fnJ40b+jIxn/S
 6ytT9ejZ497xQAfK5M11UhTtxBHR5HpdXQsBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lo17ppS/z0H1lSs1uTt0PZLLJNNtFvUKsUcqWlfn7Dc=;
 b=M0KdlRrf6UiUtDsvn6ZpDxbkr1ucIZVZGr0s+PxOUPdh6d0aJ3AREPw1xJ00tzcJfW
 iiWqwQczo3IE4zMITQ3uekVzR8u59Tiq7QvOL9APNM9cI7VYPlrPlCA+6pQbhnx8d+L+
 IZTtpaDnD6TuYDP7sttLHXnd5w3Ve0NxbEomXtV+tNhXXQwdaYD0dhanGvIOM21FC7TB
 7tP/i1RW9A4C3EwPmREwcb1ZZ2koqlk+fxtghB/zNlHhwEL8I01gVm4mreuDvCjYgvWn
 Hsejoc56CxPZZUeyAiHADH2Vi+ee9r3N7VmAuHipi2KpotnXATBot12oxJziWCHCsy/p
 /Qfg==
X-Gm-Message-State: APjAAAU/dTppIMxJixz5Qi7Pen3BoAr7W7zHwv8ysAJ9krFjCJ99Ranw
 YQcra5tee6tE0G8rc6VFqLckjg==
X-Google-Smtp-Source: APXvYqyV5uXjYlcd6ghIM6ap/HEp0sTQIJM1ZhrD03kxdqxEcvdfBDVhE8hzFps31kS5WDBa6r922Q==
X-Received: by 2002:a62:6342:: with SMTP id x63mr11616369pfb.103.1581316580334; 
 Sun, 09 Feb 2020 22:36:20 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id f15sm11070041pgj.30.2020.02.09.22.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 22:36:19 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 0/5] Add mt8173 elm and hana board
Date: Mon, 10 Feb 2020 14:35:19 +0800
Message-Id: <20200210063523.133333-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200209_223622_551636_A7BDD064 
X-CRM114-Status: GOOD (  11.51  )
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

Changes in v7:
- add pull-up for da9211 to fix spurious interrupts

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
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi  | 1173 +++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8173.dtsi      |   43 +-
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c |    8 +-
 9 files changed, 1350 insertions(+), 24 deletions(-)
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
