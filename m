Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D26FF9B61C
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Apr 2026 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SeDCLz0NhnspqXpCt5u6rA8PaayVOjNww62Ncs28gx0=; b=JnGEHMGSK6uGUawiw+DJbzJOcb
	ksL7edGIdXTUU2u7/rFA5bGjBjgZx4pG4DAjV4ji8CH82zbrkoj4QeQ4gM6DP83HQnQJ4878ox6Vv
	rH7SJC7EvVEDXUnX/QBhYKlAQhwyzmYqrXl4AUJFeChlCrwlgfC/zgEoBf4EKrTvE2fx9kdMUjQcV
	i6FmF3+upNO7PimNEYP5YD48h5xULdzYeT6ERf/qy6DzoL3pKDZfDRrIAXaxqtV09J5sax+XTPM8r
	OFj3s5bqb8yrj+NSSRm7d1+W6aiTKkfQ4jJPSlMqzO9UC9AMrXLkugtm5StYRGpP59MKPvBwrDZkX
	2ZyKpiUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFVMX-00000009ye3-03kr;
	Wed, 22 Apr 2026 11:03:21 +0000
Received: from cae.in-ulm.de ([217.10.14.231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFVMU-00000009ydb-2aGJ
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Apr 2026 11:03:20 +0000
Received: by cae.in-ulm.de (Postfix, from userid 1000)
	id 2E38D14012C; Wed, 22 Apr 2026 12:56:01 +0200 (CEST)
Date: Wed, 22 Apr 2026 12:56:01 +0200
From: "Christian A. Ehrhardt" <lk@c--e.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>,
	"Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux-mmc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org, Marcel Holtmann <marcel@holtmann.org>,
	linux-bluetooth@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v1 1/6] sdio: Add syntactic sugar to store a pointer in
 sdio_driver_id
Message-ID: <aeipQfCYKjl006uM@cae.in-ulm.de>
References: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
 <c830049dcfcd99f005e2ff6742aace9341c61f13.1776429984.git.u.kleine-koenig@baylibre.com>
 <aeaMkfk_1t98e7SU@monoceros>
 <CABBYNZJzbEmYzTk2m+Y8SoHVouTMA6Gje_55iJsQ6cYtDLftbQ@mail.gmail.com>
 <aecu1ixyHP2hQvgE@monoceros>
 <aehwG2Egt93-sPVB@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aehwG2Egt93-sPVB@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_040318_799491_F5491B6E 
X-CRM114-Status: GOOD (  17.11  )
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


Hi,

On Wed, Apr 22, 2026 at 09:52:11AM +0300, Andy Shevchenko wrote:
> > To be honest, with the involved void* this isn't really type-safe
> > either, but at least the data keeps being a pointer which is really
> > helpful on CHERI. FTR: The alternative would be to use uintptr_t instead
> > of unsigned long, which also has proponents in the CHERI community and
> > which is used in the current vendor patch stack.
> 
> FWIW, Linus categorically told that it has to be no uintptr_t in the
> Linux kernel.

This is probably not the correct context to discuss this but
I will point out that if/when CHERI support is added to the
kernel we will need a way to distinguish between
* A (fat) pointer converted to an integer type (in order to do
  integer arithmetic on the address) that might be converted back
  to a pointer in the future and
* A plain address "extracted" from a fat pointer.
Using `uintptr_t` for the former and `unsigned long` for the
latter seems like a reasonable choice but there are certainly
other options.

Sorting out the difference between the two is a very large
part of the diff required to port Linux (or in fact any piece
of low-level software) to a CHERI system.

Best regards,
Christian



