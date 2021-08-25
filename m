Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F3DC4320A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 09:53:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D2E6761163
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 09:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D2E6761163
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xPXj/V2PXI6XitggOQuMGe3lTj3XKutVWHsfH1wsbco=; b=B3xTVogW5jCie+
	m2ex/vG0gLtv3Exp6kCUCiq0oTHjCLtg+k0/3H5I39KwUbDeOYNF9I9vbsVY4Xh0j5FzW67kufyTp
	Qda7R9mdS9m2P/IW0pjxrwnJ8jBYw3Win9WuHhsuCbpoj6UAMqUSjLWz62P/5kAY5KU6CqRR1JCVt
	lxWWeN+ePpKWy75TbknGsHL/yyTboJKnyLn2XVpQWMUZn8HSt4Qcq9SRXaEMmv5oCjR14ZU5PUOTw
	6Ly/sDqq4IkypyMZtqSp1vuXV3eIoIzX6SXyz1WMvlw/yEDl8DdNV9y/eP/TzPaoiVQTwMT0oqGeL
	d8TVXfuVtxQuB30N104A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIpb8-006GRp-Fh; Wed, 25 Aug 2021 09:53:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIpZ8-006FVB-Ii; Wed, 25 Aug 2021 09:51:30 +0000
X-UUID: e2ce47d36f7e4efc9858d457729d5e57-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=iyBhm4TP0ifldYyWNRcQt7kOVLtwvMNieUwpcEEwYII=; 
 b=VW6pYtIgZZC4ynQ/TcZEsAQEOsGMGQCX7JwyKtxJpqX9dcpU5d/OsnDPcqtUqtznvXFVJGESJju72evAGzI7My1LTy/buZ+1ixO5cEPhYspX27czorQL7MsN787VA8XYnE37ASq7e9I59VA1P1thp+15yZkRdIJwEelVwhF5paQ=;
X-UUID: e2ce47d36f7e4efc9858d457729d5e57-20210825
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 936471232; Wed, 25 Aug 2021 02:51:24 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 02:41:22 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 17:41:21 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 25 Aug 2021 17:41:21 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jassi Brar
 <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <hsinyi@google.com>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v6 0/5] Add gce support for mt8195
Date: Wed, 25 Aug 2021 17:41:15 +0800
Message-ID: <20210825094120.5005-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_025126_678756_D5FFEBB7 
X-CRM114-Status: GOOD (  10.57  )
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

Change in v6:
- remove the unused define in GCE header file.

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
 include/dt-bindings/gce/mt8195-gce.h          | 805 ++++++++++++++++++
 4 files changed, 902 insertions(+), 23 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8195-gce.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
