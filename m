Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEAE7CEDD90
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 13:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8XBC4RSh8TfpYO7N1cJ3hGiE9IZ5JY14wIot0+OdLjw=; b=pQsXmJJHQ+aMLn
	5IlIs6qdoJaXm4WERunCHcyi7CH8YPJ7CnJFyXeieLedbO+eP2U/e+spet0X+r8tQHYkhbvYl8a6c
	ofO6JENsz2HGfmvlrtOfEBj1YYnLteT6XkN2ehZdsHPlkvzuzwMTS3OfcTkQAGCVE/qi2oAdpTMAC
	MKt5kF+qYbEIe91Pm5sCd7E45pnpLZBW3SDxPP3LZGpDqul89OYONicPiBoyNXgAJl5dtUdrTH68Z
	V/OnNJXQ92XzEaNFD5y20L84S8+Ay/5vFslnoLtCH/yqL8BsFQZQGCTOObPC85xWYSE7YaWtRN4bT
	Q5Acf9cA0PAkkBkLSpGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syWOq-00000009LNL-3Idp;
	Wed, 09 Oct 2024 13:06:44 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWI9-00000009K6y-3Obj
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Oct 2024 13:01:50 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20bb610be6aso74351125ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Oct 2024 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728478789; x=1729083589; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8XBC4RSh8TfpYO7N1cJ3hGiE9IZ5JY14wIot0+OdLjw=;
        b=dc+G8GFH2uzbaU9cUIgzGcNPFsM+kaWhlJm4P7yPoPk3ZTWqu8p3dr3gY/pr+pp5rK
         bmnJDSVtr/upysLhX4OgXrZOReoJ2PopnJcxzxdyNA7zs0CctH82NJ2zgoefBREM42zg
         T/qqso3ddGjgXVB5pZxv/y8dtXu/mVUym2UfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728478789; x=1729083589;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8XBC4RSh8TfpYO7N1cJ3hGiE9IZ5JY14wIot0+OdLjw=;
        b=otev2/g9LF7HQ3t0Lq/sW2qzJq2yn46kYj3XJAoKWd1KU/f4JIJiT2g5UmhujbUSMl
         pldk2NheVfP0MT1iD/njZRBzo9ZMKXEwN/KNCimD+MoxotrULcesAOrjjODF7LE7Y+TU
         vlVFHkqHmtLbbARYhSve+ewby2X4QJY1crDa2MJtouuitr4UK7Q1KxgYOtyQ+8moVOT1
         MT+9Ll9El4W4wunXuXGfBhvg3OZBahg2b4/VN3O5dVwAALzVMYwtUXlUXUrwaKGV0YDh
         BmGkwseBYtN7xqrFRHyXbzwzi3HQIERteRLHGOIpdkNmajUBFKv45m9sYRnSDo0mi3Ot
         Xh1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjEX4MBY9aPlInz2Sb7Mr8X211VP3oJVLbTi+koaIoXV9dytF9hhcd/PSZzWfy4LoWJvCco8S0g6mT4vDxWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjqr+CrTCHcK0NR/NVXT/U1zaA33Oh09JvS5I5oewNS0ZmyySV
	p37g13ewoiAmsB9eKbtyGpK+mkMG4r0fNbcs1Gay8YBA0F3dw1b9sMn1FOud5g==
X-Google-Smtp-Source: AGHT+IFlslWnbu0rpXGb6LpChURpaWlbLt2Zo9F1VE3wGGEiv8TDbnGoZkGoPnCp7IhijplXCGC6tw==
X-Received: by 2002:a17:903:2349:b0:207:1675:6709 with SMTP id d9443c01a7336-20c6358f30fmr31637515ad.0.1728478788803;
        Wed, 09 Oct 2024 05:59:48 -0700 (PDT)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:bfd7:eb4:8571:b3f4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c51c21535sm27434005ad.216.2024.10.09.05.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 05:59:48 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Subject: [PATCH 0/4] arm64: dts: mt8183: Add i2c-scl-internal-delay-ns
Date: Wed, 09 Oct 2024 20:59:43 +0800
Message-Id: <20241009-i2c-delay-v1-0-6cf59721c1d1@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEB+BmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSwNL3UyjZN2U1JzESl2zFKCgpaFFaqpBmhJQfUFRalpmBdis6NjaWgD
 vuKmQWwAAAA==
X-Change-ID: 20240909-i2c-delay-6d202918ee0f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Daolong Zhu <jg_daolongzhu@mediatek.corp-partner.google.com>
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_055949_906489_FC4BBD31 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
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

Add i2c-scl-internal-delay-ns for each device.

Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v2:
- Add missing Signed-off-by tag
- Link to v1: https://lore.kernel.org/r/20240909-i2c-delay-v1-0-4b406617a5f5@chromium.org/

---
Daolong Zhu (4):
      arm64: dts: mt8183: fennel: add i2c2's i2c-scl-internal-delay-ns
      arm64: dts: mt8183: burnet: add i2c2's i2c-scl-internal-delay-ns
      arm64: dts: mt8183: cozmo: add i2c2's i2c-scl-internal-delay-ns
      arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns

 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts  | 3 +++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts   | 2 ++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts    | 3 +++
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi | 3 +++
 4 files changed, 11 insertions(+)
---
base-commit: 75b607fab38d149f232f01eae5e6392b394dd659
change-id: 20240909-i2c-delay-6d202918ee0f

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


