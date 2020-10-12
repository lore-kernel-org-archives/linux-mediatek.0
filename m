Return-Path: <SRS0=Vqxm=DT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6736DC433E7
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 05:36:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 018062078A
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Oct 2020 05:36:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yjJ71+Og";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nRZ3xxZU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 018062078A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LTauP84XmEaa4yCTdtNQ0NSyt/DS1of43Yw8ySOBH+k=; b=yjJ71+Og5y5Y/c2pGWfusLsER4
	Bf0spI20FSSYj9cMbU18HJne1PCJ+szQDMmoj+9S1ZAro5hrbzG+vCx+sXA29ccl0j8lUSdCcdSkp
	4DEEQy18ZFWNClip0rccaGR4nbqbiV2uhTpdKm9cLXh99VXv2NEBABXrGMNXswKXg9u5GUdMmusCS
	0D6ltqBn38O5w+z4OQ3Y77/3NGUoquEnpBmosTgw/iK9x55yR1JObvb31KTTlR9TS6J0WCDwO2Ci7
	ssj8xpgGARsfW2//kVLbUW257hAZPp1URLN8OM6ddv63R5bbHT6nJlmALseJeky9/mqwNx7lnHQlZ
	38Qiuf2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kRqVJ-0000fX-KB; Mon, 12 Oct 2020 05:36:13 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kRqVG-0000eU-TX
 for linux-mediatek@lists.infradead.org; Mon, 12 Oct 2020 05:36:11 +0000
Received: by mail-pg1-x533.google.com with SMTP id r10so13183378pgb.10
 for <linux-mediatek@lists.infradead.org>; Sun, 11 Oct 2020 22:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6EDjuo7QPESC8K8qyRI6HiwLWK0gooF7JvZrFVR/Meo=;
 b=nRZ3xxZU1hOl1MIuV0VOWC/OWpGvHy07Tnj2ZBej0arSaT2KQZg8q1O4KB+CzGrwqH
 +hOfvJyYx4rL/0ahnGNFed+xLVv7XLlz64ktt358nx53oFeeXpt7Vwwdt7nJw6Rw90W3
 N5ZEdHXruxiRFEbeu7qiW9soI9k6gYjuL5w0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6EDjuo7QPESC8K8qyRI6HiwLWK0gooF7JvZrFVR/Meo=;
 b=Z1lMNzIr8x46psbDTpWpFjLNegqGbZU4lD+8sLeaNOa7MnbUbvVAix4VZziBHEPwCG
 GXOhtlCybc8La45hXEcoC93j3o7a5pmji5CLqHNJ2OmnzIsl1QlxSmKhypa785nlS+w+
 FzjH5dfGZxy6H81KL1esRZs/zIJ0XBVQeCIvAEm4TFPfCPfucz2dT9wghovucxK36rt+
 Mmy/4/iy7CorswqMv1PieIVMSEx43jTDGxMan7TlLvlXCWfhueWGXwkb4Aa1iDmor603
 HDE5q2Vi3yl01V+9Y4dtpZs8jaLkbYH4DLp5DD/cvx+o/gLJtNkqL9NGKQWF03WNL0Sk
 QBLA==
X-Gm-Message-State: AOAM531yd62FcaNf95S51m6aJJNDza/rqFDf24uXywSQbGN41g4GHruq
 +4FWeoLhNi+POwHEuKQFHOA0ng==
X-Google-Smtp-Source: ABdhPJxLZBlW9zTWil/tP+yEcKqzVuTCnvW/h5p6275mT48wsa8c9ScBfnqxufdPYtHf1TfZLOrHgQ==
X-Received: by 2002:aa7:9af1:0:b029:152:6101:ad17 with SMTP id
 y17-20020aa79af10000b02901526101ad17mr22435879pfp.25.1602480967681; 
 Sun, 11 Oct 2020 22:36:07 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id z1sm17646817pgu.80.2020.10.11.22.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Oct 2020 22:36:07 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v3 0/2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
Date: Mon, 12 Oct 2020 14:35:55 +0900
Message-Id: <20201012053557.4102148-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_013611_001471_67CFA9F5 
X-CRM114-Status: GOOD (  13.51  )
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
Cc: gnurou@gmail.com, Alexandre Courbot <acourbot@chromium.org>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Thanks everyone for the feedback on v2. This version has grown a little bit, but
most of the added lines is just code moving around to new files. All in all this
certainly makes the driver a little bit cleaner.

Tested on both MT8173 and MT8183 and confirmed that the decoder was working on
both.

Changes since v2:
* Use the FOO || !FOO magic suggested by Hans to ensure a built-in module does
  not try to link against symbols in a module,
* Added a patch to split the VPU and SCP ops into their own source files and
  make the optional build cleaner,
* Control the build of firmware implementations using two new transparent
  Kconfig symbols.

Changes since v1:
* Added Acked-by from Randy.
* Fixed typo in Kconfig description.

Alexandre Courbot (2):
  media: mtk-vcodec: move firmware implementations into their own files
  media: mtk-vcodec: fix build breakage when one of VPU or SCP is
    enabled

 drivers/media/platform/Kconfig                |  22 ++-
 drivers/media/platform/mtk-vcodec/Makefile    |  10 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   2 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 174 +-----------------
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |   7 +-
 .../platform/mtk-vcodec/mtk_vcodec_fw_priv.h  |  52 ++++++
 .../platform/mtk-vcodec/mtk_vcodec_fw_scp.c   |  73 ++++++++
 .../platform/mtk-vcodec/mtk_vcodec_fw_vpu.c   | 109 +++++++++++
 9 files changed, 274 insertions(+), 177 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c

--
2.28.0.1011.ga647a8990f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
