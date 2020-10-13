Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12DB9C433E7
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 12:44:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E4B122507
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 12:44:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GbOBxHmk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JBmDR5Zc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E4B122507
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1IFgkqYxoaFtY+6L0TbIT95rHsW5hL4WBq2iS8O0/4o=; b=GbOBxHmke/tal30DtNEhhFvGw+
	Qr5XE2DKpVFX3+1tBtUyUlpIk0/2G6xx19RU3nZvfYQNo0X6qyIoOLswG/gvj0d6oQ0oc+xaiiCLU
	kwaQBfh84fRmSn080xC3cd44IYbXa1w49Mjmt6jVOjw70d+9EyKw0AhvLANmGrx+8aqbcxqU6uNEc
	iDnC3E84H4TQH4pXmiRXDakcoQnl+ZRMoAWY1I55fu/5WtOHtjiIrJ4nBwtr2aSR7jD8ySQzjITDb
	EyVYRq6kaDoc/5gB4hi+0lfn/I6u9qgRThboyZXcyVpa6WrL2UfKEPZWOePMmEXOwDrQlIe2Cy4Z4
	KGP4rf6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSJfY-0007T4-68; Tue, 13 Oct 2020 12:44:44 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSJfV-0007S6-KL
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 12:44:42 +0000
Received: by mail-pj1-x1041.google.com with SMTP id h4so2132266pjk.0
 for <linux-mediatek@lists.infradead.org>; Tue, 13 Oct 2020 05:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kROrNp0/vnBVDqgh6bMB0Lv2qonHQWx62hPvR0JVLiY=;
 b=JBmDR5ZcqT+4GTHKuB+FFmQCvAlkmIgjMAlqirZ8kwu91L7bvvvrfNwZPKo13RgEzC
 IOEmqZPnyu5dNhNMFgjhQlwOnOZlxzt9Fl4tO+jc/+6p7XZM96jpwtFpCEIM667Z+lDT
 7gyjHo0935+9qEBN0Gi/B74PjwgZrFmkjbjs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kROrNp0/vnBVDqgh6bMB0Lv2qonHQWx62hPvR0JVLiY=;
 b=Dc8R1UcA+tBNcLtB5PRGAIFbsz9RDclMQNVfdvRzdGKWznx3r8COmT+BPq7r6C5Wc8
 SX/xOb9eAuoVDw0+3Zh+nXqrJTx0E99Ilzrh96DfHlGqGjLrHrUwCBU/c+5caaoRV95y
 SBIxyC0hw+K8TEjAT/nKrEIVGr6fFvFS0yKYnfR8m2SEbpvsmcdPAK80RAZhf2MPyYyU
 7V5EpCgh6wPhNbEqJZAY3dCsNmrzZJGbUouzVmhe6Q09VeuS6mTlzu74933RLNqndmA/
 ABCDsaaw7tw/kE0kt4IJ+fX2kXKyYcJWELnAym4BYejz1Tpj69iBaDePmME9GT87/Pcj
 KqZA==
X-Gm-Message-State: AOAM5323lz94d76QrMWwn5PvcDPSi1Lgb45fGc4cyDjhNsyOsG/E+afz
 iyB6pw/qvqM7Z3c04Qc9EBsRWA==
X-Google-Smtp-Source: ABdhPJzoAbnC6phIDBdMm/XQSDq3CThGjLMNwHM+FB8/E3vUaoqNolC/D6w3MUMgFcIZGCXg98d4ow==
X-Received: by 2002:a17:90a:ff92:: with SMTP id
 hf18mr26653376pjb.171.1602593079032; 
 Tue, 13 Oct 2020 05:44:39 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id b20sm18914536pjo.37.2020.10.13.05.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2020 05:44:38 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v4 0/2] media: mtk-vcodec: fix builds when remoteproc is
 disabled
Date: Tue, 13 Oct 2020 21:44:26 +0900
Message-Id: <20201013124428.783025-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_084441_757395_ABB3358B 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

No functional changes since v3, but it does the job at fixing the build
breakage. :) Please kindly take a look.

Changes since v3:
* Removed obsolete Acked-bys
* Fixed indentation in Kconfig file

Changes since v2:
* Use the FOO || !FOO magic suggested by Hans to ensure a built-in
  module does not try to link against symbols in a module,
* Added a patch to split the VPU and SCP ops into their own source files
  and make the optional build cleaner,
* Control the build of firmware implementations using two new transparent
  Kconfig symbols.

Changes since v1:
* Added Acked-by from Randy.
* Fixed typo in Kconfig description.

Alexandre Courbot (2):
  media: mtk-vcodec: move firmware implementations into their own files
  media: mtk-vcodec: fix build breakage when one of VPU or SCP is
    enabled

 drivers/media/platform/Kconfig                |  28 ++-
 drivers/media/platform/mtk-vcodec/Makefile    |  10 +-
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |   2 +-
 .../platform/mtk-vcodec/mtk_vcodec_enc_drv.c  |   2 +-
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 174 +-----------------
 .../media/platform/mtk-vcodec/mtk_vcodec_fw.h |   7 +-
 .../platform/mtk-vcodec/mtk_vcodec_fw_priv.h  |  52 ++++++
 .../platform/mtk-vcodec/mtk_vcodec_fw_scp.c   |  73 ++++++++
 .../platform/mtk-vcodec/mtk_vcodec_fw_vpu.c   | 109 +++++++++++
 9 files changed, 277 insertions(+), 180 deletions(-)
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_priv.h
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
 create mode 100644 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_vpu.c

--
2.29.0.rc1.297.gfa9743e501-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
