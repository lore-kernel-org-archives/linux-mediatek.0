Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FF2C3064D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 10:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tc3OCxrbI5f3b0tGJOHFzaZIm8KYLF8iYniM50kiY4o=; b=mumZqDj9UDofHA
	5ECFo172bxGKxkzIwsKm6JeeDpETw4khIdDk9t8kluIiEaeTXiyxxR4JwwCDEv7F5A9w1FFkMkx3f
	l3lybJauL3MzMz6wtvU82KPjOROYoTc2Cg/XqYzRSpU+xVgq5z+MTzPyWNhSRIatcK00LI7UBaYh5
	XWEe0JutlM9nE90SIge1Yv8uZ1Jh6h3RUVpdeW0mFoUSg3/WQskiR4KgsgJ/9M86sJtM/0VuXntnT
	bFG6Emq4vY5BSUxotCLkBYb8dCh7Q62BygC9WjDhw02HKQXljbVMWAXF+DKtXV3vUOsXcU2shdKLU
	ReSUos4YWEdqkEFNZTqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmQk-00000009xCr-11mD;
	Thu, 27 Jun 2024 10:32:42 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMmQf-00000009x9R-22Wa
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Jun 2024 10:32:39 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-36703b0f914so1063837f8f.0
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Jun 2024 03:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719484356; x=1720089156; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tc3OCxrbI5f3b0tGJOHFzaZIm8KYLF8iYniM50kiY4o=;
        b=nzdsL/ONsme6704+mb+caFCX6tr/ejTkYbmoGNECxvjigVlXVEr5s4x2gCbSzvKomI
         BjdNOL06uV/O6DiKE0X6hz0gHzfj9YwleCxC9l8zrtOY80k3kzBm3w1besVNLT4sP54g
         wtIqEG8YUZ868+DbiXSX/98tuYNM4AOjCd3ui64mMlKr0Si9JTHONAg8cqki7PjHr6j6
         Lagv2GKn6v7wCt4atAQ67zTW5mdJM7s1656lgK54k6A6LJL1K5cnGnh7BtFlfcfJd5pE
         QrSsIr7mCSiDZfKjjYfzw3Xbc0ezVjpT9etX1+7gg/T1Zma6oFoxMYJuFMrYIoYE4FFx
         /whA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719484356; x=1720089156;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tc3OCxrbI5f3b0tGJOHFzaZIm8KYLF8iYniM50kiY4o=;
        b=K4z2KgypQCNMxGwhCGqRpAaRDt7vj8UU9+No/adXDXShZ4ovwVCiBSNnpFyMwEYI7R
         l1MdSiNk0DwFj+3rh2pOuh1xqgSF0BVExQVxQS6YBq9R2DHdOVM4W6hyYggUun5VFP+e
         zMP1mhY/y+jpLnsmwBxSmp/RxiCyXKL363BYd08+Rdne0DLDgOb0YWk6pF/e4mQuYQJc
         TOKWpk45eyyeT8I/axDf/O65zb5ITNG9l2LWDUBgNrrCcZWY0hxZw3w1ESqzYUxQNvgz
         I0nwSAO6A/PeVVB6vZriZvrM/F3xZ3hcqeDC9hs6sqeTKqo8JHSWHoImXOSkMA7uGDJW
         4ngg==
X-Forwarded-Encrypted: i=1; AJvYcCV7eHIfmrF2BEY7S6BJPM42itEOhXynzmDrC/VV6tbjlzc6rFvU1GpvtjxKZnbbOpID9+qziEqdT5X/HSQS5KaqprCFFksIYyBJtf5wgu4Bbjvn
X-Gm-Message-State: AOJu0Yz11+w1scFZWw4Ddc+qN8VcCi/YCvGob3bqYGbxtYmXvsAeFo7g
	oou5YEAXp2hP8orZSyLKGTWVH8ieNQjs9+h3zYO4uRjNng7wmU+66NFscv69824=
X-Google-Smtp-Source: AGHT+IEUJg6zL1JLCvRaZYeqIRIS/dTo1xAqeSnR21HNYqFdNpYbAaRT/L9YMral9TrFx0zx5QA63g==
X-Received: by 2002:adf:fe46:0:b0:362:7b95:172c with SMTP id ffacd0b85a97d-3673cc55808mr2218753f8f.8.1719484355683;
        Thu, 27 Jun 2024 03:32:35 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367435852afsm1384352f8f.53.2024.06.27.03.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 03:32:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 0/7] dt-bindings: mfd: syscon: Document more compatibles
 and require simpe-mfd description
Date: Thu, 27 Jun 2024 12:32:16 +0200
Message-Id: <20240627-dt-bindings-mfd-syscon-split-v4-0-dc6699a9f3e4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALA/fWYC/4XNSwrCMBSF4a2UjL2SR9MaR+5DHCQmrRdqUpJSL
 KV7NxVERdDhfwbfmUlyEV0i+2Im0Y2YMPgc5aYg54v2rQO0uQmnvKSS1WAHMOgt+jbBtbGQpnQ
 OHlLf4QCidlwoVUkuLMlEH12Dtwd/POW+YBpCnB5vI1vXJ6x+wyMDClo32c4PTOhDh17HsA2xJ
 as88pdWseqPxrMma2bkTlJWl9+aeNP4P01kTZRUKSqMUcp8aMuy3AFZA7rnZQEAAA==
