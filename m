Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65B2CD98E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2026 06:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2dzR6Vpdm4bVAwBr1gBJ6e+KALKJtf+O4NR+UNIBATg=; b=xekE6RyXdIdl58s3UVJzp6Z0sp
	J9ZKruCf61GtCW1mk2vXu9+Vklnt4JlO547rigUtsvCQAbczRvVGGAI5nsa0CcCigpQ/q3UI4C4QW
	IKIqPsz37RBvlTDXAPFQcT11tBbgXflvuzab+iXMStsVA3pOUcrfK1luuvx4W6o9UP3FgbUOxfeqp
	3j+Nb/5i7GhfGVNUnEhdxPueX1Uqu3lfNjDBbugXIPGCGyrqTqtnx4IzCsaZKKJxOx6y5mT5P2uYZ
	efoktzqqL0LZiP+PIGY+bIn+Sza6kazq4FjW3xnbfRUO0TTE6b96ZmMRL8YbG4iGK/IjGo9POXphc
	NBFH8bCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk2C-0000000GjZH-2lX5;
	Wed, 17 Jun 2026 06:46:00 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZk26-0000000GjVy-3p7q
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Jun 2026 06:45:56 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-37c8e7c8137so458276a91.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 23:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781678754; x=1782283554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2dzR6Vpdm4bVAwBr1gBJ6e+KALKJtf+O4NR+UNIBATg=;
        b=MTgxmXsDd8u8Pq6e6g4nVw04kKG/VN5Jw4UGbSL4tSPhp41OiyVAvbWEpZv/rqmH5g
         kBGusQXdo5G6oeCqBD3hFC7gbFT1t5K/gulpLO78y+1YC9n69+0BkD9WUFNibr9EJkbW
         Sp5xdPP4j/tC7YwdY4uDCdAkyCLrvBVmzYNHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781678754; x=1782283554;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dzR6Vpdm4bVAwBr1gBJ6e+KALKJtf+O4NR+UNIBATg=;
        b=FeY8sHMf5j7N9dmm1i/u0TopPq+B+65AqKB3L+XdDA9qa7erP6QcxrzdiUN1y9Hdsu
         xlGCnuV3TGhsKduajr1A23euh4H4lJFNlN6cu8NdyFiOpoo0eNAB6rW3lcdJ76LAlTlV
         +K/LiZ3wZHFb3+bFUgEDS+8XFjDYxPtRpUs+C2haXWd43ObAJKmne6XWCA14AORgvO2I
         0vfiUyrrMqiMSNajbv1NFNeN0wCEbgADD/SOXiyzOW1PgXYo9vVegdz3E4AYGgupqQSz
         HwRDN5GNT3ish1nFDHC6kOGCVcUccbDifVHXQ08ja7AwsI4QC+wEZ6wZJa11H3n/FUxa
         K7Wg==
X-Forwarded-Encrypted: i=1; AFNElJ8WGChaeMI4se0dgVLdY5oU1NMW+zhZr9EB773WThTsF7WtC3ddVHfxdDGD/U95/v+GMYiRLIIW8yNFNIuQnA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbjZTdygMK1d2IaDaop+VfoOJfK13z1yC0W4SjAGv7jjRzgNy8
	8t4kykSC8D52QNlIJFAl6BaO8rJPBGyMo/K9bFJofDoDoB3vblTNlB5EPic1l860Bg==
X-Gm-Gg: AfdE7ckdPtiwMkzVBUxjDsI1Xpol5OeEOY0+a48TwMxWPa+vKw7cywIXr/ASuqoSs5J
	bomVHs2zQ4OpxKUcLEBVunTp6b8mImOp1LcUyO+faRG0zXoWa9klmqA70gs4vfAtFY0UJd+LCuB
	S90FTMXjCo2KtuTGW9IcambQ5RNsU7k3bNSUXGkkxgfNocvwsCJ5seTP3SDC9Acz+Ie/mG47y0Q
	bUp/6cfPoUrdLRPppxnB2F9Xb6EmaGcswuLAttdphLW5lwYwqd4FtDdz42ECFU6bRovxMRD3o49
	pWFV+mFKfKzbSVXBUvHooP4Hqj4E1A8qaFZD7rDW++uAlK9ssslTVfeL2aLJ5RPamghsNoWip8r
	LjOO1GfDdZAw9UggXoNvYzVNR9uRR+BxKC1n8QtG9di7yXPmNqxuoLyoKXzFVflt65LnrWvE9mL
	7pRj+ew1Vh+uS7ZmSiHgLA2HBCel2rnB3B+oeB5uHqFMvjJ00x0Z0sbVkE+JFF/68nTGyyaFmBR
	PU=
X-Received: by 2002:a17:902:e78d:b0:2c4:358:db32 with SMTP id d9443c01a7336-2c6bc0c6dd7mr24581365ad.13.1781678753662;
        Tue, 16 Jun 2026 23:45:53 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:20ef:efdb:f2c9:836f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c6af931f19sm24365675ad.74.2026.06.16.23.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:45:53 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Mark-yw Chen <mark-yw.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCH v3 0/2] Bluetooth: btmtksdio: teardown fixes
Date: Wed, 17 Jun 2026 15:45:30 +0900
Message-ID: <20260617064543.574704-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_234554_980045_604B7D00 
X-CRM114-Status: UNSURE (   6.14  )
X-CRM114-Notice: Please train this message.
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

This fixes several teardown issues:

     INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
     __cancel_work_timer+0x3f4/0x460
     cancel_work_sync+0x1c/0x2c
     btmtksdio_flush+0x2c/0x40
     hci_dev_open_sync+0x10c4/0x2190
     [..]

close/flush can deadlock when run concurrently with btmtksdio_txrx_work().
In addition btmtksdio_txrx_work() re-enables interrupts regardless of
close/flush being executed on another CPU.

v2 -> v3:
- dropped infinite btmtksdio_txrx_work() loop fix (already merged)

Sergey Senozhatsky (2):
  Bluetooth: btmtksdio: test for BUS IO errors in btmtksdio_txrx_work()
  Bluetooth: btmtksdio: call cancel_work_sync() outside of host lock
    scope

 drivers/bluetooth/btmtksdio.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

-- 
2.54.0.1136.gdb2ca164c4-goog


