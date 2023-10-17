Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B3ACDB483
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Oct 2023 13:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uZhbFeXQFU5PshdR6hYFiLA/07ywKogPAjdKAj0MDJc=; b=GiNVEvqZTdG6AZ0AK2TCSJQOX5
	reIowbSN90vAKMx5fFyEvyHPwEdGWrD9BgNGPpS9nxWhi1o8RoSByLpqxIZkm8Gqtf8sMYnvTI+cv
	u3RymLQEuRYP0UyPKWrFqnPjitoezGbo9NOOWlcYRQv4HQqL4QMFV8ed5BtVvuqDl/MA2+b2UZ9vB
	4F8D+ZKPipV6wjAWRk/hkEYd91S1aqI/gUgwwMCoFbzexUmm6/IFKlgLzAbZca7GUi2cCMZUI52rS
	671xGQTz377wpY3aEuKhlDrpl8zIz9JrydcTaL8T1aFVPE9YkQkdZFhi+M7nDeytcBZIiqoko+txr
	dKGi1yVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsk0O-00CPaB-2v;
	Tue, 17 Oct 2023 13:21:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsk0M-00CPYD-0C
	for linux-mediatek@lists.infradead.org;
	Tue, 17 Oct 2023 13:21:03 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3A3B0E4;
	Tue, 17 Oct 2023 15:20:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697548849;
	bh=gbgYMJvKnjhiJyMHxXBo4LnQ51qEyp8jsOGW6q/iOzE=;
	h=From:To:Cc:Subject:Date:From;
	b=cef3hG/QS4Dw0R8MT2q0Nyr36qgnOhh6suOT+gnLa1gByIohXk+NvvoKePAOmapNq
	 JeAdIEtGw66a6nJGisDFvlbWF9y4TjQFte8NxrlzZiECWO4CgdN09IQ3gdFtn8M1qc
	 GdQN6RyeaOHSryvX0f3xSSqikk/6xcxvdcx5XEGM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 0/3] media: i2c: Add driver for THine THP7312 ISP
Date: Tue, 17 Oct 2023 16:21:00 +0300
Message-ID: <20231017132103.9914-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231017_062102_246136_1D91DAEC 
X-CRM114-Status: GOOD (  13.56  )
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

Hello,

This patch series adds a new driver for the THine THP7312 ISP. It has
been tested on an OLogic Pumpkin i350, which has a Mediatek MT8365 SoC,
with the THine THSCG101 camera module.

Technically the driver itself (and its bindings) have no dependencies,
but to run/test this on the Pumpkin i350 with the mainline kernel, a
number of patches are needed to support the board and the MT8365 SoC.
Some of those patches are on their way to mainline, and some, like the
Pumpkin i350 board device tree, will require more work. For convenience
and reference, the needed patches are available in [1].

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=mtk/v6.6/pumpkin/camera

Example overlays for DT integration of the THP7312 are available in that
branch, in
arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi0-thp7312-imx258.dtso and
arch/arm64/boot/dts/mediatek/mt8365-pumpkin-csi1-thp7312-imx258.dtso.

Compared to v3, small fixes and improvements to the driver have found
their way in 3/3. Please see the patch for a detailed changelog. The
series has also been rebased on top of the latest Linux media master
branch, and tested on v6.6-rc6.

Below is the mandatory v4l2-compliance report. Careful readers may
notice that my v4l2-utils version is three commits behind upstream, but
that makes no practical difference as those commits are not related to
v4l2-compliance

Laurent Pinchart (1):
  media: uapi: Add controls for the THP7312 ISP

Paul Elder (2):
  dt-bindings: media: Add bindings for THine THP7312 ISP
  media: i2c: Add driver for THine THP7312

 .../bindings/media/i2c/thine,thp7312.yaml     |  226 ++
 .../userspace-api/media/drivers/index.rst     |    1 +
 .../userspace-api/media/drivers/thp7312.rst   |   32 +
 MAINTAINERS                                   |   10 +
 drivers/media/i2c/Kconfig                     |   16 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/thp7312.c                   | 2339 +++++++++++++++++
 include/uapi/linux/thp7312.h                  |   19 +
 include/uapi/linux/v4l2-controls.h            |    6 +
 9 files changed, 2650 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/thine,thp7312.yaml
 create mode 100644 Documentation/userspace-api/media/drivers/thp7312.rst
 create mode 100644 drivers/media/i2c/thp7312.c
 create mode 100644 include/uapi/linux/thp7312.h


base-commit: 94e27fbeca27d8c772fc2bc807730aaee5886055
-- 
Regards,

Laurent Pinchart


