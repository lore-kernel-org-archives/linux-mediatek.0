Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F2A3C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 03:25:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3B8A610A7
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 03:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3B8A610A7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4BadmWbCrybsXet7gIOC/l00LMq4EMWv7I4H9PchouM=; b=n5MLbhYEd+STsS
	iWeRB2C3rJs69njfsXUOlFyk74N0HqmGPVPltjYBE98vsIb/lBGkBuOKlip5MoWNcU+CXESagamOm
	BCAWEISZjJYAGkCYa6GDcnt0ZKh6ghhUg7z4OB4YOfZICT1jMlcgOGTI/oC1+D//DL37a1lBGzSeS
	MTg/OWV+C49j/ICOXnShZwDnqBxUmgsNytGtgSWuMC7fLP1bxkUdsBJORDKYayWz5Nuv4qD9OZvl7
	t9k9RWdQcAaqdvsfKe3zE1mE5wXPtGtANRUu/Bnr/Nql7pz/ExFq48xYXu61ZLlV+iud5opH/qX2P
	3Iiokzt3N8GChuhZ11dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mENoc-00Bclt-ND; Fri, 13 Aug 2021 03:25:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mENoC-00Bch2-0v; Fri, 13 Aug 2021 03:24:39 +0000
X-UUID: 3ffe10b4131e4456847e73933e3f6c4e-20210812
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=1MxPkFBaaqs9jeb4g79PCktQQOnDpX8Oh+6y3zeP+Go=; 
 b=GeOaZaO8zx5pTA70+w++dHWtdKSiFY5r2O1l+7nQnzpqmQnThmVENq9nRoa0vhYIL8P6uSQ3ZNybQalgRbyhAlymfls6Tl01s68gz+BppRhMh2qcqkodUNM56gVDcI4860VqzfqmLniArOhFjIvmm1ZqG+CBGempssQO6n2qFhc=;
X-UUID: 3ffe10b4131e4456847e73933e3f6c4e-20210812
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 940994117; Thu, 12 Aug 2021 20:24:33 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 12 Aug 2021 20:24:32 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 13 Aug 2021 11:24:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 13 Aug 2021 11:24:30 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Wendell Lin <wendell.lin@mediatek.com>, Hanks Chen
 <hanks.chen@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <wsd_upstream@mediatek.com>, Miles Chen
 <miles.chen@mediatek.com>
Subject: [RESEND PATCH 0/4] clk: mediatek: modularize COMMON_CLK_MT6779
Date: Fri, 13 Aug 2021 11:24:25 +0800
Message-ID: <20210813032429.14715-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_202436_099435_C64E2988 
X-CRM114-Status: GOOD (  10.79  )
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

This patch set makes COMMON_CLK_MEDIATEK and COMMON_CLK_MT6779*
be able to built as kernel modules. Necessary symbols are exported
in this patch.

In previous discussion [1], Stephen commented that there must
be a user before exporting a symbol:

"
Is the mediatek driver compilable as a module? Last time I checked it
wasn't a module. I want an upstream modular driver that uses the symbol.
Otherwise we're exporting symbols when it doesn't need to be.
"

[1] https://lore.kernel.org/patchwork/patch/1278089/

Miles Chen (4):
  clk: composite: export clk_register_composite
  clk: mediatek: modularize COMMON_CLK_MEDIATEK
  clk: mediatek: modularize COMMON_CLK_MT6779*
  clk: mediatek: use tristate for COMMON_CLK_MEDAITEK and
    COMMON_CLK_MT6779

 drivers/clk/clk-composite.c            |  1 +
 drivers/clk/mediatek/Kconfig           | 20 ++++++++++----------
 drivers/clk/mediatek/clk-apmixed.c     |  3 +++
 drivers/clk/mediatek/clk-cpumux.c      |  3 +++
 drivers/clk/mediatek/clk-gate.c        |  8 ++++++++
 drivers/clk/mediatek/clk-mt6779-aud.c  |  2 ++
 drivers/clk/mediatek/clk-mt6779-cam.c  |  2 ++
 drivers/clk/mediatek/clk-mt6779-img.c  |  2 ++
 drivers/clk/mediatek/clk-mt6779-ipe.c  |  2 ++
 drivers/clk/mediatek/clk-mt6779-mfg.c  |  2 ++
 drivers/clk/mediatek/clk-mt6779-mm.c   |  2 ++
 drivers/clk/mediatek/clk-mt6779-vdec.c |  2 ++
 drivers/clk/mediatek/clk-mt6779-venc.c |  2 ++
 drivers/clk/mediatek/clk-mt6779.c      |  2 ++
 drivers/clk/mediatek/clk-mtk.c         |  8 ++++++++
 drivers/clk/mediatek/clk-mux.c         |  4 ++++
 drivers/clk/mediatek/clk-pll.c         |  4 ++++
 drivers/clk/mediatek/reset.c           |  2 ++
 18 files changed, 61 insertions(+), 10 deletions(-)

-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
