Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6BD9C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 19:26:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6078C60E76
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 19:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6078C60E76
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ra6RPgqaoetNDU3vSA1xGQjNRBtmqBkqWwpj/NdPAmo=; b=bfO4y99odFXZKn
	oSgx2+ZHxohNS6VndoL9cHI7D9lm96lOKm24lCNG/8CFmZWmfzDX5pxJqb4fMmYer9elKWytlDGTE
	cqO3KjfPgvHEQi90cvRW8hFZR7itapQxMtvY8zIw9WY6k+7XxBPn9dk7cXLicH4jssjWv9/p13Pow
	J3gM5cSvvqV5wpei1OZD8lXM3GAx4Gs8pZatDxoZEsn+OkRSMi8MVHOcrNglWGQYmabtx99QY2oB0
	vjOisPKd6QlbqPm14oNDFLfWIPzOMKcJSDxOKiJqfXZL+t4SbPJgYORWcaO5Gu9dtdnbFTYUCSpnh
	HheiXmUqLBmWZ1Cl461Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFiFj-0008Tw-9m; Mon, 16 Aug 2021 19:26:31 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFiF3-0008Gh-Em
 for linux-mediatek@lists.infradead.org; Mon, 16 Aug 2021 19:25:52 +0000
Received: by mail-wr1-x42d.google.com with SMTP id u16so7980885wrn.5
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Aug 2021 12:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qEog8lYm1iN8AupiUQMBZD9rF1zvKy9lbpFWZZLaRbk=;
 b=ifV48pV34am9tIz8/WNRWhxWLC4ODLUiG3D5qcShH3XfeVAnimg4J0l7yHDD33rbOf
 cNr+jRf7p4MuwmkLnG+2O4mklymiLhWEx6mI+lEKYaBCVqet3iU6siyEyandRwJR2DkP
 1VuRB3jLE0FMfZh34+PUcRg4D86mJApcM17dJTTckOHECOlXm745/S79rvptCohTQGGP
 FPeDqYcNQJ5MgLdNXYUMIRxGANR6Xy9R0BsLJjk/ix03Id1HwVHOSgHPEU1C4jS63Uuz
 BKpQSbfTAsFIuOU55AerU8+SqvQ4MH3rp750zuyVvgmX0QYNZ+ugzPKlC4AlJaBbol3b
 JmsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qEog8lYm1iN8AupiUQMBZD9rF1zvKy9lbpFWZZLaRbk=;
 b=Ue9MdD87swacZTnA/qzmVhAP7CVPkdSleg82qgfiuElIE1Fm8MibBJLdVtp0MOxD+A
 e/VV7s+4k4eDxfT2/Q6wgIGrcN5qGvXHGSoe1TxTnDtnjefH1Wfd+XuVS1Y7SFWr/Adt
 zs8Oj6d55Fb0WgE/GFFZ/k6HYSyGcGFcBvGiCNUE5Fpib2vPXuwzf/y5J9JCwLLinrnm
 eTbxSiRRcrJj6O2eIlwvnDk4p5jHIRubyH1U3ZJU6oZT2FST7DYebXzZN8uZSrNaicrF
 f4GUEJr5oj+mO/CjoAO1O1b0WqR79BbkHeM1Np5odNt9BAnp2J28DlVYdgHo/olIOfnJ
 MsCA==
X-Gm-Message-State: AOAM530ilTI5q6iA4QwLyxs4NQFfTvFFxuu9TtOOCsRe/n4sYDsZ6JQm
 ZdQ5bNwqLFKFfV9jfed1hVNacQ==
X-Google-Smtp-Source: ABdhPJzZZVgmbj1Ia/yPE/U1YY1+gVB1Ys9ecadHi2c/okmwaGHMpyDH5EhweM1eRbNU7BGvVhCjAA==
X-Received: by 2002:a5d:4dcf:: with SMTP id f15mr71705wru.216.1629141946713;
 Mon, 16 Aug 2021 12:25:46 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900::97e])
 by smtp.gmail.com with ESMTPSA id k17sm333954wmj.0.2021.08.16.12.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 12:25:46 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [RFC PATCH 0/5] drm/mediatek: Add mt8195 DisplayPort driver
Date: Mon, 16 Aug 2021 21:25:18 +0200
Message-Id: <20210816192523.1739365-1-msp@baylibre.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_122549_603668_20583CEF 
X-CRM114-Status: GOOD (  15.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi everyone,

this series is built around the DisplayPort driver. The dpi/dpintf driver and
the added helper functions are required for the DisplayPort.

Note that this is an RFC. I would like to have your opinion on the driver and
what needs to change. The driver itself has its rough edges that I am currently
still working on, especially the training and powerup/down need some work in
my opinion. Also the code compiles without an issue but is not fully tested
yet.

However I already wanted to reach out for some feedback to see what can and
should be improved. I am happy about every comment, thanks for taking the
time.

The series is currently based on v5.14-rc5 but it requires other patches to
actually work on mt8195 (clock, etc.). A binding documentation is not included
yet.

Thanks,
Markus

Markus Schneider-Pargmann (5):
  dt-bindings: mediatek,dpi: Add mt8195 dpintf
  drm/mediatek: dpi: Add dpintf support
  drm/edid: Add cea_sad helpers for freq/length
  video/hdmi: Add audio_infoframe packing for DP
  drm/mediatek: Add mt8195 DisplayPort driver

 .../display/mediatek/mediatek,dpi.yaml        |   48 +-
 drivers/gpu/drm/drm_edid.c                    |   57 +
 drivers/gpu/drm/mediatek/Kconfig              |    7 +
 drivers/gpu/drm/mediatek/Makefile             |    2 +
 drivers/gpu/drm/mediatek/mtk_dp.c             | 3025 ++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h         | 3095 +++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dpi.c            |  282 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h       |   12 +
 drivers/video/hdmi.c                          |   87 +-
 include/drm/drm_edid.h                        |   18 +-
 include/linux/hdmi.h                          |    4 +
 11 files changed, 6564 insertions(+), 73 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h

-- 
2.32.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
