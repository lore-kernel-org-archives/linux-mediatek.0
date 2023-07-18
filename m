Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706CBC0015E
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 05:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=746J88w5LASN4k5pDaTDB470esrzjAqjGHg9hOWvxnQ=; b=Uxc0jHdU78FpLLCYj0oNax0Vlp
	nZb14kxeUglFeflq/qc6VtUk6AGyZBjzawSulKSLgw7yykoe0B8xT0cZNtCXdY82DCq/CIE4mKWiT
	HeIgZoh/urN0gcqtViadp5YAyOPy0IGBZchxaDSkRhErDNKdkyySLn+/9h8BQsCyC+ICVqQLD3YQO
	hhVYNlmgQKIDjssIsxCchcmfuSoaLiIe/hj5whkl3+Cm0CULqSMkPCI3mh4zWB3fpT/dnIrXFoCZi
	ZhHYln7VUZf+BaDQMwEJzaeaEa8zk+lMOJAOlioCL3NEafuReYz7G+psJW3WSyydyNATUJGymsz0b
	ML5Wc7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Dt-005Uxu-3D;
	Wed, 19 Jul 2023 05:59:42 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Dr-005UwA-2I;
	Wed, 19 Jul 2023 05:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=746J88w5LASN4k5pDaTDB470esrzjAqjGHg9hOWvxnQ=; b=hZwWNE51LgS69Bnt0tStheJupF
	zlHHXSohu4dpWZJrW51UDVOmRW76na4RR4BBj9dA7p0LmTz8786iP/ZhhtvkYH4AMOBnpk5tFWO7V
	ms7zUtMI6f5OC3arhuzA9VeibqGwK6CL7P3HTZJ6k0Z21b4VwgPaSXDu2yLn5lVDTxrxjFMI1c+j+
	X4RJoB74XlIn0xKx++a0683KV4cNAPTRgKoZpqKvez/+BgKpMEHLZcL31/SjU8kXtkkrUz7mdT4+u
	Alu0f2HEgepRjNk7koD76yymUJZG/AUz2ZdvOVFcVsDkV/seDOOzOtdfvHxrv5hJKJH6fE055wfzX
	vpOg6/hA==;
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLYei-009U9t-1y;
	Tue, 18 Jul 2023 00:33:38 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=9;SR=0;TI=SMTPD_---0VnfJwjs_1689640375;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VnfJwjs_1689640375)
          by smtp.aliyun-inc.com;
          Tue, 18 Jul 2023 08:32:56 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Yang Li <yang.lee@linux.alibaba.com>,
	Abaci Robot <abaci@linux.alibaba.com>
Subject: [PATCH -next] regulator: Remove duplicated include in mt6359-regulator.c
Date: Tue, 18 Jul 2023 08:32:55 +0800
Message-Id: <20230718003255.124594-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_013333_275701_56A61808 
X-CRM114-Status: UNSURE (   6.40  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

./drivers/regulator/mt6359-regulator.c: linux/platform_device.h is included more than once.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=5901
Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/regulator/mt6359-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/mt6359-regulator.c b/drivers/regulator/mt6359-regulator.c
index 5cf6448fb05f..c8a788858824 100644
--- a/drivers/regulator/mt6359-regulator.c
+++ b/drivers/regulator/mt6359-regulator.c
@@ -2,7 +2,6 @@
 //
 // Copyright (c) 2021 MediaTek Inc.
 
-#include <linux/platform_device.h>
 #include <linux/platform_device.h>
 #include <linux/mfd/mt6359/registers.h>
 #include <linux/mfd/mt6359p/registers.h>
-- 
2.20.1.7.g153144c


