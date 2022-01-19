Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABB2C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 12:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MtwQ3rw1vNPYVonCJEFkuZFqWLLfRaKBEZlPxIRdzGc=; b=z8aY5HzQF4j0Tv
	iR1YJgRAr7GZnf/6y6zuc5+LDuJ2SdM975u68juAuiM9b77I9I6pEHmbI50XWWdqYS78Rtb4ki1B1
	C4m32VpXMbnvxbnS4hl1Uw/s+FnPtm5u2zBEppBdYFhtPlVMb73OYccIiTuNf5havKf9c9XW6aakx
	Qo+WSdsxXrSzNwKYzM6D5FFlFXrTpSnfbrllbRU4GbLrz5wCrG8uIZzoqFUce8B7BAO0aKCxYnhLr
	BWkpfAc/CAlGIfy1RQcN39K6r8Xfm9hj1IKTxWu+AJvXlDvHy+AgRzVIDILz/I+7zRdSeDZXB+Vy+
	hz9V3ZB20jMTDpefY4OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAANC-005UMp-40; Wed, 19 Jan 2022 12:47:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAAMu-005UGH-2M; Wed, 19 Jan 2022 12:47:17 +0000
X-UUID: 8d2edca3c222430b82154797bd66ee88-20220119
X-UUID: 8d2edca3c222430b82154797bd66ee88-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1293479405; Wed, 19 Jan 2022 05:47:12 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 04:37:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 19 Jan 2022 20:37:08 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Jan 2022 20:37:08 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Ryder Lee
 <ryder.lee@kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Sam Shih <sam.shih@mediatek.com>
Subject: [PATCH 0/1] Relicense mt7986 clock driver to GPL-2.0
Date: Wed, 19 Jan 2022 20:36:57 +0800
Message-ID: <20220119123658.10095-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_044716_133974_74D6EF70 
X-CRM114-Status: UNSURE (   9.66  )
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

The previous mt7986 clock drivers were incorrectly marked as GPL-1.0.
This patch changes the driver to the standard GPL-2.0 license.

Sam Shih (1):
  clk: mediatek: relicense mt7986 clock driver to GPL-2.0

 drivers/clk/mediatek/clk-mt7986-apmixed.c  | 2 +-
 drivers/clk/mediatek/clk-mt7986-infracfg.c | 2 +-
 drivers/clk/mediatek/clk-mt7986-topckgen.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
