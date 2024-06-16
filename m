Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74336C27C53
	for <linux-mediatek@archiver.kernel.org>; Sun, 16 Jun 2024 13:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y9RC7qP2hOgwXMsoy3J2wjG1fwHEObGM33Zw9CpfKZU=; b=1cXkzHFEnDShR/
	6skSeCM9N6bFqI4K8YxHzlTPd7VKOW1echK74CDsbwXQ3mNLiCNuFneiEFfHXjFHCcz76e/1LbjFA
	APwksIgKItMrowKQnyeOGe4ijv+IPFd7U0ElT+NAnqd3WcERqFtnK9RZ18VlJuEq8QZ457/6zz8FC
	lfzXc5vbASLYvkQazyfnEI6xCqwiqrZm4ahAE0kI8tfULOFFuKi91TGp7Dx7a4DfLad/XB8JHdJUL
	FCXLpVn5OV58LecwejiUUXrGZhiieQk9wclZnyM+N9kRF5MRBmGVO83Te/WkwtqW5Ut2XyZdzm1Gf
	iYu+K3ewr+2JZjOjw6nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIpnJ-00000007aAB-342m;
	Sun, 16 Jun 2024 13:19:41 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIpnE-00000007a7L-22Sv
	for linux-mediatek@lists.infradead.org;
	Sun, 16 Jun 2024 13:19:38 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-57c68682d1aso3963488a12.3
        for <linux-mediatek@lists.infradead.org>; Sun, 16 Jun 2024 06:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718543974; x=1719148774; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9RC7qP2hOgwXMsoy3J2wjG1fwHEObGM33Zw9CpfKZU=;
        b=N+i5LE+ziqp803z/Cb8p4Pjsk9PUkcOqqnQCxrWYImqSAaZvebAVHehmDVIjGHA43Q
         K8d4Yd3BVSTXLhEzbExFDc4VudZOEPtMl7x5rTuJhec9Nq/fmwnWWnjhzpRVNDFR+0so
         f/q2VZWBpZ3aA1Wgs+TPDTh0fKjlRmeMZazgCdINFd/u53hgUv63t3NQaIfupc6DbxPf
         WgbuV4YAFyYILGhPmD+5XQALf4/jVazzUOFALFPC8MAjTV+7so33/kTnkt9xK4ecMgT3
         9vfeDTp+rHBEENy5wrFRPzUF/vZodojBHcEJcPQICYur6GzzdswhnV+n/3lFV9JyhdKA
         IZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718543974; x=1719148774;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9RC7qP2hOgwXMsoy3J2wjG1fwHEObGM33Zw9CpfKZU=;
        b=mmVl13cYHR8Kw3yLa3gIFlKznIUbVb3UXwAeYw69teQ/yq2w+7N3sHUygntUpY8cDm
         2zXR0C05uXF0LXoDMwoGb0U8lqpeR2uu8YfFHHjj/6Bx8vADcpsBIHX2k5TmxntiT92p
         luhkjT8BIVDKtIwYmQzKFyb0hNGYieZQpyG0Hv4TLgMcoJX+BgB/Y0J2cC9IMG0d/n0H
         ZaaOiOhn7Ew0qhpRT+1SiG7POYfhnVZS8pkzFSFKU/Beosp3rq5Wccpbb7p7iGQl6lmj
         yNE2SCpELonZC+jWB7+7fMfQNNGHNihl5r5XzThDGAhqKKhEXYJ+BhxtcDhElrqU3n43
         dZrg==
X-Forwarded-Encrypted: i=1; AJvYcCUwxswXUWxmfGCM1Uk5eM9Ie8o36OF3jNIcGn7cibc28Vwsso7yo5Ay+MTHbZchXWp/LNbrbawM59urQb33u3FzMOo/u5NziALqaTLgnyP28tDz
X-Gm-Message-State: AOJu0Yz3OnX7oyjGj6Ff3lxE8hwKHEXSmIWbAOjxHqYRxjJdY3+yp5LJ
	0haGK0wsszYlhJEi52aLI51LGyaBUvRN939fesP1Ng8yW0OkGI+LtwNv5z3hs2A=
