Return-Path: <SRS0=Fd5v=MC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C95F8C07E95
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 09:01:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FA9D611CD
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Jul 2021 09:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FA9D611CD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AAcShophBzuLRK9YZt0nPSbglMrLs8tky7FFGbFDT3s=; b=xCJHB6WBYc8CDF
	eZml1/XCgFmGG7NcQz5c0mJhqRGClBnLTxbBKpfCR3FagUaTMo3bPVOGtl1qooTnCWVXHzZ2dVUKc
	EFBMTJJnbWJgcBWMSGReqKckJafycKClb4pMun9cG5CWREFrHGXSfXEiLJk25sxNRUCterE+9aeQk
	YENpIiCx/Sf4g3EwiREmLGI6uNYg+2BPLjJ3Q7JSUmmuPh4QgZY59FXU/kQD3uWYMSo6yUWdsgOeK
	28cs5fNRbB5GjMd01kDR+KMFroGGBh1alumVWlM+twzndIxTfWTEIUxq1kK0lup8rqBrq9H2Foiy1
	vIid49vcZibJ35+VkNZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m28rP-003Pc0-OL; Sat, 10 Jul 2021 09:01:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m28rM-003Pb5-Gv; Sat, 10 Jul 2021 09:01:17 +0000
X-UUID: 85acc3344bf74010a8976fc7c42b9d73-20210710
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=mNO2YZmhhTV/uASw79/LJEwZX/NuOJ2TNDIecDbSRGc=; 
 b=ZtRY+Q9g2IJd6fRe+Rxdi0Q9h21vcrB3GXGqqW8W35w4pwZ35nBelAXq1Xp4m6foUhAskvHizg5nWiUxvn5scuPUfpRrxXubjLi/bI6b9oUhrKZEvZDAAk3n3BZBbNqK5oBDSZfirrr9Sr0tRQ2g4m+23NoSG17hmBJb6L6HjV4=;
X-UUID: 85acc3344bf74010a8976fc7c42b9d73-20210710
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 159027578; Sat, 10 Jul 2021 02:01:08 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 02:01:07 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Jul 2021 17:01:05 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Jul 2021 17:01:04 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <timur@kernel.org>, <linux@armlinux.org.uk>, <alcooperx@gmail.com>,
 <tklauser@distanz.ch>, <sean.wang@kernel.org>
CC: <srv_heupstream@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hui.liu@mediatek.com>, <yuchen.huang@mediatek.com>,
 <huihui.wang@mediatek.com>, <eddie.huang@mediatek.com>,
 <sean.wang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-serial@vger.kernel.org>
Subject: [PATCH 0/1] Mediatek uart patch 
Date: Sat, 10 Jul 2021 17:01:02 +0800
Message-ID: <20210710090103.2643-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210710_020116_735486_7B179C71 
X-CRM114-Status: UNSURE (   5.44  )
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

This series includes 1 patches:
1.fix uart access memory corruption issue

Zhiyong Tao (1):
  uart: mediatek: fix memory corruption issue

 drivers/tty/serial/8250/8250_mtk.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
