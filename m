Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 293C4C07E9A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:33:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2868613DD
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2868613DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i1fDY7C3yPzSUiA2Ms8J5lEGQ5GYlMipSYS+dh/A9dk=; b=d58s91hNYWLgfB
	9on8aXPIX549DZ1meXLWAsbwt/rqhC7cQb4cLEEl8CJ5Lpbq6q/Vahv5PHiB3r0ZrOCIvasTLjOQB
	e1Re5XXqXQWezFvhPGMrYx5e9N6CQLJMb4dd61F8xBu4gZeIzmhl8sBEOb3ShtTOpwkPQLwoo3q2Z
	yylJ3sGa8SdSO/ih0eU2Ndmuu3JdY1592rUOYNQ0rY/YLa8aNt4pfxc/VxBsObyB/+K8FbXYDaDXr
	HaNllRf1jiMx87dpxGVRjHVtmschiEM/1dxv/b6cSaiqEVBG+tmVHU1mVZlyuTGqQWBxu5H4DQGZP
	wA6fg/Df0v0Oj2oP8k6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HES-007qGm-Ks; Mon, 05 Jul 2021 05:33:24 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0HEP-007qFi-FL
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 05:33:23 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 in17-20020a17090b4391b0290170ba0ec7fcso13814403pjb.4
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Jul 2021 22:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jj9aELhqiUOwAwWUz7FLYaAN0+uAFYBs/cDsEz9Fq0s=;
 b=msPEPOptPzS91PUpFvqqrbJBeavJ5p3xmecsA5ghMsbA3Y9Zr7TSp+FVm3BDSyn6UZ
 1x1GJpK5E1Xd1yuJUD2qwY2QiOaoFQzrDYY7JdIEJshnJmwWnhUs4ZL56gl8qbl/X0bN
 ni0zWu71xAoT7EeS8T93Qh4ogiOBrfF6d+6SI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jj9aELhqiUOwAwWUz7FLYaAN0+uAFYBs/cDsEz9Fq0s=;
 b=iWlb8SiULyDIwxeDdyJR4Ag3VxBToyXvsAIwXoXFpJdRy1/os6kKQWn5T30ZwRpCTD
 JAkOaN+J3Hm2kFNIbxyx/7i4sfQTn9T0q/WWaxXdsanXmvWiQkmtfPB9aXeY1A2yaxs0
 mgNpId9QI3D2GpOVc2QLXQBzn+wPZwjNzcHmy3MyttndoEw5MyZOyDidCPVDs9QlIfT3
 5hTeXsKgF+4rhL98O8WYGdO3w2Y4caWXUsln6RgC5Q8h6JCXis1+8c5zXiCJV/SCGlLZ
 PoQzqXE2sj7uWl0ShbmM4itznzvO+hEwxJzoNpOONZ0EC7dQ+birrRlZ0yGCGFrtFsXW
 QFbg==
X-Gm-Message-State: AOAM532M/UWEb1zJUbL9rHyqt6gqiP9UQf+RyQ2NJqkbvGNSeESdP/Pw
 HZxLsLJcPrnPTeLqMDfJ1lY+xQ==
X-Google-Smtp-Source: ABdhPJyKRLxGOd7bnNtEgwR5plxK2t7P8kZ6ucF5rlrtKtLzNgUEvAvPocDDwP82wLHk9ljkPKw/Ug==
X-Received: by 2002:a17:90a:a418:: with SMTP id
 y24mr10231856pjp.15.1625463200548; 
 Sun, 04 Jul 2021 22:33:20 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:3fed:7130:60f:265a])
 by smtp.gmail.com with ESMTPSA id x19sm6805245pfp.115.2021.07.04.22.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 22:33:20 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v6 00/14] media: mtk-vcodec: support for MT8183 decoder
Date: Mon,  5 Jul 2021 14:32:44 +0900
Message-Id: <20210705053258.1614177-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_223321_638681_8BA78D12 
X-CRM114-Status: GOOD (  21.08  )
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

This series adds support for the stateless API into mtk-vcodec, by first
separating the stateful ops into their own source file, and introducing
a new set of ops suitable for stateless decoding. As such, support for
stateful decoders should remain completely unaffected.

This series has been tested with both MT8183 and MT8173. Decoding was
working for both chips, and in the case of MT8173 no regression has been
spotted.

Patches 1-5 fix a few compliance issues with the decoder and encoder, most
notably by adding support for the START and STOP command for the latter. These
patches were last up until v4 but have been moved to the beginning so they can
be applied sooner.

Patches 6-9 separates the "stateful" part of the driver into its own file and
add support for the new firmware and pixel format used by MT8183.

Patches 10-14 add support for H.264 stateless decoding and MT8183.

Note that a few checkpatch issues have been left unadressed on purpose:
* Conversion from e.g. uint32_t to u32 can't be done without breaking
  consistency. This should be done by a driver-wide patch.
* Some macro warning suggesting parentheses for parameters expanded as struct
  members, which is obviously not applicable here.
* Warnings about adding new files without an update the MAINTAINERS, which is
  irrelevant as the new files are already covered by the existing wildcards.

Changes since v5:
* Rebased against latest media tree.
* Applied most suggestions of `checkpatch.pl --strict`. Some proposed fixes were
  not applied because they would require a larger refactoring (i.e. large-scale
  type changes) of the code.
* Applied Reviewed-by and fix suggestions from Tzung-bi.
* Check for ABORT state in vidioc_encoder_cmd.

Changes since v4:
* Reorganized fixup patches first.
* Select MEDIA_CONTROLLER_REQUEST_API.
* Properly capitalize MM21's format description string.
* Reorganize stateless code as suggested by Hans.
* Fix compilation errors when DEBUG is defined.
* Merge double-free fixup patch into the patch that introduced the issue.

Changes since v3:
* Stop checking that controls are set for every request.
* Add V4L2_CID_STATELESS_H264_START_CODE control.
* Stop mapping OUTPUT buffers and getting the NAL type from them, use the
  nal_ref_idc field instead.
* Make V4L2_CID_MIN_BUFFERS_FOR_CAPTURE control stateful-only.
* Set vb2_buffer's field to V4L2_FIELD_NONE in buffer validation hook.

Changes since v2:
* Add follow-up patches fixing support for START/STOP commands for the
  encoder, and stateful decoder.

Alexandre Courbot (8):
  media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
  media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
  media: mtk-vcodec: make flush buffer reusable by encoder
  media: mtk-vcodec: venc: support START and STOP commands
  media: mtk-vcodec: vdec: handle firmware version field
  media: mtk-vcodec: support version 2 of decoder firmware ABI
  media: add Mediatek's MM21 format
  dt-bindings: media: document mediatek,mt8183-vcodec-dec

Hirokazu Honda (1):
  media: mtk-vcodec: vdec: Support H264 profile control

Yunfei Dong (5):
  media: mtk-vcodec: vdec: move stateful ops into their own file
  media: mtk-vcodec: vdec: support stateless API
  media: mtk-vcodec: vdec: support stateless H.264 decoding
  media: mtk-vcodec: vdec: add media device if using stateless api
  media: mtk-vcodec: enable MT8183 decoder

 .../bindings/media/mediatek-vcodec.txt        |   1 +
 .../media/v4l/pixfmt-reserved.rst             |   7 +
 drivers/media/platform/Kconfig                |   3 +
 drivers/media/platform/mtk-vcodec/Makefile    |   3 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 820 +++---------------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  25 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  65 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 626 +++++++++++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 360 ++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  58 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 140 ++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   6 +-
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 771 ++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 20 files changed, 2235 insertions(+), 727 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

--
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
