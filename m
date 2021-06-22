Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F258C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:01:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC33A61001
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 15:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC33A61001
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lZ4GAtg+A1Lm3GQd96yRVf2AFnZAGCfk/CmtHVNh5C0=; b=dKpBOX21NNwXiq
	VIAPhucTPt6ViRj5cY063/cuWNvhfi8vaBPG6yUtiKxmGTV56pEvutHeIqpeOAXbkOhzk8Fk4EBYa
	gy8394yhi+lUv1fBFGtuEmabApv77ZkVN0jduWEBKT0QMI7Kgp41zG5v527G2iLWgukKCeOvk8Vxt
	liEiyc+xfggWXkwQFMm3F/rEVWy457/yO1I7+ODsnHDBmfA+vq9uFnwtu5UIOnm0eDby6z4XwrImi
	U1r9IgFzCMfJi8mdnlrx7oMu7Gc82TkPmh93yNkAHV6OvqLeYulh54zPrVANaDWZsbflKdeWZcMqi
	4aGAk4ztyqzXI6r5j8XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvhtk-007aBs-HK; Tue, 22 Jun 2021 15:01:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvhtW-007a7v-4N; Tue, 22 Jun 2021 15:00:56 +0000
X-UUID: a0e2dfa63f204d459802e6f19e3a32a9-20210622
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ZKUt5rVF8GdS+zD8RcVlu7E+HaAsQnZtCzTvSKSsyog=; 
 b=FU7+a3KzFpoNgzWfw0h7/2uHKaSS/0byUQqkdvvNi52rGz1U214xxRm+rCXEPKKLUnrWCzjxkZ9NVB2C1ZWpuo2JxH20BVP+XIjB6D3knIyTntN61sh0mUmW0W3xcAG/8OiQAoEjJ2i8gQJ1g7dTEcz4woxNrMJ8tlKLqS80NZI=;
X-UUID: a0e2dfa63f204d459802e6f19e3a32a9-20210622
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <christine.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1923499117; Tue, 22 Jun 2021 08:00:49 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 07:52:10 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Jun 2021 22:52:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Jun 2021 22:52:08 +0800
From: Christine Zhu <Christine.Zhu@mediatek.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <inux-kernel@vger.kernel.org>,
 <linux-watchdog@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <seiya.wang@mediatek.com>
Subject: [v2,0/3] watchdog: mt8195: add wdt support
Date: Tue, 22 Jun 2021 22:50:11 +0800
Message-ID: <20210622145013.28846-1-Christine.Zhu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_080055_648478_C4F2FFE8 
X-CRM114-Status: UNSURE (   7.68  )
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

Change since v2:
  - Remove the unneeded tag
  - Add other proper prefixes on title
  - Add mt8195 of_device_id

Change since v1:
  - Supports MT8195 watchdog device
  - Supports MT8195 watchdog reset-controller

christine.zhu (3):
  dt-binding: mediatek: mt8195: update mtk-wdt document
  dt-binding: reset: mt8195: add toprgu reset-controller head file
  watchdog: mediatek: mt8195: add wdt support

 .../devicetree/bindings/watchdog/mtk-wdt.txt       |  2 +-
 drivers/watchdog/mtk_wdt.c                         |  6 +++++
 .../dt-bindings/reset-controller/mt8195-resets.h   | 29 ++++++++++++++++++++++
 3 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/reset-controller/mt8195-resets.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
