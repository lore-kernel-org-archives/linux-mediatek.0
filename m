Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E41C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jan 2022 09:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AwwZaYZAccqMxBjHWRYqBRCR9MxydnEf7pV68UMLxjw=; b=o5cMS497Q2Re8Y
	aYx7a7xxzoi9/kDRs1eYLExlHuc3QJ9LJoWrQCtgAfn8lay9KnlyHG1qUZ3kv6HSNNmIVZxjguZ84
	A65smugnk24eL/E5IopgO0StRoNCEEgo4G70/Y7DiXjEhSoE4oNsFXlLp/m6H11ZKGAgsUcoTxISM
	/Zk76hYmfX3XhLco5zJRzExsW/lZs1dgNfPD1QP3qcc42faRxc5y+qZLzDgiMj+a44aNCuaxUIhbd
	EQVCciY0laiLpFPUtGWOwvdbPm8FEKb9APvXQ1dW2cscrDWBMSE4gEjYTm7u/pZCwIA6ilbJIk+ld
	iGQcJPIUJfbJ4gwXc1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nA7Md-004bxx-9y; Wed, 19 Jan 2022 09:34:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nA7Ly-004bZH-4s; Wed, 19 Jan 2022 09:34:07 +0000
X-UUID: cd3b69d70fb145daa2071b6aab1253b9-20220119
X-UUID: cd3b69d70fb145daa2071b6aab1253b9-20220119
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <miles.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 748684259; Wed, 19 Jan 2022 02:33:57 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Jan 2022 01:24:47 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 19 Jan 2022 17:24:40 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 19 Jan 2022 17:24:40 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <jason@zx2c4.com>
CC: <ardb@kernel.org>, <davem@davemloft.net>, <gregkh@linuxfoundation.org>,
 <herbert@gondor.apana.org.au>, <linux-arm-kernel@lists.infradead.org>,
 <linux-crypto@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <matthias.bgg@gmail.com>,
 <miles.chen@mediatek.com>
Subject: Re: [PATCH] lib/crypto: blake2s: fix a CFI failure
Date: Wed, 19 Jan 2022 17:24:40 +0800
Message-ID: <20220119092440.4045-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <CAHmME9pv4WWATjdqZgwrtHDmq3sX4ABfB9PoNT9Z4tSEduR2Lw@mail.gmail.com>
References: <CAHmME9pv4WWATjdqZgwrtHDmq3sX4ABfB9PoNT9Z4tSEduR2Lw@mail.gmail.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_013406_238654_CF719F5E 
X-CRM114-Status: GOOD (  11.48  )
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

hi,

>Thanks for the patch. Could you let me know which architecture and
>compiler this was broken on? If I had to guess, I'd wager arm32, and
>you hit this by enabling optimized blake2s?

Actually, I am merging android-common tree and test our device.
I use arm64 and clang-r437112b.

I'm not sure which option is the right one, grep 'BLAKE' .config shows:

CONFIG_CRYPTO_BLAKE2B=y
# CONFIG_CRYPTO_BLAKE2S is not set
# CONFIG_CRYPTO_LIB_BLAKE2S_GENERIC=y

and... I found that my patch breaks arm32 build, sorry for that.

>If so, I'm not sure the problem is with weak symbols. Why should CFI
>break weak symbols? Rather, perhaps the issue is that the function is
>defined in blake2s-core.S? Are there some CFI macros we need for that
>definition?


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
