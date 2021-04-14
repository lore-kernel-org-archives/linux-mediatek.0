Return-Path: <SRS0=Strr=JL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEB8C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 17:29:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12873611AD
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Apr 2021 17:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12873611AD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g7c928pYFFG+KqydBAxxQgYNKdTEBgrLeLVp0Qx5/Y8=; b=kjnBSd/L+qJ6D74DMsrGyBnBtH
	FgX1h1WaNvixtMT4Wc4disZBudOygsDoRBiuL6lgbf7dW0eII6qXonLRcxhgpKuVTUXuvAK4eX6Gb
	OVIOPu7UI6fk1rcylBchXFF3tad8X69vpfri6Z/Fjbwz9GDUbC2L4iscuWE+MMEp66I7T/L90iQFh
	ck+FNYoZivcTE6wr7rfvqLsPLw/R3eKoFk6WvvTPzaKHx0eUhE8XaYwZVNPTwH9610G9tjSzrsWtB
	eKsf9tKK8XvvJuJA8qwjj9Gpu6c3J1Wp3wDlrbMdKHOaVBAzPHoPu10EwQdC6iaFfUbrkE51RSPC5
	7I8+capw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWjKW-00DGQy-Lq; Wed, 14 Apr 2021 17:29:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWjKP-00DGQ6-VD
 for linux-mediatek@desiato.infradead.org; Wed, 14 Apr 2021 17:29:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=1Mc9V/D86U6BEgIVG5fSvnzsnM5e5tTTmQuVaPnzWOE=; b=tqiYBcA+7tr/uK9nIIj83mYpmB
 AOpPHY3EjqoBsYm/vZ6SDeKs3WdQL30s/3izIQoVotvWistPbdfUT/7L24DzapSEffMg/lZOKlJcC
 nfnw6wB3r/HwevOu5nE7lAVeQxAwgsnqCH67oxXRM2Uj4YURaz3WbS439p3FeiHlhul6powvQVsRo
 qQHDIaE6crGYkbm+eTpxqLOC8NaSVix75Zi0R7s53vQRiVOQQqZu05sc95KZly9xvJEfu15UDHprv
 q63sNFJu4aC3FbHa3CNc+2CW8n8TBjsFd2lqMKkcbvj5+KrdQU/iylrX1HZJd9OR9LiwQ/VpC6AcW
 Xq/yZHkg==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWjKN-007yYp-5G
 for linux-mediatek@lists.infradead.org; Wed, 14 Apr 2021 17:29:24 +0000
Received: by mail-pj1-x1036.google.com with SMTP id u11so6968145pjr.0
 for <linux-mediatek@lists.infradead.org>; Wed, 14 Apr 2021 10:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Mc9V/D86U6BEgIVG5fSvnzsnM5e5tTTmQuVaPnzWOE=;
 b=I+jfFQqNi9/cilXzuSk6QG3M59Lt49okHGRHlubvLVjAI91piLtl8VNAc4/BfaPVFk
 XaU5JTTJewUdvBdO5DRSzYJoTrk334pEPmYXthPFZKGaXM0GbIQxibJe7BK1zsGNZEZp
 iaoZlNOa/SIbvvmTcc/kGpzVFB49NHkAluesQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1Mc9V/D86U6BEgIVG5fSvnzsnM5e5tTTmQuVaPnzWOE=;
 b=Uu4r8LIAcierbVsQeV+b95vPF3AA/UQeucCdn4FxGGq/bWv1LglnPRiAUc+/+x+H8c
 C+c513tT1nvccXY+VLw38ZOIKHKygeCL8cyQrjQYROt7tUc0pQkHfeGRjR8cZ5Y+hiNA
 oeyA6Vklc82caiVqkDSlOG+54J/CUytzcLqdqHuEleu7UBwXrQmlRTfMAyn8dRxjmuM2
 qTJDRJvSccflcbTEYokM/M1kNqyg/Y9G8WeQIZJOsRc33Kx8NMOtksUcXaj6TaBOenIh
 /AC2IOZPZUL8Pwyi8dJImZkscKZli7HouVtNWExjl35Z9ni0SABHXuywBmB1hTyXuNcy
 /qvQ==
X-Gm-Message-State: AOAM531XoOYcMbBZtE1CYHdZQg0fgOjLUOcGwOCMwYS9TF9c3wnjl5+w
 n2VdaHpOYH7chJ/A4MysMKdWRA==
X-Google-Smtp-Source: ABdhPJx59RC39LfClSHgnlQasDDu7sVxpdQzTbo5+kAxp9cQhaHMPuG2TyZuMZw0VJ7OVAVgHWGybw==
X-Received: by 2002:a17:902:7589:b029:e8:c011:1f28 with SMTP id
 j9-20020a1709027589b02900e8c0111f28mr38384074pll.35.1618421361888; 
 Wed, 14 Apr 2021 10:29:21 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:bae3:4af0:9792:1539])
 by smtp.gmail.com with ESMTPSA id e31sm63460pjk.4.2021.04.14.10.29.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 10:29:21 -0700 (PDT)
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
 Bibby Hsieh <bibby.hsieh@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v19 0/6] add power control in i2c
Date: Thu, 15 Apr 2021 01:29:10 +0800
Message-Id: <20210414172916.2689361-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.295.g9ea45b61b8-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_102923_237907_81BC4136 
X-CRM114-Status: GOOD (  14.12  )
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

Hsin-Yi Wang (5):
  dt-binding: i2c: mt65xx: add vbus-supply property
  i2c: mediatek: mt65xx: add optional vbus-supply
  misc: eeprom: at24: check suspend status before disable regulator
  arm64: dts: mt8183: add supply name for eeprom
  drm/i915/selftests: Rename functions names

 .../devicetree/bindings/i2c/i2c-mt65xx.txt    |  1 +
 .../dts/mediatek/mt8183-kukui-kakadu.dtsi     |  4 +
 .../dts/mediatek/mt8183-kukui-kodama.dtsi     |  4 +
 .../boot/dts/mediatek/mt8183-kukui-krane.dtsi |  4 +
 drivers/gpu/drm/i915/selftests/i915_gem.c     | 10 +--
 drivers/i2c/busses/i2c-mt65xx.c               |  7 ++
 drivers/i2c/i2c-core-base.c                   | 88 +++++++++++++++++++
 drivers/misc/eeprom/at24.c                    |  6 +-
 include/linux/i2c.h                           |  2 +
 9 files changed, 119 insertions(+), 7 deletions(-)

-- 
2.31.1.295.g9ea45b61b8-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
