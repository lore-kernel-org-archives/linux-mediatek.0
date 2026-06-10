Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B19CD8CB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jun 2026 08:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dDEOB4zDGGA532YGopw6vfAouEtuG7p7cdbO9K1VfZ0=; b=c8z1SuGxsmyrDLLBTHkiIoFXCX
	s6kF0fK6pTdgZ6aJucfJaPByHMBsLIW9PBJW5xmCMFhJ00vtSaE7NkV6OeJPNqHkgszQFXI50XtSa
	XWq20W1thJR5r6mRJoj3kuR/cZFfmax7MjYIyxxAYFOvyf5wzlznKBQBY4XgdeVYi8jWxz8zfUxLB
	yGNqeFTiz7x/e8MA9lIsUEdi8vI04RQY2FXNgFTSq6l2zaRfqJMNSyJ/J2y2amGFv9pl8DqPMYWsG
	BfJYUqVNItfcTVJ8xMunXTfT5zzoKkabkXUKySFhs5to6sblKetVpIXYaV2o4oT4u1hGipmTBzsWL
	nNhE76dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVD-000000075Xe-2Xrq;
	Wed, 10 Jun 2026 08:41:35 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEVA-000000075Un-3iA4
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jun 2026 08:41:33 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so43522055ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jun 2026 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080892; x=1781685692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDEOB4zDGGA532YGopw6vfAouEtuG7p7cdbO9K1VfZ0=;
        b=LUCph/g8hfSt2vrXy7gQ5ZG0jFJHwdsLDrwmRw98euoTAKgi7kwLre3noZZ8iQogC8
         p36soucduNYAXsCiqjDtXfa0kvLL0p5EZscO8xgJlHQyxmMVGdwhK6Tw0WGNZG7V5dxC
         PQY9i0GNDuLAZ9wINeaieVkvF1w5f+FCab0zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080892; x=1781685692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dDEOB4zDGGA532YGopw6vfAouEtuG7p7cdbO9K1VfZ0=;
        b=F8Un4ctA5QM2gfxY0Gkud30IOEWoZiHCgE9Ri/P4Q+1wFDTN2DxBD71G/0CzH+zIL1
         3DNoSeh/T11X2MfB5Q1SckZtJv1bQmsiTpqmfSa4YRnCXOGxBw7y9tKFbYINBGz8XqTu
         6EC5UlKpEM5ghDHO/DR7sKH9YIE5xIl1QP8K+SuoYDgZAagMtgWFQuaCYU/ZJgQX0GDw
         m0t0t9l0MOrkqM55OKu1vDw35UscZB7MaoFQ2WQv3+KqMaCprRgwQCjWqjc7V8k7cMnE
         +Cd3+YJsi14PTlb9yWkR+WcmXzMsC6AF8i1elMPCSINmb9BaCbKCqM3T9J0bCZDjz4pH
         Hylg==
X-Forwarded-Encrypted: i=1; AFNElJ/qYG4TGOCaYC2/ukR1tFnk9wYG4UFS+4da6xqWKNZVo2ykebEEKjqghWNgErbWFB+AjFOI+RxjVE4X7eW4ew==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywx9LFhob4NUMi3lKw529UhoZYPcMilTj3Fklgora1hQZBdTn1W
	kslHHq0ghBcsbezg4P/I+0h+QtV1kHRTiIOYCa+xAxtOCynz0rkKU7ZJNT3bLd2YuA==
X-Gm-Gg: Acq92OFbsp7HLY4KHtbKNc9q1PdZR1vPycVxypDbYSv5Ulmr/ZPAmlAmZBiHtrL7Fw7
	l4Q0+jWn0WFooSL8tloM/ju9hEbhrxD0Z8P4sWMCWkQLxVYHyQ/wKqiFinv+3BQ8pBorZJ2KYL5
	64wllOHELuQHpPPEHdTPn0uUAUOZn5vxDDikeuI4hUp3t98Ey/DBMy3y8pRlYaDx+4Hqt51oVvj
	TL2eGUdAECVQ0rleFu85DOo5igqfo99hZSYdxJ6xVx5l5UL+uJt099eDHyzahf58cArqR2n6yWe
	aNd+l94au0wTUOF+KBVeEjtlEuTl5DYVHxxugNeIEwg1S5e63EsoNgJE/6S00QjB0obgVY/m8V3
	jaBwjUsdV7PUi+4ti8mJZUSxkW3xWKB61bay7b3/9A43VhZb9VYGJ5o6oMjAxvqXEhvL3db5Ump
	AmACP1PIk9WLqt1TC7Czjx3E/iIvmw1aJuVCohp5nsd392F/jEwHAPEQGrL2f/+iRKwAPMXH6p8
	H36lPQe3wVFLsHPLw==
X-Received: by 2002:a17:902:e74a:b0:2c1:8fea:4dbf with SMTP id d9443c01a7336-2c2a1bafeb4mr79293415ad.8.1781080892355;
        Wed, 10 Jun 2026 01:41:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 03/16] power: sequencing: Change CONFIG_POWER_SEQUENCING to bool
Date: Wed, 10 Jun 2026 16:40:37 +0800
Message-ID: <20260610084053.2059858-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_014132_928675_E4833AD5 
X-CRM114-Status: GOOD (  11.94  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

USB support, including the core and hub driver, is bool, no modules. To
be able to use the power sequencing API in the USB core, the former must
also be bool to avoid the latter being built as a module.

Change CONFIG_POWER_SEQUENCING to bool.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index 1c5f5820f5b7..27448fba9dc5 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 menuconfig POWER_SEQUENCING
-	tristate "Power Sequencing support"
+	bool "Power Sequencing support"
 	help
 	  Say Y here to enable the Power Sequencing subsystem.
 
-- 
2.54.0.1099.g489fc7bff1-goog


