Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003DEEB64DD
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Aug 2023 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7WlaoSNS0YQPW0Ym1+gME4oJekwgVfQCX8PcT91w2v4=; b=QJSPCaNnM9E1dLg2fmdCiiA5Kh
	3Vci0jGxouH+DYTlyJAUe+4MUvK7AQdX8yGdPULoK8qf5VCRLRX/Ln6rbtM/4dWtaxaI/4cIKqOUR
	nz0NnvtKFlF/hUromlSgM6QVe+FfwjzpqfC4TSfSKwiUdo0bUKwX2lrN6V8pNpMmUJSpEcWw6Zw36
	sHmdS2Nvq9thRJWDos+E+xHgaJ8XsBIU/dqug1BjnHcCZWKNkc/DRe/765h4AI52BTviAXUpELY10
	ttsRX3FPaVrJjjlmp1ei8JtoNkXmoTETvKYbFTSVnefydgf086HLOjkaXPhCyujST3u69O5ogMlmf
	2PZJHLIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSws4-00GbTj-0E;
	Mon, 07 Aug 2023 09:49:52 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSws0-00GbRz-1J
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Aug 2023 09:49:49 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fe5eb84d8bso2982725e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Aug 2023 02:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691401785; x=1692006585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7WlaoSNS0YQPW0Ym1+gME4oJekwgVfQCX8PcT91w2v4=;
        b=Sa8PD0Y+SHMOpyVVYoPVv0bjF/lbLKgj8brbLKMHB8UR/YlDmps4DaYcK/PwagxM5F
         6kj6WB7tBpA9MZ9ZWuihJwiZQsnl6xQ4k8WAXX/8+kWxY1wrE0r0ox/EvvAt7xpGVOGE
         x/kB838MjxHRBYpAz641hN7ivYvnA8uW2WhfnGIyOUDiydJEc2Yq3fPLPejKhK5qcYxR
         hKQcmgGik+3OcEJEli0L4ToKdkPsFxencPLkDz77AoI4x7382U1jeilqSekJNYO7GhLA
         4724WjNHZSsxaBeZRFpTa33rn7eP0ByHaVUMfeO0PO979YDxlKsYWXAUO8u3Jrfoh/OJ
         Osgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691401785; x=1692006585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7WlaoSNS0YQPW0Ym1+gME4oJekwgVfQCX8PcT91w2v4=;
        b=l9Bzh+tvxsuih0B/+CFnEyZzmjdy6XAwQIkdGuTF/wi6KCCcvv1PinhJfHtVBkNfJv
         PVgwWcbsB+rgAw3iSfDGubi8vnKYOG3u4cbcIvv6QzjqJVGurwPnK+++9qWr12Mvqd2W
         NtocHH+VuzJqHCfC9hdzYLFwqk9FIRl1p+KXtTStIkxr3Vh0282mKd7Kd3OoYKpUwYyj
         XbrI6cjPNvolQHA5hjMokgXdMqM3f8f/weuioooysleGZ124lxiWvHJN6jPR1r0SRRUt
         jlP7bC9+VLy8h92YJ2XVnCzxV4iIPh+FcJb0bq4wmCsw2kcijqGi8/HxPM8yKwtl6B7A
         OKfQ==
X-Gm-Message-State: AOJu0Yzwk0p/uES/zZeGwcwrPHbVda2Wl2C3GQo14rKjgBnJ1sP/AmR9
	DN/PtJdVKDDTxORz/ai5R7rYmQ==
X-Google-Smtp-Source: AGHT+IEQJRkkN0Aet2aRuHdQXnzNkF4CizFKB1Dy7s2jxhLny1IPKP1IQDAj6d1UgfXDOBClCgMuQA==
X-Received: by 2002:a1c:7913:0:b0:3fb:b248:67c with SMTP id l19-20020a1c7913000000b003fbb248067cmr5522062wme.22.1691401784845;
        Mon, 07 Aug 2023 02:49:44 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id i11-20020a05600c2d8b00b003fe5228b78dsm2752429wmg.1.2023.08.07.02.49.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 02:49:44 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Cc: Julien Stephan <jstephan@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	daoyuan huang <daoyuan.huang@mediatek.com>,
	devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-media@vger.kernel.org,
	Louis Kuo <louis.kuo@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Moudy Ho <moudy.ho@mediatek.com>,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Ping-Hsun Wu <ping-hsun.wu@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 0/4] Add Mediatek ISP3.0
Date: Mon,  7 Aug 2023 11:48:09 +0200
Message-ID: <20230807094940.329165-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_024948_443472_C91C8E51 
X-CRM114-Status: GOOD (  17.13  )
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

This series depends on the following series: [1] for the phy,  [2] for
power management support

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

[1] : https://lore.kernel.org/all/20230620121928.1231745-1-jstephan@baylibre.com/
[2] : https://lore.kernel.org/lkml/20230627131040.3418538-1-msp@baylibre.com/


Louis Kuo (2):
  dt-bindings: media: add mediatek ISP3.0 sensor interface
  media: platform: mediatek: isp_30: add mediatek ISP3.0 sensor
    interface

Phi-bang Nguyen (2):
  dt-bindings: media: add mediatek ISP3.0 camsv
  media: platform: mediatek: isp_30: add mediatek ISP3.0 camsv

 .../bindings/media/mediatek,mt8365-camsv.yaml |  109 ++
 .../media/mediatek,mt8365-seninf.yaml         |  259 +++
 MAINTAINERS                                   |   10 +
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/isp/Kconfig   |    2 +
 drivers/media/platform/mediatek/isp/Makefile  |    3 +
 .../platform/mediatek/isp/isp_30/Kconfig      |   35 +
 .../platform/mediatek/isp/isp_30/Makefile     |    4 +
 .../mediatek/isp/isp_30/camsv/Makefile        |    7 +
 .../mediatek/isp/isp_30/camsv/mtk_camsv.c     |  328 ++++
 .../mediatek/isp/isp_30/camsv/mtk_camsv.h     |  196 +++
 .../isp/isp_30/camsv/mtk_camsv30_hw.c         |  432 +++++
 .../isp/isp_30/camsv/mtk_camsv30_regs.h       |   60 +
 .../isp/isp_30/camsv/mtk_camsv_video.c        |  781 +++++++++
 .../mediatek/isp/isp_30/seninf/Makefile       |    5 +
 .../mediatek/isp/isp_30/seninf/mtk_seninf.c   | 1491 +++++++++++++++++
 .../isp/isp_30/seninf/mtk_seninf_reg.h        |  112 ++
 18 files changed, 3836 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
 create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
 create mode 100644 drivers/media/platform/mediatek/isp/Kconfig
 create mode 100644 drivers/media/platform/mediatek/isp/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_30/Kconfig
 create mode 100644 drivers/media/platform/mediatek/isp/isp_30/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv30_hw.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv30_regs.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv_video.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_30/seninf/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf_reg.h

-- 
2.41.0


