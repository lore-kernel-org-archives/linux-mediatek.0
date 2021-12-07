Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B5CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Dec 2021 10:30:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GYrsDYq2Jo/P01MC4rD9HSL4GbKfNk8pU2saKVzhpRE=; b=1tjCoVtxYZm18J
	NNsEFd6gUOfEPoxbzmRy/zhndP0JJrNepkr50YxYTOqEMikWXO+PS9HGbIP/U5kv/G5KHCDJ9V/9b
	gVD/MYvE4CXseFd2UmV7xEyMmvs1YOxSpKYQe2ExQ/7lNfiP3kUYA5t4tiMBOutnnuSCt87cEFng3
	Ss3+M9ojNbbxE576UZZ45ZuQWppJ8N4ck735ANmljD499232cbrjWbOHdKgrsF8fykgEC3yjdYasd
	HaxsyKlACTtEwNKqKa0fraXFEwPF5eeE09dDk1Ny6/dRlzZnSgs4my8wl05B9Fcg/JmLmV0Wo2gI2
	N0fOo3DgAIEWvdBd1K+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muXk2-0082J0-8y; Tue, 07 Dec 2021 10:30:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muX3G-007s3F-FX
 for linux-mediatek@lists.infradead.org; Tue, 07 Dec 2021 09:46:24 +0000
X-UUID: 5a235bef3d724e3c8ca02bc02d1c9d59-20211207
X-UUID: 5a235bef3d724e3c8ca02bc02d1c9d59-20211207
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2096837494; Tue, 07 Dec 2021 02:46:15 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Dec 2021 01:36:13 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 7 Dec 2021 17:36:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 7 Dec 2021 17:36:12 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>
CC: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <wsd_upstream@mediatek.com>, Miles Chen <miles.chen@mediatek.com>
Subject: [PATCH] gfp: further document GFP_DMA32
Date: Tue, 7 Dec 2021 17:36:10 +0800
Message-ID: <20211207093610.6406-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_014622_569872_227E99F1 
X-CRM114-Status: GOOD (  12.55  )
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

kmalloc(..., GFP_DMA32) does not return DMA32 memory
because the DMA32 kmalloc cache array is not implemented.
(Reason: there is no such user in kernel).

Put a short comment about this so people can understand this by
reading the comment.

[1] https://lists.linuxfoundation.org/pipermail/iommu/2018-December/031696.html

Signed-off-by: Miles Chen <miles.chen@mediatek.com>
---
 include/linux/gfp.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/gfp.h b/include/linux/gfp.h
index b976c4177299..c7bfaa9f3903 100644
--- a/include/linux/gfp.h
+++ b/include/linux/gfp.h
@@ -302,7 +302,9 @@ struct vm_area_struct;
  * lowest zone as a type of emergency reserve.
  *
  * %GFP_DMA32 is similar to %GFP_DMA except that the caller requires a 32-bit
- * address.
+ * address. Note that kmalloc(..., GFP_DMA32) does not return DMA32 memory
+ * because the DMA32 kmalloc cache array is not implemented.
+ * (Reason: there is no such user in kernel).
  *
  * %GFP_HIGHUSER is for userspace allocations that may be mapped to userspace,
  * do not need to be directly accessible by the kernel but that cannot
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
