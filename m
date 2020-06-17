Return-Path: <SRS0=3SR4=76=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7E9DC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 03:11:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C1F62082F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Jun 2020 03:11:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RwZUk5ZS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Z0lZDMfu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C1F62082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SBN0vgicKBIG9ZPROmuRZ6Qk3dImoKK+MMzI/hIvaL8=; b=RwZUk5ZS7Yoz7N
	9bcuJtglYndDYopBkB3fLcEnDwqoMZwBfCSrI4B/EbY7caczdjvx468YObp1aaxeRGhRVnGR4j4NF
	y/qeH0LWQr8Uzqs/HaquZbnMFgvbTf3OuHVlqjd65AFuS4fmdCXuSQvwdCwmAZdDR0E5E3ufK3R+P
	xMWcmMZ41K87AmTo4/w8VV2qVrhQKyGqVz5eNTAGjI2UNZ87Yx9d1qzmAzmkP+Bd3zXgGdrxwO+z4
	0hrNQq/gUVBUgDdsrbB0dHZdNAZwmwDMRyQez7FWquhRHAHmGAO5PJ3nDNCWBW0h20Z9NlbJQqyDL
	MNvy452N4HHJ9GcEYjMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jlOU5-0007xS-BQ; Wed, 17 Jun 2020 03:11:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlOTn-0007iF-FL; Wed, 17 Jun 2020 03:11:13 +0000
X-UUID: e43c7d7a3e3c42f2ba5f84741cb747b1-20200616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Wis5vDqsbbB93AdFA7XLcfdhnuaZidhnla8UOIBO0ek=; 
 b=Z0lZDMfuA73ttTRjNXk5cXsLpPy7lxeqDcRx9fGKBUDMHklFmQAbR+KGEzCw+bggY4Ik7696457hhpO40ruHPMXxLLBLPIiykfDihVXe/qt/qn6K322WXCFsYmbRinGvmWgbAJHOxKiN/KvakUy4aBGhHKUnGP6iE1Ft9gE7a2I=;
X-UUID: e43c7d7a3e3c42f2ba5f84741cb747b1-20200616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1788461510; Tue, 16 Jun 2020 19:10:56 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Jun 2020 20:00:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 17 Jun 2020 11:00:50 +0800
Received: from localhost.localdomain (10.15.20.246) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 17 Jun 2020 11:00:48 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 "Matthias Brugger" <matthias.bgg@gmail.com>
Subject: [PATCH v4 00/07] MT6779 IOMMU SUPPORT
Date: Wed, 17 Jun 2020 11:00:22 +0800
Message-ID: <20200617030029.4082-1-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: FB8C3C131B059E05A7015CC9206665E6513E2B80B0D5808ABDA7442D20A11FCC2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200616_201111_524123_9E45C732 
X-CRM114-Status: UNSURE (   7.91  )
X-CRM114-Notice: Please train this message.
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
 linux-mediatek@lists.infradead.org, Yong Wu <yong.wu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
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
Multimedia engine      CCU           VPU   MDLA   EMDA

All the connections are hardware fixed, software can not adjust it.
Compared with mt8183, SMI_BUS_ID width has changed from 10 to 12. SMI Larb number is described in bit[11:7],
Port number is described in bit[6:2]. In addition, there are some registers has changed in mt6779, so we need
to redefine and reuse them.

The patchset only used MM_IOMMU, so we only add MM_IOMMU basic function, such as smi_larb port definition, registers
definition and hardware initialization.

change notes:
 v4:
   1. Rebase on v5.8-rc1.
   2. Fix coding style.
   3. Add F_MMU_IN_DRDER_WR_EN definition in MISC_CTRL to improve performance.

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

Chao Hao (7):
  dt-bindings: mediatek: Add bindings for MT6779
  iommu/mediatek: Rename the register STANDARD_AXI_MODE(0x48) to
                  MISC_CTRL
  iommu/mediatek: Set MISC_CTRL register
  iommu/mediatek: Move inv_sel_reg into the plat_data
  iommu/mediatek: Add sub_comm id in translation fault
  iommu/mediatek: Add REG_MMU_WR_LEN definition preparing for mt6779
  iommu/mediatek: Add mt6779 basic support

 .../bindings/iommu/mediatek,iommu.txt         |   2 +
 drivers/iommu/mtk_iommu.c                     |  92 ++++++--
 drivers/iommu/mtk_iommu.h                     |  10 +-
 include/dt-bindings/memory/mt6779-larb-port.h | 206 ++++++++++++++++++
 4 files changed, 285 insertions(+), 25 deletions(-)

--
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
