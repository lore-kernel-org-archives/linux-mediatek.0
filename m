Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0039EC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 11:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muns5i3N4GWLuWCPo/1wFXyzGgs1LfHaK1f53fXYY0Y=; b=1PSKHdKUKgNqu0nZvihgZ2a1iY
	axgiPJChG43msg3gLeJxWMnNLpVXhLwYeIu/JXg3c4Zyq9Z582Jt8lzTU0g2wDiyQw+tdw58N/JaL
	oVoQWdDIwWg1m8F2zgGKxjbCxK+Fp0TUwZV4Fz8HxvRKwg1wnPkQoVWyHqgNOkVy03a3+LisOsjjf
	YQ++1Aoj5nfQiDRVUyJ7lNSit/N5ZgjbSoRSwHzwMjXo8i1o9qItwAoloSaAWzqsplIZxXs1py2Vn
	5HhgBXrfv/3fuiPnsuP2gJUMcj7iOSRACG3CiJNFlQnQa/rGkFFqjiEI6lyx3MW3pykXzzdxwD8YC
	RHb+Ne6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDPKp-00D0q2-Vy; Mon, 18 Jul 2022 11:54:48 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDPKd-00D0iQ-OR; Mon, 18 Jul 2022 11:54:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4343CB81164;
	Mon, 18 Jul 2022 11:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90053C341C0;
	Mon, 18 Jul 2022 11:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658145272;
	bh=JO1/+51IzIqWlRVWa3wn637GFpPwLMpOLbdkHlx7z6s=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=LyhqHG+1nHgHhSWyS0qNHxtwg2KvdDfaLkocSe8qQpmPpduziHZ2lrRXhKkLOyq9r
	 DXnLHnYom0JqG0h1Kyx5UjCBFoE6Hil+1Bw4Ihe/CLl8/k3AJqnMdXnoGr14BRnKfa
	 3LGFydaAbvOfagpqm9rZEbVWcsWNEhqpWbzkEFaDvq0BocuJBw00UUajV4zhqENzbL
	 ijtdjZqzrZ/F4hDItOADXSFs6Cp1jtY1godjsymHtLIqRz2DzXCAuqiim95HV0y21w
	 fFslpygl9J3WkEBeU+qwUwk7qoBa1pH62ehtVrpOJvXNEIZJOmIclJ/6RaMNtBG7VX
	 uZAzVyGyQVq7w==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: wifi: mt7601u: fix clang -Wformat warning
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220711212932.1501592-1-justinstitt@google.com>
References: <20220711212932.1501592-1-justinstitt@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: Jakub Kicinski <kubakici@wp.pl>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 Justin Stitt <justinstitt@google.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165814526751.17539.17204768341511432544.kvalo@kernel.org>
Date: Mon, 18 Jul 2022 11:54:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_045435_969216_00ADEBC6 
X-CRM114-Status: GOOD (  15.23  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Justin Stitt <justinstitt@google.com> wrote:

> When building with Clang we encounter this warning:
> | drivers/net/wireless/mediatek/mt7601u/debugfs.c:92:6: error: format
> | specifies type 'unsigned char' but the argument has type 'int'
> | [-Werror,-Wformat] dev->ee->reg.start + dev->ee->reg.num - 1);
> 
> The format specifier used is `%hhu` which describes a u8. Both
> `dev->ee->reg.start` and `.num` are u8 as well. However, the expression
> as a whole is promoted to an int as you cannot get smaller-than-int from
> addition. Therefore, to fix the warning, use the promoted-to-type's
> format specifier -- in this case `%d`.
> 
> example:
> ```
> uint8_t a = 4, b = 7;
> int size = sizeof(a + b - 1);
> printf("%d\n", size);
> // output: 4
> ```
> 
> See more:
> (https://wiki.sei.cmu.edu/confluence/display/c/INT02-C.+Understand+integer+conversion+rules)
> "Integer types smaller than int are promoted when an operation is
> performed on them. If all values of the original type can be represented
> as an int, the value of the smaller type is converted to an int;
> otherwise, it is converted to an unsigned int."
> 
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> Acked-by: Jakub Kicinski <kubakici@wp.pl>

Patch applied to wireless-next.git, thanks.

68204a696505 wifi: mt7601u: fix clang -Wformat warning

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220711212932.1501592-1-justinstitt@google.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


