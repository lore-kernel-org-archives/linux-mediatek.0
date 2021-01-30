Return-Path: <SRS0=EsFa=HB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33BF4C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 03:45:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98EE164E23
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Jan 2021 03:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98EE164E23
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RbItGlMbpetFRQnnXa2NhPOIQz1GbuzVKqwLan+ph0s=; b=FpQ8fPwpAf7cK6nocOdLrf7+9e
	6bu2VHPVJ3ByhaIR7lAMk4xH4PI+F2eRbWL/Nc/FpACsbUtvzhpTrDfvIpFUL5cBFDUyeQ7jfydzJ
	9DD+fszfmVCHD6KbysaPMAvIBQ9qs6wN7a1XfnOGuboD492HDXXA4G0aANEcu4/3qN0Euhj4bpi/C
	8Xb7F2355aIC6fTXOEBlA0ZKDvikmRicKZOWSfFCMJbMEgLTzJ7mp0gBZlBbsmpXP6h+hiSLKMJDo
	cUsZQwJG4xXWkrK5+/A/rJvtbRDcWHdsCZgLAGNXBEAPwxcOeF/oqh0RMokk6qCSV2boUIytOPi/d
	aehberIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5hCg-0002Vj-V4; Sat, 30 Jan 2021 03:45:43 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5hCe-0002VJ-QQ
 for linux-mediatek@lists.infradead.org; Sat, 30 Jan 2021 03:45:41 +0000
Received: by mail-pj1-x102b.google.com with SMTP id my11so7266147pjb.1
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Jan 2021 19:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RLVEqQslVYjHN6/GcJQt+a0YkZ+s/rJ3wnnBKP9zCJs=;
 b=aVcISZ6U1WUb/MBfsNoMjDe01a+7Ze7PsO/fiIIYYp3q/anDbe/RPR9lp5PskAEJmn
 fQgG134PgkcMHy++VGVO6SYsJ3lzG5x9nPfxJBfqJWbdZ3MhUOrT+GKlUNqTzkPIzKIC
 0jLdDiBHmaPrhOSEhZwgUNcWNgoWQN/ce795lXEzMiZDX765sYzLZYscadXrdVTRfM6M
 +Wa0cmtJp9P06WMXrBN19wRJk5EawW4r/0ka9mklLHJ7P43kZjga/43NHEggOKESzq40
 oVFa5Zc46StXRtilvrEy/mqC6GKM9B3Y9P2svdjfrYyXC/GstmPPTlyFqsfHurvqaPj9
 dMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RLVEqQslVYjHN6/GcJQt+a0YkZ+s/rJ3wnnBKP9zCJs=;
 b=VxEOSHWAKwFungXTD+bFEJGWWTQw3nPP9kmNL8z8ufd3zLxWjOirx4c5Z0ptfcWU9E
 axNQBtyWeJAb3xTkAC/B2WYs2ujywrQmGuQuKtPMRcALAn7KKzl5gm3KKxjeADUixNkD
 Va+nL8zQPDC+VHdtOIiR4oFBeZEZLEr8+uEcr/Ykffq+FcIrmP/dy+sHtT9twi3eOa7E
 OTr08mxYPaoLJaJMvkt5FamFtLhyX4Vmb4S26RjjLTF8N0jTBEoLwbe3V72Zjt5NimJR
 pDpUmYhBkBhF5eVJ8Y9zhBjmGomjs12kSG5u0e1Xqfesd49otWhT7qZAJAzLj6v7OfkH
 Th6w==
X-Gm-Message-State: AOAM532tx9QclI1hikdA4hp9g5KWlNhJ4vRn+uBpalp76Nr9d6LYn6w/
 7uwlXGveN5c9inTPNLZiDyg=
X-Google-Smtp-Source: ABdhPJy7dxNEh/s8aLVTOojEvzmD8hAb6UsK5wfhGDgHoKui+q3X1jaYRBCJTzk61S/biGE6vwofIA==
X-Received: by 2002:a17:90b:8d1:: with SMTP id
 ds17mr7259357pjb.194.1611978338548; 
 Fri, 29 Jan 2021 19:45:38 -0800 (PST)
Received: from z640-arch.lan ([2602:61:7388:8f00::678])
 by smtp.gmail.com with ESMTPSA id b26sm10265928pfo.202.2021.01.29.19.45.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 19:45:37 -0800 (PST)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] staging/mt7621-dma: mtk-hsdma.c->hsdma-mt7621.c
Date: Fri, 29 Jan 2021 19:45:07 -0800
Message-Id: <20210130034507.2115280-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_224540_953533_E7AEE257 
X-CRM114-Status: GOOD (  12.22  )
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
Cc: devel@driverdev.osuosl.org, Masahiro Yamada <masahiroy@kernel.org>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Also use KBUILD_MODNAME for module name.

This driver is only used by RALINK MIPS MT7621 SoCs. Tested by building
against that target using OpenWrt with Linux 5.10.10.

Fixes the following error:
error: the following would cause module name conflict:
  drivers/dma/mediatek/mtk-hsdma.ko
  drivers/staging/mt7621-dma/mtk-hsdma.ko

Cc: stable@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/staging/mt7621-dma/Makefile                        | 2 +-
 drivers/staging/mt7621-dma/{mtk-hsdma.c => hsdma-mt7621.c} | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename drivers/staging/mt7621-dma/{mtk-hsdma.c => hsdma-mt7621.c} (99%)

diff --git a/drivers/staging/mt7621-dma/Makefile b/drivers/staging/mt7621-dma/Makefile
index 66da1bf10c32..23256d1286f3 100644
--- a/drivers/staging/mt7621-dma/Makefile
+++ b/drivers/staging/mt7621-dma/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-obj-$(CONFIG_MTK_HSDMA) += mtk-hsdma.o
+obj-$(CONFIG_MTK_HSDMA) += hsdma-mt7621.o
 
 ccflags-y += -I$(srctree)/drivers/dma
diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/hsdma-mt7621.c
similarity index 99%
rename from drivers/staging/mt7621-dma/mtk-hsdma.c
rename to drivers/staging/mt7621-dma/hsdma-mt7621.c
index bc4bb4374313..b0ed935de7ac 100644
--- a/drivers/staging/mt7621-dma/mtk-hsdma.c
+++ b/drivers/staging/mt7621-dma/hsdma-mt7621.c
@@ -749,7 +749,7 @@ static struct platform_driver mtk_hsdma_driver = {
 	.probe = mtk_hsdma_probe,
 	.remove = mtk_hsdma_remove,
 	.driver = {
-		.name = "hsdma-mt7621",
+		.name = KBUILD_MODNAME,
 		.of_match_table = mtk_hsdma_of_match,
 	},
 };
-- 
2.30.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
