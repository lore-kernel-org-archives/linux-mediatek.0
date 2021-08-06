Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09E61C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:16:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B33F66044F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:16:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B33F66044F
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=J4FA/7cAYVNFRwW48FyYwXtdOT+lou0DTsSqIT/jRVo=; b=cHn
	jpcCtWFtchNiCisji6sULGeH3WFyNcmsrJ/obvWIkr+AjIAImQlu8LQIOdRSOfI3ojn7orYnhQ4B/
	0fBubpjxl2KjV+yEfmaiz5GPITwTpDb3LTRa6iO6oBXces2qpGrigksqjcrpbcgCAp4ObyFQJw5G9
	D+Mm0T/chEfCRwDebnhfh/ldrMujJINwf+S5GraLzb14+vhP/I+Rqm2BONtJZ4cr0UkU75on3wBRI
	nMl7d/yFqKqyUpl9OSdoEbNc42DPF6ygwSstVlzJOsy8F3cD7tJDIU3LfL7Pt7k+40c7nEcK0ARGJ
	dhXvOdSJXefEAUPZdiGyZ+1YbPRu6KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBrHE-00BSue-FE; Fri, 06 Aug 2021 04:16:08 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBrH1-00BSqR-CY
 for linux-mediatek@lists.infradead.org; Fri, 06 Aug 2021 04:15:58 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 a6-20020a25ae060000b0290551bbd99700so8369298ybj.6
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Aug 2021 21:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=DHya/hoF1LeBPMXz4YTDp72VS75LjFpDtDFk0VuSfn4=;
 b=u56rS8kna/BGA7+TfF+WLwx2MDfeETn+2o1Te0czNN5U77CJpXg4SdgzJBdSOMXvRl
 iBWN1lPTKHfOAB3En7quz5zBHh1lcpxLDAAjd7B4VzY+SC5Tpb0JP0CMOH6IhwZn1PeX
 fZg78LAvDygebVuPwxyF+JlmNzlNB0HCO9fxxHzwADubcpXoniUvXwXM89Tyy1BimE1Q
 IyJwsnOf1Z8aI3alsDnJS4wKzKFYS9k9lAcJnhGeJZN3CCyDwFMKpRs1Hu0z1giHrRtt
 4rgYcJeaFXkzahLdk4FNrR840p/OZEwGv+85F67WK7MCO6JaqAp2hrHQpSJ6GabEIozv
 KF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=DHya/hoF1LeBPMXz4YTDp72VS75LjFpDtDFk0VuSfn4=;
 b=JBKCvDIp8G5ADtAL1QunRkuy8YgUH3pQ1Q19BFPurLvYlWJHHS53NeCVPNoK3VniA+
 Bha4GqheaH/lo1UsmsTKsb/lgLc/XrXNnxmHWRyzGCTdXNjqE+weOCNce4pKWr/9ekg3
 YTnFRjbCOsT48ih4CCKGP4Wld2lTXbzAymntT3IIBdub3yKpZGsJTehTLiMF/8HV48vR
 POZ4ZEXJHcxksZW1IWNdGdYui/Rc0SCC3YtqXmfmvW4/wSQyzl2XGpLN8wDgJgHJJG1N
 P7IvMOweuR2JMSVXGuItc/KmIpbOg9ZFgAc6VMk8H2N85dntJJBle/cP7/9tsXWdRL0V
 MeEA==
X-Gm-Message-State: AOAM531WUgH9Y6tX5bMfzR1kyVhg4YzVbzDdXK8kNEMRtBEISJUcMyCS
 UrJ8HH0XwLPC2oC3s2rFHCrN5DBQffje
X-Google-Smtp-Source: ABdhPJxqAg+C66m0Q2/Z7CVajksZirZN7CWUQJwJfcxiA2BzCiRBO58KrLV63u0xGifnL8GnX8J1JXBSpxLj
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a25:b70d:: with SMTP id
 t13mr10444163ybj.204.1628223352389; Thu, 05 Aug 2021 21:15:52 -0700 (PDT)
Date: Fri,  6 Aug 2021 12:15:16 +0800
Message-Id: <20210806041530.4170869-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 00/14] media: mtk-vcodec: support for MT8183 decoder
From: Tzung-Bi Shih <tzungbi@google.com>
To: hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com, acourbot@chromium.org
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
 dafna.hirschfeld@collabora.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, tzungbi@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_211555_456837_72E8A38B 
X-CRM114-Status: GOOD (  20.44  )
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

Changes since v6:
(https://patchwork.linuxtv.org/project/linux-media/cover/20210705053258.1614177-1-acourbot@chromium.org/)
* Fix errors from 'checkpatch.pl --strict'.
* Fix missing kerneldoc issue.
* Fix wrong device minor number reference.

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
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  68 +-
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      | 628 ++++++++++++++
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 360 ++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  58 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 140 ++-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   6 +-
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 774 +++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 20 files changed, 2241 insertions(+), 729 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateful.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

-- 
2.32.0.605.g8dce9f2422-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
