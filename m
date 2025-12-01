Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FF7D111A8
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Dec 2025 10:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/aq5fWGVWti1VxWY/4bnYEN4VvYNMxggYcsTA53nNMs=; b=AgIV1f2rSlm6xE
	wqxTDdusc8GCDXKVO876d8hGjNEagzwCizIfVcnuXhjfjcBWNNbFVElFEoTo1036UpIf/K5G27TMn
	dbKsPMIvvq2oceVP4dnkYnu27WckWAtqbrfu/hqE/SwfK+CeNq4Rqzj/yXiZWiwEVXcBOtg93rT1P
	/8QMucy+oL0Ouk5exe0dxbmYqhpRMrt2rbgk9Cra3h5BFjm65GTKyvn9EdLqxt2GqgGmD9rsYtiFx
	IGrvbXneabYqGdVR/yQy0R012YMkeMathyp94tOk8D76A+qyU7QYPSvJv1oKJXrRgiAyTp0ATUguj
	xvZo2ZYRwNH/KxVEg4ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ14E-00000003JVP-1UQS;
	Mon, 01 Dec 2025 10:23:38 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ14B-00000003JS4-1CVU
	for linux-mediatek@lists.infradead.org;
	Mon, 01 Dec 2025 10:23:36 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-42e2e6aa22fso542429f8f.2
        for <linux-mediatek@lists.infradead.org>; Mon, 01 Dec 2025 02:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764584613; x=1765189413; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/aq5fWGVWti1VxWY/4bnYEN4VvYNMxggYcsTA53nNMs=;
        b=hJWCLYB2kbZ+Mj4Di1s+jP+bs/U8VBVt8us9Ta7nQysCPWQZAygeYOvJ7w5bops+F0
         UndGIobMAiQG6/pgupH7WwQbKUiC6q+hWVUDB90fp3+1mw7lNWC0Io8asPYa678gMkkP
         hh2IMjruGLk78ktHMb2tvy/jjU+miI/mQRYVRXWMCm86dq365ORdam29/tVMMBX/1JR3
         j4e85kLkwCNjV/MXu/VAmJefdI85JDBr/n1r9xStGOGA1Vgln9L7a5A6rjwCgCEsN9RG
         twjVWDMkTP00TDNrVjXYbF6BtnTB9wo1O9iLYK6xaUTIC9tG4j7dx15dE28DAHr+iexJ
         FICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764584613; x=1765189413;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/aq5fWGVWti1VxWY/4bnYEN4VvYNMxggYcsTA53nNMs=;
        b=lUabhW2HjlHUO1MoHCpmAAsSkNpD53NzFz9i+P39n5Zr0GHiosZiztU7VaSiOl4W4A
         FqKgkyQ1OPAaP0SoRd9r/PnnOWaMfs7v9xrxJm5c4V05E7SVZyW4wQ2STnvdDMQc2QB0
         G/acTxKZrymZcHz05eYxFDBqVh5r3Tf/XVVid9JrLHyiJFZjytDwm9NNAVEymgDK6ACP
         18XiGe452acH2GBC/Zk8kr5n3hUJgoF7FuhetHlkE7GSXNwDsJsqBaQyRhLnCyV9Lwwl
         nqzJNGLiF1kgtmnuKVuBhqieqRUvPDinsi5Vlx3ZudIXUYKY76RPV5myCDWONNtVqXHY
         HapA==
X-Forwarded-Encrypted: i=1; AJvYcCUyAcsxc/GY4BmGBJofpr6w58GnW1C4KgMRoI9sftvr/1fh/XLg3O07SXbB7grJY+lOOeqv68krmB8OuY7grg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwazrQXvHqtc3X8EIjUY3+HGfSetWUkAWWRHNZEaSD39B3tw24T
	6johd8HmZMoOZ5RuWWWl3WQOeyTCvg+Mm8FtWcaBRnamU2sJMFcsHJP2
