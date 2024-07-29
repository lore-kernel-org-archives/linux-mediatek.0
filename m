Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC32C3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 16:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7VN27lnGUNsVwhKI93/YGx82K/xOtrW+XHUZkxMgX6Y=; b=kXKnbQHHA2F8wB
	zG3P2ADYIXgq9RBrWHQfhpCIEqOwjVValqL1WeBZ312U2cKzhELBXrD/YdmWntKcxNosqkiHKNJse
	MGamitwBuo0Mnq46DlyUW1ZtnlUw1i994AfTIxSPJrDQWEyJ9PAEAmfSuDVr/WnWAHr4e3BAqYM4g
	CJqlsZNN9XC5qfxwA2v8PaNWWiKL+SDzX+H+POUMLXP/PYt8AAiOAe024EXfn+ZHF/jTIO7wBcckS
	I2DGqBiQeH03d9X0M4w3e5aGV4JHJM6Msg7AsYERBQrgr18IS72CTwkdLTN6K7Cf/4tORrkFws6pf
	ZMRJPIPq86WFWBu176Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYSnO-0000000BvtZ-0auM;
	Mon, 29 Jul 2024 16:00:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYRfX-0000000Biy3-3xQf
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jul 2024 14:48:14 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4280bbdad3dso17932695e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jul 2024 07:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1722264490; x=1722869290; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7VN27lnGUNsVwhKI93/YGx82K/xOtrW+XHUZkxMgX6Y=;
        b=BZRyCk/N9/MTG9jZ0CkUFyUIUjM0gLt+A91ULsBQP8qVoXXTCZMrlEcaYYaL7UovIy
         ldDSi8qqrrKsHtd9pt5hQBqQrHuw6lo1Lg8URscFAwMydG0aNqRYs9LYmDqCaaKs/5Ep
         g8hKPO5gE7jPb/6S5wrNYgnBqezXqoFGMaRJ5qdqkIwEGpGLnFZQGqtmAOGbzb2tlN91
         k6ekfHUcyKzhmux+MNuH0GvJ0az1sniGZ3TQrsAhVKkzajmTVYDjghC71egECp3MgN8u
         beOYyAJMiRzFHFg7/Phg00sxsk6t/ql2O6ENlVZDLu2Vyr6Zhv/vRreIkzVOT63N7cp1
         n0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722264490; x=1722869290;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7VN27lnGUNsVwhKI93/YGx82K/xOtrW+XHUZkxMgX6Y=;
        b=ihE9IxMyNyHntvbjNSPScvr+YZI0ua3RrzRyA01mEIHegnL02C28akjYOw6bwI5icQ
         NsDVeGCJyMuxTVxkSF9Z+SpLrLgKNKE0OZlqmTteEK6wuzZbU848Y1qvkLV0xrVb76z/
         LaxY5UjkhxfC+UaYjifgOmnUdcL/bKChH1V7kYZgRMNFPSElH4NHqx9wh5dM5h5avMVi
         XpY/aBnJbCdGolsKspmmLNgq1dqBhEjC5oc5/0HtgrBy9rUggObPq0nA6VVrwvj7zcWy
         /iVwy/0t4yQYZ4x2tKp1/ayC2P2aW3aP6RwBBnynFE4njisH0eb1M21xXMRUmE5FWVaG
         41Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVcyev2CmGThjL+bYefbvhejjYGlhkl4wnnBGuiSBac19mFYplox2M4rxexhKBYuuKNSNmLPafaONP4MHU4uqZnvGSt14mZEda7/9hdeG2zKmHn
X-Gm-Message-State: AOJu0YySD6EgKShaEpvpsLlZBW/7s5eWg1z+P8hhzyRE9cu6e38qQF7K
	RaO5DOiHfnV1+lR/AXx5fPpYkPk/KVv0eB4ovFr+kCO8+Z/vB+1I2BjnIDlqPac=
X-Google-Smtp-Source: AGHT+IGRl6/MNLY2ZSmQMwTK/Pc+WFeT2/juGGW0MYOhUlv5eI7dtyXMyHhwMeLTTvCkHpcOzEmo7w==
X-Received: by 2002:a05:600c:3511:b0:428:3b5:816b with SMTP id 5b1f17b1804b1-42811d6e2ddmr55999485e9.3.1722264489790;
        Mon, 29 Jul 2024 07:48:09 -0700 (PDT)
Received: from [192.168.42.0] (2a02-842a-d52e-6101-6fd0-06c4-5d68-f0a5.rev.sfr.net. [2a02:842a:d52e:6101:6fd0:6c4:5d68:f0a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428057b645dsm180091705e9.43.2024.07.29.07.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 07:48:09 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Subject: [PATCH v6 0/5] Add Mediatek ISP3.0
Date: Mon, 29 Jul 2024 16:47:59 +0200
Message-Id: <20240729-add-mtk-isp-3-0-support-v6-0-c374c9e0c672@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKCrp2YC/4WNQQ6CMBBFr0Jm7ZhaKKAr72FYtGWQiUKbFomEc
 HcLF/Dv3k/++ytECkwRbtkKgWaO7MYE5SkD2+vxSchtYpBCFqISBeq2xWF6IUePOQqMH+9dmFC
 LWl+r2mqbl5DWPlDH38P8aBL3HCcXluNoVnv73zmrBKazexRZebkbvbzZBDpbN0CzbdsPq2hQX
 8EAAAA=
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
X-CRM114-CacheID: sfid-20240729_074812_033397_B24014D7 
X-CRM114-Status: GOOD (  19.58  )
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

Changes in v6:
- remove unneeded "link" tag from commits

bindings:
- remove labels from example node
- remove complexity for phy and phy-name properties

driver:
- fix some comments from CK :
  - remove unneeded variables
  - rename irqlock to buf_list_lock for clarity
  - remove unneeded lock/unlock around hw_enable/hw_disable

- Link to v5: https://lore.kernel.org/r/20240704-add-mtk-isp-3-0-support-v5-0-bfccccc5ec21@baylibre.com

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
 .../bindings/media/mediatek,mt8365-seninf.yaml     |  259 ++++
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
 .../platform/mediatek/isp/isp_30/camsv/mtk_camsv.h |  192 +++
 .../mediatek/isp/isp_30/camsv/mtk_camsv30_hw.c     |  413 +++++
 .../mediatek/isp/isp_30/camsv/mtk_camsv30_regs.h   |   60 +
 .../mediatek/isp/isp_30/camsv/mtk_camsv_video.c    |  742 +++++++++
 .../platform/mediatek/isp/isp_30/seninf/Makefile   |    5 +
 .../mediatek/isp/isp_30/seninf/mtk_seninf.c        | 1576 ++++++++++++++++++++
 .../mediatek/isp/isp_30/seninf/mtk_seninf_reg.h    |  117 ++
 19 files changed, 3988 insertions(+)
---
base-commit: 99b9aaac4abdf30968b2ce9c9848951290fbde92
change-id: 20240704-add-mtk-isp-3-0-support-a08a978cac36

Best regards,
-- 
Julien Stephan <jstephan@baylibre.com>


