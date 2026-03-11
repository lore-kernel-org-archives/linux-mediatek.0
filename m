Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB215112583A
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cgamv1/SwJoWr3CbVvyTNp0GlZ/leWyEdkFeMQNIx/4=; b=osQZBUimwV3BTlxd3UJoUkWFcQ
	5OMohDAAy3+0dkiYEJD7bkfAUht57nFQg3jr6WUQaNxbfBNz66wjAK8IXddPAb8uL/dinGwZ8AEtK
	3Rz/hVpExKBCJpd03Lsms2Tavl4GjMm4GbR3NLY3yPrRXLxMQYZIMg/duvwuZpObomsYDR52uDS+l
	vsuBSKI41xNGvdbtKwqL3rL9g1fRivI6aIF/HwWmnOS3+6sePzngoNKH2riEqZdKAzx0n13OBXyxQ
	4bN/o7AQMsuVuaPHkLHwnU7mkoOqq4TsdVO0ONetOKOtoeHwGxiovArf2XLsrbV9O5JaaEzrtaF6m
	b06aBW3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KVu-0000000Bhh0-1VXj;
	Wed, 11 Mar 2026 14:26:18 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0KVp-0000000Bhdl-2kah;
	Wed, 11 Mar 2026 14:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=default; h=Content-Transfer-Encoding:Mime-Version:Message-Id:Subject:Cc:
	To:From:Date:subject:date:message-id:reply-to;
	bh=Cgamv1/SwJoWr3CbVvyTNp0GlZ/leWyEdkFeMQNIx/4=; b=HSE5vDuGzW7mbfoYMuZSAMBlYw
	rmZpUlZy0yjDV9X5rrLi/x+/oBFEG+JhuGvNFCe9gYfYGqy/Ivlkqzz0z9umGoVF4NwHsDKdoqAAv
	VmkOvkU+uOr4T8BlHkCPC6OkngNYAuAWggqhvRFTViY8pHDnXikA7NZJqQ7u1QNrETn0=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168] helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.98.2)
	(envelope-from <hugo@hugovil.com>)
	id 1w0KVe-000000005un-0wgL;
	Wed, 11 Mar 2026 10:26:04 -0400
Date: Wed, 11 Mar 2026 10:26:01 -0400
From: Hugo Villeneuve <hugo@hugovil.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, robin@protonic.nl,
 andy@kernel.org, geert@linux-m68k.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, hvilleneuve@dimonoff.com, mkorpershoek@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 lee@kernel.org, alexander.sverdlin@gmail.com, marek.vasut@gmail.com,
 akurz@blala.de, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 4/4] Input: charlieplex_keypad: add GPIO charlieplex
 keypad
Message-Id: <20260311102601.35ea20963ccebdeebec3c6bb@hugovil.com>
In-Reply-To: <abBugQOUWG_FTs4f@ashevche-desk.local>
References: <20260305192101.2125660-1-hugo@hugovil.com>
	<20260305192101.2125660-5-hugo@hugovil.com>
	<aari1Y1CPZSYEVj3@ashevche-desk.local>
	<abBkk4Ng-_MDHd6t@google.com>
	<abBugQOUWG_FTs4f@ashevche-desk.local>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam_score: -2.0
X-Spam_bar: --
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_072613_783201_E6A05FCB 
X-CRM114-Status: GOOD (  18.29  )
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

Hi Andy,

On Tue, 10 Mar 2026 21:18:25 +0200
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Tue, Mar 10, 2026 at 06:37:34PM +0000, Dmitry Torokhov wrote:
> > On Fri, Mar 06, 2026 at 04:21:09PM +0200, Andy Shevchenko wrote:
> > > On Thu, Mar 05, 2026 at 02:20:50PM -0500, Hugo Villeneuve wrote:
> 
> ...
> 
> > > > +	int oline;
> > > 
> > > Why signed?
> > > 
> > > > +	int code;
> > > > +
> > > > +	for (code = 0, oline = 0; oline < keypad->nlines; oline++) {
> > > 
> > > Can be like
> > > 
> > > 	code = 0;
> > > 	for (unsigned int oline = 0; oline < keypad->nlines; oline++) {
> > > 
> > > as iterator is not used outside the loop.
> > > 
> > > > +		DECLARE_BITMAP(values, MATRIX_MAX_ROWS);
> > > 
> > > > +		int iline;
> > > 
> > > Why signed?
> > 
> > Does it make any difference given practical limits on nlines?
> 
> Maybe not, but might lead to interesting bugs in the future in case if used in
> some arithmetics.

I'll fix this in next version.

Hugo.


> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 


-- 
Hugo Villeneuve

