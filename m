Return-Path: <SRS0=p/XJ=EW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C19DBC63697
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:26:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4130520715
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Nov 2020 08:26:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Cg6MN59";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="S7uDoqrv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4130520715
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bVNoy5G8V3mKPYPQaGnWcSS1PapotU+koUbA/jG0lbI=; b=0Cg6MN59X16E4UBsUfIO5WwYhC
	9e8tk+0JAFcPVRPREr/jcfm6gvkXf2hDdUXjcZ1E33AtwU6c//vmeVMCK609jJ8t/Jh6dNqs88rwN
	GMpdrZbQt8nj1UkPQ5anQ4I8UGXf9XWps57G+FatpYhqnd6kqBYIvKRGPqgyOAoCZ8O3YhCaOvoDU
	0onTnB/S5S+PycVOkXSjLPjrWY9IYo3kJPZnkPJVTHMODgXLdBvNBI+pC/SKBYSqScSQRbYsi4jt/
	fm/sZD/FCtwbSnd1PdapVU/dLSAuGAHyF3LaIGFY3FOcMK7iK5OFpt7D8+rXQPV6kaMvIRYT19F/N
	A7hqHKyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keZq5-0007OJ-Qp; Mon, 16 Nov 2020 08:26:17 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keZpx-0007Lm-3L
 for linux-mediatek@lists.infradead.org; Mon, 16 Nov 2020 08:26:12 +0000
Received: by mail-pg1-x549.google.com with SMTP id f19so11099186pgm.4
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Nov 2020 00:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=ieHGkGRGyMdjgkXkpWPtxPSWBoXQa69qr+BlvKJmlkI=;
 b=S7uDoqrvoR2gVxti30a+oVyBmIvj/UvS+hOdo5wM9+0Q6usbayIkL/GyvZ5Qbbm0OT
 ahRTVk8S7mANO8ygQTdb6lOmKMmBOK/pmsW2Zb9vqssmgfNEuetYxDfxN7RRsz0IdL7i
 21yFE6lUhr5wjjmKJ700J8rDjd4EUmqTY9ncWvUn1G+zZadSrMZOQfYmba9ty+Xamo+x
 R/5yzRBzyXZFYwpejKG52vjBtjZqhKE0TWnan4x9E30+9uZpkW3h4GMrg11V2wJEU/mc
 BsCL3WqY14OTlFNbsanLBsMKJfL4NHXjFp4J0ZGSEIOBuROaepHVIYQUvrRV1cP9x9W9
 eAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=ieHGkGRGyMdjgkXkpWPtxPSWBoXQa69qr+BlvKJmlkI=;
 b=MBd4IsEsIJsWDzohmU0aWBKK6RSPTRLQx9dF4mQJCnF2jMFrRVlv80WdV88epEKlLk
 ArKMiFWoSaTyl3CVzXhYA/hr6RuTSVxvYlEwNJ2OXbWZK3QaBf0H9q3h6JfdfEE9fckc
 CXdZgnUpRzd1lyorfYsX17oyxKbdkuowjMLQplX8SKM/Epb+8sGDRF+Uy1w1xJEnnLHC
 VVwATuDdAq6NMET9vqMuJtGcI26AvGyTrx1+A91q2cNcswn9ocPjglEWIL/+Hg3doRy3
 ur4OXpgWJpkpyEAIRX/818PQNV23XtIVo22QtkDuDAB61gZAxKAbvQrDwysEPC5rID3N
 HZDg==
X-Gm-Message-State: AOAM530WKz9jhMaJwpYofQAgCkJAN/r0M/1XsnmU9Z/HZPpci0KhtOhi
 rSg1ysOYFOsTtMaLXG/hQTaE6mwuj8se
X-Google-Smtp-Source: ABdhPJw4PjfyU2KX+9OP/xtXaBN0zBFbu0Nb3Lxto3kM6HwtJJoC0wB9RtMBLKlJvbnRyutigI4ka8AQcEHY
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a17:902:aa83:b029:d8:c97d:9c2e with SMTP
 id d3-20020a170902aa83b02900d8c97d9c2emr12698410plr.44.1605515164929; Mon, 16
 Nov 2020 00:26:04 -0800 (PST)
Date: Mon, 16 Nov 2020 16:25:35 +0800
Message-Id: <20201116082537.3287009-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH v2 0/2] remoteproc/mediatek: fix sparse errors
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_032609_150780_1BF4682A 
X-CRM114-Status: UNSURE (   7.79  )
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
Cc: drinkcat@chromium.org, tzungbi@google.com, linux-remoteproc@vger.kernel.org,
 groeck@chromium.org, linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Changes from v1:
(https://patchwork.kernel.org/project/linux-arm-kernel/patch/20201116044121.2457272-1-tzungbi@google.com/)
- separate into 2 patches
- provide the line numbers in commit messages

The series bases on https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/log/?h=for-next

Tzung-Bi Shih (2):
  remoteproc/mediatek: fix sparse errors on sram power on and off
  remoteproc/mediatek: fix sparse errors on dma_alloc and dma_free

 drivers/remoteproc/mtk_common.h | 2 +-
 drivers/remoteproc/mtk_scp.c    | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.29.2.299.gdc1121823c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
