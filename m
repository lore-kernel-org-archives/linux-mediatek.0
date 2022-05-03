Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EA7C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 May 2022 14:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xjzG6JyURkaFmSdLTCLC1SfJEgVhF/T8s6fhM5fTEQg=; b=HdBYL9vre/FzlR
	CLjr0M6J6ebeV0LtrFR/sXIk925oyXY2LrtjcmGXB6BUYl7ETjP8KEBSNdpKa6JKKz1b+vZ/K/cIG
	qLmCEZXSxneCr8z1BFmf7FpUQQsOHp1X+rT/w0uXgNGOOMVuxmXkvhYYbVrbcUhEv4HStCTlUg2sL
	yV3OtcrxjwGtbUW/bRR5pf+rzFr0Rq/YL3nwatSJMPVxR0gRzcX1wOAVZuZFd5N6g9Zp27eg1wq6c
	WEsMZsY4/lBeCz88rDBK5KDY3Z7EXLTitoKot3aXGdlVIoMGzvC0nlrWRM+XPUeGKRDtbl8b1qZwo
	UE/pAe4X0sgYxSQNXJxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nltAq-00693E-Dg; Tue, 03 May 2022 14:06:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nltAd-0068vn-2U; Tue, 03 May 2022 14:06:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AD07F1F42D6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651586789;
 bh=p6sOJ83Tcjg2H8v38ag3jKrs/9LDdbWTcZtSd7al2r0=;
 h=From:To:Cc:Subject:Date:From;
 b=NL4/a77cO4MrKh0BCkmaPyPmbsDe31uvwFFKPUt/yTBlMUAfSw87XYFHldNJ7OPxo
 ANIctnf/t4IabfvFX54W57WHYLzT8LhfFJQhr2Ph4kSZ31FqmrgSYYBTTxXUGyb2yr
 NoYB8f7wIZqwPdZLL7bONSQ6Xb0juk21Kh/t1qSLlZDLy7uoxFf5+0VdyNgEKdnKxU
 g59takH65pfAcjJkC1h54+WtGWXFiF8WFXfcOyickEXC9sr6l4AqkkDnI8QoiTKwKT
 dgm5dkgjd1M4pY8YWzlMoqRXPcxLit55mWoqTuIArvzvr6Z9r9I69eQCjQPlKN6cCP
 2lXBhl1H5aBNQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sean.wang@mediatek.com
Cc: vkoul@kernel.org, matthias.bgg@gmail.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 nfraprado@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 0/2] MediaTek Helio X10 MT6795 - CQDMA driver
Date: Tue,  3 May 2022 16:06:22 +0200
Message-Id: <20220503140624.117213-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_070631_279287_19644F3F 
X-CRM114-Status: UNSURE (   7.23  )
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

In an effort to give some love to the apparently forgotten MT6795 SoC,
I am upstreaming more components that are necessary to support platforms
powered by this one apart from a simple boot to serial console.

This series introduces support for CQDMA on the Helio X10 SoC.

Tested on a Sony Xperia M5 (codename "Holly") smartphone.

Changes in v2:
 - Fixed errors around (sorry, at v1 I've sent patches from the wrong folder)

AngeloGioacchino Del Regno (2):
  dmaengine: mediatek-cqdma: Add SoC-specific match data
  dmaengine: mediatek-cqdma: Add support for MediaTek MT6795

 drivers/dma/mediatek/mtk-cqdma.c | 41 ++++++++++++++++++++++++++------
 1 file changed, 34 insertions(+), 7 deletions(-)

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
