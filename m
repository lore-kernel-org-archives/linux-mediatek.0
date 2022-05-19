Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94173C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 15:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rDt32Yn6DaJpLhZxiIZQ2cjmYq3xxN2eTWk1jFvFu/Y=; b=S1fBQdTRbtrsV7
	UgPHYgCs3b6BitSG9CWQUtgoBbgyMjEvnSrfCLdLdFWpR8NFQkBkfkPa4675vWcLHzhwvfs/6FQSh
	j0R6r+GFUOkc7TKY14IDiH4CKFTPKTTz5b1SOhl6T6rAUWCWUnPVGXleZ4fuvuPViw8iCHvpBQv3P
	h7Cq7CU24Dmy3Spj8YmO2h5N7fl5Em1sQzs0tnes17YlpVve56iOxrMGIHc/ooWXov8M0JpYinINU
	EDfw485U/XHtz9WyTkeFsxnuH+F4tVmE8wO+XpBHpdEihsXfu5u19RnRezTJEI/wYNwrAOAEmpDHm
	+qs9ThMf5BKkbBQcyPkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhnJ-007lPz-Sm; Thu, 19 May 2022 15:10:29 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrh4L-007O4k-Rk; Thu, 19 May 2022 14:24:03 +0000
Received: by mail-qk1-x735.google.com with SMTP id v11so4849020qkf.1;
 Thu, 19 May 2022 07:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qa+RmjWGq636GZ/8xymXuJ2O/Y4ZrpNYQ00uYeEnnps=;
 b=GtwDUuXWMikoAdpZO5iESljNOMEVwaut9jSbx04nSn/WsKu8Xkw384UfcB5+2X6scR
 PJBqMPwQCmFLfHBUd54VAq8Y2PcKY83iffpbQFedSLtz7zAk6BxMPVkIxQ6GWvPKqbPr
 BKjuTH/Qrd7iN9Pb1CdNBG+q8aTXnzFMwSWvsSjAl7vo4kCvhLwYrXb0hT5VtVBFQqm3
 l7A7BpXBaCGM5y6sVYf/ydOD/xiczCPksHyvaTbg/7tmD+pzW0mABofHjXEGv3/F8BAR
 TnD2/A6/iSwYBDqbnhGHGD/1fcZGP6VrTw9CG2DV8UrrRYHTJvzaLH1MCSALg261+XXu
 EcLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qa+RmjWGq636GZ/8xymXuJ2O/Y4ZrpNYQ00uYeEnnps=;
 b=yLZB1yTQGPW+6q0GxJBnMiNvLBFpQhGArnwK/aZWEqej7lp7O1IiSF7pCfbTEl7OnE
 3ErYhXfyD9fqMmoqCt0bByUX2wFWbw5acR6Zr+vL8FLrZR5DPtH7cGI5LZdp9JWbYHoS
 3V+GvlY43CBJxQTCCrG5rgW6KMyW7bErhtMZf9Co0Noj5EnzucgKYSGgr7SKhkbaPRit
 IxONnXXJpLDqPKq8n6CNSb8JMCKPxiIFXlrEeSwhyo1vskK2hHaGrhrzDEp0Krm0Aqq5
 mnNNrt5xdGiqoZ0xgGKnHDsquoGz4iHyA+HMJ4s3loIWaPX06APc9lufEe+7Rdgc7SnZ
 xpog==
X-Gm-Message-State: AOAM532tlQqhlDRCsUCb+da0MZbmHY1OltGf4puveY9Vltw8do93haLb
 +Zzie6GP6F2b0Dx1qGZkv9k=
X-Google-Smtp-Source: ABdhPJzTGJKtnF2Jao6mYEzO1MdxqaX7B7cQMJFc5dHa8sZmNVz1kZcmFh865P78KZqTjAs5O9p4Cw==
X-Received: by 2002:a05:620a:46a1:b0:6a0:465e:ccca with SMTP id
 bq33-20020a05620a46a100b006a0465ecccamr3116751qkb.631.1652970238949; 
 Thu, 19 May 2022 07:23:58 -0700 (PDT)
Received: from localhost.localdomain ([217.138.206.82])
 by smtp.gmail.com with ESMTPSA id
 c15-20020ac85a8f000000b002f39b99f697sm1539342qtc.49.2022.05.19.07.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:23:58 -0700 (PDT)
