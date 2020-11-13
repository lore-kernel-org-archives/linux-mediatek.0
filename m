Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68774C4742C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 07:02:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5C3120B80
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 07:02:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="olzR4ONS";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="Fgm+y0VD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5C3120B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GG8/xmPFUgLbeRpFqOT35aItIeUl9mHfwXXGd+SrXBM=; b=olzR4ONS2QHh1YFDHGzMSAYbh
	3infgAnmxmd5y5IwDIiCiKwYLRS8ivtsmh1Azr+JaewjO6rgeVGhgU/V8gJSuixUNSemyXXqG47n2
	DQ0dt0tQHbgMXpFukIimmTkwFJeaHu+RvvTH9Dao9fQ06ufDy0LsLf18/jsNxIpvsvfCmkVe7X1SH
	JlN/x4kloTL4W7lCGtr4ie8OI9GAd3rMdcMnn202GpnGR7ZiTr3C3AlSzFTfdLbeVaf0QKVAGXqVA
	iOXzlPMoMLl8uvLnqe9AuNp0frXvE2PysxysKZHA2YoKfsnoDOeZJecteNf5WapLo2+p4WIVDMSQU
	ROm2GTNUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdT6J-000214-4Z; Fri, 13 Nov 2020 07:02:27 +0000
Received: from mail-qv1-xf49.google.com ([2607:f8b0:4864:20::f49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdT6G-0001zd-8n
 for linux-mediatek@lists.infradead.org; Fri, 13 Nov 2020 07:02:25 +0000
Received: by mail-qv1-xf49.google.com with SMTP id m11so5003619qvu.6
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2020 23:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=j5FOq3cPnWx/ENlFWQJtCdT3iUWxaQSgARSmLQ/sveE=;
 b=Fgm+y0VDBaeJl/93SSK4CkaNMA6QyIKahE2AcZJ1HXnZvwJtDFGUkNd6vJCgbvvfim
 eTsss/fi86Tru4W4xfM+EIRy8o2NSgC8IIqnIb1sqQQl4Ilbsl3qnTztXnhT8ftAGfn0
 H08qp1Sczclyd85gDGA++xeTo0K1Ywq2quqvwVe8Be2ExaMNtwq9QPa48gPgwYz0huwk
 aiDlllSUNgpuIsOZNW+pZKiKKwgzn3UX3ebhIhk+D1OLezmA51eITU8PRiXwNy+FeGJx
 TROnFAU/UTApCIFvMJ0IW1qOAUfyl5emoQHIm5k3IaBHgwgtVngI4ns+7fRV3Vb4NI17
 /BfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=j5FOq3cPnWx/ENlFWQJtCdT3iUWxaQSgARSmLQ/sveE=;
 b=qdBnEhWdL5qNa63pFidRWMuRNvzmbY2QhZKhvMBwmF/58sQxl8/tJ9NrdM8e2CVy/q
 lVvYWanhx7j7uF0nGCA0xiQgsGErbbvKB2No7ttWBQ6oKbbYhtfDiLDLQmFexVPMZUIV
 wcy61n18nDVJQMcMAvLrF++IOXcI5OmpDPthZvYfqV39IsZJMQlmtzL0dP6zb31n1N0T
 zHS9LAPJr3eN8X8MIZ9KYBMN+DlIrFdsAMMJGoTCl5K6qfSURXMSzVfha/wyeNHvPxrP
 MkWnBkYuKVNG53dm1De4C3WetCmMPZCEDz9A3/OXkcN+0vWq8wFbKbCo5MtTO6+LMU6v
 W+bA==
X-Gm-Message-State: AOAM532KCb0ULZub/h0Avcnhs+Na2Zr7Mrp4hTvXGTDN0cvogeeE/C1M
 rXExaQmwalQ3Ek16ndqf0FzbTLz1gY2V
X-Google-Smtp-Source: ABdhPJy9eyFdefDqQi/665Hf0+8tbnO1qV+pedR+tnbIbh/u/9XgvyubpCvZ5r8O0m68VORkzGMOkKJ94m/t
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:ad4:5483:: with SMTP id
 q3mr1020720qvy.24.1605250940904; Thu, 12 Nov 2020 23:02:20 -0800 (PST)
Date: Fri, 13 Nov 2020 15:02:05 +0800
In-Reply-To: <20201113070207.836613-1-tzungbi@google.com>
Message-Id: <20201113070207.836613-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20201113070207.836613-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH 1/3] remoteproc/mediatek: fix boundary check
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_020224_370457_D68C1685 
X-CRM114-Status: GOOD (  11.59  )
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

It is valid if offset+length == sram_size.

For example, sram_size=100, offset=99, length=1.  Accessing offset 99
with length 1 is valid.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index 577cbd5d421e..7ba00305009a 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -408,11 +408,11 @@ static void *scp_da_to_va(struct rproc *rproc, u64 da, size_t len)
 
 	if (da < scp->sram_size) {
 		offset = da;
-		if (offset >= 0 && (offset + len) < scp->sram_size)
+		if (offset >= 0 && (offset + len) <= scp->sram_size)
 			return (void __force *)scp->sram_base + offset;
 	} else if (scp->dram_size) {
 		offset = da - scp->dma_addr;
-		if (offset >= 0 && (offset + len) < scp->dram_size)
+		if (offset >= 0 && (offset + len) <= scp->dram_size)
 			return (void __force *)scp->cpu_addr + offset;
 	}
 
-- 
2.29.2.299.gdc1121823c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
