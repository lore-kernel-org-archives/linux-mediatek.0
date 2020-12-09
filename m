Return-Path: <SRS0=7tkd=FN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34BF5C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:01:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44B5023B45
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Dec 2020 08:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44B5023B45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WPGsLcVYKrNFslU5yJIQMcY8axPPTbdSk6mt5h4mJVo=; b=WKxe6MICejvzdpzT8gGrfGaWGz
	MfTL7zN/v2/NfMnLC11/ndFu0k/5UKscysSrOi+0pyMLySg4tSJAnruRD7USy3M7Krw6hzCeEx29K
	215DTs49OGpPT2W9o5pn57RjMctd3k+bzlCdtPEK+DCjRNW2FjxO8Hp9GhW9sdUs/h6Mn+66AFvk2
	TpK5pBVh57eK4dYB+LvfYkDVnRBnvIi/sfsguPwwdFGAeunHsIN8Rywfwq0VNtXYUwlMHeyit8Uzn
	Zly8ZyLNffr1mNg6qd9dk/H0R9Ng5+M4t04aBIX7C5r037TWhk12nTGh422DsdlY2WXuuRQX6atfz
	kiKp7xUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmuPk-0004OF-3h; Wed, 09 Dec 2020 08:01:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmuPg-0004NM-AM; Wed, 09 Dec 2020 08:01:30 +0000
X-UUID: 470156d081d346f09e35a7cde9b21dc4-20201209
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=k/U9r6vlvDvvHWKgyVmk/9kjRTQ9zznO0XociNQz+FE=; 
 b=ZyIXH28+inT5m+5bUzT5FCA4QMg+Pi0sF+L0VVK2yw40eoeVuo0t2MvnLWPU5Pa8bBBJhRV/Z79CzDWUfz8wI+EfXtrmXO6M4JbDiUZH+vsyYySbW2Djr/2ghLrYv6VrD1QATjdswjJ33Jq92V/5YGjgjj+UNICEkLXwIR8DQDA=;
X-UUID: 470156d081d346f09e35a7cde9b21dc4-20201209
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 551216478; Wed, 09 Dec 2020 00:01:21 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 00:01:19 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Dec 2020 16:01:13 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Dec 2020 16:01:16 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v5 00/27] MT8192 IOMMU support
Date: Wed, 9 Dec 2020 16:00:35 +0800
Message-ID: <20201209080102.26626-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_030129_000261_8ABB7DB0 
X-CRM114-Status: GOOD (  18.79  )
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
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 chao.hao@mediatek.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, yong.wu@mediatek.com,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 anan.sun@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch mainly adds support for mt8192 Multimedia IOMMU and SMI.

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

Comparing with the preview SoC, this patchset mainly adds two new functions:
a) add iova 34 bits support.
b) add multi domains support since several HW has the special iova
region requirement.

change note:
v5: a) Add a new patch for the header guard for smi-larb-port.h in [5/27].
    b) Add a new patch for error handle for iommu_device_sysfs_add and
 iommu_device_register[15/27].
    c) Add a flag for the iova "ias == 34" case. the previous SoC still keep
 32bits to save 16KB*3 lvl1 pgtable memory[13/27].
    d) Add include <linux/bitfield.h> for FIELD_GET build fail.
    e) In PM power domain patch, add a checking "pm_runtime_enabled" when call
 pm_runtime_get_sync for non power-domain case. and add a pm_runtime_put_noidle
 while pm_runtime_get_sync fail case.

v4: https://lore.kernel.org/linux-iommu/20201111123838.15682-1-yong.wu@mediatek.com/
  a) rebase on v5.10-rc1
  b) Move the smi part to a independent patchset.
  c) Improve v7s code from Robin and Will.
  d) Add a mediatek iommu entry patch in MAINTAIN.

v3: https://lore.kernel.org/linux-iommu/20200930070647.10188-1-yong.wu@mediatek.com/
  a) Fix DT schema issue commented from Rob.
  b) Fix a v7s issue. Use "_lvl" instead of "_l" in the macro(ARM_V7S_PTES_PER_LVL) since 
  it is called in ARM_V7S_LVL_IDX which has already used "_l".
  c) Fix a PM suspend issue: Avoid pm suspend in pm runtime case.

