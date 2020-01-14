Return-Path: <SRS0=z6AG=3D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DE03C33CAD
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 07:16:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C01E0222C4
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2020 07:16:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XFP9wuG3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L0iyokzQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C01E0222C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8+bInoM+Yyu5wneqE3GQdHD7+MnYyHGzie7gpD5zaj8=; b=XFP9wuG3Ankvqb
	/4MTwOzkKAUOeC9vFlIGXYKqGTjz23fHwk1xXO/fxRum9Erl5S60T3zOs8dLvz8N9bVyKLi/+5zuK
	V4Mnb0elaSFwqJn6dNbm6CP/BJIv9nV8uApqnBFee935puqmO+G8gyL5E4e0N8qUfMVUrZ2mBf4/M
	X+swkSGTjX2AHxQq3BFaMdyyO2sex+ff0hrvKy/6NLPxmiUdlwsOtIU6lIbIeiCk2kmYba6Useoet
	vfKnh3kftOm2u+v2kKBzOOAnsCvo8mXVDSIX1XunvaFC7JpfWikQtWTe3lwBASt+Vp9hUiotS1IZl
	AUEZbtso15huAU9saQQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1irGQu-0003oq-6X; Tue, 14 Jan 2020 07:16:12 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1irGQr-0003nA-BJ
 for linux-mediatek@lists.infradead.org; Tue, 14 Jan 2020 07:16:10 +0000
Received: by mail-pg1-x541.google.com with SMTP id b9so5945319pgk.12
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2020 23:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PgN1A3/jcSNW9U7ZQPj+hV6TF/FYO27/H6WZlglC4Rc=;
 b=L0iyokzQjznU7jd7+4yRIjZG4W+Kh/QVfHxO9R/YomTTvZh7b8xaC5TCZUUYDfVDXN
 P2IwRlrn+TbuhVEJfj6oijTp7NO3dd3UJHVeEFZdgB8J3r0aXarKK7Nsjb9D57P/urEw
 WzCncn51xRlztqYXPBSbDrfgKBb5vo2D7zGwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PgN1A3/jcSNW9U7ZQPj+hV6TF/FYO27/H6WZlglC4Rc=;
 b=LiVdHJy3Bz+mxH9Kl9yq6UYjNlmdXckEqm+31XkiztHrqugliSWSH4s1+IR3XgMP1x
 d8iAHQKTFe2KpQZQgwmkmDgsTikzZOocZ6mdCzh5kHbKejPWGPZvmTz3AFpdoxNY3nc1
 uphodmqWuz0ixuurIZjyvt8zpC1G6cktGA+OnFE7S4ipz5rjDJDb53GM3LIkMeqK+vzA
 iiq84PNaRQqhoct1q+4uHu9PBmeS4HDIDChIm+N0wi35Niy4XwleNQwoSdxsbT3MoxNN
 29jA6otNVSUACby76DGAkte+13freTeG9cH2hVEJbKhlK3g0RwdH8U3AYmsbI7L18O1o
 euVg==
X-Gm-Message-State: APjAAAVhFsKL/bktD655VdtgNkozFqS46zrn8TatmOw6CSoiL4K/c1en
 S18p6rB6yXehaMCWy1v5w23Ubg==
X-Google-Smtp-Source: APXvYqzMqBBdzwBKGKEOl+Tc4G0Gj7LZPgMyixK0fqjyI+joZwzSNKerDHvLgKupoGqp6US/0o9C2A==
X-Received: by 2002:a63:ed4a:: with SMTP id m10mr22776522pgk.99.1578986168173; 
 Mon, 13 Jan 2020 23:16:08 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id b4sm17092976pfd.18.2020.01.13.23.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2020 23:16:07 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 0/7] Add dts for mt8183 GPU (and misc panfrost patches)
Date: Tue, 14 Jan 2020 15:15:55 +0800
Message-Id: <20200114071602.47627-1-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_231609_415159_C4BF80CC 
X-CRM114-Status: GOOD (  13.67  )
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi!

Follow-up on the v2: https://patchwork.kernel.org/cover/11322801/ .

The main purpose of this series is to upstream the dts change and the binding
document, but I wanted to see how far I could probe the GPU, to check that the
binding is indeed correct. The rest of the patches are RFC/work-in-progress, but
I think some of them could already be picked up.

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

Thanks!

Nicolas

v3 (see individual patches, too):
 - Match a specific mediatek,mt8183-mali instead of the generic bifrost,
   as this instance requires 2 special cases:
    - 2 regulators
    - 3 power domains

v2:
 - Use sram instead of mali_sram as SRAM supply name.
 - Rename mali@ to gpu@.
 - Add dt-bindings changes
 - Stacking patches after the device tree change that allow basic
   probing (still incomplete and broken).

Nicolas Boichat (7):
  dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
  arm64: dts: mt8183: Add node for the Mali GPU
  drm/panfrost: Improve error reporting in panfrost_gpu_power_on
  drm/panfrost: Add support for multiple regulators
  drm/panfrost: Add support for multiple power domains
  RFC: drm/panfrost: Add mt8183-mali compatible string
  RFC: drm/panfrost: devfreq: Add support for 2 regulators

 .../bindings/gpu/arm,mali-bifrost.yaml        |  18 +++
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   7 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 104 +++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |  17 +++
 drivers/gpu/drm/panfrost/panfrost_device.c    | 120 +++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_device.h    |  25 +++-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  38 ++++--
 drivers/gpu/drm/panfrost/panfrost_gpu.c       |  11 +-
 8 files changed, 310 insertions(+), 30 deletions(-)

-- 
2.25.0.rc1.283.g88dfdc4193-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
