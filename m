Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C1E6C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:18:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0CE920738
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 08:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zM/frOOj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="onQhzXUQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0CE920738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZicZn7s+EZlqBAL6wvlCg7dNtJOKVF++s13Np10zi7k=; b=zM/frOOjCCw2ph2D89GdthMnkc
	HcYSG9z6XfjGFvizIwW82NBWvHCbk5gdeXfD4SS5nfg4G/GlHR27NKYmZfCvIWQN/PuWZCzpOgF8T
	ppHqp0IZyJZJUHfl/eiVkc32WbgyORVhvOJQb3C8wvNC0M9szUKhzhXgJh66PpaTZD0D/4EKN4Y2n
	ND5pCb8Mo3AghygKpQPEdLmVt8LMoivhSBB3nP2lzQCrn8E4AEf3g2p/GfF+XoXDnxHDlhA7JmrD4
	XM8f/NOrozgTWIRVHYm4cFUfJbmwsQeXwxcdl3IgiYrHOjYDty0iG8G/l2+GGx7Nd6lAVkm9+uQT8
	yURfaipQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7aL8-00075r-Bg; Mon, 17 Aug 2020 08:17:58 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7aKz-00072o-Hc; Mon, 17 Aug 2020 08:17:52 +0000
Received: by mail-pj1-x1044.google.com with SMTP id d4so7329483pjx.5;
 Mon, 17 Aug 2020 01:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=dcFVRpNADqEtdLi4FpRtkurfxDiB5cQRK9Dfdg9x+Fk=;
 b=onQhzXUQgU/a+5iv1eiedq708N2qUvbb9hLqPwbNcMZbrafaVgtTLqod6W5S5EvgwW
 ia2Ga+2FDUNHJJUlvHy5eBfliIeLogU4Wi1w83nBad7XrSZfGbQDw8JL6oyYw8RaTYtb
 GOxydtPyCELUViaGBMuJFHCNSjMyLoNfpvRMuQgrxT2UY8A3e6JIUTqyPNMAL7rw2Z/z
 jRmxaeFeF106x1RJs9MwNGIRcjt7SYVS8LunMdKQB2V5M7ITp8JAW4VZ0O73s28t9dSG
 M8mTaGTmh1K0jOh4sD2d3fwjxfMBFzh2nP52Yc87N5AUdfK33PUFRxYhs2yKIAgHNHgo
 Nr0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=dcFVRpNADqEtdLi4FpRtkurfxDiB5cQRK9Dfdg9x+Fk=;
 b=lmYOt+loWky1sR1VNSF4GrOnJB8j2AOGG1KEUu/izNIn8tFqYHL89fCwDM8xsahvGY
 W7wGqa3FfVlPxBoY6/0gr+DByjHEia0lmmVnlg4m6gPnHRfKpgQ/eX96Z7yUlyDEiecQ
 xRy0tw5+IBHGVHzWv9FkuQ4HNEcxBdaQT3qTHjtIitHjJ8t+IJLqtJThe9oyfCwCI/kh
 lhJbp8cIe9059JHuWCvE4ZtlzmX4nhoxGzl2EbsLycu4ACFIJdMEFrvNx332b3MWnc1u
 8qJnP6V4exy5C1dxN8/A1xF5EyBdxa8kIa7eQLGd8L99zwU6lqHwuzbCj50fiJTyNbHY
 GaAw==
X-Gm-Message-State: AOAM531Gb0k/VzlZXpBHw1rtpqRfQulf6w19j4kp8ahWuledG7GXjgBg
 hz0WpZrbWVDPyvIShGn0Ppw=
X-Google-Smtp-Source: ABdhPJzb4y/jT+CQHEdRjViuIc33Qdx/u/JnZxpHs/hd00NvayTZxHDE23pPiqS7tepaKyIUna7B1Q==
X-Received: by 2002:a17:90b:3603:: with SMTP id
 ml3mr11555104pjb.207.1597652267552; 
 Mon, 17 Aug 2020 01:17:47 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id d93sm16735334pjk.44.2020.08.17.01.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:17:47 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, ast@kernel.org,
 daniel@iogearbox.net, kafai@fb.com, songliubraving@fb.com, yhs@fb.com,
 andriin@fb.com, john.fastabend@gmail.com, kpsingh@chromium.org,
 baohua@kernel.org, mripard@kernel.org, wens@csie.org,
 thierry.reding@gmail.com, jonathanh@nvidia.com, michal.simek@xilinx.com,
 matthias.bgg@gmail.com
Subject: [PATCH 00/35] dma: convert tasklets to use new tasklet_setup()
Date: Mon, 17 Aug 2020 13:46:51 +0530
Message-Id: <20200817081726.20213-1-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_041749_608591_9F083726 
X-CRM114-Status: UNSURE (   9.88  )
X-CRM114-Notice: Please train this message.
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
Cc: keescook@chromium.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Allen Pais <allen.lkml@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-tegra@vger.kernel.org, bpf@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Commit 12cc923f1ccc ("tasklet: Introduce new initialization API")'
introduced a new tasklet initialization API. This series converts 
all the dma drivers to use the new tasklet_setup() API


