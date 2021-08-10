Return-Path: <SRS0=C/QR=NB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D6E8C4320A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:15:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F04860C3F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Aug 2021 08:15:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1F04860C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kjzPriJZ8enF4ij4dpHGQQePuCrtga22bLKISpHlmQw=; b=OsZGb7nLo7hjpU
	LaZV/YdxQhLR6g1n19ZhaBxSQeVJq6fEbRWGnwE4GdFwrBn9sbiW4CjdSmlw5EP3gjo8ufE9LMTqr
	f3T9H1CQAqQoCyeevKGKSRI5xJwyOeZsjEf2kq5cL6d9nJklSvPO6RTBWkb8PTG5eDvsqQMn5Y7gg
	FaIA+kDnTxAf45kqx4s868ItMN+vUEY2tNGcoLlNMF69BMcOlfhSyVdiOxC28cWnlQFcTkpzZ/wfL
	jAqbhNAKxf/nIxaj5tpX5Wz0650HE4vAX0To5IceTUxEGCa2rUyDRA8O+wv0HMfpOw2aILv3us1KU
	mDTlZERregQRI24HRF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMvD-002weg-CP; Tue, 10 Aug 2021 08:15:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMsZ-002vGN-Sm; Tue, 10 Aug 2021 08:12:59 +0000
X-UUID: 5cdabca50de04d8b801e2da37e33f5da-20210810
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ll1WlV+J8l2oEBZMq200OXbax41VryrXWHwULGH9SuM=; 
 b=bYS8auiR+73VtQwrc2Mj66o0umuHwdU7yYMINW38//TOCUSCFqZbd0+FDJhj8bd4Y/tbXSYVUEEEMx9JI8klVMWRKXX3IWxOV6aCfITqVySg4xXM5jbI+xjxXgrcN9rjcyoj9SwQhQawUuYyHUalDoWsZeaTrjOGfckFMHtazxM=;
X-UUID: 5cdabca50de04d8b801e2da37e33f5da-20210810
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 775157519; Tue, 10 Aug 2021 01:12:48 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 01:09:09 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Aug 2021 16:09:08 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Aug 2021 16:09:07 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <iommu@lists.linux-foundation.org>, <yong.wu@mediatek.com>,
 <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>
Subject: [PATCH v3 00/13] MT8195 SMI support
Date: Tue, 10 Aug 2021 16:08:46 +0800
Message-ID: <20210810080859.29511-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_011255_993006_38ED9177 
X-CRM114-Status: GOOD (  10.34  )
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

This patchset mainly adds SMI support for mt8195.

Comparing with the previous version, add two new functions:
a) add smi sub common
b) add initial setting for smi-common and smi-larb.

Change note:
v3:1) In the dt-binding:
       a. Change mediatek,smi type from phandle-array to phandle from Rob.
       b. Add a new bool property (mediatek,smi_sub_common)
          to indicate if this is smi-sub-common.
   2) Change the clock using bulk parting.
      keep the smi-common's has_gals flag. more strict.
   3) More comment about larb initial setting.
   4) Add a maintain patch
       
v2: https://lore.kernel.org/linux-mediatek/20210715121209.31024-1-yong.wu@mediatek.com/
    rebase on v5.14-rc1
    1) Adjust clk_bulk flow: use devm_clk_bulk_get for necessary clocks.
    2) Add two new little patches:
       a) use devm_platform_ioremap_resource
       b) Add error handle for smi_probe

v1: https://lore.kernel.org/linux-mediatek/20210616114346.18812-1-yong.wu@mediatek.com/

Yong Wu (13):
  dt-bindings: memory: mediatek: Add mt8195 smi binding
  dt-bindings: memory: mediatek: Add mt8195 smi sub common
  memory: mtk-smi: Use clk_bulk clock ops
  memory: mtk-smi: Rename smi_gen to smi_type
  memory: mtk-smi: Adjust some code position
  memory: mtk-smi: Add error handle for smi_probe
  memory: mtk-smi: Add device link for smi-sub-common
  memory: mtk-smi: Add clocks for smi-sub-common
  memory: mtk-smi: Use devm_platform_ioremap_resource
  memory: mtk-smi: mt8195: Add smi support
  memory: mtk-smi: mt8195: Add initial setting for smi-common
  memory: mtk-smi: mt8195: Add initial setting for smi-larb
  MAINTAINERS: Add entry for MediaTek SMI

 .../mediatek,smi-common.yaml                  |  36 +-
 .../memory-controllers/mediatek,smi-larb.yaml |   3 +
 MAINTAINERS                                   |   8 +
 drivers/memory/mtk-smi.c                      | 596 ++++++++++--------
 4 files changed, 395 insertions(+), 248 deletions(-)

-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
