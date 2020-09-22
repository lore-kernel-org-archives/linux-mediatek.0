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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8E9C4363D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 07:28:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D5A921548
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 07:28:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g5XHyHSX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pevB0rJq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D5A921548
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wqOHHYvbx9xboBPO4fF3kqEUmkfinkQ80g5jcCJ6c5o=; b=g5XHyHSXjQbew+OSIHN8Xnr+K
	WfQ+X0mOhs7C/LrnlyM4l19CBGBRIem+GO/WKkxUlGAod1BXomcaeqV+tyi63/35Ieuhg7ilzdvFn
	h9ZmmAV1DGyLJNgex28DeaXim79Wlp1XJK0KephZaC1d9JeRbak/0FRhXZiPCoG49mKhRHX6pzGj1
	GKCwK3KGv7pChtrqaCuD7Y2SXZyWNccBhxC3N38Qy1MbAN8IYh/EkB+8+CsahqUVUZdlhJ3vJca2x
	ianx2xe5Qb4fhi4p4py5Fh+KhEXjo8KhyPykaHo4h6UvqnJQx91Hc9lTLXvcGnMK4kWowocvfyko9
	Dydu5YBIQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKcij-0005rX-B8; Tue, 22 Sep 2020 07:28:15 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKciQ-0005n1-T7; Tue, 22 Sep 2020 07:27:55 +0000
Received: by mail-pj1-x1042.google.com with SMTP id b17so1028481pji.1;
 Tue, 22 Sep 2020 00:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xCA247ShbpRZ1a1b45l38fFZLtGfn793+mZHctzrR2s=;
 b=pevB0rJqRxFzG5mcV3HwhUpMG9k8wYCHBZSbVEhbk67cwbAeU2Jk1AYyRATEs/FBQi
 SHHK7z8n5tdoYgdfeHsoy2ZymuZ47kJXf5ylxzROmJ1Ia5l1nZTo5oOSddjxRJ5z0/Dd
 lvwOyEdt/BRnRBQhQp6lhycwYPSgPt+3w6zLZbQerMM/As7xVhPCozU6ni/UtALry6ya
 mnDirJVGr07uIUimK+gldhMG5CSrfKlhlHmQXTsqqaXm82hCNW9DD1HSEbjnZjBjqu/8
 cC6YA+gOVeomsKyj8ej8qHyh3nbjtFODv2D2zskTw04rar7CQbF0QmpipcJih9Lum96S
 hBTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xCA247ShbpRZ1a1b45l38fFZLtGfn793+mZHctzrR2s=;
 b=ZPKf2dQkHgYY7LJ01C6BL2UO2iOyD4abgkh9bHzLlVLHXYjE17fz2qyUk8WnZGxY6e
 dcS85pLBxKeHaeUmBoMX8GM3LVy84NG0v0Z8BziFaOptafTbYdUj5+pspSnv3ygsVRyU
 g1DcQKkAPeykRftw7meHsc33R+3jNQtRl0F/hM7c6XFoZ+yUwOdYvXhNQn6zKDESpT/g
 cgKe+TOyBwYRm6srKNXK/h6/hdqoyijNbGv5Jp/gd9RSDR56oGZegdn2JjPmsjTiU9pS
 +bQmA2Ri/EYRmdEghNYlIDlkeh1mPnEX0/rnUZ3qXZFObXie6Ym9WMuqi//l4rx3zeaZ
 TI7A==
X-Gm-Message-State: AOAM531KxwD1t5fzedPdowWTDAQhO1DHhXpLXvmeOgn8U5QV1q0wM3J7
 CPHdoTsB8lTYa8TxI8ie7nE=
X-Google-Smtp-Source: ABdhPJwwogNbojzybdhoPYW4owwtmCDx/oXe375OKk7BBYv9zNzzPan3N5yovp469BSPE9PgGKAsVw==
X-Received: by 2002:a17:90b:8a:: with SMTP id
 bb10mr2687470pjb.108.1600759672854; 
 Tue, 22 Sep 2020 00:27:52 -0700 (PDT)
Received: from localhost ([2409:4050:2e9a:cd41:aceb:49c:d6fb:ea72])
 by smtp.gmail.com with ESMTPSA id e17sm13690983pff.6.2020.09.22.00.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 00:27:52 -0700 (PDT)
From: Piyush Goyal <piyushgoyaliit@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 3/3] stress-shmsysv: exercise shmat with SHM_REMAP flag on
 NULL address
Date: Tue, 22 Sep 2020 12:57:30 +0530
Message-Id: <20200922072730.68911-3-piyushgoyaliit@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200922072730.68911-1-piyushgoyaliit@gmail.com>
References: <20200922072730.68911-1-piyushgoyaliit@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_032755_173535_F2226919 
X-CRM114-Status: GOOD (  11.97  )
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

Exercise shmat syscall with SHM_REMAP flag on NULL address resulting
in EINVAL error and more kernel coverage.

Signed-off-by: Piyush Goyal <piyushgoyaliit@gmail.com>
---
 stress-shm-sysv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/stress-shm-sysv.c b/stress-shm-sysv.c
index 9efaa091..e2aff788 100644
--- a/stress-shm-sysv.c
+++ b/stress-shm-sysv.c
@@ -149,6 +149,10 @@ static void exercise_shmat(int shm_id)
 
 	addr = shmat(shm_id, NULL, SHM_RND);
 	(void)addr;
+
+	/* Exercise shmat with SHM_REMAP flag on NULL address */
+	addr = shmat(shm_id, NULL, SHM_REMAP);
+	(void)addr;
 }
 
 #if defined(__linux__)
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
