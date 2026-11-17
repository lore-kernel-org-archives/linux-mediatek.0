Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9C39606A8BE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 17:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JO9+KCVI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DWSbG4O7NNcxX8fObj3HSY6oLeblqc38YjrZ70564Yc=; b=JO9+KCVIdgZJaTZIaIpwHalPBG
	BVVyD+/uWZP8ac/CccZY7pTB+iUEjRes3eWBQJXAo8tKbZyaHbZxo7Y5uEXAakT19WYoMBdxlfBDe
	2fo8dfEpHjmHZl6whyWH4SSS6G2gCDaX3ffDkFAj1iB4WnADBBMc8pT0CFpFFv/+bX3NR7jCg7oDw
	2norZQYDqUS3kQ4imKhnxT0KS+Or9/mYQmYRB5kQYwRYzYlx9bYLffqDEF05854z9sfwpMBtITfgG
	wtCLIIbg5u2eaHmIQggO729gZ90ELDleCM0C+fzYzSM9XC8Q4dL7sfBrq2CLKcNoQlFtYFmRkE+tf
	ppNL4/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMaK-00000006UuG-2Ggd;
	Tue, 17 Nov 2026 17:03:08 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTMaG-00000006Ut8-19kH;
	Tue, 17 Nov 2026 17:03:06 +0000
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1xTMaC-0005GF-00; Tue, 17 Nov 2026 18:03:00 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 034DFC0546; Tue, 17 Nov 2026 17:56:41 +0100 (CET)
Date: Tue, 17 Nov 2026 17:56:40 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mips: ralink: mt7621: avoid casting away __iomem in
 wraparound test
Message-ID: <avyHSKd4l8YYdESO@alpha.franken.de>
References: <20261004184828.31284-1-rosenp@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004184828.31284-1-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_090304_460248_7F634183 
X-CRM114-Status: GOOD (  17.83  )
X-Spam-Score: -2.6 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, Oct 04, 2026 at 11:48:28AM -0700, Rosen Penev wrote:
> CPHYSADDR() casts its argument to an integer, which strips the __iomem
> annotation from dm and triggers a sparse warning. Compute the physical
> address from detect_magic directly. The result is unchanged since the
> sum never exceeds the 512MB KSEG mask.
> 
> Fixes: 4ddaf88aadd3 ("mips: ralink: mt7621: add missing __iomem")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202610041411.uJXWXF8i-lkp@intel.com/
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/ralink/mt7621.c b/arch/mips/ralink/mt7621.c
> index ae7b8cfedd5f..2d10c74b13c1 100644
> --- a/arch/mips/ralink/mt7621.c
> +++ b/arch/mips/ralink/mt7621.c
> @@ -65,7 +65,7 @@ static bool __init mt7621_addr_wraparound_test(phys_addr_t size)
>  {
>  	void __iomem *dm = (void __iomem *)KSEG1ADDR(&detect_magic);
>  
> -	if (CPHYSADDR(dm + size) >= MT7621_LOWMEM_MAX_SIZE)
> +	if (CPHYSADDR(&detect_magic) + size >= MT7621_LOWMEM_MAX_SIZE)
>  		return true;
>  	__raw_writel(MT7621_MEM_TEST_PATTERN, dm);
>  	if (__raw_readl(dm) != __raw_readl(dm + size))
> -- 
> 2.56.0

applied to mips-next

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

