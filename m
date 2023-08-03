Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3526C0015E
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 07:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9wcQgKLzUEDCQTRYm49e4K1eJ/gD3SsCDYx79kxO5Jk=; b=AoxZkKi+qxkN/cgJaOiya2wTqz
	fXpxOK1qauJZEOjAUB5UGEyZFsZAlUhFlNtemt6LHtfL3PS9aMlgSiD+1KdUPAkxuHfEYkfshXmRl
	2taEXNWA99i3vOzoQUFC7yS2v3TI3rin5rSEF3fMOMSjk6t+Yh6WL1u/5+IKkzj7pAoCp8xg3VZKn
	8upUtgYkHKl/nxRmldgS9CeLIYxnFPtFN2rsUDE5RTqwRUvkEoqVNJk8xiTeB/nOxwKsm+zj5Zd8l
	ThvxklUVxPjEH+DSxf/p1uikLz3RS8dBY++8Nnc54bTy+KZdZALrBnNxcUIrDbJYiF1lq9TYCcjFO
	PLHlmR+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSz9-006u67-1c;
	Thu, 03 Aug 2023 07:43:03 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRSz5-006u4R-2H
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Aug 2023 07:43:01 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3a5ac84718dso522608b6e.0
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Aug 2023 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691048578; x=1691653378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9wcQgKLzUEDCQTRYm49e4K1eJ/gD3SsCDYx79kxO5Jk=;
        b=lxmBti7naxFncDx+danzQeW9Ae4PH8ymvcBAYbncEatj2ordC1uXqCq1hQDn0J8Hs4
         M3gafNZz5gtrMlWOriWt+vk3Y1apTrzyGuPCr9/lJPtJzuFZsPG/eCGxFRbkpzMjM7+Z
         ND37OklDyGfg81mWexD/wxVQ59qyNmzpdSwqw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691048578; x=1691653378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wcQgKLzUEDCQTRYm49e4K1eJ/gD3SsCDYx79kxO5Jk=;
        b=VsxmVjMx8KiQByOn8LOa2o8MweDcWaLvwzYUhnW8km4wYsvFgyVM+0GYkLYDjrbE+i
         pMupqqTlrG/4cmldOEePE70r+BTbLKOVemThKCQBbmw04X1IGiQXDUG2qYIn0uvDy+Pr
         kPO5IhVmhuZdkNJo/heuoRo+F1yj7U1Vm48iS7lYGNeyt+hjEwtVp1v8n/+VoTrJhliQ
         eeKOnL/0evylbI1jON1OS2NTteak6HvzSrx5wEi4YyYc5pAqBpRLjYCNEgmPGOHb93UT
         5yCehkho50yrrwzA6emckUyhash1d1aiP4n90P5d+MsOVh0tg7mLdjYw3//PuHh0eIm2
         doig==
X-Gm-Message-State: ABy/qLbtGdEYHMQwLJViDthtCWSrRAUq3GzWx0AoZuj4hRi40NsPHuqk
	8Ujl2EtN8rxAdr1FFbn67eOQrtyHaVDE26mMSr0=
X-Google-Smtp-Source: APBJJlE6UT0T4AwfmsNqza3+1zBspZtZF++zc77ynB+tf5wLZLaPVCNPN77k7YeQhSxF5KVnRC7RGQ==
X-Received: by 2002:a05:6870:f623:b0:1a6:c968:4a15 with SMTP id ek35-20020a056870f62300b001a6c9684a15mr19659252oab.4.1691048578025;
        Thu, 03 Aug 2023 00:42:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:6f3e:66ee:db46:473b])
        by smtp.gmail.com with ESMTPSA id l11-20020a17090a72cb00b00262d079720bsm2095753pjk.29.2023.08.03.00.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 00:42:57 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/9] regulator: mt6366: Split out of MT6358 and cleanup
Date: Thu,  3 Aug 2023 15:42:38 +0800
Message-ID: <20230803074249.3065586-1-wenst@chromium.org>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_004259_776174_E14E9FD3 
X-CRM114-Status: GOOD (  18.93  )
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

Hi everyone,

This series splits out the MT6366 PMIC from the MT6358. The two PMICs
are mostly identical, except for the regulator bits. The MT6366 is
missing the VCAM* (camera related) LDOs, but in their place has a few
other ones. This thus requires a separate DT binding and compatible.

This depends on my previous "regulator: mt6358: Remove bogus regulators
and improvements" series [1]. The series is still in flight, but I think
posting this earlier would help get reviews underway.

Patch 1 splits out the compatible string for the MT6366 PMIC, so that
it no longer falls back to the MT6358 one.

Patch 2 adds new register definitions for the MT6366-specific
regulators.

Patch 3 adds a new entry for the MT6366 PMIC to the MT6397 mfd driver.

These three should go through the MFD tree and put on an immutable
branch for the regulator tree to consume patch 2.

Patch 4 adds new binding for MT6366 regulators. This was previously done
by Zhiyong Tao [2] from MediaTek. I cleaned up the patch based on previous
review comments, simplified the regulator names, and added regulator
supplies. Bogus regulators were also dropped, like what was done for the
MT6358 [1].

Patch 5 simplifies the MT6366 regulator names to match the new names
specified in the binding.

Patch 6 makes the MT6366 VCN18 LDO regulator configurable. This is one
of the differences between the MT6358 and MT6366.

Patch 7 adds regulators that were missing from the originally proposed
binding and driver.

Patch 8 adds regulator supply names to the MT6366 regulators

Patch 9 adds an entry for the MT6366 PMIC to the MedaiTek pwrap driver.

As mentioned, patches 1 through 3 should go through the mfd tree on an
immutable branch. patches 4 through 8 should go through the regulator
tree, on top of the aforementioned immutable branch. Patch 9 should go
through the MediaTek tree.

[1] https://lore.kernel.org/linux-arm-kernel/20230721082903.2038975-1-wenst@chromium.org/
[2] https://lore.kernel.org/linux-arm-kernel/20220823123745.14061-1-zhiyong.tao@mediatek.com/

Chen-Yu Tsai (8):
  dt-bindings: mfd: mt6397: Split out compatible for MediaTek MT6366
    PMIC
  mfd: mt6358: Add registers for MT6366 specific regulators
  mfd: mt6397: Split MediaTek MT6366 PMIC out of MT6358
  regulator: mt6358: fix and drop type prefix in MT6366 regulator node
    names
  regulator: mt6358: Make MT6366 vcn18 LDO configurable
  regulator: mt6358: Add missing regulators for MT6366
  regulator: mt6358: Add supply names for MT6366 regulators
  soc: mediatek: pwrap: add support for MT6366 PMIC

Zhiyong Tao (1):
  regulator: dt-bindings: mediatek: Add MT6366 PMIC

 .../devicetree/bindings/mfd/mt6397.txt        |   5 +-
 .../regulator/mediatek,mt6366-regulator.yaml  | 154 ++++++++++++++++++
 drivers/mfd/mt6397-core.c                     |  31 ++++
 drivers/regulator/mt6358-regulator.c          | 127 ++++++++++-----
 drivers/soc/mediatek/mtk-pmic-wrap.c          |   2 +
 include/linux/mfd/mt6358/registers.h          |  18 ++
 include/linux/regulator/mt6358-regulator.h    |   3 +
 7 files changed, 296 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6366-regulator.yaml

-- 
2.41.0.585.gd2178a4bd4-goog


