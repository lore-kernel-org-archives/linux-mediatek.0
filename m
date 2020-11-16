Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9386BC55ABD
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:45:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ACB9208C7
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:45:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FxBDdil+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="GXgOGre7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ACB9208C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+UnXXhqYMBun1M5vaLD8va0s5kQt7jhNkwv22TN9dcg=; b=FxBDdil+QSGgpA2tgleJ0xf7A
	kddbxz71GEJNiOt0v3tdlrosxsNrX6sqGm68hwChG8r0VXhG1uBd47mvMB9BrJfiDDVCqsqL6YplV
	W0Bec+56Ep/DmGgeIuGTcdy2QKkkIhL9KREHu19ec1/O1QHLtxzyFN04OY3KPsBbKATKiT7aQaqOv
	r/xXIL3F3iFtnfJ4u7CSFveHmEdQE324WP1teM3KGKovvyp6i/NcvJM/fJdgQyhP5HtVcFKHhVdpl
	soju82Zr6lS7OrkFjkgbPqDcDk68wD+PKIhn/pNyUOU5Owc6rRX9rqlIb6FSwKRVpuwSNiCNW4Qib
	AsQLervfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kea87-000473-I6; Mon, 16 Nov 2020 08:44:55 +0000
Received: from mail-qt1-x84a.google.com ([2607:f8b0:4864:20::84a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kea7q-000406-Pj
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 08:44:40 +0000
Received: by mail-qt1-x84a.google.com with SMTP id o1so9682544qtp.7
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 00:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=U1SYL24RcTv9N7iT3p8Gk3jg0reoXyBjPpMVxH+Yb2c=;
 b=GXgOGre7Vz7fMb34bNE5Fnr0Fuz4xu004X0MvPHy3/ZVL+bYlIvBjrV+j3YFiM1CTK
 mJkoYwcw3HaG/wFWu+8a8eNgFdyZ+lugSDUKxpy2+KE2NszFF0T4QCsaW2mRSU0o1cr0
 L4JjnBcgjutYdsDlHwx8ar2SgdZzcFlAMC8payn3TF3SmxFFyMHRpVKYKwva/yq8awSr
 wVcZ3GEscUwsETAU+tAXkq1+65Jv1of7kB0ZGMYWCVf5FwPvBffxwIrF+WOJpVYS0v3R
 7yr57qXUpXc/ywOqBLbco3E3QgGAYb4X9rQf2/4JaE+1hQFmMa8LP0vowZgbRmzD8ypy
 08bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=U1SYL24RcTv9N7iT3p8Gk3jg0reoXyBjPpMVxH+Yb2c=;
 b=owD6939fI8k0l72s+QXt0mIoYh3k5Q5YfY4NKEuTHOtNLh11Le/1uPtM4AwkKOYn+c
 rehpwkTbPjZ+/cRbSVA9b25sxrIVL2o7OqWf/bFWG46V+ucZuUsk0EY7OFztqSuj3x57
 553R/UNJZyU8Du1oqb3J/lsM7VXnBkXEc49gk8+mm4PKQZoeY5Z2QdoOI8OoShsqEbu/
 0EsqFvwxQMldFDAHIfTQQyNsjfi315UMEoS6lijj516lVnLb+wVwy8twgG2iWZ0eClXH
 1eis31xvUPO6BmmuA4jP7EEFY11ogFrBu757xsxv9sJFO/TuVgFylKVqWhYk8v6FM7oY
 acuw==
X-Gm-Message-State: AOAM5323ObjDv5VbBRni+hnu1FtWMafjP9o3fiHiebXdmKbp4joxxYHv
 azxa23GTppVWQj6iCOdhnLWerktH8CZI
X-Google-Smtp-Source: ABdhPJzhbiY6OL3SEP4f5SvcBbQqzn20Wueip3Hg4YPjnhhPTZC1kw4E3QbluKfoOYm2U9VaaZ7MgAacn1oH
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:a8c4:: with SMTP id
 h4mr404502qvc.58.1605516275666; Mon, 16 Nov 2020 00:44:35 -0800 (PST)
Date: Mon, 16 Nov 2020 16:44:11 +0800
In-Reply-To: <20201116084413.3312631-1-tzungbi@google.com>
Message-Id: <20201116084413.3312631-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20201116084413.3312631-1-tzungbi@google.com>
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 1/3] remoteproc/mediatek: fix boundary check
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_034438_890815_605A2D10 
X-CRM114-Status: GOOD (  12.07  )
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
index a1e23b5f19b9..0abbeb62cf43 100644
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
 			return scp->cpu_addr + offset;
 	}
 
-- 
2.29.2.299.gdc1121823c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
