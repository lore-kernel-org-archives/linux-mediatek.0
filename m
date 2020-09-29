Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E853EC4346E
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 07:38:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 991B020848
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 07:38:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JMDN0SeM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZOFyvlCL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 991B020848
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tQ5DT8KStla6lPg9TQiDVDIvRdifJMpgvGfqYd58YbY=; b=JMDN0SeM+4XGkSOiXBJOuDAGIi
	hfqlZ5iZ8pKwVXMWlhC/lXlgFVY/F9GLbm1gyaMDATjf5LrVC9SBUDqvRkPbKtU6rn9uzSI2ZS2ZC
	CE8hv6UcFLyD08r4a6Urnvr6pKux5ZA5KvEeSnMNXghqV5qD4GIktTWO8Lob7yMgcAwU8Seo2FOCV
	RmiCRiRJBha1Ak8COod90xq5dN/NPANZRXhK6J8YMPV7RQW+CtwolggZkD7iZMw3C6UV3mfh07bld
	Fpd0IwOU7jANNH3FGg8/SulXtsYX8KC0zf/aCBh8/98QAHjoulAJtokZbr2yr+Z7lUdPLX/jJaE4l
	Ar3AvejA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNADE-0002YN-MP; Tue, 29 Sep 2020 07:38:12 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNADA-0002WR-J8
 for linux-mediatek@lists.infradead.org; Tue, 29 Sep 2020 07:38:09 +0000
Received: by mail-pf1-x444.google.com with SMTP id n14so3679683pff.6
 for <linux-mediatek@lists.infradead.org>; Tue, 29 Sep 2020 00:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=io1cz9TQOCr2lsgpG0jFMP3QgjGEulFGbq1UdpXz5V4=;
 b=ZOFyvlCLR8T8JpIU79KN9MsP6sRAHSvMzIjIZONONWF7W/+U3LsaU1wt67X0ZP3Wn2
 mGZIaHbxB+vQzJGNYTotCQJhBH+z54Ff0okyevumh7NAhymfIacbmmYBsbRkFuQiK1bn
 QslXqt5AOL4KyTGwdLRHnoAhiSyL7klugyFjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=io1cz9TQOCr2lsgpG0jFMP3QgjGEulFGbq1UdpXz5V4=;
 b=ecFj4zj1ThE1vHm8jMBgEPkj7S6ii7M78cwui3lGj8Wop+Can141CyiWxpHsSJh4k2
 HYDvwzOutvZkyf4l1FZ2yvrnevAiCDLakPLSK9H3OXm4UugeynCXQrNVcsyhyUprBmQQ
 MH7iH4JyI90ENHHmvfkt7DfBrho63tcyps74dhfKnLwCjydSoNmHl8L1hBtkkqaxnhzc
 9i+ASrrVf7ywBCxCpXnEnyIH4xjmxP/N5o4IYo+o2suLBNCjuQ9Wfh9j7YIPFPLpwIKu
 4Xcq712KAebUDbdIoxCqmojqNIAHOFgmFsitKkYOkEfVeLk1DHhScsddMSU2XsJucIQq
 erKg==
X-Gm-Message-State: AOAM533J/u1QiRoJHrNJuTOFRtIMlIBJ7CFgBQtiB/dCYJU+f0sUq64h
 ItUnF2jXdGkjGqjnU/vFkQgKpQ==
X-Google-Smtp-Source: ABdhPJwXYEUsBsCIdgNi3hgFN2mrzey+Q3KLI0dKFDQsChyUPfOEB+KJ/+oKD8iGZQr8LY3JxgnjqQ==
X-Received: by 2002:a65:6883:: with SMTP id e3mr2228137pgt.250.1601365084796; 
 Tue, 29 Sep 2020 00:38:04 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id e13sm3737317pjy.38.2020.09.29.00.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 00:38:00 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v4 0/4] spi: spi-mtk-nor: Add mt8192 support.
Date: Tue, 29 Sep 2020 15:37:51 +0800
Message-Id: <20200929073755.3741416-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.28.0.709.gb0816b6eb0-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200929_033808_697625_3A7F6D2E 
X-CRM114-Status: GOOD (  10.71  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


This patchset adds 36bit dma address and power management
supports for mt8192-nor. Additionally, use dma_alloc_coherent()
instead of kmalloc() for internal bounce buffer for platforms
of only supporting 32bit addresses.

Changes in v4:
- Drop two patches from a list which already addressed by
  an another series and not directly related with mt8192 support
- Fix 0-day ci 'shift-count-overflow' warning
- Fix missing 'high_dma' initialization for 36bit address

Changes in v3:
- Fix a bugfix of v2 in checking spi memory operation.
- split read_dma function into two (normal/bounce)
- Support 7bytes generic spi xfer

Changes in v2:
- Add power management support
- Fix bugs in checking spi memory operation.
- use dma_alloc_coherent for allocating bounce buffer
- code cleanups

Ikjoon Jang (4):
  dt-bindings: spi: add mt8192-nor compatible string
  spi: spi-mtk-nor: use dma_alloc_coherent() for bounce buffer
  spi: spi-mtk-nor: support 36bit dma addressing
  spi: spi-mtk-nor: Add power management support

 .../bindings/spi/mediatek,spi-mtk-nor.yaml    |   1 +
 drivers/spi/spi-mtk-nor.c                     | 210 ++++++++++++------
 2 files changed, 147 insertions(+), 64 deletions(-)

-- 
2.28.0.709.gb0816b6eb0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
