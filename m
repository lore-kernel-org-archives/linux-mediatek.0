Return-Path: <SRS0=2T+p=G6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E25C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 09:34:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E536320770
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jan 2021 09:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E536320770
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pEb1G1rjIap5okzN7DNVLvTyqNjCiLKbN8VAubBj+7s=; b=ONozLPpurdvMrSL46X7L1oxR4
	12OSTX/5j6oO7x9+LhBhmR/d7TJ9QmU48Pq8kIgvScLgy3SU0elD1LXlsHBmMO3oBp1da+od1weyl
	WEiqmImFwhTT5+Je0M1qaya0p76rSW8Er07pVDXqvOWpwNOC7khEKjk89DV2CUq0NP6VHWHSkOFXj
	FfWjTFsT9TlwCe6o35WTdwxR+vuSvie0FZSdG5pa45SfQopfGzW6EtLbDP4d/i3ZCsVn/fPVworT5
	LgZfFbOUagqdL0Y7GiJInqB1N1exxEjIio1oIwBBGQZDwhTWJ2E9MpwaWJDnAUtu7GBiS7wbUm+Iq
	5m8r/6bdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4gFe-0005o3-1F; Wed, 27 Jan 2021 08:32:34 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4gFc-0005mv-Gb
 for linux-mediatek@lists.infradead.org; Wed, 27 Jan 2021 08:32:33 +0000
Received: by mail-yb1-xb49.google.com with SMTP id y1so1651940ybe.11
 for <linux-mediatek@lists.infradead.org>; Wed, 27 Jan 2021 00:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=+a0m3LuKmOdctmWgOFSSQsFlabVB3Kaf/W6pr4iH3tg=;
 b=awsbucR+8poF69HXjAAN3EvY1WueYbQJgcbdWYLBHw5zJmrUYVPK2tfp5SucTtrahc
 Cwz9dSeBoa+/nQBuQ7r2Ehxi3f9HFsU7eeGrKIIMjIXHg+48KUfQsOQw1eDn2+bVWJbF
 z05CejH8BXUin/1Rq/zyCIdFlNu2Fu7O18Q4Ggw3fsGc936oUlMCUW04HFQqfexVWNez
 KOXE1VI9b9GBLMgl64S0AnRKhFb8bfN4DmoQdgNfTX84ltRkVoVOnF8xRr49qqohahU/
 e2Ro5EtxmegUdrjz00giu/FNnGh3uYlLJQlp+Wgir+Jbv4pCuO4bdn5EHak/ZIDwTHB5
 dkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=+a0m3LuKmOdctmWgOFSSQsFlabVB3Kaf/W6pr4iH3tg=;
 b=L7OI7ie2VZNA9RbJpxUnCfoV2sU6t7q8vBvTnjR9k7DiXuLxoL1x4KX4op2CxwwPYB
 aM6CQDBgmlBeNI9w6OsL5gTo3jrMgXVaXd56jRzTcFSMSxnTDK6pm/Xyzgx4GqQ0N81B
 O4cZ33lBtvFrqyqy4NcFou7WeBOqCI+aifflbSWKM9uHQXC6pP53O6+50c5Q4vC6YXNA
 UZWFRTwCPKOCx1Ey8dUYOzAUN/vJwyrJoG+PNpPTAawO4s8G0Scjl5NPAb7vemFOKW7m
 iUN9cDg81TEGSGGmckfJT45Fe0FHPZU25z5ARqNCrZOJPt6Kfv4Ey6PlKQn4Af8QgRef
 SScA==
X-Gm-Message-State: AOAM532zLT7xQokeXmXB/mS610PQZZDkDLqfJNgmDKHjauk58fIqQigF
 zB25niJMVFPUXT6mrKStMrWnOdbOCwgn
X-Google-Smtp-Source: ABdhPJya2SzL3qr8wMjzd6kk7QFftN0tLzBSfhW5Tsa1Ft4O70vVR3PxMz0LDDgj3J5gTNnGfIVoeWnhokM1
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:b:d17d:c7bb:69a2:7e2f])
 (user=tzungbi job=sendgmr) by 2002:a25:ce08:: with SMTP id
 x8mr14658300ybe.164.1611736348965; Wed, 27 Jan 2021 00:32:28 -0800 (PST)
Date: Wed, 27 Jan 2021 16:31:33 +0800
In-Reply-To: <20210127083136.3745652-1-tzungbi@google.com>
Message-Id: <20210127083136.3745652-2-tzungbi@google.com>
Mime-Version: 1.0
References: <20210127083136.3745652-1-tzungbi@google.com>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
Subject: [PATCH v3 1/4] remoteproc/mediatek: use
 devm_platform_ioremap_resource_byname
From: Tzung-Bi Shih <tzungbi@google.com>
To: ohad@wizery.com, bjorn.andersson@linaro.org, robh+dt@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_033232_634616_706813A4 
X-CRM114-Status: GOOD (  11.01  )
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
Cc: devicetree@vger.kernel.org, mathieu.poirier@linaro.org,
 linux-remoteproc@vger.kernel.org, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Replaces platform_get_resource_byname() and devm_ioremap_resource()
pairs to devm_platform_ioremap_resource_byname().

Note that, not every pairs are applicable to replace.  Especially when
it needs to access the resource struct from
platform_get_resource_byname().
For example:
scp->sram_size = resource_size(res);

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/remoteproc/mtk_scp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index eba825b46696..d83e1164f02f 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -721,8 +721,7 @@ static int scp_probe(struct platform_device *pdev)
 	for (i = 0; i < SCP_IPI_MAX; i++)
 		mutex_init(&scp->ipi_desc[i].lock);
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "cfg");
-	scp->reg_base = devm_ioremap_resource(dev, res);
+	scp->reg_base = devm_platform_ioremap_resource_byname(pdev, "cfg");
 	if (IS_ERR((__force void *)scp->reg_base)) {
 		dev_err(dev, "Failed to parse and map cfg memory\n");
 		ret = PTR_ERR((__force void *)scp->reg_base);
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
