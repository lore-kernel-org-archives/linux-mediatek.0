Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F781CCF9EC
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Sep 2023 23:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bNSNfomfnPwHfBajrQdtFtyEsEh3iT9NmkC7n6d5+lk=; b=AsXqL35Ns+zhTAHX8pDuTfWUjb
	1uSGuOT4VaYgWxw1oFkEEJWlCZ5LWAM/f+Y7ngj84lI/DQXidHAZoszRmi4oTz0+XcgBkeu+ebjYK
	rXGWPAoO1RZ37DBndLC9vLJpseDKUveJs0+LczZuAPkoyCS4R5SF6VaS9X/WI4FPeU2pVovh/Y1PZ
	egNzRYwokevNbkCUAPHcDqmdQaoFbE7/ELJBoQRzI1VYmeV5DoGCmmGDiNtwkbOMBpf3h72rNJGCq
	z36S9nF5bfbrFEDA+GYGJfMQwbnlJrbsqSvcq7TcHHNFpeHmSCIR1NhHG1dDD/dCtX3mRXPWSf8yp
	H/rSzqGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdfWS-006u5V-1i;
	Tue, 05 Sep 2023 23:31:52 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdfWO-006u3O-1I;
	Tue, 05 Sep 2023 23:31:50 +0000
Received: from pyrite.hamster-moth.ts.net (h175-177-042-159.catv02.itscom.jp [175.177.42.159])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBBF3B1;
	Wed,  6 Sep 2023 01:30:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1693956612;
	bh=y7wV/evml2IbKlgjDtIjPjWJ7o0VRAvqJGG6hYnSTuE=;
	h=From:To:Cc:Subject:Date:From;
	b=uTFvU6VawmuPqKS40ZjlxF6JA9+2QwNdkClz0M/ZlT3VN9gOf24WGNGtA3JZHLwGd
	 NJBq2mOtRd72agvwYP91yi2PtN1pwWt0b+GfrtmspIYHjGpyp5Z2v4lHZfrJxCaDqG
	 bPohtprZE337nA7QHGhOYPV8Dh9C8q5vazLoOg7s=
From: Paul Elder <paul.elder@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/3] media: i2c: Add driver for THine THP7312 ISP
Date: Wed,  6 Sep 2023 08:31:15 +0900
Message-Id: <20230905233118.183140-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_163148_604264_1E70975C 
X-CRM114-Status: GOOD (  14.71  )
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

This patch series adds support for a new driver for the THine THP7312
ISP. It has been tested on an OLogic Pumpkin i350, which has a Mediatek
mt8365 SoC, with the THine THSCG101 camera module.

Technically the driver itself (and its bindings) have no dependencies,
but to run/test this on the i350, a bunch of patches from Baylibre are
required. I have these organized in a branch [1], and I have another
branch on top which includes the patches from this series [2].

Patch 3 depends on the device tree for the Pumpkin board, which as far
as I know will be handled by Baylibre. I expect this patch to go in
alone, separately, and at a later date.

[1] https://git.uk.ideasonboard.com/THine/linux/src/branch/epaul/v6.5-rc1/base/thine/thp7312
[2] https://git.uk.ideasonboard.com/THine/linux/src/branch/epaul/v6.5-rc1/rc/thine/thp7312

Paul Elder (3):
  dt-bindings: media: Add THine THP7312 ISP
  media: i2c: Add driver for THine THP7312
  arm64: dts: mediatek: mt8365-pumpkin: Add overlays for thp7312 cameras

 .../bindings/media/thine,thp7312.yaml         |  170 ++
 arch/arm64/boot/dts/mediatek/Makefile         |    4 +
 .../mt8365-pumpkin-common-thp7312.dtsi        |   23 +
 .../mt8365-pumpkin-csi0-thp7312-imx258.dtso   |   73 +
 .../mt8365-pumpkin-csi1-thp7312-imx258.dtso   |   73 +
 drivers/media/i2c/Kconfig                     |    9 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/thp7312.c                   | 1674 +++++++++++++++++
 8 files changed, 2027 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/thine,thp7312.yaml
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-common-thp7312.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi1-thp7312-imx258.dtso
 create mode 100644 drivers/media/i2c/thp7312.c

-- 
2.39.2


