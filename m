Return-Path: <SRS0=4wrq=4P=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B04C4BA24
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 07:47:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36D6721D7E
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Feb 2020 07:47:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="k7VbIOhO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="JkvP3VTa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36D6721D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u+Z9Fk2kvH7jd9v2n0HCY7RJZTKyoQZ/xHzt1Mv3u4k=; b=k7VbIOhOrwZJ5q
	6uxHM8KmLBsJFCwaMh6S+ZXEIl0YFXx8tjnUizbpAw2ndRuKvksU+YjxHeVtrrJjOvfpfonGr3Obj
	bLmqzgtGVYg2SNVJrLsFM/yXXtwWHWPzue/2DIsDKy8faymg70hW39f3z62/jPpXtaCAxPCl7qh0t
	Fy6EvDpQVLZXx44whVNdDrUxXKd7rgWZ2n1KVD6gRTrgQqRYAziqbWPhIErvemINyTN+V9qhWIWV3
	vrOESevwUjmRkAhQbZDfzhrfh56wnXCCfkdaOMian2MK6kcx588GUUO6VvtjLgaMBrsA+kg33s/Z5
	LXFNkf3gY0rm3K9IUoTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7DtK-0007C0-IZ; Thu, 27 Feb 2020 07:47:30 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7DtI-0007BZ-7V; Thu, 27 Feb 2020 07:47:29 +0000
X-UUID: 83a0b8c0cb064be695a32bdc7206bdb6-20200226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=+5M99LfMbwTXMY9+aRBavWPAEEJcb7M0pwyTINcskOc=; 
 b=JkvP3VTa+HWKUWjuWwIdgjQLENChFgGOMEgZCoguztKh1DeSE7GgnGFLaJLeDLPChenQR5Jnpie+hb7KXnvZHaX0W9vyo+qHylf/Zvx5DN8wF1VDAQ/9IMlZ3i/xY1lACD35K5/UlbreV0MsJkpJ3HVsPGzqWACN6wX61vDSYV4=;
X-UUID: 83a0b8c0cb064be695a32bdc7206bdb6-20200226
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1949075457; Wed, 26 Feb 2020 23:47:20 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 26 Feb 2020 23:48:26 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 27 Feb 2020 15:46:14 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Thu, 27 Feb 2020 15:47:21 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 0/1] pwm: mediatek: add longer period support
Date: Thu, 27 Feb 2020 15:46:49 +0800
Message-ID: <1582789610-23133-1-git-send-email-sam.shih@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200226_234728_276817_CD203D3A 
X-CRM114-Status: UNSURE (   5.31  )
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
Cc: linux-pwm@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch add support for longer pwm period configuration,
which allowing blinking LEDs via pwm interface.

Sam Shih (1):
  pwm: mediatek: add longer period support

 drivers/pwm/pwm-mediatek.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
