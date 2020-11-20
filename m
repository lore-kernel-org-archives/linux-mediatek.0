Return-Path: <SRS0=OETw=E2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B1AC5519F
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 09:31:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78BDE22227
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2020 09:31:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qavEoBV7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="guZh5frz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78BDE22227
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=S7CsN0og4jO7YD1Ad+kk0IHuhCOb85PzcgUCs8AZPXM=; b=qavEoBV7DiR9FWiPZhojHT7Q+8
	roZpjeKSW1mEZOKLnByCBUDJLjkx4qlATTOcFFuifQYFNiCLv2cK+kxmTe8rsO2gV4vqIQa4AbsJR
	fWAJc1DSyL1se0VjEeHcpGDd6ITqwJT8xRb1tyLEYgPVZuDfMXxmnjtwc7gfdhKgZyli/91RUMSG7
	6iE5XCvOTyBIBKY9j9zeoC7BewAh35fsSUkvrRbehNb22pm7lccWl854GAw34PmD7LqzYCXPEIeoq
	6pXykcBOZv7WeCxZwAPFDFgER3zERGKwpyomI1xy+Ds51hlT0qru7PKioXA7VI0VQ6h8SyNAzm+9J
	/2ihhblQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg2l5-0001q5-Sq; Fri, 20 Nov 2020 09:31:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg2l2-0001oA-NO; Fri, 20 Nov 2020 09:31:09 +0000
X-UUID: 2dfa64e594b44d2fb1c0bca3bdc2fe80-20201120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=OA48GeXbns3MlRwWi7oti6BnXEcoNcBSmqYz+3eKXBc=; 
 b=guZh5frzTROEI9nwOP8R4ZbfPK/3PaCfQMFQSlDuE1HLf5qvWkEBZYfzUBtevqCGeT3nz6ECXrl0nBvxeg1bed/fq/zrxBWktBK8LX8Z+EN5zHwocL9WFAdpLJCpydL7sMaB3olko8m01vXhj1HGFzMr1xPNl5uIBx6KCO/QJ6s=;
X-UUID: 2dfa64e594b44d2fb1c0bca3bdc2fe80-20201120
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 344829232; Fri, 20 Nov 2020 01:30:53 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 01:31:04 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 20 Nov 2020 17:31:01 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 Nov 2020 17:31:00 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <robh+dt@kernel.org>, <linus.walleij@linaro.org>, <mark.rutland@arm.com>, 
 <matthias.bgg@gmail.com>, <sean.wang@kernel.org>
Subject: [PATCH 0/1] Mediatek pinctrl patch 
Date: Fri, 20 Nov 2020 17:30:57 +0800
Message-ID: <20201120093058.7248-1-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_043108_982735_E816179C 
X-CRM114-Status: UNSURE (   7.90  )
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
Cc: devicetree@vger.kernel.org, eddie.huang@mediatek.com,
 srv_heupstream@mediatek.com, linux-gpio@vger.kernel.org,
 biao.huang@mediatek.com, zhiyong.tao@mediatek.com, erin.lo@mediatek.com,
 hui.liu@mediatek.com, seiya.wang@mediatek.com, linux-kernel@vger.kernel.org,
 hongzhou.yang@mediatek.com, sj.huang@mediatek.com,
 linux-mediatek@lists.infradead.org, sean.wang@mediatek.com,
 jg_poxu@mediatek.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series includes 1 patches:
1.fix low level output voltage issue.

Zhiyong Tao (1):
  pinctrl: fix low level output voltage issue

 drivers/pinctrl/mediatek/pinctrl-paris.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

--
2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
