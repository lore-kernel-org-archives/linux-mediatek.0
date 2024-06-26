Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BD9C27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 10:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9Gly2EJcNPyMI+Zs26/l+uL8LDm6luZq6AxL3zJnFgo=; b=UasGqLFUAALvsj
	SexcnkeXu26u48GqICClfSJ2Az5Cvn8MBqHfyWSjbXNhe0u1pnHx1ZiXRnaMneG/jkCd/r/l310nK
	cvLolsPv45aVDVva0M+isQ+xBHapepxZi0fdWwVnnPZgA8o1z0fIwaWTu0TYRWHL4PAGm5QiApgHX
	mg0N7OnLcklQJ5mrFNQvzWdGPaOfcncY47UmWaWbqehb2Y/H7bnvAzCbEJ1nQmhmn58yp7Mqtpy42
	V6oRzjSApmNaDPi117v3xRWJ+JRIKlIHlk3OiPjsOURD+47zj8GQZIEeNRlznMwBr4I0eAzFwVsb1
	CduQ0qWjeazcZ1fQUGYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPas-00000006FDw-1CXv;
	Wed, 26 Jun 2024 10:09:38 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPao-00000006FD5-2yN1
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 10:09:36 +0000
Received: by mail-io1-xd30.google.com with SMTP id ca18e2360f4ac-7f3ca6869d1so45529339f.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396573; x=1720001373; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Gly2EJcNPyMI+Zs26/l+uL8LDm6luZq6AxL3zJnFgo=;
        b=ECXReLw69LsR/Guf9asH4GUVyjb00gX+cLGOhfr7jXjpitgP5rmwc2JHoN1Gk9twSW
         /aZGRcB52QW8DBjzU2HOjIAppYxfuWe6CTOx8AjH6xEGiekf1CHuGa4nifP7C/Hrtey7
         PbrNAjd3gpyZUE0ngUCnf32Es1K/rZNC+2qRumkto6dimdcsbo60Yy0ccBwLq/HKzWOJ
         Gl9JkZ9GFrfv+KbZ/cQBszSVXIKymWiifHJMxa1P4IvE3o4x6a2vyvNMGuBTAFay4MIf
         w4jGf/NCzITENW68OigVfDMnZ4gcHhpn8fGvfID9PIdWFOdrl/d5c4nFzfnoZz26bmJ6
         xYlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396573; x=1720001373;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Gly2EJcNPyMI+Zs26/l+uL8LDm6luZq6AxL3zJnFgo=;
        b=rT8PCs3fELLrDhR1KGbK/Qw4nCgLG1CPKRv8qOunaCW1j+8h03RaZcFYYQUVjFpBEf
         yTr00IypB0j67PswBwvJeA1N3IYninuJX6omHwilx9QgQpZypt+/CwzPDM7fmU9f+ZFy
         spk9YP5fEwp+YRwTrem2kZmIFe+GlGI8/PDUbGrCC7OqhU8NXVxBjbX8U8G5l0a+q5MK
         9g96XBWyYt4H9jobZNEShlFkGWhJW0/BkrdMdajJSzkNL1p5/CDoB7i7VyK1ENC3QR39
         PPaI8aOxE5xUW/7/+loJ7ie/9mvWliBMrJboVD1GAPeuBhhrFLi8vccTgwv9OFydnoMk
         c4JQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCVzhbfTaTVKzM1y2zrc2tW8ywhFQmz60HRw6BDNbriAYiohJsQwngue4gA2nGr3M2es3nQsB4pUqN8GytQUrAyQAQzhrU9hfqW+J2fMwBtmsr
X-Gm-Message-State: AOJu0YzdX+8eBxsrfcLaANqULyXB99j2QLr1iEpapF0k0WCVSKwwnXtP
	sWKmFkQMOZXP9uu25db7luxRc+/u0xL+ZymyWP4WghrJLTvsXazUJLlsfBuHDq0=
