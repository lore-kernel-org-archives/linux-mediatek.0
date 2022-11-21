Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD1FC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 15:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ApgbBZshAeQOw9pkeKTeXHyu/sDAx7l2fVv7nBtVMo4=; b=cYFZOAJW67mUaT1keQfzlPEg22
	UZnUaoCv/xco8pDng3RALRM0JXlc8v8o0GG/vU3eWhLxU6RjT+4IJEX3mxckQVAUGC6kcD5luFLk9
	YoU8WCr4+0+JMJ6/Tf88RrReDpNSx+fTU/VoDyqrWiTdl2ewsTHCudBBO8VrXnnAG9YS7QgtB60mG
	pqZNZcPrjAQC49ITyQBdn4TtyWQr+5tGyYNUss6toL210DSGiDjElnZ9nD5hyMrOEX7oyxJXzZUqM
	WYs66PnO8uPkGwPLo9KqYlkDWM5dMW6niY1tWlBAWtdcbVtivcRP/2GJPWD5RBxrSF6GEPhA/ikIR
	mhFktKTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox8nR-00FEUt-UD; Mon, 21 Nov 2022 15:33:21 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox7hf-00EOse-1R
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 14:23:21 +0000
Received: by mail-wr1-x42f.google.com with SMTP id e11so7172584wru.8
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Nov 2022 06:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=ApgbBZshAeQOw9pkeKTeXHyu/sDAx7l2fVv7nBtVMo4=;
        b=JOj8ERrSkiiFbvhLUOS10gbdm3dGjio1sc0L+J+VhUjPOtREOV5XC6V5KMnetrOj7Z
         MqlTFilZxnRBw5U34g0W/99jVnzlDBgjEkl0cJq9cc+zW7lCsZuKJmJLniXbj18sfn6q
         wjZPYk8Rpmir1EmWy0FgcKpinL7Wh/ovXYkUm8iQYBe43aScTrtTEjMDggnsI5wPLvCy
         /STO9raP2yYZowKD+UKXBO+Noq3BOEso0jV6VE6jRVFYIE4aG03pLMcQ/yk+hdxToHDH
         dSmCQEdwO+k1vwDIFKNRm+b1PG46FUK1eS4iNFo7oMMDVUb0EQzjVmcrr2ibmRamEGHY
         maXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ApgbBZshAeQOw9pkeKTeXHyu/sDAx7l2fVv7nBtVMo4=;
        b=lixjq3QE67TOtgnbQtkcrOH7d4coqdlii/LtSuP1AJkozRXE5QgMWg5BjBaw3evDj9
         L4CKHZeveEj2hMpWC6VxlyamcIvDCJkXzwAGFP7n8t1LH2aUMlKQlEW6lm+CoFWfE0Tv
         tx16o8psuCS0ofwvriaSi6C5d5LUreAP6M5ErBJ+1zVUvyybc5+thpmOvl+hO3JDxknL
         WbjYRk2zqdvSHjzt2Bes7U4H59sO5U2n9q+Dnymvl7EWYmhOSD6vUfSJ9EdkJRQriZ80
         U77n160bix5WHI9SLUR596ODsKb3n1Wg/9St2LmRRl0sVE5QEYQWr3Q6CjP1jhWLJ1lv
         0kNA==
X-Gm-Message-State: ANoB5pmEtAOqmC1qPW2+f2f9gbEU40wAZfAYYPYQGVqktpi83Xl047Vh
	l2arvCPaDY65zyybCPM3bl5u7g==
X-Google-Smtp-Source: AA0mqf6RSC4twqdaC4T+eNyvJRXlNyhsDoJT4o9bQNdbOdWsagRC7U2kD1RJas+wAHB1EBwcNi5PLA==
X-Received: by 2002:adf:e303:0:b0:22e:3c66:bda1 with SMTP id b3-20020adfe303000000b0022e3c66bda1mr2684983wrj.139.1669040591732;
        Mon, 21 Nov 2022 06:23:11 -0800 (PST)
