Return-Path: <SRS0=hSNv=LK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C264FC48BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 11:48:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7AA7261241
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Jun 2021 11:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7AA7261241
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Si3pK6C/AIgqaeE7chEOrSWvFYwH6nN9x5Mq57Yor3s=; b=nt+7ybXlP158ZL
	HT4ienmjHr2cb/22Sdrfh4HnMIPvw4QOvRw31Q0C4myT6qUSlMVwd/v4IL6ELmDCChMbDgVtdvnXo
	0Y3Q9hz+UL23GSy2P4bTaAj2aNSQP77n+zZPUylvAeQPcoxzYuQrntxTX/+E9H4wjyA5HX/R1Xdfd
	ZNy/6iLsYN7B11qh14ouIG3UIwNEumlorxbSKjQDMJKDAA61vHkLFEd75f+jkr1dzTW6GimnxrPor
	yzwSyruf0Rmu88J983VAefu1CwKg7Jc4AXDBohpSSx9pMeGL1K+hB4h+YNCNjGpi9yXd6a+bO0MXm
	eF1b5jKG/xSlrrsL0vnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltU1s-0067Ay-JR; Wed, 16 Jun 2021 11:48:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltU1o-006797-PP; Wed, 16 Jun 2021 11:48:18 +0000
X-UUID: faf3ee83d2804e2eb42a46346905b2ba-20210616
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Can2AiTGHVRLiccI3P/mkLBW/BQPG9koi2bl/6TXByI=; 
 b=asXgTDRp1gWYXHBcn82X4ZIuvaK2V4F9mC+LxXdSF9f7YA/xKiMCkaSyI/TTAzO4Z8wuaHjEi7hMQAhafN9e7vkSCaEVWITUHUDed0U7m8n9CMSNVAfn1Hl5s3Q8Xk5m2tdeDdFIWBQ/bU3pGsZnz9C0uc6J/Rvw8fBKkovNWik=;
X-UUID: faf3ee83d2804e2eb42a46346905b2ba-20210616
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1865852088; Wed, 16 Jun 2021 04:48:12 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 04:43:57 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Jun 2021 19:43:55 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Jun 2021 19:43:54 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, "Tomasz
 Figa" <tfiga@chromium.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, <anan.sun@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>,
 <anthony.huang@mediatek.com>
Subject: [PATCH 0/9] MT8195 SMI support
Date: Wed, 16 Jun 2021 19:43:37 +0800
Message-ID: <20210616114346.18812-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210616_044817_164670_702CF5F4 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

Yong Wu (9):
  dt-bindings: memory: mediatek: Add mt8195 smi binding
  dt-bindings: memory: mediatek: Add mt8195 smi sub common
  memory: mtk-smi: Use clk_bulk instead of the clk ops
  memory: mtk-smi: Rename smi_gen to smi_type
  memory: mtk-smi: Adjust some code position
  memory: mtk-smi: Add smi sub common support
  memory: mtk-smi: mt8195: Add smi support
  memory: mtk-smi: mt8195: Add initial setting for smi-common
  memory: mtk-smi: mt8195: Add initial setting for smi-larb

 .../mediatek,smi-common.yaml                  |  31 +-
 .../memory-controllers/mediatek,smi-larb.yaml |   3 +
 drivers/memory/mtk-smi.c                      | 568 ++++++++++--------
 3 files changed, 347 insertions(+), 255 deletions(-)

-- 
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
