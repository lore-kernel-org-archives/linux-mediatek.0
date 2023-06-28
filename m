Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B121EB64D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jun 2023 14:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9/0nNN44VNRNUJVhh4K+B/77Q53o4u445deZJq878Zg=; b=MYCt1URmPhGWTJzYuvMc8jau8C
	OR0bQqs/teQxLl+ITyfCGDpMw3NzxbDVvgkgWSrVlh2EuF3k4oyVaKvJ6XtkrmdA6dbbycw2ylGkt
	pFe7xoUG28F2/u8S86ILtXi4JeckvFl2MJAxDCbQ5eQEi9apDQ3jALxxOajcr6fosKpwn91RGQgo1
	l1rR37CYmZDG0ftOaHP8j+tgXoTCvEhIrBKBpR27gWLIbhsBVY3MlUHCyzG6m+Tii2Y8rz3xKToP4
	ZQwnG+vWGX0hn4n6CVbmCzz+kOr2avhGjR6ClEL2ibuLquHpptwRzP+JpA/wbI2MawfegfLDLy6Il
	vwh3g+fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qEWYq-00Fu0y-02;
	Wed, 28 Jun 2023 14:54:24 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qEWYm-00Ftzj-1D
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jun 2023 14:54:21 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f865f0e16cso8468288e87.3
        for <linux-mediatek@lists.infradead.org>; Wed, 28 Jun 2023 07:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1687964056; x=1690556056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9/0nNN44VNRNUJVhh4K+B/77Q53o4u445deZJq878Zg=;
        b=3U/AqUXHlkLWMESSviAmOFThRvVcswBGYbBOWKK59lj1GZ2VqgQ1+pSZko0dtzN7UP
         Ca7Aio6JPmkKxeQi8G4zYUDlNZmWxxWurWQduxodhFykzHp5qF/t5qpxLP4ZyyZBeyhH
         ZP8RRglbiprZPTTaA4iGl3+yGE9fOZ2dS+Ch4Xm+ysB7yIR8g8dT1BqDqbwjt/9F4BeN
         NDjVPJlnTXwtg2ATTLDUEMiKxFDkDtSOiAo7HkspOVOTz1cLdgZoULtjtI5AEgY7H2Ew
         1Mh6lE0Lgr1B4aNyF8rjQYpzYhA8jD9/McHP9A71ucdr594dMUZQFOrI1aIfs14UKod2
         cxWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687964056; x=1690556056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9/0nNN44VNRNUJVhh4K+B/77Q53o4u445deZJq878Zg=;
        b=WHyoRnjneaJuktE5CBCuG6cd6msY9uKxXp3wql4ZuZcHSH1sb9YrgGu3S8m9kSGMwo
         wCHjRFmVVPbIgVSyazXAKMvOPH1w5JH6MZYRA/si3Ey0CmcYkolYoAgd47zugQpnzXNU
         PMC08fQ7SxWbVEFzgZnSW9musXl8XQ7bOTRyjytN4hUaCN0I7OTCSjpO3Y0Dxe/Nb1nI
         5q/UboymEWhNop7b+0150QWHed8awEx4Ab9y3ais6JwLwALLaG3td6NcSh6dlz3pIWWX
         RQ6V9nPDrYm4HmwCtvLJ+9ufJt9tjwoGNQlbnJz1vVA1gtIKoc1xA38V+ocKVmn8WN72
         lBzQ==
X-Gm-Message-State: AC+VfDy0gWBPlcYmBRYs1ZwTO9VQWlnnmj0H8qdw8uhsk7kdCDK0cQrx
	849JU551CGg+CowPcEpLX9Ws7g==
X-Google-Smtp-Source: ACHHUZ5hKqR6Qa4F5o02E1EftTHMMD7L0/abbxO4ZsmrimeO6vZ7sL5KrmRVU9LTa27Amjnnr3F8Bw==
X-Received: by 2002:a19:431c:0:b0:4f9:58bd:9e5a with SMTP id q28-20020a19431c000000b004f958bd9e5amr10705065lfa.27.1687964056264;
        Wed, 28 Jun 2023 07:54:16 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:55f:21e0:9e19:4376:dea6:dbfa])
        by smtp.gmail.com with ESMTPSA id k16-20020a05600c0b5000b003fba6709c68sm4846278wmr.47.2023.06.28.07.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 07:54:15 -0700 (PDT)
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
Subject: [PATCH 0/4] Add Mediatek ISP3.0
Date: Wed, 28 Jun 2023 16:52:51 +0200
Message-ID: <20230628145412.1610260-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230628_075420_409751_5105169E 
X-CRM114-Status: GOOD (  13.71  )
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

The SENINF has several inputs connected to phys. The PHY module is
available here: https://lore.kernel.org/all/20230620121928.1231745-1-jstephan@baylibre.com/

The SENINF driver is based on previous work done by Louis Kuo available
as an RFC here: https://lore.kernel.org/all/20200708104023.3225-1-louis.kuo@mediatek.com/

Louis Kuo (2):
  dt-bindings: media: add mediatek ISP3.0 sensor interface
  media: platform: mediatek: isp_30: add mediatek ISP3.0 sensor
    interface

Phi-bang Nguyen (2):
  dt-bindings: media: add mediatek ISP3.0 camsv
  media: platform: mediatek: isp_30: add mediatek ISP3.0 camsv

 .../bindings/media/mediatek,mt8365-camsv.yaml |  113 ++
 .../media/mediatek,mt8365-seninf.yaml         |  301 ++++
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
 .../mediatek/isp/isp_30/seninf/mtk_seninf.c   | 1559 +++++++++++++++++
 .../isp/isp_30/seninf/mtk_seninf_reg.h        |   99 ++
 18 files changed, 3988 insertions(+)
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

