Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84CBFC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 06:27:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50CC120672
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 06:27:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="12SXWMFs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VQLPANUc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50CC120672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dgQMdUFFPHRVMIIMjp64wsMezZj4YcLUJuyLTM+gW8w=; b=12SXWMFsvMQj3CDofVuuB6guym
	7qfhGw2ZEVqGfYd/GfzxlVg3SzQKjuT3Cj86n8F7pAhO3vuMoZx5DsndubH0SzTnilb4fKrVdGYZ9
	1CsuoHBtRSan3JDAvBdpqa09/TXfau3WbO+qj2uUR870ECT/LhKKPlOjOnOKP1Bvxlrg6unkhNVOM
	iqQl2EMKwyG8K7pYKL/mib25kim78yyVocS0RZm+KjLNtJiSb1EYrF+bE6g3lpOtYirouKo3N1Bi4
	tBG6HQAcrcTnnY/qa469z7wvAzEjiDs3dZPGwsb3cYhuTBj26xaFknNk791xwfuSsln+Obn9aMSRz
	4xCyv5Iw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq9jy-0006Uv-M5; Tue, 30 Jun 2020 06:27:34 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq9jv-0006Ty-EA
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 06:27:32 +0000
Received: by mail-pf1-x442.google.com with SMTP id j12so8963637pfn.10
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 23:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hg7CQ36HAUaDvVl3zakOjg0qflU7yL+WVY/tnMLNwI8=;
 b=VQLPANUcPwGyfihSpiowndFQuKQQlvaJDJVH+Xj9W82xesq8Lxh0JcEYDFqaOm/ffp
 31I1pWYeloSOSrQLqcckVP9O/0F6SXSCVCGgqXXHFt6gqvNCTOW33usD/xRTNRheGE69
 r8FNBfYSleHJnpgxYpjkABIdOagdhvwZPTEFY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hg7CQ36HAUaDvVl3zakOjg0qflU7yL+WVY/tnMLNwI8=;
 b=KFh+NijbZdk0bpNn27Z/XL37mfX3xgL8eHS27KtvwVLZvaQmCYenpB72UbFe/JUbVR
 poXYtY4NnnokrRiEcqMCozcHP4xqJ00ojOSw4m4IVfnWGL5IbX2uvdMYtxh60+q17/OJ
 ribFoinomSkQfltDsPtdFYiAx3yBwdzlLzxb30ZSqbj4Znx72MwMDAeVqrhtsihs9g6+
 euV6BG2hg2kXi7Ggo13KDOO6GC/c0Y7uzadsHzd/U6bgb9DBPeag5YebJP8lJOD89e62
 qVJpLlFXHnNa1ZKYEbZy4y4be4vvXSaIzCASKYWmUvwEYvhnJUPWkf+amyoU6UsHBzh+
 Vgtg==
X-Gm-Message-State: AOAM532n8EGFq0apf4/cJQ2IZ9amuG0kvLuUsRz6rFkuAUwrCH+OqUV1
 DVT9XMw8knk9kGWyVibCCnuJRQ==
X-Google-Smtp-Source: ABdhPJzv0kiTrJPLtzkcKyiSl8wmXSRMplwPojwu7/9fWXDbT6YJQ4ox4bXbQCWa5+f/h9RXQiPz8w==
X-Received: by 2002:a65:664a:: with SMTP id z10mr13445440pgv.352.1593498447562; 
 Mon, 29 Jun 2020 23:27:27 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id d1sm1463366pfq.113.2020.06.29.23.27.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 23:27:26 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH 0/9] media: mtk-vcodec: vdec: support for MT8183
Date: Tue, 30 Jun 2020 15:27:02 +0900
Message-Id: <20200630062711.4169601-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
MIME-Version: 1.0
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series adds support for the H.264 stateless decoder found in MT8183.
It depends on the MT8183 encoder support series [1] and should thus be applied
on top of it.

Contrary to MT8173 which is stateful, MT8183 is a stateless decoder. So the
first patches take care of splitting the stateful-relevant code into its own
source file, and to add support for the stateless API. Then support for sending
the H.264 decoder is added, taking advantage of the H.264 helper functions to
build the reference lists.

No regressions to v4l2-compliance have been introduced by this series for
MT8173, and we could also confirm that decoding was still working as expected
on this chip. Following this series will be another one that fixes the remaining
v4l2-compliance issues for both encoder and decoder.

[1] https://lkml.org/lkml/2020/6/26/152

Alexandre Courbot (4):
  media: mtk-vcodec: vdec: handle firmware version field
  media: mtk-vcodec: support version 2 of decoder firmware ABI
  media: add Mediatek's MM21 format
  dt-bindings: media: document mediatek,mt8183-vcodec-dec

Yunfei Dong (5):
  media: mtk-vcodec: vdec: move stateful ops into their own file
  media: mtk-vcodec: vdec: support stateless API
  media: mtk-vcodec: vdec: support stateless H.264 decoding
  media: mtk-vcodec: vdec: add media device if using stateless api
  media: mtk-vcodec: enable MT8183 decoder

 .../bindings/media/mediatek-vcodec.txt        |   1 +
 drivers/media/platform/Kconfig                |   2 +
 drivers/media/platform/mtk-vcodec/Makefile    |   3 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 763 +++--------------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  28 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  54 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 634 ++++++++++++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 469 ++++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  50 ++
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 802 ++++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 17 files changed, 2226 insertions(+), 657 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

--
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
