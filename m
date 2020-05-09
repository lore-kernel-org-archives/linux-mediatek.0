Return-Path: <SRS0=UIhI=6X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D913BC54E4A
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 08:40:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB9C724957
	for <linux-mediatek@archiver.kernel.org>; Sat,  9 May 2020 08:40:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OD004F2T";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Jte3LpSy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB9C724957
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LoG2FEY/BZoKW1PXmf+FgU/UXUAd2tocu2hgFP/8vSw=; b=OD004F2TBopix0
	62ffL9NnFq/3NX8zl/fPY4WSypLX55TE2NECYo2lc3PImpmy05qLTKml+nY7jv6GB+Dad7P/m4hku
	chBkbD7bu1wdheCq29cxoiz4OOlZLcuvPkYIJX51phVyi1Abu2CTWcmuxPfYQX1R69KsV8uhQHWTs
	vDRd/ljhUKLqP/7CmotLmbQreD6M0thVCo2dNqv5A+6baRsbbiKbU4msErgKucb+XCHVQufDuKgKj
	kZG/f8+AZhKcvdd8Z8PgLgguSGkbUhTkzMqQeORko+yCQBPHxZx5EsIc6MEZdjoiMX5UueBVYQHG6
	fW4K+E38NbtutyYCyfiA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jXL1n-0003rK-VS; Sat, 09 May 2020 08:40:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jXL1k-0002gI-HB; Sat, 09 May 2020 08:40:10 +0000
X-UUID: 18fa9128f38e4878bda4b48957e7321a-20200509
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=8cJ2Ck2ZkeoyWBaJou7BzsCQTavbcjr0MJiOjUbB1nM=; 
 b=Jte3LpSy0oHGF5A97JMTTFZbahJ0bK2rPOex9c4JTQUtf2A+nUwSqCI2TULzEbpJJbxQMnDPnoZ1yKxQckwaDXrslIxB2qacx+UdXS/g/4z9CNnTh7krqg+GXMmFDWp8rTBwgVilTRk9ywoiaSTZO9oa+X67oLSwnTMZb0BYNpU=;
X-UUID: 18fa9128f38e4878bda4b48957e7321a-20200509
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chao.hao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1577048953; Sat, 09 May 2020 00:39:57 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 01:40:00 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 9 May 2020 16:39:59 +0800
Received: from localhost.localdomain (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 9 May 2020 16:39:57 +0800
From: Chao Hao <chao.hao@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v3 00/07] MT6779 IOMMU SUPPORT
Date: Sat, 9 May 2020 16:36:47 +0800
Message-ID: <20200509083654.5178-1-chao.hao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 787C31370C7B63E58BF1FD368BE1E5CDBF48371E6A6CE604E182B13E85A5061A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200509_014008_604694_6315BDD7 
X-CRM114-Status: UNSURE (   7.69  )
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
 Jun Yan <jun.yan@mediatek.com>, linux-arm-kernel@lists.infradead.org
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
      SMI_LARB(0~11)        |                   |
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
 v3:
  1. Rebase on v5.7-rc1.
  2. Remove unused port definition,ex:APU and CCU port in mt6779-larb-port.h.
  3. Remove "change single domain to multiple domain" part(from PATCH v2 09/19 to PATCH v2 19/19).
  4. Redesign mt6779 basic part
   (1)Add some register definition and reuse them.
   (2)Redesign smi larb bus ID to analyze IOMMU translation fault.
   (3)Only init MM_IOMMU and not use APU_IOMMU.

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
  iommu/mediatek: Disable STANDARD_AXI_MODE in MISC_CTRL
  iommu/mediatek: Move inv_sel_reg into the plat_data
  iommu/mediatek: Add sub_comm id in translation fault
  iommu/mediatek: Add REG_MMU_WR_LEN definition preparing for mt6779
  iommu/mediatek: Add mt6779 basic support

 .../bindings/iommu/mediatek,iommu.txt         |   2 +
 drivers/iommu/mtk_iommu.c                     |  77 +++++--
 drivers/iommu/mtk_iommu.h                     |  10 +-
 include/dt-bindings/memory/mt6779-larb-port.h | 206 ++++++++++++++++++
 4 files changed, 273 insertions(+), 22 deletions(-)

--
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
