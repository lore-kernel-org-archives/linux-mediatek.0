Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8121C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 18:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7g6HIaO1GZMsX2n9kcwgwNdmdFqUbksIjblUfB614/4=; b=GN4vZxt1oHhZYp
	8qbwMoLDxca2TYnJ+09Q3B83dtw7u4QWqyV+ZRskxuUONMP+/Rz6Wl//qo7u2/sMlgPeyfNuYd1BK
	dZLmlzMDL4QXfldaTHaOGQEDwS0NTaUvbFowP5E05LV5h8dLeVNVYt8I1/sdeie34g981MFe8A65U
	+58wv+DizOgAsL23nesyfiUa5ITHsnOGzJWNGS1Nhm0rhE9EycsFI6GaOIKhrv6cApUCNjjAHeEza
	8sDkNh85LfYcTG/rptZpPS0WB9wOoOuxE5lZQput4pbSzgUxMVF5nREK1QiyoVDIrTwW0Av5GygFh
	LPpN4GZgk9kByUj3It0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQCzE-00BgKJ-FT; Fri, 04 Mar 2022 18:49:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQCz2-00BgHe-CV; Fri, 04 Mar 2022 18:48:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C08F4B82676;
 Fri,  4 Mar 2022 18:48:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8745CC340E9;
 Fri,  4 Mar 2022 18:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646419732;
 bh=8AHE+FmAngIrfiBRcQ3Z7bcE+LNrJLhOoPKv6Ea4Pao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sn2HO/dr2Aasa3SPDpBahX1mbfDrKo4Lg8d20izr1YdonbWi573mPTt+Yqc49mqYl
 fLNdU9kh/IUo4X+Qm12zaV987ndTxTh+41Tle2gfJ97iKesEee5viJGb54xsVjzhIQ
 9Ioj7q6oOvsUz+lQlGMtv6ZlzXCVWhaJSBTi/HnQ=
Date: Fri, 4 Mar 2022 19:48:45 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jiri Slaby <jirislaby@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/1] serial: 8520_mtk: Prepare for
 platform_get_irq_optional() changes
Message-ID: <YiJfDRrkzfre/Iqb@kroah.com>
References: <20211217181547.48182-1-andriy.shevchenko@linux.intel.com>
 <YiJWPhWGEGg63zbe@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YiJWPhWGEGg63zbe@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_104856_603723_2004132B 
X-CRM114-Status: GOOD (  17.18  )
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

On Fri, Mar 04, 2022 at 08:11:10PM +0200, Andy Shevchenko wrote:
> On Fri, Dec 17, 2021 at 08:15:47PM +0200, Andy Shevchenko wrote:
> > The platform_get_irq_optional() is going to be changed in a way
> > that the result of it:
> >    = 0 means no IRQ is provided
> >    < 0 means the error which needs to be propagated to the upper layers
> >    > 0 valid vIRQ is allocated
> > 
> > In this case, drop check for 0. Note, the 0 is not valid vIRQ and
> > platform_get_irq_optional() issues a big WARN() in such case,
> > 
> > It's safe to assume that 0 is not valid IRQ in this case since
> > the driver is only instantiated via Device Tree and corresponding
> > OF APIs should never ever return 0 for valid IRQ. Otherwise it is
> > a regression there.
> 
> Can it be applied now?

What changed to make this viable?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
