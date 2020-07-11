Return-Path: <SRS0=kVE3=AW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC1BC433EB
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 07:02:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA6E720725
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 07:02:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e2lQlhfs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="i6MHN4MO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA6E720725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IrGjQzI84H5bt9T6mvvqDjkYq4c/ZXSZpmCNiaQWpeE=; b=e2lQlhfslBUSMhC8IIc1avEzG
	Pkd0P2vSBO2xw7nZADzCcdAZ4Cfl2XVIoCUSYyf5fPUyYeoHexTTWhLTv881eFRy4g9Uq92OuOuR9
	t1kLd0dViF1GyfxP9lpWO/cI3xUc/ZoR94yQ/W0xhPPWoAmR1Tr7eijIuARi0Fh0K4P5q3rc9MNEY
	qJvlCPZdupK7fzDaby8EwrX3O/IQq08G0JCVkwBt2Wb0FJhz3/To2clHu61/Oy3uHDJ9KspfQ800K
	dANaauJ6wmDs3PFbYQB+JDrSYrEHJFDINjooDahyRzgVZel8AE0mqttXESp+/SOdRkEDq/qkwsA+j
	iPswC/JSg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju9WT-0003Ur-BZ; Sat, 11 Jul 2020 07:02:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju9Ux-0002g5-Dj; Sat, 11 Jul 2020 07:00:37 +0000
X-UUID: 0982167c6c274b9db0d6a42d69d228d6-20200710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=X9X6VUl15O0QLqjDskaPZDckZoa2Ua3bbD5IeU7Lw9k=; 
 b=i6MHN4MO4MzKyvE4SZo3f3MrRnqoRQWC1D1cp8Z8+MSfASIGEQasqsji1qQFERDDrtB9BbNNglnRS5DI5o2gCMA/LLcRsk1Zgxv+2UguaqCjAwtsXVp/F3SuZLTC9uBlCwrE3GptbePcJd1zVDhvx/G4pimbsbXVdNT4dY6KWV0=;
X-UUID: 0982167c6c274b9db0d6a42d69d228d6-20200710
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 351508502; Fri, 10 Jul 2020 23:00:19 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 23:51:47 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jul 2020 14:51:45 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Jul 2020 14:51:44 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 13/21] iommu/mediatek: Make MTK_IOMMU depend on ARM64
Date: Sat, 11 Jul 2020 14:48:38 +0800
Message-ID: <20200711064846.16007-14-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200711064846.16007-1-yong.wu@mediatek.com>
References: <20200711064846.16007-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: DC67469FEF3469DEA3B505AC9A9CDD09FA042BA3EF01BF46EF49FD74EEF01B462000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_030035_635437_7DB79707 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, cui.zhang@mediatek.com,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>, Tomasz
 Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Originally MTK_IOMMU could depend on ARM || ARM64.
Both build ok. actually the source code don't support ARM.
this patch changes it only depend on ARM64.

This is a preparing patch for support multi-domain.
otherwise it will build warning in ARM case.

This is the build warning log:

drivers/iommu/mtk_iommu.c:163:27: note: in expansion of macro 'SZ_4G'
  {.iova_base = 0, .size = SZ_4G},
include/uapi/linux/const.h:20:19: warning: large integer implicitly truncated
to unsigned type [-Woverflow]
 #define __AC(X,Y) (X##Y)
                   ^
include/uapi/linux/const.h:21:18: note: in expansion of macro '__AC'
 #define _AC(X,Y) __AC(X,Y)
                  ^
include/linux/sizes.h:46:18: note: in expansion of macro '_AC'
 #define SZ_4G    _AC(0x100000000, ULL)

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/iommu/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index b510f67dfa49..6bebfd3e0021 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -467,6 +467,7 @@ config S390_AP_IOMMU
 config MTK_IOMMU
 	bool "MTK IOMMU Support"
 	depends on HAS_DMA
+	depends on ARM64
 	depends on ARCH_MEDIATEK || COMPILE_TEST
 	select ARM_DMA_USE_IOMMU
 	select IOMMU_API
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
