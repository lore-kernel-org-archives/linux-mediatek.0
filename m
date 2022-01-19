Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C986C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 12:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U3tifzLxe8cBUQzSeULv4RxBPk8HSWT13303LxE8u1Q=; b=0QCnkcmbL02NeY
	2kNVvVZ+rBJj6Ij2IP2PtMRbPba/qEapyVv/gKy1BtF88AHNPpO9FS0En4gNzS1XdAg5dERIbEsk0
	+co2YEpPP+FwgmIeQwuSNGBPHF9Ijhx1DCqCY1mspel+F8XukkLg45Gc29yIGCUvKw1FGH15XgwsQ
	nDJEDoHv2GseulMeqRsiLpf65Ai8xuRNP8kBKRo1BFR2fRiRvTO3q2nVJ+QsXXEfvemGZtYIBCP+g
	n41D3RyNmyOx7hNaYRGCKXVvdsvclDuEJC4pgvFnq96T2nPPWK8K9UkweODNrXOUeLsd8myKM1Nnr
	6IBmtBgQ3pyYoXhxEzwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAALD-005TGs-Qy; Wed, 19 Jan 2022 12:45:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAAKN-005Stv-Na; Wed, 19 Jan 2022 12:44:40 +0000
X-UUID: 3b2054aef2e04300945206afd48f487b-20220119
X-UUID: 3b2054aef2e04300945206afd48f487b-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1343031117; Wed, 19 Jan 2022 05:44:33 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 04:34:31 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 19 Jan 2022 20:34:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Jan 2022 20:34:30 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <jason@zx2c4.com>
CC: <ardb@kernel.org>, <davem@davemloft.net>, <gregkh@linuxfoundation.org>,
 <herbert@gondor.apana.org.au>, <linux-arm-kernel@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <miles.chen@mediatek.com>, <nathan@kernel.org>, <ndesaulniers@google.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
Date: Wed, 19 Jan 2022 20:34:30 +0800
Message-ID: <20220119123430.9846-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAHmME9pPKjRLmR6zpYFZT7rOOfHsG2ESnDi+QQrDJuGLo1X4JQ@mail.gmail.com>
References: <CAHmME9pPKjRLmR6zpYFZT7rOOfHsG2ESnDi+QQrDJuGLo1X4JQ@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_044439_794340_55C519AA 
X-CRM114-Status: UNSURE (   7.16  )
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

> We're back in business! I was able to reproduce this using FullLTO
> rather than ThinLTO.

Great!

I tried two clang (r437112b/r437112) but the issue remains.


Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
