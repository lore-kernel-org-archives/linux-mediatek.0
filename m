Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 500E4C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 00:19:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9234C61420
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 00:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9234C61420
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L/4GSm/JCuo5KVHA7U9BtLrDlupoBs6PoqQjwq6/q34=; b=aa5JgkkqqExhn2YLUbOTjwdiNk
	5pfq9qOcGozuaCv3EK4iL+fUBlCVYeIJuqzxHqYv6JnfHBkeKyHKYgEqW0zSt02BO1qOj2xHFCQxL
	a5I5fzT0svsvG85UwSDRHyd/IiUas2ZjcoMtn42EBNDbzojE8TpyveNfvfzlguD6Zy0KNwZSrMvH4
	uLyvmau5OowetjcQ7Rj+kbqe9uOUmmI8SsqbDSevR/ZrtQnYvlnt3Ht+fz+nzSBtRbE/nxHVacXvX
	b6SgQGGDpY+0yX6qB8LanIV9LqYg22dcwWbc1w3MYWtAsYA/KdQgqCjlC/sMoPx1KEClzsm1N0atO
	CV6idnEA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ0ai-00DKAj-OQ; Wed, 21 Apr 2021 00:19:42 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ0aU-00DK8d-Uf
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 00:19:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=28EYDCuNWEgzn0N/DDDzksKfMnr58lRuBZLjk0Jhsjs=; b=CnyD+PouFqb5CHpzZn6G7+LY7d
 i+N5UN9z5JmZdtQ5nXZfdGpIyLNVnWmi71AVtiphNAa4mSFB566ApfHB7K+lyoLbZkqxi1dzk16Ik
 fQ0p0dx6pOvsqeaJkLnIcCkFt++r0yzKhINIUDhTR7Ha7CU2KUTs55THHQffeg9RnhbHxoDNCmbRQ
 0dh+fXyC4JC/7arZ2/LYLDmSXsaAjWBZksXTYwoHQCuzYet2cXk871XrpsRUXwFq/99h4KHrZg4dF
 ul96pfSo5oDgqgMABXAUUNxg01aBOrx6NPcamZ7xZgC6HAr7lvRH02xUfZ6C7I0VWMY6aEB7Vex4y
 KgPwQqgw==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ0aO-00CVHB-Op
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 00:19:25 +0000
Received: by mail-pl1-x62e.google.com with SMTP id g16so3759161plq.3
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 17:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=28EYDCuNWEgzn0N/DDDzksKfMnr58lRuBZLjk0Jhsjs=;
 b=Pdu80w7hjJNKzTd9/wtRPCkavr5vuViu0jIhvfpCmdJPuaWSTTXTLxiPjYEUGCM4NT
 EQtU0nxUxSQ7AFLMYymomc8P3aFit5iQoNum6Tkwc5TRfGSG8Md3UF7bdDtXkTrmuydk
 rXj/FFjQ9gYzX7XIkrmkSEi25QphbSu53N+hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=28EYDCuNWEgzn0N/DDDzksKfMnr58lRuBZLjk0Jhsjs=;
 b=SJS7LKLeFOzrpYq9TyYi6fMFDjf0bF/Jj6XEJ9Ys8gF9iaC/jCqovnDVyfhR24GNps
 1wqFYYquqTKpXWlZK8ye0HYH6aTRCubaDEPRfTuMk8U+kPN8ejDKn8Qw2BYzg4tihuOU
 ragTiCVq7uOgHOeck0D0A6iwoTT6c9YgFsP65MTmq8ohmP96oYdlTgQHnozWIEpe8ez3
 XTmAkjLSpzo60bztYSTmHElOu1G+0j53C4sY1qd+bS9V7kfNElJKsv4GA+tBiLjKqkWe
 xdzMoqGJGP6cHFZ3xY2M600Qy++gdr45909btL83Zowal2ybTI/84yTaaYhZRD3SBriJ
 kYcg==
X-Gm-Message-State: AOAM533uQqLW9QkeRD9MMcXj6VdGgH3MPWM5PdDKNVPLgDT7ThazN6BR
 aggg+abXBe7vZpj8lU1uJ1cMbQ==
X-Google-Smtp-Source: ABdhPJycAMpVOiAPk5bNG+ToyEpwyx0jWbEfRCT6RQGX15gR7dVK0eZc8hhwBF+N3WsTLEKL6ICzJg==
X-Received: by 2002:a17:902:9b96:b029:ec:b399:8389 with SMTP id
 y22-20020a1709029b96b02900ecb3998389mr8067446plp.1.1618964356100; 
 Tue, 20 Apr 2021 17:19:16 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:95d2:8c89:b629:ff49])
 by smtp.gmail.com with ESMTPSA id d20sm145494pfn.166.2021.04.20.17.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Apr 2021 17:19:15 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Cc: fshao@chromium.org, hsinyi@chromium.org,
 Neil Armstrong <narmstrong@baylibre.com>, hoegsberg@chromium.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, boris.brezillon@collabora.com,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v12 0/4] drm/panfrost: Add support for mt8183 GPU
Date: Wed, 21 Apr 2021 08:19:04 +0800
Message-Id: <20210421001908.813625-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_171920_843756_A2CAEF94 
X-CRM114-Status: GOOD (  16.85  )
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
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  16 ++-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
 7 files changed, 172 insertions(+), 4 deletions(-)

-- 
2.31.1.368.gbe11c130af-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
