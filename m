Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379EEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 01:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPrtKXtq4qyhWu5o6BvIQVhQZeTNkHbfrZBU4KflF1U=; b=k7+E2aOr4R6FKoCzeInIAM3/sw
	qrF/v0TJ2GMsyCyJoKSGE9qEISJBeqyyhdrBeS3fBnMk1BziLWBH/JS1TVEjbYhXxBrnUhOJ42G5k
	t+voJ2SWRNFUCQ5JqRFra5U9lZsavRFpwczXSbKERpC9rN06xJbmdUqgHd2qyuKeJGOSVr54GG2H0
	khQBYvX93uCZtz5HfAggC4Q1mxGbrPZgog9FUf5GaIrsX7ZNMrshvyGB2wFO5DRqmn9sJNPU5TABG
	cQfaDBLOs5fzGpA9xpEFmZbJnxvzhmQYOjjt0iF2Z69mmkE2qN7lIkBUPtKP4SnHnuNeSZpxRb5iY
	0koaUvUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Mi2-008x3N-GN; Wed, 29 Jun 2022 01:41:38 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6Mhg-008wtt-P6; Wed, 29 Jun 2022 01:41:17 +0000
Received: by mail-pf1-x434.google.com with SMTP id 136so8517840pfy.10;
        Tue, 28 Jun 2022 18:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=VPrtKXtq4qyhWu5o6BvIQVhQZeTNkHbfrZBU4KflF1U=;
        b=hkx13qBdyfwvDRjLf7bPh5cXqfEkjL+9Mp5yt9EbaSpbCItGkXK69DXTcE+WxPlHth
         3E3xXl3Oaq3WF+FEox6KG/dTIL/YmVKSSw6qiZ2x/wBq5dbdv75rO6VYh+7oZKd7I8Pv
         lYX2roR43c+eBF8Wk5PvX3JJwwtB+ElKB7J/BVWLWXtZYc8N2124Poc20XLw08ebY+/q
         qrQ4wz5FD0HFQLfUGDzk/94yWX17bpcXeWWf4QF3qofkdLB1xmOM/BQwnsAHPB1ww41k
         TvcxsR42R6wJCii5UkUTuk4dCQU5NvCnzcpUfsq4lnqZ5uoaBpHkPZVrPbQc+1Uqyeew
         5wMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=VPrtKXtq4qyhWu5o6BvIQVhQZeTNkHbfrZBU4KflF1U=;
        b=jn4aVi7R5EBvlsFQh6OVAJdcZKZ53EdTRjTSf3D9PonNkxr0iy8DcIDA+Had8XfrQU
         Rm3rDknThwXu3yJGQIp4lvrvYQjd4WGV93yMdKmmctjwE+2Stmu7k/Ei+Kq4j9+GQ8sc
         FADhwCpfV9HafETH2FDGkh8aNPLAd7l8NDf7U6ekn32koHWdLZdi0ByJj7XXUusd9VME
         QicXAKkG0ZRSuoaEXDMDM040TSQBmSnCNvudXOeiaZBzYm5jpHRaPpM25Dnu89KmNgy5
         LLQEptmT5axngLVrK/9CFhWu4VyRnjrFUUUEZJSJEJPApREylKqmSgNK0/rGojaqytU/
         GTDQ==
X-Gm-Message-State: AJIora8XSJjKASpki2KgMe/2RTgId+d2WT+0Rfk588OWndh8n7LpXy49
	lNhVq9Vx11kPooXbK6CORsM=
X-Google-Smtp-Source: AGRyM1uG6BxKE8W+97XkRAiCdqoSnQSGJ5ap2Q3rJirhPCQLRDuMDEjwijqDdlb2irmBj2SOir0Aig==
X-Received: by 2002:a05:6a00:1a48:b0:522:9716:4e0a with SMTP id h8-20020a056a001a4800b0052297164e0amr6478757pfv.22.1656466872983;
        Tue, 28 Jun 2022 18:41:12 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:46a:3e21:914b:bb3e:3e56:4806])
        by smtp.gmail.com with ESMTPSA id u15-20020aa7838f000000b0052592a8ef62sm7182965pfm.110.2022.06.28.18.41.09
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jun 2022 18:41:12 -0700 (PDT)
From: cy_huang <u0084500@gmail.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	matthias.bgg@gmail.com,
	chiaen_wu@richtek.com,
	alice_chen@richtek.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	ChiYuan Huang <cy_huang@richtek.com>
Subject: [PATCH 2/2] regulator: mt6370: Use the correct header for platform_device_id
Date: Wed, 29 Jun 2022 09:41:01 +0800
Message-Id: <1656466861-7737-2-git-send-email-u0084500@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1656466861-7737-1-git-send-email-u0084500@gmail.com>
References: <1656466861-7737-1-git-send-email-u0084500@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220628_184116_853620_779FB84B 
X-CRM114-Status: GOOD (  11.36  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

'platform_device_id' struct is defined in 'mod_devicetable.h'.
Even 'of.h' also includes this header usage. The 'of.h' cannot be removed
due to 'of_match_ptr' function.

Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/regulator/mt6370-regulator.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/regulator/mt6370-regulator.c b/drivers/regulator/mt6370-regulator.c
index 949b2c7..e73f5a4 100644
--- a/drivers/regulator/mt6370-regulator.c
+++ b/drivers/regulator/mt6370-regulator.c
@@ -4,6 +4,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-- 
2.7.4


