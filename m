Return-Path: <SRS0=4IUA=KW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B91C47089
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 07:57:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 477A9613E2
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 May 2021 07:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 477A9613E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LOJQCfS37ouhqLdkrMeC+33hYCq/cHatfoqKuCBMckM=; b=QZXy9Lw9XHO12t
	56G9fit8SjIFI6YOB/ypy4cEEz0Q19oJMM+G3nG9GmpTtvIuurIay/cuyasttk0VK3foridgWTm+l
	UoV3rHFCNeof2DkcsTDWC6RXV+mnQe9UZxgn2+1dofQJCefclyYXOcVaxHtILOTQwq4ujPjFVkRhz
	9I8ktKFhGg6FyELLi0U8ojJ+GuBKMWCxmXZ4xSdrBDQhe2nmogy3FPibrbe3hLRuhvEAJ/DY9M5J5
	XOQ18Z3qZGxmSbZllFsTn5z4aqVPX5+mWr4blmN5FPKEm8a4kvjOETjL3S45me4+W6Co2r7wTdlgE
	Z3Ts9Ew/2+Ym4xiUhJlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmAtm-003Zc9-Gr; Thu, 27 May 2021 07:57:46 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmAs6-003YXx-UD
 for linux-mediatek@lists.infradead.org; Thu, 27 May 2021 07:56:06 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 lr4-20020a17090b4b84b02901600455effdso725657pjb.5
 for <linux-mediatek@lists.infradead.org>; Thu, 27 May 2021 00:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/doZaj7RzG7nsTUhqK4KmB6iqriYK3erH2nH1FOUD68=;
 b=Du/bJjPCbg4kECu8cN42XUDMYzFFqM5hhuJsKuyni/Iegd+QkpFdn3erdTrw336+Je
 MCwLbsMBWJXz9lKm8LpL3AbKjpXSOXT5Q8Ntiqk2nW/bsG0pjlMkmDWdZVLJ1OskB9oK
 ElmGvZ2xGkaz9Wb4LxkotNheavjAAy9N3UN8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/doZaj7RzG7nsTUhqK4KmB6iqriYK3erH2nH1FOUD68=;
 b=TlUp7Al9Xbhj0JHuVpzHwT8h7yXGdfH2VDys4xeX0UNOg3VF5Z8ZUyOXLK0U2Q4A6k
 hFWdPBNJhkoZ0T8L92DO8xoZvOpAjhT1Z+w5hrK8jNPawaSbhwm7o1jyNuLJGADh7G3X
 gg4vPtbzKlo+gzaoos1hMf5er/0P7EJCHbRgaKJ3Q/o5vRKPcp6MEobCX3i5P/0N+ApZ
 0lz9uYzVRaFi6ZfBY/JDZD5JhjlD9UmhouHIjXBotmLSEVaxiM/3oKfLmoX/DbSjLN0j
 icG95ygk3RIXRSPvmmrPNUUqk2nM3ouJSFKqCPl1xvStGNXPgskrx8ZJ07tW6reSQr8T
 BhTw==
X-Gm-Message-State: AOAM5318ve4xzsHwwh6PH7LTELAFaYaIuGYl+7FOugUreKy8LfSVX/4/
 OniqbMYdwjlCtClLMX0Z+Zaz7w==
X-Google-Smtp-Source: ABdhPJw9vM3CRZoYcvKhq2sIemcpggZaXiWzX+hqAh8djv70fHOy2wHjuL36qI4azOgorAmQvAePXg==
X-Received: by 2002:a17:90a:e553:: with SMTP id
 ei19mr2447297pjb.175.1622102161697; 
 Thu, 27 May 2021 00:56:01 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ece5:55a4:6ad3:d20f])
 by smtp.gmail.com with ESMTPSA id 69sm1217790pfx.115.2021.05.27.00.55.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 May 2021 00:56:01 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Wolfram Sang <wsa@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jean Delvare <khali@linux-fr.org>, Rob Herring <robh+dt@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: linux-i2c@vger.kernel.org, Qii Wang <qii.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mark Brown <broonie@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v21 RESEND 0/4] add power control in i2c
Date: Thu, 27 May 2021 15:55:52 +0800
Message-Id: <20210527075556.1709140-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_005603_066294_4B3A4FC1 
X-CRM114-Status: GOOD (  13.44  )
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

Changes since v20:
 - fix regulator check logic in suspend/resume.

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

Hsin-Yi Wang (3):
  dt-binding: i2c: mt65xx: add vbus-supply property
  i2c: mediatek: mt65xx: add optional vbus-supply
  arm64: dts: mt8183: add supply name for eeprom

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  1 +
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     |  4 +
 .../dts/mediatek/mt8183-kukui-kodama.dtsi     |  4 +
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi |  4 +
 drivers/i2c/busses/i2c-mt65xx.c               |  7 ++
 drivers/i2c/i2c-core-base.c                   | 95 +++++++++++++++++++
 include/linux/i2c.h                           |  2 +
 7 files changed, 117 insertions(+)

-- 
2.31.1.818.g46aad6cb9e-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
