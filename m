Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E955C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:02:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDB7D64ED5
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDB7D64ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lr/I4K/+dZDsmAvMcORJfyNQ2rclO8HGGlg1+Eb7J7M=; b=UU8wgXhmKgx1TkVLLJeybvnk3x
	ycItTFplg9SYysjwAmxXNakkgrDw5/n/9olE/mD/qSWcvKhTJWcZI5UdBjjSIY6P3Pmh3qhy3jWbE
	87WeuTYZIyps3yQ8JeiVnlyhpoMyFWst0IJDyUBMYaU4sEDOu1NhMQRGLJ0H6TNzvVUQWTfY0xh0f
	CJqDnAnljMTSbhJ2ebCNiMvlbefaQ2BryZQxnz2Ehwy4DfPfSoVY4NxsK3/yy9EQbts1jDlWXA42w
	JE22WViEe1H0klHtwryJ8DSVXgGrukTLbaxQmU7Szdw/fqVKG5RZgGeZb2g8KZfBCz3E0PUGdyOrg
	TCsMalIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFZwj-0007kx-Dc; Fri, 26 Feb 2021 10:02:05 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFZwg-0007kC-EZ
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 10:02:03 +0000
Received: by mail-pl1-x62b.google.com with SMTP id e9so5047477plh.3
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Feb 2021 02:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rdHQrIoRBZis59jo/BlYAHJNjsS+NHQ7VVed8ginGb0=;
 b=MsQ/EITikSwmceNc01UidROuZO8i86fefQVWuDj88ZnuaRnex8jZbEqMBSj7xJf3vk
 4MS4W+RN09mFDHeWU1V+lzeZfBb3IKOUdtA19n09rxA3lFEfiL0bWn0xbd9GXQ0NHTJH
 rCmhueTb2eC3VliCroGN3UeXgb2iCmHbps2jw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rdHQrIoRBZis59jo/BlYAHJNjsS+NHQ7VVed8ginGb0=;
 b=M9fLnSZ+l7EsQWuPB2YjsHrexIx5XYb3nmiZI1mZOAnCCVGYLjpIiWSTX0N5IV2knk
 CL7LByKf0xRLjMfV4j3aR7BDXRl/tq/cKY2Hac2b+wAQcuuWhAIM2EtK4q0DCnU2kEmp
 toN1HmebkPvaSJFrBv0GfcDxa/Iv2GOBa8KbMPFil/2/B4szmLYr56gc+LZDcyaRi5+S
 nXsX94F3JgIpFpJZms2UuqeoJPVEyUH8VR0sAXDd0tpWO3JDYwnhgS864H3etm2HfV0C
 yS17pGKjclPapl2947ghKyDPvlFZlFFawCrcaGr3TN3hdoGRAvisXpsLZ4X93RQ+FfKc
 FMxQ==
X-Gm-Message-State: AOAM532XaCw2oPFSUGcHLGgp+ltP0f16N4TMson6mg+PdWZAp/QiqMW6
 pcWJtJ4QVYLdEmo0zjfTpYSgJQ==
X-Google-Smtp-Source: ABdhPJzTeUwT5lTjJeqNtc/Vnuyz+cdz8j6lb2R9rH9Z7Ae4N0P6WxL+lS+AF39HONEWvZwP7VfhRQ==
X-Received: by 2002:a17:90a:ce88:: with SMTP id
 g8mr2635720pju.107.1614333719701; 
 Fri, 26 Feb 2021 02:01:59 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
 by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.01.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 02:01:59 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH v3 00/15] media: mtk-vcodec: support for MT8183 decoder
Date: Fri, 26 Feb 2021 19:01:33 +0900
Message-Id: <20210226100148.1663389-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_050202_587806_BC8DFE36 
X-CRM114-Status: GOOD (  14.48  )
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
Cc: Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Please ignore the v2 of this series since I neglected a final check on
it and realized later it did not compile. >_<

This series adds support for the stateless API into mtk-vcodec, by first
separating the stateful ops into their own source file, and introducing
a new set of ops suitable for stateless decoding. As such, support for
stateful decoders should remain completely unaffected.

This series has been tested with both MT8183 and MT8173. Decoding was
working for both chips, and in the case of MT8173 no regression has been
spotted.

Patches 1-9 add MT8183 support to the decoder using the stateless API.
MT8183 only support H.264 acceleration.

Patches 10-15 are follow-ups that further improve compliance for the
decoder and encoder, by fixing support for commands on both. Patch 11
also makes sure that supported H.264 profiles are exported on MT8173.

Changes since v2:
* Actually compiles (duh),
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
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      | 800 +++--------------
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |  30 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  66 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 647 ++++++++++++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 427 +++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  58 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 135 ++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   4 +
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 807 ++++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 20 files changed, 2360 insertions(+), 704 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

-- 
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
