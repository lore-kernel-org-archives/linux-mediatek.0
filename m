Return-Path: <SRS0=G+af=6O=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E158C8300A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 09:25:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36C462186A
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Apr 2020 09:25:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SXGfE2k9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AxN0iCza"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36C462186A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jqrEBthXUDV1C0IZlGXJSDty4Dlpwv7aFcxbRLUdF30=; b=SXGfE2k9wAoY9r
	+BkO3pthBa03/Xh63YBOIo31h6TJi9wGnC9059G24RHQT8aJNbywg0ZZSC0ls/nABxhXFSB3wwyVu
	AZJ4ZLkAP/aen18qvcxelFB0P1qKEzb6lpHhqEld419ZhPH/OaG1KwdxIJx7Dia8x6Xaq7YIklyDW
	O/1KFW1qTa34ipOgxv/bmoUlIlx6O4R0G8JZWNsgnmOHr5XLHk7mOt2/YkZTDFHZFH3rDB0nEtRgv
	Ts+UJBsGvCoJBDkHGStzAvnh2jmCYnoHuXJ7tsIgOCkJWmol6sNRz2I63JMNKwTuVnocy+BMRAJDe
	0IfPgjVln3PvyIdJsSMw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jU5RD-00007S-Ol; Thu, 30 Apr 2020 09:24:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU5R2-0008Ns-V3; Thu, 30 Apr 2020 09:24:50 +0000
X-UUID: b7e6786c90ad4316aa499689621340ba-20200430
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ZyWHANL6IrB0l51Zfc83GdOFYp8wjYfrW0mYPD40bfY=; 
 b=AxN0iCza3K8zIbbx4JQpmtqPtpbqrlAHclTp91xQwNzi2Xve6tZ4RsklUhwbfzP2z4OTkigkxzi2X40moUcXib1yqeif6h3V+xLiBA/5E7n255c8YkTJwNipDbitckNaMhF3Anm/Oc9HVpWJj5h4+w1/GQHMDC6x0rNv+PbmqWo=;
X-UUID: b7e6786c90ad4316aa499689621340ba-20200430
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <henry.yen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1452036851; Thu, 30 Apr 2020 01:24:37 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Apr 2020 02:14:39 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Apr 2020 17:14:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 30 Apr 2020 17:14:39 +0800
From: Henry Yen <henry.yen@mediatek.com>
To: Zhang Rui <rui.zhang@intel.com>, Daniel Lezcano
 <daniel.lezcano@linaro.org>, Amit Kucheria <amit.kucheria@verdurent.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 0/2] Mediatek thermal driver update
Date: Thu, 30 Apr 2020 17:14:32 +0800
Message-ID: <1588238074-19338-1-git-send-email-henry.yen@mediatek.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7F58CE61F64B44D235ACC83466F1B3E82A319B4F514B5C42ADCF5FDE31662D0F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200430_022449_008543_C23883D0 
X-CRM114-Status: UNSURE (   6.45  )
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
Cc: Steven Liu <steven.liu@mediatek.com>, Henry Yen <henry.yen@mediatek.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Michael
 Kao <michael.kao@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Mediatek owns two thermal systems, which are almost the same except for
the way of reading calibration data and converting temperature.
MT8173, MT8183, MT2701 and MT2712 belongs to version 1 thermal system,
and MT7622 belongs to version 2. The current code has already supported
version 1 system. Then this patchset will add the support for another
platform (e.g., MT7622 SoC).

Changelog:

v2:
* reorganize the order of the two patches
* remove unnecessary .extract and .convert callbacks
* add fixes tag

v1:
* initial post

Henry Yen (2):
  thermal: mediatek: prepare to add support for other platforms
  thermal: mediatek: add tsensor support for V2 thermal system

 drivers/thermal/mtk_thermal.c | 234 ++++++++++++++++++++++++++--------
 1 file changed, 181 insertions(+), 53 deletions(-)

-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
