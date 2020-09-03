Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8991FC433E7
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 06:38:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5277A206EB
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 06:38:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ml+q8vba";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjWvBbFY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5277A206EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RsVdkJHm/+YHUMY8CYPZaAb6BGl4CoqGYDQ+s7B4vao=; b=Ml+q8vbaD3AmDtxew5x9Ibic1t
	R7xTsgkGwdkNZfNfM94KqoFlPnvHq6R2DJeSfDX5l8Q7/wdTlQgzSAEOSkJ0sY2re37xkdoDENNuw
	Wz3HCsyRuX2aa41NQevrOxIr8uNEkvteJSW8OB6WWDeOWLzjnkWE1svjSuHWWE+mTgQ580bFpEn1D
	V4itLmeuAvTd+SHRFS43pRIiWWhCtemfhDXs54pd2C1hlh9WnMfLsMF6N9/ofl44VVpZrWgYDl5Vy
	JctIuN6wCPCN+Z6rxwXD+Muak8LDtrHCnB5j4oMpGvdB4soBah8Gj01S2vlWNpKqAyMdhY3aFw6OL
	RUm28gEw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDit6-0005hV-Rc; Thu, 03 Sep 2020 06:38:24 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDit3-0005g7-Dj; Thu, 03 Sep 2020 06:38:22 +0000
Received: by mail-pg1-x541.google.com with SMTP id p37so1314118pgl.3;
 Wed, 02 Sep 2020 23:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=JzV2OCqdKiJejSLxD4j9h8uaxc1ywBPDynMdu8MGQD4=;
 b=DjWvBbFYKTwUUrwMgdbDVts6nrIF8n3LkmmGUcaTH6wk12ytUSDtsZbPyPNZ7KhN0f
 BrB1VJ4PEHIvsRS6C9N2moXz/bDtABmEyI3AN4Nt6Yp91seZ5xzZmjU/cfyK4x26Dsw+
 bU7Zwt6alhzP2UPw44N2BYQugdPZtbIw1HkAhXu50B+589L36cVRG9L/zQQEoVlH1hH8
 sD7UCa+ohys2MGiDwRKvy/xmF54NLOiSwGmHaKLi8NmK0zKrXjKe6iAn85M4ELq4CwM1
 gdCLz/M2tozNB8PHn8c+Krhkcve81QtjPMp8JNJ/NAURYpCDvdkLGY/Fk/THyWnsJe/z
 NieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=JzV2OCqdKiJejSLxD4j9h8uaxc1ywBPDynMdu8MGQD4=;
 b=IvxHz4g7CIhynKtvY0IoTdiZETZhTkfHy13gLLkQohs0TZAALpzCqekfKioLMMRp+Q
 mLSC4X98lxeAP0Zc5dNH7gpzfB0VtWine1ZkQE+VVWt/JtjxpWpRcVVmI+y5GgqIw0b8
 8qdxqKza0jeOCXjzQu0I/Fd/OxrhdZNVuUKHdJL9AFwF8XwEdQ45QuF1HsTZEAYRdkpC
 olgBDA9X0PfkX0Cr+Us0cRUCBxZJdihpPgZJK3yBqr+eH0c8sQAKsmUlB33QiSwYVK8N
 oKcv7fL0JrK35ISNfeXzi6t2CLAwzn4NvbXsMAhjv517tfMQIteUkWamnFTfqg5m0f3n
 1bSQ==
X-Gm-Message-State: AOAM530fl4/zp4FhgHpiFs7Lo3qX0iHm2A9gVYswg6cEmVSeiBn01QsD
 tWm7nEH+x3K1cRJT1Evvmzw=
X-Google-Smtp-Source: ABdhPJwvJwxeHbddcSMcrw6WNHCMlw8KxZuhNo8a0SYjKuYQMzszVqwi+fMa7X3GuTG5ROpaCUGtqQ==
X-Received: by 2002:a63:8448:: with SMTP id k69mr1697129pgd.69.1599115097868; 
 Wed, 02 Sep 2020 23:38:17 -0700 (PDT)
Received: from localhost.localdomain ([218.247.215.252])
 by smtp.gmail.com with ESMTPSA id e123sm1754835pfh.167.2020.09.02.23.38.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 23:38:17 -0700 (PDT)
From: Xiaoliang Pang <dawning.pang@gmail.com>
To: herbert@gondor.apana.org.au, davem@davemloft.net, matthias.bgg@gmail.com,
 swboyd@chromium.org, yuehaibing@huawei.com,
 tianjia.zhang@linux.alibaba.com, ryder.lee@mediatek.com
Subject: [PATCH] cypto: mediatek - fix leaks in mtk_desc_ring_alloc
Date: Thu,  3 Sep 2020 14:38:00 +0800
Message-Id: <20200903063800.27288-1-dawning.pang@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200903_023821_503599_467F7F9E 
X-CRM114-Status: GOOD (  12.31  )
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
 drivers/crypto/mediatek/mtk-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/mediatek/mtk-platform.c b/drivers/crypto/mediatek/mtk-platform.c
index 7e3ad085b5bd..05d341e4a696 100644
--- a/drivers/crypto/mediatek/mtk-platform.c
+++ b/drivers/crypto/mediatek/mtk-platform.c
@@ -469,7 +469,7 @@ static int mtk_desc_ring_alloc(struct mtk_cryp *cryp)
 	return 0;
 
 err_cleanup:
-	for (; i--; ) {
+	for (; i >= 0; --i) {
 		dma_free_coherent(cryp->dev, MTK_DESC_RING_SZ,
 				  ring[i]->res_base, ring[i]->res_dma);
 		dma_free_coherent(cryp->dev, MTK_DESC_RING_SZ,
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
