Return-Path: <SRS0=MkRU=6K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 167DEC54FCB
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Apr 2020 16:13:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF2BC20706
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Apr 2020 16:13:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mBYUTSG8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF2BC20706
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=polehill.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=HOdB0TYJRuYslKVoLNUF6xt5Y+X48qh04QTerrR+i7c=; b=mBY
	UTSG8w1P4iQQqPpUc91j3+znO4l3V4/lokRp116a4c0hAJmFx5Xrq9+XvR/7f496x4VmO0v9tru6R
	G5LSV+/i8IBGF7g+a9Z2T132b2Jt+rxrLUZXM9wa0avalLDAXcx+IjaaF31SZ+qvhr88wrJyBJ/my
	D5i4InmfdwMe9x17aVDtLgzAWs/qj5e1cdxYxuoOEMSzRgnk00c/nSDwicXqhWWKD0qQP7m4TFuzA
	R5E1yVT+SgTjvokQeSpyR4Eo7vaTeyH2NsQZD/s+Wl15UeFd0htILZ37haOvik2UR5unPuBhJmhG5
	IP++NLBMIPcVcE0SXr/H9iXi43Apo1Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jSjuW-0000y8-NQ; Sun, 26 Apr 2020 16:13:40 +0000
Received: from mailomta4-sa.btinternet.com ([213.120.69.10]
 helo=sa-prd-fep-044.btinternet.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jSjuI-0000md-Cj; Sun, 26 Apr 2020 16:13:28 +0000
Received: from sa-prd-rgout-005.btmx-prd.synchronoss.net ([10.2.38.8])
 by sa-prd-fep-044.btinternet.com with ESMTP id
 <20200426161321.JCTH16408.sa-prd-fep-044.btinternet.com@sa-prd-rgout-005.btmx-prd.synchronoss.net>;
 Sun, 26 Apr 2020 17:13:21 +0100
Authentication-Results: btinternet.com;
 auth=pass (LOGIN) smtp.auth=j.oldman998@btinternet.com
X-Originating-IP: [31.51.225.56]
X-OWM-Source-IP: 31.51.225.56 (GB)
X-OWM-Env-Sender: j.oldman998@btinternet.com
X-VadeSecure-score: verdict=clean score=30/300, class=clean
X-RazorGate-Vade: gggruggvucftvghtrhhoucdtuddrgeduhedrheejgdellecutefuodetggdotefrodftvfcurfhrohhfihhlvgemuceutffkvffkuffjvffgnffgvefqofdpqfgfvfenuceurghilhhouhhtmecufedttdenuchmihhsshhinhhgucfvqfcufhhivghlugculdeftddmnecujfgurhephffvufffkffosedttdertdertddtnecuhfhrohhmpeflohhhnhcuqfhlughmrghnuceojhhohhhnrdholhgumhgrnhesphholhgvhhhilhhlrdgtohdruhhkqeenucfkphepfedurdehuddrvddvhedrheeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpihhnvghtpeefuddrhedurddvvdehrdehiedpmhgrihhlfhhrohhmpeeojhhohhhnrdholhgumhgrnhesphholhgvhhhilhhlrdgtohdruhhkqedprhgtphhtthhopeeouggvvhgvlhesughrihhvvghruggvvhdrohhsuhhoshhlrdhorhhgqedprhgtphhtthhopeeojhhohhhnrdholhgumhgrnhesphholhgvhhhilhhlrdgtohdruhhkqedprhgtphhtthhopeeolhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgqedprhgtphhtthhopeeolhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgqedprhgtphhtthhopeeolhhinhhugidqmhgvughirghtvghksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgqe
X-RazorGate-Vade-Verdict: clean 30
X-RazorGate-Vade-Classification: clean
Received: from localhost.localdomain (31.51.225.56) by
 sa-prd-rgout-005.btmx-prd.synchronoss.net (5.8.340) (authenticated as
 j.oldman998@btinternet.com)
 id 5E3A290C0D7F7CD0; Sun, 26 Apr 2020 17:13:21 +0100
From: John Oldman <john.oldman@polehill.co.uk>
To: 
Subject: [PATCH] Staging: mt7621-dma: mtk-hsdma.c: Fix Missing a blank line
 after declarations
Date: Sun, 26 Apr 2020 17:13:19 +0100
Message-Id: <20200426161319.23941-1-john.oldman@polehill.co.uk>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200426_091326_714237_CAA43046 
X-CRM114-Status: UNSURE (   6.11  )
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
Cc: devel@driverdev.osuosl.org, John Oldman <john.oldman@polehill.co.uk>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fixed coding style issue

Signed-off-by: John Oldman <john.oldman@polehill.co.uk>
---
 drivers/staging/mt7621-dma/mtk-hsdma.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
index 14592ed9ce98..dd35d0bce6ca 100644
--- a/drivers/staging/mt7621-dma/mtk-hsdma.c
+++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
@@ -157,6 +157,7 @@ struct mtk_hsdam_engine {
 	struct device_dma_parameters dma_parms;
 	void __iomem *base;
 	struct tasklet_struct task;
+
 	volatile unsigned long chan_issued;
 
 	struct mtk_hsdma_chan chan[1];
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
