Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 283A6C433E5
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 04:43:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEA1820760
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 04:43:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UB3CHl7n";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FBmpSp5s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEA1820760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0EL0n59KhnK1c6Pg+UlTrLdIJZJ6PocVANpA2f0FVHQ=; b=UB3CHl7nJcxuTAckZf1bmoWLjm
	F0QAP3zHPnj9iFX1c96oR4od19WVH/CCCLdkfawmypvZpjIRmwD+ZB9lpdtJUx9BCP0oxr+pv1u0c
	dxvU9A2bei3U7S7qRF10SzSIRbE5fJVV2vFn+5mKYeyRCah4HaH5wVE4k0mNAPTFFClPiRReB8mH+
	vP2wdBvofP3JjkyhkErAGOtiXp+6IVVo8LoyMKvgW3fDVEzzi5w9Rm7Tf4bWS6jKiX8oprP1m2TJm
	Wrg1OhcM9AJaPRULZjXerv33xnOHc/jXeOoEDjTEg8yvsRp+0ZvaEQBKJwK6VWXAmcG9VdrwFWRME
	prkw85yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrDXJ-0002th-2o; Fri, 03 Jul 2020 04:42:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrDXF-0002s6-DD; Fri, 03 Jul 2020 04:42:50 +0000
X-UUID: 51a699a83584446f822a7faaacd7f6d5-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fOIE/14eP5QaMvpr+A/0WJuqIjmfhZZCLzsc96MbxFk=; 
 b=FBmpSp5sgM1MgGrtTB8j1A/LiD8HFLVeEeXL3z3YMgGJo6NlObHSbGefDXMRtqXEYAAP8PKNhPN/iX8bj4u9Nk++VND4QxtqNiJ0tDtbGGFx+/q4V5x1r+AYN8ZiJRKak1vgPxd8VRPP4bpX7simh7EFrRBXA3AktVzuBLv4xCQ=;
X-UUID: 51a699a83584446f822a7faaacd7f6d5-20200702
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 242711830; Thu, 02 Jul 2020 20:42:41 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 21:42:40 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 3 Jul 2020 12:42:37 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Jul 2020 12:42:33 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v6 00/10] MT6779 IOMMU SUPPORT
Date: Fri, 3 Jul 2020 12:41:17 +0800
Message-ID: <20200703044127.27438-1-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: E4EE501486CFE45934E76861F54A424896840F7B4C9AC2ECB55F96F8AE402C6E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_004249_611465_68E7FEFA 
X-CRM114-Status: GOOD (  10.11  )
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
Cc: devicetree@vger.kernel.org, FY Yang <fy.yang@mediatek.com>,
 wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 Chao Hao <chao.hao@mediatek.com>, iommu@lists.linux-foundation.org,
 TH Yang <th.yang@mediatek.com>, linux-mediatek@lists.infradead.org,
 Yong Wu <yong.wu@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patchset adds mt6779 iommu support.
mt6779 has two iommus, they are MM_IOMMU(M4U) and APU_IOMMU which used ARM Short-Descriptor translation format.
The mt6779's MM_IOMMU-SMI and APU_IOMMU HW diagram is as below, it is only a brief diagram:
                       EMI
		        |
     --------------------------------------
     |                                    |
  MM_IOMMU                            APU_IOMMU
     |                                    |
 SMI_COMMOM-----------                 APU_BUS
     |                |                   |
  SMI_LARB(0~11)      |                   |
     |                |                   |
     |                |             --------------
     |                |             |     |      |
Multimedia engine    CCU           VPU   MDLA   EMDA

All the connections are hardware fixed, software can not adjust it.
Compared with mt8183, SMI_BUS_ID width has changed from 10 to 12. SMI Larb number is described in bit[11:7],
Port number is described in bit[6:2]. In addition, there are some registers has changed in mt6779, so we need
to redefine and reuse them.

The patchset only used MM_IOMMU, so we only add MM_IOMMU basic function, such as smi_larb port definition, registers
definition and hardware initialization.
change notes:

 v6:
  1. Fix build error for "PATCH v5 02/10".
  2. Use more precise definitions and commit messages.

 v5:
  1. Split "iommu/mediatek: Add mt6779 IOMMU basic support(patch v4)" to three patches(from PATCH v5 08/10 to PATCH v5 10/10).
  2. Use macro definitions to replace bool values in mtk_iommu_plat_data structure
 http://lists.infradead.org/pipermail/linux-mediatek/2020-June/013586.html

 v4:
  1. Rebase on v5.8-rc1.
  2. Fix coding style.
  3. Add F_MMU_IN_DRDER_WR_EN definition in MISC_CTRL to improve performance.
 https://lkml.org/lkml/2020/6/16/1741

 v3:
  1. Rebase on v5.7-rc1.
  2. Remove unused port definition,ex:APU and CCU port in mt6779-larb-port.h.
  3. Remove "change single domain to multiple domain" part(from PATCH v2 09/19 to PATCH v2 19/19).
  4. Redesign mt6779 basic part
    (1)Add some register definition and reuse them.
    (2)Redesign smi larb bus ID to analyze IOMMU translation fault.
    (3)Only init MM_IOMMU and not use APU_IOMMU.
 http://lists.infradead.org/pipermail/linux-mediatek/2020-May/029811.html

 v2:
  1. Rebase on v5.5-rc1.
  2. Delete M4U_PORT_UNKNOWN define because of not use it.
  3. Correct coding format.
  4. Rename offset=0x48 register.
  5. Split "iommu/mediatek: Add mt6779 IOMMU basic support(patch v1)" to several patches(patch v2).
 http://lists.infradead.org/pipermail/linux-mediatek/2020-January/026131.html

 v1:
 http://lists.infradead.org/pipermail/linux-mediatek/2019-November/024567.html

Chao Hao (10):
  dt-bindings: mediatek: Add bindings for MT6779
  iommu/mediatek: Rename the register STANDARD_AXI_MODE(0x48) to MISC_CTRL
  iommu/mediatek: Use a u32 flags to describe different HW features
  iommu/mediatek: Setting MISC_CTRL register
  iommu/mediatek: Move inv_sel_reg into the plat_data
  iommu/mediatek: Add sub_comm id in translation fault
  iommu/mediatek: Add REG_MMU_WR_LEN_CTRL register definition
  iommu/mediatek: Extend protect pa alignment value
  iommu/mediatek: Modify MMU_CTRL register setting
  iommu/mediatek: Add mt6779 basic support

 .../bindings/iommu/mediatek,iommu.txt         |   2 +
 drivers/iommu/mtk_iommu.c                     | 110 +++++++---
 drivers/iommu/mtk_iommu.h                     |  20 +-
 include/dt-bindings/memory/mt6779-larb-port.h | 206 ++++++++++++++++++
 4 files changed, 299 insertions(+), 39 deletions(-)

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