Allen Pais (35):
  dma: altera-msgdma: convert tasklets to use new tasklet_setup() API
  dma: at_hdmac: convert tasklets to use new tasklet_setup() API
  dma: at_xdmac: convert tasklets to use new tasklet_setup() API
  dma: coh901318: convert tasklets to use new tasklet_setup() API
  dma: dw: convert tasklets to use new tasklet_setup() API
  dma: ep93xx: convert tasklets to use new tasklet_setup() API
  dma: fsl: convert tasklets to use new tasklet_setup() API
  dma: imx-dma: convert tasklets to use new tasklet_setup() API
  dma: ioat: convert tasklets to use new tasklet_setup() API
  dma: iop_adma: convert tasklets to use new tasklet_setup() API
  dma: ipu: convert tasklets to use new tasklet_setup() API
  dma: k3dma: convert tasklets to use new tasklet_setup() API
  dma: mediatek: convert tasklets to use new tasklet_setup() API
  dma: mmp: convert tasklets to use new tasklet_setup() API
  dma: mpc512x: convert tasklets to use new tasklet_setup() API
  dma: mv_xor: convert tasklets to use new tasklet_setup() API
  dma: mxs-dma: convert tasklets to use new tasklet_setup() API
  dma: nbpfaxi: convert tasklets to use new tasklet_setup() API
  dma: pch_dma: convert tasklets to use new tasklet_setup() API
  dma: pl330: convert tasklets to use new tasklet_setup() API
  dma: ppc4xx: convert tasklets to use new tasklet_setup() API
  dma: qcom: convert tasklets to use new tasklet_setup() API
  dma: sa11x0: convert tasklets to use new tasklet_setup() API
  dma: sirf-dma: convert tasklets to use new tasklet_setup() API
  dma: ste_dma40: convert tasklets to use new tasklet_setup() API
  dma: sun6i: convert tasklets to use new tasklet_setup() API
  dma: tegra20: convert tasklets to use new tasklet_setup() API
  dma: timb_dma: convert tasklets to use new tasklet_setup() API
  dma: txx9dmac: convert tasklets to use new tasklet_setup() API
  dma: virt-dma: convert tasklets to use new tasklet_setup() API
  dma: xgene: convert tasklets to use new tasklet_setup() API
  dma: xilinx: convert tasklets to use new tasklet_setup() API
  dma: plx_dma: convert tasklets to use new tasklet_setup() API
  dma: sf-pdma: convert tasklets to use new tasklet_setup() API
  dma: k3-udma: convert tasklets to use new tasklet_setup() API

 drivers/dma/altera-msgdma.c      |  6 +++---
 drivers/dma/at_hdmac.c           |  7 +++----
 drivers/dma/at_xdmac.c           |  5 ++---
 drivers/dma/coh901318.c          |  7 +++----
 drivers/dma/dw/core.c            |  6 +++---
 drivers/dma/ep93xx_dma.c         |  7 +++----
 drivers/dma/fsl_raid.c           |  6 +++---
 drivers/dma/fsldma.c             |  6 +++---
 drivers/dma/imx-dma.c            |  7 +++----
 drivers/dma/ioat/dma.c           |  6 +++---
 drivers/dma/ioat/dma.h           |  2 +-
 drivers/dma/ioat/init.c          |  4 +---
 drivers/dma/iop-adma.c           |  8 ++++----
 drivers/dma/ipu/ipu_idmac.c      |  6 +++---
 drivers/dma/k3dma.c              |  6 +++---
 drivers/dma/mediatek/mtk-cqdma.c |  7 +++----
 drivers/dma/mmp_pdma.c           |  6 +++---
 drivers/dma/mmp_tdma.c           |  6 +++---
 drivers/dma/mpc512x_dma.c        |  6 +++---
 drivers/dma/mv_xor.c             |  7 +++----
 drivers/dma/mv_xor_v2.c          |  8 ++++----
 drivers/dma/mxs-dma.c            |  7 +++----
 drivers/dma/nbpfaxi.c            |  6 +++---
 drivers/dma/pch_dma.c            |  7 +++----
 drivers/dma/pl330.c              | 12 ++++++------
 drivers/dma/plx_dma.c            |  7 +++----
 drivers/dma/ppc4xx/adma.c        |  7 +++----
 drivers/dma/qcom/bam_dma.c       |  6 +++---
 drivers/dma/qcom/hidma.c         |  6 +++---
 drivers/dma/qcom/hidma_ll.c      |  6 +++---
 drivers/dma/sa11x0-dma.c         |  6 +++---
 drivers/dma/sf-pdma/sf-pdma.c    | 14 ++++++--------
 drivers/dma/sirf-dma.c           |  6 +++---
 drivers/dma/ste_dma40.c          |  7 +++----
 drivers/dma/sun6i-dma.c          |  6 +++---
 drivers/dma/tegra20-apb-dma.c    |  7 +++----
 drivers/dma/ti/k3-udma.c         |  7 +++----
 drivers/dma/timb_dma.c           |  6 +++---
 drivers/dma/txx9dmac.c           | 14 ++++++--------
 drivers/dma/virt-dma.c           |  6 +++---
 drivers/dma/xgene-dma.c          |  7 +++----
 drivers/dma/xilinx/xilinx_dma.c  |  7 +++----
 drivers/dma/xilinx/zynqmp_dma.c  |  6 +++---
 43 files changed, 135 insertions(+), 157 deletions(-)

-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
