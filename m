Return-Path: <SRS0=ivGG=LP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72672C4743C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 18:02:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4161D61040
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jun 2021 18:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4161D61040
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jqyIEYPHAKD2F09U0AEaqOXW7EUsKfA8UCqNcgulUh4=; b=1JZz+Y6/tYigLG
	QBsSiyUkCG3Nk5ivdxosnuSGgD+Y2Cwp7AR6B2Pf8jrytekBQsKQJYAZL5jTqyjVHEalHZS5tjTMj
	9vKtc/CW4Iammf0KCkFcypnos9Wv0YX6yn4VVmyTa4hH35JqEchb42jym/GbKYeWqxGb2HRPrXcLO
	nySi3cyJkeP4JPqkRD7+U4UEJ4e92N3EbYHgeC1WPSdzGFUITz6MaTOhutd4zEsmQ5Oal6okqKPGH
	zRfsI+60E7BYIe0CVq8lXjXbLCv4aaoDg0CcYdhG4JXoe849I9cPDA1fRNMRQ+uMEcp/eOEcNUwLp
	KaH2geXhUaYvWT0qW11A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvOFF-004PEr-Fm; Mon, 21 Jun 2021 18:02:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvO6n-004KTh-T4; Mon, 21 Jun 2021 17:53:19 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id BADBC61380;
 Mon, 21 Jun 2021 17:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624297997;
 bh=zwjrpBQ7o0x2xqtiyXHPgA7MFvj9vARlzFvp3O45wJc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sdb+N3G5AVaUAotaq0eKMI+IGHViFyorcmkVg4B7BnynU2Xpxr8B6rg0s5Hp2CGJQ
 vdsiArlhKC1sRg5cFDszCS0NQcLOJXhjl5R1LQa/9M1hNLoqQAm41N2h+utQyxZMgc
 8Er8kd3cdbOAuS9uMtM3cT+8hTyQLN3UVQ60NArw53b9QZIkKc6k5KR9cCnbQObpzS
 InbjR3LJwt36K+BKMJGJ+rL70B6T8yNRXI834yAdNarWkeKKl0MylyFQwUzptiOeQD
 lXYcc9cfV3iIu8j5yJVlK2LVB1nhEtHzHr3ESaIkPx3GIdUP03B2C5hCLvpwhJt4xF
 fN+y3cn7SRkjg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Sasha Levin <sashal@kernel.org>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 11/35] dmaengine: mediatek: use GFP_NOWAIT
 instead of GFP_ATOMIC in prep_dma
Date: Mon, 21 Jun 2021 13:52:36 -0400
Message-Id: <20210621175300.735437-11-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210621175300.735437-1-sashal@kernel.org>
References: <20210621175300.735437-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210621_105318_010091_F7816845 
X-CRM114-Status: GOOD (  10.16  )
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

From: Guillaume Ranquet <granquet@baylibre.com>

[ Upstream commit 9041575348b21ade1fb74d790f1aac85d68198c7 ]

As recommended by the doc in:
Documentation/drivers-api/dmaengine/provider.rst

Use GFP_NOWAIT to not deplete the emergency pool.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>

Link: https://lore.kernel.org/r/20210513192642.29446-4-granquet@baylibre.com
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/mediatek/mtk-uart-apdma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index a09ab2dd3b46..375e7e647df6 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -349,7 +349,7 @@ static struct dma_async_tx_descriptor *mtk_uart_apdma_prep_slave_sg
 		return NULL;
 
 	/* Now allocate and setup the descriptor */
-	d = kzalloc(sizeof(*d), GFP_ATOMIC);
+	d = kzalloc(sizeof(*d), GFP_NOWAIT);
 	if (!d)
 		return NULL;
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
