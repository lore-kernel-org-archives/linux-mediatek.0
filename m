Return-Path: <SRS0=vJVy=7N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292F6C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 May 2020 12:33:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE048206F0
	for <linux-mediatek@archiver.kernel.org>; Sun, 31 May 2020 12:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u1M+9t2y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE048206F0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TNhWsjRHxCDhq0Dt1AHVrVsRG2dG7IX7RJvj3lOesbM=; b=u1M+9t2yPBuIAq
	9l2zoH7vMRUMuaFyPFizSQy2arSFg1YyWtHHnTvQrQOyJBamY0nVN4iq1j+TwsSgw17TicVeGdQ+u
	WjyBmFcPB5vRGJN75RHqvKYRxElJ2uMV1WJPmMZjhH1GnCPJWGauvROQZROCKkQhiOBl8U++qrrtE
	LuSBmNNxdCtfohAIhRnYJZASCZ5xTEtphqQFPtL9w3dt9MqsDvOsEVDf178fj0aceU6D3NUTXaAil
	mMq4vRDIJ+sGhagFddmdRaLgKnYoaz2Rx8PTvXe3hnlmdZgNMLbrw1EmpVQSj1/qPDRy+JFjbwFyy
	ybQXS/cswuhk7jHHKqGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jfN9P-0005wl-70; Sun, 31 May 2020 12:33:15 +0000
Received: from elvis.franken.de ([193.175.24.41])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jfN9M-0005vl-1p
 for linux-mediatek@lists.infradead.org; Sun, 31 May 2020 12:33:13 +0000
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1jfN9A-00033I-01; Sun, 31 May 2020 14:33:00 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id A8153C0654; Sun, 31 May 2020 14:32:48 +0200 (CEST)
Date: Sun, 31 May 2020 14:32:48 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Chuanhong Guo <gch981213@gmail.com>
Subject: Re: [PATCH] MIPS: ralink: drop ralink_clk_init for mt7621
Message-ID: <20200531123248.GB6039@alpha.franken.de>
References: <20200328041523.81229-1-gch981213@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200328041523.81229-1-gch981213@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200531_053312_242878_03DC5677 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org, John Crispin <john@phrozen.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Mar 28, 2020 at 12:14:57PM +0800, Chuanhong Guo wrote:
> ralink_clk_init is only called in arch/mips/ralink/clk.c which isn't
> compiled for mt7621. And it doesn't export a proper cpu clock.
> Drop this unused function.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  arch/mips/ralink/mt7621.c | 43 ---------------------------------------
>  1 file changed, 43 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
