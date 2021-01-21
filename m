Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F667C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:43:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05912206FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05912206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yusFzoICyuk5eGr49Kgwpm8trZ0Nsna4xEDGxLiVCW4=; b=DmQntADnlWwIJ23lPVqNXQ7AK
	RDUA9K2m/lvMcVQ1hQMBuvZG66ynPqBfMGr3BgrpVBzkLjeBTGx5CpLRyrjLRwerLowiNBGC4qwJB
	dhIqZbWo3HBBI7dvAher3M5LDCCe001zbnC86j/5xb/+vDYM7s6/pUns8CtzuzXVszuh7OsuCXgv9
	ZAuC6nPzTKj1wCNv95h+ky1UCJGnaDtGoJPHxa3UtGMC37CRJXdF6FHxQb4dNoRI9tN8zyrfOkWhC
	e3RP78J61VRfj6ZR9swXBIdWRWzXBdNbL+AmCnCuU8bCNDFqbJg1zOo5+7p2vfsUEWt4M5/aUdlso
	baxvCUVHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2RoP-0007ym-JQ; Thu, 21 Jan 2021 04:43:13 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2RoN-0007x2-H6; Thu, 21 Jan 2021 04:43:12 +0000
Received: by mail-pf1-x435.google.com with SMTP id m6so790766pfk.1;
 Wed, 20 Jan 2021 20:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IcYiMBsXjgXqsCUOACpj4n3qnT1OSjGqlWhB/zIbApI=;
 b=Bng3BsGk+C8xyT/tdfY1mg36WQRvRfp+hn0N4TAQOl6zzjWnogwce20ioIBmtwVYHu
 0QfGZFBkMasK3JbJORN8sjQD4LAhBc3il+zzdSWfofpRbL44uKINPjAwdlUW3AO8/eqw
 u2aP4wKc56/Q45TYbGi1nogwjvZ+5p/73MFSqillVMqLhqiw4v36M1HarMS2pLhtoqzx
 BsF4+BKRNrDzicRUQIWo9cq/8rSYIl0bUcFgHGI6DxNtwxDRwod/kzRexZUmeOsQae2D
 NZcbzrT66+ixLhF4aT0Edzs2ayKGCVrTODnjtpNNvEG4jJyNFPbiDN5H0I9IqbEb2egX
 Jo8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IcYiMBsXjgXqsCUOACpj4n3qnT1OSjGqlWhB/zIbApI=;
 b=FUGMp79ZJg9KkbZiHPkUOhRVVEB6M80e3XgKlzzIqYEymwCm1WrpiRbDAin9NQPnpv
 SZdIn3scNsRRNw48EsNoPTa5BLUOQZsHyXika8JJBCjzEwZDA41bOb8SDNzTJ5JXOO6U
 y4WmIKqv2EyNhDKj4wqDqZORwYCjVuG4LsC9sHeMlkU1g27kd7KgLCYniy0iVAasO32r
 zdyqWOFzst7i+XPrzBA1I+PU7olvomQ0Rfzgrsokp5B/urDVYluiNIWIZ6VbVBjPAzUV
 UmGNOC4xSphuUmzD30HsSkwy//FXeXwhOWHPGEhnUKaz1osI51Xtu/XDuUbT3N2rld6m
 Z2Ng==
X-Gm-Message-State: AOAM530r5sDqUNXRY9ONcwsyeB5RZkiqi+zxqH527OkKsplvZ78wlw58
 VYl6PRkZBpP8m8Lz3KdXEWc=
X-Google-Smtp-Source: ABdhPJy31Jui6z63cGBX2FIWsvZJsQOR36SUcBgxzABGGw4ToD/zOTXFb8AWe7UJjFlBSFEMvOW8Wg==
X-Received: by 2002:a65:5ac1:: with SMTP id d1mr6123421pgt.447.1611204189442; 
 Wed, 20 Jan 2021 20:43:09 -0800 (PST)
Received: from localhost.localdomain ([49.207.210.174])
 by smtp.gmail.com with ESMTPSA id jx15sm3916014pjb.17.2021.01.20.20.42.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 20:43:08 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v4 08/19] crypto: hifn_795x: convert tasklets to use new
 tasklet_setup() API
Date: Thu, 21 Jan 2021 10:11:15 +0530
Message-Id: <20210121044126.152274-9-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121044126.152274-1-allen.lkml@gmail.com>
References: <20210121044126.152274-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_234312_305642_A91F6ADE 
X-CRM114-Status: GOOD (  12.77  )
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
