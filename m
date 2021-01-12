Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F24A4C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:47:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9709522E02
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 01:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9709522E02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dkwS2nkRhtDgd7va9wmmgEh5uZDQuVExfdwkNpLGewU=; b=0oCv3FrelihOBeobinn6xp/6u
	0FPuPIhfyjg+m+ihW0HqZH2DB9IqPdGqXGKW772wD6+YMIgC7Km7kqVkaOlA2Y41u1Ko43E3qnjNR
	6HDCnyn6Hn5PsR0yfMpZ/ivbrDv+LF6G4SVljNog0EE2c+Pq9MTg9gXFC+XjzS9GXOa4aB9x2qiRe
	lpyzN9y7Vmo3oNMx2IaVyU1TBPihKU3y4vF2S4nUHUQ4hI0dER1ZqlOGcs8fbIgB+31tODnCLzNo/
	nhshmZQCZgutMpx6CBozDDQpSIJ/2NJ3A0po0x9RapHMmR/MeIc1LytcoTll41EBnYG2T/WpFFZlx
	RRd/H81dA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz8mG-0002vL-B5; Tue, 12 Jan 2021 01:47:20 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz8mE-0002uA-GF; Tue, 12 Jan 2021 01:47:19 +0000
Received: by mail-pl1-x62d.google.com with SMTP id j1so529390pld.3;
 Mon, 11 Jan 2021 17:47:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qu9jTq4Mhds1PLReGFI6BuQWWjoITkJw1sqRT7XAn7M=;
 b=H63y7TytVzVANKOVA7sdCA6vVgUHNtSjJ0nN8hlQEHDbjOF4g5m8MJRGfQkutbNkX0
 QqecOfP6JEf05JZm1qT88AeNGR2IleB6D0vIhRITllMtZ44HM5F3SbrJlWL0phqLac3J
 3q6Wz5eIKCj5xza64orBo519XLAkn0icn82vDvA/tKr9AfQYigPbbNNTMgDF2Wk38Bjl
 ZYKEGf+1pjClpaJTY3CbQAb3YW2Lzvc1IXAThCVLdrJ07knO+CP5u9k2ssAFWC95H36o
 sKJZj3sKgDIvwYyrq9NQR0yx/wUmlS7zN9d0wcjrKifHQDvv+nOMQ2sEJUV+IEIsJQFR
 Ct4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qu9jTq4Mhds1PLReGFI6BuQWWjoITkJw1sqRT7XAn7M=;
 b=QX7Qv6TT0Tv4UzHBfbNziZk+HPWTSMSn9K4MHzqd5pJ9vAaufd2rmpt7RkTakmMjN6
 M7Y++r1SEAKlqUVzAYRqIsxTk01OBwFFh2H9nN8SMFRoZhcu1ZxgCX/a6DLPbUEJSVaO
 IxTMqq7FCj118JbK/iO1ACs/+6oEQitLmQRxQxtkoQVjOxWzE/Ys/lQXf0Cr1eX+26Du
 koUgJNf7euSULCUPQWb10TkDAEh/gFEG2+gNtmYLXrPa3kKQ8vLAoBspMUyKAND6HyYT
 jDvkqhWmk+TjERym7V8XnSOluNPeFIpyL4s0y2YVAcDadQBaUJ0YmA/ImL5QF4kWYFPN
 ANBw==
X-Gm-Message-State: AOAM532Zi0IFdgxESuS7NGDXklJ6v7TVXw3o4qRUE2/XSWfKllqMhL+c
 sXROT1ilU1V5bs0maBCRLOu/gVtEix8=
X-Google-Smtp-Source: ABdhPJwwk0s1+U0eEIms8qHWr9weNGl7FRq+v0mFtEWayniloff6bmrtW7bVMClYALWDK/at4Reeqw==
X-Received: by 2002:a17:90b:3907:: with SMTP id
 ob7mr218173pjb.18.1610416036496; 
 Mon, 11 Jan 2021 17:47:16 -0800 (PST)
Received: from localhost.localdomain ([49.207.194.207])
 by smtp.gmail.com with ESMTPSA id 14sm904376pfy.55.2021.01.11.17.47.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 17:47:15 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: herbert@gondor.apana.org.au
Subject: [PATCH v3 01/19] crypto: amcc: convert tasklets to use new
 tasklet_setup() API
Date: Tue, 12 Jan 2021 07:16:32 +0530
Message-Id: <20210112014650.10887-2-allen.lkml@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210112014650.10887-1-allen.lkml@gmail.com>
References: <20210112014650.10887-1-allen.lkml@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_204718_607608_81C10243 
X-CRM114-Status: GOOD (  12.63  )
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
