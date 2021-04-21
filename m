Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF39CC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 05:31:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0B23E61419
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 05:31:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0B23E61419
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BfFNjoAoCiqczeSDr//Qz2p2Dfc06Qv5sTydZIsx96Y=; b=rUrIyjqo5qMtO96PmEGeB2o15E
	O6xWU/SWlViGKLVyKrtdUwOauqQRZvFaIW06ZoHLLleTm7yJHQ10flFYY9WSFxSxGnSwPrQVuJXUs
	uZFfTiungF9PzZVZaiM5pRdNct7bgbBBdr6YYPopRxYdJWoPKjH6BCtaXm0OKS4PqSu/m7Ba9bOnw
	OnTKJ1CD1S/l/zx2mN+mdk+WGyOBE12RFj5MNPxytHOc+1DpxYK68p4wv40mUzl+HaXCvmSvvyzKb
	UiP2HVOScAxZZFw80IUCJxNq946lmyAUfwXqhUxsr/BBnn/KjyBiCw7v+q4utKedb61LjrlSlE12I
	xASBTW2Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ5SB-00DiBa-GU; Wed, 21 Apr 2021 05:31:11 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ5QD-00Di4w-IS
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 05:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=nlaqIWp5Fzquc+zXrvm2JPBL/vMUuB8HIWaERbo23p4=; b=S9ZOIKCP8OKLI9S81CmWZvK8sa
 F1sq5UY83e/b2/pl53bHnrBgh9RhaDmLDnl6PWjqI3snzcbz1eVniogHfmQtFYWW7O4ClDHSHl3Le
 2uu2NxvtIxP+sldBfQd8OE1pi6S6NtSsH1htnDRyxAExEN+yLLEScGni8zvTgWxGlXBPTi4Wxn2hl
 tJHN6uXSWgP/ZJRPAFwo4vx1kBMwfWHCH9mf1V6Yju5NpUpRydiglml3mZzLWLRuBdxAU+5VwGOB1
 lrnXh/PofQ0KF1naqcvis+NaHTLrARNYyIcKIgC97pbcT95y6kgnhfprsl6edTVkNVwGS7VRE02aZ
 xYgsrWCw==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ5Q8-00Cbwo-Bv
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 05:29:08 +0000
Received: by mail-pf1-x435.google.com with SMTP id i190so27598421pfc.12
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 22:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nlaqIWp5Fzquc+zXrvm2JPBL/vMUuB8HIWaERbo23p4=;
 b=b9uo6QVHkt0VV4y2Dg4EHFFElBLjCCyDwSVMIDwkIqTNzjblJgeigtidsR81zNfOKi
 L9BdKCqmzSXE5ap3gH4eJRWiqRq8DRRS9euzxGTLTf1LjmmzIBna0Go87oNJJ+H/tVRB
 9vmQqLh2nvM1a7DwwiGupaXA5Ur6p8XSVXvdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nlaqIWp5Fzquc+zXrvm2JPBL/vMUuB8HIWaERbo23p4=;
 b=X+w7tvbpdXoYEvlWpzMSTaq/fLb8IPhFj+x7IjCiTCnL/FS4P9j9TWvQ4+J23Vx0Mp
 FXZqWdnVHC7EOSDx33EIfwMJY+q56EiZAtdMlId9dIsAcDAKghVvUdDU3ojDzv42z9jr
 7tDWsjFsYc4fRsotrsUvYyqPUEkj8CIbktD7d+gMhOCYLvPB6CA8cZYyzKUy4Vq59gmU
 xVHzJhkeRwZNjWl9wCaT9f3Te8x2NlXZIOYRAlWB4L3cIGNEr7nnT6TfTPGXxYtcZtK0
 PeJ5beGD/WE6AYCyZuaTtDr8NddoLlVtzXXJWZ99XAtA3Ch955J6J50W9KsvyR424ctT
 FARg==
X-Gm-Message-State: AOAM530h8TystvVnWlGq3eZEaDQqyQ+HGnAYeLg+/bPc8Im3nNtJ/73R
 W0AlLKw2sy8cGgqJJRaps6jCAw==
