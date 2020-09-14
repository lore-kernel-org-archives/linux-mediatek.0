Return-Path: <SRS0=gVFe=CX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60AF9C43461
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 03:01:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85C3F21974
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Sep 2020 03:01:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OQXfQUqx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DvJv456x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 85C3F21974
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FI56b8d5wz92Ahaew35C83TiF/Iu45zz25e6Vvkm3J8=; b=OQXfQUqxPsEXMdP+m28FB4ttHk
	LRDh9R28x5D1CKyNhqR0hd9nYttmKPv8bAWF0LY8pZ/eUIy5pynKOLXPyylUp1TzQIb5uwlGsELLf
	venMcwWwaSDo0yKUs98B4k3rZNkPSfTqNPgdiuKsz1mPNo2jBE6IIIRpp/bc3m8TZlS8SrLMPJuLD
	VXjFAdX0jJ5rMlKA/u3qncUo/TsjQ7oSJK8uF1f5Llv8RDSXJD7GshQ4qsojI5O2bIPE1zJsEVmKV
	0U91LxdqhVU7X0/awVjlLX5+NdV/mjZOXqMNGYQr6ZlqAx1x8BrJXSi/2COkhcjSL2R+1JDkkn+G7
	pkVO4x4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kHekL-00024K-LE; Mon, 14 Sep 2020 03:01:37 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kHekG-00023k-6W; Mon, 14 Sep 2020 03:01:33 +0000
Received: by mail-pg1-x542.google.com with SMTP id z17so2594924pgc.4;
 Sun, 13 Sep 2020 20:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=lyLNdA4xrXocOcTdyl66Bfsi09lJXmV7xTXnFfeHCDE=;
 b=DvJv456xq70FIh5msQ6QNCM81uLc+IEpVUr7p8Swoi4KEfwBDw43z0YQ7OXV5eZsFy
 zfyrMccjxhHJJgYVDU6ueLCfDi5lCCouphN1wGJDoybglGNNjMbgqFu1agaUco4gTYIw
 7xWxzXfocqvrs7PNrvjZ58oTNFa2IMxwgh+aZCxCpVQFToaYBbq+n6I8QgNJDLhctyzo
 Pm6du+DSKZuoEQitd0etqJHqXABXx+mpirdd+b+XsUgqj+LnS9afJpZt+IOFxa5zgpyl
 ZC7YgLKK9UCx6RkmytedEA0OFAcyFles175yeSZgfVTTg3v3gyp7fSs/CjIbCKR9J90h
 +nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=lyLNdA4xrXocOcTdyl66Bfsi09lJXmV7xTXnFfeHCDE=;
 b=JfdsdoVF6O/mXceEhljP/Wfppo3eeG4jS8o2k3xoIxVN74AcgNWqYirfIWvp+BOh+D
 oajMWQLZ33XpnUxDOiMrE5PTvxB/xbL15kesYqpT2ksGGzmkxgFcd5RYbGwVUaFUM0Hv
 Rl/WADVN2N3/5wQicGuZRvQ+Yos0+o647UIvhRkwZpdsdX05JVQfYxmvNxnovCRurURn
 50JKgKEJmPhm4otRadUowNiOOHQhD+NYoM2EY+99wCd6w/w9I+ILjlHroxOBQDUOMe1Y
 d7hBMz43VHqTtLqIov++zygIteH9GkttTnheLzU/NsIE4xufYQrD8Us5GtkQBC4lnqwu
 PJnw==
X-Gm-Message-State: AOAM533TlrEXg1SeTlaYHloYOCPAcsgocKhVbfFuNAzZPLN4dKoyDw5k
 2fxaE2t/YZvQPwaZKkoe9+A=
X-Google-Smtp-Source: ABdhPJyQG67+KJ6O9daScNbPgx0CN+jeuxOa0ZZSYpf4iwF5/ESDGcgFhCq5LDsJIhUz8X4B23YV/Q==
X-Received: by 2002:a17:902:9f86:: with SMTP id
 g6mr11822108plq.32.1600052489155; 
 Sun, 13 Sep 2020 20:01:29 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-13-52-163-24.us-west-1.compute.amazonaws.com. [13.52.163.24])
 by smtp.gmail.com with ESMTPSA id z18sm8474265pfn.186.2020.09.13.20.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Sep 2020 20:01:28 -0700 (PDT)
From: Xiaoliang Pang <dawning.pang@gmail.com>
To: herbert@gondor.apana.org.au, davem@davemloft.net, matthias.bgg@gmail.com,
 swboyd@chromium.org, yuehaibing@huawei.com,
 tianjia.zhang@linux.alibaba.com, ryder.lee@mediatek.com
Subject: [PATCH v6] cypto: mediatek - fix leaks in mtk_desc_ring_alloc
Date: Mon, 14 Sep 2020 11:00:51 +0800
Message-Id: <20200914030051.16956-1-dawning.pang@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200913_230132_354208_86A43DAA 
X-CRM114-Status: GOOD (  13.20  )
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
then goto the err_cleanup section, after run i--,
in the array ring, the struct mtk_ring with index i will not be released,
causing memory leaks

Fixes: 785e5c616c849 ("crypto: mediatek - Add crypto driver support for some MediaTek chips")
Cc: Ryder Lee <ryder.lee@mediatek.com>
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
