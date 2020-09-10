Return-Path: <SRS0=yNvG=CT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E76FEC43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 04:11:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F52021D46
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2020 04:11:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WAhp2yS+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NRiAcWHk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F52021D46
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B6SMzLKdC0r1j5JXDL2Hs2cn1sC8F6qHXjt25Df1Nww=; b=WAhp2yS+kM0Pd5a+yCA+X8Hojy
	NV0Wnp6uPQxZCOGwYWEfsgh7HVdUWeC6XzxwelhfmLqRLFZQI5yGnbf9gLx5yfSSYu36pEORc1gFJ
	bX3e0eZFM6NS4rstcFiJ8RDgOx40+/UhL28KW6pEjrHClwCGvFM70rtOznBCJvfAh4POypX9OX/PN
	261szMmUO4rIuKCahHUy4fcELcOOmB0JeFOGAiZPR12+qQ++D/WGsYn5xyoBEmuIho956ptJPUJ52
	09MtWdMMzo8GHhk+FQSRMWiCTcasLAB8hhjYNhaTGJPlHq/BF2woLAtsHzNmntEkIfGOsR8YBBMZG
	kXz+hyjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGDvW-00011z-NM; Thu, 10 Sep 2020 04:11:14 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGDvU-00011F-GE
 for linux-mediatek@lists.infradead.org; Thu, 10 Sep 2020 04:11:13 +0000
Received: by mail-pl1-x62d.google.com with SMTP id r24so271677pls.1
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2020 21:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SjTp1hGds9ZwoOkcpeoGQakZnJuh6PzHnYd7zFegRU8=;
 b=NRiAcWHkL9seEwOjmyIZa3MCaZMmxBU6gYtM36EnQkvpXPeKcxLiCF/OKJTBvSJ+e9
 Jk44zmGowKGaPR4fIlaRKZhunvN6QMSFIzxG0PZ74x8bt2El2eBZRz7pVHbyykM5Acow
 vDBOeXBT0yHaRFahCLTwhTSWPFU+gcQiUKzBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SjTp1hGds9ZwoOkcpeoGQakZnJuh6PzHnYd7zFegRU8=;
 b=msurcyNLLbuUVaV5BroUjH8Qcm0IBGyEbspMgAoCJEbhgyy+gT20qbAb3XDh9n38cW
 W1rcoLestC7Y19bBPin3/+1S/im8kNmkAmeBpehF61ByV0zmlSm1sfHi4BbXAwwfgVLD
 VKvf3j7+EuDc/K1Ej8D/Iql9Cut0Kc/v7Mlj9yXVeHZwT2rMSwm3BDrOg7XkDbQDsX8s
 b/VOCcB3XeSVFeJ5NrlQ2/3oN6oWEM+nvM8VH1/uZEOusPL/7DPhcEfAfol3NAkfrbX0
 oJXbWyHkP2QKr8rQCMXOjxFVLvRv6+1IUe0L2NOrMlTXc3xKSt2NmerCS/A/yFlu8b4d
 Ky1g==
X-Gm-Message-State: AOAM5303xNc6/Mb/8soS/jqdap3Mg3uKKH2xzv2rLdSoB/7c9PW+q8TK
 SzS4YXLkwL9UILjICxelrT0qWQ==
X-Google-Smtp-Source: ABdhPJy/kt256pAD+9kwVUTT8gpc//AaRJDaKiqodWQDyyYH+29li3hwTA00uoaR3VXRStW5UdRJ1g==
X-Received: by 2002:a17:90a:8593:: with SMTP id
 m19mr3592561pjn.104.1599711068389; 
 Wed, 09 Sep 2020 21:11:08 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id z11sm4266169pfc.181.2020.09.09.21.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 21:11:07 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org
Subject: [PATCH 0/2] Add 36bit dma support to mediatek spi-nor controller.
Date: Thu, 10 Sep 2020 12:10:59 +0800
Message-Id: <20200910041101.1695195-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_001112_611071_9E051B9B 
X-CRM114-Status: UNSURE (   8.16  )
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
Cc: linux-kernel@vger.kernel.org, Bayi Cheng <bayi.cheng@mediatek.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mt8192-nor has 36bit addressing support, this patch adds 36bit address
handlings to spi-mtk-nor.

Ikjoon Jang (2):
  dt-bindings: spi: add mt8192-nor compatible string
  spi: spi-mtk-nor: support 36bit dma addressing to mediatek spi-nor

 .../bindings/spi/mediatek,spi-mtk-nor.yaml    |  1 +
 drivers/spi/spi-mtk-nor.c                     | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

-- 
2.28.0.526.ge36021eeef-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
