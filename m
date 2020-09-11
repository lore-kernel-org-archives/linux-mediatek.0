Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F01C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:54:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1A872075A
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:54:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QGBmWfIN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ey+mNbeC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1A872075A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mAwPriDUAZXVsATGm0zJHOqKPmlses3JPSQxh1bAhX0=; b=QGBmWfINx0b95Ar0u/2C9INsd9
	0Ry6dH6buwqHr+edhAGQtJTD0pL6lUrArkFTQuNJXsckkv94skJ1v2AAAXwwJkHMNCyiIuoEyerli
	qtLExs9aUOxf2+C4gKB6m8zm38b7KXu3i7QNqCnQY+0XvE8h/8tCymbq2HRHR8gIaPFbrLh9kzbEa
	n9mo4D7DDaASXAMB/Tuvagw9EoJ4Ms8+SbQ8rGb0ApdBWoGlmTBim4fOaa8ghVqFCLnBbqofcosCq
	eXxa8dkq2UWwU0diVAO1MrC8vCJHzuxReqylnmfivgIItnM4XdanYymhp1Atal2OlrU94n0FrIOmr
	6CaQaCJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGfkk-0007i0-Rt; Fri, 11 Sep 2020 09:53:58 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGfkh-0007gY-1C; Fri, 11 Sep 2020 09:53:55 +0000
Received: by mail-pg1-x542.google.com with SMTP id w186so6267339pgb.8;
 Fri, 11 Sep 2020 02:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8V0xBW7DTj25tKrCkSmr/DtXLxDvaz2DIFrG4wH1eVo=;
 b=Ey+mNbeCTGY96r1CKzPPi32hOjx2VLgLJRjWik6lrEOnatSNRNzRlAuyWB4R6M6c61
 yUpAAr249xov8mWH64Scr+XgVY/0oQf0bUDtzf/rkIRnQ+7sY8IRmBwgUU7zZ7zI2Dg1
 8L01CCSPtkV3qmMgZaXrWJZvjHCka1LkKFGi4Z0kTfbgUrEIRoTG+zF+V6bu9Ew8R0cN
 1S+yoK+yzA9HHMEsiwYhEcL6iN2MYX2TaSEHI3HBMT77kvOpP5DuM4VRwAvNvDuly4NP
 z6uICgdESJtQ5RMM6N/uPUoHdzkO/0+YKKvP5gnlBZq6fWdReGIwR8MattrFGzrFohwU
 1ecg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8V0xBW7DTj25tKrCkSmr/DtXLxDvaz2DIFrG4wH1eVo=;
 b=Zt7qAP6SeqRbnJTLUHR7GGVfgHN4YomBNrz1qD4BGp5QP3Q6pRA9lng/WSJXhlnDkB
 UXBpnXpLKpruM2rWJ+3W/d2C6qXE6HIb47Nm2uwQkNN360a+TvFf6jy7K3LcuwhUL+aq
 HuYVYFBcIcfx7Hep0AfF/KX1Qqs+hTIrwA1vpkc7e5lo9aLgngRlNZ7rpeG8ug+vK9Lt
 C/H9qsMHEBNhJvEXM0chvoK36RMf6XH2UHEqc3MnCDkqYXar6OJZn61O3aX3YT22t0VI
 Uuof0vvXte+iWrJHQFEXI+Amsi0IUtHtrcHkjNefW7tSdwOIMtzf6czPeD2R68sP6Bht
 S8pA==
X-Gm-Message-State: AOAM531O7htQebKxwSK2A8IV4GtN/G6WCXYVT6Sizu/ehCj5Gy7F7bTq
 P3Tqw2hSqZzbEJSEK99/c9g=
X-Google-Smtp-Source: ABdhPJxCsui9XwpDxJW4IYUX9m1QTPkEGom9uMzfEqjjpfE8pSptXn91LdbbhAqmuFXKXyC7G7Wq+Q==
X-Received: by 2002:a62:cecb:: with SMTP id y194mr1420782pfg.106.1599818032695; 
 Fri, 11 Sep 2020 02:53:52 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-13-52-163-24.us-west-1.compute.amazonaws.com. [13.52.163.24])
 by smtp.gmail.com with ESMTPSA id x4sm1790158pff.57.2020.09.11.02.53.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 02:53:52 -0700 (PDT)
From: Xiaoliang Pang <dawning.pang@gmail.com>
To: herbert@gondor.apana.org.au, davem@davemloft.net, matthias.bgg@gmail.com,
 swboyd@chromium.org, yuehaibing@huawei.com,
 tianjia.zhang@linux.alibaba.com, ryder.lee@mediatek.com
Subject: [PATCH v5] cypto: mediatek - fix leaks in mtk_desc_ring_alloc
Date: Fri, 11 Sep 2020 17:53:39 +0800
Message-Id: <20200911095339.9970-1-dawning.pang@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_055355_091170_2A08C732 
X-CRM114-Status: GOOD (  12.60  )
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
Cc: dawning.pang@gmail.com, linux-mediatek@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the init loop, if an error occurs in function 'dma_alloc_coherent',
then goto the err_cleanup section,
in the cleanup loop, after run i--,
the struct mtk_ring rising[i] will not be released,
causing a memory leak

Signed-off-by: Xiaoliang Pang <dawning.pang@gmail.com>
---
 drivers/crypto/mediatek/mtk-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/mediatek/mtk-platform.c b/drivers/crypto/mediatek/mtk-platform.c
index 7e3ad085b5bd..f83cead30d8f 100644
--- a/drivers/crypto/mediatek/mtk-platform.c
+++ b/drivers/crypto/mediatek/mtk-platform.c
@@ -469,13 +469,13 @@ static int mtk_desc_ring_alloc(struct mtk_cryp *cryp)
 	return 0;
 
 err_cleanup:
-	for (; i--; ) {
+	do {
 		dma_free_coherent(cryp->dev, MTK_DESC_RING_SZ,
 				  ring[i]->res_base, ring[i]->res_dma);
 		dma_free_coherent(cryp->dev, MTK_DESC_RING_SZ,
 				  ring[i]->cmd_base, ring[i]->cmd_dma);
 		kfree(ring[i]);
-	}
+	} while (i--);
 	return err;
 }
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
