Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DFAC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 09:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uHcPNSkqWteCtjhVEcavffpfYvkZ61aGH/LouyNdIUY=; b=CTRgNNKQ/49lSp
	yYb5m+PpKTEHnG+VaYxYxHugasJG3z4ZLvzMOrngIihuB+JuBrhlaAl0Zo1OnAUtMdvPuINb6pLYt
	jv5PudQHVXyYsoAFpU8Nt6hdrtbn/VpqVUoKqWsk+EqMwwXBfhIDlhBTOTwkHpSRBsw6tTdqlxqzC
	Oue1wKNm4Sf/vk9J7b9P8aCysPFUiR587iUR/foUTAw1kke7ICjho5znlXAcK7FL+aeke1LcXt9q6
	sX3vZRubp5TB2vcTfhsly1dDDzWSQ0gRixe8pIa7vSAxJ03ZPs0n7TWipSiTXHSwEcquLeW0RNhpU
	CCmMbtpIi8biLutWuHuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOz3S-00FtK8-PV; Tue, 01 Mar 2022 09:44:26 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOz3P-00FtEv-L7; Tue, 01 Mar 2022 09:44:25 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1nOz3I-0003z9-01; Tue, 01 Mar 2022 10:44:16 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
 id E43C2C28F0; Tue,  1 Mar 2022 10:10:56 +0100 (CET)
Date: Tue, 1 Mar 2022 10:10:56 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: ralink: mt7621: use bitwise NOT instead of logical
Message-ID: <20220301091056.GB6517@alpha.franken.de>
References: <20220301011507.15494-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220301011507.15494-1-ilya.lipnitskiy@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_014423_863784_683B5A55 
X-CRM114-Status: GOOD (  17.61  )
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

On Mon, Feb 28, 2022 at 05:15:07PM -0800, Ilya Lipnitskiy wrote:
> It was the intention to reverse the bits, not make them all zero by
> using logical NOT operator.
> 
> Fixes: cc19db8b312a ("MIPS: ralink: mt7621: do memory detection on KSEG1")
> Suggested-by: Chuanhong Guo <gch981213@gmail.com>
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
> index 12c8808e0dea..fb0565bc34fd 100644
> --- a/arch/mips/ralink/mt7621.c
> +++ b/arch/mips/ralink/mt7621.c
> @@ -69,7 +69,7 @@ static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
>  	__raw_writel(MT7621_MEM_TEST_PATTERN, dm);
>  	if (__raw_readl(dm) != __raw_readl(dm + size))
>  		return false;
> -	__raw_writel(!MT7621_MEM_TEST_PATTERN, dm);
> +	__raw_writel(~MT7621_MEM_TEST_PATTERN, dm);
>  	return __raw_readl(dm) == __raw_readl(dm + size);
>  }
>  
> -- 
> 2.35.1

applied to mips-fixes

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
