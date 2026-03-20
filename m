Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879E7109318F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 08:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XLA7+O4naI3deHzrbL/7xXnsE7GTOurmxvnrea6kDcM=; b=yscyH6d1AdVhqMxfJ0uilyl4At
	p3Ly9lTbsZfDWWKyqE8CUdT8yHlZ9lc7cmVQLRjIgy2wL1uVVWOAL3kRqiU7x+swsdnPO8jpB8j53
	8VbgxwZw9Ie7BlTonadHdaErhx0ObGLuFwIR+tUeZFFHwMjq9i9vcagueEr8zZM+AewwJoYOcX9FV
	b6bFRbSyBTLgWgCRM/akUQtSinnIWKzFWg5uG+XjkA4XSphMxikCKyez9EOt3EiHiD8AJXcZvBJB3
	3qgKvdzApLah6vWwn5a/2eP6mvYWU2+1K5e/u3rr1YOdZFHoExz90gmd5offaonNqb+bhrrOQd77B
	459oVjQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSd-0000000CNav-2tbQ;
	Fri, 20 Mar 2026 08:44:03 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3VSa-0000000CNZH-1Qwx
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 08:44:02 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b04fc8851cso17199035ad.0
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Mar 2026 01:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773996239; x=1774601039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLA7+O4naI3deHzrbL/7xXnsE7GTOurmxvnrea6kDcM=;
        b=CtxZc59OW6zIsaATtxp4E/6vPh/GZuM070MDXG6y4FbDj3PcutST9B6XpBdkEayIFy
         +fAUbfus7lzYFrEO4v6xjyUPI+PUo/irWnRnQ9etFLA5WrSjzteKhQXpZHZR8wChlJ/K
         CofFSUcJ6k5yP9UNzcigPar+Ui5hb7mvgmEZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773996239; x=1774601039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XLA7+O4naI3deHzrbL/7xXnsE7GTOurmxvnrea6kDcM=;
        b=F2HaMXiXDTLKceBPup+38A/nSAHiwg7tG4dSpd7uF8d5jLWAlVDKsfIccfLhTKI/2H
         uTnwToEMSMLDIT4SVaSTHDJodkXGg2QHlbiGPTEIozxcODvBYHyyee+0+pXR6w4vWWfq
         Fv7YiVJRDN1YwmrUPeMOX1RATp8XYigsCL7EhTHZEjw9XrQbQ5dWTXsqL5LKsHtXzBkr
         DfC+dmL4IWGrxahwYVt2d8pT5oOptsX/YIYbhes63sh9EUkj7W1M7nB6iCc+rLN1MTmV
         smSGMcNLr5ForV+kQdy//J6lBD4sRdEVJ8JKUfdXdbEPa7MzYBLnmQoCnEeB3MXBf5WA
         Me2A==
X-Forwarded-Encrypted: i=1; AJvYcCXu/iDK4Ckkx+TwQKPCH2e5rrCcTUAzuCH4kWpK40GAB8ReTGthnwjA1cBN+cPI1IW/1Ad6jtPI+xTr/DAvxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzF+YrwsDKD3h3cWMZ9gLuS8+zCl/vWdujVwWC3wcV2UUvGEnJo
	PfTyiFez+LmQqKNG1JLF3hPzQo/vOBRKmxE81q7QJ+PsuCBhnC3UOfBeFsTPPP8vmw==
X-Gm-Gg: ATEYQzz5oU7cZ2RTbrmwFiOcJW5ePUn0PdHl7enCqKQSkKyFo+CJkisaEUsaOlNSZtf
	rSlSlgC6s6k/j7xtgAOeXm0v6AJ/mZZjfjdRcQ+YpZikOAjf3GDjc2bU1MQgP5OtjOM6B4gj9lR
	WNAI81XenSIX8OmcyBXuhquvcHtomiv1dTfPzLqHs9bi+FvljJnXGNdEH0MihCpkNGz8jv6wLw4
	1v+84pW85rDBAnplKr65JbrKhBUdopVlmuS/lsOZ21eHbVIBbU/WXulDXB4nGs9EjMqGABOPYWE
	CEYV2EBKqAmFC95eg9KKnYize2nkp1wqMVsdcY4pPrSOgHTUdyGU9Vw/a54Oucjn5ie8JOxQD11
	zGPzrSNYQneMCr437gvCBEo51mRi3lyLKoAQgxW0Kj3Z8fodx4J2EWBiAaoanWkRlzXH8UWt7br
	xzEB3lG6GNIV1WmkEhcOEBajTGBfI0+H2fDTdH7owGHD8FWMAiX1lLGZWsw7ToHTEYabhYdyzol
	UsgVCXa
