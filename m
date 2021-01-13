Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D4DC43381
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 06:08:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5223223138
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 06:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5223223138
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CcNmerwJD5OGPvAMZHY7SJsdB/Dwcg8X652ZXXO+LIM=; b=HVqKHJr3YKmnvv/diHrBt9Tkfq
	yNS6WCKssy7blkMx2QVPE3PWOqbfyX0TkDTVC6hHP4JzMB21LlMT0kCh7KkadU/4YrjFMVoRaKrrT
	SBHv1yfctE5GCk45hi8w1UqS53O5AglelIXxAPG1coF496mUNS5pWjtOcgd5dP1UDReU7JN0hLyC5
	0Jn1a4UlN0mWMRseKymvGJ6GboA0IoWynZ+39Axz9xsq74v70exYmdOCPwVEnUjKgSzLC9HBOCdUE
	EpOLtcQd6zQTC0ydn/+2yaAY27mua8hkvR0AHub5UdpoTsyJbaIQ+sJ0CTSM/oiMHcEYwVquMDlwi
	2ZlvALZg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzZKE-0001n8-Ux; Wed, 13 Jan 2021 06:08:11 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzZJi-0001T0-Us
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 06:07:40 +0000
Received: by mail-pl1-x635.google.com with SMTP id r4so465758pls.11
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Jan 2021 22:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bzQFE72I/JmdqPXm3sPTdt50Ied3UyCVZBo3EP9qpfA=;
 b=ZUtRg0A9O8s+bnqw0Z0boHhOu5ZFztEcCyW2vzpZb//xumrTqsqWGdLgzXO2RUL5D0
 jspQOLHArKkE935wTfyOxk67UvxMWhy39dnjrc/D5vmeZ+VXpg6cJx1j8UHTpuQxfkg5
 A3/6oiSUjlKmYmSiGwI1yUQtpxEYajq5rRM4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bzQFE72I/JmdqPXm3sPTdt50Ied3UyCVZBo3EP9qpfA=;
 b=N4XzlKkuyFF5qYuGWoy7CiN4JmpwTBorRnbX99beldIRAHDhyXsVLWzw/Z3WbTxySa
 S0seafz2kLTblSwRZJ2A5xQFihLFYUl5m3HhUAZFOdrhWQUH2BRMrR12rnwEmeGWjbJ4
 rKQ+UHziaRfR4dbjwu7JsrnQSXe0gyjWVghEzsYZzTqvLos/0aRkKlVyuZeyLlJSnSd5
 /jqZ9sdzhHtKJpBNgiaXqaAsSXkbE0kUAiCQJ8ROQNZqtd/yvFHMJ1GZSydKOgW0u3yM
 UzICogaL3cZkGWek4fwQa5lKYLkDg+jhDsqiFgmq1nI6YRgzsWGKEdYx7L3IdJGoYFfK
 yhsg==
X-Gm-Message-State: AOAM531RExOq1YQIT/JW0gjsKB1WallyFikXgxIqXWYnNAZca443Ybnu
 lm2leEmsd/Jvwz3n6an0gqc3iQ==
X-Google-Smtp-Source: ABdhPJzIdxN35cPgniUhcyI4MVs69RfBwzqd5PIpdwLqbpEFIo+PblIarGAgVlOnSt+WY04srbGQiA==
X-Received: by 2002:a17:90b:350b:: with SMTP id
 ls11mr558246pjb.166.1610518056830; 
 Tue, 12 Jan 2021 22:07:36 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id y21sm1263556pfr.90.2021.01.12.22.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 22:07:35 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Subject: [PATCH v10 0/4] drm/panfrost: Add support for mt8183 GPU
Date: Wed, 13 Jan 2021 14:06:59 +0800
Message-Id: <20210113060703.3122661-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.30.0.284.gd98b1dd5eaa7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_010739_088426_E8A225DA 
X-CRM114-Status: GOOD (  13.06  )
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

Nicolas Boichat (4):
  dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
  arm64: dts: mt8183: Add node for the Mali GPU
  drm/panfrost: devfreq: Disable devfreq when num_supplies > 1
  drm/panfrost: Add mt8183-mali compatible string

 .../bindings/gpu/arm,mali-bifrost.yaml        |  28 +++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   6 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   6 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   9 ++
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  10 ++
 6 files changed, 164 insertions(+)

-- 
2.30.0.284.gd98b1dd5eaa7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
