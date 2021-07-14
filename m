Return-Path: <SRS0=d5Ie=MG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F3EC11F66
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 16:52:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF8A5613C8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Jul 2021 16:52:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF8A5613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A1WbxpclsuWl6sw3BZfAiYfQimJR7+MhACB7zC1P72s=; b=c/ls5viDq4BPHj
	SJW7+6L7EUvjSJXcWvnPKoF0XjQju+5lswPf119md+T1Khkgn7L37ttzzwpPpd5tSx//ZOvBShrEG
	mtzj8jWlU0ScusmQbeeRWA/8md4jMGW2RvotcqdHKCVmk9bNYkaB79Da3SltF5p3o8XfEqAi/M5r+
	SN4t+Uu4DovEUKW5dR3OGMGbqV3Irv1iG11oiOHQhbumYdcHuh+iCS0I3KIBP8c+qLpuybEvU7Tnp
	OBcSriYoXxSDuTXU5Pz/9AjlzeMS9c1nV2IyJMQhx/t/b8QdSYrDpQiI9PsW4vWyTlqR/XU+iAs/7
	a5vr7N9EnfmsTSlqnMhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m3i7T-00EAjW-CB; Wed, 14 Jul 2021 16:52:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m3i7P-00EAhh-7N; Wed, 14 Jul 2021 16:52:21 +0000
X-UUID: 564ca31f1ddd4b82802b30759646a6f8-20210714
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Y4Y4UU+JKM5hCL6/KUjJq4AkGk9XKns8f5gAyYWEqXY=; 
 b=MTq828CvK8Z6aJu7kvI9pIIh+7HGX0CAGLlKal65pMCmJsyZYft/Kwx0hgazRqFYvygG1ztV4DlxQ8vZ0K1EIeregPCr8e7qTpUcjjbyKc3aCZU5a8QNbTVbjYW1yT3IIAmbBf6c2out8KChWibrl7S7vvTDpE6qajyosB12G5w=;
X-UUID: 564ca31f1ddd4b82802b30759646a6f8-20210714
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 67878488; Wed, 14 Jul 2021 09:52:14 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 14 Jul 2021 09:52:12 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 15 Jul 2021 00:52:10 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 15 Jul 2021 00:52:10 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <hsinyi@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v3 0/5] Add gce support for mt8195
Date: Thu, 15 Jul 2021 00:52:03 +0800
Message-ID: <20210714165208.2841-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210714_095220_474021_ED2A45C6 
X-CRM114-Status: UNSURE (   9.41  )
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
 drivers/mailbox/mtk-cmdq-mailbox.c            | 104 +-
 include/dt-bindings/gce/mt8195-gce.h          | 920 ++++++++++++++++++
 4 files changed, 1035 insertions(+), 22 deletions(-)
 create mode 100644 include/dt-bindings/gce/mt8195-gce.h

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
