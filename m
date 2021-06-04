Return-Path: <SRS0=7C4w=K6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D2F6C4743D
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 19:19:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A478613F9
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 19:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A478613F9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+BgQqTO0d39eMidteJx/AVz4KA1jWCn4ghVq4xrOZdE=; b=QsHzKyZTte2RyB
	Wq4slehf68bE2DZEdEwaKUZpaIn9GNdf717+tqskz7Wx8qTYmp8zktABYemjEl48cvsyzd4sfZAhO
	uarXBHWdmoq2Pwiu2Qllzf06HuN/VQ1JNZMSDa0wQXP2kYHHOXIuuy5dMGEr9o2b+p4sm9NDNiROS
	dhKXD8lscRqltu5koMJBlGNhSjG9jXllp+PXvM1SN8++D0AT4+GlpRQN/w3Ez9Vv83kNRacwnQ0Ut
	VCLGpCX/5KEA4IKwLqeS734zavRzj21Py5dVWKhrOcvmczRUmcARfTTEMqpVP1yPJelCf/23N8j+0
	ZQm7FGg9jvCpeZbwFJkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpFMC-00Eyau-Q1; Fri, 04 Jun 2021 19:19:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpFLx-00EyWD-BO; Fri, 04 Jun 2021 19:19:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAA8060FF2;
 Fri,  4 Jun 2021 19:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622834372;
 bh=P6IaSvqgJAriq/iT+X5V+CNKjpfeWSTD2AHq/76koTg=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=ejX9ePwh000rZ2RTbyRE2Pe6GXBBS2PN/Wc2oQVAatnlpWfaZcBkhfYgA7oi7KBZn
 6wm1k9Q2hVgmWBcHCX9BJuhuE8ynJTW9gIY8PLmC8/4VX1DqvyQm4zfT2m3j8A4BA/
 XIFwT2rmdyCcybtxJx1qIFNfrY8PRG4hWpIi9DqvLPRMoB1ZqfVUeddqQ6QJ8ZS7Ux
 buA+sQUzvHLai7nTi7a/r13HgUoa6oPikJzhCtGPXshgkEgGr9YY1WSz/gW+BtPch3
 ywX5jhxbRgzzkyewaIpqqriBej+9+ZUuXaFCjPgMWbSOa+XzdoSZwogroXDYEhWk4W
 cWCLSBbBOJciQ==
MIME-Version: 1.0
In-Reply-To: <20210604132335.GK2435141@dell>
References: <1595493126-21611-1-git-send-email-wendell.lin@mediatek.com>
 <1597052186.27843.1.camel@mtkswgap22>
 <CAF2Aj3hZB08d8x6XOqsP4m5fv76fWH48U95j8ugLt-YWFJ-kkA@mail.gmail.com>
 <162276982204.1835121.10976600065855289763@swboyd.mtv.corp.google.com>
 <20210604082427.GE2435141@dell> <20210604082524.GF2435141@dell>
 <1622802121.26830.22.camel@mtkswgap22> <20210604132335.GK2435141@dell>
Subject: Re: [PATCH 1/1] clk: Export clk_register_composite
From: Stephen Boyd <sboyd@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, linux-clk <linux-clk@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, ARM/Mediatek SoC support
 <linux-mediatek@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS <devicetree@vger.kernel.org>, wsd_upstream
 <wsd_upstream@mediatek.com>; 
To: Lee Jones <lee.jones@linaro.org>, Wendell Lin <wendell.lin@mediatek.com>
Date: Fri, 04 Jun 2021 12:19:31 -0700
Message-ID: <162283437157.1835121.5925083479747882207@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_121933_437949_CBFB707F 
X-CRM114-Status: GOOD (  26.84  )
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

Quoting Lee Jones (2021-06-04 06:23:35)
> On Fri, 04 Jun 2021, Wendell Lin wrote:
> 
> > On Fri, 2021-06-04 at 09:25 +0100, Lee Jones wrote:
> > > On Fri, 04 Jun 2021, Lee Jones wrote:
> > > 
> > > > On Thu, 03 Jun 2021, Stephen Boyd wrote:
> > > > 
> > > > > Quoting Lee Jones (2021-05-20 09:07:42)
> > > > > > On Mon, 10 Aug 2020 at 10:36, Wendell Lin <wendell.lin@mediatek.com> wrote:
> > > > > > 
> > > > > >     Hi Matthias and all,
> > > > > > 
> > > > > >     Gentle ping on this patch.
> > > > > > 
> > > > > > 
> > > > > > What about a not-so-gentle ping on this patch?  Grrrr... :)
> > > > > > 
> > > > > > FYI, this is still required by more than one source.
> > > > > > 
> > > > > > Please help get this out of all of the vendor trees please.
> > > > > > 
> > > > > 
> > > > > Is there an in-kernel user?
> > > > 
> > > > How can there be?  It's not exported yet. :)
> > > > 
> > > > However there shouldn't be any barriers for vendors represented in
> > > > Mainline to build their drivers as modules if they so wish.  If/when
> > > > they do, this will need to be exported.
> > > 
> > > Wendell Lin, is this what you wish to do with the in-kernel MediaTek
> > > driver?
> > > 
> > This is because Mediatek clock driver would be built as kernel module,
> > so clk_register_composite() used should be exported, then we could use
> > it. 
> > 
> > Please refer:
> > [PATCH 2/2] clk: mediatek: Add EXPORT_SYMBOL for kernel module support 
> > https://lkml.org/lkml/2020/7/1/124
> > +EXPORT_SYMBOL(mtk_clk_register_composites);
> > 
> > clk_register_composite() is used by Mediatek clk kernel module.
> > From export symbol: mtk_clk_register_composites. 
> 
> Perfect.  Thanks for the clarification.
> 
> Anything else you need from us Stephen?
> 

Is the mediatek driver compilable as a module? Last time I checked it
wasn't a module. I want an upstream modular driver that uses the symbol.
Otherwise we're exporting symbols when it doesn't need to be.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
