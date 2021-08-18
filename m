Return-Path: <SRS0=1z9j=NJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D501C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 02:41:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 254D960FE6
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Aug 2021 02:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 254D960FE6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZU3sNxk/RDJm+kKEkm7lE53B94d89ldRMhRMmVMonfE=; b=diVE+1Xtm2hwcC
	vV5buLyDVrsvlIdAcG3tQMx5wHZfqBZsUSErkl4WE27Z04Xp2MS+6XhNzmDqOPlNscD1TbKYbPwZn
	GBo+cz9xsxsjJjI1/pIiq2ghDTzrTk9s7whzZT2CAYQB8R7auaxps5VIh9cg0EO57Ma26biAcyO3e
	+MEodTJs9kElrvlXGsU+DaVMJ/qaosFEO+UkzxifLvJjlQHugHVXQH3rT+BAKW5BFhvm+Hor7iRuq
	wO3ucLqEndP0CQkESWOs21jWCYq9AI4AQSdL78jcV64ER5l+EnHhXeTKwklvY+qnidxE4rZJLBuqz
	z4RRuTcJ1JLvgkbLtxwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGBWE-003ykz-Dr; Wed, 18 Aug 2021 02:41:30 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGBVc-003yZu-1g; Wed, 18 Aug 2021 02:40:55 +0000
X-UUID: d9b7d0a698214dffaa60e1f98bcdf72f-20210817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1x+G5w3aICx/eevy4O23fIc95dh3intQCjIToY4lYGg=; 
 b=STyElKQnv/Q9Bc+kVSrqGeee2I0iEOEtA+z+L68/2mLJ9G8/SKKa0RmGyVpu4wcEMyVSRAcgIDzGQqOtci9uhaNLAGbbCnE0nbDxxPRjZpf8PWP5/lDN2aU76um3RKA4MEGBkToOzyHxydCXTepO3oZq8KUJ5pV1U0dejYp7i4c=;
X-UUID: d9b7d0a698214dffaa60e1f98bcdf72f-20210817
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1501246388; Tue, 17 Aug 2021 19:40:41 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 17 Aug 2021 19:40:40 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 10:40:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 18 Aug 2021 10:40:38 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, <chunkuang.hu@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <hsinyi@chromium.org>, <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>, 
 <singo.chang@mediatek.com>
Subject: [PATCH v5 0/5] 
Date: Wed, 18 Aug 2021 10:40:32 +0800
Message-ID: <20210818024037.11396-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210817_194052_122149_128E8A55 
X-CRM114-Status: GOOD (  10.78  )
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

Change in v5:
- rebase on kernel-5.14-rc1
- remove unused varriable in mtk-cmdq-mailbox.c

Change in v4:
- change clk array to bulk_clk_data array

Change in v3:
- fix #mbox-cless number in dts

Change in v2:
- remove the second clock in dts and add alias id for gce node
- find the other gce node and get it's clock

jason-jh.lin (5):
  dt-bindings: mailbox: add definition for mt8195
  dt-bindings: gce: add gce header file for mt8195
  arm64: dts: mt8195: add gce node
  mailbox: cmdq: add mediatek mailbox support for mt8195
  mailbox: cmdq: add multi-gce clocks support for mt8195

 .../devicetree/bindings/mailbox/mtk-gce.txt   |   9 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  22 +
 drivers/mailbox/mtk-cmdq-mailbox.c            |  89 +-
 include/dt-bindings/gce/mt8195-gce.h          | 920 ++++++++++++++++++
 4 files changed, 1017 insertions(+), 23 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8195-gce.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
