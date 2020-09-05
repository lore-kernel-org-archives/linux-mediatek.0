Return-Path: <SRS0=aCep=CO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450ACC43461
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 08:11:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1A2E2074D
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 08:11:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pwSK565+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mFC6jncq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1A2E2074D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2BLdnvo0y5H6PAq+ihqmdtyraF3qot3ClfHRHgBfJK8=; b=pwSK565+bi3p23qsHapQApfivE
	Dk/NPD1AXgvs8RmBtUtlRqBbw51xAlyajoNik5AabnrD799GiRswmwhpa03r7t3w+O48HiSsJBp1a
	/kS1Mr/kS7zHQZzoQETUVhTUfJnij0ojd1id7+ICkvkWiHDNjyTO5mf1mrceqQKUhFp+nvBVNoVW/
	Ddlbw0AtUgcLUVHYZ4PiUkKJbB1gXb4OmyPn9RoUXs9muqMF0W++UK1i0J2yY4FkkgHYFhZPOdzGu
	GTVv77+buDX6r5amrdR7YepPG+JSqreTZEU8rhLxyISMm6KhMTL30rFseOzKBwQ+w2ypDb4UWYNYw
	5Cil/3FQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kETIR-0008Ku-1v; Sat, 05 Sep 2020 08:11:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kETIL-0008Jy-Tb; Sat, 05 Sep 2020 08:11:35 +0000
X-UUID: 8aa852ad21864de2ae22f0976efb7275-20200905
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=gtR2LkYO0KLOhvo1ozezWqVLOaBl17wQ1j3LTpLY/+U=; 
 b=mFC6jncquVt1XwBLEgLVuahLfdjPm8zr75yXPYZRQujmuxMNuDNDupJvD3x+BuT/q+7v4VSsqDHcVKFdcy0lZQ+gcwaZINf1oFGQ7jmj0IXV55Sqm7o2s1MESo7Yg9EPzBOkG1YUzARzHDC50MblVOy3v//+7zdFG6oC24iDs10=;
X-UUID: 8aa852ad21864de2ae22f0976efb7275-20200905
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 680439113; Sat, 05 Sep 2020 00:11:23 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Sep 2020 01:11:21 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 5 Sep 2020 16:11:19 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 5 Sep 2020 16:11:18 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 00/23] MT8192 IOMMU support
Date: Sat, 5 Sep 2020 16:08:57 +0800
Message-ID: <20200905080920.13396-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_041134_150772_357D049F 
X-CRM114-Status: GOOD (  14.79  )
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
 Evan Green <evgreen@chromium.org>, Tomasz
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

Comparing with the preview SoC, this patchset mainly adds two new functions:
a) add iova 34 bits support.
b) add multi domains support since several HW has the special iova
region requirement.

this patchset depend on v5.9-rc1.

change note:
v2:
  a) Convert IOMMU/SMI dt-binding to DT schema.
  b) Fix some comment from Pi-Hsun and Nicolas. like use
  generic_iommu_put_resv_regions.
  c) Reword some comment, like add how to use domain-id.
  
v1: https://lore.kernel.org/linux-iommu/20200711064846.16007-1-yong.wu@mediatek.com/

Yong Wu (23):
  dt-bindings: iommu: mediatek: Convert IOMMU to DT schema
  dt-bindings: memory: mediatek: Convert SMI to DT schema
  dt-bindings: memory: mediatek: Add a common larb-port header file
  dt-bindings: memory: mediatek: Extend LARB_NR_MAX to 32
  dt-bindings: memory: mediatek: Add domain definition
  dt-bindings: mediatek: Add binding for mt8192 IOMMU and SMI
  iommu/mediatek: Use the common mtk-smi-larb-port.h
  iommu/io-pgtable-arm-v7s: Use ias to check the valid iova in unmap
  iommu/io-pgtable-arm-v7s: Extend PA34 for MediaTek
  iommu/io-pgtable-arm-v7s: Add cfg as a param in some macros
  iommu/io-pgtable-arm-v7s: Quad lvl1 pgtable for MediaTek
  iommu/mediatek: Move hw_init into attach_device
  iommu/mediatek: Add device link for smi-common and m4u
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

 .../bindings/iommu/mediatek,iommu.txt         | 103 --------
 .../bindings/iommu/mediatek,iommu.yaml        | 155 +++++++++++
 .../mediatek,smi-common.txt                   |  49 ----
 .../mediatek,smi-common.yaml                  |  97 +++++++
 .../memory-controllers/mediatek,smi-larb.txt  |  49 ----
 .../memory-controllers/mediatek,smi-larb.yaml |  86 ++++++
 drivers/iommu/io-pgtable-arm-v7s.c            |  57 ++--
 drivers/iommu/mtk_iommu.c                     | 247 ++++++++++++++----
 drivers/iommu/mtk_iommu.h                     |  11 +-
 drivers/memory/mtk-smi.c                      |  27 ++
 include/dt-bindings/memory/mt2712-larb-port.h |   2 +-
 include/dt-bindings/memory/mt6779-larb-port.h |   2 +-
 include/dt-bindings/memory/mt8173-larb-port.h |   2 +-
 include/dt-bindings/memory/mt8183-larb-port.h |   2 +-
 include/dt-bindings/memory/mt8192-larb-port.h | 239 +++++++++++++++++
 .../dt-bindings/memory/mtk-smi-larb-port.h    |  22 ++
 include/linux/io-pgtable.h                    |   4 +-
 include/soc/mediatek/smi.h                    |   3 +-
 18 files changed, 880 insertions(+), 277 deletions(-)
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