X-Gm-Gg: ASbGncsAcfGxcOVStvgGbEETlcosdSG6MIaCDHZwxz64fTfdV3Ksik2mn5+O49I7z61
	kaVYPEM00Qy/UIBYQrT/B8G8gEDb+p3CGJd2W9X7vbh0E1USPI0bW3Q80z9BC48D7p4Iptnm1fA
	tmpE2iEjuWxfs2eOzRVxB6b6/hh5M3WkKVyu/wk0vV8g8COp7rwiwbCCzSwCICPbC88PX/rfsGT
	HUaFqFhAySH4UHpfTlLXkqWo+YTCKTD/fxfSFWKi0C8w/RSl69l5ySqHdh99N00h1VEvnF4zJN/
	/kFiUZ3PIOc1IbYoFb0NacgjqL9E1CkTwvwfS3l0ik9N1OdBRhcKSlr73Z9gMKOKVXoFhZ469sY
	1WSaqWEl3rhFZascMOI4hf3lbb7taDbYkEMqx8qhnaTPy2mEUJ5vUf2i31S8XjXIII97Hbk3Feu
	OG4hTwhSx8VRfspNGGlrsWsuQqDg==
X-Google-Smtp-Source: AGHT+IGFTh5STldnmeUejFuBCNFwzUivENu5VIGhQtql5aFvAWUkx/tqlq9NXgNt2K7ubqXJ0e/UbQ==
X-Received: by 2002:a05:6000:2c02:b0:429:d725:4125 with SMTP id ffacd0b85a97d-42e0f35bbb9mr26849422f8f.54.1764584613159;
        Mon, 01 Dec 2025 02:23:33 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:3201:3d10:4ab6:6efe:9b65:a6af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5c3c8csm29466439f8f.2.2025.12.01.02.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 02:23:32 -0800 (PST)
From: Gary Bisson <bisson.gary@gmail.com>
Subject: [PATCH v2 0/4] Add support for Ezurio MediaTek platforms
Date: Mon, 01 Dec 2025 11:23:14 +0100
Message-Id: <20251201-review-v2-0-dc2df44eec7e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJJsLWkC/1XMyw7CIBCF4VdpZi1kwCLFle9hXGCd0kkEDBgva
 fruojuXX/Kfs0ClwlRh3y1Q6MGVc2rQmw7G2adAgi/NoFEbpVGJb0RPYQ2i1cY65xS0+FZo4tf
 v6HhqnkqO4j4X8n9zHHrVo9zaHZpBKHHmWnOSwZf3IUTPVznmCOv6AZ/HEueYAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Gary Bisson <bisson.gary@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764584612; l=2132;
 i=bisson.gary@gmail.com; s=20251201; h=from:subject:message-id;
 bh=y/Qwl4YPkUepvuWoy1jfQEPKPu+EB9i1kk8NpTVdZ5Y=;
 b=5/iUh1WOB7Fub2h2Y3ecTZKoHP9jfWojItMviKYc2zwnzsE2UkOO/rPF6T7HSOelfoNIcb6yQ
 ezfjdlR0l1jD+MvAemlSDIK44aGQ+gu3AYtB/afKC0mLRg5C3L2QFBl
X-Developer-Key: i=bisson.gary@gmail.com; a=ed25519;
 pk=eaOrLwovHUZBMoLbrx+L1ppj+AH+TfgxkVhIEyrhkeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_022335_344293_1DD366B1 
X-CRM114-Status: GOOD (  10.53  )
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

Changelog v1 -> v2:
- use b4 to cc all maintainers properly
- squashed patches 2/3 together
- updated node names to be generic (pmic)

Couldn't repro the schema issues sent by the bots.

Regards,

Gary Bisson (4):
  dt-bindings: vendor-prefixes: Add Ezurio LLC
  dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
  arm64: dts: mediatek: add device tree for Tungsten 510 board
  arm64: dts: mediatek: add device tree for Tungsten 700 board

 .../devicetree/bindings/arm/mediatek.yaml     |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 arch/arm64/boot/dts/mediatek/Makefile         |    2 +
 .../dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../dts/mediatek/mt83x0-tungsten-smarc.dtsi   | 1481 +++++++++++++++++
 6 files changed, 1523 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi

--
2.43.0

---
Gary Bisson (4):
      dt-bindings: vendor-prefixes: Add Ezurio LLC
      dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
      arm64: dts: mediatek: add device tree for Tungsten 510 board
      arm64: dts: mediatek: add device tree for Tungsten 700 board

 .../devicetree/bindings/arm/mediatek.yaml          |    2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/mediatek/Makefile              |    2 +
 .../boot/dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi   | 1481 ++++++++++++++++++++
 6 files changed, 1523 insertions(+)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20251201-review-750072579991

Best regards,
-- 
Gary Bisson <bisson.gary@gmail.com>


