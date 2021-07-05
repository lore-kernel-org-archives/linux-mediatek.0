Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47D8C07E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:35:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99DE6613E1
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99DE6613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FVKObalz34q281PLRqCp0+RgHGzReV80ncwajUclhbg=; b=hoPrnb4JLJm2Dl
	EZj045EE6jfr79VsaCn8AsW3ogI1zjiYG8S7RGTadNtsK9PpS5P7yXQTVt+XnlrAnc492BUSfWt9Z
	yHQXn3qHnpuOpmArsSEXpTNMgl4dX2F8k0DzykCb8VQ4u+FHLdRnpbUXlH26pehPqO3Xm90e4kc7Z
	qxRboS6Guz6bnnYumieUFSPg2HLv60B1z3f8CyvtO7qH/e1ZmRdoSqwP7Mi5x6a+YlxsrlbMXd38v
	NnzzsMW3BtqerP4fG93GkD+2OB3PVWe5gj2H292sorSTfcbJPu2OqHVbL4qth/XQhaIacYQkdVQ9V
	KW9LKsq3efZvNSkcpKVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HFt-007rKV-7J; Mon, 05 Jul 2021 05:34:53 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0HFq-007rFe-0o; Mon, 05 Jul 2021 05:34:51 +0000
X-UUID: a6b0bae9561b4be391b01edbd35e8196-20210704
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=28RokHyKY4F9b3Doet20urS1zon6ny5f8IfpxagBTSo=; 
 b=hBaS++8rBtzIAf4gwlC8cqqADbGsLaZEz3u27XipIRdB1y6LGACKbg1nnQQFbJTIKxlAqwOjUdmDkOCvERuba7Aeye5LsWN3bgD5LHc3FFdIJtlpHjks9XXKWFG4c1b60dNefpsCGAb72uEtRAJS658KksfetQhlRcxaih/U66A=;
X-UUID: a6b0bae9561b4be391b01edbd35e8196-20210704
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1357028281; Sun, 04 Jul 2021 22:34:42 -0700
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 4 Jul 2021 22:34:41 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 5 Jul 2021 13:34:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 5 Jul 2021 13:34:39 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v2 0/5] Add gce support for mt8195
Date: Mon, 5 Jul 2021 13:34:24 +0800
Message-ID: <20210705053429.4380-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_223450_092941_29F88596 
X-CRM114-Status: UNSURE (   8.91  )
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

Since GCE can increase performance for register configuration,
CMDQ driver is neccessary for driving GCE.

Add below patch to support GCE driver on MT8195:
[PATCH v2 1/5] dt-bindings: mailbox: add definition for mt8195
[PATCH v2 2/5] dt-bindings: gce: add gce header file for mt8195
[PATCH v2 3/5] arm64: dts: mt8195: add gce node
[PATCH v2 4/5] mailbox: cmdq: add mediatek mailbox support for mt8195
[PATCH v2 5/5] mailbox: cmdq: fix GCE can not receive hardward event

 .../devicetree/bindings/mailbox/mtk-gce.txt   |   9 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      |  24 +
 drivers/mailbox/mtk-cmdq-mailbox.c            | 101 +-
 include/dt-bindings/gce/mt8195-gce.h          | 920 ++++++++++++++++++
 4 files changed, 1032 insertions(+), 22 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8195-gce.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