From: Yassine Oudjana <yassine.oudjana@gmail.com>
X-Google-Original-From: Yassine Oudjana <y.oudjana@protonmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Miles Chen <miles.chen@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Yassine Oudjana <yassine.oudjana@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH v2 0/4] Mediatek MT6735 main clock and reset drivers
Date: Thu, 19 May 2022 18:22:07 +0400
Message-Id: <20220519142211.458336-1-y.oudjana@protonmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_072401_954245_A6737C9A 
X-CRM114-Status: GOOD (  17.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds support for the main clock and reset controllers on the
Mediatek MT6735 SoC:
- apmixedsys (global PLLs)
- topckgen (global divisors and muxes)
- infracfg (gates and resets for internal components)
- pericfg (gates and resets for peripherals)

MT6735 has other more specialized clock controllers, support for which is
not included in this series:
- imgsys (camera)
- mmsys (display)
- vdecsys (video decoder)
- audsys (audio)

Tested on a Samsung Galaxy Grand Prime+ "grandpplte" with MT6737T, a slight
variant of MT6735 with no known differences in the clock controllers. 

Dependencies:
- clk: mediatek: Move to struct clk_hw provider APIs (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220510104804.544597-1-wenst@chromium.org/ 
- Cleanup MediaTek clk reset drivers and support MT8192/MT8195 (series)
  https://patchwork.kernel.org/project/linux-mediatek/cover/20220503093856.22250-1-rex-bc.chen@mediatek.com/
- Export required symbols to compile clk drivers as module (single patch)
  https://patchwork.kernel.org/project/linux-mediatek/patch/20220518111652.223727-7-angelogioacchino.delregno@collabora.com/
- clk: mediatek: Improvements to simple probe/remove and reset controller unregistration
  https://patchwork.kernel.org/project/linux-clk/cover/20220519134728.456643-1-y.oudjana@protonmail.com/

Above are dependencies for patch 4/4 only; DT bindings don't need them.

Changes since v1:
- Rebase on some pending patches (listed as dependencies above).
- Move common clock improvemenets to a separate series (last dependency
  listed above).
- Use mtk_clk_simple_probe/remove after making them support several clock types
  in said series.
- Combine all 4 drivers into one patch, and use one Kconfig symbol for all
  following a conversation seen on a different series[1].
- Correct APLL2 registers in apmixedsys driver (were offset backwards by 0x4).
- Make irtx clock name lower case to match the other clocks.

[1] https://lore.kernel.org/linux-mediatek/CAGXv+5H4gF5GXzfk8mjkG4Kry8uCs1CQbKoViBuc9LC+XdHH=A@mail.gmail.com/

Yassine Oudjana (4):
  dt-bindings: clock: Add Mediatek MT6735 clock bindings
  dt-bindings: reset: Add MT6735 reset bindings
  dt-bindings: arm: mediatek: Add MT6735 clock controller compatibles
  clk: mediatek: Add drivers for MediaTek MT6735 main clock drivers

 .../arm/mediatek/mediatek,infracfg.yaml       |    8 +-
 .../arm/mediatek/mediatek,pericfg.yaml        |    1 +
 .../bindings/clock/mediatek,apmixedsys.yaml   |    4 +-
 .../bindings/clock/mediatek,topckgen.yaml     |    4 +-
 MAINTAINERS                                   |   16 +
 drivers/clk/mediatek/Kconfig                  |    9 +
 drivers/clk/mediatek/Makefile                 |    1 +
 drivers/clk/mediatek/clk-mt6735-apmixedsys.c  |  235 ++++
 drivers/clk/mediatek/clk-mt6735-infracfg.c    |  205 ++++
 drivers/clk/mediatek/clk-mt6735-pericfg.c     |  301 +++++
 drivers/clk/mediatek/clk-mt6735-topckgen.c    | 1087 +++++++++++++++++
 .../clock/mediatek,mt6735-apmixedsys.h        |   16 +
 .../clock/mediatek,mt6735-infracfg.h          |   25 +
 .../clock/mediatek,mt6735-pericfg.h           |   37 +
 .../clock/mediatek,mt6735-topckgen.h          |   79 ++
 .../reset/mediatek,mt6735-infracfg.h          |   31 +
 .../reset/mediatek,mt6735-pericfg.h           |   31 +
 17 files changed, 2085 insertions(+), 5 deletions(-)
 create mode 100644 drivers/clk/mediatek/clk-mt6735-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-infracfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-pericfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt6735-topckgen.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-apmixedsys.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-infracfg.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-pericfg.h
 create mode 100644 include/dt-bindings/clock/mediatek,mt6735-topckgen.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-infracfg.h
 create mode 100644 include/dt-bindings/reset/mediatek,mt6735-pericfg.h

-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