X-Google-Smtp-Source: ABdhPJy/v51axJc4IPprUcfU5wqCBVCs3deVpfNqoQc0PWEDX48zVr/uPgS2uSMuQue7WI3t0o/AXg==
X-Received: by 2002:a62:6202:0:b029:208:f11c:2143 with SMTP id
 w2-20020a6262020000b0290208f11c2143mr28513587pfb.32.1618982941649; 
 Tue, 20 Apr 2021 22:29:01 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:b3e5:49c0:4843:2bbe])
 by smtp.gmail.com with ESMTPSA id b6sm602537pfa.185.2021.04.20.22.28.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 22:29:01 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: fshao@chromium.org, hsinyi@chromium.org, hoegsberg@chromium.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, boris.brezillon@collabora.com,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v13 0/4] drm/panfrost: Add support for mt8183 GPU
Date: Wed, 21 Apr 2021 13:28:51 +0800
Message-Id: <20210421052855.1279713-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_222904_433170_EB92EAB5 
X-CRM114-Status: GOOD (  16.75  )
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

Hi!

This is just a rebase of the v11, untested (but it seems like
Neil Armstrong recently tested it), with small changes in
binding and dts. v11 cover follows:

Follow-up on the v5 [1], things have gotten significantly
better in the last year, thanks to the efforts on Bifrost
support by the Collabora team (and probably others I'm not
aware of).

I've been testing this series on a MT8183/kukui device, with a
chromeos-5.10 kernel [2], and got basic Chromium OS UI up with
mesa 20.3.2 (lots of artifacts though).

devfreq is currently not supported, as we'll need:
 - Clock core support for switching the GPU core clock (see 2/4).
 - Platform-specific handling of the 2-regulator (see 3/4).

Since the latter is easy to detect, patch 3/4 just disables
devfreq if the more than one regulator is specified in the
compatible matching table.

[1] https://patchwork.kernel.org/project/linux-mediatek/cover/20200306041345.259332-1-drinkcat@chromium.org/
[2] https://crrev.com/c/2608070

Changes in v13:
 - devfreq: Fix conflict resolution mistake when rebasing, didn't
   even compile. Oops.

Changes in v12:
 - binding: Fix min/maxItems logic (Rob Herring)
 - Add gpu node to mt8183-pumpkin.dts as well (Neil Armstrong).

Changes in v11:
 - binding: power-domain-names not power-domainS-names
 - mt8183*.dts: remove incorrect supply-names

Changes in v10:
 - Fix the binding to make sure sram-supply property can be provided.

Changes in v9:
 - Explain why devfreq needs to be disabled for GPUs with >1
   regulators.

Changes in v8:
 - Use DRM_DEV_INFO instead of ERROR

Changes in v7:
 - Fix GPU ID in commit message
 - Fix GPU ID in commit message

Changes in v6:
 - Rebased, actually tested with recent mesa driver.
 - Add gpu regulators to kukui dtsi as well.
 - Power domains are now attached to spm, not scpsys
 - Drop R-B.
 - devfreq: New change
 - Context conflicts, reflow the code.
 - Use ARRAY_SIZE for power domains too.

Changes in v5:
 - Rename "2d" power domain to "core2"
 - Rename "2d" power domain to "core2" (keep R-B again).
 - Change power domain name from 2d to core2.

Changes in v4:
 - Add power-domain-names description
   (kept Alyssa's reviewed-by as the change is minor)
 - Add power-domain-names to describe the 3 domains.
   (kept Alyssa's reviewed-by as the change is minor)
 - Add power domain names.

Changes in v3:
 - Match mt8183-mali instead of bifrost, as we require special
   handling for the 2 regulators and 3 power domains.

Changes in v2:
 - Use sram instead of mali_sram as SRAM supply name.
 - Rename mali@ to gpu@.

Nicolas Boichat (4):
  dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
  arm64: dts: mt8183: Add node for the Mali GPU
  drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
  drm/panfrost: Add mt8183-mali compatible string

 .../bindings/gpu/arm,mali-bifrost.yaml        |  30 ++++-
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   5 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   5 +
 .../boot/dts/mediatek/mt8183-pumpkin.dts      |   5 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
 7 files changed, 168 insertions(+), 1 deletion(-)

-- 
2.31.1.368.gbe11c130af-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
