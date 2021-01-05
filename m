Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 388B9C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:11:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0E152255F
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 00:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0E152255F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D0VCh6DqeMQyMwOAF2olZc1YGQdfAZ1BQiqjUAtjt7w=; b=LulsWYytk8hDXPj2zrJfCOW+Ou
	+ifU3s9Kog0MJTr05aLTr99IcLEjOYaVW7OhXtgpEEjA8lw0r1e39lsVt32hcQhyyodfgY/Ch3SBz
	QjjXk6maHwDiUZsacYXQJYnkLmCJGGRMFZjcAtRH7e+50Du8jV8c52zLD+IrcQsECRr+iKzRqanBZ
	KUchBu8OQjfei+E+mvnf+Y4fmV+lQSLQ7bQk77DmBCF/su/Ydvx70/RVisIpgb3v+fUhcp3nVAY2c
	p2TBVfDip0WhL26m08ROELQVDpGS9UEijsuhDnDNeGaSeSh9irVG+dpPqY5n0BiLq/AJfv3bjKrrX
	N3aZEKJw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwZwu-0004tX-Cv; Tue, 05 Jan 2021 00:11:44 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwZwp-0004rR-C6
 for linux-mediatek@lists.infradead.org; Tue, 05 Jan 2021 00:11:40 +0000
Received: by mail-pf1-x435.google.com with SMTP id 11so17371889pfu.4
 for <linux-mediatek@lists.infradead.org>; Mon, 04 Jan 2021 16:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7/v77AqgrMzkwzQQTGKpTGxdqW9oGp5KYpVYy7kh1q4=;
 b=Sh2QNYnFVLm66LLE/NRrCsYm6K+V7cqxcLXJQdK0nbWRlyqnPhKNJCd+VP46gGIAew
 Z6SJrMwpH6av/bcG2c2k4AVBZnuOn3O8+pYRFTgPQMQYmNOqjvnq4zphPGnzWJTFNUv4
 QDDKcIKA5illa9p9/gBciNAIE4PQa1+a+IQ90=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7/v77AqgrMzkwzQQTGKpTGxdqW9oGp5KYpVYy7kh1q4=;
 b=uMN54Q/JQ+yJTR/9BNsmRiMHtcm5d1YFI1TvUnCuIUEHWZwXmlx4toDBo1imUAcusI
 duDDutAe0hF8H9c5E177VhYPfzuyBe7Bk//k9mUr6gLczc7GVss9jf0JHRSOE3xNsf9v
 f/kGuSLowDyUAZ1nz7ssFzKhAFIynSqFWmbS/xhfBawGE7lowOqPQ9knlryHsarrx+FH
 7Fn1g1+R8/folguyCCRsCO3iQ78h8kmjNWPpfR9L4QsTdX2ovEj2591R19j6egtRrUu4
 MxPUtEyHBUFNiCM8u+MuPSHfyzXS9gyin/2BOv4rDpTmm5aRLZqEub2q0yv8Bvwaowno
 NMWA==
X-Gm-Message-State: AOAM533AYUXAA7B6yvp5buc1qO0qb7chb4qLe+E+HEZIO2mVB3qRmbfb
 3HJCtc/hmMQocDZjJPLo09tDgw==
X-Google-Smtp-Source: ABdhPJxkNI6YhhXcss6CNMdwQnCEzvBGE+2IcCkAaUXDa0sz0L8xl9gQxdRMrsz7vQxZJMP+MP9oAA==
X-Received: by 2002:a05:6a00:212a:b029:1a8:6d7b:d62e with SMTP id
 n10-20020a056a00212ab02901a86d7bd62emr67292556pfj.23.1609805496547; 
 Mon, 04 Jan 2021 16:11:36 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id bf3sm465620pjb.45.2021.01.04.16.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 16:11:35 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v6 0/4] drm/panfrost: Add support for mt8183 GPU
Date: Tue,  5 Jan 2021 08:11:15 +0800
Message-Id: <20210105001119.2129559-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_191139_471537_C6317754 
X-CRM114-Status: GOOD (  12.65  )
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
