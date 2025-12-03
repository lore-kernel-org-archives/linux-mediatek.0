Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD28D1BDE3
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Dec 2025 21:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mex+iFQuIV/0Ik9O+xAwix9ls6VQnAB9P3pjCjfm7do=; b=twu7VBzslgVrxz
	52Qe9GFgofDpMfkAkJVYQf45CWioNfYFTb9NmcfZNgLgaCsl/3Sw8lsU2vThgnAq8cal9TD9fslRO
	rvba01EBSAP2MnJjLuiWc6lfV6AKJGDTin7sQWadHBNGQTsJxe6DOakNVA/hteTMIJi1y0kdK3Obj
	WVoCcCa4QZN1UlO3DmnApTm4PCnKtnjRdQfr9E77LywN9GlC52jCtQfdbAEOfao9wtRWi1rQbIVCl
	Tf3gwbGXwuNEm9rjHPO65j+frEpyOf36FxLVfhQrgvUxICf6wdC6ic4nIIa7UfppgVyybQ8MnUd4o
	xcT5U70ObqksyQexdVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuHj-000000077Rs-3DTa;
	Wed, 03 Dec 2025 21:21:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQuHh-000000077Q4-0m7o
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Dec 2025 21:21:14 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47796a837c7so1630725e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Dec 2025 13:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764796871; x=1765401671; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mex+iFQuIV/0Ik9O+xAwix9ls6VQnAB9P3pjCjfm7do=;
        b=Q1YEn8WKvfr4ptCjoFDp2zddigYXiMzFYIKU6WiHIgT6dUHqY31QJzBgWaSQ2XED6s
         Rd+c3dnN/rMqgxHRrfRxmZpo/XJlZakBXYTG7JYLf1aWZwnOn51/OaSrSp9KN+YLrtDd
         p/NvMLwKGnS+hsrmys8fsZp0ipusHkS0Cz9TelfNuprr21ZZeU2sEFBQfe3eyXde6Gpo
         p6H+t3q6adteeSZsYWRAobkM0+11BNpEyXvLy/kjL61H7q2jHaKIsflfg0ZFbsE0DiR8
         clknsy1fLoBJ/bDuYZOrWjJsRkcL9bqbXzdH5d3m2Q6EEfMZH9KrBAoGv1j4Ps8XVOsU
         hmOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764796871; x=1765401671;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mex+iFQuIV/0Ik9O+xAwix9ls6VQnAB9P3pjCjfm7do=;
        b=bdv9aX+2FCPLXoz6I48XpP9G9C4DzPS1uZnhgx+KDQqSQ2ThH3sPinrRCZAb+3urPv
         aMIJ8VUqI+n7Ezq82ZutxTFmHS/zJ+HtekxPR0nTk/Tijr8wRo5fKGgTb9ljNuhgF0MG
         9yCFp5b6Ulzz3IMHlJAd3uA2TRwDOlw/GhpeAzHxLB44dZTlOhCJ27HCroSp+fwosuko
         FXuIik8LUqo1n2FxDtT8QuNamnw9MhvZeavW0JVW5uvZHubf+gfmbry2t3GCJRr1GTCP
         ie05+MJgKKFln3QOJLy0JmfQ/3QtgirzrWaUHS0BCj/Ac7MmR3vAXOVd8UWP+EL3dxkP
         CDEg==
X-Forwarded-Encrypted: i=1; AJvYcCUH2/+D0i9TqStHDH5vJVyGvtTEfRwXSzi6TY1sWnkdjUxStVsoSYkvhfiFqTYB7XUZyaNKsVEthvfM73pR1w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7RPBcsmmy9gs9fukHSH8jPlABk7kt/IjW4pKxBoFpCNqz5iBO
	+fdBbRwNsBh7inHzf3SFHxYPvaKvakIayBzB/ohKvVU5JN7RsIi/oLcG
X-Gm-Gg: ASbGncv1oeFBBQnZLAFwAA+uKjV6NGqU6xJKW09PZFe1e4tNoEKjGf9fpS+Ai/hbZeN
	/huWnsX6Sz85LBYQwBjHIcu+FwER38G0WdOsW4fvGKlGhLSEitlsKU65H03LKfot4QAQF8klXMZ
	857wXqR+q1cKUucYuh2tStjFLSmvN/WQoUTeVvqO4Gd/p5VWilcVEnDhQfHmL42i26aUTXIt2Y+
	AIut19JoAVBy9KRhUQvZUT3JRFKrMMlv8WEmfAo2RvoAOXnAe541okRsIulELJYoSUuzY6FC86d
	pwQsVf3JrLPIH4xrtp24za+a62SAagd+1vYvjfxaGIT7CvRffw1e5wuJbYX40MIc7iNwZc2ag0V
	c8Mq26XNWKDFgjQ6ci24kXG6h+t7xq5mzPAGsSpcFzecUarGdLeiYehfS373G6rthqSgw/4VC7q
	foFI1/Qthn2D+fpQHsfDvjdE2SKXKdx9bpBfKX
