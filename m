Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686F8C004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 16:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcGAoepvsEO3k7eRWlvv55F7FjHMEdrfADYYqAFGFnk=; b=5Cgp+KeBGp+F1Ad+zPyThU8rqs
	z3NY+msTDkBExzFoffAqJpZf9bN8LOwyuefs1GMDkxapxfIVoTlTf59lsu1GNky6Sizuye7ffucjZ
	L/lCyjScQbrSXrbbjRHxv2jaHfg2iPs5VGu2IgpzsCHWI2syNRfRmfm0m9d54rMcLVnuQKcE/a1Po
	JfBrnBXZIiLhxzhRaCl4ki3p0HZXsnuMB0RuT6zSl3EgYWkJuuVRL7UHbgaFM2sBheUsrIpMsQZOY
	tnzNb4kk2SIy8/cb5+7hm/zHTofeXCTFN3M5g8mzdVNmkmuRy6iQWYzi/HMUIkhice5GMyMdyjBP8
	DFyIl8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXb0-005thj-MJ; Thu, 19 Jan 2023 16:16:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXaV-005tZE-3J; Thu, 19 Jan 2023 16:16:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A729C61CB8;
	Thu, 19 Jan 2023 16:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 686F4C433EF;
	Thu, 19 Jan 2023 16:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674144986;
	bh=KCGVBnDEkLnMEQSY6tEtqfJoXRhHiOT2it8+U/KUeXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQN1IErrIxsvnYoPHEmxSkukWKLHZ3L47Hbth5LpwxT0XDzjNG/7ifs0mrs9eWHao
	 Z/Sbz9+QD7hKDtYKIhXCEUOd4Uly0xBTnQvq14xkIKs3Hw2PgvzdHWdG1OMeCTMpyq
	 3FLqL1RmP6wlc67BWzR+fwsUrTrB1dYXclFd1FGW7rF04/t8mVLOg8MxACngsI8Xgd
	 6/f2E+xnp8t0x8UVyiDF1+Al5E8QtDNSKpdCN3Ye4ted742TaAiWxpY2Fx+wF1W9Eo
	 4KSIOm7CdctBS90En1W3uDmC3lbu+My4tGCJnG5fVOmU0o+jyPPrJbv3Hn47aWGDjp
	 1pBKB7xImPWUA==
Date: Thu, 19 Jan 2023 16:16:17 +0000
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Gene Chen <gene_chen@richtek.com>, linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Kurt Kanzenbach <kurt@linutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v4 01/11] leds: add missing includes and forward
 declarations in leds.h
Message-ID: <Y8ls0ZQiY/dcTdAE@google.com>
References: <20230103131256.33894-1-andriy.shevchenko@linux.intel.com>
 <20230103131256.33894-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230103131256.33894-2-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_081627_240479_47A5F3FD 
X-CRM114-Status: GOOD (  11.57  )
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

On Tue, 03 Jan 2023, Andy Shevchenko wrote:

> Add missing includes and forward declarations to leds.h. While at it,
> replace headers by forward declarations and vise versa.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/leds.h | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)

Applied, thanks

-- 
Lee Jones [李琼斯]

