Return-Path: <SRS0=EHBe=FS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04521C4361B
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 05:11:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F64C22472
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Dec 2020 05:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F64C22472
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LXU0QcPVEyEt4U3OoCs5S34HzdA2D9Q6JujCiZBlo2Y=; b=FKMY9FCUUvcANrJVWls5/CphD1
	de63JglZSN+2JIM30qnGUs3N5/QNmIMq1nBLRYFC4T98qExTmkyUXOh5eecmgF8fBAI9z3nsHdpqx
	tw7zuTFRaYvZorMXJcxaJNIyhu2PHfxEMoOj7H7ccoA03yIiN6apbJBZ6nAqFTEorAYeHA9yang/D
	JiBicPcn1RLj1xdDqr9teJmuitm0BLs77xh2P7UHe3nX90pq0mpUIR+LieUCO4GaXIZmXjKTmc18u
	CcGt1YNnGBsH+8BFptUUyMoWqVZ4ZbCIc4QouB4hAL35FF0yELMWpy6qDPSwpBgr9svwuzLBzQGa8
	uH0TuvPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kog8e-00041C-Uq; Mon, 14 Dec 2020 05:11:13 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kog8c-00040V-7J
 for linux-mediatek@lists.infradead.org; Mon, 14 Dec 2020 05:11:11 +0000
Received: by mail-yb1-xb49.google.com with SMTP id t187so17419623ybf.10
 for <linux-mediatek@lists.infradead.org>; Sun, 13 Dec 2020 21:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=fgDcU1+oW2fdsmRYSzA1iVZIhvNfGHQmRRDgjGCVILY=;
 b=FSUxYP1MqGPvbTcmRAbdlr1QlCR3wVcjs0XvfBgYfJnjiAp/nm2d4PYU+9/Kfkmxcb
 bd6mQWPPOJ6sn4wlk0+9eQl9jNb+a5iCHySTv8dQy+6y9KZC8YLoi8ZzPMi0o10tsfY+
 QWu7XNiOsufywy7Y4edFNElO8q2w5aNnX1+b0EeSQww/ypEQV4x5OUIgS8OMlr5N1SeN
 IND0dcxvwMuz0mcuFFsfTGApyQdVLx6B0G21/ag2opRZZmF0LZm8jGGkeIbLFo2JOQvI
 X7XWT+fHz/HqzwQrhwAWgm7/VfX8qnDC031Z0ONimpTmHYyvHgYihCH0Sy9Uv/nv7h8A
 B1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=fgDcU1+oW2fdsmRYSzA1iVZIhvNfGHQmRRDgjGCVILY=;
 b=YLP084S/c2NiRMgDHwSMMdMzcxEGX561SLrLVOFmSZgPs1eB/L7Q5Ikhi4/r5ESwYe
 einQ7FGeI1rrJ62sz+TMid0/a+uwbyQvgDvfxhB2glN+G+6XmYFTL86v/A6Byb2ezYLk
 WdH5AzutBIBpBGMHbu2xTpSOgVV7hK/AZFX3CBOYZcmBrA2Vpu2Ah2PsWEiUTduk8sr6
 YyFXwrmWBMkUeoTnrUBU03BGvDDWvzUcZuLyrsPLAaaTUw3WFgcnDP6LdLyZyPpMohmC
 UWr/YC75hgQhBSsPEuImXtGt5yRIuBSBqWrywBR9zdU/DBZpYJGLLVGlB/JIE7gGBqRV
 WKSQ==
X-Gm-Message-State: AOAM531leFMuDyTAnmrkQxUNiHsGXHqg4hnk9/h7LKVjb3Wq60H8PtBS
 ofGC3XbHDaKym9EsfEj6ZKc3WqKkmUWr
X-Google-Smtp-Source: ABdhPJzrnWMwRRK57Q5VAbPJn0pCX1fnZeJ9HQg3zGBuhiUBKMRNDFguMlUZZwjTydDnOzvzLGAv5hLAYEFL
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:f20a:: with SMTP id
 i10mr33399723ybe.37.1607922664156; Sun, 13 Dec 2020 21:11:04 -0800 (PST)
Date: Mon, 14 Dec 2020 13:10:47 +0800
Message-Id: <20201214051047.859110-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.684.gfbc64c5ab5-goog
Subject: [PATCH] remoteproc/mediatek: enable MPU for all memory regions in
 MT8192 SCP
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201214_001110_301686_AB8B4140 
X-CRM114-Status: GOOD (  10.81  )
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
Cc: matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
 linux-remoteproc@vger.kernel.org, tzungbi@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Enables MPU for all memory regions in MT8192 SCP.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_common.h | 1 +
 drivers/remoteproc/mtk_scp.c    | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index 94bc54b224ee..5f7cd2336cef 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -47,6 +47,7 @@
 
 #define MT8192_CORE0_SW_RSTN_CLR	0x10000
 #define MT8192_CORE0_SW_RSTN_SET	0x10004
+#define MT8192_CORE0_MEM_ATT_PREDEF	0x10008
 #define MT8192_CORE0_WDT_CFG		0x10034
 
 #define SCP_FW_VER_LEN			32
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index f025aba67abc..130c0b9511df 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -369,6 +369,9 @@ static int mt8192_scp_before_load(struct mtk_scp *scp)
 	mt8192_power_on_sram(scp->reg_base + MT8192_L1TCM_SRAM_PDN);
 	mt8192_power_on_sram(scp->reg_base + MT8192_CPU0_SRAM_PD);
 
+	/* enable MPU for all memory regions */
+	writel(0xff, scp->reg_base + MT8192_CORE0_MEM_ATT_PREDEF);
+
 	return 0;
 }
 
-- 
2.29.2.684.gfbc64c5ab5-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
