Return-Path: <SRS0=kVE3=AW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E68A5C433E1
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 06:50:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B55E52075F
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Jul 2020 06:50:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YRGdfIPX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ogxD5nZ5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B55E52075F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LU5yEWNcKCh3vcQ56KKGZsFquyA5wn16vnxp4W1UNsA=; b=YRGdfIPX7+Pdo3U2tCC6itlP3v
	2rPyKYbR2yRPF7EnFMrLqWG4C6kMoVgfx2Qz+JobrUXwdHF/EXK+oKcEZxx/xeCOQDQUvm8JD3uTm
	93i1vN1PUcp9dlT2SfJphYE48UTIzi4xC63SOBxv11bbye8ZYn7Gyknf0CknLbHE785fOzoywntTU
	fhUSyiP3pi/HfntrDNdPf5YwPLqg7sdQUCd3zN/VtT7hafdHo2zFU6elVX9hcLTky+9nW5q5SE7sF
	+5gIYf9Hq6mD9Lvv3s9RG2dz/bqiaqSSUziRlbYGfIbvaMjxEezPzCpqqXKW8c1Lplg6za+tuf3Ub
	pdAqFmDA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ju9Kh-00012A-JX; Sat, 11 Jul 2020 06:49:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ju9Kc-00010h-Vf; Sat, 11 Jul 2020 06:49:56 +0000
X-UUID: 9a3435677aa04837b67882a50ba938fb-20200710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=vwYwfmBuQ9EeaF9o2hLTJCCqrK2cnovh37RuGZvptlA=; 
 b=ogxD5nZ5xaqn2O6DU45WGIt10Ix+cItMJ86xGrFDF1nd1rk3bSmJV7Dm6rkoSd0Ln+jd8bkZjOydmYdEvMESb7BiKiW7i9KbDp/NmDZscGbqpwlForPAcrpKJ8aUf7Ae9n9dapZ1t5BZyiDzroljpMmSBbStKRra7aZ1hq91BhA=;
X-UUID: 9a3435677aa04837b67882a50ba938fb-20200710
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 306065110; Fri, 10 Jul 2020 22:49:38 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jul 2020 23:49:43 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Jul 2020 14:49:35 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 11 Jul 2020 14:49:34 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 00/21] MT8192 IOMMU support
Date: Sat, 11 Jul 2020 14:48:25 +0800
Message-ID: <20200711064846.16007-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: A82A830F0FA76FCD9B4AB531CB0600E0FA50BF41F1516541BB4CA6E4B4AA79502000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200711_024955_178015_81F194C9 
X-CRM114-Status: GOOD (  12.86  )
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

This patch mainly adds support for mt8192 IOMMU and SMI.

mt8192 also is MTK IOMMU gen2 which uses ARM Short-Descriptor translation
table format. The M4U-SMI HW diagram is as below:

                          EMI
                           |
                          M4U
                           |
                      ------------
                       SMI Common
                      ------------
                           |
  +-------+------+------+----------------------+-------+
  |       |      |      |       ......         |       |
  |       |      |      |                      |       |
larb0   larb1  larb2  larb4     ......      larb19   larb20
disp0   disp1   mdp    vdec                   IPE      IPE

All the connections are HW fixed, SW can NOT adjust it.

Comparing with the preview SoC, this patchset also adds two functions:
a) add iova 34 bits support.
b) add multi domains support since several HW has the special iova
region requirement.

this patchset depend on v5.8-rc1 and mt6779 iommu[1].

[1]https://lore.kernel.org/linux-iommu/20200703044127.27438-1-chao.hao@mediatek.com/

Yong Wu (21):
  dt-binding: memory: mediatek: Add a common larb-port header file
  dt-binding: memory: mediatek: Extend LARB_NR_MAX to 32
  dt-binding: memory: mediatek: Add domain definition
  dt-binding: mediatek: Add binding for mt8192 IOMMU and SMI
  iommu/mediatek: Use the common mtk-smi-larb-port.h
  iommu/io-pgtable-arm-v7s: Use ias to check the valid iova in unmap
  iommu/io-pgtable-arm-v7s: Extend PA34 for MediaTek
  iommu/io-pgtable-arm-v7s: Add cfg as a param in some macros
  iommu/io-pgtable-arm-v7s: Quad lvl1 pgtable for MediaTek
  iommu/mediatek: Add device link for smi-common and m4u
  iommu/mediatek: Add power-domain operation
  iommu/mediatek: Add iova reserved function
  iommu/mediatek: Make MTK_IOMMU depend on ARM64
  iommu/mediatek: Add single domain
  iommu/mediatek: Support master use iova over 32bit
  iommu/mediatek: Support up to 34bit iova in tlb invalid
  iommu/mediatek: Support report iova 34bit translation fault in ISR
  iommu/mediatek: Add support for multi domain
  iommu/mediatek: Adjust the structure
  iommu/mediatek: Add mt8192 support
  memory: mtk-smi: Add mt8192 support

 .../bindings/iommu/mediatek,iommu.txt         |   8 +-
 .../mediatek,smi-common.txt                   |   5 +-
 .../memory-controllers/mediatek,smi-larb.txt  |   3 +-
 drivers/iommu/Kconfig                         |   1 +
 drivers/iommu/io-pgtable-arm-v7s.c            |  51 ++--
 drivers/iommu/mtk_iommu.c                     | 265 +++++++++++++++---
 drivers/iommu/mtk_iommu.h                     |  11 +-
 drivers/memory/mtk-smi.c                      |  25 ++
 include/dt-bindings/memory/mt2712-larb-port.h |   2 +-
 include/dt-bindings/memory/mt6779-larb-port.h |   2 +-
 include/dt-bindings/memory/mt8173-larb-port.h |   2 +-
 include/dt-bindings/memory/mt8183-larb-port.h |   2 +-
 include/dt-bindings/memory/mt8192-larb-port.h | 237 ++++++++++++++++
 .../dt-bindings/memory/mtk-smi-larb-port.h    |  22 ++
 include/linux/io-pgtable.h                    |   4 +-
 include/soc/mediatek/smi.h                    |   3 +-
 16 files changed, 565 insertions(+), 78 deletions(-)
 create mode 100644 include/dt-bindings/memory/mt8192-larb-port.h
 create mode 100644 include/dt-bindings/memory/mtk-smi-larb-port.h

-- 
2.18.0 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