X-Google-Smtp-Source: AGHT+IFY5MjA30Nyok2zslby/rOF5Fn6zOokJk2qbpya4vJQlT82lPIryncWawRYzwNxqwvaD7SSIw==
X-Received: by 2002:a05:6602:6b86:b0:7e1:e022:9e46 with SMTP id ca18e2360f4ac-7f3a75faec7mr1165335739f.21.1719396572843;
        Wed, 26 Jun 2024 03:09:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4b9d121859csm3079108173.137.2024.06.26.03.09.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 03:09:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/7] dt-bindings: mfd: syscon: Document more compatibles
 and require simpe-mfd description
Date: Wed, 26 Jun 2024 12:09:09 +0200
Message-Id: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMXoe2YC/4XNSw6CMBSF4a2Yjr2mD0rFkfswDgotcBNsSUsaC
 WHvFhJjnOjwP4PvLCTagDaSy2EhwSaM6F0OcTyQpteus4AmN+GUF1QyBWaCGp1B10V4tAbiHBv
 vII4DTiCU5aKqSsmFIZkYg23xufO3e+4e4+TDvL8ltq1vuPoNJwYUtG6znR+Y0NcBnQ7+5ENHN
 jnxj1ay8o/GsyYVq+VZUqaKb21d1xdXI0/XFwEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3730;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/+SdbAB8tNyIXJJMDFjZw6Vl+/DTTF3+zBwTN7W75TM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBme+jKR9bIVyuhO37T4BNBrIQsJHrqRHZKjWwzG
 GgxpFshv4qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnvoygAKCRDBN2bmhouD
 1xSJD/9t9refEMFFgJOHkfZlT0WLV2gc0cFrk5vgxGWc+pwHCkl/YxVaTDvtfs1s7Xiljgqml1j
 C9biNJW9bluKEDJt8YUrcKgUB2Y6tpUDDeT/a1RQreIHeSTI0VY54GtxsMt8SSCo0GPB4foPgIf
 pG00jWL3lY6ZE+e0fQPEmrNI2G6/vkSIwFGmIHLNGWAMkyfu764gqCdW2JwJYDyGOfgJsYImw/h
 Nz53aWq0whLq/Veou50dM7JIhnu1Hg7NFy9hMxJxvDrSQ2kKxgcjwmyTcBwDpO3eefr6hvmbwrk
 rxb9VNMBXv+EDYeSOiJrhP8kwqI3MqWKEFSlnKfdUEA7HBvCeB7sD7VtTi+noXA6wbk2pEnNk4x
 V+0LXtp3en2qemFU3174cs7071ItbLfr87yrWYssC9SLpSIi7x0wOVg0qFpZhCB+R81NtkLPobb
 q+5IBsxrU4g3GDDyRFKjuzHYTJxvD2jgCJrEYL9DeNS08aEksyIoi6rIR/1DgOrTWF6frMddmpZ
 kNt/4Gr7BPxGBRkRdAsvj9OCgkSw9dvQUtlPM/P5WoLtRSPX8SY677XKfC6lsg4IXM051divZTo
 aCqpAIdIIJTmbpYko0NFHUZgR68E77UwUaFJLl5bjhnZ94BCFJ8oTYrCSsLCUUkgCIty5l3V8O/
 F79UEfZArgJzRiA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_030934_812449_7386775B 
X-CRM114-Status: GOOD (  11.48  )
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
 Documentation/devicetree/bindings/mfd/syscon.yaml  | 306 ++++++++++++---------
 .../bindings/soc/intel/intel,lgm-syscon.yaml       |  57 ++++
 .../soc/microchip/microchip,sparx5-cpu-syscon.yaml |  49 ++++
 .../bindings/soc/sprd/sprd,sc9863a-glbregs.yaml    |  55 ++++
 .../bindings/soc/ti/ti,am654-serdes-ctrl.yaml      |  42 +++
 6 files changed, 457 insertions(+), 123 deletions(-)
---
base-commit: 8dc7c29f608649f3d9eca826e9d4fe4b8a32c472
change-id: 20240517-dt-bindings-mfd-syscon-split-37e23996523d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


