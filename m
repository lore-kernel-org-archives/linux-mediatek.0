Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E1FBC433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Oct 2022 14:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:Date:From:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tgE0FLvM8ucDhQ/XFC4TsW1lQP/cE6WWYc/1CEGZeM4=; b=ni/tCH4NnnoXp8uc2bPFCfcHLe
	Z28CTyHXFdx65ECWH9AcafjABB4rvFqwqV/jTbNDKR4p5TE3ib+0XLAJVYDTTtnSMHtW4xD8hE2xZ
	8ZEvz3pkVdNvqiKFWP9XR6xB2p+3S2b2qmwzk+8b7UOoqPW8SlMLJ575qnIKJJ4qktMIGqfTe+tBO
	3cfjQ4DGEY7Mlv/3iZSDiOF0iPsOacOa7RRDYn2RBrcwLzAGUampA5ajbmUOWgftaOW8E7ZoDM6E7
	W4BQ3S26k2IsZ+zb+/l1+F0XvcfLjREbg159S2C/NfanIzds2x0taNxWokQQA4Ds3wTPDKiOvE4vS
	AijoWGvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olABo-002pDH-4S; Wed, 19 Oct 2022 14:37:00 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol9tO-002i5O-Us
	for linux-mediatek@lists.infradead.org; Wed, 19 Oct 2022 14:18:01 +0000
Received: by mail-wm1-x331.google.com with SMTP id n16-20020a05600c4f9000b003c17bf8ddecso994563wmq.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Oct 2022 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=tgE0FLvM8ucDhQ/XFC4TsW1lQP/cE6WWYc/1CEGZeM4=;
        b=5/SwuTkh9AuZjgBO2c/82wyMw/fr7W8mDdVmMEiV+XWpKq8UWeBWJcheHnJ+jJ5ZxB
         HUML7tRazDOcItLtuJNRnh695/rDKb7B650uXDhDJXiTZe+DS+Da8V35L5Zfj1r2LRoi
         QsKBZ76KN9NTva8BGtSPwv3AZebtftYk8CPzTlkFmUYPKJeeRH7A91IdWISOtzFxYn/Q
         C5ZD6HgOOGoBisWECtKGC41QwksD8IdccHA4di+pqz14N0rjGgCWpyRtImrXdHE6hxXO
         o9N8MsNpiImXFThoRN7zIvOoeIHlQuL45PQ+URY4DBhQZc8uDU9Yj3QqIDUuF55GYs4i
         7VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:message-id:date:from:content-transfer-encoding:mime-version
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tgE0FLvM8ucDhQ/XFC4TsW1lQP/cE6WWYc/1CEGZeM4=;
        b=lQxx17ZSyBN2Aq0xaxcSbv6XAVaJDW8FuJsLxi/U91+xcNCYz4/zzDuiaEUKckSCpQ
         5CofoExzf3gKPo3a0svcn81DIwztCrLEJ4NJQbgcvmZTyM3aGPZWe+nvQM62U7HDwQTf
         fsgLwhANcbxiLSJSFv80fRBzX+eoAsanFl+p9Tk1ukPL3AjDCisnjAvi/Z4JpExZufm/
         OKqIjXPQ2afpidLNxJunBkeXBwwlVaORWoimG70gO5jA6umpqdiYoAYmXSjiMuytdX9w
         TEA0blQHn2T17d5xJpKkgrAH+6n40kcQcCVIOhxmrl7jPpINGvTre0IWMWJAQXQb+n0l
         xDnQ==
X-Gm-Message-State: ACrzQf0cA44XFPj5MuO4rK7iVgkfWYpuP2oBrKN8/PK8Qa6lvn82CJI9
	kPZ8SGhhhlNZDeTjob1Uet0JfaaIN+MWiw==
X-Google-Smtp-Source: AMsMyM41t4ieHvPEMZSwVTSTH/SaFUbZSisbnlHXyyDLRTf2X+rqyNcpCqzj4pDtpvuqYWysDO8SYw==
X-Received: by 2002:a05:600c:3b88:b0:3c6:cef8:8465 with SMTP id n8-20020a05600c3b8800b003c6cef88465mr26386904wms.64.1666189077476;
        Wed, 19 Oct 2022 07:17:57 -0700 (PDT)
Received: from [127.0.1.1] (rtr.23.90.200.126.unyc.it. [23.90.200.126])
        by smtp.googlemail.com with ESMTPSA id n9-20020a05600c3b8900b003b4ff30e566sm2126577wms.3.2022.10.19.07.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 07:17:57 -0700 (PDT)
Subject: [PATCH v6 0/4] thermal: mediatek: Add support for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-b4-tracking: H4sIABEHUGMC/w2LQQqEMAwAvyI5G6gtVtnfRBttoMal1b2If98cZ4Z5oHEVbvDpHqj8kyanGsS+gz
 WT7oySjME77wc3zHh/UcLo8MpcDyq4VNHdJKUwxxQmN8YN7F6osUXSNduvdynv+wdpzSLpbgAAAA==
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Date: Wed, 19 Oct 2022 16:17:53 +0200
Message-Id: <20221018-up-i350-thermal-bringup-v6-0-c87b9f75550b@baylibre.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Amit Kucheria <amitk@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org, Rob Herring <robh@kernel.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Michael Kao <michael.kao@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1666189076; l=936;
 i=aouledameur@baylibre.com; s=20220920; h=from:subject:message-id;
 bh=AkQkB8ukw3UxEfgonly6hxwIDLwEx/thToGWUZdxIJE=;
 b=SUWFXCNucodISbrUskCDh0YoTCsogZWud3XzdBli3zQmimygHWg70FPtlIqqm07DyoyO9egxtzMa
 qhul2jb6A/7tt607LQkz4h/HD6jC5iu8Fis6htcIgDiP2uTf8nru
X-Developer-Key: i=aouledameur@baylibre.com; a=ed25519;
 pk=HgYWawSL4qLGPx+RzJ+Cuu+V8Pi/KQnDDm1wjWPMOFE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_071759_018066_04C4BFF6 
X-CRM114-Status: UNSURE (   8.21  )
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

This patchset adds thermal support for MT8365 SoC which contains three
thermal sensors.

Changes in V6:
- rebased on thermal/linux-next

Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
---
Amjad Ouled-Ameur (1):
      thermal: mediatek: add another get_temp ops for thermal sensors

Fabien Parent (2):
      dt-bindings: thermal: mediatek: add binding documentation for MT8365 SoC
      thermal: mediatek: add support for MT8365 SoC

Markus Schneider-Pargmann (1):
      thermal: mediatek: control buffer enablement tweaks

 .../bindings/thermal/mediatek-thermal.txt          |   1 +
 drivers/thermal/mtk_thermal.c                      | 197 +++++++++++++++++----
 2 files changed, 166 insertions(+), 32 deletions(-)
---
base-commit: 68c0c5a5d991b6633e2b2d3c55713d123113fb60
change-id: 20221018-up-i350-thermal-bringup-ad386d37056f

Best regards,
-- 
Amjad Ouled-Ameur <aouledameur@baylibre.com>

