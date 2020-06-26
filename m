Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0049AC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 10:52:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA2D3206DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 10:52:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yrLHuBKU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RHg9Dgp1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA2D3206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RiCPARPMZRHnCnJNDR0HR+6ESdA9KuDg2ysGISUQpRM=; b=yrLHuBKUKBtVCz+BY6vYiTGIu
	NwfvS3Jb86bKDSf1vdZQTX2tG2c6eORRe1LhRd1kELfcRvj/O5IgbJsGNb8NVtLbbigJc1r2863xx
	wfweopNgt8+QfQGTc+0NQ2Z2EQEqe9w/0ZnwGW2mKgcbvqsNTNLngpmNHZptDvZggM65N+qblCHJw
	7tpYGNZcQ5gn7IE9HZnelMhkG2f+jAti60/62+tPa4fHbZygegdm6o4U2rQYXQFdoAiZANWR2jE39
	cFSrbZ657/TXaHFnf6Ixds0IVcGDkfqTQu6iKpm5Nzem2XW0Hkq97lIjN5g7ccVLYLVZtZBz87WpN
	ZehcBYQ6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jolxr-0006Lc-Lt; Fri, 26 Jun 2020 10:52:11 +0000
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jojk6-00027j-Bs
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 08:30:13 +0000
Received: by mail-io1-xd41.google.com with SMTP id k23so8892664iom.10
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2020 01:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nNwEzWipSSz2vd4pkUc1DMaHvpQvQj+NbszKHo/2YLs=;
 b=RHg9Dgp1ggVhlqYSJDRUT2dau1OUPfz/FXjf2pt27uOy/W6ONc7WnGbc/0XGJbOcyd
 SWY/owF6lII0qNEXDIqNVkda5D09wHn8vUWjUc/O1NKTb94LaeBEbqyr4NzLubmAkK5V
 1n7jgw+DidjDUHHAZFLU21HT2TII00JvGgS8E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nNwEzWipSSz2vd4pkUc1DMaHvpQvQj+NbszKHo/2YLs=;
 b=QkutOye0OGqFTJZaxxvdfITQ69cI2ULhdA06hhmShPYzCNRtOXI0oPpZRZNuQTxec+
 LzuWvQ5E3rAOrAgYzxhFY6nDiQrdZwKjFebPWf9tkz0s2L2YN28RDmEcS4+y+AYBMtgN
 3tZA4SKgqd2wFn4j8Bm33/PtJCi7JYsYQSDclyTI1699oZ7IDeiYwSFZ21M1eUt0bYwR
 bGaQiCAAifZnU8kpe0bvSekEpfL+9WBBi3Ayoi3eqs7FsryOpjiftnHKwzTAlfrBVdZg
 lvhpm8PzzHo8zltsC5DXY/BE8f9MmKOuIApxT/ZxhN1vNBKHNixqlyiwUBHRWWulSj4n
 5pig==
X-Gm-Message-State: AOAM53391Bn/Hs+qWpwU29fwyoYiYnhdm00Ql3lYsVnp71WybIl5ZFhe
 dmVLz6iA/qdT7e1gYwUmLfjWHMXt5PYpUA==
X-Google-Smtp-Source: ABdhPJxVxy+TcRiUnQ2Y6bbJtc+2IY2rhhdtmkNKrhVuoI5PJYt+s5qOfWmaSqZKimV2x8zZ4qzRhA==
X-Received: by 2002:a65:46c9:: with SMTP id n9mr1608943pgr.89.1593158756043;
 Fri, 26 Jun 2020 01:05:56 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 01:05:55 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v2 08/18] media: dt-bindings: mtk-vcodec: specify SCP node
Date: Fri, 26 Jun 2020 17:04:32 +0900
Message-Id: <20200626080442.292309-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
MIME-Version: 1.0
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The mediatek codecs can use either the VPU or the SCP as their interface
to firmware. Reflect this in the DT bindings.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index b6b5dde6abd8..7aef0a4fe207 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -19,7 +19,9 @@ Required properties:
 - iommus : should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
-- mediatek,vpu : the node of video processor unit
+One of the two following nodes:
+- mediatek,vpu : the node of the video processor unit, if using VPU.
+- mediatek,scp : the noode of the SCP unit, if using SCP.
 
 
 Example:
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
