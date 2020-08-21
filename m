Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E92C433E4
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:36:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36ADB20738
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:36:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="COUVg0e6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OZ2ABopr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36ADB20738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=La6BNrWmuGDQbSSnvmfWSMDCeIjGS1WY+0Wv1PAER1U=; b=COUVg0e6si/2ruIhWzzRrPudnC
	V/EkQrmH6fHjaUB5mJldqiftn/5btIKqCBhELWIIMubuYKVGCc8GFJL0hU+qiwwv/Vk3KXbCilcmi
	V2iJjrd3Zg/yxZbYkymPlE2/yV/nlSZ2INQPQVWnCnbDAGdbjmWXStXQPhcYvs3BHitr5dO0nh3l7
	H/QkzMPgph40eTA8F/uu0hplcHhIJAsO4VDKSnHcHGOxpcog17R+YbHKDM218/sbC+JGphoL+GQ1p
	pYVVOxZ74iQDYs2zyqWSipbOzLMJH79PGVRH8LPXX16ZwtHnWXdJxRkJqrOaY2RZf6fBAR+cNsXX8
	n5oN6Xkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k94PU-0001zu-Vo; Fri, 21 Aug 2020 10:36:37 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k94PS-0001zD-Nw
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 10:36:35 +0000
Received: by mail-pj1-x1041.google.com with SMTP id mt12so638477pjb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2020 03:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TQjFo6yGcilxeaDCvb6ghdOgX7HhmMppcLzjn5i6JYM=;
 b=OZ2ABoprclPRMEzlullrokDKt0lNah7j7qrBqsq2hWXnuSVJGgdK7loFewlKIeMGMh
 ifg0RT+/F71+dGA9NzOi5CTx+QbcwXY9FD8CLOPEBaCzLpqp5gwa5h9iegeGX4o2CoXI
 AzttIs2raE9Qg6HEVMIAHoVQWq3ogLwFOdZk0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TQjFo6yGcilxeaDCvb6ghdOgX7HhmMppcLzjn5i6JYM=;
 b=Ng7RjWIaPc1VVLmiZgORQ21qQqGdudEHsJINseONpjzrQR0Pk5Vad1fhksl2zmEcsQ
 Z2fMLmPh/TN1igAk/6uyqxorKF95vwvf2+YDkH7RfNAJzOcCtsyxFUy96Pyas1FShfio
 V+VkYOOFRsB8rMEKqvuO+SOYJ3p5xMq0GPx3tICcBUHEG+WTc4qA+fODx2EcUuzsDlIy
 0ojQBgcz2BAxVkGG8oqZXpcfNDCMvgOC7xWODeKqSAxXmEEDbZ5H5RI+fPmXfvaGikCc
 fE7MxNq78/J+ULkuhGbj8z4ucLm1qj6G/VYbrFJKQ1Idra/rmCuArJW+M0xMxhLt35zX
 ypRg==
X-Gm-Message-State: AOAM533ARFmXoIcvf0yQbGcX5OrwGmKkSoxh/IHt7tw/jsDZI57OOyD5
 4y/QoXNYEKKs1658mEdGu4QoZA==
X-Google-Smtp-Source: ABdhPJx0l0EyLUfcpftdOtoC2F29QCf70eHCTCROL65lsXat+QdASxquATcDzNcsV77LRyg9Uh5xQQ==
X-Received: by 2002:a17:90b:951:: with SMTP id
 dw17mr1965256pjb.9.1598006192690; 
 Fri, 21 Aug 2020 03:36:32 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.36.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:36:31 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 00/17] media: mtk-vcodec: venc: support for MT8183
Date: Fri, 21 Aug 2020 19:35:51 +0900
Message-Id: <20200821103608.2310097-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_063634_816288_F6DE0D90 
X-CRM114-Status: GOOD (  17.20  )
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

Here is new respin of the MT8183 encoder support and v4l2-compliance fixes
series, addressing issues raised during the v3 review (thanks in particular
to Ezequiel for the feedback!). With this version I hope to complete the
collection of Acked-by from respective maintainers. A few driver patches still
need approval for the mtk-vcodec maintainer, and so does the patch adding the
device tree node (9/17) that is new to this series.

This series has been tested and confirmed to work on both Hana (MT8173) and
Krane (MT8183) Chromebooks. v4l2-compliance also passed successfully on both
devices.

Changes since v3:
* Link mtk_vcodec_fw.o to the mtk_vcodec_common module
* Add some documentation to structures used for firmware communication
* Remove some on-the-spot variables renamings that were distracting
* Add device tree nodes for MT8183 boards
* Carry new Acked-bys

Changes since v2:
* Carried new Acked-bys from mtk-vcodec maintainer
* Removed 2 patches that were triggered by a bug in v4l2-compliance
* Moved DT bindings patches before the code implementing them

Changes since v1:
* Checked that no regressions against v4l2-compliance were introduced,
* Fixed 9 failing v4l2-compliance tests,
* Removed 1 cleanup patch of contested utility,
* Carried Acked-bys and Reviewed-bys from mtk-vcodec maintainer.

Alexandre Courbot (13):
  dt-bindings: media: mtk-vcodec: document SCP node
  media: mtk-vcodec: venc: handle firmware version field
  media: mtk-vcodec: venc: specify bitrate range per-chip
  media: mtk-vcodec: venc: specify supported formats per-chip
  dt-bindings: media: document mediatek,mt8183-vcodec-enc
  arm64: dts: mt8183: add encoder node
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
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |  10 +
 .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |  12 +
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  36 +++
 drivers/media/platform/Kconfig                |   1 +
 drivers/media/platform/mtk-vcodec/Makefile    |   6 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  53 ++--
 .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   |   1 -
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  40 ++-
 .../platform/mtk-vcodec/mtk_vcodec_enc.c      | 211 ++++++++--------
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  | 173 +++++++++----
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
 .../platform/mtk-vcodec/venc/venc_h264_if.c   |  68 +++++-
 .../platform/mtk-vcodec/venc/venc_vp8_if.c    |  11 +-
 .../media/platform/mtk-vcodec/venc_drv_if.c   |   1 -
 .../media/platform/mtk-vcodec/venc_drv_if.h   |  13 +
 .../media/platform/mtk-vcodec/venc_ipi_msg.h  |  27 ++-
 .../media/platform/mtk-vcodec/venc_vpu_if.c   | 141 ++++++++---
 .../media/platform/mtk-vcodec/venc_vpu_if.h   |   8 +-
 29 files changed, 836 insertions(+), 283 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw.h

--
2.28.0.297.g1956fa8f8d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
