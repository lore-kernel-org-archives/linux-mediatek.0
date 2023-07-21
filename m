Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46264C04A6A
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Jul 2023 08:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gANVBGVeS5MlGx8TPeBiBkdc2Y9+xr4fJVm3EzJWyww=; b=lsWTWYxLpzzo53w/kaXMrro9Rl
	jEZXQBlZvqY0Zgt33asJsI28RPeXIjOjHMHKNtIXF/Z1JYF87BfSTvOFNbQwwWlmBt4r0WwzTFH3l
	sKeaJNmDZ1P81tQ1DDk2G1BT+SnCsOpmC9eIkEJcntKyvBHBr+sZBvYXS369PBB1Na4aED9rtTU1j
	jqOzyZX7wRibAuwaQ4SHnMB4SXlY5mfV6wgnRX/HeDkC832xKIiwclTxaohBafw/wC2pFxIa8rSWg
	BMmmH6g312+EJjtUl3rfwUgQszhZVXA4UhOFQwwcI0UmCqSpdDYoxOmGQi7K2GaNMYa2AQWqhYhnn
	VjBbVqtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlBb-00DJLv-0m;
	Fri, 21 Jul 2023 08:08:27 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMlBS-00DJDA-00
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Jul 2023 08:08:20 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b8b318c5a7so12507865ad.3
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Jul 2023 01:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1689926885; x=1690531685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gANVBGVeS5MlGx8TPeBiBkdc2Y9+xr4fJVm3EzJWyww=;
        b=RVPAoXsPVmL4Vaqkq73MwUfnz+QtYfW/n1CFqxFmm48Qlk+2O2xtNhGZEXSZ7QqcIx
         6xXgKb2wgOiiSdtN2o+guY0PKD0Kq0oKWmgO/izgFTQ1ydKkGXfTL8XbjzMAsG307GOE
         m+wWLbtDmieNJ780rhZfFPwtDB6Zu6ZtjsFdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689926885; x=1690531685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gANVBGVeS5MlGx8TPeBiBkdc2Y9+xr4fJVm3EzJWyww=;
        b=cDF7BERm8m5NPAVLy+VffgD3ZB4GreGcvBdPk01SICEwKgUDdpZlRwxJc4bS6JQpII
         sEt6joKOZnQlB7ypC0I+fWCrfSDDZipDc7mUzhsddaQ9lsfS5gZ1ijyPGsImjv+X/F1I
         AfUhQkqhGSU9pcemL8gWBECVf7n7NJ/0NOGhEi874w4KBn9XN84iirSEgCczR8OkQL9+
         OY1U27t2LYm9eBDUHtQkFeK72+ZVD0O7+FHEzihwglEij27yijgKcAdBFbO5lgx0BSKP
         1IUgcI6LdR7iw5KZAmAuAnhVOYy2VAfJ/b/0F4o8a3EWKe3VMReX1Hle2ESPDAJ16q5c
         yViQ==
X-Gm-Message-State: ABy/qLZe8H91OZsWFcbfxU4NXE40wyQ9sMKqLmy9E+sRiU8eTbluJyrM
	/emahCcQDQsxkqHrrj8Khx1gsQ==
X-Google-Smtp-Source: APBJJlHM9fyRUAQV7azReyM4HeiWFwiXZKUnthfAeikOCX3eyzp/KHFna0Ty3wlhzS1RY9iW2fsdig==
X-Received: by 2002:a17:903:2341:b0:1b9:d335:2216 with SMTP id c1-20020a170903234100b001b9d3352216mr1709996plh.20.1689926885282;
        Fri, 21 Jul 2023 01:08:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6d86:d21:714:abab])
        by smtp.gmail.com with ESMTPSA id o10-20020a170902bcca00b001b850c9af71sm2740294pls.285.2023.07.21.01.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 01:08:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] regulator: mt6358: Remove bogus regulators and improvements