Received: from [127.0.0.1] (2a02-8440-6441-244f-3074-96af-9642-0002.rev.sfr.net. [2a02:8440:6441:244f:3074:96af:9642:2])
        by smtp.gmail.com with ESMTPSA id m7-20020a05600c4f4700b003b4fe03c881sm20206468wmq.48.2022.11.21.06.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Nov 2022 06:23:11 -0800 (PST)
Subject: [PATCH v4 0/3] Add MT8195 HDMI phy support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIAN6Ie2MC/23MTQrCMBAF4KuUWRtJ0lATV72HiOSvJtimkNRAKb27gxuhuBre432zQfE5+gLXZo
 PsayxxThjEqQEbdHp6Eh1m4JRzqpgiwU3xMS0vwIXRxROTdbIBN+k9jliGWJY5r9+PleG5/XBlhBIh
 hZCss0pS2Ru9jtFkf7bzBHfklR8IRyIFU84OYqDK/SHtgbRItKTtwLuOMn45kH3fP9SYURL4AAAA
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Mon, 21 Nov 2022 15:19:10 +0100
Message-Id: <20220919-v4-0-bdc21e1307e9@baylibre.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 CK Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jitao shi <jitao.shi@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, Kishon Vijay Abraham I <kishon@ti.com>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Guillaume Ranquet <granquet@baylibre.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 stuart.lee@mediatek.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, mac.shen@mediatek.com,
 linux-phy@lists.infradead.org, linux-mediatek@lists.infradead.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_062319_127399_2E81275F 
X-CRM114-Status: GOOD (  12.52  )
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

Add support for HDMI phy on MT8195.

This is split from the previous v3 to contain only the phy related
changes to the HDMI support for mt8195 as suggested by Vinod.

This is based on top of next-20221121

To: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Kishon Vijay Abraham I <kishon@ti.com>
To: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: CK Hu <ck.hu@mediatek.com>
To: Jitao shi <jitao.shi@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-phy@lists.infradead.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mac.shen@mediatek.com
CC: stuart.lee@mediatek.com
Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
Changes in v4:
- Dedicated series for HDMI phy support (without the drm/ related
  changes)
- Removed useless variable initializations in phy driver
- Link to v3: https://lore.kernel.org/r/20220919-v3-0-a803f2660127@baylibre.com

Changes in v3:
- phy: Grouped register and bit definition together to add clarity
- dt-bindings: Addressed comments
- Link to v2: https://lore.kernel.org/r/20220919-v2-0-8419dcf4f09d@baylibre.com

Changes in v2:
- Removed syscon requirement from the hdmi node
- Use as much as possible bit FIELD_PREP/FIELD_GET macros across all the
  patches
- Make cec optional dynamically instead of hardcoded with a flag
- Renamed hdmi variants to v1 (legacy) and v2 (mt8195) while waiting for
  a better name
- Rework hdmi v2 code to use a connector (same as v1)
- Remove "magic" 0x43 addr special handling in hdmi ddc code
- Link to v1: https://lore.kernel.org/r/20220919-v1-0-4844816c9808@baylibre.com

---
Guillaume Ranquet (3):
      dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible
      phy: phy-mtk-hdmi: Add generic phy configure callback
      phy: mediatek: add support for phy-mtk-hdmi-mt8195

 .../devicetree/bindings/phy/mediatek,hdmi-phy.yaml |   1 +
 drivers/phy/mediatek/Makefile                      |   1 +
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c         | 541 +++++++++++++++++++++
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.h         | 111 +++++
 drivers/phy/mediatek/phy-mtk-hdmi.c                |  15 +
 drivers/phy/mediatek/phy-mtk-hdmi.h                |   2 +
 6 files changed, 671 insertions(+)
---
base-commit: e4cd8d3ff7f9efeb97330e5e9b99eeb2a68f5cf9
change-id: 20220919-hdmi_mtk

Best regards,
-- 
Guillaume Ranquet <granquet@baylibre.com>

