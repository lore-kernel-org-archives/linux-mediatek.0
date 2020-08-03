Return-Path: <SRS0=TVmU=BN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF58CC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 07:26:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8CE0F206F6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2020 07:26:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="l7+B0Mrv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="YwMwPif0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8CE0F206F6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gKrKnKMlPCHs6WVlbyDoiGa/eSCPJkZEREXCeyhXC+w=; b=l7+B0Mrvro6PVMLLR08ZK3UPzp
	S1BNGT+6yl1YW/mOkTxSLfgCRe08j3VkiZWHtmiTRrUaa0f25039uL5ROzoPNg8VQktt1LZDD2AaW
	M9Q3U24WEjB+WV+g4bafhOOZhrH3PzBy1cfK0i3etOkvEXXTDXDlOnhg/msMTEeF10ZDNrNMd1C//
	RHxXscjEsDFwoN8TTd/suqKJPdKHJHBjRHPYSLswFWXyW8yg7p6VKpx1K/6frkgiExadjAbw1ZZ6T
	AYE4WNT5DpXBK2OkQjbA+KymYqvYWwK02Na9j1xD4xjVi8o/Pc0/OTyd/F5Tl2+i7if0hJzqbxgNG
	5Ca6CmjQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k2Ur7-0000uQ-99; Mon, 03 Aug 2020 07:25:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k2Ur2-0000s6-RE; Mon, 03 Aug 2020 07:25:53 +0000
X-UUID: 6dc4b7594db942a39ac9c5da016a9656-20200802
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=4JRgEhC0y2uoVXRxy4HPGAXTygiS88WJhGSDBUxynbA=; 
 b=YwMwPif0srpRpC20kJ5hh593xQyK1M0eVwU5J6vyE5tS3Oo8jhUevGuchgPA5RMqHw3MpdETJCmNosATBxw04k3NPFuicAKMtCDyZg61dNdXaNKAkmFpFEyr0n7b7+7x9Q97XsVCXF6yWHsBKgxa9zrVNUkPoIOyK/cvJ2MDssc=;
X-UUID: 6dc4b7594db942a39ac9c5da016a9656-20200802
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <crystal.guo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1560320659; Sun, 02 Aug 2020 23:25:44 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 00:15:45 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 3 Aug 2020 15:15:44 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 3 Aug 2020 15:15:44 +0800
From: Crystal Guo <crystal.guo@mediatek.com>
To: <linux@roeck-us.net>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
Subject: [v4,0/5] watchdog: mt8192: add wdt support
Date: Mon, 3 Aug 2020 15:14:56 +0800
Message-ID: <20200803071501.30634-1-crystal.guo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200803_032553_053546_119FE1BD 
X-CRM114-Status: UNSURE (   8.95  )
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

v4 changes:
revise commit messages.

v3 changes:
https://patchwork.kernel.org/patch/11692731/
https://patchwork.kernel.org/patch/11692767/
https://patchwork.kernel.org/patch/11692729/
https://patchwork.kernel.org/patch/11692771/
https://patchwork.kernel.org/patch/11692733/

Crystal Guo (5):
  dt-binding: mediatek: watchdog: fix the description of compatible
  arm64: dts: mt8183: update watchdog device node
  dt-binding: mediatek: mt8192: update mtk-wdt document
  dt-binding: mt8192: add toprgu reset-controller head file
  watchdog: mt8192: add wdt support

 .../devicetree/bindings/watchdog/mtk-wdt.txt  |  5 ++--
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      |  3 +-
 drivers/watchdog/mtk_wdt.c                    |  6 ++++
 .../reset-controller/mt8192-resets.h          | 30 +++++++++++++++++++
 4 files changed, 40 insertions(+), 4 deletions(-)
 create mode 100644 include/dt-bindings/reset-controller/mt8192-resets.h


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
