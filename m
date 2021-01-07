Return-Path: <SRS0=j7dB=GK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F416C43331
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:30:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FC592335A
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jan 2021 12:30:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1FC592335A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yusFzoICyuk5eGr49Kgwpm8trZ0Nsna4xEDGxLiVCW4=; b=jsDzoOhoWwCkN2QvPrAGMxuwA
	3TE7yogP9AxMtuc5/qlXZV3+2HNukgEPIsDj3XYa3/i3jJf+ZZztZiq2bXtiRUHZzIKs5fIrQQTWi
	LuSV+KuFVoq2Mn3mDol13TSt61pX54ntDV1QInWeb1feji1HnFyne+cw3U6rykTk30XHA8eoe5xP1
	ICPaJqIp6T/hSvDfKma7Ax/uJxMhYhre20LzTIK8ROyIN//7R0AoJ+RdcIpcE/DYa7p2ePwpd5WFr
	HXoIq9ZypmThuHTHK1dQTL68WB0deXE5aIwqRGmZ4AUFSMVlTDmE1/JB+WJiSEs0v6zVg8lnlOSP6
	aCIqNrCeQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxUR7-0004C5-QZ; Thu, 07 Jan 2021 12:30:41 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxUR5-0004AA-08; Thu, 07 Jan 2021 12:30:39 +0000
Received: by mail-pg1-x529.google.com with SMTP id i5so4757410pgo.1;
 Thu, 07 Jan 2021 04:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IcYiMBsXjgXqsCUOACpj4n3qnT1OSjGqlWhB/zIbApI=;
 b=q1b14DkzpJRGPgQ2ngw61EBHyRojXOhmeARI7hubXPHWZuJ3ZbCQfQzA+Vg00Ji7oN
 eglKJajT/phzHNQdYRWyowE60icmapabNDIYHLcMsSGODXVR4fpdciDdCrO9q5WR2NbU
 Q9p/jU8+M97ZgPsiDx95fcTwUWO7Aj8NfhkPCmfEjaAehVV0TfU+lG8hYT0bH6zWhp0v
 e7EmYHPq+Pm8eCmjsyO8DmmO+Mp3YYK+9dT08gsLBSU8uvzy2wozGxVK4R+1O5tmkmvN
 VZSAcN/R5jx/0FmSw+VwcZ3O8gih4wxKUiKLLMVFbDRo19UMdcyq/Mc6JLZ8zr2v9UtP
 BmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IcYiMBsXjgXqsCUOACpj4n3qnT1OSjGqlWhB/zIbApI=;
 b=HBBJg8PL4UqbF5XpUw9uO/PvwgYbc/OFWhDaNU2uW36EQCRyPA0/C9BPd4kfrPXhaX
 1sktt6O43v9VDojAfvxyrBUFg9gX932ZlzrG59q1GMkmv9HH+At7KRwFIBd22ts3ANQc
 WbUPnPzCH8mSm7lkjIYraCFjbV+biuGru4AdoH7YkNMjsh+732/x0uUQdd9TPkv88xvi
 bvYJ720XqhcqsQuS5CWqWYHCdwtXyrwtdlGcGZK3VF4wbu0l3QsuwnNvQed7SHVGDRFI
 qtr6bjYtijZCuBlydHm14czfxkjOGo0jh7OJ2ctFZ53g64tKXJxcuebJp9kV0iL4ammi
 fPvA==
X-Gm-Message-State: AOAM530geFmNGiT+Op931SQ1Rw3XJQiOVY2uIMLpPQS4JQ3HpAgkhRyu
 NaxKBuwzfyMrYJjyRDlT9Rk=
X-Google-Smtp-Source: ABdhPJwRdfOyuDoYxkXBo3Lx4+KPzBzDxEcsdT+IBiU4+pw8wU/dgoW9f8IkVaCL9kQ9AK1QuLGQMg==
X-Received: by 2002:a63:605:: with SMTP id 5mr1620892pgg.144.1610022636869;
 Thu, 07 Jan 2021 04:30:36 -0800 (PST)
Received: from localhost.localdomain ([49.207.216.201])
 by smtp.gmail.com with ESMTPSA id h12sm6356014pgk.70.2021.01.07.04.30.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 04:30:36 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v2 08/19] crypto: hifn_795x: convert tasklets to use new
 tasklet_setup() API
Date: Thu,  7 Jan 2021 17:59:33 +0530
Message-Id: <20210107122944.16363-5-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107122944.16363-1-allen.lkml@gmail.com>
References: <20210107122944.16363-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210107_073039_066198_2BA328C8 
X-CRM114-Status: GOOD (  12.64  )
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
Cc: giovanni.cabiddu@intel.com, alexandre.belloni@bootlin.com,
 aymen.sghaier@nxp.com, heiko@sntech.de, qat-linux@intel.com,
 jamie@jamieiles.com, jesper.nilsson@axis.com,
 linux-samsung-soc@vger.kernel.org, horia.geanta@nxp.com,
 k.konieczny@samsung.com, schalla@marvell.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, ludovic.desroches@microchip.com,
 thomas.lendacky@amd.com, arno@natisbad.org, vz@mleia.com, gilad@benyossef.com,
 gcherian@marvell.com, linux-mediatek@lists.infradead.org,
 lars.persson@axis.com, matthias.bgg@gmail.com,
 Allen Pais <apais@linux.microsoft.com>, john.allen@amd.com,
 bbrezillon@kernel.org, nicolas.ferre@microchip.com,
 linux-crypto@vger.kernel.org, Romain Perier <romain.perier@gmail.com>,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Allen Pais <apais@linux.microsoft.com>

In preparation for unconditionally passing the
struct tasklet_struct pointer to all tasklet
callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Romain Perier <romain.perier@gmail.com>
Signed-off-by: Allen Pais <apais@linux.microsoft.com>
---
 drivers/crypto/hifn_795x.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/hifn_795x.c b/drivers/crypto/hifn_795x.c
index 7e7a8f01ea6b..47f7bb43477e 100644
--- a/drivers/crypto/hifn_795x.c
+++ b/drivers/crypto/hifn_795x.c
@@ -2445,9 +2445,9 @@ static int hifn_register_alg(struct hifn_device *dev)
 	return err;
 }
 
-static void hifn_tasklet_callback(unsigned long data)
+static void hifn_tasklet_callback(struct tasklet_struct *t)
 {
-	struct hifn_device *dev = (struct hifn_device *)data;
+	struct hifn_device *dev = from_tasklet(dev, t, tasklet);
 
 	/*
 	 * This is ok to call this without lock being held,
@@ -2533,7 +2533,7 @@ static int hifn_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	pci_set_drvdata(pdev, dev);
 
-	tasklet_init(&dev->tasklet, hifn_tasklet_callback, (unsigned long)dev);
+	tasklet_setup(&dev->tasklet, hifn_tasklet_callback);
 
 	crypto_init_queue(&dev->queue, 1);
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