X-Google-Smtp-Source: AGHT+IFZUeelZJ5F3kqcCFdVqRaV/e//mJ7O77jwvUW4t+w4XWfk+xyTxPI1msMcQ7W3qyrTtfwgYQ==
X-Received: by 2002:a05:600c:3b26:b0:477:7f4a:44b4 with SMTP id 5b1f17b1804b1-4792aee39c5mr37314425e9.1.1764796871145;
        Wed, 03 Dec 2025 13:21:11 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:2034:6883:1f40:e708])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c81sm41648667f8f.3.2025.12.03.13.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 13:21:10 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Subject: [PATCH v5 0/5] Add support for Ezurio MediaTek platforms
Date: Wed, 03 Dec 2025 22:20:36 +0100
Message-Id: <20251203-review-v5-0-b26d5512c6af@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKWpMGkC/23OwW7DIBAE0F+JOBdrWaCEnPIfVQ4UFhupNhFEb
 qLI/16cQ+S0PY40bzR3Vqkkquywu7NCc6opTy3otx3zg5t64im0zBBQCwTB1xJ9c6MBDGpjrRW
 slc+FYro+hj5OLceSR34ZCrkXDnslFHTSvIPec8E/U6156npXbsd+dOmr83lc94ZUL7ncHr9mX
 Ff/XJiRAw8eQ1SKyBvaLKwXZvk/k42BidZFI5WI4TdTW4ZPphqzMmof0EFQbsuWZfkBLw5LX0o
 BAAA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764796869; l=3316;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=Zk3MEDuhj8T6cNPtbw4xHlfD+QlH5E0Gxc9yD34asak=;
 b=scneNrWemOBml+JOtmHcwc5xULmq8tCrM8Zr8z2sRVSyj2OaVoV06JTWMVP8+/0hAMYf4QNH6
 vOT4ffGhuizB97iDscsSTIEfuEInDDuEpumHDLVykke4CDOrqGdiLss
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_132113_286179_5D38C9ED 
X-CRM114-Status: GOOD (  13.29  )
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

This series adds support for Ezurio MediaTek platforms called
"Tungsten". It includes support for MT8370-based Tungsten 510 and
MT8390-based Tungsten 700 SOMs.

Changes in v2:
- Use b4 to cc all maintainers properly
- Squashed patches 2/3 together
- Updated dts node names to be generic

Changes in v3:
- Added per-commit changelog
- Added missing Acked-by on 1st patch
- Link to v2: https://lore.kernel.org/r/20251201-review-v2-0-dc2df44eec7e@gmail.com

Changes in v4:
- Fixed remaining DTB warnings
- Link to v3: https://lore.kernel.org/r/20251201-review-v3-0-07f9af7341fd@gmail.com

Changes in v5:
- Fixed DTB per Angelo's comments
- Added a MT8188 patch for easier mmc eint interrupt change
- Link to v4: https://lore.kernel.org/r/20251202-review-v4-0-93f5cd2a0d4a@gmail.com

Regards,

Gary Bisson (5):
  dt-bindings: vendor-prefixes: Add Ezurio LLC
  dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
  arm64: dts: mediatek: mt8188: switch mmc nodes to interrupts-extended
  arm64: dts: mediatek: add device tree for Tungsten 510 board
  arm64: dts: mediatek: add device tree for Tungsten 700 board

 .../devicetree/bindings/arm/mediatek.yaml     |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/mediatek/Makefile         |    2 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi      |    6 +-
 .../dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../dts/mediatek/mt8390-tungsten-smarc.dtsi   | 1489 +++++++++++++++++
 7 files changed, 1534 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi

--
2.43.0

---
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

---
Gary Bisson (5):
      dt-bindings: vendor-prefixes: Add Ezurio LLC
      dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
      arm64: dts: mediatek: mt8188: switch mmc nodes to interrupts-extended
      arm64: dts: mediatek: add device tree for Tungsten 510 board
      arm64: dts: mediatek: add device tree for Tungsten 700 board

 .../devicetree/bindings/arm/mediatek.yaml          |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/mediatek/Makefile              |    2 +
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           |    6 +-
 .../boot/dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 1489 ++++++++++++++++++++
 7 files changed, 1534 insertions(+), 3 deletions(-)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251201-review-750072579991

Best regards,
-- 
Gary Bisson <bisson.gary@gmail.com>


