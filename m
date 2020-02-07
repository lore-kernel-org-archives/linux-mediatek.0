Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A8FC352A2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 05:27:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A7D9522B48
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 05:27:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dGEWR7FN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iHfAblZm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A7D9522B48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BvQwmcQneGKICLE5WOT5MoWRvtBJId7gzIAXmF/JxAU=; b=dGEWR7FNPveQ9g
	MgOAq92cp3H8FdC5rsL7BUSBgZeVmiLmToXtHQ/Yhch+h6PiY7WQysE2M1VN4m09Nty95vFxbJrtF
	d+xyco+L/rBmp9lVhXKhvgFWPKicbq1jS9VnHOKAPExZoWRQwLYPxCqsRiozJr5KEB04X64n/1XqW
	0fHz8BMIt3bgK+z/02+L1MpmHYbDUJYl4tg8Ijx7xItV8U1ygEGGJoLat4Fcz75mOdTzs9KRpZG41
	mfQ5g3U8Cglx987tUi6cBSjcCuaL+lHvzyhM8VAyKQkF/I+zm53iNn47sfbe9XYNwh7bnoOv8EFW7
	wA1/6Z8wwR++lSe2t2/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izwAG-0006x0-OJ; Fri, 07 Feb 2020 05:26:52 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izwAD-0006wO-OD
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 05:26:51 +0000
Received: by mail-pj1-x1043.google.com with SMTP id e9so429500pjr.4
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2020 21:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/zB9xLJSCEmcEROv88A82DPGekOIdz0Re4N4EUvv7YQ=;
 b=iHfAblZm+66QNJpVWC8jKplx2ZNZqjZfzjQmcBKuD+0bxVGGTQ5lOzM36vtl1ggI/y
 BOf4sQDqdKsGpwT3fK2xC4db5Y6c9+OsKKLAZoyvCpfNiMc7AWpgFmE6LjIs8qtiPXfQ
 m1bMLy5a60UKdJJA50YccQmyGqBD0HQibNMpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/zB9xLJSCEmcEROv88A82DPGekOIdz0Re4N4EUvv7YQ=;
 b=beqNtF4ogfm1gY+C9YIWuZdsIMPTermBnFe1mOeoiVegVnvz7D8UbbLJV4o1u8I7Wd
 gkSgsniSX46pEutAnPjzVz+YV35F8+M6+67y74osnjO7dhweqkR2jivy9RvywFIZ0FeB
 9j93btJvF0hrB54EDhc68eemEewHhEGoC1L/VXE8quZTRkmkXiQS3yDWc0rRFa7OyMDV
 V4Zu0R6X7nbrYgNlFMUiimTGzqVLJCx+uy76wG2FNVIUSsMWuytA7qk8CMdE/I7EpIQM
 0j7ogAKiurcF1vhwp5ViMaH/tO8mdE/LiS6vvJzX0rY6pti0LN68kVhw5USew8h+vkDk
 nc8g==
X-Gm-Message-State: APjAAAXfKUKMPJjO/0QxKAm7suyC3pJlxhkeZwTNePJV3GrMyZP6KKv5
 o5TC/7LmDjqasaENZ2Yt1fex4w==
X-Google-Smtp-Source: APXvYqwDhczmXZwMAxUZru60y6Afvx+soks2DBAlo9PuHeMARGx+nULMRNQyK00qlg2Fi3ADU5IOrQ==
X-Received: by 2002:a17:90a:a48a:: with SMTP id
 z10mr1822467pjp.52.1581053208716; 
 Thu, 06 Feb 2020 21:26:48 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id i66sm1174485pfg.85.2020.02.06.21.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 21:26:47 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 0/7] Add dts for mt8183 GPU (and misc panfrost patches)
Date: Fri,  7 Feb 2020 13:26:20 +0800
Message-Id: <20200207052627.130118-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_212649_810994_FD7A8F3B 
X-CRM114-Status: GOOD (  12.16  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 ulf.hansson@linaro.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

Follow-up on the v3: https://patchwork.kernel.org/cover/11331343/.

The main purpose of this series is to upstream the dts change and the
binding document, but I wanted to see how far I could probe the GPU, to
check that the binding is indeed correct. The rest of the patches are
RFC/work-in-progress, but I think some of them could already be picked up.

So this is tested on MT8183 with a chromeos-4.19 kernel, and a ton of
backports to get the latest panfrost driver (I should probably try on
linux-next at some point but this was the path of least resistance).

I tested it as a module as it's more challenging (originally probing would
work built-in, on boot, but not as a module, as I didn't have the power
domain changes, and all power domains are on by default during boot).

Probing logs looks like this, currently. They look sane.
[  501.319728] panfrost 13040000.gpu: clock rate = 511999970
[  501.320041] panfrost 13040000.gpu: Linked as a consumer to regulator.14
[  501.320102] panfrost 13040000.gpu: Linked as a consumer to regulator.31
[  501.320651] panfrost 13040000.gpu: Linked as a consumer to genpd:0:13040000.gpu
[  501.320954] panfrost 13040000.gpu: Linked as a consumer to genpd:1:13040000.gpu
[  501.321062] panfrost 13040000.gpu: Linked as a consumer to genpd:2:13040000.gpu
[  501.321734] panfrost 13040000.gpu: mali-g72 id 0x6221 major 0x0 minor 0x3 status 0x0
[  501.321741] panfrost 13040000.gpu: features: 00000000,13de77ff, issues: 00000000,00000400
[  501.321747] panfrost 13040000.gpu: Features: L2:0x07120206 Shader:0x00000000 Tiler:0x00000809 Mem:0x1 MMU:0x00002830 AS:0xff JS:0x7
[  501.321752] panfrost 13040000.gpu: shader_present=0x7 l2_present=0x1
[  501.324951] [drm] Initialized panfrost 1.1.0 20180908 for 13040000.gpu on minor 2

Some more changes are still required to get devfreq working, and of course
I do not have a userspace driver to test this with.

I believe at least patches 1, 2, and 3 can be merged. 4 and 5 are mostly
useful in conjunction with 6 and 7 (which are not ready yet), so I'll let
maintainers decide.

Thanks!

Nicolas Boichat (7):
  dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
  arm64: dts: mt8183: Add node for the Mali GPU
  drm/panfrost: Improve error reporting in panfrost_gpu_power_on
  drm/panfrost: Add support for multiple regulators
  drm/panfrost: Add support for multiple power domains
  RFC: drm/panfrost: Add mt8183-mali compatible string
  RFC: drm/panfrost: devfreq: Add support for 2 regulators

 .../bindings/gpu/arm,mali-bifrost.yaml        |  25 ++++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 +++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  17 +++
 drivers/gpu/drm/panfrost/panfrost_device.c    | 123 +++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_device.h    |  27 +++-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  41 ++++--
 drivers/gpu/drm/panfrost/panfrost_gpu.c       |  11 +-
 8 files changed, 326 insertions(+), 30 deletions(-)

-- 
2.25.0.341.g760bfbb309-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
