Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AC3C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6E430613C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6E430613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vimNLkdlkumvldYbf6g/ga6Q9nHLpHmzclaj2PCPby8=; b=M+BLMnRe7roGqxDiGLf1w++p2h
	HKmeLYGCs1Edz7lxLLEMnWOoJVCkYWg44pGCMZ8CEtOR3qdm7Gmd2Zc8lde4wdIcnvcnkzL6HTn8P
	dzEhqeiYRkGd511ObbH/8Nj+GXSlvtV7tC5Co1YuuNcjbhAE4mciq5MbOOE89vUeJgJ/ceemChFIw
	qTGYOjwDnrI14tNPhQwWQoW5L9F9l5gqBRx7JSroBEnPq7+YzMUkbMsl61/BM8c15RoMTDVHlVQQa
	PZcGEH+uHaz1hOuMj928bkJZzzSfWLJyhI53uUgxtuW2C/MTDDcDhhrTGG0Vm+LehTg9Kk+/li2kW
	49GSyqgg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbLgx-001TiL-2O; Tue, 27 Apr 2021 11:15:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLgs-001Ti3-TX
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 11:15:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=xfEaEDQVwiPeknn/7rxsBjQT1YtGx/uq9boloX7WxVM=; b=0lMX0oOX8esdkrb73bGVAxCoCn
 P4MKUeISodq+IJZ/IazUL7AvLowcPEGdACyFXGce7mkll7lBT/PbZYdT1FIMN44VxxQMFyfJPrE5G
 sYp24fvRk7xFnUaUihKSOoizgzJVSkDV+N1yuLqvtVatkSDdDqiGU6VjRL22u3MK5dLEWCFAIjzVm
 t9yEC0tteNHoqCFllgX7xU8K1QRSDAvWD0BOPMzL0gGeG1QNUKUwDO1aHBE5k6pET760oibpwOqpj
 TdCDLkgpyuD+ytdPdLACTeFecgEu1UCxo8zfuj+DgF8l8TxWa/WBcjjSR7Z+MhWBo3iIkulbmLDPY
 MEYI//VQ==;
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLgp-00Gg8W-08
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 11:15:40 +0000
Received: by mail-pf1-x436.google.com with SMTP id j6so1733303pfh.5
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Apr 2021 04:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xfEaEDQVwiPeknn/7rxsBjQT1YtGx/uq9boloX7WxVM=;
 b=fzagj6SrztFzR6Z2jFqhcDdT94/7HWAM+FEIiDIM1HlVgwA3tIpSPcLl9rX0/e9QnT
 Cqm6X4Ic5TYc/NasXdjqtrQo/XaXbNxEjy+uIwuoY1LxqM+tgHi/JWsqjuAMhk/LM3JY
 k0CkRFGs4EuNsQ2n/AZXjJcwJhac8OHj9Shsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xfEaEDQVwiPeknn/7rxsBjQT1YtGx/uq9boloX7WxVM=;
 b=Kejhekxkprz2ahnx7gFlWvsWIeP5H0p6FQsqxVK35ypwq7f+acgggQGzfXL7RP+fzr
 3PnDLK9sXiJq1348PzVRJRUkxPgzCFftqmvKfunH+BtKaSQMUTwPKcHTd/LXZ0Wx8t0S
 OWZJscmmJY43FgxAKp9OffHFoxiNhWeMPN283rP3/6WcoBAhGhkAq7ngLVHNXuRCh7Ag
 wvubHDbUQVTVU0n5QbFwJR2QvdcTL9t3kcPRZN4pq1i4PY6PKber45wo06tD27GGmxTb
 uUKg0jjH6EXMheFdfAm9M8fRL6NUR2RcbwZD7BBZQgqBngGj1FHuJZP51h1As/YmIGgd
 2I+A==
X-Gm-Message-State: AOAM532NkFZWGE8VkPDcj35vuA0rqgsCCyuPMM2i11xhYXGyYR8c2UQ6
 lQ+uzu2FzYxsy7uFm2Rs+Xtm2Q==
X-Google-Smtp-Source: ABdhPJwjgH60e415wDWfXcaFd6uM2R/hmfsiR2RRRkWnmOvdM+507BfL9a7kjLcmbCn6jt8Uc6Pirw==
X-Received: by 2002:a62:e40a:0:b029:263:e573:e1c9 with SMTP id
 r10-20020a62e40a0000b0290263e573e1c9mr22903946pfh.74.1619522136692; 
 Tue, 27 Apr 2021 04:15:36 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:b182:d363:32d0:53a2])
 by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.15.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 04:15:36 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 00/15] media: mtk-vcodec: support for MT8183 decoder
Date: Tue, 27 Apr 2021 20:15:11 +0900
Message-Id: <20210427111526.1772293-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_041539_078445_7D66F86A 
X-CRM114-Status: GOOD (  14.48  )
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
noticed.

Patches 1-9 add MT8183 support to the decoder using the stateless API.
MT8183 only support H.264 acceleration.

Patches 10-15 are follow-ups that further improve compliance for the
decoder and encoder, by fixing support for commands on both. Patch 11
also makes sure that supported H.264 profiles are exported on MT8173.

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
  media: mtk-vcodec: vdec: handle firmware version field
  media: mtk-vcodec: support version 2 of decoder firmware ABI
  media: add Mediatek's MM21 format
  dt-bindings: media: document mediatek,mt8183-vcodec-dec
  media: mtk-vcodec: vdec: use helpers in VIDIOC_(TRY_)DECODER_CMD
  media: mtk-vcodec: vdec: clamp OUTPUT resolution to hardware limits
  media: mtk-vcodec: make flush buffer reusable by encoder
  media: mtk-vcodec: venc: support START and STOP commands

Hirokazu Honda (1):
  media: mtk-vcodec: vdec: Support H264 profile control

Hsin-Yi Wang (1):
  media: mtk-vcodec: venc: make sure buffer exists in list before
    removing

Yunfei Dong (5):
  media: mtk-vcodec: vdec: move stateful ops into their own file
  media: mtk-vcodec: vdec: support stateless API
  media: mtk-vcodec: vdec: support stateless H.264 decoding
  media: mtk-vcodec: vdec: add media device if using stateless api
  media: mtk-vcodec: enable MT8183 decoder

 .../bindings/media/mediatek-vcodec.txt        |   1 +
 .../media/v4l/pixfmt-reserved.rst             |   7 +
 drivers/media/platform/Kconfig                |   2 +
 drivers/media/platform/mtk-vcodec/Makefile    |   3 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 818 +++---------------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  28 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  66 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 667 ++++++++++++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 370 ++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  58 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 135 ++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   4 +
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 780 +++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 20 files changed, 2293 insertions(+), 723 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

--
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
