Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F902C4363D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 07:28:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB6A321548
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 07:28:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JVUjtLRF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Euve4fXl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB6A321548
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ORZ0SU3/3uKEKrXYHdmkOZE1vpgqVlR1rgnRmxhYFPM=; b=JVUjtLRFdrq3psq1+yWBNL4YI
	s6CMi2eu4CNC1cLSAD8kao83OCv85d8wWQ+XcPY1BurXwRYzMKir7vAb36H09FxWiGGCWCHahf5g3
	DSQszsBZMzVKUWRk2sv0j5qEF108n7EGJGv9yhwB5XMuydQEgux5HvtR9YSJqkla1LpaDFzBzRVK6
	kiVxFM3qVzI2LmtJH+Jt36qL6KpWaFgUD4Rdn6gZYseWM9ohDNXz/Qf+SgI1wp9AytJshFNelmpcJ
	2JqizgZpQtmAiLVYh9wL6lbDUTMYufrnupD+vzqzM5lZhZtO+3vawSoUS3hmRm296PnKwJgLsDC0J
	WZfX0CE0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKcic-0005q4-KD; Tue, 22 Sep 2020 07:28:06 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKciK-0005l7-Nv; Tue, 22 Sep 2020 07:27:50 +0000
Received: by mail-pf1-x441.google.com with SMTP id f18so11629226pfa.10;
 Tue, 22 Sep 2020 00:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PohIKHFK8kNViEgt/D+xrQCt40xHvnwTaUyMochPjiM=;
 b=Euve4fXlh9cyeH4Ff9DCJxOOPH9F63SIu0bUv82qLKMoyBBGD69x/Kn0F44dBBUH7o
 bQPRQy82rd6xOsHN778t+ENhRZPEsZ2kE7T4h4TGyuPJnSjGxGniHM0VRAZk4R9yB/ct
 jPs42Un//+VKA5Ic7nAybVWTmLyx0q6O/X9Dvmxk6dT7U/eeX338/9RnkbMnkz74MhYi
 uOqhDXosBo1/ctyr86FplhOXLnyQLcC4T22Q1PFwMWaPh1I9cuWWfZq1cjy0gMI5MWYJ
 e+rDvR0Rj+Lm6lPqpsYiRtRGmLL4rL/AUko4BmYd71j/PamVkpvnsFTb6v6g3jG8n+rG
 QOeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PohIKHFK8kNViEgt/D+xrQCt40xHvnwTaUyMochPjiM=;
 b=WM8bK7C6VR+rokOYgNHkW6lpnlXMLeYimZ8G7WqP9CtqevY6i2MgbfX1bqz5A98VgR
 UhzzviySvCQ9BTy5Q0lUi9eEI8f/lkLL/XUjI/s9Vy7tLTf4RmQ3K5DBr7Oio1KD148W
 +xmgbBVli2kEbyAUY5sRaHWJEQFkZlVa/mTDuUqTe1db/9a+YNsh4HkXrI5K9wrVREM6
 cTh6uz4OhzIZiYhj9ReU3YkClVXLdaIn5jkJ1Fc+8LsAsvlqAKRy9V66+jaYKUwtzKyq
 dvr9r5NyhrvNKw9CXNmyPmvlp/lGcRpJIFDLZIs+iGMFHsmEstRVLKgsUlqe6OOpv2ue
 8/Qg==
X-Gm-Message-State: AOAM533wWNPQ6voVbxld/bqw5Be/tV3/JwXVoVRQsnl97D9F3BTu7nhM
 ooYHnusIVLJR0SaUHwv3C2c=
X-Google-Smtp-Source: ABdhPJwkZuIjLkHxAB9H6R1apOtg0S0HDLm4nUz7zGVbohLhQNp+Jq7Dt3br7y0CvdRfrwij6ryrvw==
X-Received: by 2002:a63:b44f:: with SMTP id n15mr2564965pgu.282.1600759666612; 
 Tue, 22 Sep 2020 00:27:46 -0700 (PDT)
Received: from localhost ([2409:4050:2e9a:cd41:aceb:49c:d6fb:ea72])
 by smtp.gmail.com with ESMTPSA id ih12sm1428926pjb.24.2020.09.22.00.27.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 00:27:45 -0700 (PDT)
From: Piyush Goyal <piyushgoyaliit@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] stress-shm-sysv: exercise shmat with all possible flags
Date: Tue, 22 Sep 2020 12:57:29 +0530
Message-Id: <20200922072730.68911-2-piyushgoyaliit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200922072730.68911-1-piyushgoyaliit@gmail.com>
References: <20200922072730.68911-1-piyushgoyaliit@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_032749_001137_FD031167 
X-CRM114-Status: GOOD (  12.09  )
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Exercise shmat syscall with all possible flags resulting in more kernel
coverage.

Signed-off-by: Piyush Goyal <piyushgoyaliit@gmail.com>
---
 stress-shm-sysv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/stress-shm-sysv.c b/stress-shm-sysv.c
index 5a3e0cc1..9efaa091 100644
--- a/stress-shm-sysv.c
+++ b/stress-shm-sysv.c
@@ -139,6 +139,16 @@ static void exercise_shmat(int shm_id)
 	/* Exercise shmat syscall with invalid flags */
 	addr = shmat(shm_id, NULL, ~0);
 	(void)addr;
+
+	/* Exercise shmat with all possible values of flags */
+	addr = shmat(shm_id, NULL, SHM_RDONLY);
+	(void)addr;
+
+	addr = shmat(shm_id, NULL, SHM_EXEC);
+	(void)addr;
+
+	addr = shmat(shm_id, NULL, SHM_RND);
+	(void)addr;
 }
 
 #if defined(__linux__)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
