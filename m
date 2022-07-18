Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE55C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Jul 2022 11:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ldq/cI/LyZOjep8ieSdgEh6sNmY/fkrJz4bkNlrNseI=; b=AFXt4tO/Kd+TCo0SXMgfvLcdR1
	XirQKbJvfJmJr3pXorJXadnOpOnKXVYytgU7Nkp9nuPt5E30vurACOCDHyG8MDPB619p4rJr+W5X5
	OI9FWJRhP/ovkImy1jc8IEqV1e+VFtwUsF9+2W65709PStcf09aBc9Y30D+Yy1i8Uay8KspdQ7BjA
	Yz8syUY9Na4up8idzzb8928TFom36hvvgRWYEOu/dj0ok3lps2GbPB9kjBe3b6KGGSQvJ2KmVbthT
	H6N1bAdxGEF+0+URCu/cVuGSJddA3U89zC6HbLoZTEYMzqYH8xjfca87j5odC8voGKdWqv5FZ1ozy
	OmIuOAJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDPJe-00D0DW-1L; Mon, 18 Jul 2022 11:53:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDPJM-00D064-0y; Mon, 18 Jul 2022 11:53:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 99C7E61414;
	Mon, 18 Jul 2022 11:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FC6EC341C0;
	Mon, 18 Jul 2022 11:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658145193;
	bh=Phc0x9SWsO+X5B2V1yFiu7oQp3xqcc3kPiUwuV37VD8=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=cg61rv7JyfsvKq+pksU/RtmLFEnKmV+HUjSL9k9VcgV9wPu8DQUbXhZkQJU10FWS+
	 DHEkassZJsixQy50n+gfle8U7saVv8HQScsSNr5+vm9k0ZeKGWAl7M9kTC7ohwYzkm
	 bvHvJR7BJqDCBP5XcbCpRvrA6CEREA3o65Bz7qWBuZk9M4pAEXdf9TkTSD2h6/5ny7
	 b3pZFZWIrTBvAjr7+wPNYUxU9Y732kq52a9d6vZBv6mD16sjxRTIjsVNbzzfDOe5Dk
	 LjjkrvngQqErw1skCAsTELnEKBC/La+bXexwO2kR3Q8Ki7aA2U/cfky/YWbq9OcUVP
	 pOdWGOl45aigg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: wifi: mt7601u: eeprom: fix clang -Wformat warning
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220709001527.618593-1-justinstitt@google.com>
References: <20220709001527.618593-1-justinstitt@google.com>
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
Message-ID: <165814518849.17539.4270310820175063607.kvalo@kernel.org>
Date: Mon, 18 Jul 2022 11:53:10 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_045316_150462_55D8BFBC 
X-CRM114-Status: GOOD (  11.55  )
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

> When building with Clang we encounter the following warning:
> | drivers/net/wireless/mediatek/mt7601u/eeprom.c:193:5: error: format
> | specifies type 'char' but the argument has type 'int' [-Werror,-Wformat]
> | chan_bounds[idx].start + chan_bounds[idx].num - 1);
> 
> Variadic functions (printf-like) undergo default argument promotion.
> Documentation/core-api/printk-formats.rst specifically recommends using
> the promoted-to-type's format flag.
> 
> Moreover, C11 6.3.1.1 states:
> (https://www.open-std.org/jtc1/sc22/wg14/www/docs/n1548.pdf) `If an int
> can represent all values of the original type ..., the value is
> converted to an int; otherwise, it is converted to an unsigned int.
> These are called the integer promotions.`
> 
> With this information in hand, we really should stop using `%hh[dxu]` or
> `%h[dxu]` as they usually prompt Clang -Wformat warnings as well as go
> against documented standard recommendations.
> 
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Signed-off-by: Justin Stitt <justinstitt@google.com>

Patch applied to wireless-next.git, thanks.

07db88f11e63 wifi: mt7601u: eeprom: fix clang -Wformat warning

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220709001527.618593-1-justinstitt@google.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


