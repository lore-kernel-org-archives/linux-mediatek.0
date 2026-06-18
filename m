Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08914CD98F3
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2026 03:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnAPP6DMQ7GwEGmMlCW71qkXAHg6fFaZ5ldwM/JO2oA=; b=iBEE8+kUktiRLhNRDcmQb3kNQl
	cr2/Gs7PeErT8FLvTBDylw7kiZ3U0FdaabK1mjdnTAgSgfmc6KvqN1afixLU0hnxcwBBjH7Xm8hy/
	tlITOqDljD89cD/VKCKKunFYTB03uNdIkLEzuIwv6/xFPhbDP8QQecthE7OvqhMifHXRqzQzXWizL
	7rlbSrffP1PTP0yrujrOk4lOlLe1GJ8RP3YzkUDf34WSjRxyAuY87QXwqByBdqMAqSm2B5wPTY4Gz
	M0A7tOsmkNApjhKWB1ep0iiizHs/gaaoksbEN2cOnHkyicuk841zsxVLntIqzVaPlIToCrPFCo/hI
	puoNODiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3CW-00000000YMY-16pd;
	Thu, 18 Jun 2026 03:13:56 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa3CP-00000000YIm-43F7
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Jun 2026 03:13:51 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-842358aaf36so144313b3a.2
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Jun 2026 20:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781752429; x=1782357229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnAPP6DMQ7GwEGmMlCW71qkXAHg6fFaZ5ldwM/JO2oA=;
        b=coDzPmNJOApcnd3op5yd4D2FnhYNI80yKAuNe3CBVxjNG/i6eHtvWfnf/Hd79WKsrt
         ZapEcW0RbPsvzsQKxqghN3HfQmFS3qNlbj1OpNe9MZB9xCI96VCE1OhzfXwDDSiaFOnI
         YsWE3CEKiZoMQqvQkI2rMJ4uDYE7hMPPupvsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781752429; x=1782357229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RnAPP6DMQ7GwEGmMlCW71qkXAHg6fFaZ5ldwM/JO2oA=;
        b=CiMQcn0WJIcFJn/TOjNU8hAeBZfP+Jo71GslyERB5kUclCXyJ0RsKR+1mzm6sipMyE
         uDxOCAO9mIk+SCQD01rUTQZKwRufOdll8ie1kFWcd4Xv/y1vskQ+BDk8xzuZ+rsqK3C6
         gWOYYuuPkdlz92lWsRPFhCQ6qFqu4sunxRHt5DD8EJiRpmZN+MiS5ShiJZzxSRIXz+M0
         EnpOgz2syy+16+zSxrJzP3O0CpnANJdDujM7Q4VoflrxeT5gT+MPfpF1TDNzev6rRuMB
         6xhVvLRdoPgGKc9qvsCTqMj109wBTf5jop7RvZrVKhXSi5q9vtSoNlALui/XWdJckDv6
         KUNA==
X-Forwarded-Encrypted: i=1; AFNElJ/AhDwrCJUSIzzDmjvyB0SPUCJFxCuG1V4H/6IITNPD87dTbEKWDYmkw6v78mg6BpWwRfmH8NIx1TyM6QKkGA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxw2NkPR4cW482jhOH6twYDT/Ls8gPeEZw6eX5wxNzZFVbL11JW
	hG+IFf+KHMSYcAyzB99FdhJ/t/IWD87YkdelQqegtUlXERmR4ZQDJFAvG6TXUBdsFA==
X-Gm-Gg: AfdE7cnF+L+fsdNGAQnGsUw8LpnzlQvcj3PQB3ACcMTPwknFPxJBa7XO/HBQxqQN9v6
	2bxMKmJfGeMIwVnmoJPhOIcWBxy48nyoy3gdCr2BBQMrsuKbI3p7FwmzgVgsWT7fqawIEXliDt7
	s7ev8E7fmBDIdIm0R/27HouQc5DMWc1lc7DOgfALteOSTcRiJ31yB/hRvjbf1bch+UtWDDr2d8q
	a4k57g2jZ5/EtDRw4CCXdi/8A/MvHsic2uk9holDAfNW1k4uLXX3ChT1nVtldx5PJvKTwuhBdlO
	MZjssx8CV8oaxm7FKallllkjqk4nFV3ANzjMlsUbFRJSzpGKzRRQ4+MAWXEijJuzx32lnkFP8D/
	M+/jUnE0BGpfpc1LFTkRShADA7j7zqaQ4+EmaT5/nn4tK1TwA0b35sd1Wa7UsOtkHYlDs6D6NG/
	PZy9O3y5QtJpGYhD1P/zj+ACynUYAS9YOMjDUT3NC9dmQJrQdhNPLpyToR9SZxC7RrqlgbRi+0z
	k4=
X-Received: by 2002:a05:6a00:1896:b0:842:6a3b:60c9 with SMTP id d2e1a72fcca58-8453b214f5emr1655665b3a.24.1781752429085;
        Wed, 17 Jun 2026 20:13:49 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:20ef:efdb:f2c9:836f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b046911sm17548232b3a.53.2026.06.17.20.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 20:13:48 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH v4 1/2] Bluetooth: btmtksdio: test for BUS IO errors in btmtksdio_txrx_work()
Date: Thu, 18 Jun 2026 12:13:21 +0900
Message-ID: <20260618031338.1011410-2-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1189.g8c84645362-goog
In-Reply-To: <20260618031338.1011410-1-senozhatsky@chromium.org>
References: <20260618031338.1011410-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_201350_007337_97E15814 
X-CRM114-Status: GOOD (  10.39  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

btmtksdio_txrx_work() loop termination condition checks for
int_status being non-zero, however, this evaluates to true
even when sdio_readl() encounters BUS I/O error (in which
case int_status is 0xffffffff).  Break out of the loop if
sdio_readl() errors out.

Fixes: 26270bc189ea4 ("Bluetooth: btmtksdio: move interrupt service to work")
Cc: stable@vger.kernel.org
Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---
 drivers/bluetooth/btmtksdio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
index c6f80c419e90..d8c8d2857527 100644
--- a/drivers/bluetooth/btmtksdio.c
+++ b/drivers/bluetooth/btmtksdio.c
@@ -574,7 +574,9 @@ static void btmtksdio_txrx_work(struct work_struct *work)
 	txrx_timeout = jiffies + 5 * HZ;
 
 	do {
-		int_status = sdio_readl(bdev->func, MTK_REG_CHISR, NULL);
+		int_status = sdio_readl(bdev->func, MTK_REG_CHISR, &err);
+		if (err < 0 || int_status == 0xffffffff)
+			break;
 
 		/* Ack an interrupt as soon as possible before any operation on
 		 * hardware.
-- 
2.54.0.1189.g8c84645362-goog