v2: https://lore.kernel.org/linux-iommu/20200905080920.13396-1-yong.wu@mediatek.com/
  a) Convert IOMMU/SMI dt-binding to DT schema.
  b) Fix some comment from Pi-Hsun and Nicolas. like use
  generic_iommu_put_resv_regions.
  c) Reword some comment, like add how to use domain-id.

v1: https://lore.kernel.org/linux-iommu/20200711064846.16007-1-yong.wu@mediatek.com/

Yong Wu (27):
  dt-bindings: iommu: mediatek: Convert IOMMU to DT schema
  dt-bindings: memory: mediatek: Add a common larb-port header file
  dt-bindings: memory: mediatek: Extend LARB_NR_MAX to 32
  dt-bindings: memory: mediatek: Add domain definition
  dt-bindings: memory: mediatek: Rename header guard for SMI header file
  dt-bindings: mediatek: Add binding for mt8192 IOMMU
  iommu/mediatek: Use the common mtk-smi-larb-port.h
  iommu/io-pgtable-arm-v7s: Use ias to check the valid iova in unmap
  iommu/io-pgtable-arm-v7s: Extend PA34 for MediaTek
  iommu/io-pgtable-arm-v7s: Clarify LVL_SHIFT/BITS macro
  iommu/io-pgtable-arm-v7s: Add cfg as a param in some macros
  iommu/io-pgtable-arm-v7s: Quad lvl1 pgtable for MediaTek
  iommu/mediatek: Add a flag for iova_34 bit case
  iommu/mediatek: Move hw_init into attach_device
  iommu/mediatek: Add fail handle for sysfs_add and device_register
  iommu/mediatek: Add device link for smi-common and m4u
  iommu/mediatek: Add pm runtime callback
  iommu/mediatek: Add power-domain operation
  iommu/mediatek: Add iova reserved function
  iommu/mediatek: Add single domain
  iommu/mediatek: Support master use iova over 32bit
  iommu/mediatek: Support up to 34bit iova in tlb flush
  iommu/mediatek: Support report iova 34bit translation fault in ISR
  iommu/mediatek: Add support for multi domain
  iommu/mediatek: Adjust the structure
  iommu/mediatek: Add mt8192 support
  MAINTAINERS: Add entry for MediaTek IOMMU

 .../bindings/iommu/mediatek,iommu.txt         | 105 -------
 .../bindings/iommu/mediatek,iommu.yaml        | 183 +++++++++++
 MAINTAINERS                                   |   9 +
 drivers/iommu/io-pgtable-arm-v7s.c            |  56 ++--
 drivers/iommu/mtk_iommu.c                     | 289 +++++++++++++++---
 drivers/iommu/mtk_iommu.h                     |  11 +-
 drivers/memory/mtk-smi.c                      |   8 +
 include/dt-bindings/memory/mt2701-larb-port.h |   4 +-
 include/dt-bindings/memory/mt2712-larb-port.h |   6 +-
 include/dt-bindings/memory/mt6779-larb-port.h |   6 +-
 include/dt-bindings/memory/mt8167-larb-port.h |   6 +-
 include/dt-bindings/memory/mt8173-larb-port.h |   6 +-
 include/dt-bindings/memory/mt8183-larb-port.h |   6 +-
 include/dt-bindings/memory/mt8192-larb-port.h | 240 +++++++++++++++
 .../dt-bindings/memory/mtk-smi-larb-port.h    |  22 ++
 include/linux/io-pgtable.h                    |   4 +-
 include/soc/mediatek/smi.h                    |   3 +-
 17 files changed, 764 insertions(+), 200 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
 create mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
 create mode 100644 include/dt-bindings/memory/mt8192-larb-port.h
 create mode 100644 include/dt-bindings/memory/mtk-smi-larb-port.h

-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
