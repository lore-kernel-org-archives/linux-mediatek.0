Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68926C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 01:10:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2842D23447
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 01:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2842D23447
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pgCXHKbxsWI1uucXu6YgPGERyag7c42OhEggHoUofrw=; b=y7hP2ca1sE/OXv1pSDT2nsNULI
	X8gAC78lzm3kJ9lGoUv8U/OGoQPFnhIjJB1RVaQnwaBOtyjNg0q+EAdoJPJbi4ufH1Q+a/6nTKN+e
	GmHio3auMQJaXcXegCC2vAt29gLTOVx/FH7456ikvBWCkHrHs0brgYS85ugH1vSvWqDKlmxihouWr
	Gzv2ZJIHnbKK5Iu0qOIYWCarRpFyGql7sg7nsgKAWqQQyHgDfQqB7MSRaEn8uksE2+NOlgBYsl4SW
	pXGOuIHP8PmyuUY0hEdI+UoI/0GdJ8XlLXxaWMkhOI9Sj7vFFx0wINfm05KPyXRG84+OHGfrPcPx/
	6d2Mwc3w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxgII-0007H5-Pj; Fri, 08 Jan 2021 01:10:22 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxgIG-0007FO-1J
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 01:10:21 +0000
Received: by mail-pj1-x1031.google.com with SMTP id u4so3520987pjn.4
 for <linux-mediatek@lists.infradead.org>; Thu, 07 Jan 2021 17:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rYVPFVXtXxwvNRbtCD49/nQPeoSTTbcvrlAIBfpayjY=;
 b=Vas4zMIdsNvM0u536DKqys62KF2xTfpQ0ZWY6fwnSuQw7fKhSWR1CI8VwUfSh8a2xf
 4S+xpJ6a+3l2mfJIeFOS8n0YOUme3v1Pi46O/BFdljtv5DjnTBvFTRSmXoJFKWSZZtb/
 najymQKiyfjs6S22oBZVuJfcoVijZPcdtb7io=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rYVPFVXtXxwvNRbtCD49/nQPeoSTTbcvrlAIBfpayjY=;
 b=OdR3D4yIzcax/+vlzu3Xj7gOd6J+6qsVoikeMp378Dx420yfctuZLR+qb29GIyHUHh
 nlJdd4dIAJOiiLb4GsacmFEEfXSsZ47BP7SjmWFmJFCQXshMsfe9+Vvatk2GMtUlpRgr
 Y9DB4ST3X5ChXR4EQ8+UOT4y59JqYeYGmloLAjMSBUAO94jhjCkTxQP5ChD+9/ltjRrN
 x5pOiZVX7y8aMqjaixcqn/vtDcphqdzCzkJ5//oGeaYV7CGO7sg+axOmRwVDbYj9hEKg
 xf1RYu3xaVl2Li/PfsY/hs7clkJihM86DO88R1BoMqLEGEVlEu4XXAt+9NELMhVXbus4
 agqg==
X-Gm-Message-State: AOAM532bJY4kc/5BS8c1WsrjxeaHhpWItBIKjXdqJbPWaHgp7n+2rNjg
 DK0Y4W4yTOpk4g7VXnwCkrgWSw==
X-Google-Smtp-Source: ABdhPJywkmrUoz1GUuww7nlVAg7zrHLNiwitqiedS0hUNTEgnRVlRbzJl1+nrX5fUAnpxtQ9hvkRyA==
X-Received: by 2002:a17:90b:691:: with SMTP id
 m17mr1139326pjz.73.1610068217903; 
 Thu, 07 Jan 2021 17:10:17 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id s1sm6400083pfb.103.2021.01.07.17.10.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 17:10:17 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v9 0/4] drm/panfrost: Add support for mt8183 GPU
Date: Fri,  8 Jan 2021 09:10:07 +0800
Message-Id: <20210108011011.4061575-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_201020_178017_A573BE21 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, fshao@chromium.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, boris.brezillon@collabora.com,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>, hoegsberg@chromium.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

Follow-up on the v5 [1], things have gotten significantly
better in the last 9 months, thanks to the efforts on Bifrost
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

Nicolas Boichat (4):
  dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
  arm64: dts: mt8183: Add node for the Mali GPU
  drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
  drm/panfrost: Add mt8183-mali compatible string

 .../bindings/gpu/arm,mali-bifrost.yaml        |  25 +++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   6 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   6 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
 6 files changed, 161 insertions(+)

-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
