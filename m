Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98356C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 09:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJXgWCR8CujgbUN6BsszebCTAkBEZQOYo8ZaW6BLAmg=; b=btGob2lyBZy4iW
	JgjVj4p7HGO9Vh2WoMfMprhhGUYB46YHa1+3fPrHtrX8NeiVnocTVGNdr6vh1GwuJ+gc/+2IT9Saa
	5KOND6Zcq05F7N88yb91sfH1oRlWXZ3gymkxEb31QIfG1drbciaWGKqC34lWnQoYPCZ+ouvEmTlMb
	ZSimaVIRBy+JGhpYiYtcGvIZ4slis/bCipEqFnDyGagdmTjUWu2TXcej7ee1vDA75YsYSUNphy1b3
	r9pbNQAHHDm/nJvZR3pHpGb4aBuPgUTI+M7yh56rXWRSaJoUUeNJifQmhBH+cIB6clhWfC88V/cK3
	rD9+0xR3cb/nMuUtX2jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA752-004W0E-O2; Wed, 19 Jan 2022 09:16:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA750-004VxV-0d; Wed, 19 Jan 2022 09:16:35 +0000
X-UUID: b5be508f66ff4d6c97cc4b825ef6654b-20220119
X-UUID: b5be508f66ff4d6c97cc4b825ef6654b-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1524336172; Wed, 19 Jan 2022 02:16:29 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 01:16:27 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 17:16:26 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Jan 2022 17:16:26 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <jason@zx2c4.com>
CC: <ardb@kernel.org>, <davem@davemloft.net>, <gregkh@linuxfoundation.org>,
 <herbert@gondor.apana.org.au>, <linux-arm-kernel@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <miles.chen@mediatek.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
Date: Wed, 19 Jan 2022 17:16:23 +0800
Message-ID: <20220119091626.3636-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAHmME9rWs_w_dMfDLFuD-tr79cnVyuny4fLn9Wh0+bs76Nt0MA@mail.gmail.com>
References: <CAHmME9rWs_w_dMfDLFuD-tr79cnVyuny4fLn9Wh0+bs76Nt0MA@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_011634_105186_20A42AB4 
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

>typedef void (*blake2s_compress_t)(struct blake2s_state *state,
>				   const u8 *block, size_t nblocks, u32 inc);
>
>should become
>
>typedef void (*blake2s_compress_t)(struct blake2s_state *state,
>				   const u8 *block, size_t nblocks, const u32 inc);
>
>Does making that change fix things for you?
>
>Thanks,
>Jason

Thanks for your fast response.
It does not work. I tried this before reverting the commit 6048fdcc5f26.

Miles

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
