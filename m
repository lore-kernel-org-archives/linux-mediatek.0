Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85323EB64D7
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jun 2023 10:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jBKfzhFFhqAcTYJrg0Dr4h4x6W3U5a5giVvpMdKvQlM=; b=B4EcNLvUo0X0ndlfRfx6MCgy4V
	dWXyOUdLcPZtPIM55LEgLNA5xMPHkyxf8+nU90HUJKivYefiRmbn9JvjVEJKk0YijL5xJReW0FwYP
	D31c2KqElhlpufG6ovuyNujjxvnTrUvVlz8BJ4p7Ae3d7AYFd5KcG67aChDIzKV2yBkC/3ICZE7cn
	Zrf8CqvTkVrV5H6ADGDmizLeuFkzOSTCcCM37zIus6sAauD++pcDBr/BMkJQe6a70SUNGyL9j1fvt
	XQjU1EYqtAt+bTFGvhiQT/q4WTTnob7xe9B5IXELQ0qTdBe8O3f/5df3Qwczhcjgs+ucDl6ZXGG5L
	7Rk0euUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFAzL-003Kwj-2d;
	Fri, 30 Jun 2023 10:04:27 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFAzI-003Kvb-0y
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Jun 2023 10:04:26 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-3fbab0d0b88so14461435e9.0
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Jun 2023 03:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1688119461; x=1690711461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jBKfzhFFhqAcTYJrg0Dr4h4x6W3U5a5giVvpMdKvQlM=;
        b=LlWsUWbq1Di/wC+f2am+zd1wq6JZQpYMso73TAuEWKuA17yojjbdgQsBSqTxxX4uNA
         s0Knm59Dk29M6lpoBzEij1CU/EFN/bFX/mF4CCgSzJy4DqtYPv/DsTHauOIMt8RRRy6a
         6LcNT1Nquw1n1/ChM+TgnbZbonqWgZcZ98b37vEUadBMAM2UagS7S2/eWV3RaVK4D/I+
         5Ywwkb7W6zqcV+PsHXy2gBoPOwuCO6iF85XDTrwZpUf1zkEjY+5BHW1+Kx+Y2pv2L8Qp
         SQ+xLhV35juqFXGD/fs+KNuKz0stf7I527vM7mH6MXWk4QL6Ic3V+NLWLDlz8L/DHFJa
         ta/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688119461; x=1690711461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBKfzhFFhqAcTYJrg0Dr4h4x6W3U5a5giVvpMdKvQlM=;
        b=GEwhZDVKukh80EkLXVGj2PMbG1FLErV0Qtxrk3IRLOJ1+HsPNJLJaEJ/O8e7QJL0CK
         fINs3PZdgdmf59L/dNWMJy3DTbhije2YWv1qd8TUNPs2O4gqwTff+sJ393TN+UVeFQfy
         p0mb0fJ4x45GE0gNZEjmDZj+GP5WzaJl+iiUytPKz/w8VK+F4T51tt+qHQAbnnkXT8Nx
         CUqVvhymcV3wur3L5B9iAU6Ua1Z/8dvQhOe623/dKMuZFrOm4Nzqhpb8f7SSWTOrxlbx
         5XdtcPx+8gwjeFz3XT9uXhiztvPHFSperws6SgwMHqNk5CJ4wPePIakgdHLtkn6l/Glm
         AD3Q==
X-Gm-Message-State: AC+VfDziwaG4MplzMcyWYNhClz1lCvKLPDna38N/QdJsT/Sq5UlKAdef
	RT0SpsKATuQw+V8KoavhxAS9QA==
X-Google-Smtp-Source: ACHHUZ4u46ovHqmM1pHPoNIUq+uSFsIrq0pSwJxOzyZztDHewsHVbkiEFAY3g8CAub6dkFiNq5KlKg==
X-Received: by 2002:a05:600c:214d:b0:3f7:e660:cdc5 with SMTP id v13-20020a05600c214d00b003f7e660cdc5mr2329714wml.9.1688119461299;
        Fri, 30 Jun 2023 03:04:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id x11-20020adff0cb000000b0031424f4ef1dsm743280wro.19.2023.06.30.03.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 03:04:21 -0700 (PDT)
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
	Rob Herring <robh+dt@kernel.org>,
	Sumanth Korikkar <sumanthk@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH v2 0/4] Add Mediatek ISP3.0
Date: Fri, 30 Jun 2023 12:01:49 +0200
Message-ID: <20230630100321.1951138-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_030424_337390_5D670C9D 
X-CRM114-Status: GOOD (  16.26  )
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

This series add the support of the Mediatek ISP3.0 found on some
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

 .../bindings/media/mediatek,mt8365-camsv.yaml |  113 ++
 .../media/mediatek,mt8365-seninf.yaml         |  295 ++++
 MAINTAINERS                                   |   10 +
 drivers/media/platform/mediatek/Kconfig       |    1 +
 drivers/media/platform/mediatek/Makefile      |    1 +
 drivers/media/platform/mediatek/isp/Kconfig   |    2 +
 drivers/media/platform/mediatek/isp/Makefile  |    3 +
 .../platform/mediatek/isp/isp_30/Kconfig      |   35 +
 .../platform/mediatek/isp/isp_30/Makefile     |    4 +
 .../mediatek/isp/isp_30/camsv/Makefile        |    7 +
 .../mediatek/isp/isp_30/camsv/mtk_camsv.c     |  334 ++++
 .../mediatek/isp/isp_30/camsv/mtk_camsv.h     |  200 +++
 .../isp/isp_30/camsv/mtk_camsv30_hw.c         |  474 +++++
 .../isp/isp_30/camsv/mtk_camsv30_regs.h       |   59 +
 .../isp/isp_30/camsv/mtk_camsv_video.c        |  781 +++++++++
 .../mediatek/isp/isp_30/seninf/Makefile       |    5 +
 .../mediatek/isp/isp_30/seninf/mtk_seninf.c   | 1561 +++++++++++++++++
 .../isp/isp_30/seninf/mtk_seninf_reg.h        |   99 ++
 18 files changed, 3984 insertions(+)
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

