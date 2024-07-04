Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D865C30653
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jul 2024 13:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HmDEGcYVnqW29UdeleiXLs3oBwwnPw6cUkNXeZbqtPw=; b=hHYtAQ6CjIf/hB
	ZfWBdBph102yTDkjA9/VL3MAJcIDpa3LLd0n+8B0Zl0kJI4Du+lGEzEje8csVR31dV7dexIhnDwSz
	xVYC8SBvP2TTAcPBwaN+qxxPyN0x3bVnYoUn5uJwL0lW2Pv69xJOe/c+svY8hyPmeuMjqtF27mAmX
	J6ylXdnud485WHMlnZtfAcYKJTdfuc+fIn465S1vpsr/P+coD/regEYS7pZsVNGiieoF9VBXNkjWG
	svlUG1ZQ3cpr5T28cokaRexuEUVyI8P+E7HdClSAAaYHmC+Wz5qLj4W65uuBnVzKYHYs+Y26xy4VR
	EcSc0S7J/JKQMNXpzU3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMdk-0000000DInA-1CaE;
	Thu, 04 Jul 2024 13:36:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPMdf-0000000DIjn-3ktq
	for linux-mediatek@lists.infradead.org;
	Thu, 04 Jul 2024 13:36:46 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-42573d3f7e4so4301945e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Jul 2024 06:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1720100201; x=1720705001; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HmDEGcYVnqW29UdeleiXLs3oBwwnPw6cUkNXeZbqtPw=;
        b=Rviml6Mb5TsQUU9vJMVOkduMOeAGuu+wFV9GVQZY2tLqg1/SvQFz8amESUAbYIA33x
         gW8MCqjeN/KToZBtCway/dLNS0lNT6J2+W7nTByY76WPoeK2Tiq7dK16CgLp8i1yrwJs
         iF8vEJVH+qFM+CN1ztlaJ5+n6qriatG/0x8jDswtda5eDMr4JJhsFp094bRmHgRxsPsu
         0PuRItJ0GZ/cOGsSTZiXyuAqGO4AfpKzKzTE0uODDNLMapqudgOp691zk6l2LxBHJ6GD
         uGEpyp2tz9iOqyJVFnCWTVY/JEgTti8chOxOHiaA1MuO4veYbveBdJK1ZY9dAuF0Z0EK
         123g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720100201; x=1720705001;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmDEGcYVnqW29UdeleiXLs3oBwwnPw6cUkNXeZbqtPw=;
        b=UCUyJMcuL+hf9mPkyP4qTk8b3LfXyQc7n9qHDndlsqM9fH8wTwq/qYzrKhhb9a/sy5
         pQH3amPH8+7dopXB99a6sLZ/TBma1JOAvf0wZ8Mpbrfmh6PqXvDMzaj0dOIFsTp0qApA
         zm9YWK6073LUIEK+Mcy672xjzY1m0+21v9t7HvH6cht7kCkAhxRqIDOfM0JNjOTOQuBe
         FNTe8i9IZpGhidLpXf/Pq9ndy+Ej9DnvVH5BSKvmR6bttWzRmQUSE3m9ayLNFB8wXj4U
         bZ0yc4jKGuaUsVpTIraObged8GZ0fyEHvu5zt0RRYHhfRIJiCdNfuO6zYwyASOwNkxLU
         HJXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5oRu3sPdW1ZZcRgUYJ0pMH3tUN0DPjkY3MZ9f4p4XFaWT8PLrsOlO7pcEALq4r/aBpnytUfAgAW3gLxBAJD9xghEBvheCBCheO4PQGeiyRd8K
X-Gm-Message-State: AOJu0YxPz2UM8kB3+aEFSQFm9xQNKCKqsEbARvl+/YvOGMJU0lMqTQWM
	tu8Cf5a9RW9yps3Ssm2IANM0+UxMpXUUhn0uKdIcsaf6KQSPgISBmdF8z1qyHZY=
X-Google-Smtp-Source: AGHT+IEnwsl0E+g8xdryhGuWa8dY3VAhuYEKnIZxskaLPzsW6LR0drF4Cil6yfo52blmMWh71oq3DA==
X-Received: by 2002:a1c:4b0d:0:b0:424:a2ad:69a with SMTP id 5b1f17b1804b1-4264a3e877fmr13123835e9.23.1720100201352;
        Thu, 04 Jul 2024 06:36:41 -0700 (PDT)
