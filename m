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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6974C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:42:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84F32206FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 04:42:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84F32206FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dkwS2nkRhtDgd7va9wmmgEh5uZDQuVExfdwkNpLGewU=; b=onN/BB1yBoUQw8nLrpZBGUomf
	5X1UQyCigfUXp6n3kt7KVkGJ3pIRs1s9jZympAsOKNi12oytgaT+I6w3W2/d6J2FQ89rI0yFMZQjg
	1xPWYADQvu/LcuqH07MVRJKjVUZdGSGabrROKPxgacX9v2wkWKEsoMpZhuqch+R76oHjj6Pvz9pRp
	Hqs/mAkLhCqGHawHv5oJ8JfY8sbvN/6B2iVlguew72e5hDkvVyDsZXL4m5LKTV8gEopddvD4Lb05f
	RXnBhMjE1NHpgToXTwnDpDIDgyFqfUdcnq0hjHqts1bvDTSllmdD8ylBs+d0+JdF0aQT2Hdq5hyOK
	kwuMqC13Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2RnM-0007QF-KN; Thu, 21 Jan 2021 04:42:08 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2RnJ-0007Oi-MR; Thu, 21 Jan 2021 04:42:06 +0000
Received: by mail-pf1-x42a.google.com with SMTP id w14so784669pfi.2;
 Wed, 20 Jan 2021 20:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qu9jTq4Mhds1PLReGFI6BuQWWjoITkJw1sqRT7XAn7M=;
 b=f1FiW3GfAm0rwczLRVaetfeMzJ8o510yCF13Hy1+MSxlrS2n8x/H6cuh9f5KjEXxq8
 WvhixgV9T17sKJN7ifrgTlconwMjrMe1IcroSM8gW3Et2o4PflsY3eEfJ1TDjEje7KDR
 g4hb3FCppsyzQeoVwZkZLMqFyw9q8C/1Hna6V3BARgmL6EsfTG0EMS2hKNQz8rY906ry
 /jiZbmD4r50/fN4P1mjdSQPenDGpylA5/Xwrb3uBJbK9Y4jeqQBKdzdlWGqWlAoEoY/W
 0m3p+YeZSZRe9RqHBF+bqm6EmtPmhmG8X6NSbssQ0caTqE4EZ7rnqzBKyG9uAwqACc9z
 59WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qu9jTq4Mhds1PLReGFI6BuQWWjoITkJw1sqRT7XAn7M=;
 b=HvOxZ0I5f9VjrDJA+R4Mhf1qUASmVEAMFhtnYICQ82QZrOi3gUeFqZQcqX8zxtGLip
 y+sIWpgji2GJs8bR6i6Xf2G4lzBbnG/iMGatrSLASUeNf9SLyFmAQ0uWwUm85CcGvPl6
 jHbzq00dLM1775KcohneI9bmLzjd2vKjTcvKxY8hfnL2XeFKKo09i98YMNmxVMmz2yaB
 MKOCAxZMZvBsDDqsPwxOf1bPPxA8aMoWX4liwv4tls8O8uvQrpVtMHctLrgUvRggfOFw
 bmzVxQtPHiRWmndqR+8beP6XIyjUWuN4yeCLx3mZReGU3aHYEc/e7CMtJiWvK6SuTqIH
 GMog==
X-Gm-Message-State: AOAM533oEAW5d5h4gFrjkS6iwipdcsE8nId2CPwa45QbNecAEMUkJ0OQ
 aMXzH2ex4Mwm62l+ole1sug=
X-Google-Smtp-Source: ABdhPJyLMm7H/FaTax/nz30O7Prof4o8UmbaC75S/EmM87QIur+1h8r9VSHwMKgnivf3lp2EFzv72g==
X-Received: by 2002:a62:2bd4:0:b029:1ae:4d9f:60da with SMTP id
 r203-20020a622bd40000b02901ae4d9f60damr12562238pfr.20.1611204123500; 
 Wed, 20 Jan 2021 20:42:03 -0800 (PST)
Received: from localhost.localdomain ([49.207.210.174])
 by smtp.gmail.com with ESMTPSA id jx15sm3916014pjb.17.2021.01.20.20.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 20:42:02 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v4 01/19] crypto: amcc: convert tasklets to use new
 tasklet_setup() API
Date: Thu, 21 Jan 2021 10:11:08 +0530
Message-Id: <20210121044126.152274-2-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210121044126.152274-1-allen.lkml@gmail.com>
References: <20210121044126.152274-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_234205_736817_D2EAD59B 
X-CRM114-Status: GOOD (  12.52  )
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
 drivers/crypto/amcc/crypto4xx_core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/amcc/crypto4xx_core.c b/drivers/crypto/amcc/crypto4xx_core.c
index 8d1b918a0533..0e13430a5b9b 100644
--- a/drivers/crypto/amcc/crypto4xx_core.c
+++ b/drivers/crypto/amcc/crypto4xx_core.c
@@ -1072,9 +1072,9 @@ static void crypto4xx_unregister_alg(struct crypto4xx_device *sec_dev)
 	}
 }
 
-static void crypto4xx_bh_tasklet_cb(unsigned long data)
+static void crypto4xx_bh_tasklet_cb(struct tasklet_struct *t)
 {
-	struct device *dev = (struct device *)data;
+	struct device *dev = from_tasklet(dev, t, tasklet);
 	struct crypto4xx_core_device *core_dev = dev_get_drvdata(dev);
 	struct pd_uinfo *pd_uinfo;
 	struct ce_pd *pd;
@@ -1452,8 +1452,7 @@ static int crypto4xx_probe(struct platform_device *ofdev)
 		goto err_build_sdr;
 
 	/* Init tasklet for bottom half processing */
-	tasklet_init(&core_dev->tasklet, crypto4xx_bh_tasklet_cb,
-		     (unsigned long) dev);
+	tasklet_setup(&core_dev->tasklet, crypto4xx_bh_tasklet_cb);
 
 	core_dev->dev->ce_base = of_iomap(ofdev->dev.of_node, 0);
 	if (!core_dev->dev->ce_base) {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
