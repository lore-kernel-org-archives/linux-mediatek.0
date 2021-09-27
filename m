Return-Path: <SRS0=95qJ=OR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2680C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 10:55:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB5AF60555
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 10:55:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB5AF60555
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nt0+l47Yp5+oaL3WLncCcwKqQDxQnyLEjCVfKZ5zH+4=; b=p9U7KNqK0ynTT2
	6LY/1F7K9VztMxlwR1qC8ORZ9SSPRM/fwq0wblOkxnONo1BbhmlN5jdrNYX5IsuqtCoHK33K9cF4j
	2GQjz8kRxn1OCy33E+e9JaOt+f4cCPDN7b2xDtyARtqhj/y0em3PaIH4CARDVEP9RDhrmqiVwIe1h
	Dmn5YbMvdwIm2+R6iF8Cf2Wb0gQr1HifAx1mfu3dy8c+cfOWhZG2QUIcWeaeorPX0MHNFbeyufANL
	Iq8e0pRe+lXNZ2LERber+BagPXTDMq8gvjsUo7C6HQ6U3WOQydCKOa/eYSEqvEzHVqTzP+kGum7NZ
	5TOLX7kAwJi4Lzbz0vBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUoHu-002Mar-Fl; Mon, 27 Sep 2021 10:55:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUoHr-002MYE-8w; Mon, 27 Sep 2021 10:55:08 +0000
X-UUID: 931e587de61b4562aa25911366540ebe-20210927
X-UUID: 931e587de61b4562aa25911366540ebe-20210927
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <macpaul.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1861691052; Mon, 27 Sep 2021 03:55:04 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Sep 2021 03:45:02 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Sep 2021 18:45:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 27 Sep 2021 18:45:00 +0800
From: Macpaul Lin <macpaul.lin@mediatek.com>
To: Leon Yu <leoyu@nvidia.com>, "David S . Miller" <davem@davemloft.net>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue
 <alexandre.torgue@st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Miles Chen <miles.chen@mediatek.com>, Bear Wang <bear.wang@mediatek.com>, 
 Pablo Sun <pablo.sun@mediatek.com>, Fabien Parent <fparent@baylibre.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
 <linux-mediatek@lists.infradead.org>, <stable@vger.kernel.org>
Subject: backport commit ("c739b17a715c net: stmmac: don't attach interface
 until resume finishes") to linux-5.4-stable
Date: Mon, 27 Sep 2021 18:45:00 +0800
Message-ID: <20210927104500.1505-1-macpaul.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_035507_337418_6C3A0130 
X-CRM114-Status: UNSURE (   5.21  )
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

Hi reviewers,

I suggest to backport 
commit "c739b17a715c net: stmmac: don't attach interface until resume finishes"
to linux-5.4 stable tree.

This patch fix resume issue by deferring netif_device_attach().

However, the patch cannot be cherry-pick directly on to stable-5.4.
A slightly change to the origin patch is required.
I'd like to provide the modification to stable-5.4 if it is needed.

commit: c739b17a715c6a850477189fb7c5f9a6af74f4bb
subject: net: stmmac: don't attach interface until resume finishes
kernel version to apply to: Linux-5.4

Thanks.
Macpaul Lin

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
