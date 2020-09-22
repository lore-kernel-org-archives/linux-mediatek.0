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
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD352C4363D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 07:28:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3376F21924
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 07:28:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nI15D0CV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pjg8SERK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3376F21924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pqipOakLZmOu3d0AwN1OFMQfhwNahdnTLHfqwMMA7lo=; b=nI15D0CVep/Aw6NCTqM9J80zTP
	MSTQmsxlsyf00ypsy0kDoqE7awvGuV2G/9yDZHqW9+GPZ1GMOKcpROAUxjTjR76UEsC/eDVGK7jU4
	tEIK8SCYWjT2tESfCTf3Uu9DuCK8bbhN7RLUHpAhVTU/iffDT8wZ3C6ILmUIZb24eYiXM9vpxs5HI
	154Yb7CEh2YceV+SaIdMifyMvFZSlbBrds2ctEzXC6rtEvtER1DE/l07bLaTBvVxbR56Z4c7+pePh
	u6ghlLA+qGSbf1OVef38EUkl3LJkjJVA9JA9f3lqdhZF4RhvUWOdFeyderbPdC53i+dtbfQXHzpJi
	1KMtKGtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKciP-0005mw-Az; Tue, 22 Sep 2020 07:27:53 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKciH-0005jr-Gf; Tue, 22 Sep 2020 07:27:46 +0000
Received: by mail-pf1-x442.google.com with SMTP id x22so6817998pfo.12;
 Tue, 22 Sep 2020 00:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9doUA7v3qgCprpOcOB0ioz4IxnVKUZWjoWvI1uixCX0=;
 b=pjg8SERKuYSJJ25UqckO0hTCikNkE4ZF+cnAq5b3rQ7jvSSztxE69QYZQ/umNDDhnj
 ytcqw4BDtW7xLXS4gB0aeUMDRD45T5k2Clp6yP6kA/LPjHEMcmJrodqnAyI3qcDhUKlB
 FaqL45m6IrFpdFsLqa3iUCXXYEu1HGiwtEHlOFZE91palgXQ0qaWwuPTfxXUYnYZnhyP
 Yc+uyUGyIX1mRxh7f4Cy9yDaX6JKlFHNoA3u7SZBV8V09ZENgoV0sbRqeVR0u9aVHKwW
 ah+PrcV+X7Kig7OHyLjkEYbXd3KhKP8VQ89P19xFQOSKr+AvNZxXn2LcJP0vqIo8/Dxz
 AcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9doUA7v3qgCprpOcOB0ioz4IxnVKUZWjoWvI1uixCX0=;
 b=rwdrM9OFfIaYJ2MRCROEvZecwTW1Ndq3+22mgsw49TEdmU+RGKT+MQg0gOBSd94aaW
 6iVFttWKZTyrsMhK/9fz9V81J39lsYKL0rnst3ulv+ARAgblRa3kMGqPG71iyTuVA3dy
 JVC9VGpL/M7TjjijinigJikw1D85EaQ5uHHPVd5IVx6Cwn/d0/cPNLiI1uFmHdoN6vT8
 Rh/5llupEMZEQYCrKB9AMnwQHHKXfPa4M0i0eLkvrvd4D7IAFZKT2QHa2K4BxEsCTgYX
 JVnBKQsI3wZv43S7xj3SsF9iZAl3bebFG5Yz7qQS3S0ELjg16T9Kgqt4TIz4MLP3Fn4M
 JqWA==
X-Gm-Message-State: AOAM5313Fcbuz62FzWFMb/eepQx6y04nPojvMf2EXFgv1NWUqsd/EJ6J
 Y5LKqdYEpTmsVXA90AghUQpxefYQhe9mLA==
X-Google-Smtp-Source: ABdhPJzYZ3x5I+xzxFOQEOvKxMFlSEVLE3xNIlNFJOgSUp2WJ1PLZRU3uLM9KADfhFEY8K284vWaoQ==
X-Received: by 2002:a05:6a00:84e:b029:142:2501:35e1 with SMTP id
 q14-20020a056a00084eb0290142250135e1mr3117666pfk.65.1600759660698; 
 Tue, 22 Sep 2020 00:27:40 -0700 (PDT)
Received: from localhost ([2409:4050:2e9a:cd41:aceb:49c:d6fb:ea72])
 by smtp.gmail.com with ESMTPSA id q15sm4252157pgr.27.2020.09.22.00.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 00:27:39 -0700 (PDT)
From: Piyush Goyal <piyushgoyaliit@gmail.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 1/3] stress-shm-sysv: exercise shmat with invalid flags
Date: Tue, 22 Sep 2020 12:57:28 +0530
Message-Id: <20200922072730.68911-1-piyushgoyaliit@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_032745_609091_4D86EDDE 
X-CRM114-Status: GOOD (  12.11  )
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

Exercise shmat syscall with invalid flags resulting in more kernel
coverage.

Signed-off-by: Piyush Goyal <piyushgoyaliit@gmail.com>
---
 stress-shm-sysv.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/stress-shm-sysv.c b/stress-shm-sysv.c
index aa03d718..5a3e0cc1 100644
--- a/stress-shm-sysv.c
+++ b/stress-shm-sysv.c
@@ -128,6 +128,19 @@ static int stress_shm_sysv_check(
 	return 0;
 }
 
+/*
+ *  exercise_shmat()
+ *	exercise shmat syscall with all possible values of arguments
+ */
+static void exercise_shmat(int shm_id)
+{
+	void *addr;
+
+	/* Exercise shmat syscall with invalid flags */
+	addr = shmat(shm_id, NULL, ~0);
+	(void)addr;
+}
+
 #if defined(__linux__)
 /*
  *  stress_shm_get_procinfo()
@@ -337,6 +350,7 @@ static int stress_shm_sysv_child(
 				goto reap;
 			}
 
+			exercise_shmat(shm_id);
 			addr = shmat(shm_id, NULL, 0);
 			if (addr == (char *) -1) {
 				ok = false;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
