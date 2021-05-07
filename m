Return-Path: <SRS0=vvwr=KC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BA6C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 02:12:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 400D461289
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 May 2021 02:12:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 400D461289
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=G9jWw/H41OnRmHtRGYPzgcE1mJp0HlBsWi2f4FL6doI=; b=JYUz84Yzj1txycA9XHRqrF7qI
	JnjzUwluJTtjrzBCmkFtW7s643q1lD5fIt9xjKy6PldC2dJmVGkLoMCX/c7nbhQuIUcmrYyMNH6PA
	4enaelaTiX/CkEVv+xxPn/nZxkXKh+cEIrY/HHyyNfaRxm8T+E13qp7BiEnupMj5LyRyZT7ULpvim
	EjCBj2v2KWan/ZmBGxVyfPoIZW6zJJFoEbMAnkWu2C5nQ9WoEOe1IuRcuKo/aw+pix6fA32FLYpLe
	b4EhLedUjSdmNwJF3BOncCjfmqXqOmoYXncmvAwv+asbKIWr5V/nUDdGqgQ9LhoisKv0ThSiUAQq5
	mR/SOCAPQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lepy6-005q6H-Qa; Fri, 07 May 2021 02:11:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lepxt-005q4m-Ef; Fri, 07 May 2021 02:11:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=00KTnH39cnFiWCckLKVXZT6Fhz11QcyPqbGpOK2H5iw=; b=p88WVrdacdlO4vVLMYGLod+VqX
 Op4Ey5wEOVatygvwzXMsQqZdiX4RVuIeKTWWJWKBoyomcFBkll+nqgpq13xFNIVNGvlApqSnadiYk
 k3bqdtVtKb7q9AsKZQkCREWUpc+rIlHVzaw9v/Bef+y3Py8xoSe3gDkYq/ouSgn10uvfQcGLwXrGA
 VA7u3XThgqOd7hwCQCU+SBdW1g29sCh42yKSt7s1Tg55xsKL3AFcUkheT73uL+6P7jdUcmZVZ2nBa
 i5FZhdiMBu4Wu7PnvOQNMTdWgX5EkGEGS55GM9rrrq7Nycu5TH+ueIamY5/sC/hiQOx5Mfby+nMQy
 LnWF+5gQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lepxq-006WKy-Bj; Fri, 07 May 2021 02:11:39 +0000
X-UUID: d7590db66dcf4a30846b8454abb6b5c6-20210506
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=00KTnH39cnFiWCckLKVXZT6Fhz11QcyPqbGpOK2H5iw=; 
 b=WUrT20F6+Z/9wxDU53JFZNFwnLpqxfaKdn+0GxH/3Q4qSOm/MmtSaIdy3c4izUoH+wBy9YrCzUlqri/LY+QjfLZM+CcMqU6NRVgQzQ1mFfq4iShISrtJQrlsaoJ7O8u7Jr5R+iTvntC7hsu0vAOZ7YAg3TproWyh1sr/iRYxEAk=;
X-UUID: d7590db66dcf4a30846b8454abb6b5c6-20210506
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 746435417; Thu, 06 May 2021 19:11:33 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 May 2021 19:11:31 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 10:11:29 +0800
Received: from mtkslt301.mediatek.inc (10.21.14.114) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 May 2021 10:11:29 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Mathias Nyman <mathias.nyman@intel.com>
CC: Chunfeng Yun <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Ikjoon
 Jang" <ikjn@chromium.org>, Eddie Hung <eddie.hung@mediatek.com>, "Sergei
 Shtylyov" <sergei.shtylyov@gmail.com>
Subject: [PATCH v3 2/4] usb: xhci-mtk: remove unnecessary setting of has_ippc
Date: Fri, 7 May 2021 10:11:25 +0800
Message-ID: <20210507021127.54717-2-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210507021127.54717-1-chunfeng.yun@mediatek.com>
References: <20210507021127.54717-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EDB69650B5819A47EFB3C763348CDA24389B7BFCA6749B257CB08F83C37B88772000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_191138_430630_9F1734B7 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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

Due to @has_ippc's default value is 0, no need set it again if fail
to get ippc base address

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
v3: new patch suggested by Greg
    fix typo suggested by Sergei
---
 drivers/usb/host/xhci-mtk.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/host/xhci-mtk.c b/drivers/usb/host/xhci-mtk.c
index b2058b3bc834..2548976bcf05 100644
--- a/drivers/usb/host/xhci-mtk.c
+++ b/drivers/usb/host/xhci-mtk.c
@@ -495,8 +495,6 @@ static int xhci_mtk_probe(struct platform_device *pdev)
 			goto put_usb2_hcd;
 		}
 		mtk->has_ippc = true;
-	} else {
-		mtk->has_ippc = false;
 	}
 
 	device_init_wakeup(dev, true);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
