Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5AE9C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:34:14 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27BE561004
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 17:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27BE561004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MdEN7gVJFFgbYuxbLKDbyAtva+Tt3+ohLcZdG4k59mI=; b=aLw0FXxVXSyDqJBKiHWEcZkdn
	9wHKbq9SZeWSkoF0Vty90GGyufF2jb/1BDbHzGR8b5pAsrfRkIMNhyJW/SnF78DElWCoNy3I4zNPK
	k80kkBWoPqtudpJWOMJAMEP+FxsQw/TztltBm9X0z9feJspQ5+WgcCWLmNeyk7pWnKj/AyjqsUcDh
	CFbzZrjLsrXxxMxDEK2GVjXZgJHjGejRTqJXT67RPXlKWfnwBREOg0IIYPUWgGAPoFGZcRKjxrH8B
	KCcBQEgLDulYcWgsZ5rTfcG2MVUP9gei2nKNnvm7rZAR46r+8xPCMFIMBjvt21s+mvWAKQzHc3byn
	srTlr7aZw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lih7u-00FfEZ-1C; Mon, 17 May 2021 17:33:58 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7Q-00FfA6-2C; Mon, 17 May 2021 17:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=2Z4KnEHs7xum8C1o1fyhvi0Rl4fGVgrNoI+acmfQPiU=; b=QcG19imwdZhHjEAh+vvKR1vkUi
 zffAoDV06O2ddGBaocXrPFVV3fBzdwhjnRsMea9PM6cLMeamy541etW7E7iNlVXv//nTdi6JD1d+2
 3lopWxaqTTYyM9N5LAArjsAnQMWH+VP0gWRZrD46Ue77Q/UIQMArpb7fW4TQyV0FwjhD4PvDP6pBe
 9gseqZI4sBUPwWS+IsBNtZMX69+m8r0PQxl0VyVb2eFBr7nTIei6pnnaVcmUbibDpD2v0xh4t6nr5
 y5MQm0bIE1Q3v0nHp+ON4NZoyiw29ywZ/0Hwk8MMxwTCUfqCfRTejbWpNEOy/pXmtTauvo8EJxDat
 jklDPOEw==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lih7N-00E1Iu-LO; Mon, 17 May 2021 17:33:26 +0000
Received: by mail-pg1-x536.google.com with SMTP id j12so5132854pgh.7;
 Mon, 17 May 2021 10:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2Z4KnEHs7xum8C1o1fyhvi0Rl4fGVgrNoI+acmfQPiU=;
 b=II4ZQK+Ib6eu6M4ujmFkVGRh0lhlEXGy4OhNYHW/ayWazsn1Tih0VUQVwOoL9OfU1x
 jM+jnuudXCU2zhOtkwrDv6tVqA9VEJSmJs9Ofbc194+v3PHw9pvovOl8BXA8N2Uj/+eV
 DeHGsxJeP9fnG5JZeeAz39qR1mvm2BG8ETFLPryR2Ro/GtHqPKdSl45WVubkXVhd4KU+
 lOBzKpFSBUlvWd0MXX3+a92eSfb/1xAmfFI792M5guEwtDXHOKw6n8uZJbr+CSfEZgx4
 V8xfhWvrCdaPsrqWYkLcyIb07r15eqwXPxiCYZ4TbHPcSY7WTC2YMiA/adHG15Z9w9tG
 9rrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2Z4KnEHs7xum8C1o1fyhvi0Rl4fGVgrNoI+acmfQPiU=;
 b=NRXUfdsbNvrITsfFfQP3mjIdGfd/eOJz/rkagGXwR/UMfgD7d5zbp43biYxZMm59bw
 I0onlSFgdq0cvMqBFveMo6wu5kV5rdMoU3ADUtIQ4n8vhW54N9nT8qwb85Lszie+nTys
 8lwMVObPuShmqI7mk68MLLH38Z3CarkLIPxkyh2sSl6T4YGQoYn8U4npNXQuipjlpmwa
 o1tWxsS6fqjP+aH2jFpY+EEHNGvb0dLalDdjMhUHsFul3ovJVXyiQwJ7+NEZ/sD8PmRe
 GEyLTEw32B1v/3/sfnpb3CSzKzZuwdl+Ya7+ybCcXooZg3ikAHD6Gr6h9rcxF6He58gy
 MSGg==
X-Gm-Message-State: AOAM530rmkaSzvCJ/DZ0RpuHiIV49wiCKdwJjz3Yzs1uX5nJQssR1EcB
 drDjK0DnQ3/dEcVyjL5726g=
X-Google-Smtp-Source: ABdhPJz4dADr/6tr7cQGaBtlEp7PLgeEo4Ca+xmp6nSpRxKLIsbC8wH1/oh59FR+EwEyQ/tvm874pQ==
X-Received: by 2002:a65:558a:: with SMTP id j10mr634666pgs.404.1621272804648; 
 Mon, 17 May 2021 10:33:24 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:47e:c24d:6c72:a52:2c8:7df1])
 by smtp.gmail.com with ESMTPSA id
 c12sm10358296pfr.154.2021.05.17.10.33.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 10:33:24 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: lee.jones@linaro.org,
	matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com
Subject: [PATCH v8 01/10] mfd: mt6360: Rearrange include file
Date: Tue, 18 May 2021 01:33:05 +0800
Message-Id: <20210517173314.140912-2-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
References: <20210517173314.140912-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_103325_727253_250CF04B 
X-CRM114-Status: GOOD (  10.10  )
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

From: Gene Chen <gene_chen@richtek.com>

Rearrange include file without sorting by alphabet.

Signed-off-by: Gene Chen <gene_chen@richtek.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/mt6360-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/mt6360-core.c b/drivers/mfd/mt6360-core.c
index 480722acf706..de6cf8edff0c 100644
--- a/drivers/mfd/mt6360-core.c
+++ b/drivers/mfd/mt6360-core.c
@@ -5,14 +5,15 @@
  * Author: Gene Chen <gene_chen@richtek.com>
  */
 
+#include <linux/crc8.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/core.h>
 #include <linux/module.h>
-#include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
 
 #include <linux/mfd/mt6360.h>
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