To: Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chuanhua Lei <lchuanhua@maxlinear.com>, 
 Rahul Tanwar <rtanwar@maxlinear.com>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Rahul Tanwar <rahul.tanwar@linux.intel.com>, 
 Amireddy Mallikarjuna reddy <mallikarjunax.reddy@intel.com>, 
 "Zhu, Yi Xin" <Yixin.zhu@intel.com>, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3937;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ocq1F8+mwQSJgldcFPAEXtsLkh5F0fMdp5IKXEFxNPI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmfT+3jsUV94j6aEl8yja5D8RbpsihEg4Epk3mN
 o28m5XTCEaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZn0/twAKCRDBN2bmhouD
 1ywYD/oDS1OoY0D/nh6c2L4x0KHLdU/A6FBO4WfGKDEb/isjXWwjpIA5xQv67WEO+7IbEFENabm
 UhFLMQ0tzk/lF326adThJxQNoqoTyNFIVA4PlIOFpoxBA3ZM2ruKCHDNM79kge4SwXjbLdKBn5W
 wi5rUdibrSHu+JqHyRhM2djnCBiIZi175nJW6WMXZ3Q/itVYuiJ39903Iticd5mSG7+Uu0jx4Xe
 FzmB8xyZ2ob37N12uVElR27MlzoMKQt13Ih7BKqAhaW61pN6ZQYG92m05q4GHO1v3X00Rvv7Occ
 /BhrSrKgDVTY2GNPlvGoY4O7rcwqnZSB18KKlNJOzXdHYKgcqFMyOMlWBNmokk/qUiX/81yVizQ
 rid9FtlaUwaJyHLVzE1RhncqwvFZISeBb/e1tb2ydIlwIG1gDBIkLBaYN1zfcp3+w7u2LF5XEtO
 DPQ1ouNT7ToQl5kQNijebjXlBMhOtq39++6cIY2FDmG8k7OEm7hmivYpUIP1iawFoLzcxiRLKWv
 LOJs1w3uLM5jR1mzy+vI8bUv0bwxgiPau4YSM54mwmWet1xMJNHD7+6nXAAQAkwBmaxuEtVKAHE
 k3LxaajgoE7qX+VelkacisKjf2DjaUBqQ/D/om64qPUuu2UZFpa6AJ8mRZp2ZMp8/MZ3uPPnOaC
 QHvnDiLNSkwYVtw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_033237_610031_088C8233 
X-CRM114-Status: GOOD (  11.50  )
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

Dependency
==========
Rebased on Lee's MFD tree, because dependency is there already:
https://lore.kernel.org/all/171828959006.2643902.8308227314531523435.b4-ty@kernel.org/

Merging
=======
Preferrably everything via MFD tree (file/context dependencies).

Changes in v4
=============
- Rebase - syscon.yaml got new compatible ti,am62-opp-efuse-table
- Link to v3: https://lore.kernel.org/r/20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org

Changes in v3
=============
- Add tags
- intel,lgm-syscon: change maintainers (email bounce)
- syscon/Split: drop unneeded |, use const instead of enum in select:
- Link to v2: https://lore.kernel.org/r/20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org

Changes in v2
=============
- Add acks
- lgm-syscon: add ranges to binding and example
- syscon.yaml: add big select with all compatibles for older dtschema
- Link to v1: https://lore.kernel.org/r/20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org

Description/problem
===================
Simple syscon nodes can be documented in common syscon.yaml, however
devices with simple-mfd compatible, thus some children, should have
their own schema listing these children.  Such listing makes the binding
specific, allows better validation (so the incorrect child would not
appear in the simple-mfd node) and actually enforces repeated rule for
simple-mfd devices:

  "simple-mfd" is only for simple devices, where the children do not
  depend on the parent.

Currently the syscon+simple-mfd binding is quite broad and allows
any child or property, thus above rule cannot be enforced.

Solution
========
1. Split the syscon.yaml binding into common syscon properties, used
   potentially by many bindings, and only simple syscon devices (NO
   simple-mfd!).
2. Move some known simple-mfd bindings from syscon.yaml to dedicated
   files.

This patchset might introduce new dtbs_check warnings for devices having
simple-mfd and being part of syscon.yaml previously. I fixed some of
them, but probably not all.

Best regards,
Krzysztof

To: Lee Jones <lee@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Lars Povlsen <lars.povlsen@microchip.com>
To: Steen Hegelund <Steen.Hegelund@microchip.com>
To: Daniel Machon <daniel.machon@microchip.com>
To: UNGLinuxDriver@microchip.com
To: Nishanth Menon <nm@ti.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
Krzysztof Kozlowski (7):
      dt-bindings: mfd: syscon: Drop hwlocks
      dt-bindings: soc: sprd: sc9863a-glbregs: Document SC9863A syscon
      dt-bindings: soc: intel: lgm-syscon: Move to dedicated schema
      dt-bindings: soc: microchip: sparx5-cpu-syscon: Move to dedicated schema
      dt-bindings: soc: ti: am654-serdes-ctrl: Move to dedicated schema
      dt-bindings: mfd: syscon: Split and enforce documenting MFD children
      dt-bindings: mfd: syscon: Add APM poweroff mailbox

 .../devicetree/bindings/mfd/syscon-common.yaml     |  71 +++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  | 309 ++++++++++++---------
 .../bindings/soc/intel/intel,lgm-syscon.yaml       |  57 ++++
 .../soc/microchip/microchip,sparx5-cpu-syscon.yaml |  49 ++++
 .../bindings/soc/sprd/sprd,sc9863a-glbregs.yaml    |  55 ++++
 .../bindings/soc/ti/ti,am654-serdes-ctrl.yaml      |  42 +++
 6 files changed, 459 insertions(+), 124 deletions(-)
---
base-commit: c41503b65ef7b85189c39f6a6038feb7c93eac2f
change-id: 20240517-dt-bindings-mfd-syscon-split-37e23996523d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