X-Google-Smtp-Source: AGHT+IGMI/wzpjxIzGob+oc4c+5L+0sBURQOTzW3e+I9pMt6Aj9Zo75Lc2WpGk2lBDIv5UBbbO8UMA==
X-Received: by 2002:a50:8714:0:b0:57c:ab84:1095 with SMTP id 4fb4d7f45d1cf-57cbd652420mr4227643a12.7.1718543974453;
        Sun, 16 Jun 2024 06:19:34 -0700 (PDT)
Received: from [127.0.1.1] ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb7438815sm5099603a12.80.2024.06.16.06.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jun 2024 06:19:33 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 0/7] dt-bindings: mfd: syscon: Document more compatibles
 and require simpe-mfd description
Date: Sun, 16 Jun 2024 15:19:20 +0200
Message-Id: <20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFjmbmYC/33Nyw6CMBCF4Vchs3YMbUWCK9/DsKj0wiTYkk5DJ
 IR3t5K4dfmfxXc2YJvIMtyqDZJdiCmGEvJUwTDq4C2SKQ2ylpe6ES2ajE8KhoJnfDmDvPIQA/I
 8UUbVWqm67tpIZaAQc7KO3gf/6EuPxDmm9XhbxHf9wd1/eBFYo9au2OVBKH2fKOgUzzF56Pd9/
 wAhMnwyyQAAAA==
To: Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Khuong Dinh <khuong@os.amperecomputing.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Lars Povlsen <lars.povlsen@microchip.com>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Nishanth Menon <nm@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3459;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=KsuesC+AIOWnKwWhlFMQqxP1c7Aqz3KwBjkPKaoEn4s=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmbuZZ4iKC72/2IrXQ++FeWFww/PEerhVXjYS9F
 gps/xdFZaaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZm7mWQAKCRDBN2bmhouD
 13DLD/9rH6dQNL9jR/EbdncCtbVy7XfBgF23WzTSQ+Zetujhw6InK0iBU9oEm1RSW3H741evTzS
 1a/HpapRRfre/jtZ28lyZFE5wDJtLVowZIvWiV2jPC7wUUKnfnGG6xy4y+UO8W5ajNybtQ541QU
 yot4HM7h7n+P3OEtjlAu/pcnQTY04MxIgmVemOiNdK5wVaachnub0WN1lw7kq89xWlOE8fu3uGF
 tnpdejWgoKJJmv7sGMTWEAZQc8OHoTyKB7yx1oohIa7Cs6hJ8sbOkke3QMD5t3NWu73TKtdH5Nb
 859EmTDIORS+lqwHissSo564KiYjXD9R8rP9RbHlnm8z6Ei9M9c9PjRGCumfhcwUeAnl4RMUmyG
 2KVhL94LusXQxhLgF7VzRrTd0kWeET5MXGiMPNXOSGONX7hLTF325XYNnwXD422YRnFsz5jeZ3E
 sYlIHRRhBcSjhWfbP0Qp4HBS26bwIjW0poIo71YXoa1SNEwQoz11kT0lUmeECJlvrQaemHs6gcc
 QaTo6mmP7lI/Zt3UkwBNGkzXz9kdIlb71FNORzwYJgARNszOWJSOCq1bHLiwfjR4gYkqiOUUphs
 9BR9xpFHp42gZ2DHz2Ura9j0DlxBEcJ5gszm3JLaES0vrHheDY/DuIzOhANOqbiCgpIg5vV4zYw
 5vzsTOP0J6u1U5Q==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_061936_749873_128CA147 
X-CRM114-Status: GOOD (  10.70  )
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

Changes in v2:
===================
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

 .../devicetree/bindings/mfd/syscon-common.yaml     |  72 +++++
 Documentation/devicetree/bindings/mfd/syscon.yaml  | 306 ++++++++++++---------
 .../bindings/soc/intel/intel,lgm-syscon.yaml       |  56 ++++
 .../soc/microchip/microchip,sparx5-cpu-syscon.yaml |  49 ++++
 .../bindings/soc/sprd/sprd,sc9863a-glbregs.yaml    |  55 ++++
 .../bindings/soc/ti/ti,am654-serdes-ctrl.yaml      |  42 +++
 6 files changed, 457 insertions(+), 123 deletions(-)
---
base-commit: fe6ba540b2ce777eb4f59991c3ef20ad8a319a1a
change-id: 20240517-dt-bindings-mfd-syscon-split-37e23996523d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


