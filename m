Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFEDFC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 09:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gVn/QQtEr5Sg0Bz+3OL/iqO/cDtA8lqR3ITEzgsJU30=; b=P2wSZJj+DM6w+o
	6jwaDoUK2uh2+h2QlOZAYbJujJ4QH0CfPJSAqRSpFOV9PeuP7YIA+tDSH5Y6/01qBa/cQYkzLWU5j
	Eh2GwTDa5yrV4hreopA50vOGhZ7C2Xn9Fd19mFsc7Ssr18CDSUnNipCOoaY0/SvmwdOWTNLUCQkJw
	S4fE9DaR47R1PEq10dHZCHdPTn9T+lRO7YwTrarftmEEV6wrVcS/UaZDZESHBA6B9/FWzxzSp6nIH
	uyixYCFB2SUtk6+AYh5PZrvAPOcIhQaLXYD+D7YaWr4f3x4kD6q9UNug5tRzAp3xXOCMR03bRFLAd
	SpyjQJVf0FtB7mjMUDlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA7VS-004gGr-KI; Wed, 19 Jan 2022 09:43:54 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA7VP-004gEM-Kd; Wed, 19 Jan 2022 09:43:53 +0000
X-UUID: 38fd6cd4979e4902b4a8e9616c2a518f-20220119
X-UUID: 38fd6cd4979e4902b4a8e9616c2a518f-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 764617408; Wed, 19 Jan 2022 02:43:45 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 01:43:43 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 17:43:42 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Jan 2022 17:43:42 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <ardb@kernel.org>
CC: <Jason@zx2c4.com>, <davem@davemloft.net>, <ebiggers@google.com>,
 <gregkh@linuxfoundation.org>, <herbert@gondor.apana.org.au>,
 <linux-arm-kernel@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <matthias.bgg@gmail.com>, <miles.chen@mediatek.com>,
 <samitolvanen@google.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
Date: Wed, 19 Jan 2022 17:43:42 +0800
Message-ID: <20220119094342.4515-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAMj1kXGUtg1BOauCjxB+S7yMTPArQrPnHf5jnfhOihL-FHrFZA@mail.gmail.com>
References: <CAMj1kXGUtg1BOauCjxB+S7yMTPArQrPnHf5jnfhOihL-FHrFZA@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_014351_727784_7C935D10 
X-CRM114-Status: UNSURE (   6.91  )
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

>Ehm, maybe not. As Jason points out, the typedef does not have quite
>the right type, so that is most likely the culprit, and this
>workaround would trigger CFI in exactly the same way.
>
>Interestingly, the compiler does not seem to mind, right? Or are you
>seeing any build time warnings on the reference to blake2s_compress in
>the call to __blake2s_update() ?

No, no warnings as the -Wcast-function-type is globally enabled.
I cleaned some cast-function-type errors but no warnings in
__blake2s_update.


Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
