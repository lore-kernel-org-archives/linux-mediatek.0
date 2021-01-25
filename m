Return-Path: <SRS0=y96F=G4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE45C433E9
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 17:09:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 407192072D
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jan 2021 17:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 407192072D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y+I5EZfkl5spnjYNrhJvkINcMmDusbkfKNJNYOWqQXw=; b=0L3yzPz7EzWoHFGjekevIrFUXC
	lNi9jqnzVhGAThqgSswYdDVuejr/JPUOYu/toq2uuH1X533Zs2jIRnnJRn8zEiAAt2Fc9lMk5jVit
	ITykIAGgT36XWOJ+p8Jh/HmUmGxY/n1vrgELHItN9CtmA630TGERumTe3wRSUHMS8fAUOWzyUR3Qw
	eL50UxikSgy941/iQeF8cpJOZ9GoQUpWptDql+Tq/cyC/TukYRQIOFCagmkB5X9EzzK7Y0fRaYS8E
	XMPuIXA4AhTUvAkYoiXj1Mfzxu8iQ6bQ5Lw7heWycigRZf8PhHdBg4IgKtiW0xJSLczJ2hItpO1Y6
	nP5TT8IA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l45M9-0006Qh-26; Mon, 25 Jan 2021 17:08:49 +0000
Received: from perceval.ideasonboard.com
 ([2001:4b98:dc2:55:216:3eff:fef7:d647])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l45M7-0006Q2-3N
 for linux-mediatek@lists.infradead.org; Mon, 25 Jan 2021 17:08:47 +0000
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 80890331;
 Mon, 25 Jan 2021 18:08:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1611594522;
 bh=8VVLCzEL/PaM7XAmAK6bOQStNzGgz6J2oVeBgoWZwsM=;
 h=From:To:Cc:Subject:Date:From;
 b=XDyMwtgK7XicS7tXju77TNM4aeI8Sam+wE09bG8SxRGaUWKQmBUHUsc9kXxwWQ7cA
 z9EsDzmzkUQrkr9+9pehNDGtomCB9qq1yrbSvcV/DEuEjK5M0GtU0eb+P/4zK1YEwe
 tMVvpI+Mt1Y+SbeRN5ooPj6Q1gW8NkJz5YWTOl6I=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-clk@vger.kernel.org
Subject: [PATCH 0/2] clk: mediatek: Fix mux clock re-parenting
Date: Mon, 25 Jan 2021 19:08:17 +0200
Message-Id: <20210125170819.26130-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_120847_270533_E395F81A 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: Weiyi Lu <weiyi.lu@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Phi-Bang Nguyen <pnguyen@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

This small patch series fixes re-parenting of the mux clocks on MediaTek
platforms. Patch 1/2 is a drive-by cleanup that removes unneeded code
(as I didn't want to update that code in the next patch), while patch
2/2 fixes the problem. Please see invidual patches for details.

The code has been tested with the CAMTG2 and CAMTG3 clocks on MT8183.
Quite interestingly some parents can be selected without this fix (I can
for instance select a parent that has a lower frequency), but not all of
them. I'm not sure if all mux clocks are affected, but as far as I can
tell the fix shouldn't introduce regressions.

Laurent Pinchart (2):
  clk: mediatek: mux: Drop unused clock ops
  clk: mediatek: mux: Update parent at enable time

 drivers/clk/mediatek/clk-mux.c | 93 ++++++++++++----------------------
 drivers/clk/mediatek/clk-mux.h | 14 ++---
 2 files changed, 34 insertions(+), 73 deletions(-)

-- 
Regards,

Laurent Pinchart


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