Received: from [192.168.42.0] ([2a02:8428:e55b:1101:1e41:304e:170b:482f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2ca5d5sm25382025e9.30.2024.07.04.06.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 06:36:40 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v5 0/5] Add Mediatek ISP3.0
Date: Thu, 04 Jul 2024 15:36:39 +0200
Message-Id: <20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGelhmYC/x3MwQqDMAyA4VeRnBcI6rTbqwwPoY0axrQ0KkLx3
 S07fof/z2CSVAzeVYYkh5quS8HzUYGfeZkENRRDTXVLPbXIIeBv+6JaxAYJbY9xTRsyOX71zrN
 vOih1TDLq+T9/huu6AaTgnvNpAAAA
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Andy Hsieh <andy.hsieh@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Julien Stephan <jstephan@baylibre.com>, 
 Louis Kuo <louis.kuo@mediatek.com>, Phi-Bang Nguyen <pnguyen@baylibre.com>, 
 Florian Sylvestre <fsylvestre@baylibre.com>, 
 Paul Elder <paul.elder@ideasonboard.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240704_063644_167318_B7965A9F 
X-CRM114-Status: GOOD (  19.24  )
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

This series adds the support of the Mediatek ISP3.0 found on some
Mediatek SoCs such as the mt8365. The driver is divided into 2 parts:

* SENINF: the sensor interface
* CAMSV: this driver provides a path to bypass the SoC ISP so that image
  data coming from the SENINF can go directly into memory without any
  image processing. This allows the use of an external ISP or camera
  sensor directly.

The SENINF driver is based on previous work done by Louis Kuo available
as an RFC here: https://lore.kernel.org/all/20200708104023.3225-1-louis.kuo@mediatek.com/

This series depends on the following series for the phy [1]

Changes on v5:
drivers:
- rebase on 6.10-rc1
- fix various comments from all reviews (mostly style issues and minor
  code refactor)
- add a function to calculate the clock divider for the master sensor
  clock: NOTE: setting this register seems to have no effect at all,
  currently checking with mediatek apps engineer (OOO until 17/04)

bindings:
- camsv: update description
- seninf: fix phy definition and example indentation
- use generic name for node example

dts:
- sort nodes by addresses
- use lower case for hexadecimal

Changes in v4:
- fix suspend/resume deadlock
- fix various locking issues reported by Laurent Pinchart on v3
- run LOCKDEP
- add missing include reported by kernel-test-robot for non mediatek arch and COMPILE_TEST=y
- use atomic poll inside mtk_camsv30_setup
- drop second lane support as it was not used
- remove useless members in structs
- fix media entity initialization
- initialize correct pad for camsv video device
- add isp support in mt8365.dtsi
- rebase on 6.7

Changes in v3:
- fix a lot of formatting issues/coding style issues found in camsv/seninf reported by Angelo on v2
- fix camsv/seninf binding file error reported by Rob

Changes in v2:
- renamed clock `cam_seninf` to `camsys`
- renamed clock `top_mux_seninf` to `top_mux`
- moved phy properties from port nodes to top level
- remove patternProperties
- specify power management dependency in the cover letter description to fix
  missing include in dt-binding example
- change '$ref' properties on some endpoint nodes from
  '$ref: video-interfaces.yaml#' to '$ref: /schemas/graph.yaml#/$defs/endpoint-base'
 where applicable

Best
Julien Stephan

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
Julien Stephan (1):
      arm64: dts: mediatek: mt8365: Add support for camera

Louis Kuo (2):
      dt-bindings: media: add mediatek ISP3.0 sensor interface
      media: platform: mediatek: isp_30: add mediatek ISP3.0 sensor interface

Phi-bang Nguyen (2):
      dt-bindings: media: add mediatek ISP3.0 camsv
      media: platform: mediatek: isp_30: add mediatek ISP3.0 camsv

 .../bindings/media/mediatek,mt8365-camsv.yaml      |  109 ++
 .../bindings/media/mediatek,mt8365-seninf.yaml     |  275 ++++
 MAINTAINERS                                        |   10 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |  125 ++
 drivers/media/platform/mediatek/Kconfig            |    1 +
 drivers/media/platform/mediatek/Makefile           |    1 +
 drivers/media/platform/mediatek/isp/Kconfig        |    2 +
 drivers/media/platform/mediatek/isp/Makefile       |    3 +
 drivers/media/platform/mediatek/isp/isp_30/Kconfig |   35 +
 .../media/platform/mediatek/isp/isp_30/Makefile    |    4 +
 .../platform/mediatek/isp/isp_30/camsv/Makefile    |    7 +
 .../platform/mediatek/isp/isp_30/camsv/mtk_camsv.c |  327 ++++
 .../platform/mediatek/isp/isp_30/camsv/mtk_camsv.h |  196 +++
 .../mediatek/isp/isp_30/camsv/mtk_camsv30_hw.c     |  413 +++++
 .../mediatek/isp/isp_30/camsv/mtk_camsv30_regs.h   |   60 +
 .../mediatek/isp/isp_30/camsv/mtk_camsv_video.c    |  750 ++++++++++
 .../platform/mediatek/isp/isp_30/seninf/Makefile   |    5 +
 .../mediatek/isp/isp_30/seninf/mtk_seninf.c        | 1576 ++++++++++++++++++++
 .../mediatek/isp/isp_30/seninf/mtk_seninf_reg.h    |  117 ++
 19 files changed, 4016 insertions(+)
---
base-commit: 99b9aaac4abdf30968b2ce9c9848951290fbde92
change-id: 20240704-add-mtk-isp-3-0-support-a08a978cac36

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>


