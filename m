Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E32C4727E
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:54:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BE7123447
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:54:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H2FKuELb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="buj5lWW/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BE7123447
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sbSCBpSmnK49CKfgyivSkygymqRnz4E3ayQDXtbBn8c=; b=H2FKuELbCB4aVRKsKzFR1dOUN3
	T8C00RFvNJ9vNQu3opjmlO7DjsGD/lGHgluVh0ovtRckE+vWrgex0ar37JDId+3TXVw0ODYvcKVPi
	oN04DQvoSLwv8CfmHYf0Q7kN7fmZ3t2+E3FB5aGz5H/dpUCKyILa4XsTMbhYy4yQU8MMZYZobl77M
	DkYh7upuAHreBSu77GnL2PmoqdSlLWmqgOGb5VKDuqZeOHCkZN62foJlMCPFTaUeGWFsnhxNIxWue
	lZF+tq/+4IJX7v+y/OBC2A8db/MCp3Q9boUTh+T1AoEW0g9GlmRTJ2Xc0SwiuVnQR/vgtHF/ZIQiq
	GH+uaQfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLhck-0003OI-8Z; Fri, 25 Sep 2020 06:54:30 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLhcg-0003Mo-RM
 for linux-mediatek@lists.infradead.org; Fri, 25 Sep 2020 06:54:27 +0000
Received: by mail-pf1-x441.google.com with SMTP id z18so2268369pfg.0
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2020 23:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vw1KoQ4s8DeBpjj9MyCO9ispMM5JjMGFm+aZoaWCoVI=;
 b=buj5lWW/a+hMjzNtcF/uMLSF78MUB7xqm+T2nNX04mS+0nYwnCiB3E3vUa5Dd5jiNj
 i36ji4XPTi6D0JoZkkMNBs31NHdmTWkPUc8AwirL2lf/k3cOryvCDvXcYn9xjj5CV4EY
 lOdRjxs4FSfryaOXZ3QyOkaIa7Nbgrcw044Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vw1KoQ4s8DeBpjj9MyCO9ispMM5JjMGFm+aZoaWCoVI=;
 b=NptimDZEcnvld0xh4vOuLcSwolo9/ixpG+BnX3grd7dXVRsRbZrdRnv+RfgSNiPeyh
 4ug9TFeMzi1N4GZL2xtLLtocAE2Pmp3Xpeh08I3BFzjVZMQNZxBR2pdw6tPJEEl7DyhZ
 5/6yAx752ZPVo2VZfv06dU93IsPsE0NH2wGUrPywZPc+NSXDgggOjDMA7mTCoNZopUK4
 zgLggxtKkVLaCkGD7NPXBw+qzXQfAns17nWtSb96ywwg1eqw2PWF8GrJXmxmQlLn5AM4
 QoIE442uCmIcbZJ9hkfmkYxAYaD5SwaJy3r8CfBMRVgCtjY1umhW59yD6nUKjUPs5gEg
 +x4Q==
X-Gm-Message-State: AOAM532qctGWrAdmFNstbVdtPYW095bd5KxAdqP91xqQOJjzlQ9sgM8O
 vt2XhhN1+/+D/+XlgzY9WnFKjQ==
X-Google-Smtp-Source: ABdhPJxgajGnraK24ZhbVuK9fVP7hcc5f5AZ8YpbNmdibOe6j74I/hhduxVUpobEzgb6A2dXHC7BZA==
X-Received: by 2002:aa7:85d4:0:b029:142:440b:fcd7 with SMTP id
 z20-20020aa785d40000b0290142440bfcd7mr2754055pfn.36.1601016863314; 
 Thu, 24 Sep 2020 23:54:23 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id x27sm1549612pfp.128.2020.09.24.23.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 23:54:22 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3 0/6] spi: spi-mtk-nor: Add mt8192 support
Date: Fri, 25 Sep 2020 14:54:11 +0800
Message-Id: <20200925065418.1077472-1-ikjn@chromium.org>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_025426_916397_9238C468 
X-CRM114-Status: GOOD (  10.30  )
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

This patchset adds 36bit dma address and power management
supports for mt8192-nor.

Changes in v3:
- Fix a bugfix of v2 in checking spi memory operation.
- split read_dma function into two (normal/bounce)
- Support 7bytes generic spi xfer

Changes in v2:
- Add power management support
- Fix bugs in checking spi memory operation.
- use dma_alloc_coherent for allocating bounce buffer
- code cleanups

Ikjoon Jang (6):
  dt-bindings: spi: add mt8192-nor compatible string
  spi: spi-mtk-nor: fix mishandled logics in checking SPI memory
    operation
  spi: spi-mtk-nor: support 7 bytes transfer of generic spi
  spi: spi-mtk-nor: use dma_alloc_coherent() for bounce buffer
  spi: spi-mtk-nor: support 36bit dma addressing
  spi: spi-mtk-nor: Add power management support

 .../bindings/spi/mediatek,spi-mtk-nor.yaml    |   1 +
 drivers/spi/spi-mtk-nor.c                     | 333 ++++++++++++------
 2 files changed, 230 insertions(+), 104 deletions(-)

-- 
2.28.0.681.g6f77f65b4e-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
