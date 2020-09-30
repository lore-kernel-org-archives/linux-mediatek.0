Return-Path: <SRS0=Kazo=DH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D155C4741F
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:07:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB19020789
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Sep 2020 07:07:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FZAhmwQm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Gzf172xm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB19020789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q6r2ml3a5JdNzPFjYM+LC9xHd+Qe6GRZAgf0FuHxa48=; b=FZAhmwQmR09VH0vc9TvYdr3F+l
	exD0GbPNcBkbu7RbWDIv+jG6bt88NSHBAvjtUE/d2ckq+U6AMMvSWChmZRIVRhkYqEqNey8DMPGTu
	ot+q9zjP/p6zI365RowOP2SHFfH/LaKE6yhR6Cb7TCyuAHzmvokvRmElD5wF4zVjh+hI2M5+y21W9
	bkY5ETB8pIoMy+6m6PLkO6qQVMdlOMbhjYAO7ZiF1kZ9Vzz4IhFD/18pNedctN6f4cCCqqdlGjwy7
	85oB0+7j7C//CcE2n/eXjzEKiNKrneQ0NN86/+ONMcqr9hpsGx0fwGM7XPX6fTCHkmuCFB6a3CNN6
	OLclmhdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kNWCs-00070V-Ub; Wed, 30 Sep 2020 07:07:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kNWCp-0006zS-85; Wed, 30 Sep 2020 07:07:17 +0000
X-UUID: 3373fcb354b74ac3aaa3c5e41d6f146e-20200929
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=5AhZKEIC00gKIcL6HX6plzcjVbB5Hhhvugp+KrpFUY8=; 
 b=Gzf172xm5DRoi6pR40TKKua2P7MVsWMJQ8MN3GuAHNUljrmE2QXCSfIoF0inyBnKXEmXDVfPniw/Cn6gVK4mXiu+DXhIkq/S0LgYbWVBDqVjwaky6rTl9IfMAf4Z4Sch9EAU+p+EYTpus9Ve+sNziDifNHveY750PDvqaMq6a64=;
X-UUID: 3373fcb354b74ac3aaa3c5e41d6f146e-20200929
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1486944325; Tue, 29 Sep 2020 23:07:03 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 00:07:01 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 30 Sep 2020 15:06:59 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 30 Sep 2020 15:06:57 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>
Subject: [PATCH v3 00/24] MT8192 IOMMU support
Date: Wed, 30 Sep 2020 15:06:23 +0800
Message-ID: <20200930070647.10188-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: FBF17A1314FE8431647D3158E921C25AFB5DE37D010C6932888B9B9AC638F2252000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200930_030715_420222_A143187B 
X-CRM114-Status: GOOD (  17.68  )
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
 chao.hao@mediatek.com, kernel-team@android.com, linux-kernel@vger.kernel.org,
 Evan Green <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 yong.wu@mediatek.com, ming-fan.chen@mediatek.com, anan.sun@mediatek.com,
 Greg Kroah-Hartman <gregkh@google.com>, linux-arm-kernel@lists.infradead.org
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

Comparing with the preview SoC, this patchset mainly adds two new functions:
a) add iova 34 bits support.
b) add multi domains support since several HW has the special iova
region requirement.

this patchset depend on v5.9-rc1.

change note:
v3:
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

Yong Wu (24):
  dt-bindings: iommu: mediatek: Convert IOMMU to DT schema
  dt-bindings: memory: mediatek: Convert SMI to DT schema
  dt-bindings: memory: mediatek: Add a common larb-port header file
  dt-bindings: memory: mediatek: Extend LARB_NR_MAX to 32
  dt-bindings: memory: mediatek: Add domain definition
  dt-bindings: mediatek: Add binding for mt8192 IOMMU
  iommu/mediatek: Use the common mtk-smi-larb-port.h
  iommu/io-pgtable-arm-v7s: Use ias to check the valid iova in unmap
  iommu/io-pgtable-arm-v7s: Extend PA34 for MediaTek
  iommu/io-pgtable-arm-v7s: Add cfg as a param in some macros
  iommu/io-pgtable-arm-v7s: Quad lvl1 pgtable for MediaTek
  iommu/mediatek: Move hw_init into attach_device
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
  memory: mtk-smi: Add mt8192 support

 .../bindings/iommu/mediatek,iommu.txt         | 103 -------
 .../bindings/iommu/mediatek,iommu.yaml        | 159 +++++++++++
 .../mediatek,smi-common.txt                   |  49 ----
 .../mediatek,smi-common.yaml                  | 101 +++++++
 .../memory-controllers/mediatek,smi-larb.txt  |  49 ----
 .../memory-controllers/mediatek,smi-larb.yaml |  92 +++++++
 drivers/iommu/io-pgtable-arm-v7s.c            |  57 ++--
 drivers/iommu/mtk_iommu.c                     | 256 +++++++++++++++---
 drivers/iommu/mtk_iommu.h                     |  11 +-
 drivers/memory/mtk-smi.c                      |  27 ++
 include/dt-bindings/memory/mt2712-larb-port.h |   2 +-
 include/dt-bindings/memory/mt6779-larb-port.h |   2 +-
 include/dt-bindings/memory/mt8173-larb-port.h |   2 +-
 include/dt-bindings/memory/mt8183-larb-port.h |   2 +-
 include/dt-bindings/memory/mt8192-larb-port.h | 239 ++++++++++++++++
 .../dt-bindings/memory/mtk-smi-larb-port.h    |  22 ++
 include/linux/io-pgtable.h                    |   4 +-
 include/soc/mediatek/smi.h                    |   3 +-
 18 files changed, 903 insertions(+), 277 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
 create mode 100644 Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
 create mode 100644 include/dt-bindings/memory/mt8192-larb-port.h
 create mode 100644 include/dt-bindings/memory/mtk-smi-larb-port.h

-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
