Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9857C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 10:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y7dhY1k7dwzCaXnu9WP9NmBG+v/gYQ4LVg0NTi1G0jY=; b=BWClfO1/tOt5J+
	Pzj4WkmthQ286geejk6Ae1myIvJaSuRLFPzjisL2I6dvF+LCJhL3j8aitBm1WFvEQ6RH6qgQVlAbP
	qjDGwLbdh8j4UWbFIC/t5lg0/9kzVu08MirwQDFn5fSK8lDc62HcWX31Jckt/fTenKiJA08oqJbEB
	V5e0MkOu4JYWbrG0WoQnfwq+tehafEFt1SfFWPQhzmTPkK65xSC3bDzwRHreocMjO7rq/HXWunL7m
	Nhthw3LmO+0FDGhYqpqm/wUueRUt/6qXvfqHRwi03/S4IrY4mMhhV69inUG/PUWwIVq7FY8rCSGwH
	SjDgHvX2ObS6oGh4SETA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA7rE-004nrC-Kw; Wed, 19 Jan 2022 10:06:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA7rB-004nq3-Ip; Wed, 19 Jan 2022 10:06:22 +0000
X-UUID: 6f39b86bd3bf4557a2cf41abd2d1b933-20220119
X-UUID: 6f39b86bd3bf4557a2cf41abd2d1b933-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2047853670; Wed, 19 Jan 2022 03:06:18 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 02:06:16 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 18:06:15 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Jan 2022 18:06:15 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <jason@zx2c4.com>
CC: <ardb@kernel.org>, <davem@davemloft.net>, <gregkh@linuxfoundation.org>,
 <herbert@gondor.apana.org.au>, <linux-arm-kernel@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <miles.chen@mediatek.com>, <nathan@kernel.org>, <ndesaulniers@google.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
Date: Wed, 19 Jan 2022 18:06:15 +0800
Message-ID: <20220119100615.5059-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAHmME9oX+4Ek81xy0nBOegqABH0xYqyONAqinsu7GZ7AaQaqYQ@mail.gmail.com>
References: <CAHmME9oX+4Ek81xy0nBOegqABH0xYqyONAqinsu7GZ7AaQaqYQ@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_020621_654303_8245E4C2 
X-CRM114-Status: GOOD (  10.19  )
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

Hi,

>Hi Miles,
>
>I'm actually not able to reproduce your oops. I'm using vanilla clang
>13, cross compiling for arm64, with thin LTO enabled and CFI enabled.
>Kernel seems to run fine.
>
>
>Are there other settings that are needed to trigger this? Do you see
>it in upstream clang or just the Android fork of clang?
>
I will try another clang (the previous version I use).
I am using Android fork of clang and there is a clang upgrade in this merge.

Miles


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
