Return-Path: <SRS0=lmF9=MN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 075FFC636C8
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 02:35:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4A2F61178
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jul 2021 02:35:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4A2F61178
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xZnRmqNG0rSCd/LzHQH2wxcrhApojGib+migv6TPtRI=; b=CG1GBMlJXU3uBd
	W86Rz3MXtbfM/oMKizTyXqopZHR5ORarqUo0hS1pUOkMUJuhj+U2Ecux0p4LSWAnpIOpZJUIlcYvn
	XOJdSk3lYn+KQs7NDK3TCmLXgZBlqBpnF/zoQ9pAwwlJVaok7d7qN/S7aZhUXaz2qr2Dz/0u1Ydyq
	H+dZ37I6RxR0KonLqtHv0ckZVSinnKbSP5ysz7SujBEhj21dmwrTtHMseQo/7TW7/IXIgErcGaG8Z
	EmOGs/a3M9qgYTNU2GkmnvAuuG1Z3TaUkjigtWMHV5hqTQjdkHwkgPeOkhsvcahAxCNuKvzAdM3j/
	W++w4yIEhQy4ckg5oLdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m624l-00EInN-Tf; Wed, 21 Jul 2021 02:35:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m624N-00EIli-FE; Wed, 21 Jul 2021 02:34:50 +0000
X-UUID: 72043cc4909144908f0daefa5b2d0cd9-20210720
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=LY0+aZAFLh/IvHB3vbBHyRuaTh5LS28Vm/NCAnEC68c=; 
 b=qR/jVZ3qWxSwU+qK/R2cU0AThY/bLUJr/OPxTuGJEuFUONL10wFy60qXZUyfHebNdlUH/tWmmN5K1yErvPCdP4MiHHdJplanu5sJP/VbFW/x/6NHQkhzJBGfvkTS19gaUboNhDRdURF2xhZDKyOZZ0EsD+NdeZwAUwTw1VpMR1s=;
X-UUID: 72043cc4909144908f0daefa5b2d0cd9-20210720
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 63668458; Tue, 20 Jul 2021 19:34:44 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 19:34:43 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 21 Jul 2021 10:34:41 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 21 Jul 2021 10:34:41 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jassi Brar
 <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <hsinyi@google.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v4 0/5] Add gce support for mt8195
Date: Wed, 21 Jul 2021 10:34:35 +0800
Message-ID: <20210721023440.29630-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210720_193447_557925_F329268A 
X-CRM114-Status: GOOD (  10.74  )
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
  mailbox: cmdq: fix GCE can not receive hardward event

 .../devicetree/bindings/mailbox/mtk-gce.txt   |   9 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  24 +
 drivers/mailbox/mtk-cmdq-mailbox.c            |  91 +-
 include/dt-bindings/gce/mt8195-gce.h          | 920 ++++++++++++++++++
 4 files changed, 1021 insertions(+), 23 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8195-gce.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
