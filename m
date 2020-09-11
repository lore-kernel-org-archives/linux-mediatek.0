Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EB91C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:40:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F356D21D92
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:40:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PcZKxvdx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KfefxcN2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F356D21D92
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xZevAA6TewtEkKHmMU6hPGqsu7rUL2p7jHTruUKHQ48=; b=PcZKxvdxnapQZp0nilCdKVMva
	2RPqjOgMajehzqEKtaeaDsdpsf6Cz52MzZ6818ty1CH7094n2h10N4yCnVVjRXnvB7k0EY2YdGOt0
	0JxWDsfq3kKdBOiNTdSQ7kKscOZTpmJ9j2KB5VcwDDtZ1pob0JschNLvxNy9qeC5r3ngIy5GluqXs
	GDRA36Ps/SJfGKI7fG9jbYfh3gLg1Jt/bXniH5uvkxNN2WwrM4ndLXgsd7ZFaiNSakKUfT9Xe/RM2
	k9c4s3NRSDKKYhh/xav4+WJe0XvVmoKjKSkT6MI98HhvTS3E89xDjmH00hOD3cnRWComNZjAG0Mfj
	5ElC8FA0w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGfX7-0004ZG-9b; Fri, 11 Sep 2020 09:39:53 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGfX2-0004WU-T4
 for linux-mediatek@lists.infradead.org; Fri, 11 Sep 2020 09:39:51 +0000
Received: by mail-pj1-x1042.google.com with SMTP id b17so1439247pji.1
 for <linux-mediatek@lists.infradead.org>; Fri, 11 Sep 2020 02:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KlLBYhev4Wfr30ELlYvsH52U84dkhIKc99s8OuU9b24=;
 b=KfefxcN2qmiKm7hShLw/DbW+tGavlLL9yPgswsVnIa1mZF/9xadoxJtaLstqBG2QQI
 2iFp2DEEFEOgr8UqwKZiS5kZav4nfauaqhjHUupxkrZEWPSo9XbX0QeAuvFGhY9v6k2O
 1c5fG89iT8bZxJpCepC3R2wbgtrXNTUGFSGhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KlLBYhev4Wfr30ELlYvsH52U84dkhIKc99s8OuU9b24=;
 b=Dl+K+8sMB6mnsFtiTFced8qygPTLVm0r4P2osTviqT7QeDVuyDM8uVxUnnOcyxEsH5
 /2z1q57kuunRODC9lP4gXHeNWZ3xr0t7ioi5NDXZ8epB8pxnvUMelq3vJ6x20Ur6X7OS
 QmRaa8v/lnoUVkru5HZddRlF306JC4AqCiBn2JVt2ukkcfTuaoGL4W6n90KTIrSEIRgd
 84uyti+qnrSxoJkeHE4TxMPn92hqIDJ53g08OuU122QA0ONAvZ8G4IU+YcTTSyOT+0/q
 3YxlJ6GEf1abQkiR1YsR113gF1HkxdF2y1NaAjZsx6jOl1BeNfKfiaKDa057EuW4aetA
 8MTA==
X-Gm-Message-State: AOAM530b0Eyj25i5bHEGO4j1r6aryJCRgPsP8W2GG5ATrSuj87rKU8Pu
 D/nMwXX0Uvo5gqNoksygxMyzHQ==
X-Google-Smtp-Source: ABdhPJwI8ziC5/OM7tf5UKEvZbcS15PybCTYMTPLwIM6mRVaAnhqXfsGqJWqnsxQyXN/ZYuTJY7BoA==
X-Received: by 2002:a17:90a:184:: with SMTP id 4mr1482988pjc.148.1599817186148; 
 Fri, 11 Sep 2020 02:39:46 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:1a60:24ff:fe89:3e93])
 by smtp.gmail.com with ESMTPSA id v1sm1433465pjh.16.2020.09.11.02.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 02:39:45 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-serial@vger.kernel.org
Subject: [PATCH 2/2] tty: serial: 8250_mtk: set regshift for mmio32
Date: Fri, 11 Sep 2020 17:39:28 +0800
Message-Id: <20200911093927.608024-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.28.0.618.gf4bc123cb7-goog
In-Reply-To: <20200911093927.608024-1-hsinyi@chromium.org>
References: <20200911093927.608024-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_053948_994180_59FB8638 
X-CRM114-Status: GOOD (  12.44  )
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
Cc: Changqi Hu <changqi.hu@mediatek.com>,
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
