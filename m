Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9E6EC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 07:06:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8773361038
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 07:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8773361038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VyPMS4INMzZ/RbQB8hlkCD8TRWpswec2OW8gqdofkGs=; b=ay7KcrAZ22sTz/
	Iay49I/2F5iEuxC41qPpX8GeRciRMD95LNnh95XUiKhqMofZFr3azUORIh17q2cCTwghxdsmy3ecq
	nyJCJCFCLrKoAaH1Lshh3kMKM+pyz7wUg6YSUPVMcqdFEKjI05NPtBS+H6MK9nkxQ+Keu4fylu4tk
	bMPAaYqTlPOsnRc+gRwLM0WlhKYJ3fAdGY3PiFMm7QiJxb698xT/XqHfQfTPoMJqVHjif9C5Kkq3y
	+dzgQRAZDaOEVvXzvCzGxMjlt6SzvNi0uE4knmQ/Ov3YJYMCgKA05GGqKriEsNen54FQSd21mro2C
	wb9YghgKCb84wYdlaIlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mERGR-00C0HW-BY; Fri, 13 Aug 2021 07:05:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mER8h-00BwFV-6n; Fri, 13 Aug 2021 06:58:01 +0000
X-UUID: 6f591b9803e8404c856df9f5ef60501e-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fC3h0D/z3HytKQQjZynqmAJz2L5cIaeOTH6XRSJ0G74=; 
 b=Cdtw1f3KBHhSsVQaGh/UdWgcClNrFdUjOGeNjwKlMPuxckc7LbqRpoEDHUSKIL7TKLuJwchOCF2cSu8RZ1qZ9Ju6pmglFNtlvpMmkrS2Q2752gBQ96qUcRrO/uoGwRC9Rrr2pmk7IcSDApGahyG3Sm4nr6phJsxhwJpcsiHlTJY=;
X-UUID: 6f591b9803e8404c856df9f5ef60501e-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 828890162; Thu, 12 Aug 2021 23:57:47 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 23:53:32 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 14:53:30 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 13 Aug 2021 14:53:29 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>
CC: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Evan Green
 <evgreen@chromium.org>, Tomasz Figa <tfiga@google.com>, Tomasz Figa
 <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>
Subject: [PATCH v2 00/29] MT8195 IOMMU SUPPORT
Date: Fri, 13 Aug 2021 14:52:55 +0800
Message-ID: <20210813065324.29220-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_235759_384203_3343AF37 
X-CRM114-Status: GOOD (  14.61  )
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

This patchset add mt8195 iommu support.

mt8195 have 3 IOMMU HWs. 2 IOMMU HW is for multimedia, and 1 IOMMU HW is
for infra-master, like PCIe/USB.

About the 2 MM IOMMU HW, something like this:

        IOMMU(VDO)          IOMMU(VPP)
           |                   |
      SMI_COMMON(VDO)      SMI_COMMON(VPP)
      ---------------     ----------------
      |      |   ...      |      |     ...
    larb0 larb2  ...    larb1 larb3    ...

these two MM IOMMU HW share a pgtable.

About the INFRA IOMMU, it don't have larbs, the master connects the iommu
directly. It use a independent pgtable.

Also, mt8195 IOMMU bank supports.Normally the IOMMU register size only
is 0x1000. In this IOMMU HW, the register size is 5 * 0x1000. each 0x1000
is a bank. the banks' register look like this:
     ----------------------------------------
     |bank0  | bank1 | bank2 | bank3 | bank4|
     ----------------------------------------
     |global |
     |control|         null
     |regs   |
     -----------------------------------------
     |bank   |bank   |bank   |bank   |bank   |
     |regs   |regs   |regs   |regs   |regs   |
     |       |       |       |       |       |
     -----------------------------------------
All the banks share some global control registers, and each bank have its
special bank registers, like pgtable base register, tlb operation registers,
the fault status registers.
 
In mt8195, we enable this bank feature for infra iommu, We put PCIe in bank0
and USB in bank4. they have independent pgtable.

patch[1..19]:  support mt8195 iommu. 
patch[20..29]: support bank feature.

TODO: there is another APU_IOMMU in mt8195, this should depend on APU patches.
thus, we need add that feature after that.

Change note:
v2: 1) Base on v5.14-rc1.
    2) Fix build fail for arm32.
    3) Fix dt-binding issue from Rob.
    4) Fix the bank issue when tlb flush. v1 always use bank->base.
    5) Adjust devlink with smi-common since the node may be smi-sub-common.
    6) other changes: like reword some commit message(removing many
       "This patch..."); seperate serveral patches.

v1: https://lore.kernel.org/linux-mediatek/20210630023504.18177-1-yong.wu@mediatek.com/
    Base on v5.13-rc1.

Yong Wu (29):
  dt-bindings: mediatek: mt8195: Add binding for MM IOMMU
  dt-bindings: mediatek: mt8195: Add binding for infra IOMMU
  iommu/mediatek: Fix 2 HW sharing pgtable issue
  iommu/mediatek: Adapt sharing and non-sharing pgtable case
  iommu/mediatek: Add 12G~16G support for multi domains
  iommu/mediatek: Add a flag DCM_DISABLE
  iommu/mediatek: Add a flag NON_STD_AXI
  iommu/mediatek: Remove for_each_m4u in tlb_sync_all
  iommu/mediatek: Add tlb_lock in tlb_flush_all
  iommu/mediatek: Remove the granule in the tlb flush
  iommu/mediatek: Always pm_runtime_get while tlb flush
  iommu/mediatek: Always enable output PA over 32bits in isr
  iommu/mediatek: Add SUB_COMMON_3BITS flag
  iommu/mediatek: Add IOMMU_TYPE flag
  iommu/mediatek: Contain MM IOMMU flow with the MM TYPE
  iommu/mediatek: Adjust device link when it is sub-common
  iommu/mediatek: Add infra iommu support
  iommu/mediatek: Add PCIe support
  iommu/mediatek: Add mt8195 support
  iommu/mediatek: Only adjust code about register base
  iommu/mediatek: Just move code position in hw_init
  iommu/mediatek: Add mtk_iommu_bank_data structure
  iommu/mediatek: Initialise bank HW for each a bank
  iommu/mediatek: Add bank_nr and bank_enable
  iommu/mediatek: Change the domid to iova_region_id
  iommu/mediatek: Get the proper bankid for multi banks
  iommu/mediatek: Initialise/Remove for multi bank dev
  iommu/mediatek: Backup/restore regsiters for multi banks
  iommu/mediatek: mt8195: Enable multi banks for infra iommu

 .../bindings/iommu/mediatek,iommu.yaml        |  20 +-
 drivers/iommu/mtk_iommu.c                     | 792 ++++++++++++------
 drivers/iommu/mtk_iommu.h                     |  55 +-
 .../dt-bindings/memory/mt8195-memory-port.h   | 408 +++++++++
 include/dt-bindings/memory/mtk-memory-port.h  |   2 +
 5 files changed, 1010 insertions(+), 267 deletions(-)
 create mode 100644 include/dt-bindings/memory/mt8195-memory-port.h

-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
