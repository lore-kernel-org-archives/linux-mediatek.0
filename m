Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F3A1C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 13:14:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B26AB6146D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 13:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B26AB6146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lcgtz0SnXmd9mJYZdo4pbLoKdEuQXsqdR102i25EYu4=; b=O4uHhQeAuVS5TzUiHYX9FRCmBt
	2srYBaKTQDYALh3qTI0P/pis3ky8F2xjNuADXG+jDBoGbpgrB6+U7R9P3UeP2yzLaKUqbKRikBzgz
	GnGm2T5iP0jI4e5VzxrgHXwq+La3HCvKFVr740pZ8Wa83dW+Rq5H8ViKwZWwTIBU8I5wDmNm+OPjV
	F6hSSroVZ/CWanK8EStz6Uf3FaxNTzQ/l99k0Qk3+j2VOmjUV3QX3+uVqKMvkcdypP+CzUl2QjaRV
	tNIESoLnuqjMXPbMWG/Mf43Mj6f4fkJcZjf7ATd16QJYt470xFIKX+iWliC+Yb3I5wkRJU3q7oeTk
	nCOzoFLw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lf0J8-0077pi-7W; Fri, 07 May 2021 13:14:18 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0J6-0077pE-SJ
 for linux-mediatek@desiato.infradead.org; Fri, 07 May 2021 13:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=sCOlyOIFiZk09QTc1wpSf9iIiwmNKJWxQ3gP9jIAbQE=; b=0c2B6lDHKoK02s5tC22QVFXNpn
 7rtbzQH++8NTTi2wJwBrMgVu62+tC4S7yh9BmTwVD8sSPjk+Z2+Lf1kbiBZSnKU6epJ8yg7qFkmHs
 RknVJlqJAijmi937Cz1hS1Udm7NdvrFDgXO2OorK2n35mHyBlVN+PNHJJ5UIKiFTHNMjrU1t2ddwk
 C462Id1XBW21H5S/TfDdQfvA2qD0nuDswVC+IXOjJkD6tO1FXYhWYOUi1FE4Oi6ofC+F9GXud945a
 09PftlXkeZ78M0UERFMNgGQRUGyqyUO+Hdra5GLrUvyXzHEI7OzJcBLUGsn/HNl3FF+iWBhXK3Rb4
 FFGbdZvQ==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lf0J3-006sX8-Sj
 for linux-mediatek@lists.infradead.org; Fri, 07 May 2021 13:14:15 +0000
Received: by mail-pj1-x1030.google.com with SMTP id
 gc22-20020a17090b3116b02901558435aec1so5327311pjb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 07 May 2021 06:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sCOlyOIFiZk09QTc1wpSf9iIiwmNKJWxQ3gP9jIAbQE=;
 b=mSpLQhA/xa8vnl35yPqcyaIJv5x2iKpQ79RnozczBUFtCog64lxWk+cW6iEUvnFZR5
 lXSMgIKXAE+diRkzI4rU8zgP6i0MQrZOM4NA32+kAechGNEOToZDzav/4bI5gQVttTG+
 v8FkMm6GIZHzU8+QlMXwDkCy0gAB50XFsATUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sCOlyOIFiZk09QTc1wpSf9iIiwmNKJWxQ3gP9jIAbQE=;
 b=Kx4jdifj6LiIszyk4REUnQ1006xwUq09IfF5NP829y940+MCGJszvt0TqAPwvXBaut
 Dd6ThdA3zEJyL06UeiA3NZFkyatroFPszQv9ivPsOW/c3Tn+76zxUuGt2gH/JRqL1bSp
 Jwb9lNUMqF2DWIz3FiaStfcQZZ4Byy+dbujFzt5O/tTEQZdZydxoAoS/VHPxt6onhI/U
 NUU1Q+DoNNl1pLIcNMTCBNEdp+gWVdKTo3skWSoGhovd6YVeQuz5JvLjICtxUzajedzV
 EkMcPN9kFaH5kRTbUE3vBTYH5BuVFGjbKtUOYM1dW1jZB2wjsg1v5dxscsmF4OddUoga
 MUlw==
X-Gm-Message-State: AOAM532yZENgUZCthOpAaOjkH3uZudHHhZ4XqD6MWvpxKhjY+/vqQJLW
 rWzmUddF8hevWPOG+//9NZDpZw==
X-Google-Smtp-Source: ABdhPJy9qeTIxg0nqdJ7guKT0auSMto/VTPsSqmgPnb9RJpyRnb5vWAaDpYKTMsGNe7bTpd2JRQCJQ==
X-Received: by 2002:a17:90a:a589:: with SMTP id
 b9mr10307171pjq.80.1620393251736; 
 Fri, 07 May 2021 06:14:11 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:711f:8553:a124:a19])
 by smtp.gmail.com with ESMTPSA id z29sm4656539pga.52.2021.05.07.06.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 May 2021 06:14:11 -0700 (PDT)
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
Subject: [PATCH v21 0/5] add power control in i2c
Date: Fri,  7 May 2021 21:14:01 +0800
Message-Id: <20210507131406.2224177-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.607.g51e8a6a459-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_061413_982965_02690A78 
X-CRM114-Status: GOOD (  14.09  )
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
 drivers/i2c/i2c-core-base.c                   | 95 +++++++++++++++++++
 drivers/misc/eeprom/at24.c                    |  6 +-
 include/linux/i2c.h                           |  2 +
 8 files changed, 121 insertions(+), 2 deletions(-)

-- 
2.31.1.607.g51e8a6a459-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
