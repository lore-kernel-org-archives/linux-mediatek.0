Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17D1BC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 10:16:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B727D64F12
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 10:16:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B727D64F12
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pgpp+QZwPF2vlnxo4IPQrwn+ia2gc6dMXFCRg3diqM0=; b=IpoLKudtzmqU1XzTxn/vhUvAqv
	CuRWcM4C9E3dWLv0jX1XXtQ50+334KvXeI/9HARiGjdQygIvyYJpO/v9ToPs95uSR37tu3ZnCKop2
	iykfGdmcP7jFw2LRUQcCodzqAGc2/esCOwfBH33abEDKediqbVThIBIxHijfdh/rZhhgXjamPUkpC
	qH9+pYzUZxz2Xy1LVudN1BN/c7GqWlJuQXhjeC1rR99Wt4FKF9U03kjMcKjaMHabn2a0K/5PGtCzV
	gwtNkM2YPKik+xHGs4jy7/dfxe2fLkxlnBiqZyHssiIfk72FDGzjXJqc3JyBNmwnkVVS+2DbNcoP1
	1dupixJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFDhA-0002Mj-GB; Thu, 25 Feb 2021 10:16:32 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFDh7-0002Kv-UE
 for linux-mediatek@lists.infradead.org; Thu, 25 Feb 2021 10:16:31 +0000
Received: by mail-pj1-x1033.google.com with SMTP id u12so3016211pjr.2
 for <linux-mediatek@lists.infradead.org>; Thu, 25 Feb 2021 02:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0atpWon12z4IWnuFWgpbQsyQr6nSoFQweJtAwwQcdzg=;
 b=Nr5BqbxSOcyQWzKpp/SIuKrPwvxQi8Q+NaZCxHSiZbKbAa7GL+dL03bUeGe8+Da7W2
 Wh2dyEXlJj21rZwW0q7mdkSY6Y0SBVbJGUE2n9VHhJIa4L2liA1vXmRseWAjFWK0jD01
 EvnCG73mMk8Y5NSKJIBUTqCHAfBnBJJeMf1pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0atpWon12z4IWnuFWgpbQsyQr6nSoFQweJtAwwQcdzg=;
 b=hkXoiDV/XLNh/Vn5ef5uJf9QIbHjrRLKxITHoEppPOnMxVWEhyHOWm+d4CSbzSN13t
 SKpPeahZAYz8JiHxg/QbkZvaVV4xM+Sn73e+a2fwpswdZS+xF3zFJwsqDrjsH8xM/O5x
 EngZ4r63DgBN/E20OEuPDob14pgP9TJ7N4osNs68DBCB/0BrY4Z4af8QdC617T/prkAd
 PoqzAJMV7CXKoE7kXo7LrnirZ5iz8itWylwFnE8HBn5JslpfQIkyIMCsj8xo/+aDdQfp
 WAkGHbcnElNNytvTYQrD8bLOeIwQDX1hqxjqpFbRaR19PIpbUDs4eQutsBHTAJYm7/NP
 wDMA==
X-Gm-Message-State: AOAM533zY90i9EQCMTQuN2wHYakkvh7xB6gZ+df/lKYn66oAchXeQgne
 rvxDszKAtQ1Tscp+G35qtc3f1Q==
X-Google-Smtp-Source: ABdhPJzBmqqLIz2rwI/0pS/Sl2SKlj6SwhdoQHrjNHnPKxBAWzEzxWx61d+Ngoc2E6AzBwVP2WUQsQ==
X-Received: by 2002:a17:90a:d318:: with SMTP id
 p24mr2744855pju.122.1614248186008; 
 Thu, 25 Feb 2021 02:16:26 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:2550:3154:2c53:b6e7])
 by smtp.gmail.com with ESMTPSA id z2sm5848193pfc.8.2021.02.25.02.16.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 02:16:25 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH v2 0/8] media: mtk-vcodec: vdec: support for MT8183
Date: Thu, 25 Feb 2021 19:16:04 +0900
Message-Id: <20210225101612.2832444-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_051630_014588_0C2C04C3 
X-CRM114-Status: GOOD (  14.97  )
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

Here is the second version is this patchset, although there has been such a
delay after the first one that probably nobody remembers it has even been sent.

This series adds support for the stateless API into mtk-vcodec, by first
separating the stateful ops into their own source file, and introducing a new
set of ops suitable for stateless decoding. As such, support for stateful
decoders should remain completely unaffected.

This series has been tested with both MT8183 and MT8173. Decoding was working
for both chips, and in the case of MT8173 no regression has been spotted.

v4l2-compliance is also passing, minor a problem when testing requests on
MT8183: the test tries to call S_EXT_CTRLS on the first available control,
which happens to be V4L2_CID_MIN_BUFFERS_FOR_CAPTURE. Since this control is
read-only, the driver returns -EACCESS. I suppose this is a problem with
v4l2-compliance and not the driver.

Alexandre Courbot (4):
  media: mtk-vcodec: vdec: handle firmware version field
  media: mtk-vcodec: support version 2 of decoder firmware ABI
  media: add Mediatek's MM21 format
  dt-bindings: media: document mediatek,mt8183-vcodec-dec

Yunfei Dong (4):
  media: mtk-vcodec: vdec: support stateless API
  media: mtk-vcodec: vdec: support stateless H.264 decoding
  media: mtk-vcodec: vdec: add media device if using stateless api
  media: mtk-vcodec: enable MT8183 decoder

 .../bindings/media/mediatek-vcodec.txt        |   1 +
 .../media/v4l/pixfmt-reserved.rst             |   7 +
 drivers/media/platform/Kconfig                |   2 +
 drivers/media/platform/mtk-vcodec/Makefile    |   2 +
 .../platform/mtk-vcodec/mtk_vcodec_dec.c      |  66 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec.h      |   9 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  44 +
 .../mtk-vcodec/mtk_vcodec_dec_stateful.c      |   1 +
 .../mtk-vcodec/mtk_vcodec_dec_stateless.c     | 427 +++++++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |   9 +
 .../mtk-vcodec/vdec/vdec_h264_req_if.c        | 808 ++++++++++++++++++
 .../media/platform/mtk-vcodec/vdec_drv_if.c   |   3 +
 .../media/platform/mtk-vcodec/vdec_drv_if.h   |   1 +
 .../media/platform/mtk-vcodec/vdec_ipi_msg.h  |  23 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.c   |  43 +-
 .../media/platform/mtk-vcodec/vdec_vpu_if.h   |   5 +
 drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
 include/uapi/linux/videodev2.h                |   1 +
 18 files changed, 1442 insertions(+), 11 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_stateless.c
 create mode 100644 drivers/media/platform/mtk-vcodec/vdec/vdec_h264_req_if.c

--
2.30.0.617.g56c4b15f3c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
