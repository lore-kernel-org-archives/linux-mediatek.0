Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 685F9C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:43:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AA716613FF
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 16:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AA716613FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pc9UWxOOqEivBF5j7wlag192V5lqEZpXiGC2ZwgPUvo=; b=aVQcMTaXo4CQ0BJixXErJzcVe
	PRND59bSP9S/VjrU7o+/B9Ixu9lYwnvSyzfJulDumNat+7eugHFfGwFS2qmwekG70ay8JglzzRAc2
	soYRSASip22Ok6JXcmY7LwZWOu6/tuAnN3/b+pgFoCkaKp+n90pna40m4t91aQreqGQa9+5CZFprv
	mf6HFFJ3U5JRaDo7hBofmCjWs/XhphZPUbgKApdCZ6qtPIkFg8H0MToNdEjBfkS2kP5pfHDf5OgQb
	Nr931L7OIlnR8o07QlJLAc/meBkMPGqBgLoGHXwUHMqBUjgw6n+H0tTbkXsn/Yuqi4VG11AnMTU3Q
	yem2NSZ3w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbnHv-003raO-Hu; Wed, 28 Apr 2021 16:43:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGk-003rHC-U6
 for linux-mediatek@desiato.infradead.org; Wed, 28 Apr 2021 16:42:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=GXfkThm6aq9/u6OAWtarhuCMLfUI31qoTKi2l6tIb1k=; b=xEfizALaVAfFssYa2E2irTQ6Y9
 7pgKQ6Wpg5LEm5iYmI+bzdhErDvk60iY8mRjS1NNGnxdR5rTkS80iKaP5EZtTnqSng6LCyyy70qpZ
 Fsj7hha/3nzg6gdQ/2b8zjvnblzYTal4r6xfENH/Xrm94HWEZiYnF8CrXDT6y24H+sn8KfCvYvgnz
 EmJEzi6hXjx8VQE9XISvdx8sG+qT3Xm980ftS2TL1F/dwEAik4df0eDtflVgesQ5uD1yy+8mFnHgs
 Ij0ZbEfQlk+MMsj/AtYdbOR/X3vkPqaF7Kl5VZ2ZloMmAUP7SnIpmI1T6aSZLtzqS74QXukJ/K6nL
 uOj8nDkA==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbnGi-0001gn-Dh
 for linux-mediatek@lists.infradead.org; Wed, 28 Apr 2021 16:42:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id g65so5044701wmg.2
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Apr 2021 09:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GXfkThm6aq9/u6OAWtarhuCMLfUI31qoTKi2l6tIb1k=;
 b=xmU+qrHv7iCFgEre0umPEDJpoZFKUJz6PeWoEJP7kgqcPPnt2GlvfbWlgxgRcRoW5m
 Hlbp1sBTPIZTSY3NmfBfy9a97mH1Ry/9oJ5dcLzE9476WrKmNNJgX89m+k5t8oVi5Dms
 2qAK3qEAH2yE5ZjhCOHOHK4iWR8MUoPxkBT+AQeDHe8vTVmaktGMpJ5A/41cO1LvIa7Y
 Z5ROiKowdVjW+OqMPGsyQVbM1GmAIGwBNOv8zs0gxF+14n4x2xFcNadLaVm3n3zmQbz5
 EZXHsua4uW1IXTUQ3N4/HYs5Lj5SNmLVLVmkbVejPCblZfW/+wdQQmgGssV+YiLqRcbn
 8rBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GXfkThm6aq9/u6OAWtarhuCMLfUI31qoTKi2l6tIb1k=;
 b=QS0947JsDT5Geh1I0UtY3RXWFMUy/whHRuesnN2woF+sA4RthBZzrVDDtrzo0iflyW
 6xceHZWWQ9oZyNj0K/nFMme4YyGaKzNBZquVw4XfOlVBA5lQ+bFmlSl/YbX67S6Mjq9R
 7mkEBxSHQUfjVBNZkiWlbmXiQ0sOfGbh5VxiXJ5RIIMFR96X5avdYOgnTHzVgrx6vbs7
 pOb9XkM+udXwfkHfftYMsQdjLlNi1nQJjk2XHOD7zpVKKJAqL7ELECTVn1lcf2PmPu6h
 YatKIN/OUJi3w6aS43DwFRRxHg0bk2emXIuvwBlGxfcW0a/YLJv2RL0UCW/iwi89FC67
 4x8A==
X-Gm-Message-State: AOAM530iuJXKkf8AULZZZmd008P5JpVIBVMtdFX6ozX0kuHBtT0Mj5tG
 +JeJ/+jstUpn1Z2+/X2UqOj/fQ==
X-Google-Smtp-Source: ABdhPJzejFayeWt08Qeq2ENMXWRVl7HiK9xF6puIKoeU6c94FV5RAzpo0AXm6LqYCBzjp3xJke7duA==
X-Received: by 2002:a1c:398a:: with SMTP id g132mr5691770wma.114.1619628151214; 
 Wed, 28 Apr 2021 09:42:31 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:5864:ddd1:d623:f912])
 by smtp.gmail.com with ESMTPSA id o10sm351299wrx.35.2021.04.28.09.42.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 09:42:30 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: fparent@baylibre.com, Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] mfd: mt6397: Add PMIC keys for MT6358
Date: Wed, 28 Apr 2021 18:42:18 +0200
Message-Id: <20210428164219.1115537-7-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
References: <20210428164219.1115537-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_094232_486997_3F0B8957 
X-CRM114-Status: GOOD (  10.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds compatible strings and interrupts for pmic keys
which serves as child device of MFD.

MT6358 has two interrupts per key: one for press, another one for
release (_R)

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/mfd/mt6397-core.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
index 8738b5524783..13a5e15e9dd6 100644
--- a/drivers/mfd/mt6397-core.c
+++ b/drivers/mfd/mt6397-core.c
@@ -45,6 +45,13 @@ static const struct resource mt6397_rtc_resources[] = {
 	DEFINE_RES_IRQ(MT6397_IRQ_RTC),
 };
 
+static const struct resource mt6358_keys_resources[] = {
+	DEFINE_RES_IRQ_NAMED(MT6358_IRQ_PWRKEY, "powerkey"),
+	DEFINE_RES_IRQ_NAMED(MT6358_IRQ_HOMEKEY, "homekey"),
+	DEFINE_RES_IRQ_NAMED(MT6358_IRQ_PWRKEY_R, "powerkey_r"),
+	DEFINE_RES_IRQ_NAMED(MT6358_IRQ_HOMEKEY_R, "homekey_r"),
+};
+
 static const struct resource mt6323_keys_resources[] = {
 	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_PWRKEY, "powerkey"),
 	DEFINE_RES_IRQ_NAMED(MT6323_IRQ_STATUS_FCHRKEY, "homekey"),
@@ -96,6 +103,11 @@ static const struct mfd_cell mt6358_devs[] = {
 	}, {
 		.name = "mt6358-sound",
 		.of_compatible = "mediatek,mt6358-sound"
+	}, {
+		.name = "mtk-pmic-keys",
+		.num_resources = ARRAY_SIZE(mt6358_keys_resources),
+		.resources = mt6358_keys_resources,
+		.of_compatible = "mediatek,mt6358-keys"
 	},
 };
 
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
