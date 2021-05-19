Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADEEC43462
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:31:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2407D61363
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2407D61363
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HDa6XSwNyE1+6dK0DXZ3uvUtYWExLGnGPvN+cV4BN10=; b=PzDLfg2vBfcVFaQ/jGyUuKRWfA
	QymBLIIDYFtdKtdAA5hyKtid5wASsoa3fb2LNyo12i3/GDpTgrV+uQ+LKTO00gWWo108Xs28oiIGg
	E61zsaakP9wvQ6HGLgrqKjWoEKGv6wJ8qmQq6Y/GXCNuzZQeCDK/oynTwxxq6LKJVpKT4FfI8CiqW
	yglTfYybqPzC8eakHzi6yJTJDNjn3R/vzMMGYH7FJJPBmvQd1KnmOLoYF5zSx/ockVNoXoogDnqG8
	Mt6FggRFq6PFSbkIv76zR24qEZu/q5EDviXBr300KUKJOjkwH+zR+fEerfnhjqgv/Lbx8aQM/cU39
	eeKFx4sw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljNDg-004Gdn-Rm; Wed, 19 May 2021 14:30:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNDe-004GdX-68
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 14:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Rt/H9kqo4opNwZCAYpaq4Dm1MqGgRfPs4hw8Yb8ixao=; b=hJzRKE8R2i5egkYRt0N2zC3i/B
 0WK74rjIOnuR1J3d8lJNfvfkYIf6AjowOIjJs/QfeAGOW4wiVRu9b3k4dMOzApGfzYRlKUv04VTfI
 exsNBAoAKKRuIDbCtcXStFS8+Bc5kDt17C9S2pCBkYr3DGKngOe44+QbG5hAqh/v6DKYQ6zKiOV0I
 8DbmCrWTcMhhwiK/3xCJarEsIaBxG/ruaapMoZAioDE6heP5qbXbXdqrcR6mCC554RV7tlL/OtHK0
 v0tCK/anCBI4hseTeVMxkNiXNoEADmM1XZQXJV29/XqQWbljVfi6ehpsmWpQqH9PIyg1IckQ1kOWm
 MHEHCvZw==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNDb-00FXmW-AN
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 14:30:40 +0000
Received: by mail-pf1-x430.google.com with SMTP id d16so10006230pfn.12
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 07:30:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rt/H9kqo4opNwZCAYpaq4Dm1MqGgRfPs4hw8Yb8ixao=;
 b=i0PtYZ6fhrKb5OBqzIORwwCTePqgZ28Sr0YjIbiqyA18fd+tgipwr3YBxDp2CxqrPy
 iJMwNeyV/wYkmLGrf6aq+iYJdi0Rq9l5Se7RJErRSEvoDDpCIBFf4AX0h80/7pFbnqtS
 XcKbtm+IYOO4uwK/MoYML+C6EL5FXReGS2zPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rt/H9kqo4opNwZCAYpaq4Dm1MqGgRfPs4hw8Yb8ixao=;
 b=gbTaOQZ/QnytyYnSiHhxNwJ6IZUbmknZm39KetqhZYI3rf5NrTIAezMyG6OtO21Cvo
 cHgeeec42P/EDtx1VtrTVpuDl8/uWFqKEEQSW4m4nf2J9z+mr8K/ztFjfZjhclz+DZT2
 LIuocXxaTUX9Pkt4uvtAjV953H5wdYH4xzgZjiVcjLJ8qja64Uwa+gcF8vR31m4PTtRe
 6peVjFVQDIOKxXgxOzGqQJtaxE5GKZJf0Kj1OLjryeT3N1mVHgqO7bWumoBOmLVGemrW
 FXhzSfpD/asOJWg5z38Zz0zESi6agUaI4aU0hrL96speE4I7tSMc97ufWZxUzCFBkacU
 A15g==
X-Gm-Message-State: AOAM530oeS3sn6CBnfSdAqiXukXZaHDokIdNcWQ7l2Pvr9pCC54vWYd5
 BYWh6ev9GYAuzOMZQa0PISJUiA==
X-Google-Smtp-Source: ABdhPJzOpymkaL4fPwyPa2NIrifUr+bc66RUEBAnS8XP3YyYvp0CA6ioy/nE/sd6OZw+h1dVPo1UcQ==
X-Received: by 2002:aa7:8b56:0:b029:2b9:77be:d305 with SMTP id
 i22-20020aa78b560000b02902b977bed305mr10940065pfd.61.1621434637343; 
 Wed, 19 May 2021 07:30:37 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:87ab:ff82:1544:697])
 by smtp.gmail.com with ESMTPSA id 3sm14337661pff.132.2021.05.19.07.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:30:36 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v5 00/14] media: mtk-vcodec: support for MT8183 decoder
Date: Wed, 19 May 2021 23:29:57 +0900
Message-Id: <20210519143011.1175546-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_073039_366044_8ED47862 
X-CRM114-Status: GOOD (  19.81  )
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
patches were last in the previous series but have been moved to the beginning so
they can be applied sooner.

Patches 6-9 separates the "stateful" part of the driver into its own file and
add support for the new firmware and pixel format used by MT8183.

Patches 10-14 add support for H.264 stateless decoding and MT8183.

Changes since v4:
* Moved compliance fix patches to the head of the series.
* Select MEDIA_CONTROLLER_REQUEST_API.
* Properly capitalize MM21's format description string.
* Reorganize stateless code as suggested by Hans.
* Fix compilation errors when DEBUG is defined.
* Merge double-free fixup patch into the patch that introduced the issue (was
  a separate patch coming right after the one introducing the issue).

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
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 817 +++---------------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  27 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  66 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 668 ++++++++++++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 366 ++++++++
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
 20 files changed, 2290 insertions(+), 722 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

--
2.31.1.751.gd2f1c929bd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
