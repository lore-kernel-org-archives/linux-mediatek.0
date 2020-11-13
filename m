Return-Path: <SRS0=9UGu=ET=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07DDCC4742C
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 07:02:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A29120B80
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2020 07:02:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SGlC3qVW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="XVooYVhL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A29120B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Mime-Version:Message-Id:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lK9mH950EX/p46+mnb1Lj4BOAlGk5Sk2eSTlU57rges=; b=SGlC3qVWvW/i4zjftAf9qj1DS9
	4nbWTUbdqHJb4m+ClgcEaZOF44gRg+ZVYJ7JTZzB0sqJnjjC7eOGKYq/Bos7RfPGLHWg4dqy6A5QZ
	nJNsze+49nChgKFVSbMTSwouOog0BxTnlxqGmSVxIS2ltRrFVMOeP6mC7nKqqr57a3I/y49I6XUHf
	2Vs0Lbh9yeKSjm8RDTSk/0GtVLvCk5ld2UKcoMV9mtMFc0HCiH9sBoOFNv57giju7E1+SHnOdH9hw
	ZlTF/7Hdo8aU2GXHIIaKqFAINiedWoTWJB6OMGwwSpY6hII3YyjvkpeUHIJJ/3buwzsS4mb3aHsbE
	xOTYk0pQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kdT6G-00020Y-Pi; Fri, 13 Nov 2020 07:02:24 +0000
Received: from mail-qk1-x74a.google.com ([2607:f8b0:4864:20::74a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kdT6E-0001zU-NG
 for linux-mediatek@lists.infradead.org; Fri, 13 Nov 2020 07:02:23 +0000
Received: by mail-qk1-x74a.google.com with SMTP id h23so6065437qka.8
 for <linux-mediatek@lists.infradead.org>; Thu, 12 Nov 2020 23:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=XMlqZ1InvxrZfrALPvBsxmrkxcxs/WzrYWfmoOXV5oQ=;
 b=XVooYVhLDc0Sxh+voEL4RI0ViDpiw3LQnqfijn6fkLxThdB9A6vVzVQcRsZqpDUyFM
 dnHB62ASfXZ8pUMj3/GbzQ+YLLKrGdcC3YFBzYxDX3mSqRew6CdnS/uT44zz1B9F5Vgb
 w4+pMDHs8L6/mnHsOjeopUVHtLkeS/CfTrzmKfFLfqYYbqNwb/Ad7TY1idDwNmQAPY+8
 WHUte8/sQIMOaRmim4QGRMqKqZvt7cQf9WHzsolz8BqalcAE7hCGl13bCR4J/m3IMofM
 FUk+HPr0KVKDZiyLURaZckuEdr18OLJK+GlWq/05Wu/ScICbOsfl6wC4cz0AWYVrvAgA
 ia4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=XMlqZ1InvxrZfrALPvBsxmrkxcxs/WzrYWfmoOXV5oQ=;
 b=gjg+yA5yxpVvu+v4MLbz4EAZ8F8Y+RnqPuF7UA+rg3/2qUr9TDryLJjZCEnKrupTsp
 3qR3ytBZl2KQdtb/eCDwHzXZgef7/nOtb47IGzDG21wmF0qhojB35dyZyPGoxO/+tjh/
 HbIko6If/aDp+UBEWEVXEpDRsifJSaFjGKr1N0m4CHWoN2ZqV6DZiGhwhDY+BlIvp+Ye
 RLdXmrp4+f0qx2UTpY252xddOZ8FYI19abg2eGG5zTrSqsCMxgy2v+pLunvNRHtXSMrQ
 2/oCQnmEGcYCdNQ9jeLa8l6jsVR08B2xMSobZyVxjxH+j2Rz2ADXYYIA0yedyi8e1bGm
 CpTw==
X-Gm-Message-State: AOAM532e5Y8QF1mVL8+PFZEmtVKKFvXV8DAqjGscqoRBoE5211ho8gCl
 wu+nqlboCIx1MZO1j9aqUErqlo2NjDNf
X-Google-Smtp-Source: ABdhPJyr0GWZSCn20T2kweKfZDN3L/Gq3xDk5MyWTw/K0xIoS6FPcymwiRLJuEACC5/6JU5eFXQjNdpACT2h
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a0c:90e4:: with SMTP id
 p91mr939345qvp.61.1605250937150; Thu, 12 Nov 2020 23:02:17 -0800 (PST)
Date: Fri, 13 Nov 2020 15:02:04 +0800
Message-Id: <20201113070207.836613-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.299.gdc1121823c-goog
Subject: [PATCH 0/3] remoteproc/mediatek: read IPI buffer offset from FW binary
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201113_020222_806079_61ABC589 
X-CRM114-Status: UNSURE (   7.28  )
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
Cc: linux-remoteproc@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, pihsun@chromium.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series reads the address of IPI (inter-processor-interrupt) shared
buffer from the FW binary itself.

The 1st patch fixes a boundary check bug.

The 2nd patch skips a program header to parse if filesz is 0.

The 3rd patch parses the FW binary to find the shared buffer address.

The series bases on https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/log/?h=for-next

Tzung-Bi Shih (3):
  remoteproc/mediatek: fix boundary check
  remoteproc/mediatek: skip if filesz is 0
  remoteproc/mediatek: read IPI buffer offset from FW

 drivers/remoteproc/mtk_scp.c | 89 +++++++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 32 deletions(-)

-- 
2.29.2.299.gdc1121823c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
