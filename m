Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CAC3C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Dec 2021 14:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zt5rortBYcneXlkD73/aHjxEEnUU9QmgSmymaOA0NMU=; b=gMmeSB2OBSgsS1
	thnP0qPmNhhxrT3nKBbWL0ByYN+8JqZyxw5O3WXd/zrJ0uzqBd5KCVR3FEW3kth48MzL/3Wl++twq
	vsBoJjnz1eWyNZ+ZJpthno+vYvRepQQ/MkdmtEfebSQysSmOGr5Qw41Wpo+olPqSvIvyJhBuLISGJ
	ZvF+N8H4YHx6l+Vi0kcOtPVNXbqWNcOUJWwJR5F/7BDGxEfp1MqlE2MnVbuRJJ9T7C0cmu97SBcL2
	jUj2/pTa779FJvTOBSHT+12Hk9Iqk4p1/othlmxAZdBhUt8WPfcjH8Isi0tyHhHOuS/KuYdoL8jEm
	zKXd5Ci+9aUrymWsfuLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mt9LA-00G7F7-6p; Fri, 03 Dec 2021 14:15:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9Kv-00G7Ds-VB; Fri, 03 Dec 2021 14:14:56 +0000
X-UUID: b72a0e7392c04132852ed3ec98d30048-20211203
X-UUID: b72a0e7392c04132852ed3ec98d30048-20211203
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 485436168; Fri, 03 Dec 2021 07:14:48 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Dec 2021 06:14:47 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 3 Dec 2021 22:14:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 3 Dec 2021 22:14:18 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <linux@armlinux.org.uk>, <matthias.bgg@gmail.com>,
 <rmk+kernel@armlinux.org.uk>
CC: <arnd@arndb.de>, <akpm@linux-foundation.org>, <linux@roeck-us.net>,
 <rppt@kernel.org>, <wangkefeng.wang@huawei.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <yj.chiang@mediatek.com>,
 <mark-pk.tsai@mediatek.com>
Subject: [PATCH] arm: remove [_text, _stext) from kernel code resource
Date: Fri, 3 Dec 2021 22:14:16 +0800
Message-ID: <20211203141416.31121-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_061454_036064_1885B46F 
X-CRM114-Status: GOOD (  12.46  )
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

Remove the [_text, _stext) from Kernel Code.
Although there are some startup code in head.text, they
are freed to the buddy system after kernel boot.

And we have memory protection mechanism use this
which have false alarm when some other IPs doing dma
if the dma page frame is in the [_text, _stext).

Below are my iomem resource and reserved memory information:
console:/ # grep Kernel /proc/iomem
  20208000-219fffff : Kernel code
  21b00000-21c2e76f : Kernel data

console:/ # cat /sys/kernel/debug/memblock/reserved
0: 0x20201000..0x20207fff
1: 0x20300000..0x21c2e76f

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 arch/arm/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 284a80c0b6e1..85ffc9501e38 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -851,7 +851,7 @@ static void __init request_standard_resources(const struct machine_desc *mdesc)
 	struct resource *res;
 	u64 i;
 
-	kernel_code.start   = virt_to_phys(_text);
+	kernel_code.start   = virt_to_phys(_stext);
 	kernel_code.end     = virt_to_phys(__init_begin - 1);
 	kernel_data.start   = virt_to_phys(_sdata);
 	kernel_data.end     = virt_to_phys(_end - 1);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
