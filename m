Return-Path: <SRS0=Rw5Z=YR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEECC47E49
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 06:25:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50D2421655
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2019 06:25:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a1aN5mN+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50D2421655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a+5hRMkBLvyNZawnVLbRcMkC1Nywhk+N152T8lRzv1I=; b=a1aN5mN+zeqhPp
	Hg9q1nfAF8Wk7MUQnLgTOIfqMpTUq2v85Oax6ffE6Zij+Qs6fLwcDQJJWdDDLR8S+BgC0Dj692aTg
	yI71j4fEsronYuUPZk0+kwUKh/x0cUU0A0cipihCl6WL3iZz/wPvFe7xId/j/z14UDOtwScgX5AlE
	jPdZgEl3T5Lf5kY/7ucIOvKaPMLksYFwZ5NNhx+g4ATOMrY0Q4F3oSqozo8PeuxcTvfV7AQ+53Bd5
	y1wiwYAk4nHb5FyTA52LRjnZX7uyC343ujDeg//x1kQic+8wx1W0HRG2IDJq/xWfn7R4J4t8NQOEn
	W5J/QTPOMfn2iu0AutFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNWYh-0005nP-Gb; Thu, 24 Oct 2019 06:25:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNWYf-0005mf-5q; Thu, 24 Oct 2019 06:25:18 +0000
X-UUID: a874f3a9fc704192ac3b215dc9f2d57b-20191023
X-UUID: a874f3a9fc704192ac3b215dc9f2d57b-20191023
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <luhua.xu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1452921731; Wed, 23 Oct 2019 22:25:06 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 23 Oct 2019 23:25:09 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 24 Oct 2019 14:25:08 +0800
Received: from [10.15.20.246] (10.15.20.246) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 24 Oct 2019 14:25:07 +0800
Message-ID: <1571898319.4311.3.camel@mbjsdccf07>
Subject: Re: [PATCH 1/1] spi: mediatek: add power control when set_cs
From: luhua xu <luhua.xu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Thu, 24 Oct 2019 14:25:19 +0800
In-Reply-To: <20191023151121.GC5723@sirena.co.uk>
References: <1571834322-1121-1-git-send-email-luhua.xu@mediatek.com>
 <1571834322-1121-2-git-send-email-luhua.xu@mediatek.com>
 <20191023151121.GC5723@sirena.co.uk>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_232517_223758_00065BDF 
X-CRM114-Status: UNSURE (   8.84  )
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
Cc: wsd_upstream@mediatek.com, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2019-10-23 at 16:11 +0100, Mark Brown wrote:
> On Wed, Oct 23, 2019 at 08:38:42AM -0400, Luhua Xu wrote:
> > From: "luhua.xu" <luhua.xu@mediatek.com>
> 
> > Use runtime PM to power spi when set_cs
> > As set_cs may be called from interrupt context,
> > set runtime PM IRQ safe for spi.
> 
> Why might we be trying to set the chip select state while the device is
> runtime idle?  It seems like whatever is trying to set the chip select
> should be dealing with this, not the chip select operation itself since
> that's unlikely to be happening in isolation.

Hi Mark,
Spi framework provideds  spi_setup() to modify spi settings for spi
device (maybe spi is runtime idle now), and this will call
spi_controller->set_cs() accessing registers.
Other spi_controller callbacks that need to access hardware registers,
are triggered by spi transfer. Spi framework will get and put runtime
power in __spi_pump_message().


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
