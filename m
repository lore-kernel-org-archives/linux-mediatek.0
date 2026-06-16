Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1659CD98CF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 11:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DsaDqBODBOe0uQd4CZKQhSELJgMWAA7Q260cUecRjlk=; b=VhageDBXbYZ6r132PVvgg5tOrZ
	mUytT950fvjR3B+tlrTYFOlFfOYm6H/+xrd4ohQ3rvftOJeyqb/5qw0iqbncPZDPfgeI/9o4c3/7Y
	LVzyCavXalbmi9KdaDghEC4opzwXJk/9ZhZiM8UrM9ZCBR5BlkLzLrDYpp2fX/L+hiepydehZ7M5C
	reKkP8gH/r+tRlWYRDtw/iW8aH9pQAiF6d6rNvtVM+6aqeVlbIoCYGAbJEIYhk+yypmR6PQI7V8oZ
	VPjcEwM9dyFkCr2f+MB7JnmuMDaf3Sdb2x3FVoDzW8vEzJBp2/ZRsj8uKPWkRa9wZKa41xMb+ZFe/
	WIoPz2rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRiv-0000000FeyP-0Xo5;
	Tue, 16 Jun 2026 11:12:53 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZRir-0000000Fewq-2cJO
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 11:12:51 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8424b6792efso1827233b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 04:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781608368; x=1782213168; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DsaDqBODBOe0uQd4CZKQhSELJgMWAA7Q260cUecRjlk=;
        b=k+S0b0WbEmPP/MyhEaP+goelQWiudgAxBgj2bsRxR6GgsJYol3dpvKSmZTPO+J3qdd
         EUvhyQPa6Tajb+f3dZ9C5cGjVVrSGPtlUG0gk+e25djaQHhZuVD9LYjAlM0K68QLZnab
         dwC3pljbF9sua4XS+zwbdiX9M3Z4FoS7j+s6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781608368; x=1782213168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DsaDqBODBOe0uQd4CZKQhSELJgMWAA7Q260cUecRjlk=;
        b=EfgUsq8iDQTvBKQdxBfZ5uB1X+1z1F3fLml/JoSsRsCGoO+zwZfnWiJECRy4HZlS5c
         33pCHEtjk0Rdirnrp0pFCaksKNqT+JhssjvxqlGp7FR5lEjW9YyDicyTshodPornXz+o
         nGk+wijozatHKF/EkYw8IWAkTJ/ZnIFE41eK3s3sgYIIwUQH8Vvm6uyLt3UgAk00H7vF
         m2arAtg4sUq5b5bjDFsJwI+pQgw8MHqCEXyw1qStXjDeHR44lgqHPDYCwkug+giKmoNB
         CpD9LscK5DiTOr4mZ9/o+Od0DXYpipjrSxljc66NoLZ0WbF+KM/R4QnQzN7zqemzzPgC
         vpLg==
X-Forwarded-Encrypted: i=1; AFNElJ/JzeyrZNZGsfb9UOns6JZXnESZzAX2+tQWD/uaIevq0A+e9e/3uLjDm6Ubu8/NSdd6Hf+9+oLFPl+0KtVsBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YywP/ItEzPZosgx7ODbxwBZw9gzdjo1wwlpdv5349PqTvkO6WL8
	KMHhz7aCnzRN5EiSNDOCCJZieKrDxAG3RXBfidC+pSDCZUlinpbMUaClF4aMAOoieA==
X-Gm-Gg: Acq92OFjZKeLxh/97Ku2MwfEK2On1ep/xCQvj6WEJDqbJjDZ2Hm12mVqPLIWeU1onaY
	hXXc7WqwNILdBKqLxBp+dZsiLieqmK/Qo9CTSZ4fuXygI3uBxlSg7aTSjUfwci6Bd6gnzuQIzn3
	N27JkasvvW9zsAqoHzBSosh9p9e7/1sCqw8N2DpTATDlPJN6zWI+l4I1UVoTSan0MvktExxMCYx
	OXXlYPyIoNZ6jGLCC4PB/3G3vF9imQiQtGTo5RqROa1Am1iKrEsz+pNapks3ECr08YA3Q0xrMN5
	O+T0W+KaHlBO3JQQ0SuhzKXSrmXaHrzIp+nrc8CAWun4CvR8WFFagPETpWbCug9H66ry7xreJ+t
	usyH+SNOk0KZ3tvvxUkLDIMChYP13JO5h+/2KSfVFNLQB7qfkNPiJAjNa1KDm/HLkP2jnqRQuAr
	59d1FMPtXhPaZ6cU7Qz1MmkJEN/kylKniNYoc1xMA2jqG/IvywknfvshsWo/elO/MyiC8zktRl2
	h/YUzQhQZjiJLmQUJ5YdNo=
X-Received: by 2002:a05:6a00:3691:b0:842:4af4:3099 with SMTP id d2e1a72fcca58-844e1998f75mr15786071b3a.20.1781608367732;
        Tue, 16 Jun 2026 04:12:47 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2a00:79e0:2031:6:a0b:fabb:5b62:b85b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b05921bsm12906321b3a.59.2026.06.16.04.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:12:47 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Bluetooth: btmtksdio: teardown fixes
Date: Tue, 16 Jun 2026 20:12:05 +0900
Message-ID: <20260616111224.152140-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_041249_782939_309AEC98 
X-CRM114-Status: UNSURE (   7.21  )
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

This is v2 of teardown fixes.

We noticed a number of cases when btmtk close/teardown would hung:

     INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
     __cancel_work_timer+0x3f4/0x460
     cancel_work_sync+0x1c/0x2c
     btmtksdio_flush+0x2c/0x40
     hci_dev_open_sync+0x10c4/0x2190
     [..]

There are several issues with the teardown (close/reset) code
in the driver.  First, the btmtksdio_txrx_work() potentially
can spin forever (infinite loop).  Second, close/flush can
deadlock when run concurrently with btmtksdio_txrx_work().

v1 -> v2:
- added two more patches (deadlock fix, interrupts re-enabling
  enhancement)

Sergey Senozhatsky (3):
  Bluetooth: btmtksdio: correct btmtksdio_txrx_work() loop timeout check
  Bluetooth: btmtksdio: test for bug IO errors in btmtksdio_txrx_work()
  Bluetooth: btmtksdio: call cancel_work_sync() outside of host lock
    scope

 drivers/bluetooth/btmtksdio.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

-- 
2.54.0.1136.gdb2ca164c4-goog


