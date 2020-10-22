Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E992C5517A
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 22:39:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8EA921D43
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 22:39:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mx1qUmYa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="B4NwRxRP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="WR2E9cNT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8EA921D43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BkKZgM9cKaYjIipZY5UIhLMflKw7Ze89z8X7ostYIoc=; b=Mx1qUmYaEfUJ07ssx8Kk1hsMpy
	e+0pK5qIGNTWlrSTcTQXiU/UJefPSfWXTuOKi6LwszC7qiJG1cx9pCUkjBbBrHE+Kd0PHYg8rUznr
	uYpQQCzwY2O6/TvLPigO8m5BytS0YBs2tMyQ2jCTJKnL7OFqIId2YcGbmZD9jzt6aerMi2bGLR7Yh
	166W7dswce5j1Oe0b3qhenqTHy17pV8u6/1pDiZr2Y+DIa9W4jzPT8/QwX8Ve9K4h0q6ypkhkDhTe
	XzTSaCfc9UkM0CoTDS+PdrdGspdCVFtGAqB0Io9VDcvUYDeDrUq0EutzuFzvB1pjoW7KKopdwHPT0
	F8ngJ2/Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVjFE-0000Ko-EB; Thu, 22 Oct 2020 22:39:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa92-00038b-HM; Thu, 22 Oct 2020 12:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=ovUUUcqhJC9H5EtfgPHi7yKW/d7yDwoYEfaWYv3LJUw=; b=B4NwRxRPAlISdYMt/8CXF5FsQ2
 +5LQjMakNohArU/K5k/HJ4cNdQrXLsObteLxTgbAx5spEJkXNeRAJ6pYTjmFVB+raCm0euLer08C3
 UU+jcMPoIGmd3uL2zuZgnxNlMpsOeoRC7gsA3Db8Kg9sdorBRCWsZZtEobfv1vJFTn/QEqvJu/Gx6
 SM438FgjWc/lUEsPGCW2DJODMGRAQJ/UJI6cUY5upbN7F+B9EU9C+oR8WVO59oqIVVbik8nn3djBb
 y96juV5TUYRf1UpLIqQztB+iopo2smeLwsLMWDNoJHskKu6WnLVkVDhpwASP4mEETmrxpzICxNYTX
 wDBTK5iQ==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVa8w-0003mP-O5; Thu, 22 Oct 2020 12:56:38 +0000
X-UUID: 968667ea50dd4cfbaa363c3173eafbb6-20201022
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=ovUUUcqhJC9H5EtfgPHi7yKW/d7yDwoYEfaWYv3LJUw=; 
 b=WR2E9cNT7cQN5gj340ED1PUpcM6E3aS7Gf4+nIcD9rswevQTix1dr1lbHRlmt6/wm9zHo5lmVK50hHmm2hqkvSpT87QUqtxB+OpdgCHgiLhbYjVVSqC6ojd+lz268POzjiRnuxsgqAZ5RXrIusZDG1JMkAKXfsiz36DJNvNRsvM=;
X-UUID: 968667ea50dd4cfbaa363c3173eafbb6-20201022
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1114395087; Thu, 22 Oct 2020 04:56:10 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 05:56:07 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Oct 2020 20:56:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 22 Oct 2020 20:56:06 +0800
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd
 <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH 00/12] Clean up the pll_en_bit from en_mask on all the
 MediaTek clock drivers
Date: Thu, 22 Oct 2020 20:55:53 +0800
Message-ID: <1603371365-30863-1-git-send-email-weiyi.lu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_135635_275608_E540FD1D 
X-CRM114-Status: UNSURE (   8.30  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is based on v5.9-rc1 and
[v4,09/34] clk: mediatek: Fix asymmetrical PLL enable and disable control[1]
in Mediatek MT8192 clock support series

[1] https://patchwork.kernel.org/project/linux-mediatek/patch/1603370247-30437-10-git-send-email-weiyi.lu@mediatek.com/

Weiyi Lu (12):
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT2701
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT2712
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT6765
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT6779
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT6797
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT7622
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT7629
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT8135
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT8173
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT8183
  clk: mediatek: Clean up the pll_en_bit from en_mask on MT8516
  clk: mediatek: limit en_mask to a pure div_en_mask

 drivers/clk/mediatek/clk-mt2701.c | 26 +++++++++++++-------------
 drivers/clk/mediatek/clk-mt2712.c | 30 +++++++++++++++---------------
 drivers/clk/mediatek/clk-mt6765.c | 20 ++++++++++----------
 drivers/clk/mediatek/clk-mt6779.c | 24 ++++++++++++------------
 drivers/clk/mediatek/clk-mt6797.c | 20 ++++++++++----------
 drivers/clk/mediatek/clk-mt7622.c | 18 +++++++++---------
 drivers/clk/mediatek/clk-mt7629.c | 12 ++++++------
 drivers/clk/mediatek/clk-mt8135.c | 20 ++++++++++----------
 drivers/clk/mediatek/clk-mt8173.c | 28 ++++++++++++++--------------
 drivers/clk/mediatek/clk-mt8183.c | 22 +++++++++++-----------
 drivers/clk/mediatek/clk-mt8516.c | 12 ++++++------
 drivers/clk/mediatek/clk-pll.c    | 12 ++++--------
 12 files changed, 120 insertions(+), 124 deletions(-)
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
