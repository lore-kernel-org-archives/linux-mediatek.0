Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9D2D15D84
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 12:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H/1MCTmxbUO44rwyL5iC5PLrKibwoBMeTpyT0L8eV+g=; b=elOuTgwCDwUrI43EHqbKhuabWt
	/qzpXmeLdToXRCZltPHBEgdJrg71qxAAQSjOdqQ/CJk7mjfWLtuzdnEvu2aJGe4oACyn65ReD3CiS
	48L7/P1tbYOgDpOAQb29orA++YDNLne1q4XG0JAN2JWB0A00l8cBvmjgmAoib6UFihXD6eUkPFKmR
	ug7PiitAIKMRO5nd6aJOSvk+tOcJ4tmx0VbcOwW9LTmIBoZbD/iY/93UiCIx8ZaPg1/+qGhcuvpRZ
	iLVNK4CwBmxVML42Jaw6j7meJG798gK92c/lClX3WWfQ4nMg7V2OfJFdrH7n9Rg7aOc52JjjOeq8X
	8hMmFw3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rLU-00000007C7n-0yNg;
	Mon, 21 Oct 2024 12:17:12 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2rKq-00000007BzX-17TG;
	Mon, 21 Oct 2024 12:16:33 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2fb584a8f81so46507761fa.3;
        Mon, 21 Oct 2024 05:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729512990; x=1730117790; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H/1MCTmxbUO44rwyL5iC5PLrKibwoBMeTpyT0L8eV+g=;
        b=PUmP5EikS1YoKFjCRfu87TcVB2/92G5rSUGrkG5TsHILRV4d/3N9flIsdV7CFuEAgZ
         PBO+qMggZ+JUml4m4qXq07rNRapiwtIg8VdU8Zw5qIhwySLZOrn2I5pHnS7aN/BqpArj
         kgZV0R5f83ccgflnSfNUco/avmmJOpeG1orCYCbWMOY9+EcnPfVn7nFArEeQiT9KfhAJ
         QxYgSSG43OhJzKoChRxnbxwYDo+2scv8t0gCR1kEoehKsV67g6IiL/CuDqMV71pL5nF7
         ZcFjlRcqrj96AWORR1lH+3J/qn+ys3SgrEmOw+ATFYTaKtqpz4efGxe0j0cXx2v19H3n
         TSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729512990; x=1730117790;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H/1MCTmxbUO44rwyL5iC5PLrKibwoBMeTpyT0L8eV+g=;
        b=wSzWC21WmZPR8/1m857waG7+f2IMI21zDdiFeL5U/168Fhz6xPwxokuRi5zjfaw3yR
         iQLobGzgj+Mp04O0PZULmZTDEfP7cJ+qCkHkYcAIMIZYUBXc3iADIeTrheg+YsJZS4r5
         NBeahr6VjhxcOM/fjMqpmOTwv7oLju4l1yPDibSYrJ+b7yDl+XhOpeXoV4Gwtjfs9pVT
         or3Ovn/krDNVd1g09Xn7WXj1Fsq6gLaXv2c6qSWKgfCdouxC0PZsGK/qZhQalycZnr8D
         WlreWxvST4zXguf//IJhtRdP4CTG0U55VIO0qUNKpbyIrTSQ0EEwmmNLv2/34FUumJqH
         50CA==
X-Forwarded-Encrypted: i=1; AJvYcCVhHxy4HA1ON/pLCBko37XgpmwkO11dpcW7cN+0Lfm8WZWQIzv2NMDXkLhT0WrReKBgWMMqHvkXWQycmGwPM7w=@lists.infradead.org, AJvYcCXUBhce7YAwesXNfi0CyRfT1TlcEeIKf9EUP7cJIogCgzj4pk3vYgxkV1+8paZHFL4kIrnh6TsBOtFDlK9HKvJP@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc2Yp+4/TTKkfh2VTpeLDHL0jq4F+h286Hclft6d2Dr5t5LRTt
	WPMSkd5KPjF0NgPXGm6r/IDx33pE35HrkWuKWnFe5zlZmGlbR5Y/
X-Google-Smtp-Source: AGHT+IHR6MsGMRBzU5JPSi1HY55LtpEFaaIUqbCyIY5gOO8fE50iJxRU2yRt/DZvTwuMoUyyjo0iyg==
X-Received: by 2002:a05:6512:1304:b0:539:f760:6031 with SMTP id 2adb3069b0e04-53a1520bd73mr5457779e87.4.1729512989592;
        Mon, 21 Oct 2024 05:16:29 -0700 (PDT)
Received: from zenbook.agu.edu.tr ([95.183.227.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912d6ee6sm197068966b.4.2024.10.21.05.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:16:28 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Sam Shih <sam.shih@mediatek.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
	Yassine Oudjana <yassine.oudjana@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/2] MediaTek MT6735 syscon clock/reset controller support
Date: Mon, 21 Oct 2024 15:16:14 +0300
Message-ID: <20241021121618.151079-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_051632_331566_6A17AD7C 
X-CRM114-Status: GOOD (  11.87  )
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

From: Yassine Oudjana <y.oudjana@protonmail.com>

These patches are part of a larger effort to support the MT6735 SoC family
in mainline Linux. More patches can found here[1].

This series adds support for clocks and resets of the following blocks:
- IMGSYS (Camera)
- MFGCFG (GPU)
- VDECSYS (Video decoder)
- VENCSYS (Video encoder, also has JPEG codec clocks)

[1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging

Yassine Oudjana (2):
  dt-bindings: clock: mediatek: Add bindings for MT6735 syscon clock and
    reset controllers
  clk: mediatek: Add drivers for MT6735 syscon clock and reset
    controllers

 .../bindings/clock/mediatek,syscon.yaml       |  4 +
 MAINTAINERS                                   | 10 +++
 drivers/clk/mediatek/Kconfig                  | 32 ++++++++
 drivers/clk/mediatek/Makefile                 |  4 +
 drivers/clk/mediatek/clk-mt6735-imgsys.c      | 57 +++++++++++++
 drivers/clk/mediatek/clk-mt6735-mfgcfg.c      | 61 ++++++++++++++
 drivers/clk/mediatek/clk-mt6735-vdecsys.c     | 81 +++++++++++++++++++
 drivers/clk/mediatek/clk-mt6735-vencsys.c     | 53 ++++++++++++
 .../clock/mediatek,mt6735-imgsys.h            | 15 ++++
 .../clock/mediatek,mt6735-mfgcfg.h            |  8 ++
 .../clock/mediatek,mt6735-vdecsys.h           |  9 +++
 .../clock/mediatek,mt6735-vencsys.h           | 11 +++
 .../reset/mediatek,mt6735-mfgcfg.h            |  9 +++
 .../reset/mediatek,mt6735-vdecsys.h           | 10 +++
 14 files changed, 364 insertions(+)
 create mode 100644 drivers/clk/mediatek/clk-mt6735-imgsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-mfgcfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-vdecsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-vencsys.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-imgsys.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-mfgcfg.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-vdecsys.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-vencsys.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-mfgcfg.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-vdecsys.h

-- 
2.47.0


