Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C68FC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 09:42:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B81561077
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 09:42:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B81561077
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aPHQ7VwVwLYQ/7zjAOTEzrLe5Giuk5/n6u4hIPZxrFE=; b=LTGx7LhSp8riboCkjD9nP7Njv
	Q+PtSWMxMSqUoNKqjdul18XD9purL1Xm5MCYkBt1UCu98kjGZAAj3NkDuzWvtErBWigf4fwOGzaSb
	Oxxu2iU2gF2N25mOOgEZwfi0Jbe5V+iADd4ySckUWVxunUzYMcdb9tvD4dYTCYvvt6zuP/oLi27bl
	P0kWhQ96Qg969AXWaQl3DpKplCKHqdhq3EHbJQHQia2MQxJQ35aYr+oV+HQ1nwZyGYZNrbwKWNsC2
	G+5fgJOpEPrUqvWZM89IZhkCFZwHxQEFa5gLz2fxuffc88GbZwKL857D7ZquQPxwI/FDrrowYWfz1
	0oa2sa3Og==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leaW3-003qOX-4Z; Thu, 06 May 2021 09:41:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leaVe-003qKc-7G
 for linux-mediatek@desiato.infradead.org; Thu, 06 May 2021 09:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=KDuP19RIvFr3oYQnO2ffHmKNK3OSRhOK3RHFKslMECA=; b=1ODKja779pbaEZSTKA6SWq1e+F
 MkgjyW8rhivNlIeXjcwc9pBZAokE3jphNNrwwwq3IUajlloaSPy4gUszUehFMJXZ/L/Pt299fAaZo
 muvyVBdjtAjoW0x3QQWstmLW1H+gg/hb9rCbnou8iUVCqGvOkc/mHiqnZVoVFDNZBU4y7qda96AC+
 q3gi9fne19RiRDVNipcbVgQ2gI9/tugy3yDRQNfc1H1Bi9vIlIU6sCKhgX2xYCbkBhZ3z8x26W8tM
 rBWnV3cmVVaSh7z646RmN0qlS42GI12s2xgtOwlDfNOspG72SHZuCMb8OAq1sCgGmSatTbqY//VX1
 UdRiL7rw==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leaVa-005uyA-RI
 for linux-mediatek@lists.infradead.org; Thu, 06 May 2021 09:41:29 +0000
Received: by mail-wr1-x434.google.com with SMTP id a4so4882339wrr.2
 for <linux-mediatek@lists.infradead.org>; Thu, 06 May 2021 02:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KDuP19RIvFr3oYQnO2ffHmKNK3OSRhOK3RHFKslMECA=;
 b=k0Xs3EkXrnyoP2PbgSrq8y2ftS9kgvDiDnida+rHIzEoM7j3qDw36lGXYrV/8N/vmH
 idvneoPCQPd45bMDsZKDKLypoyJw9q97iEl81Cs5tbrs7Ui0U1jYyg+AmwvayaGeH1Pe
 YFJbH/UH0XRk6jO8wJcn+2OOoHkjbCm2kg+zuTz6HTt7XEH/LqRUOLVmF/AR7g104Qsq
 BN3qBi1QKZ9LmDznT+hygxT234aAmLA21J7C9Ybe3SU8n6moRzYxHhzRG277VeIlgM6L
 zjQbjWWy6iFfHcYrFT9zuTemmuFru1UPK82rVg5euKSzZ2cnVXOBSMeVcHd39lKV6V7o
 MHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KDuP19RIvFr3oYQnO2ffHmKNK3OSRhOK3RHFKslMECA=;
 b=ZeXAvExNFv+IGGWrQ5FLPpM+1hyPeX4iiTH+oU6WPKWYdRLMIZ98AfMRYJ0mOkkRvq
 AWt51JyTUP6LyH/ae1eUXM4KJa8bMAutrYdvUW+y6mvPCHFOk4Y1K+FfxERcAdCX4e0k
 bGG2JNLKeKwVx/12nCA1XolIPh6VUpkZ31yvKxyR4+CWkV7Jdlo59crrhChVJ1elmfFH
 QdmpBV1NmxiKMhW11ffh2LrR3A2uIhXSPNTdL6oeJBOlfN9uKj7jF121JFsn208IZyPr
 MKZuDepwnMYJ6d8bYL/IRCRoWzofDd6Nd2fdcoPgruE7o/wj2cQmI8k2VdjZUCv75uyo
 aWMA==
X-Gm-Message-State: AOAM531SEkglHufezfNaRJxM6Yji9V6Fhq2kEB2689aVIYNoZAFBmWIR
 K7sISW+N43dILFXOZ1Y9/tKTdA==
X-Google-Smtp-Source: ABdhPJzwRD5YwKJypFE4rH6ogHDtfIjZiYWqGARQDqBZhdYYG/mrrB63EhsuHj3vNlIwsukv1vsMMA==
X-Received: by 2002:a5d:60cd:: with SMTP id x13mr3784698wrt.377.1620294084131; 
 Thu, 06 May 2021 02:41:24 -0700 (PDT)
Received: from groot.home ([2a01:cb19:826e:8e00:2492:c5b6:6c3f:6de4])
 by smtp.gmail.com with ESMTPSA id y14sm3360421wrs.64.2021.05.06.02.41.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 02:41:23 -0700 (PDT)
From: Mattijs Korpershoek <mkorpershoek@baylibre.com>
To: Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: [PATCH 1/3] mfd: mt6397: add mt6358 register definitions for power key
Date: Thu,  6 May 2021 11:41:13 +0200
Message-Id: <20210506094116.638527-2-mkorpershoek@baylibre.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210506094116.638527-1-mkorpershoek@baylibre.com>
References: <20210506094116.638527-1-mkorpershoek@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_024126_903237_B9292ABA 
X-CRM114-Status: UNSURE (   9.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

To support power/home key detection, add definitions for
two more MT6358 PMIC registers:

- TOPSTATUS: homekey and powerkey debounce status
- TOP_RST_MISC: controls homekey,powerkey long press reset time

Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 include/linux/mfd/mt6358/registers.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/mfd/mt6358/registers.h b/include/linux/mfd/mt6358/registers.h
index 2ad0b312aa28..201139b12140 100644
--- a/include/linux/mfd/mt6358/registers.h
+++ b/include/linux/mfd/mt6358/registers.h
@@ -8,6 +8,8 @@
 
 /* PMIC Registers */
 #define MT6358_SWCID                          0xa
+#define MT6358_TOPSTATUS                      0x28
+#define MT6358_TOP_RST_MISC                   0x14c
 #define MT6358_MISC_TOP_INT_CON0              0x188
 #define MT6358_MISC_TOP_INT_STATUS0           0x194
 #define MT6358_TOP_INT_STATUS0                0x19e
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
