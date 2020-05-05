Return-Path: <SRS0=+Wu7=6T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7EFDC47247
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 04:01:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8940E20721
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2020 04:01:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BBPzsbk6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="L9xooj06"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8940E20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SL9QnoiRLkwPX+2zyGw0W3wYCFz4qCObYK8KPOikScY=; b=BBPzsbk6KTrYAZ
	0mzhzJTyBh8YCU+RSATnYEHFYDMr5KeEpNL/uzOQIB99JIlxSul0iVaWHsTeYI2KjsmRKOyHm6LEF
	rzVbent8zobVjcTAGyeHPdd2qc+Fz1AazyM7h1Glb/UXLfhhHFbALNOy6MdRGuatNaJe8+c4UDKQA
	O6MO4fhp0vKFPzm0FNnPAQ6sE90ih6Ll19Ji6dwq0laGpH8uiwyzS9Zk+LHa7SDhhU8wLDhl1WV+g
	X0elJCDBOh4ATUTq9+oe11j7cA2BO02I4dtegjyPPvVQ/1h79UKPsNstIUSJMQP0fZE5fgDZNkxTe
	g8kAJGFwMS0UxtAVfRoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jVolS-0002z2-QM; Tue, 05 May 2020 04:01:02 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jVolQ-0002xv-6u
 for linux-mediatek@lists.infradead.org; Tue, 05 May 2020 04:01:01 +0000
Received: by mail-pg1-x544.google.com with SMTP id b8so435408pgi.11
 for <linux-mediatek@lists.infradead.org>; Mon, 04 May 2020 21:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zXcNVzanMlcydlCFrB2r+HWplGTpnlRV6J+MdBaPrW0=;
 b=L9xooj06SkKYA1F/mM6gzkXw0XRoE4+PPOkuKWhil2K0egyXKdJzupiMsGnMwT0YZQ
 xGiwlJ5L/ot5yLd7/aWq+6s6xqhhn81GenquLvLfmVrAVCzRFE5iCEWnvH3ef9uQv72m
 Ixc8jb7K6KPUUbjSkttRV/P8Yde3shEwk7HKE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zXcNVzanMlcydlCFrB2r+HWplGTpnlRV6J+MdBaPrW0=;
 b=HiBpW3B3owvcnleVMzWxWcx+5drxzwjOIu8LMgkrkOO5vPnA3212qTeLTxl14+CnXd
 1lrWLVUDZFOf2owEzGk4RIAT9omkQLS1PWhrhhpVUvbPKiP/shcoa0HMFzDLj3xej/vP
 2idQN0skS1YfKQOvvxHC8Gq5jq9MjCoQq6dJlhF5CSNwaaCyP2eKwcyKeGlb6eoSdYaN
 3WYe02jzNw4QK9/bA2b4gQT4HkC1KMUx+8Oo4mbBGpsJrN1G9EOhbQsvEieycjCQSFjy
 V5i7W9vAkeCAIpF+1cnZN2pm6MJXNFdvEzCH0WKe61LhUefCbzcqTd+nNdglFNvVccA5
 W/OA==
X-Gm-Message-State: AGi0PuZYNffSwd2GbCgK+xaTBdSdGe/egQBExScpreOT7p6+QE3h5yDO
 SWm4A29q2A/Jx5Y+Ab2F1Px3oQ==
X-Google-Smtp-Source: APiQypIp32k7wFgY1LdvBHBmqXAPISaNhBFaTPFmVLXNVlSrCu74vyD+6Dj1MKLOgE+L+DG1C5YGzw==
X-Received: by 2002:a63:1103:: with SMTP id g3mr1357965pgl.206.1588651258943; 
 Mon, 04 May 2020 21:00:58 -0700 (PDT)
Received: from localhost ([2401:fa00:9:14:a92f:c47d:76a8:b09e])
 by smtp.gmail.com with ESMTPSA id c124sm585707pfb.187.2020.05.04.21.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 May 2020 21:00:58 -0700 (PDT)
From: Eizan Miyamoto <eizan@chromium.org>
X-Google-Original-From: Eizan Miyamoto <eizan@google.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/5] MTK MDP driver cleanups to prep for futher work
Date: Tue,  5 May 2020 14:00:43 +1000
Message-Id: <20200505040048.132493-1-eizan@google.com>
X-Mailer: git-send-email 2.26.2.526.g744177e7f7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200504_210100_273818_4418E881 
X-CRM114-Status: UNSURE (   6.89  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>, Eizan Miyamoto <eizan@chromium.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Eizan Miyamoto <eizan@chromium.org>


It most notably converts an array of MDP components to a list instead,
but also removes some unused fields.

This series of patches does some cleanup in preparation for futher work
so that hardware video decode works on 4.19 and later kernels. We are
planning on adding a dummy driver for the relevant MDP components that
will be bound together using the component framework, which will enable
calls to set up IOMMUs and LARBs, and make calls into pm_runtime.


Eizan Miyamoto (5):
  [media] mtk-mdp: remove mtk_mdp_comp.regs from mtk_mdp_comp.h
  [media] mtk-mdp: handle vb2_dma_contig_set_max_seg_size errors during
    probe
  [media] mtk-mdp: handle vpu_wdt_reg_handler() errors during probe
  [media] mtk-mdp: convert mtk_mdp_dev.comp array to list
  [media] mtk-mdp: Remove mtk_mdp_comp.id and supporting functionality

 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 60 ++-------------
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.h | 23 +-----
 drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 74 ++++++++++++-------
 drivers/media/platform/mtk-mdp/mtk_mdp_core.h | 10 ++-
 4 files changed, 68 insertions(+), 99 deletions(-)

-- 
2.26.2.526.g744177e7f7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
