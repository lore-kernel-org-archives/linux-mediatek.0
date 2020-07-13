Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45009C433F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E2222068F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1VobGbQq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cfUC2mwA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E2222068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G3+NtclXc2XRhIihfeBc2/aV5SJwBKzHDdHXT+6Sw1k=; b=1VobGbQqF2AgXojyRiVrK9G+UG
	JNk/q9JhfrlOql98tlZ5wFxN5SgWPOF1gAPwrxjUxgIXyV1Uh9oX6Um7Fhk6teDx7fe+dMgIeCMKr
	T5A0YBsNwN2ZbbtM6uDtW+TJ3BZrtdsSW23c/zAVnaaVOiQFObCuz/Rx/GDn5rs3PL9whjaFvkRC8
	Ls8zoakX5QFXffppM4SlbvcTnWVZHkWEVPxEdDSO/oGHytFPV1E4GYhsDzVRVgFlOMjboLbgUqCd3
	omJdsUP+fLcQaJ+4SdrE91rqwcScuislt7vHUMu/655ppJoIir2MOLRT5X3spiPSBFc5Jkr3BERXA
	OS2182+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jureN-0000KA-7j; Mon, 13 Jul 2020 06:09:15 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jureL-0000JN-9T
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 06:09:14 +0000
Received: by mail-pg1-x529.google.com with SMTP id l63so5564562pge.12
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2020 23:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rj/eX87Yry4bMawv7goL3V6HwtUE4PbCYaJFfOPa4n0=;
 b=cfUC2mwAl/yFCEEpI2JTWLQR07oRL3/ZK1qOLOpHaBBaXdr1Cot3d4xtkUn/ua0OuI
 vx2FsPXISp0gVgegbBXR4y8hzXsCrnuQt7gYCsBbJt94R/kwk4CQK8FEbbNbVSIe90Cq
 jAUarPk+6bOIy+1Cm4T7+tDD5vWHgjOe+GHKs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rj/eX87Yry4bMawv7goL3V6HwtUE4PbCYaJFfOPa4n0=;
 b=qbKN+oF9rTIiwEL6puuzuhoeEtLehTWju4+Q+64e8LZ/6g1EjUIWVkVwzOy15tH5tE
 0X3I1OCRQejY6b048sYdfFsT8th+VDSIk46i+31FZOeUL6/TymKcI21+pqjuZCQOzfS5
 dE8YiVBiJXhkeT97k1ao4EC5FzvWh0OKVsOO7llDhHMm1LfClmV/ryHvS3bhyo7lu9oU
 ShaSUqIhpALeYTiDfZNUgnD+rGIJXz5l2Q0R2KDZNoNNYa6LzeO+NjN0P5Eh3VV1r8dz
 2mGwY8MwR7GUH6jt5FESxCDXv02gOUOfd/cH8tCF+O5MQhCkkDGUdja7o2ZMBXcr2S12
 K1Kw==
X-Gm-Message-State: AOAM530VtbjugaNKSP3adW8/cDQ8Fk4UI3HeGQ3zGIHaJybDYSjkaqRV
 7Zz1U2NB7eXfDzECfhVFoJM3rQ==
X-Google-Smtp-Source: ABdhPJwF8zIyl43VHuHmuurPhhu5gPK9zQSRIVs0CZLKEdAaJwNtmStknGde5p+nOZk/leF1JQ7C+A==
X-Received: by 2002:aa7:9a92:: with SMTP id w18mr30369024pfi.233.1594620549625; 
 Sun, 12 Jul 2020 23:09:09 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 23:09:08 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v3 00/16] mtk-vcodec: venc: support for MT8183 and
 v4l2-compliance fixes
Date: Mon, 13 Jul 2020 15:08:26 +0900
Message-Id: <20200713060842.471356-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_020913_351823_08E9B7F6 
X-CRM114-Status: GOOD (  12.20  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is the third version of the series adding support for the MT8183
encoder (1-9) and fixing v4l2-compliance tests (10-16).

Changes since v2:
* Carried new Acked-bys from mtk-vcodec maintainer,
* Removed 2 patches that addressed what was in fact a bug in
  v4l2-compliance,
* Moved DT bindings patches before the code implementing them as

Changes since v1:
* Checked that no regressions against v4l2-compliance were introduced,
* Fixed 9 failing v4l2-compliance tests,
* Removed 1 cleanup patch of contested utility,
* Carried Acked-bys and Reviewed-bys from mtk-vcodec maintainer.

Alexandre Courbot (12):
  dt-bindings: media: mtk-vcodec: document SCP node
  media: mtk-vcodec: venc: handle firmware version field
  media: mtk-vcodec: venc: specify bitrate range per-chip
  media: mtk-vcodec: venc: specify supported formats per-chip
  dt-bindings: media: document mediatek,mt8183-vcodec-enc
  Revert "media: mtk-vcodec: Remove extra area allocation in an input
    buffer on encoding"
  media: mtk-vcodec: venc support MIN_OUTPUT_BUFFERS control
  media: mtk-vcodec: venc: set OUTPUT buffers field to V4L2_FIELD_NONE
  media: mtk-vcodec: venc: use platform data for ENUM_FRAMESIZES
  media: mtk-vcodec: venc: support ENUM_FRAMESIZES on OUTPUT formats
  media: mtk-vcodec: venc: set default time per frame
  media: mtk-vcodec: venc: fix invalid time per frame in S_PARM

Yunfei Dong (4):
  media: mtk-vcodec: abstract firmware interface
  media: mtk-vcodec: add SCP firmware ops
  media: mtk-vcodec: venc: support SCP firmware
  media: mtk-vcodec: add support for MT8183 encoder

 .../bindings/media/mediatek-vcodec.txt        |   9 +-
 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/mtk-vcodec/Makefile    |   4 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  53 ++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |   1 -
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  38 ++-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 211 ++++++++--------
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 149 ++++++++----
 .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |   2 -
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 228 ++++++++++++++++++
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |  38 +++
 .../platform/mtk-vcodec/mtk_vcodec_util.c     |   1 -
 .../platform/mtk-vcodec/vdec/vdec_h264_if.c   |   1 -
 .../platform/mtk-vcodec/vdec/vdec_vp8_if.c    |   1 -
 .../platform/mtk-vcodec/vdec/vdec_vp9_if.c    |   1 -
 .../media/platform/mtk-vcodec/vdec_drv_base.h |   2 -
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   1 -
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  12 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |  11 +-
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  80 ++++--
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  11 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   |   1 -
 .../media/platform/mtk-vcodec/venc_drv_if.h   |   6 +
 .../media/platform/mtk-vcodec/venc_ipi_msg.h  |  24 +-
 .../media/platform/mtk-vcodec/venc_vpu_if.c   | 141 ++++++++---
 .../media/platform/mtk-vcodec/venc_vpu_if.h   |   8 +-
 26 files changed, 756 insertions(+), 279 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h

--
2.27.0.383.g050319c2ae-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