Date: Fri, 21 Jul 2023 16:07:41 +0800
Message-ID: <20230721080751.2012318-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_010818_039704_800FE870 
X-CRM114-Status: GOOD (  22.41  )
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

This is v2 of the remainder of the MT6358 regulator driver cleanup
and improvement series. v1 can be found here [1].

Changes since v1:
- Merged patches dropped
- Added patch to move VCN33 regulator status sync after ID check
- Added patch to fix VCN33 sync fail error message
- Added patch to add missing register definitions

Various discrepancies were found while preparing to upstream MT8186
device trees, which utilize the MT6366 PMIC, that is also covered by
this driver.

Patch 1 should either go through the mfd tree and an immutable branch
created for the regulator tree to consume, or given an Ack, merged
directly through the regulator tree.

Spoiler: a follow-up series dealing with the MT6366 PMIC, which is
covered by the same driver, also has an mfd header patch that would
need the same treatment.

Patches 2~6 should go through the regulator tree, and patch 7 through
the soc tree. Patches 2 and 3 should be merged as fixes for v6.5, as
the commit they fix was just introduced in -rc1.

Patches 5 and 6 depends on "[v3] regulator: Use bitfield values for
range selectors" [2] I sent out earlier.

This v2 series can be seen as three parts. v1 also had three parts, but
one part was fully merged, and then v2 gained another cleanup.


Part 1 - Fixing bogus regulators (patches 2, 3, and 7)

There are some regulators listed in the bindings and driver that have no
corresponding pin on the actual hardware. MediaTek says these are a
hardware construct for shared control of the same regulator in the
VCN33 case and an alternative control scheme for low power suspend.

In the VCN33 case, there's only one actual regulator, so we merge the
two and rename them to match the hardware pin. No existing devices use
these AFAICT, so this should be safe to change.

The driver changes for this part have been merged, but two review
comments were not accounted for. They are addressed here with two new
patches

Part 2 - Robust chip ID checking (patch 4)

Angelo suggested making the driver fail to probe if an unexpected chip
ID was found. Patch 4 implements this.

Part 3 - Output voltage fine tuning support (patches 1, 5, and 6)

Many of the LDOs on these PMIC support an extra level of output voltage
fine tuning. Most default to no offset, but a couple have a non-zero
offset by default. Previously this was unaccounted for in the driver and
device tree constraints. On the outputs with non-zero offset, this ends
up becoming a discrepancy between the device tree and actual hardware.
These two patches adds support for this second level of tuning, modeled
as bunch of linear ranges. While it's unlikely we need this level of
control, it's nice to be able to read back the accurate hardware
settings.

Please have a look. After this series is done I'll send out patches for
the MT6366 PMIC, which is what started this. That will also include
updated YAML bindings for MT6366. I think we can merge MT6358 bindings
into them afterwards.

Thanks
ChenYu

[1] https://lore.kernel.org/linux-arm-kernel/20230609083009.2822259-1-wenst@chromium.org/
[2] https://lore.kernel.org/linux-arm-kernel/20230714081408.274567-1-wenst@chromium.org/


Chen-Yu Tsai (7):
  mfd: mt6358: Add missing registers for LDO voltage calibration
  regulator: mt6358: Sync VCN33_* enable status after checking ID
  regulator: mt6358: Fix incorrect VCN33 sync error message
  regulator: mt6358: Fail probe on unknown chip ID
  regulator: mt6358: Add output voltage fine tuning to fixed regulators
  regulator: mt6358: Add output voltage fine tuning to variable LDOs
  arm64: dts: mediatek: mt6358: Merge ldo_vcn33_* regulators

 arch/arm64/boot/dts/mediatek/mt6358.dtsi |  11 +-
 drivers/regulator/mt6358-regulator.c     | 314 +++++++++++------------
 include/linux/mfd/mt6358/registers.h     |   6 +
 3 files changed, 151 insertions(+), 180 deletions(-)

-- 
2.41.0.487.g6d72f3e995-goog