X-Received: by 2002:a17:902:d541:b0:2b0:5cb3:e4bc with SMTP id d9443c01a7336-2b0826f6b0dmr20672295ad.16.1773996239541;
        Fri, 20 Mar 2026 01:43:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9cdf:e932:6f2f:c654])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0836a3066sm14917905ad.75.2026.03.20.01.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 01:43:59 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: arm64: dts: mediatek: Regulator cleanup for Chromebooks
Date: Fri, 20 Mar 2026 16:43:32 +0800
Message-ID: <20260320084351.2461060-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.959.g497ff81fa9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_014400_415401_3C15BE3B 
X-CRM114-Status: GOOD (  12.25  )
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

Hi,

This series contains the device tree bits for the collection of regulator
related cleanups for MediaTek Chromebooks. The device tree binding and
driver changes are:

MT6315
- https://lore.kernel.org/all/20260320072302.2402489-1-wenst@chromium.org/
MT6359
- https://lore.kernel.org/all/20260320072440.2403318-1-wenst@chromium.org/
cros-ec-regulator
- https://lore.kernel.org/all/20260320083135.2455444-1-wenst@chromium.org/

The goal is to complete the regulator tree so that there are no orphan
regulators, and there are no devices that are missing supplies.

Patch 1 drops the bogus regulators from the mt6359 dtsi file.

Patch 2 adds a label for the mt6359 regulator sub-node. This is used in
subsequent patches.

Patch 3, 9, and 12 add supplies for the MT6359 PMIC in various
Chromebook designs.

Patch 4 and 10 add supplies for the MT6315 PMIC in various Chromebook
designs.

Patch 5 adds supplies for the ChromeOS EC controlled regulators in the
Asurada design.

Patch 6 and 13 add power supplies for the CPU cores.

Patch 7 adds the power supply for the SPI NOR flash chip in the Asurada
design.

Patch 8 and 11 fix up load switch descriptions.

Obviously the 3 dependency series need to be merged before this series,
or we will get a bunch of new DT validation errors.

Please have a look.


Thanks
ChenYu


Chen-Yu Tsai (13):
  arm64: dts: mediatek: mt6359: Drop ldo_vcn33_[12]_wifi regulators
  arm64: dts: mediatek: mt6359: Add label for regulator sub-node
  arm64: dts: mediatek: mt8192-asurada: Add MT6359 PMIC supplies
  arm64: dts: mediatek: mt8192-asurada: Add MT6315 PMIC supplies
  arm64: dts: mediatek: mt8192-asurada: Add supplies for ChromeOS EC
    regulators
  arm64: dts: mediatek: mt8192-asurada: Add CPU power supplies
  arm64: dts: mediatek: mt8192-asurada: Add SPI NOR flash power supply
  arm64: dts: mediatek: mt8192-asurada: Fix WiFi regulator description
  arm64: dts: mediatek: mt8195-cherry: Add MT6359 PMIC supplies
  arm64: dts: mediatek: mt8195-cherry: Add MT6315 PMIC supplies
  arm64: dts: mediatek: mt8195-cherry: Fix VBUS regulator description
  arm64: dts: mediatek: mt8188-geralt: Add MT6359 PMIC supplies
  arm64: dts: mediatek: mt8188-geralt: Add little core CPU power
    supplies

 arch/arm64/boot/dts/mediatek/mt6359.dtsi      | 12 +--
 .../boot/dts/mediatek/mt8188-geralt.dtsi      | 45 +++++++++++
 .../boot/dts/mediatek/mt8192-asurada.dtsi     | 75 ++++++++++++++++++-
 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 28 ++++++-
 4 files changed, 145 insertions(+), 15 deletions(-)

-- 
2.53.0.959.g497ff81fa9-goog


