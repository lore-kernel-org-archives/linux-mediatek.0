Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6585C4707B
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jan 2024 15:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J8jYdrd32qpj6UYwFmFTXCiQDt/VqLbFNDBtbxT7ng8=; b=HcF4nzz3nurgjZm8Xe4m5g6yxr
	G826qdSHpf0ediz6Ed71TWYidKoFgnT8fG8iGCdFK9iENPdbkk3vg4lAebO6lxVskZk/qfsvMi0Tv
	XGVD6i5T2t7HDD8mSqnpDLH2xHoxrTC9lpthwi0+2qaMHMJom4RxLoIaUBFGZXbXnIFP2dqXJUb9e
	rRynKlWhLQrm8Ap988PJ9F3FxpCp3JxQ7B+HcL3LjmeTIe9fnslNnPQ5pCUlvzmumBf0uyiopuA4W
	ctCfJynHQt/26xjBlgkSzn0qmMPtmda6VsqjbyZEs9lQNx8SVCwYOuALnTIm82kabwG9oeGO8Zkro
	2AhVN/DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNaJ8-00CXFm-0y;
	Wed, 10 Jan 2024 15:15:54 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNZM7-00CEvl-0v
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jan 2024 14:14:57 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-40d88fff7faso43147375e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jan 2024 06:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1704896090; x=1705500890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J8jYdrd32qpj6UYwFmFTXCiQDt/VqLbFNDBtbxT7ng8=;
        b=oR7VKBMABUN6oFwb88kIA+TU8uXV7TEahrDJKWezM7FjPfJmLSrbkh7NtLiWv/PIT7
         84qfS4uiFXZiMQUQpfLWoGTriOjpdwlHcxbEq6+PAoNbII0JOQ3AiCusTkJHZptjE3or
         bcAiOyYvrm8b4QbGTsnIOQ0xXVTl3rjs76YxXjRU5iTluEaaAbJ3n3w4OAGp7UyaU5uY
         J7G5RxsrUSdhr4O+LZAFIRgQrni0kzZWT0ZgSjABzPjjLThfAHlQ73ZoG+VVZfSL8F/u
         sI2fqJE0lLy0PN4ia9Up/2pmmWnwRF6fYA6TVZ1MNR47uurLFt6T3xULgNpf1EGpR+wr
         oAXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704896090; x=1705500890;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8jYdrd32qpj6UYwFmFTXCiQDt/VqLbFNDBtbxT7ng8=;
        b=bGrxj54gqFqpXmDaudUKTyRAQVibqeKkajWMoilzkFSx91gY4jaSH5gvuWEhxZXmuO
         D0bAMUFClcMFpEt3/4gf1bBp8jdzPLAhIBNuWVd23A2Vi3P5MrOpa+FA6u7rN2l3vM35
         a+3mePpgmYSXbZ0qa4t08vjAks8Tyi9IQ7YBCQqi3PbTsIzKmn6Gqk9OMuxxlzIXJ1xm
         PYQlsC3tdBm9MA6oyIRoInn7SuUArdwHSXE1DPS8Y7Q0CGBGI7BaFu28RD1nmGK91lsF
         lVMSgkLw4hpGCY91NJcz+KFsPYXPdUzLtUsLZCMph38cFGuMpQqYom7O3QIfDOBdH38R
         BTQQ==
X-Gm-Message-State: AOJu0YzUwt1SOGnN1Dy47l+7IA75vTSfktapF6aOGBNsDXJa/EJkMpdE
	NvsUc7hj5M7nXguNRqhqGDp3tyetqLopwg==
X-Google-Smtp-Source: AGHT+IEHRXaEYKtpv9wgkctGP+Dh0vUx/8AF01+K3IuIdoRHwJAw23qEH0nWy3rq7+Sqm821M/hQ1Q==
X-Received: by 2002:a05:600c:c06:b0:40d:6f03:dd9a with SMTP id fm6-20020a05600c0c0600b0040d6f03dd9amr290341wmb.69.1704896090143;
        Wed, 10 Jan 2024 06:14:50 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id j17-20020a05600c1c1100b0040c46719966sm2363890wms.25.2024.01.10.06.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 06:14:49 -0800 (PST)
From: Julien Stephan <jstephan@baylibre.com>
To: 
Cc: Julien Stephan <jstephan@baylibre.com>,
	Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-media@vger.kernel.org,
	Louis Kuo <louis.kuo@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 0/5] Add Mediatek ISP3.0
Date: Wed, 10 Jan 2024 15:14:37 +0100
Message-ID: <20240110141443.364655-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_061455_331150_513D4F87 
X-CRM114-Status: GOOD (  19.10  )
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

[1] : https://lore.kernel.org/all/20230620121928.1231745-1-jstephan@baylibre.com/



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
 arch/arm64/boot/dts/mediatek/mt8365.dtsi      |  128 ++
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/isp/Kconfig   |    2 +
 drivers/media/platform/mediatek/isp/Makefile  |    3 +
 .../platform/mediatek/isp/isp_30/Kconfig      |   35 +
 .../platform/mediatek/isp/isp_30/Makefile     |    4 +
 .../mediatek/isp/isp_30/camsv/Makefile        |    7 +
 .../mediatek/isp/isp_30/camsv/mtk_camsv.c     |  328 ++++
 .../mediatek/isp/isp_30/camsv/mtk_camsv.h     |  199 +++
 .../isp/isp_30/camsv/mtk_camsv30_hw.c         |  427 +++++
 .../isp/isp_30/camsv/mtk_camsv30_regs.h       |   60 +
 .../isp/isp_30/camsv/mtk_camsv_video.c        |  774 +++++++++
 .../mediatek/isp/isp_30/seninf/Makefile       |    5 +
 .../mediatek/isp/isp_30/seninf/mtk_seninf.c   | 1488 +++++++++++++++++
 .../isp/isp_30/seninf/mtk_seninf_reg.h        |  112 ++
 19 files changed, 3952 insertions(+)
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
2.43.0


