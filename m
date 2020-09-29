Return-Path: <SRS0=Ekst=DG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEBD0C4727E
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 03:23:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57E7B216C4
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Sep 2020 03:23:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AKfgq9hF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KCM72qlH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57E7B216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zUYHSabrgIGoZ6Xtvw1yxlkZ4xEvhLALIIq1FCgjpjE=; b=AKfgq9hF7GXB2h63FG1+flY6hx
	EzdxO+CZryY/qpFRiX9HN4zJMgRWHHXnJ9YBsxYSjLQEV3mDUHYJYeyd+++pEjbwjEJpAVQ7gQLcs
	S+hygqVLuIEEHXHC7mzqvxtBBk7aOLH9Y96240k0kTbi8G1C8H6xCZ/6Ywp3vqwAfSnOf6GzScFYp
	4Hj+HsusLtvU6grqmOzZEpKCS4nkYVGQ2cCqHyY+0bzrJXH0zKVNJG5HfDto/q+SwYzICbKdBwOGB
	6v7DN2OaYwC/oq5Tx9KjEK4W8oL6MrCHKk86Js7Tky3LZZB84AjskQqhOZQVHzpuWhdF6L/r6fGxe
	TKqY8Mpg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kN6EH-0002JI-Om; Tue, 29 Sep 2020 03:23:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kN6E7-0002GD-Ot; Tue, 29 Sep 2020 03:22:55 +0000
X-UUID: cdcb24f7a824421b96456937cec580fc-20200928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=GH+44kRU1TnZbUE2nlOmR4VgS/G/oHtxMJIqsP+TCAI=; 
 b=KCM72qlHLx0W9y65dKZBCuKOWd+XxqKBMRj1Ba5Z07rW7G59jR9znPb/scRYXBmwxhbbRfkywrrMBlZMOYDmwZ2dXFq0lc7o2vMKqahSD/XsJw9hBQSk+nY/fOHfSIPNPFvCM9wX49YuWhbjYsLzSjjp/TsOfZm3M5BolIn+rfo=;
X-UUID: cdcb24f7a824421b96456937cec580fc-20200928
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 247730885; Mon, 28 Sep 2020 19:22:44 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Sep 2020 20:22:42 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Sep 2020 11:22:40 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Sep 2020 11:22:40 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v5,0/4] watchdog: mt8192: add wdt support 
Date: Tue, 29 Sep 2020 11:20:01 +0800
Message-ID: <20200929032005.15169-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200928_232252_241951_21207AF7 
X-CRM114-Status: UNSURE (   8.51  )
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
Cc: linux-watchdog@vger.kernel.org, srv_heupstream@mediatek.com,
 seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

v5 changes:
fix typos on:
https://patchwork.kernel.org/patch/11697493/

v4 changes:
revise commit messages.

v3 changes:
https://patchwork.kernel.org/patch/11692731/
https://patchwork.kernel.org/patch/11692767/
https://patchwork.kernel.org/patch/11692729/
https://patchwork.kernel.org/patch/11692771/
https://patchwork.kernel.org/patch/11692733/

Crystal Guo (4):
  dt-binding: mediatek: watchdog: fix the description of compatible
  dt-binding: mediatek: mt8192: update mtk-wdt document
  dt-binding: mt8192: add toprgu reset-controller head file
  watchdog: mt8192: add wdt support

 .../devicetree/bindings/watchdog/mtk-wdt.txt       |  5 ++--
 drivers/watchdog/mtk_wdt.c                         |  6 +++++
 .../dt-bindings/reset-controller/mt8192-resets.h   | 30 ++++++++++++++++++++++
 3 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
