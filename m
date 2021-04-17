Return-Path: <SRS0=E/q6=JO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D75C433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 06:48:29 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 202E7611CC
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Apr 2021 06:48:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 202E7611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4g65S4dXvuM2gXJ6U5TID6gVGiCJka3iuo4/+w58/DM=; b=U93MOpwNeIuFxiDj5f7ctNmOBB
	sXe2m2ZRtcC0PkXDwM7TeSBNgdFzNvVc2tIpfkYbnBrp495fatSJ2KlrKt0G3K8c+uorA8QmuOBfM
	n1X1SUYBf1Y/b4UKkBlwRIr8B1/sfJf2bkMHSgZVEYeFE2lboY6zGDXsoPLmv1R453z8Dj8rAeDeI
	hemAvhONCq6bek/vioqKKGsLtwWd3KNodOBvL1cI6XJ7D1dPlAynImuxSxiAYY7DjCoQKY5n98TaM
	/uwXPz4RhkK2DFx/dUOQ45KywwfKr4mBBGVJauxDlGE6hEUuHxI93Nftshu+3zRJHkaBB8tsVaMCy
	jx4fCYew==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXekX-004ZcM-NM; Sat, 17 Apr 2021 06:48:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXejl-004ZX0-98; Sat, 17 Apr 2021 06:47:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=n0zdftiz980XcTOPpNvBGZ7BsjqAFLLDYUvKOGge5Rs=; b=mNva/JhMpCiA35iOH50+nNG3y/
 Dag30MvxTBmc9DF3tD2TjS8C7LZ+DrNXm9bBOvPJGo8zELAo/nR4VIROCqCzmmbfFVjbtAvspR2K4
 mPi1V1Cljy/f8tr3H/vLCIUnnBRwNstxeatOcxp/XWMy2HY86vwqVPKjVG9nv3WNKSwFfbtWMsKGI
 0dIEds+vxAiWoXMX5hdKfwDGiIlcUQenLKN4CufV7t0WU7cuDJ0fR4c9wW59vQa5m/8k0uQpCFsts
 040t1Zu25C7ynVSaGzYDAS7mehO2cthhIwojegk5YqydPIVd9Sw/ma/ltJriyN9HzVWKE77jlsyku
 dLqWw16A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXeje-009uCH-QB; Sat, 17 Apr 2021 06:47:24 +0000
X-UUID: da0f58f431ba4e48a7a386ae8ea343e1-20210416
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=n0zdftiz980XcTOPpNvBGZ7BsjqAFLLDYUvKOGge5Rs=; 
 b=OJHaY39/6WI1GtBEnzvNymTTvKPPrwFcFJEpP6UL/zNdO3r0E0SnkXSas1ssSeWq7sOLW0ZDxKU9wBeNRvEItFAMJJg9ZvK9Jz16C9JV6kI+am+kwWIEdg0f7QEotU6Ja2mMhcRxa7c2y7NvoFtxoV8d8ur1JgJ2uwPH6N98+Yk=;
X-UUID: da0f58f431ba4e48a7a386ae8ea343e1-20210416
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 615217538; Fri, 16 Apr 2021 23:47:11 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 16 Apr 2021 23:47:10 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Apr 2021 14:47:08 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Apr 2021 14:47:08 +0800
From: Qii Wang <qii.wang@mediatek.com>
To: <wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <linux-i2c@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <leilk.liu@mediatek.com>, <qii.wang@mediatek.com>
Subject: [PATCH 0/3] Add some fix patches
Date: Sat, 17 Apr 2021 14:46:49 +0800
Message-ID: <1618642012-10444-1-git-send-email-qii.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_234718_870639_095B8674 
X-CRM114-Status: UNSURE (   7.02  )
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

This series are based on 5.12-rc2 and we provide three i2c patches
to fix some historical issues.

Qii Wang (3):
  i2c: mediatek: Fix send master code at more than 1MHz
  i2c: mediatek: Fix wrong dma sync flag
  i2c: mediatek: Use scl_int_delay_ns to compensate clock-stretching

 drivers/i2c/busses/i2c-mt65xx.c | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
