Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A12FAC43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 02:42:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6831120836
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 02:42:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JFkfW1zz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="t6eQc346"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6831120836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iL5WbMOE9HLRlFMNADho3Uy7zs4goFwmCxHx/Jw5LQ4=; b=JFkfW1zzJpdl3I
	Gus6SSTvuBhO4BwGrVCaPi+iu/Eo4KrUjTPq3vo15p7AnGddywybNOiKZaU0Af2uoQf9HoKYXXzlg
	6nnwTXF+F1CiBAxsmneeu1g46pCV9r+Nf4Zdy3L3iXEt2sTn8FpaDX6UqKmJ+6c9y1/CIr8qc2iW+
	997iwiIE2E9S2Ran8kOM34Aefb76AkeWXl3Hgu7Z+qpPeXaqRfFeQcOh4wETKq7S9Rf8PkBIO4Jjz
	jUH4NH4f3gvUG1UXVUlZqMGuR1yjfWf87zHfUi532YhIQTxTBkLKcuLfVWTq5tmXzCQgZelG+oySO
	oCuyW9mj8F4XKrfOGRLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifEQc-00031n-Uv; Thu, 12 Dec 2019 02:42:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifEQa-00031E-1g; Thu, 12 Dec 2019 02:42:09 +0000
X-UUID: 6f7c36efb9d44cf19c1fd040919e7bca-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=cG1YyDPw+qG1448MfGYrVaHuFejY1iS6sWsg1RBugiM=; 
 b=t6eQc346/AzVWfAd58hmT2Yk3sQnM2Roe8umDoGNIzFiPUoPfVJ+HjENAPYwhSjc4cKHuD/caH6UbPMirN6GUnTJNJXB3f+JlvfYkiwLHOya0Nw85I7pzw8qjDxkYSsEdDmaigekyZCZpXzDuPcPnLpSrgDDMTezL1NVdlqb3vM=;
X-UUID: 6f7c36efb9d44cf19c1fd040919e7bca-20191211
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1544340602; Wed, 11 Dec 2019 18:42:05 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 18:42:19 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 10:42:33 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 10:41:52 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 0/2] net-next: stmmac: dwmac-mediatek: add more support for
 RMII
Date: Thu, 12 Dec 2019 10:41:43 +0800
Message-ID: <20191212024145.21752-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_184208_097784_CFEFA324 
X-CRM114-Status: UNSURE (   6.72  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Biao Huang <biao.huang@mediatek.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jose
 Abreu <joabreu@synopsys.com>, linux-mediatek@lists.infradead.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series is for support RMII when MT2712 SoC provides the reference clock.

Biao Huang (2):
  net-next: stmmac: mediatek: add more suuport for RMII
  net-next: dt-binding: dwmac-mediatek: add more description for RMII

 .../bindings/net/mediatek-dwmac.txt           | 17 +++-
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 85 +++++++++++++------
 2 files changed, 74 insertions(+), 28 deletions(-)

--
2.24.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
