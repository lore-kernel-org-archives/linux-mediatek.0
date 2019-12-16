Return-Path: <SRS0=XFYx=2G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96C78C43603
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 05:50:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 684B420725
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 05:50:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pt7lyREn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nkv2ntN8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 684B420725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PXf0A9bc9uaUxIHPn8yn4JUufS2mJVYGo/uEEGw0E8w=; b=pt7lyREn1rJD7S
	hBuXh7sZjryEl7PP4E2bvZ5o+L+rC6oFBIig+1dXWaUGn3lW4bh26iinSg7MR/W1PlrZk+HCaYSXu
	m99qxZQZC7xiD3fx7Kesf1PgnsboLVANPUKUbw6SmVQWQEBesvU1rZZPaNqyd3Ljzk16duigrl8la
	HT/Wm4NE8rNQJYIgcNH9Kt4StVutRkkMNsRTecBcFime4l+50bME9JOpdX4cFV6TzCx7Zhqh3sVk+
	oa3ncEoFC4JphC+KHBLG83AI+J0kw3rlKUbJC8loh1Fs1kJZ2I8GI3UrDQ0/NP00eVdu4ltceU9tY
	nCANMKmfRV9yXPM0mM2A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igjGr-000549-70; Mon, 16 Dec 2019 05:50:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igjGn-0004zw-M0; Mon, 16 Dec 2019 05:50:15 +0000
X-UUID: 47ec2113c04f45158b4967e781310ea2-20191215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=bU3pTXiHaPfq2d8vyXK1ujCYPstVOHhLasLwvoHqrcE=; 
 b=nkv2ntN8VistPbylqExhZlw7vsjNtN/CgW6jN2uyUTgOCNI7jJAiydem1cJP0uvLrkmoQ1lojVVp9hS/Vnlz/ygEN0Xj2BdDAd4N4PCqVUsUMmAFRGMgk+74IdKu1J6uVlP99q36EGxYD9dB3J6zhYmsvwUXmT4WECQNeUWWBbA=;
X-UUID: 47ec2113c04f45158b4967e781310ea2-20191215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1284749354; Sun, 15 Dec 2019 21:50:09 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 15 Dec 2019 21:41:16 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 13:40:28 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 16 Dec 2019 13:39:20 +0800
From: Biao Huang <biao.huang@mediatek.com>
To: <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Andrew Lunn
 <andrew@lunn.ch>
Subject: [v2, PATCH 0/2] net-next: stmmac: dwmac-mediatek: add more support for
 RMII
Date: Mon, 16 Dec 2019 13:39:56 +0800
Message-ID: <20191216053958.26130-1-biao.huang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_215013_726489_B5ED2223 
X-CRM114-Status: UNSURE (   6.66  )
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

changes in v2:
 PATCH 1/2 net-next: stmmac: mediatek: add more support for RMII
        As Andrew's comments, add the "rmii_internal" clock to the list of clocks.

 PATCH 2/2 net-next: dt-binding: dwmac-mediatek: add more description for RMII
        document the "rmii_internal" clock in dt-bindings
        rewrite the sample dts in dt-bindings.

v1:
This series is for support RMII when MT2712 SoC provides the reference clock.

Biao Huang (2):
  net-next: stmmac: mediatek: add more support for RMII
  net-next: dt-binding: dwmac-mediatek: add more description for RMII

 .../bindings/net/mediatek-dwmac.txt           | 33 ++++---
 .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 89 +++++++++++++------
 2 files changed, 83 insertions(+), 39 deletions(-)

--
2.24.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
