Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AEABC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 05:37:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02F06052B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 05:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02F06052B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CD+UUJGexj205I+0X/6uUPLlLtDPjvWW5A+64Sm3NIo=; b=nkAzA5VwX8VfhMvW4v4x5aeK8W
	1u8fbZ1g/nxY5rJTauV/6BvpRL6Q/NnH0BgtZaNlN069MT8DMbU1cqXfv1OFsGaCVvsL9fb+DwfzI
	JpH/J604ywky9N0WXPS2VLqBchLOCMarhhiwvY5qwQ/7W9uxtsvmoglvDKx5NLYHVNNb2bGkrkTCn
	ZRsifChf7AX8ARujEK7yNa9VF4Uuf/TxcSen5Kpgj0ZDED94MNcpUcdvHWNjp6JuIkUnzNdZpi36y
	uh+e2J3HWyz1Z/ikMexUuSKG5943vlXWB6LEnUsk96+y9IUw7RkeG1AhM/W4VXI+0k4D3KdoNB1hC
	lFppmZ/w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbGP5-000lAb-75; Tue, 27 Apr 2021 05:36:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbGOZ-000l74-Bj
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 05:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=aTHnAMIQD5s8JadjAbGJIjLqhqT66XAtuscyCUM1Exg=; b=YeqN/jnVczG1UmWmCedqP30hkj
 FGO2O4AfqZbHXxcCUADSysVyN9DgA2scPc77GThJdrD+CYG/O0OvEkB254vN2wAGE0bZ+MBFMa4N2
 OSpsU8y8cS8D2mvK2Sv7O8Tf4kntmiauFPVIdsPhk4npK8M9xaKgs5R2rcS3ddLEfpkXw1O8vRymB
 fthqpYRCQcCAAIGtXF6MyXFeJGpmhpKK5geRMtK05ZVuuj3J3V5IrruXQ7B/99abZI3Q4xpEsHm7B
 jmnLoAIaEKD6C2s7yZzXIXx0S6xodxi/YDXJ+r2AvIQQdP4V04HqZ0NAV6DOG7rcFHT0suqsAP9JJ
 wr+7zbQQ==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbGOW-00GSCu-KC
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 05:36:26 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 y22-20020a17090a8b16b0290150ae1a6d2bso6626207pjn.0
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Apr 2021 22:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aTHnAMIQD5s8JadjAbGJIjLqhqT66XAtuscyCUM1Exg=;
 b=iDVXwOEZxmA8fOzgfknudnogPZoKYmxt3u8dTcHSHwypV0CykQKeRziphRLC3veOyJ
 AnOIFpfBBOdlNpdVwEX7841ZSHmTd/+D00vrCuLcizuefC4WPLuMgL6v9IyHllx2fhBm
 qc1fJPhDE1Z3eibkPtW/NYxlStO0vq/IeLVNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aTHnAMIQD5s8JadjAbGJIjLqhqT66XAtuscyCUM1Exg=;
 b=tfa4o9mmfMciDkn55A5+3JgXxnQo2N9gKvbWFiWx8vxl3Ih10X0ndGwZ/npd60zFJz
 XpYswz4EC7Syqv+vWwewYajODgcBRzaJhBZa3JXKMddRMvaypswk4ScFATBVM/Jx0Mfk
 WEAzkUuI9W2MGpy1EEciVu1MeE79nY++gAnnnFuG8DqTeXQpAp9OB5FY2oyq5nTkNQCy
 OPJyllZwtITqKCW34Olx8VvGs6hWITBw8Mb0j9rgIxbyNfgHpV6tIy5gNBfOA67hZbNN
 JUW1L+jW1QQQwuBcNKksJiS1tt62OGBJ0ZDzsQSA0zKY35aqYXbapYjHW9JsesF+zv9G
 5ndg==
X-Gm-Message-State: AOAM531zKhjScyKTpUbRnZ9vw3lkhmBrEHSfbgBDUDS5wmU6lhlTcpxG
 ihEOJuiPVpYR/Tq7d5O3dyNWVw==
X-Google-Smtp-Source: ABdhPJwhDlroLXq4uzG2AtyLbgaJBtpApsdyh91sUIMYLFNmkYl6oY9Myfj40DiDCM4x+JYA/8iPoA==
X-Received: by 2002:a17:90a:5907:: with SMTP id
 k7mr3159032pji.197.1619501782729; 
 Mon, 26 Apr 2021 22:36:22 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:3984:c4f5:8612:6b3e])
 by smtp.gmail.com with ESMTPSA id gc15sm993529pjb.2.2021.04.26.22.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 22:36:22 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v20 0/5] add power control in i2c
Date: Tue, 27 Apr 2021 13:36:12 +0800
Message-Id: <20210427053617.27972-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210426_223624_669345_8805BECC 
X-CRM114-Status: GOOD (  14.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Although in the most platforms, the power of eeprom
and i2c are alway on, some platforms disable the
eeprom and i2c power in order to meet low power request.

This patch add the pm_runtime ops to control power to
support all platforms.

Changes since v19:
 - resend v19 with fix tag added.

Changes since v18:
 - Fix a function name conflict with drivers/gpu/drm/i915/selftests/i915_gem.c

Changes since v17:
 - Add a patch to fix unbalanced regulator disabling.
 - Add dts patch.

Changes since v16:
 - request regulator in device instead of in the core.
 - control regulator only if it's provided.

Changes since v15:
 - Squash the fix[1] for v15.
[1] https://patchwork.ozlabs.org/project/linux-i2c/patch/20200522101327.13456-1-m.szyprowski@samsung.com/

Changes since v14:
 - change the return value in normal condition
 - access the variable after NULL pointer checking
 - add ack tag

Changes since v13:
 - fixup some logic error

Changes since v12:
 - rebase onto v5.7-rc1
 - change the property description in binding

Changes since v11:
 - use suspend_late/resume_early instead of suspend/resume
 - rebase onto v5.6-rc1

Changes since v10:
 - fixup some worng codes

Changes since v9:
 - fixup build error
 - remove redundant code

Changes since v8:
 - fixup some wrong code
 - remove redundant message

[... snip ...]


Bibby Hsieh (1):
  i2c: core: support bus regulator controlling in adapter

Hsin-Yi Wang (4):
  dt-binding: i2c: mt65xx: add vbus-supply property
  i2c: mediatek: mt65xx: add optional vbus-supply
  misc: eeprom: at24: check suspend status before disable regulator
  arm64: dts: mt8183: add supply name for eeprom

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  1 +
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     |  4 +
 .../dts/mediatek/mt8183-kukui-kodama.dtsi     |  4 +
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi |  4 +
 drivers/i2c/busses/i2c-mt65xx.c               |  7 ++
 drivers/i2c/i2c-core-base.c                   | 88 +++++++++++++++++++
 drivers/misc/eeprom/at24.c                    |  6 +-
 include/linux/i2c.h                           |  2 +
 8 files changed, 114 insertions(+), 2 deletions(-)

-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
