Return-Path: <SRS0=MDtk=CY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67100C43461
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 05:49:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AB98206C9
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Sep 2020 05:49:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yK7JZWmb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lhwF0mVE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AB98206C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wgUK6KJkoMzIAP4dZZUUkwRGkvOtxNXQFK+rJ5JYro0=; b=yK7JZWmbJIxUtKHK/tBy3FmHT
	hYDHJjmOvVe0II+hAX12UVd+Cery0IoxawSvcsGx0AAQ43p0YwOfG/HOYw9P0a652sFmaj94gV1zK
	UOisRb7tAMIjekzowoOkInbr3IItq4ZNNXm3eaJGwmqK23yQ3h5p/q8lb2Wrh5uh7nZGrcHzUsj46
	S/cSzCaWP/Rxj6La/ErScJ+SmLAqIXCheQZuAc8YbXxop6bwu30zBQ8qPEEgZtAb7iJSj5mc3mxEV
	4OGczpnEY4ueQt8U6ZiWznbACZ0ccXzU1nMGCcrx5rtI14ijX0od+S4JJw09vXX0msJcEh4s72zRA
	McwKHrIFQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kI3po-0003Fu-5B; Tue, 15 Sep 2020 05:48:56 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kI3pl-0003EP-0Z
 for linux-mediatek@lists.infradead.org; Tue, 15 Sep 2020 05:48:54 +0000
Received: by mail-pg1-x542.google.com with SMTP id t14so1371920pgl.10
 for <linux-mediatek@lists.infradead.org>; Mon, 14 Sep 2020 22:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ajoQueMBujUuw1C0JmEIu2PRwKxBFaE7by2u7sZoZh8=;
 b=lhwF0mVEGZ9J3xNUDzGy1qYVGT40a/VHeqrvRc0rB+l4kY17O5nWvmZ3KwXPwgYMoO
 +6HM2/5N/2OZUYKxr3mGw91wwiSlX5s+aNMBp3VtiHZO2jbVDTjA9IfBHKBAEWodac8z
 oe6uDZK42z6+D+5MJefG+sNmpqgWbe5D19vrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ajoQueMBujUuw1C0JmEIu2PRwKxBFaE7by2u7sZoZh8=;
 b=Pb7pLLNW82HNFOm0E+0OQzaQ57yS5o9tZ/BCt8CFJLYIV/5292NQ6zp4IpFbgOfG3y
 iExoMYPwUdaagPXT9MWsFRL85nAIeUV2LQxUs0nOwnmudgQ3SWY20gbzJEkN+6HyL5KV
 Q9KwOe0sHxAjrLSZ7dyd0d1w/92oUZREw2KWCRfYMGus6FuGyvZal6/jVWdIqhLVfSCG
 ymPT+I0c7MzHjawYk58ypkqgUapeypGN/oLpmvbdrGT3ZEyGQmCmrAEUZDbYzeLl1865
 hh3yXHqhSOHeDpa+SdGFMHy6slAvvAFJkJLzI1SesJcvz3i7jb2Cyy7nUXBPDwHIVtqo
 EP9w==
X-Gm-Message-State: AOAM530hwBh7w+2Z/JHBQC/1GpxlC73q2ZU8v9pIPvO+3KZTMv8D9OAG
 Yi3H9tRXzSUABrOWu8bRt0g9UA==
X-Google-Smtp-Source: ABdhPJx0DAS8oOMzQIF5bJW2RhKW9+TgJutsnK0EusfXFCToH4RzyIAADhtvDYQNvLhwg1sFyQ8kyQ==
X-Received: by 2002:a63:5d07:: with SMTP id r7mr620189pgb.440.1600148930542;
 Mon, 14 Sep 2020 22:48:50 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id gn24sm11034935pjb.8.2020.09.14.22.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 22:48:50 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-serial@vger.kernel.org
Subject: [PATCH v2 2/2] tty: serial: 8250_mtk: set regshift for mmio32
Date: Tue, 15 Sep 2020 13:48:27 +0800
Message-Id: <20200915054825.3289105-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
In-Reply-To: <20200915054825.3289105-1-hsinyi@chromium.org>
References: <20200915054825.3289105-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_014853_303680_A737D3B3 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: Eddie Huang <eddie.huang@mediatek.com>,
 Changqi Hu <changqi.hu@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Serge Semin <Sergey.Semin@baikalelectronics.ru>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

To use mmio32, we also need to set regshift.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Change:
v1->v2: none
---
 drivers/tty/serial/8250/8250_mtk.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
index 7b0dec14c8b80..41f4120abdf29 100644
--- a/drivers/tty/serial/8250/8250_mtk.c
+++ b/drivers/tty/serial/8250/8250_mtk.c
@@ -669,6 +669,7 @@ static int __init early_mtk8250_setup(struct earlycon_device *device,
 		return -ENODEV;
 
 	device->port.iotype = UPIO_MEM32;
+	device->port.regshift = 2;
 
 	return early_serial8250_setup(device, NULL);
 }
-- 
2.28.0.618.gf4bc123cb7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
