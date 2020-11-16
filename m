Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66982C63697
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:45:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01B5E208C7
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:45:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qaL8YGt3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="kehch9xJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01B5E208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lojfOox/PtCbi3abADrHKuVxlNpy7yGCZUymbAqZqTo=; b=qaL8YGt3goczhk/8aW+jF2dnX
	CD51+ya5ae2+6XodCHiyNHWzYHst1120nLB4aL8fqnWG9BOQbfz9fRKJnXKgcjlEG81uYgJPzaSDH
	dtH3lp3r16d85SBBElB3NPjFIXcnrllK5WMVm8A8CbAK9MLwizMyxXiQXF4dQLi7usw0DZWcdmBw9
	8I1RBMOlUaVj3rIdLacWti36VwWNRYzMl2eKPtJbvUJ77jldDYDxT6dubTsJ/LFU1FbZJIl+6atCe
	BUQPFTvTnBI95Hw8M5YHmd/Zf0eyblVPydNbLNCt97idt+Y79UZ0hTaLkb5i5e2cGQbzHEJC94jLc
	/b0Svt/2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kea8H-0004Aa-JX; Mon, 16 Nov 2020 08:45:05 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kea7x-00041f-1u
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 08:44:46 +0000
Received: by mail-pl1-x64a.google.com with SMTP id f3so6165691plb.11
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 00:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=U3Gi1qahwlJP98+q+DzLZd9zkdZHDpsmepdISgH+9NE=;
 b=kehch9xJroI7LjWkkrpaK2y/pA8zVVNmlv6bS9Hbia0MVnrY0lfoB8heEZAxrT4eQq
 fqe9MOaa7/zAwhOHo+YXMJR5NKRvjqcmt5RB+q7UMvH19i1c4vR4w+S5FAVQugwZRgeN
 oODQ4xY8Xf0tbfWP08c2BW/dkJzdrkSJwhd91t+4DTd494czrp0MNGsUV940AjKk4FIF
 0HuTUm9j5cKpr1eghbwhADpRLMY7r1JHk469OR3d5F7XJQb5YIApr8NFeNLukci6Jz9l
 MdR2MBIPLn629hut04JnPig15lPf9BOIL6yaC/vjblJddFywFtcVD8he0amkWpjrkDyl
 XyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=U3Gi1qahwlJP98+q+DzLZd9zkdZHDpsmepdISgH+9NE=;
 b=uPu9Ag8DRj2Ue/eDxmHC8k4ZlADDaz6/76aVX9KmWoUblnYlbcJDto/4+ZVI7/mBq+
 x543vXiQOcRNAL51AP7kkmvGkfNO+b2pxKynhssYUwk54Nac0yC08XUuJ1axh/RvBUjI
 7ZtO7vNkycggyvkHvK8AKR8/M+rVyQEnk4EBuwgVmv731nlNZQjNrg7iR3sQddhDnY3j
 6eD60auWLNOVhkazlYk+S/STXJH1Y6jmI/YTa6gZxWiK7h+Qx2OIQE1VDHXNYrik+TZY
 NVWk1ALvMVgbdI5oA0KFGR6xy8XJH4RWBzYiP5x+qZ4C2eal2tE/ZPzL9zpp5Mx46usy
 g4Sg==
X-Gm-Message-State: AOAM5330j64BTHQvkch2f78Wa0pRbu6IrS7XlJJ55ItdNGd86Fm64k51
 NVxqujw6dEQfkeQs1P9MdMnOTeRVcM9m
X-Google-Smtp-Source: ABdhPJxg+Z8Zu9B3dSqceVno3+Brgq9ObO149i6jMRBUlUkXml8qKyHkCmVunSfSYifJf7XSVOpNenMRFqPo
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:902:a503:b029:d8:e685:3e58 with SMTP
 id s3-20020a170902a503b02900d8e6853e58mr5843637plq.68.1605516279549; Mon, 16
 Nov 2020 00:44:39 -0800 (PST)
Date: Mon, 16 Nov 2020 16:44:12 +0800
In-Reply-To: <20201116084413.3312631-1-tzungbi@google.com>
Message-Id: <20201116084413.3312631-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20201116084413.3312631-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 2/3] remoteproc/mediatek: skip if filesz is 0
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_034445_205049_1AE9190C 
X-CRM114-Status: GOOD (  13.49  )
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
Cc: linux-remoteproc@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The main purpose of the loop is to load the memory to the SCP SRAM.
If filesz is 0, can go to next program header directly.

We don't need to try to validate the FW binary for those filesz==0
segments.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 0abbeb62cf43..74ed675f61a6 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -234,12 +234,14 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		u32 offset = phdr->p_offset;
 		void __iomem *ptr;
 
-		if (phdr->p_type != PT_LOAD)
-			continue;
-
 		dev_dbg(dev, "phdr: type %d da 0x%x memsz 0x%x filesz 0x%x\n",
 			phdr->p_type, da, memsz, filesz);
 
+		if (phdr->p_type != PT_LOAD)
+			continue;
+		if (!filesz)
+			continue;
+
 		if (filesz > memsz) {
 			dev_err(dev, "bad phdr filesz 0x%x memsz 0x%x\n",
 				filesz, memsz);
@@ -263,9 +265,7 @@ static int scp_elf_load_segments(struct rproc *rproc, const struct firmware *fw)
 		}
 
 		/* put the segment where the remote processor expects it */
-		if (phdr->p_filesz)
-			scp_memcpy_aligned(ptr, elf_data + phdr->p_offset,
-					   filesz);
+		scp_memcpy_aligned(ptr, elf_data + phdr->p_offset, filesz);
 	}
 
 	return ret;
-- 
2.29.2.299.gdc1121823c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
